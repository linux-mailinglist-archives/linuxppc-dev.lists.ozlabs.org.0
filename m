Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F2E19C033
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 13:31:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tLVn2Zq7zDqLR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 22:31:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tLQn3xw9zDqCD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 22:28:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZpA3sU1K; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48tLQm15kFz9sQt;
 Thu,  2 Apr 2020 22:28:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585826880;
 bh=2maxqirMAdfGWnzmoaa6OOtiptHYwQlsC8pMIxyqg2Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZpA3sU1KMKWa93mUZns4lsgqvOgN9l/hyNwKu+DqRaotT5XPACFP0KYbfalrdMbUo
 nhqzWA4CNLLrkoc7ARYaFjZXMshRW1JT3iqhZN/xA366OgtBg3/fReEaqUqUxuTxaF
 GUiZP2KXkbElZXBiNMLQkGio1Xl7J9BxMpex7tqrixKV1ZI1iETVFxz65i/1Xzd04g
 AY3XFMeWV8Vp2yrdY/xsXnLfs5NoCnPy556kH5ib2gXw9JjBYnpYeUbLCewB/x1qQ1
 svN6Qg43JA+fvdM1WOoCXUgSuf+fFPSRmFCj9ipjR9YwsgmN0FmdxctgAhbPuNbED1
 AIK33NIOHRMcQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Leonardo Bras <leonardo@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Enrico Weigelt <info@metux.net>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, peterz@infradead.org
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
In-Reply-To: <20200401000020.590447-1-leonardo@linux.ibm.com>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
Date: Thu, 02 Apr 2020 22:28:09 +1100
Message-ID: <871rp6t9di.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Leonardo Bras <leonardo@linux.ibm.com> writes:
> During a crash, there is chance that the cpus that handle the NMI IPI
> are holding a spin_lock. If this spin_lock is needed by crashing_cpu it
> will cause a deadlock. (rtas.lock and printk logbuf_lock as of today)
>
> This is a problem if the system has kdump set up, given if it crashes
> for any reason kdump may not be saved for crash analysis.
>
> After NMI IPI is sent to all other cpus, force unlock all spinlocks
> needed for finishing crash routine.

I'm not convinced this is the right approach.

Busting locks is risky, it could easily cause a crash if data structures
are left in some inconsistent state.

I think we need to make this code more careful about what it's doing.
There's a clue at the top of default_machine_crash_shutdown(), which
calls crash_kexec_prepare_cpus():

	 * This function is only called after the system
	 * has panicked or is otherwise in a critical state.
	 * The minimum amount of code to allow a kexec'd kernel
	 * to run successfully needs to happen here.


You said the "IPI complete" message was the cause of one lockup:

  #0  arch_spin_lock 
  #1  do_raw_spin_lock 
  #2  __raw_spin_lock 
  #3  _raw_spin_lock 
  #4  vprintk_emit 
  #5  vprintk_func
  #7  crash_kexec_prepare_cpus 
  #8  default_machine_crash_shutdown
  #9  machine_crash_shutdown 
  #10 __crash_kexec
  #11 crash_kexec
  #12 oops_end

TBH I think we could just drop that printk() entirely.

Or we could tell printk() that we're in NMI context so that it uses the
percpu buffers.

We should probably do the latter anyway, in case there's any other code
we call that inadvertently calls printk().


The RTAS trace you sent was:

  #0 arch_spin_lock
  #1  lock_rtas () 
  #2  rtas_call (token=8204, nargs=1, nret=1, outputs=0x0)
  #3  ics_rtas_mask_real_irq (hw_irq=4100) 
  #4  machine_kexec_mask_interrupts
  #5  default_machine_crash_shutdown
  #6  machine_crash_shutdown 
  #7  __crash_kexec
  #8  crash_kexec
  #9  oops_end


Which doesn't make it clear who holds the RTAS lock. We really shouldn't
be crashing while holding the RTAS lock, but I guess it could happen.
Can you get a full backtrace?


PAPR says we are not allowed to have multiple CPUs calling RTAS at once,
except for a very small list of RTAS calls. So if we bust the RTAS lock
there's a risk we violate that part of PAPR and crash even harder.

Also it's not specific to kdump, we can't even get through a normal
reboot if we crash with the RTAS lock held.

Anyway here's a patch with some ideas. That allows me to get from a
crash with the RTAS lock held through kdump into the 2nd kernel. But it
only works if it's the crashing CPU that holds the RTAS lock.

cheers

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c5fa251b8950..44ce74966d60 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -25,6 +25,7 @@
 #include <linux/reboot.h>
 #include <linux/syscalls.h>
 
+#include <asm/debugfs.h>
 #include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/hvcall.h>
@@ -65,6 +66,8 @@ unsigned long rtas_rmo_buf;
 void (*rtas_flash_term_hook)(int);
 EXPORT_SYMBOL(rtas_flash_term_hook);
 
+static int rtas_lock_holder = -1;
+
 /* RTAS use home made raw locking instead of spin_lock_irqsave
  * because those can be called from within really nasty contexts
  * such as having the timebase stopped which would lockup with
@@ -76,7 +79,20 @@ static unsigned long lock_rtas(void)
 
 	local_irq_save(flags);
 	preempt_disable();
-	arch_spin_lock(&rtas.lock);
+
+	if (!arch_spin_trylock(&rtas.lock)) {
+		// Couldn't get the lock, do we already hold it?
+		if (rtas_lock_holder == smp_processor_id())
+			// Yes, so we would have deadlocked on ourself. Assume
+			// we're crashing and continue on hopefully ...
+			return flags;
+
+		// No, wait on the lock
+		arch_spin_lock(&rtas.lock);
+	}
+
+	rtas_lock_holder = smp_processor_id();
+
 	return flags;
 }
 
@@ -85,6 +101,8 @@ static void unlock_rtas(unsigned long flags)
 	arch_spin_unlock(&rtas.lock);
 	local_irq_restore(flags);
 	preempt_enable();
+
+	rtas_lock_holder = -1;
 }
 
 /*
@@ -1263,3 +1281,24 @@ void rtas_take_timebase(void)
 	timebase = 0;
 	arch_spin_unlock(&timebase_lock);
 }
+
+static int rtas_crash_set(void *data, u64 val)
+{
+	printk("%s: Taking RTAS lock and then crashing ...\n", __func__);
+	lock_rtas();
+
+	*((volatile int *) 0) = 0;
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_rtas_crash, NULL, rtas_crash_set, "%llu\n");
+
+static __init int rtas_crash_debugfs_init(void)
+{
+	debugfs_create_file_unsafe("crash_in_rtas", 0200,
+				   powerpc_debugfs_root, NULL,
+				   &fops_rtas_crash);
+	return 0;
+}
+device_initcall(rtas_crash_debugfs_init);
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index d488311efab1..4c52cb58e889 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -15,6 +15,7 @@
 #include <linux/crash_dump.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
+#include <linux/printk.h>
 #include <linux/types.h>
 
 #include <asm/processor.h>
@@ -311,6 +312,8 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 	unsigned int i;
 	int (*old_handler)(struct pt_regs *regs);
 
+	printk_nmi_enter();
+
 	/*
 	 * This function is only called after the system
 	 * has panicked or is otherwise in a critical state.


