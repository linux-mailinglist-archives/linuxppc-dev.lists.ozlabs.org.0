Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1DD83D2BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 03:52:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLj0S57L8z3cZd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 13:52:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLj022802z30MD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 13:52:01 +1100 (AEDT)
X-UUID: ee05abc1be3c471f93bd095ad4e0dd41-20240126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:cb6c19f0-5fdb-4c53-8deb-7b37278edca6,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.35,REQID:cb6c19f0-5fdb-4c53-8deb-7b37278edca6,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:21564583-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:240126105054IZJ80SSG,BulkQuantity:0,Recheck:0,SF:66|38|24|17|19|44|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_ULN,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: ee05abc1be3c471f93bd095ad4e0dd41-20240126
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 466960604; Fri, 26 Jan 2024 10:50:53 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 92B07E000EB9;
	Fri, 26 Jan 2024 10:50:53 +0800 (CST)
X-ns-mid: postfix-65B31E0D-372088737
Received: from kernel.. (unknown [172.20.15.234])
	by mail.kylinos.cn (NSMail) with ESMTPA id DF9CBE000EB9;
	Fri, 26 Jan 2024 10:50:52 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH] powerpc/pseries/pci: Code cleanup
Date: Fri, 26 Jan 2024 10:50:30 +0800
Message-Id: <20240126025030.577795-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This part was commented in about 19 years before.
If there are no plans to enable this part code in the future,
we can remove this dead code.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 arch/powerpc/platforms/pseries/pci.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platform=
s/pseries/pci.c
index 1772ae3d193d..6dbc73eb2ca2 100644
--- a/arch/powerpc/platforms/pseries/pci.c
+++ b/arch/powerpc/platforms/pseries/pci.c
@@ -18,33 +18,6 @@
 #include <asm/pci.h>
 #include "pseries.h"
=20
-#if 0
-void pcibios_name_device(struct pci_dev *dev)
-{
-	struct device_node *dn;
-
-	/*
-	 * Add IBM loc code (slot) as a prefix to the device names for service
-	 */
-	dn =3D pci_device_to_OF_node(dev);
-	if (dn) {
-		const char *loc_code =3D of_get_property(dn, "ibm,loc-code",
-				NULL);
-		if (loc_code) {
-			int loc_len =3D strlen(loc_code);
-			if (loc_len < sizeof(dev->dev.name)) {
-				memmove(dev->dev.name+loc_len+1, dev->dev.name,
-					sizeof(dev->dev.name)-loc_len-1);
-				memcpy(dev->dev.name, loc_code, loc_len);
-				dev->dev.name[loc_len] =3D ' ';
-				dev->dev.name[sizeof(dev->dev.name)-1] =3D '\0';
-			}
-		}
-	}
-}
-DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pcibios_name_device);
-#endif
-
 #ifdef CONFIG_PCI_IOV
 #define MAX_VFS_FOR_MAP_PE 256
 struct pe_map_bar_entry {
--=20
2.39.2

