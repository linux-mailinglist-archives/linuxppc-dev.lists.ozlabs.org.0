Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D07C59DB10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 14:00:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBnqS2H9hz3c6Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 22:00:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W9Wb9wSw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBnpq6TVkz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 22:00:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W9Wb9wSw;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MBnpq50qRz4xv9;
	Tue, 23 Aug 2022 22:00:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1661256003;
	bh=9EZcFRkykvMxyVK2PZ9t/6gKY4EltEsVaseEXoZDneA=;
	h=From:To:Cc:Subject:Date:From;
	b=W9Wb9wSw98peBePC9AYk1UbelttIkgYaaNRZSi864J+yGKdM3NAkZhNz4EdEEgvNT
	 e1bOIUdl84DAMxjkFb5qVodlqrj7IHKZshLsvzd+eKZOr74Yoy5m+g+YhLjWuP6vE+
	 jAMIEuBjkISfUEVYys+c7KL90IMolg3f7tJms4vGwePVL5u5eh39i874drFlrNBJQI
	 qchsQbYYZtLanU8fuc7FeUf6kxJR/SINAhgkAS9FUmUy5ta8B68o1eThrTQqU14hWN
	 or3NeEmx7E2WjN/Nctr2f4i6zgNNedTCuKVyp3MLVjcKAVQjKcYdXjfSt6HnVKxEkj
	 dy0diHencAxEA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] Revert "powerpc: Remove unused FW_FEATURE_NATIVE references"
Date: Tue, 23 Aug 2022 21:59:51 +1000
Message-Id: <20220823115952.1203106-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.1
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
Cc: rmclure@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 79b74a68486765a4fe685ac4069bc71366c538f5.

It broke booting on IBM Cell machines when the kernel is also built with
CONFIG_PPC_PS3=y.

That's because FW_FEATURE_NATIVE_ALWAYS = 0 does have an important
effect, which is to clear the PS3 ALWAYS features from
FW_FEATURE_ALWAYS.

Note that CONFIG_PPC_NATIVE has since been renamed
CONFIG_PPC_HASH_MMU_NATIVE.

Fixes: 79b74a684867 ("powerpc: Remove unused FW_FEATURE_NATIVE references")
Cc: stable@vger.kernel.org # v5.17+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/firmware.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 398e0b5e485f..ed6db13a1d7c 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -83,6 +83,8 @@ enum {
 	FW_FEATURE_POWERNV_ALWAYS = 0,
 	FW_FEATURE_PS3_POSSIBLE = FW_FEATURE_LPAR | FW_FEATURE_PS3_LV1,
 	FW_FEATURE_PS3_ALWAYS = FW_FEATURE_LPAR | FW_FEATURE_PS3_LV1,
+	FW_FEATURE_NATIVE_POSSIBLE = 0,
+	FW_FEATURE_NATIVE_ALWAYS = 0,
 	FW_FEATURE_POSSIBLE =
 #ifdef CONFIG_PPC_PSERIES
 		FW_FEATURE_PSERIES_POSSIBLE |
@@ -92,6 +94,9 @@ enum {
 #endif
 #ifdef CONFIG_PPC_PS3
 		FW_FEATURE_PS3_POSSIBLE |
+#endif
+#ifdef CONFIG_PPC_HASH_MMU_NATIVE
+		FW_FEATURE_NATIVE_ALWAYS |
 #endif
 		0,
 	FW_FEATURE_ALWAYS =
@@ -103,6 +108,9 @@ enum {
 #endif
 #ifdef CONFIG_PPC_PS3
 		FW_FEATURE_PS3_ALWAYS &
+#endif
+#ifdef CONFIG_PPC_HASH_MMU_NATIVE
+		FW_FEATURE_NATIVE_ALWAYS &
 #endif
 		FW_FEATURE_POSSIBLE,
 
-- 
2.37.1

