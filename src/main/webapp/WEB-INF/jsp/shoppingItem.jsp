<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:form action="/ShoppingListAction.do" styleId="shoppinglistForm">
	<html:hidden property="action" value="mod" styleId="pAction"/>
	<html:hidden property="item.id" styleId="pId"/>
	<html:hidden property="item.wineId" styleId="pWineId"/>

	<table class="formtable" width="100%">
		<tr>
			<th colspan="3">
				<bean:message key="wine.lbl.name"/>
				 <logic:notEmpty name="shoppinglistForm" property="item.name">
				 	'<bean:write name="shoppinglistForm" property="item.name" filter="true"/>'
				 </logic:notEmpty>
			</th>
		</tr>
		<tr class="even">
			<td width="120"><bean:message key="wine.lbl.name"/></td>
			<td width="450">
				<logic:notEmpty name="shoppinglistForm" property="item.wineId">
					<bean:write name="shoppinglistForm" property="item.name" filter="true"/>
				</logic:notEmpty>
				<logic:empty name="shoppinglistForm" property="item.wineId">
					<html:text property="item.name" styleId="fname"/>
				</logic:empty>
			</td>
			<td><html:errors property="name"/>&nbsp;</td>
		</tr>
		<tr class="odd">
			<td><bean:message key="wine.lbl.producer"/></td>
			<td>
				<logic:notEmpty name="shoppinglistForm" property="item.wineId">
					<bean:write name="shoppinglistForm" property="item.producer" filter="true"/>
				</logic:notEmpty>
				<logic:empty name="shoppinglistForm" property="item.wineId">
					<html:text property="item.producer" styleId="fproducer"/>
				</logic:empty>
			</td>
			<td><html:errors property="producer"/>&nbsp;</td>
		</tr>
		<tr class="even">
			<td><bean:message key="ce.lbl.year"/></td>
			<td>
				<html:text property="item.year" styleId="fyear"/>
			</td>
			<td><html:errors property="year"/>&nbsp;</td>
		</tr>
		<tr class="odd">
			<td><bean:message key="wine.lbl.bottlesize"/></td>
			<td>
				<logic:notEmpty name="shoppinglistForm" property="item.wineId">
					<bean:write name="shoppinglistForm" property="item.bottleSize" filter="true"/>
				</logic:notEmpty>
				<logic:empty name="shoppinglistForm" property="item.wineId">
					<html:text property="item.bottleSize" styleId="fbottlesize"/>
				</logic:empty>
			</td>
			<td><html:errors property="bottlesize"/>&nbsp;</td>
		</tr>
		<tr class="even">
			<td><bean:message key="ce.lbl.quantity"/></td>
			<td>
				<html:text property="item.quantity" styleId="fquantity"/>
			</td>
			<td><html:errors property="quantity"/>&nbsp;</td>
		</tr>
		<tr class="odd">
			<td><bean:message key="shoppinglist.lbl.store"/></td>
			<td>
				<html:text property="item.store" styleId="fstore"/>
			</td>
			<td><html:errors property="store"/>&nbsp;</td>
		</tr>
		<tr class="footer">
			<td>
				<html:link action="/ShoppingListAction.do">
					<bean:message key="lbl.cancel"/>
				</html:link>
			</td>
			<td align="right">
				<logic:notEqual name="shoppinglistForm" property="item.id" value="0">
					<input type="button" value="<bean:message key="lbl.delete"/>"
					 id="fdelete" onClick="javascript:pfDelete()">
					&nbsp;<html:submit styleId="fSubmit">
						<bean:message key="lbl.modify"/>
					</html:submit>
				</logic:notEqual>
				<logic:equal name="shoppinglistForm" property="item.id" value="0">
					<html:submit styleId="fSubmit">
						<bean:message key="lbl.add"/>
					</html:submit>
				</logic:equal>
			</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</html:form>
