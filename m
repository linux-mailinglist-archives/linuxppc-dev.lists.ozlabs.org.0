Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8871F194FD2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 04:52:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pSbR60l0zDqwh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 14:52:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pSYH1zPnzDqvl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 14:50:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=AKeE3rtC; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48pSYG15kMz9sRR;
 Fri, 27 Mar 2020 14:50:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585281010;
 bh=4Qqg2r8oM4zPrJhzVQO07i32dlNDD+eFmBtDY+IJlB0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=AKeE3rtC/tHmgbrDN+BCRn0kRIXQhECLUqtFW9Yv6a/cJApH/zdfgOFjn/WYU7Buh
 9ZmJqGOLvqNKaV2W2oAjBO8NHnQIqHpMFxsoI13sRFoBV183mxazsQLrPApSmkJrlH
 IN/ND6SstTbfalEQE+GOh13LwSwp8LMQmvm68zzqUHZ8LN+vUrcapZevjeh2vdQ6SY
 7ABlVGzAl+sJznQmXo/JukKf2j44nx35QMwZ1qRgOCBeaQ3TtCpk33AD8/U+PMRZlr
 EYZ75f3mkiwv3B+z4cVpg641xeIep6hQIP7vKZCpeSCXVF1elVrB8d02Jdui/slXo4
 XTioOijx4aiww==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Leonardo Bras <leonardo@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leonardo@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] ppc/crash: Skip spinlocks during crash
In-Reply-To: <20200326232542.503157-1-leonardo@linux.ibm.com>
References: <20200326232542.503157-1-leonardo@linux.ibm.com>
Date: Fri, 27 Mar 2020 14:50:14 +1100
Message-ID: <87d08ywj61.fsf@mpe.ellerman.id.au>
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

Hi Leonardo,

Leonardo Bras <leonardo@linux.ibm.com> writes:
> During a crash, there is chance that the cpus that handle the NMI IPI
> are holding a spin_lock. If this spin_lock is needed by crashing_cpu it
> will cause a deadlock. (rtas_lock and printk logbuf_log as of today)

Please give us more detail on how those locks are causing you trouble, a
stack trace would be good if you have it.

> This is a problem if the system has kdump set up, given if it crashes
> for any reason kdump may not be saved for crash analysis.
>
> Skip spinlocks after NMI IPI is sent to all other cpus.

We don't want to add overhead to all spinlocks for the life of the
system, just to handle this one case.

There's already a flag that is set when the system is crashing,
"oops_in_progress", maybe we need to use that somewhere to skip a lock
or do an early return.

cheers

> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> index 860228e917dc..a6381d110795 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -111,6 +111,8 @@ static inline void splpar_spin_yield(arch_spinlock_t *lock) {};
>  static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
>  #endif
>  
> +extern bool crash_skip_spinlock __read_mostly;
> +
>  static inline bool is_shared_processor(void)
>  {
>  #ifdef CONFIG_PPC_SPLPAR
> @@ -142,6 +144,8 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
>  		if (likely(__arch_spin_trylock(lock) == 0))
>  			break;
>  		do {
> +			if (unlikely(crash_skip_spinlock))
> +				return;
>  			HMT_low();
>  			if (is_shared_processor())
>  				splpar_spin_yield(lock);
> @@ -161,6 +165,8 @@ void arch_spin_lock_flags(arch_spinlock_t *lock, unsigned long flags)
>  		local_save_flags(flags_dis);
>  		local_irq_restore(flags);
>  		do {
> +			if (unlikely(crash_skip_spinlock))
> +				return;
>  			HMT_low();
>  			if (is_shared_processor())
>  				splpar_spin_yield(lock);
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index d488311efab1..ae081f0f2472 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -66,6 +66,9 @@ static int handle_fault(struct pt_regs *regs)
>  
>  #ifdef CONFIG_SMP
>  
> +bool crash_skip_spinlock;
> +EXPORT_SYMBOL(crash_skip_spinlock);
> +
>  static atomic_t cpus_in_crash;
>  void crash_ipi_callback(struct pt_regs *regs)
>  {
> @@ -129,6 +132,7 @@ static void crash_kexec_prepare_cpus(int cpu)
>  	/* Would it be better to replace the trap vector here? */
>  
>  	if (atomic_read(&cpus_in_crash) >= ncpus) {
> +		crash_skip_spinlock = true;
>  		printk(KERN_EMERG "IPI complete\n");
>  		return;
>  	}
> -- 
> 2.24.1
