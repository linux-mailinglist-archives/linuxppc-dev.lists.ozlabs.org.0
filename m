Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D716785026
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 07:54:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RrNsDMji;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVwQG2dMVz3c5c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 15:54:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RrNsDMji;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVwPK4MPqz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 15:53:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692770004;
	bh=8prD8TcLDDfBbqbgs4iqz0cBa2ZMyuOWNwa5rWfWIGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RrNsDMjitH3VwQZDkn3ziMakxZVKRR32v77utwp0yFl8QI7CW5Sh0CLPwdVfTO/5L
	 8hTkHRP4Q8UQLNEuYtkVJn1R123uipXH6Y//wH7bF0wVJPH4G9SfB8z+XSOBM41lyx
	 sd8jK5sNDVf1CIuVQghlaXkSL8CPQxqUZlcx2xIAfzySnuNYI47xbcNLxK2Si5wJ7j
	 kjcZiTeLgWXiHVyTc/VMXEJdIRNHuVyDnuGRI+CQVUfQPwl3Ps6IovDFrgkicpr93v
	 MbYhXcSAfhFu1qtmGwTbOWcXj04kyk4QYTKhipx4mcEHQ1XCHFcbr9jFCepC92jWGn
	 KKLplg3w6oE4w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RVwPJ5Yspz4wy4;
	Wed, 23 Aug 2023 15:53:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/4] powerpc/pseries: Move hcall_vphn() prototype into vphn.h
Date: Wed, 23 Aug 2023 15:53:15 +1000
Message-ID: <20230823055317.751786-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823055317.751786-1-mpe@ellerman.id.au>
References: <20230823055317.751786-1-mpe@ellerman.id.au>
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
Cc: ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Consolidate the two prototypes for hcall_vphn() into vphn.h.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/dtl.h    | 1 -
 arch/powerpc/include/asm/lppaca.h | 2 --
 arch/powerpc/include/asm/vphn.h   | 2 ++
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/dtl.h b/arch/powerpc/include/asm/dtl.h
index 4bcb9f9ac764..d6f43d149f8d 100644
--- a/arch/powerpc/include/asm/dtl.h
+++ b/arch/powerpc/include/asm/dtl.h
@@ -39,6 +39,5 @@ extern rwlock_t dtl_access_lock;
 
 extern void register_dtl_buffer(int cpu);
 extern void alloc_dtl_buffers(unsigned long *time_limit);
-extern long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity);
 
 #endif /* _ASM_POWERPC_DTL_H */
diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index 12159e5b6888..27f0421188ec 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -127,8 +127,6 @@ struct slb_shadow {
 	} save_area[SLB_NUM_BOLTED];
 } ____cacheline_aligned;
 
-extern long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity);
-
 #endif /* CONFIG_PPC_BOOK3S */
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_LPPACA_H */
diff --git a/arch/powerpc/include/asm/vphn.h b/arch/powerpc/include/asm/vphn.h
index e0970603fce2..8c2f795eea68 100644
--- a/arch/powerpc/include/asm/vphn.h
+++ b/arch/powerpc/include/asm/vphn.h
@@ -19,4 +19,6 @@
 #define VPHN_FLAG_VCPU	1
 #define VPHN_FLAG_PCPU	2
 
+long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity);
+
 #endif // _ASM_POWERPC_VPHN_H
-- 
2.41.0

