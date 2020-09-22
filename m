Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C96273A6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 07:54:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwVrW6CjVzDqxM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 15:54:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iEx5K3K7; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwVpm0Mv7zDqvN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 15:53:18 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id k133so6285192pgc.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 22:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5sDc2TM4uAy9n6lCGjDLXI0d7yHXv0thtddl9crrwqc=;
 b=iEx5K3K7bjNO5VkTTg5UocRiY2DW2UwpK6oDd1mJDzVekPAxzvxZ5yJ165SHlgnJxI
 KPu3HQGQD6geaIUFJFEoCW7c22BivEYIT3nif0JF+YqfagghO66OLtuP7bCKutQaAcnu
 LiZRtZUECzjtnWihBDmo+0zREZaxPc75cNsFW4SPUeWj4R2d7jiyx/l9HAWihe/pEwuj
 nP7wpYSdZGy4wXMUMLnS+BO1SnV7Ob8OVVTiKa0RJn7hRMVOtHKvkgU4zgjHph4M2/Hm
 WYgiW5fxJwq+iNKL7aCJ3LsqdysLdDA7hQCclBVP+ZJq7VivHaeATlwdt5e+itinqJGD
 eA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5sDc2TM4uAy9n6lCGjDLXI0d7yHXv0thtddl9crrwqc=;
 b=D7MZJbZUx8/zaYhT19XtwdZN0nTM7ys6QE8Kx9spPTo1XenefhqfEo3VZXnkMxzbOT
 1zNCpDJFkmwy/VIjvencjaAo/wLcIzGpkEmEh9sTkJJLhSQKQ9kRK01AJBgsUxRnAb6h
 o7DERFEOMRmyOODzK49DN1xEiRbkVRfnpPNN5TJFW17yF9VW6+kbe4pZKz+y/Vvp5eYl
 Lvz7t099E0L30/CHWtDKxeeZlajKpnntrylIP59q6rn7Trqw/ofBJ4untcMZ2dIvzSl9
 hmEXTDwOB9ZWMJy9oh+tqk8pUOa11TnjmGNXkReH/W4Jbhc9f2/u++5/SY3fonm/oc1/
 DFsw==
X-Gm-Message-State: AOAM530U1v9IYpTftJIytpFLJbuLx2UMPu6xGlNYldHQgNjPu0GPTijp
 TSVPKr8sE4W0XD8ZuQmnYl5Qpw4IBFE=
X-Google-Smtp-Source: ABdhPJwn7UtlBtfrDSPpTjioydu0V7mY6xf/BOxohSnOtE9ifwYcef60Id5u7p//mOeiOBm/npdEZw==
X-Received: by 2002:a17:902:6bc8:b029:d1:f2ab:cf6a with SMTP id
 m8-20020a1709026bc8b02900d1f2abcf6amr3099190plt.14.1600753995927; 
 Mon, 21 Sep 2020 22:53:15 -0700 (PDT)
Received: from tee480.ibm.com (180-150-65-4.b49641.syd.nbn.aussiebb.net.
 [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id q15sm1092088pje.29.2020.09.21.22.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 22:53:15 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/2] powerpc/64: Set up a kernel stack for secondaries
 before cpu_restore()
Date: Tue, 22 Sep 2020 15:53:06 +1000
Message-Id: <20200922055307.10647-1-jniethe5@gmail.com>
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
---
 arch/powerpc/kernel/head_64.S      | 8 ++++----
 arch/powerpc/kernel/setup-common.c | 6 ++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

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
index 808ec9fab605..fff714e36b37 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -919,8 +919,6 @@ void __init setup_arch(char **cmdline_p)
 
 	/* On BookE, setup per-core TLB data structures. */
 	setup_tlb_core_data();
-
-	smp_release_cpus();
 #endif
 
 	/* Print various info about the machine that has been gathered so far. */
@@ -944,6 +942,10 @@ void __init setup_arch(char **cmdline_p)
 	exc_lvl_early_init();
 	emergency_stack_init();
 
+#ifdef CONFIG_SMP
+	smp_release_cpus();
+#endif
+
 	initmem_init();
 
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
-- 
2.17.1

