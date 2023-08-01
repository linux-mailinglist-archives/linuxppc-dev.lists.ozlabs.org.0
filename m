Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE8076B1C3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 12:28:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mmwl+CZQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFWXG04Jyz2yVh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 20:27:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mmwl+CZQ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFWWM2Mc5z2yVL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 20:27:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1690885629;
	bh=EwJfJ91OtKVjRRJMX6b0Lq8tXL5O0xCrhbA2J1c8naQ=;
	h=From:To:Subject:Date:From;
	b=mmwl+CZQip/RyEc7jjBXYx0LrFxAkAVD2e5RQYXKmGfrH3oCda39rz6uhqC3VB6CP
	 pGVy7iH2fFSQUNd57nZhLD47MO+uppQ4DQOxEH/5hOOBjgkm4K5x5rpidRq2mCLyM7
	 ulkLzSpwzRPDtfCl6bZeqVfL6P+rlAWdlwFX+mKTrswaWQlVoIbwdUj88Y66qh8G3d
	 3MvCavLVGrWpMVER4ogdqJnRcuBwl+UFxaaoDAAgwonxxETdp+c55tc7uX5j/GwcyV
	 NZ1pk0RP0jpoCPSoS1MG8C/EaSOScJ2lpr+zwZdnPCQuLqhJHSlw5ZRvLjBxn1y9Rx
	 U8senwZSHpuIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RFWWK6M2vz4wqW;
	Tue,  1 Aug 2023 20:27:09 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64e: Fix secondary thread bringup for ELFv2 kernels
Date: Tue,  1 Aug 2023 20:26:50 +1000
Message-ID: <20230801102650.48705-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When booting on e6500 with an ELF v2 ABI kernel, the secondary threads do
not start correctly:

    [    0.051118] smp: Bringing up secondary CPUs ...
    [    5.072700] Processor 1 is stuck.

This occurs because the startup code is written to use function
descriptors when loading the entry point for the secondary threads. When
building with ELF v2 ABI there are no function descriptors, and the code
loads junk values for the entry point address.

Fix it by using ppc_function_entry() in C, and DOTSYM() in asm, both of
which work correctly for ELF v2 ABI as well as ELF v1 ABI kernels.

Fixes: 8c5fa3b5c4df ("powerpc/64: Make ELFv2 the default for big-endian builds")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/head_64.S     | 3 +--
 arch/powerpc/platforms/85xx/smp.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index f132d8704263..6440b1bb332a 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -375,8 +375,7 @@ _GLOBAL(generic_secondary_smp_init)
 	beq	20f
 
 	/* start the specified thread */
-	LOAD_REG_ADDR(r5, fsl_secondary_thread_init)
-	ld	r4, 0(r5)
+	LOAD_REG_ADDR(r5, DOTSYM(fsl_secondary_thread_init))
 	bl	book3e_start_thread
 
 	/* stop the current thread */
diff --git a/arch/powerpc/platforms/85xx/smp.c b/arch/powerpc/platforms/85xx/smp.c
index 9c43cf32f4c9..40aa58206888 100644
--- a/arch/powerpc/platforms/85xx/smp.c
+++ b/arch/powerpc/platforms/85xx/smp.c
@@ -180,7 +180,7 @@ static void wake_hw_thread(void *info)
 	unsigned long inia;
 	int cpu = *(const int *)info;
 
-	inia = *(unsigned long *)fsl_secondary_thread_init;
+	inia = ppc_function_entry(fsl_secondary_thread_init);
 	book3e_start_thread(cpu_thread_in_core(cpu), inia);
 }
 #endif
-- 
2.41.0

