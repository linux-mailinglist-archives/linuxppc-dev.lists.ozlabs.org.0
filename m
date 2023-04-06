Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9019C6D9B31
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 16:52:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pskwx2j6Dz3g8s
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 00:52:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PomG6mQ/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Psknt4VLNz3gG4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 00:45:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=PomG6mQ/;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pskns5wjWz4xFg;
	Fri,  7 Apr 2023 00:45:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680792353;
	bh=PhB58uze5HlGPHSG/12cRhkZxsbgZpkZh1JDz6mWDqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PomG6mQ/2mwsj91pMOfaq7VGozCNnqo7xGd3TcNgdJaArP1yzdIS0/Bpt6jpF7Phy
	 52r4c0TlQIOisgmJjwevDhaUAhTS3uKcyviEoPj1EIX3qABFLwThWqVf/bBLw5BY0a
	 WXXwhxJ5widHbtL8W9pfZBjN5Iuu3Wm7HlIxQJo90wa2gfqmSkcv8IaJBMrVgnxeju
	 Ihor3ePVjXDjYZPyZLoHivHAaWLcuLlerVqilNBwEtvTal+xNU0xUjKfx9zCUB4xuP
	 vIr/RAxYstKjPG3hw5x59OwxvjdZgVXoD76NsCjJY9EKbdA9QqudBXv9U+0LIEKm8c
	 mK5Hk2K8Sm6uQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 4/4] powerpc/pseries: Always inline functions called from cpuidle
Date: Fri,  7 Apr 2023 00:45:35 +1000
Message-Id: <20230406144535.3786008-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406144535.3786008-1-mpe@ellerman.id.au>
References: <20230406144535.3786008-1-mpe@ellerman.id.au>
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Code in the idle path is not allowed to be instrumented because RCU is
disabled, see commit 0e985e9d2286 ("cpuidle: Add comments about
noinstr/__cpuidle usage").

Force inlining of the inline functions called from cpuidle, to ensure
they are not emitted out-of-line and then available for tracing.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/idle.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/idle.h b/arch/powerpc/include/asm/idle.h
index accd1f50085a..00f360667391 100644
--- a/arch/powerpc/include/asm/idle.h
+++ b/arch/powerpc/include/asm/idle.h
@@ -9,17 +9,17 @@ DECLARE_PER_CPU(u64, idle_spurr_cycles);
 DECLARE_PER_CPU(u64, idle_entry_purr_snap);
 DECLARE_PER_CPU(u64, idle_entry_spurr_snap);
 
-static inline void snapshot_purr_idle_entry(void)
+static __always_inline void snapshot_purr_idle_entry(void)
 {
 	*this_cpu_ptr(&idle_entry_purr_snap) = mfspr(SPRN_PURR);
 }
 
-static inline void snapshot_spurr_idle_entry(void)
+static __always_inline void snapshot_spurr_idle_entry(void)
 {
 	*this_cpu_ptr(&idle_entry_spurr_snap) = mfspr(SPRN_SPURR);
 }
 
-static inline void update_idle_purr_accounting(void)
+static __always_inline void update_idle_purr_accounting(void)
 {
 	u64 wait_cycles;
 	u64 in_purr = *this_cpu_ptr(&idle_entry_purr_snap);
@@ -29,7 +29,7 @@ static inline void update_idle_purr_accounting(void)
 	get_lppaca()->wait_state_cycles = cpu_to_be64(wait_cycles);
 }
 
-static inline void update_idle_spurr_accounting(void)
+static __always_inline void update_idle_spurr_accounting(void)
 {
 	u64 *idle_spurr_cycles_ptr = this_cpu_ptr(&idle_spurr_cycles);
 	u64 in_spurr = *this_cpu_ptr(&idle_entry_spurr_snap);
@@ -37,7 +37,7 @@ static inline void update_idle_spurr_accounting(void)
 	*idle_spurr_cycles_ptr += mfspr(SPRN_SPURR) - in_spurr;
 }
 
-static inline void pseries_idle_prolog(void)
+static __always_inline void pseries_idle_prolog(void)
 {
 	ppc64_runlatch_off();
 	snapshot_purr_idle_entry();
@@ -49,7 +49,7 @@ static inline void pseries_idle_prolog(void)
 	get_lppaca()->idle = 1;
 }
 
-static inline void pseries_idle_epilog(void)
+static __always_inline void pseries_idle_epilog(void)
 {
 	update_idle_purr_accounting();
 	update_idle_spurr_accounting();
-- 
2.39.2

