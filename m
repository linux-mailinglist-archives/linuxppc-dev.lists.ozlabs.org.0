Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 070EE2492AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:02:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWWJ75jyLzDqvr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 12:02:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWW9L55vjzDqnG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 11:56:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=cTSWORja; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BWW9L1nHdz9sPC; Wed, 19 Aug 2020 11:56:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BWW9L0tXlz9sPf; Wed, 19 Aug 2020 11:56:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597802198;
 bh=Prz0kVKTTItN/Fnihy2LtXTxdem/kzeiAb6o80fgg3Q=;
 h=From:To:Subject:Date:From;
 b=cTSWORjaYEOf+uFRb2TqCzpK2JyCXW70jSOTuhv6b8Hpj2Fpnz0egIJzMivg+YyLr
 YO3Tyq+FvGyJqkKxKotb3l6RsEDKLc9RhMA7P2dwBH9o+W7Oev5dWhGoBT9Q2FInjJ
 phQrrYklUJeEErzG4h0mttcyqifYq4Vtgc+Ujz+AbA2u2BGAxJPwp7acIqo+QM6TIU
 LIUGWJGlBpc9kqyhECePCioSFDJh9rZ4hCMEMhaz4C0RjBP9Vo14a8mH2Z4NfeTUZI
 tK+FZYbZ8fOuoi8tlKlVOz6oUI2cyXaH/KkOAqlb0AKVSakb3iERyXIblBnivyExXD
 d2mE1razlg7Yw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/3] powerpc: Move arch_cpu_idle_dead() into smp.c
Date: Wed, 19 Aug 2020 11:56:32 +1000
Message-Id: <20200819015634.1974478-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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

arch_cpu_idle_dead() is in idle.c, which makes sense, but it's inside
a CONFIG_HOTPLUG_CPU block.

It would be more at home in smp.c, inside the existing
CONFIG_HOTPLUG_CPU block. Note that CONFIG_HOTPLUG_CPU depends on
CONFIG_SMP so even though smp.c is not built for SMP=n builds, that's
fine.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/idle.c | 8 --------
 arch/powerpc/kernel/smp.c  | 6 ++++++
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
index 422e31d2f5a2..ae0e2632393d 100644
--- a/arch/powerpc/kernel/idle.c
+++ b/arch/powerpc/kernel/idle.c
@@ -41,14 +41,6 @@ static int __init powersave_off(char *arg)
 }
 __setup("powersave=off", powersave_off);
 
-#ifdef CONFIG_HOTPLUG_CPU
-void arch_cpu_idle_dead(void)
-{
-	sched_preempt_enable_no_resched();
-	cpu_die();
-}
-#endif
-
 void arch_cpu_idle(void)
 {
 	ppc64_runlatch_off();
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 8261999c7d52..b05d2db13d08 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1429,6 +1429,12 @@ void __cpu_die(unsigned int cpu)
 		smp_ops->cpu_die(cpu);
 }
 
+void arch_cpu_idle_dead(void)
+{
+	sched_preempt_enable_no_resched();
+	cpu_die();
+}
+
 void cpu_die(void)
 {
 	/*
-- 
2.25.1

