Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC475634CC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 16:03:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZH366TSHz3dwc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 00:02:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Yh/ncU0B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.3; helo=mail-m963.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Yh/ncU0B;
	dkim-atps=neutral
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZH2S1jR5z3c7L
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 00:02:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=STErr
	QG6cRrz1z3quLcxS0dZKK+r4n/hcnfu9MMRTIg=; b=Yh/ncU0Bo7vCgTWOk0mpZ
	ln/5apMyrU1LxiQXdT7p8kmSB/YCYSr7I67IMvLcB6v7Ic9mVW3B47Idder2DwGI
	LlNGaXGB+J/4aI/FcDDpPDLHNyS6XFDaed/vAaaeBtqG2mn7VC/GOq+EeKYv09Br
	iYdI1Krn5N4YCloakCZcgs=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp8 (Coremail) with SMTP id NORpCgD3VZow_r5iIrXsGw--.47428S2;
	Fri, 01 Jul 2022 22:01:21 +0800 (CST)
From: Liang He <windhl@126.com>
To: oss@buserror.net,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc: 85xx: Fix refcount bugs in ge_imp3a_pci_assign_primary()
Date: Fri,  1 Jul 2022 22:01:19 +0800
Message-Id: <20220701140119.245435-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgD3VZow_r5iIrXsGw--.47428S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryDtF43AF45JFyrAr1UKFg_yoWDZwb_A3
	4xZFWDZr4kJr1q9F1q9r4rArWDCrZ3Wr9FgF1Iq3W3u3WYqa4rtrnrJrZ7Aw15urW2yFW3
	AFnFy343CaySkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNYFCUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhExF18RPadbtQAAsD
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

for_each_node_by_type() will automatically increase and decrease
the refcount during the iteration. However, there is a reference
escaped into global 'fsl_pci_primary' and we need to handle it.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/85xx/ge_imp3a.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/ge_imp3a.c b/arch/powerpc/platforms/85xx/ge_imp3a.c
index 8e827376d97b..e3e8f18825a1 100644
--- a/arch/powerpc/platforms/85xx/ge_imp3a.c
+++ b/arch/powerpc/platforms/85xx/ge_imp3a.c
@@ -89,8 +89,10 @@ static void __init ge_imp3a_pci_assign_primary(void)
 		    of_device_is_compatible(np, "fsl,mpc8548-pcie") ||
 		    of_device_is_compatible(np, "fsl,p2020-pcie")) {
 			of_address_to_resource(np, 0, &rsrc);
-			if ((rsrc.start & 0xfffff) == 0x9000)
-				fsl_pci_primary = np;
+			if ((rsrc.start & 0xfffff) == 0x9000) {
+				of_node_put(fsl_pci_primary);
+				fsl_pci_primary = of_node_get(np);
+			}
 		}
 	}
 #endif
-- 
2.25.1

