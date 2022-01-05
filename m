Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E2A48589B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 19:41:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTdcQ6xbDz30Lc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 05:41:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=QvN+J1mZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=QvN+J1mZ; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTdbp5GWCz2yMj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 05:41:09 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 697D7618D1;
 Wed,  5 Jan 2022 18:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F37C36AE0;
 Wed,  5 Jan 2022 18:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641408066;
 bh=i0KRcBQtthz/kEcTgYuuCYQynolYf9Qi/rP3f/111/g=;
 h=From:To:Cc:Subject:Date:From;
 b=QvN+J1mZ5Ca33TbowC/mjDThCj71fiUMbrcGvBO0n9dacBRf4rzbA/BBACCbtcJO+
 Iyn1jbKWI39B4OtCcCsfvFHtypdpuKlqoBFifeDuYy2hYPmsni6MXOeG32+Ey+CVjg
 ls5zuKR4tGWCoXi3AlUtRmUV+cbZYpuW7hcc6CiU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ethernet: ibmveth: use default_groups in kobj_type
Date: Wed,  5 Jan 2022 19:41:01 +0100
Message-Id: <20220105184101.2859410-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636; h=from:subject;
 bh=i0KRcBQtthz/kEcTgYuuCYQynolYf9Qi/rP3f/111/g=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDIlXn9nenXbIUcI1aH7F5NsT562zlVtpqNBq+sD7lnFc1qGH
 Mzcc74hlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJHH/BME9bOu3LvGMJd5ev+vHg8a
 Tf4SE8TR8Z5rtu8VTkf3504yfFUwW55k/zV810mgIA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Cristobal Forno <cforno12@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Jakub Kicinski <kuba@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are currently 2 ways to create a set of sysfs files for a
kobj_type, through the default_attrs field, and the default_groups
field.  Move the ibmveth sysfs code to use default_groups
field which has been the preferred way since aa30f47cf666 ("kobject: Add
support for default attribute groups to kobj_type") so that we can soon
get rid of the obsolete default_attrs field.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Cristobal Forno <cforno12@linux.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: netdev@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/net/ethernet/ibm/ibmveth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 45ba40cf4d07..22fb0d109a68 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -1890,6 +1890,7 @@ static struct attribute *veth_pool_attrs[] = {
 	&veth_size_attr,
 	NULL,
 };
+ATTRIBUTE_GROUPS(veth_pool);
 
 static const struct sysfs_ops veth_pool_ops = {
 	.show   = veth_pool_show,
@@ -1899,7 +1900,7 @@ static const struct sysfs_ops veth_pool_ops = {
 static struct kobj_type ktype_veth_pool = {
 	.release        = NULL,
 	.sysfs_ops      = &veth_pool_ops,
-	.default_attrs  = veth_pool_attrs,
+	.default_groups = veth_pool_groups,
 };
 
 static int ibmveth_resume(struct device *dev)
-- 
2.34.1

