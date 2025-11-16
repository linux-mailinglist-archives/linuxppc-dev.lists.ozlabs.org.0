Return-Path: <linuxppc-dev+bounces-14198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0F7C60F48
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Nov 2025 03:52:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d8FmD5PZrz2yvN;
	Sun, 16 Nov 2025 13:52:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763261564;
	cv=none; b=nsP3R/YdfKC+tfDeqaHqRicyZ8+63htskNKlvueoXlQEE8DLsItgnumA81Vj3Ssmux0OdIotjX5MyMry5a9ZYp0PkHkC7c17bsIvSYZxI6rE4ByR5Wua3YHgQVgGHhVuixGatMvfsKPcNvHpbYEbhztdXpr5NLUamYdJviFPxd2dz/mO7pc7Hs3WUuilMX5cthTVVghEKIy0h7EnpmXiB7S3f8WWgeKmkT5INyk4IhsFQhlT1U2Z9FWDetbvqQiqLjDVc6HWCih6puWhUGIqpaRgBwUoDoYQ3asWiTyVMIdvmF/HEU89MVgLrsEfXIsNAuekG9E7+hf0rqX/p9OPOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763261564; c=relaxed/relaxed;
	bh=yGDEHh5NtNCjAMZMrYp2fiuiXGVY0OeXsIHtFaxaiGE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=GplVMRz2gwqTSdDFrujmbiEzCeBSdebohuSXRdHLKsll1pJDf9Nl+bPrucwAmrb6WjzKNg6Sv4FrKbVf95/O5Xii9tSj5/PPjpqI+gJ4pWEat4MNOxD8zDWpGUusCLfahug9QJj7oKLmYdyXZJWnnopHjrynG2DczZehPtpWEy6KlIAC+eSqlIwr490FCNFdpXb532rvIjJdeSicrH2pKG0EuuLARVdlkWzC+3YTYdUYXuzX49gEPJzL/X1sZfsihtSUcw+XmayrF5X314unAHpo4FdKt3N5A6G4bsNC9kGt6J2jCAX6jrDuYDXlAjm2gNvPk6DpWMudC526EGWg8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=make24@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=make24@iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 479 seconds by postgrey-1.37 at boromir; Sun, 16 Nov 2025 13:52:43 AEDT
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d8FmC2x5Kz2xqM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Nov 2025 13:52:42 +1100 (AEDT)
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-03 (Coremail) with SMTP id rQCowACnONt9OhlphMrrAA--.5337S2;
	Sun, 16 Nov 2025 10:44:20 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	make24@iscas.ac.cn,
	benh@kernel.crashing.org,
	smaclennan@pikatech.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	stable@vger.kernel.org
Subject: [PATCH] powerpc/warp: Fix error handling in pika_dtm_thread
Date: Sun, 16 Nov 2025 10:44:11 +0800
Message-Id: <20251116024411.21968-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:rQCowACnONt9OhlphMrrAA--.5337S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtrW7tryDtFy8Xr17Cw17KFg_yoWftwb_Ka
	109a97urW8Wr4qk3Wqyr1fGrZxJ39rJ34UKw1qg3W2ya45Xa95Xw4FyrZ5uw17ursFkr43
	Jan5WrsrC3WS9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbDAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwV
	AFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmLvtU
	UUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

pika_dtm_thread() acquires client through of_find_i2c_device_by_node()
but fails to release it in error handling path. This could result in a
reference count leak, preventing proper cleanup and potentially
leading to resource exhaustion. Add put_device() to release the
reference in the error handling path.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 3984114f0562 ("powerpc/warp: Platform fix for i2c change")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 arch/powerpc/platforms/44x/warp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/44x/warp.c b/arch/powerpc/platforms/44x/warp.c
index a5001d32f978..6f674f86dc85 100644
--- a/arch/powerpc/platforms/44x/warp.c
+++ b/arch/powerpc/platforms/44x/warp.c
@@ -293,6 +293,8 @@ static int pika_dtm_thread(void __iomem *fpga)
 		schedule_timeout(HZ);
 	}
 
+	put_device(&client->dev);
+
 	return 0;
 }
 
-- 
2.17.1


