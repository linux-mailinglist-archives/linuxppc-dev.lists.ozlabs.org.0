Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E232583B758
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 03:48:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TL4yK69cBz3cTx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 13:48:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TL4xt5FkVz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 13:48:01 +1100 (AEDT)
X-UUID: c31b89054ac446e6a4faaaad45d5f508-20240125
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:bcf62a7f-5493-478e-8b8d-d889bd02edec,IP:20,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-INFO: VERSION:1.1.35,REQID:bcf62a7f-5493-478e-8b8d-d889bd02edec,IP:20,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:c4b81ffe-c16b-4159-a099-3b9d0558e447,B
	ulkID:240125104648BVAXVXDF,BulkQuantity:0,Recheck:0,SF:44|66|38|24|17|19|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: c31b89054ac446e6a4faaaad45d5f508-20240125
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 178462094; Thu, 25 Jan 2024 10:46:45 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 76001E000EB9;
	Thu, 25 Jan 2024 10:46:45 +0800 (CST)
X-ns-mid: postfix-65B1CB95-282686354
Received: from kernel.. (unknown [172.20.15.234])
	by mail.kylinos.cn (NSMail) with ESMTPA id 15CA8E000EB9;
	Thu, 25 Jan 2024 10:46:35 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: arnd@arndb.de,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH] powerpc/iommu: Code cleanup for cell/iommu.c
Date: Thu, 25 Jan 2024 10:46:33 +0800
Message-Id: <20240125024633.512513-1-chentao@kylinos.cn>
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

This part was commented from commit 165785e5c0be ("[POWERPC] Cell
iommu support") in about 17 years before.

If there are no plans to enable this part code in the future,
we can remove this dead code.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 arch/powerpc/platforms/cell/iommu.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms=
/cell/iommu.c
index 1202a69b0a20..afce9e64a443 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -424,22 +424,6 @@ static void __init cell_iommu_setup_hardware(struct =
cbe_iommu *iommu,
 	cell_iommu_enable_hardware(iommu);
 }
=20
-#if 0/* Unused for now */
-static struct iommu_window *find_window(struct cbe_iommu *iommu,
-		unsigned long offset, unsigned long size)
-{
-	struct iommu_window *window;
-
-	/* todo: check for overlapping (but not equal) windows) */
-
-	list_for_each_entry(window, &(iommu->windows), list) {
-		if (window->offset =3D=3D offset && window->size =3D=3D size)
-			return window;
-	}
-
-	return NULL;
-}
-#endif
=20
 static inline u32 cell_iommu_get_ioid(struct device_node *np)
 {
--=20
2.39.2

