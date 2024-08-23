Return-Path: <linuxppc-dev+bounces-410-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5973395C632
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 09:08:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqrl60PCZz2yk6;
	Fri, 23 Aug 2024 17:08:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724396914;
	cv=none; b=WWTTPkUtla1cyCwidgYxylpEEAf10wHnoOhWR5WpQKH0XjSKf0gIu+quyTzryHWxTn0e0O2I5C5HxDZ9gc0b2edWRn3lpvll5SPKLHbnQSgjf2h+4BXf0NJ2GvLvXV8ggb7D3t4GMNxRihnB4K3x6YaOHnTAfWEhJgWsPRAzV1RemB4xwDiOv/YWJRWYFfA+vCK+9rWbjAnvW5uS7ZKYfWQ96nz13m3MBluCJ3rEcoQ009eKH1AD285uNATpji48/Eo93sCu2s+soh6c2Hy1pxv4zthD3P9i9HpysgGQjaRRTBaDM4OG0fK90dK8MrKYNzIPJTz/UTA6Iwwqi+nA5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724396914; c=relaxed/relaxed;
	bh=Mdz1wNBVMMvw/wPWii+B8wqVBmKGqeN8oZTSUvyoBm8=;
	h=DKIM-Signature:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding; b=os6aoJEJ0lhd2PTxMFJPRNKAKnST6Zm3QUZgQOxeCxNkAI6rhqirk0QZrTh7agTul2sTuareGPzlhk16JcwoaHnl9etFVBbAVJ4ikjs6CUfAPi5eaJb9L/+1E2vfqEVByuNjArjAKA8qayXY/wmj+Gi5S5bO3jbfJv+aSXUW35xm0JQRlIFcTygxilWFS6P8XbKZxRZcqO7qHNggjGgqQUVoeBpEf22bozcGYTJWwf6N0/4y8FIBM8cmmpTrG+O9APxXiiYXu+WvI+jtxCXh/I3V2kqVBI32wuIJtEDEF7JO7a2I/nZ87uMqkmyQF4SnTXkkMKy3VIqkLT0n7pzW8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q4JBoqTb; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q4JBoqTb;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqrl41s1Rz2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 17:08:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724396911;
	bh=Mdz1wNBVMMvw/wPWii+B8wqVBmKGqeN8oZTSUvyoBm8=;
	h=From:To:Subject:Date:From;
	b=q4JBoqTbCSLw/UgpbIIkzy7882UZVjemdB9oeDCDWaIKtUsHuULh6PF7MC+N+7M04
	 zWOfyExPiRJXmTR4HQJ58KqKFWUnQBLAJbR56Rc1AjrwkIcUUyF1jUK0skw8WVLrxE
	 o1NEqTjY5zggHaNXfvWCwFK+CMP6bqlpzIIpX/MW5UoDDz/fssP2W+GJcCD27+X7uI
	 DUmUwgebusQxSWjUuvOsQ9jBiUlfIgHov1+wMxvv4pem6o3C0wcX3n0xAFSQJZL9VI
	 EEHDaIU+dGUW9EcbUWC6IBMn1mg/+8YjcPHDmKMFL+UN2snTPI57b69U6UJ/3iD/YV
	 hYFJmI4HjMxXA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wqrl369WRz4x8R;
	Fri, 23 Aug 2024 17:08:31 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64s: Remove the "fast endian switch" syscall
Date: Fri, 23 Aug 2024 17:08:30 +1000
Message-ID: <20240823070830.1269033-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The non-standard "fast endian switch" syscall was added in 2008[1],
but was never widely used. It was disabled by default in 2017[2], and
there's no evidence it's ever been used since.

Remove it entirely.

A normal endian switch syscall was added in 2015[3].

[1]: 745a14cc264b ("[POWERPC] Add fast little-endian switch system call")
[2]: 529d235a0e19 ("powerpc: Add a proper syscall for switching endianness")
[3]: 727f13616c45 ("powerpc: Disable the fast-endian switch syscall by default")

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig.debug           |  6 ------
 arch/powerpc/kernel/exceptions-64s.S | 17 -----------------
 2 files changed, 23 deletions(-)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 3799ceceb04a..0bbec4afc0d5 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -379,12 +379,6 @@ config FAIL_IOMMU
 
 	  If you are unsure, say N.
 
-config PPC_FAST_ENDIAN_SWITCH
-	bool "Deprecated fast endian-switch syscall"
-	depends on DEBUG_KERNEL && PPC_BOOK3S_64
-	help
-	  If you're unsure what this is, say N.
-
 config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index eaf2f167c342..195b075d116c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1989,13 +1989,6 @@ INT_DEFINE_END(system_call)
 	INTERRUPT_TO_KERNEL
 #endif
 
-#ifdef CONFIG_PPC_FAST_ENDIAN_SWITCH
-BEGIN_FTR_SECTION
-	cmpdi	r0,0x1ebe
-	beq-	1f
-END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
-#endif
-
 	/* We reach here with PACA in r13, r13 in r9. */
 	mfspr	r11,SPRN_SRR0
 	mfspr	r12,SPRN_SRR1
@@ -2015,16 +2008,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
 	b	system_call_common
 #endif
 	.endif
-
-#ifdef CONFIG_PPC_FAST_ENDIAN_SWITCH
-	/* Fast LE/BE switch system call */
-1:	mfspr	r12,SPRN_SRR1
-	xori	r12,r12,MSR_LE
-	mtspr	SPRN_SRR1,r12
-	mr	r13,r9
-	RFI_TO_USER	/* return to userspace */
-	b	.	/* prevent speculative execution */
-#endif
 .endm
 
 EXC_REAL_BEGIN(system_call, 0xc00, 0x100)
-- 
2.46.0


