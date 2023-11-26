Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D3D7F920E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Nov 2023 10:59:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SdPMH4VYrz3dHt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Nov 2023 20:59:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=chentao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SdPLl33bdz3bTN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Nov 2023 20:58:54 +1100 (AEDT)
X-UUID: 9d04e3dfa87942f3b7237c2d5be340e6-20231126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:4002c754-90e2-4c50-9524-c6e2f128bfa9,IP:5,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-10
X-CID-INFO: VERSION:1.1.33,REQID:4002c754-90e2-4c50-9524-c6e2f128bfa9,IP:5,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-10
X-CID-META: VersionHash:364b77b,CLOUDID:b6b71373-1bd3-4f48-b671-ada88705968c,B
	ulkID:231126175746U0I3HK8D,BulkQuantity:0,Recheck:0,SF:24|17|19|44|66|38|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_ULN
X-UUID: 9d04e3dfa87942f3b7237c2d5be340e6-20231126
X-User: chentao@kylinos.cn
Received: from vt.. [(116.128.244.169)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1938050803; Sun, 26 Nov 2023 17:57:42 +0800
From: Kunwu Chan <chentao@kylinos.cn>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	robh@kernel.org
Subject: [PATCH] powerpc/powernv: Fix null pointer dereference in opal_powercap_init
Date: Sun, 26 Nov 2023 17:57:39 +0800
Message-Id: <20231126095739.1501990-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>, kunwu.chan@hotmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kasprintf() returns a pointer to dynamically allocated memory
which can be NULL upon failure.

Fixes: b9ef7b4b867f ("powerpc: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 arch/powerpc/platforms/powernv/opal-powercap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal-powercap.c b/arch/powerpc/platforms/powernv/opal-powercap.c
index 7bfe4cbeb35a..ea917266aa17 100644
--- a/arch/powerpc/platforms/powernv/opal-powercap.c
+++ b/arch/powerpc/platforms/powernv/opal-powercap.c
@@ -196,6 +196,12 @@ void __init opal_powercap_init(void)
 
 		j = 0;
 		pcaps[i].pg.name = kasprintf(GFP_KERNEL, "%pOFn", node);
+		if (!pcaps[i].pg.name) {
+			kfree(pcaps[i].pattrs);
+			kfree(pcaps[i].pg.attrs);
+			goto out_pcaps_pattrs;
+		}
+
 		if (has_min) {
 			powercap_add_attr(min, "powercap-min",
 					  &pcaps[i].pattrs[j]);
-- 
2.34.1

