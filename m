Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B2F28DA76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 09:30:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB3wQ5gwHzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 18:30:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BTFivi4U; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB3tq3YCzzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 18:28:49 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id d6so1284872plo.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 00:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QgW2cpLym9Tc4Y7+2M30sSgz7DG9JnxPN18mAIZWfYk=;
 b=BTFivi4UT+XARp+orhp/nMiofOWNmmdN5ZdmUsXRnojjEoRsZ7ge/WdgoObwA2uhtX
 lWSidsjswLHJJyaui/G9WV6p3z/x+0frtLnp+owv7kG22/mhVtBUnG+FBmbvDkhpQ8oZ
 cK9/Abjf1Frx+LX5iU2+oHrsTy4n5Ls9TaMc0nBYFK65rdchz8P/1i5BYliwgXQREvlj
 mFE1PuvlB0Bwq9kNEnLs2PnleWRm8Nuq6NtA2o+zVXiMzEp+wtsaeSLQbtvFKCJp8wDj
 o6q4fyE1lvJlH+rcCVtwHYtDrOniKJ5rwirPDThC7+kShT16tl3ruATQh1KIVtHRy9iC
 LvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QgW2cpLym9Tc4Y7+2M30sSgz7DG9JnxPN18mAIZWfYk=;
 b=sVj/E0FHD0DU8uITHzhJ2hF9BD8mboUJVh//87W51k/ksR/M6OfD2UOt0IyGhvJIxS
 vBX+ENnVkzk31SE1Nl3Dvg7n6EgHv31zfiOiehXbw3dlHX+H7LSbHGf9WhZoSo8bCS4H
 X6smgVFmjFjLIWG7sB+TV+v7KadV7Z+/Uolst2A2yMMDhe4t8XFdCeeWRk79GK5is8+O
 4Z3f5I1PUPK+gdhfJ+N1ExylUvJZLeTksRj4TU78CqTQ22bjkzbEaGt+a0yqf9/NcpkK
 1KT8qB54iU1rHPxEVXtTXTRBF+cKCZzSTF6nkCH+mWWBLw68/G6wY63oMSER5ZPdMZB4
 e6xg==
X-Gm-Message-State: AOAM53155Mw0rijM99mc1jqKVIbX2TpUkhxaQM3fZHb1zIorL17/4Xac
 suvUbkqKXyLElQJmsYNcrHDizxQWZ/f5mw==
X-Google-Smtp-Source: ABdhPJySqUXkPx8kUBajPAjI1AhCIEKSoAhGQBTpRcanyLKWhokFr07RgY+NpeR85/05Z8bYJMY9TQ==
X-Received: by 2002:a17:90a:7c03:: with SMTP id
 v3mr2191402pjf.233.1602660526262; 
 Wed, 14 Oct 2020 00:28:46 -0700 (PDT)
Received: from tee480.ibm.com (180-150-65-4.b49641.syd.nbn.aussiebb.net.
 [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id 198sm2082740pfx.26.2020.10.14.00.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 00:28:45 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 1/2] powerpc/64: Set up a kernel stack for secondaries
 before cpu_restore()
Date: Wed, 14 Oct 2020 18:28:36 +1100
Message-Id: <20201014072837.24539-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: oohall@gmail.com, npiggin@gmail.com, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently in generic_secondary_smp_init(), cur_cpu_spec->cpu_restore()
is called before a stack has been set up in r1. This was previously fine
as the cpu_restore() functions were implemented in assembly and did not
use a stack. However commit 5a61ef74f269 ("powerpc/64s: Support new
device tree binding for discovering CPU features") used
__restore_cpu_cpufeatures() as the cpu_restore() function for a
device-tree features based cputable entry. This is a C function and
hence uses a stack in r1.

generic_secondary_smp_init() is entered on the secondary cpus via the
primary cpu using the OPAL call opal_start_cpu(). In OPAL, each hardware
thread has its own stack. The OPAL call is ran in the primary's hardware
thread. During the call, a job is scheduled on a secondary cpu that will
start executing at the address of generic_secondary_smp_init().  Hence
the value that will be left in r1 when the secondary cpu enters the
kernel is part of that secondary cpu's individual OPAL stack. This means
that __restore_cpu_cpufeatures() will write to that OPAL stack. This is
not horribly bad as each hardware thread has its own stack and the call
that enters the kernel from OPAL never returns, but it is still wrong
and should be corrected.

Create the temp kernel stack before calling cpu_restore().

As noted by mpe, for a kexec boot, the secondary CPUs are released from
the spin loop at address 0x60 by smp_release_cpus() and then jump to
generic_secondary_smp_init(). The call to smp_release_cpus() is in
setup_arch(), and it comes before the call to emergency_stack_init().
emergency_stack_init() allocates an emergency stack in the PACA for each
CPU.  This address in the PACA is what is used to set up the temp kernel
stack in generic_secondary_smp_init(). Move releasing the secondary CPUs
to after the PACAs have been allocated an emergency stack, otherwise the
PACA stack pointer will contain garbage and hence the temp kernel stack
created from it will be broken.

Fixes: 5a61ef74f269 ("powerpc/64s: Support new device tree binding for discovering CPU features")
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: Add more detail to the commit message
v3: Release secondary CPUs after the emergency stack is created
v4: No need to guard smp_release_cpus() with #ifdef CONFIG_SMP
---
 arch/powerpc/kernel/head_64.S      | 8 ++++----
 arch/powerpc/kernel/setup-common.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 0e05a9a47a4b..4b7f4c6c2600 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -420,6 +420,10 @@ generic_secondary_common_init:
 	/* From now on, r24 is expected to be logical cpuid */
 	mr	r24,r5
 
+	/* Create a temp kernel stack for use before relocation is on.	*/
+	ld	r1,PACAEMERGSP(r13)
+	subi	r1,r1,STACK_FRAME_OVERHEAD
+
 	/* See if we need to call a cpu state restore handler */
 	LOAD_REG_ADDR(r23, cur_cpu_spec)
 	ld	r23,0(r23)
@@ -448,10 +452,6 @@ generic_secondary_common_init:
 	sync				/* order paca.run and cur_cpu_spec */
 	isync				/* In case code patching happened */
 
-	/* Create a temp kernel stack for use before relocation is on.	*/
-	ld	r1,PACAEMERGSP(r13)
-	subi	r1,r1,STACK_FRAME_OVERHEAD
-
 	b	__secondary_start
 #endif /* SMP */
 
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 808ec9fab605..da8c71f321ad 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -919,8 +919,6 @@ void __init setup_arch(char **cmdline_p)
 
 	/* On BookE, setup per-core TLB data structures. */
 	setup_tlb_core_data();
-
-	smp_release_cpus();
 #endif
 
 	/* Print various info about the machine that has been gathered so far. */
@@ -944,6 +942,8 @@ void __init setup_arch(char **cmdline_p)
 	exc_lvl_early_init();
 	emergency_stack_init();
 
+	smp_release_cpus();
+
 	initmem_init();
 
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
-- 
2.17.1

