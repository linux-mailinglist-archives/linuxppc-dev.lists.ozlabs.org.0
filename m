Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEE3830213
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jan 2024 10:18:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TFL0Z1w9sz3cSL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jan 2024 20:18:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFL033Nz8z300v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jan 2024 20:18:26 +1100 (AEDT)
X-UUID: 092a25c25f774595a76680933ec4c3ab-20240117
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:e62c8672-fef4-4b33-9946-b3a1b05d1d21,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:20
X-CID-INFO: VERSION:1.1.35,REQID:e62c8672-fef4-4b33-9946-b3a1b05d1d21,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:5d391d7,CLOUDID:035e432f-1ab8-4133-9780-81938111c800,B
	ulkID:24011717171241K6UZ5Z,BulkQuantity:0,Recheck:0,SF:66|38|24|17|19|44|1
	02,TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 092a25c25f774595a76680933ec4c3ab-20240117
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 55816797; Wed, 17 Jan 2024 17:17:10 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id AF339E000EB9;
	Wed, 17 Jan 2024 17:17:10 +0800 (CST)
X-ns-mid: postfix-65A79B16-504608615
Received: from kernel.. (unknown [172.20.15.234])
	by mail.kylinos.cn (NSMail) with ESMTPA id DF716E000EB9;
	Wed, 17 Jan 2024 17:17:07 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH] powerpc/pasemi: Add a null pointer check to the pas_setup_mce_regs
Date: Wed, 17 Jan 2024 17:17:06 +0800
Message-Id: <20240117091706.153431-1-chentao@kylinos.cn>
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

kasprintf() returns a pointer to dynamically allocated memory
which can be NULL upon failure. Ensure the allocation was successful
by checking the pointer validity.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 arch/powerpc/platforms/pasemi/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platfor=
ms/pasemi/setup.c
index 0761d98e5be3..8f98f3b58888 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -165,6 +165,8 @@ static int __init pas_setup_mce_regs(void)
 	while (dev && reg < MAX_MCE_REGS) {
 		mce_regs[reg].name =3D kasprintf(GFP_KERNEL,
 						"mc%d_mcdebug_errsta", reg);
+		if (!mce_regs[reg].name)
+			return -ENOMEM;
 		mce_regs[reg].addr =3D pasemi_pci_getcfgaddr(dev, 0x730);
 		dev =3D pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa00a, dev);
 		reg++;
--=20
2.39.2

