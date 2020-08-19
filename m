Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED5624929B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:00:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWWFT56wgzDqrs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 12:00:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWW9L6pWqzDqnK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 11:56:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ge3eqSkk; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BWW9L6B8Sz9sTY; Wed, 19 Aug 2020 11:56:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BWW9L5CqSz9sTb; Wed, 19 Aug 2020 11:56:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597802198;
 bh=l6AFhSuZ28HjKGhc4vYbzbK6GGmi/2uRw/gPbOMqX4s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ge3eqSkkLTpyM4gm91A1RDKKwamIpJTWcxA1pRjv/y68E01kwUT7PzOfMHFuSy7IX
 NEYgGUMD3EcIWwm4Q8HkvfduI0ms4TxPkDzGfFmBT2A2r3zxH8yEH1f0rS6pX5Vd/t
 QTw4L616VtmYc9cdbK9WB3Ovh8t/sugmKSUofb5JpRHPjxME1mkXDiSiMaHWouvV6Z
 TUGrdNAGiswR0YVF7AAQ74QWRL0B5W3ozuSIZscuwz40zsL0EXTCF1+e/MiLldy27q
 QAR4p8bIQHthm4ihQsHa5rOPUmSiz5I7MIeVgRUiO31o9P66LLgzidUqavH9wpQ0ir
 chGexVmMhmEGg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/3] powerpc/smp: Fold cpu_die() into its only caller
Date: Wed, 19 Aug 2020 11:56:33 +1000
Message-Id: <20200819015634.1974478-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200819015634.1974478-1-mpe@ellerman.id.au>
References: <20200819015634.1974478-1-mpe@ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Avoid the eternal confusion between cpu_die() and __cpu_die() by
removing the former, folding it into its only caller.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/smp.h | 1 -
 arch/powerpc/kernel/smp.c      | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index 49a25e2400f2..a314d2d2d2be 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -29,7 +29,6 @@ extern int boot_cpuid;
 extern int spinning_secondaries;
 extern u32 *cpu_to_phys_id;
 
-extern void cpu_die(void);
 extern int cpu_to_chip_id(int cpu);
 
 #ifdef CONFIG_SMP
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index b05d2db13d08..c616d975bf95 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1432,11 +1432,7 @@ void __cpu_die(unsigned int cpu)
 void arch_cpu_idle_dead(void)
 {
 	sched_preempt_enable_no_resched();
-	cpu_die();
-}
 
-void cpu_die(void)
-{
 	/*
 	 * Disable on the down path. This will be re-enabled by
 	 * start_secondary() via start_secondary_resume() below
-- 
2.25.1

