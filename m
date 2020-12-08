Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A412B2D2084
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 03:13:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqkHm4NvDzDqf9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 13:13:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqkFv0pdDzDqYW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 13:12:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=A+bTf/m4; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqkFk1lbhz9sVl;
 Tue,  8 Dec 2020 13:11:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607393522;
 bh=8iatVVr0doYmwZkFttS9+pNaCgbzkGB02uHrnQhLiF8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=A+bTf/m4exrBzJQZZvJo1q/5I9F0e/kw2E+pim46e67Fp3WWpClGMiQNgwlZTzfU5
 I91uiE2tnR89cD+WGpK6EIXolGlF2xpp74/37NX1a4hXEYFP7nir39xaYb5e/F3vCb
 A+SkpejOFGPjty5Wk0ZUtqnVutg9ep0o6GlRwQv0/PtQ9j8c5Nr0LI3vZ1NqBGdb0h
 J534woc8YaDSyTziDQyKc3WR7uExS/b30LlE1Lw5O+U2aAfz6JdpZ+f5IJ7hgsNKbn
 QhmyAHIUVIBK5JkTWtwrtTIzrOTiojdPvRTPLcDwX5fD+26iC1ivFoDwf0/4YZWmF+
 hnKEnJn1lo/hg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Enrico Weigelt\, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch: fix 'unexpected IRQ trap at vector' warnings
In-Reply-To: <20201207143146.30021-1-info@metux.net>
References: <20201207143146.30021-1-info@metux.net>
Date: Tue, 08 Dec 2020 13:11:52 +1100
Message-ID: <877dptt5av.fsf@mpe.ellerman.id.au>
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
Cc: linux-s390@vger.kernel.org, hpa@zytor.com, linux-parisc@vger.kernel.org,
 deller@gmx.de, x86@kernel.org, linux-um@lists.infradead.org,
 James.Bottomley@HansenPartnership.com, mingo@redhat.com, paulus@samba.org,
 richard@nod.at, bp@alien8.de, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org, jdike@addtoit.com,
 anton.ivanov@cambridgegreys.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Enrico Weigelt, metux IT consult" <info@metux.net> writes:
> All archs, except Alpha, print out the irq number in hex, but the message
> looks like it was a decimal number, which is quite confusing. Fixing this
> by adding "0x" prefix.

Arguably decimal would be better, /proc/interrupts and /proc/irq/ both
use decimal.

The whole message is very dated IMO, these days the number it prints is
(possibly) virtualised via IRQ domains, ie. it's not necessarily a
"vector" if that even makes sense on all arches). Arguably "trap" is the
wrong term on some arches too.

So it would be better reworded entirely IMO, and also switched to
decimal to match other sources of information on interrupts.

Perhaps:
	"Unexpected Linux IRQ %d."


If anyone else is having deja vu like me, yes this has come up before:
  https://lore.kernel.org/lkml/20150712220211.7166.42035.stgit@bhelgaas-glaptop2.roam.corp.google.com/

cheers



> diff --git a/arch/arm/include/asm/hw_irq.h b/arch/arm/include/asm/hw_irq.h
> index cecc13214ef1..2749f19271d9 100644
> --- a/arch/arm/include/asm/hw_irq.h
> +++ b/arch/arm/include/asm/hw_irq.h
> @@ -9,7 +9,7 @@ static inline void ack_bad_irq(int irq)
>  {
>  	extern unsigned long irq_err_count;
>  	irq_err_count++;
> -	pr_crit("unexpected IRQ trap at vector %02x\n", irq);
> +	pr_crit("unexpected IRQ trap at vector 0x%02x\n", irq);
>  }
>  
>  #define ARCH_IRQ_INIT_FLAGS	(IRQ_NOREQUEST | IRQ_NOPROBE)
> diff --git a/arch/parisc/include/asm/hardirq.h b/arch/parisc/include/asm/hardirq.h
> index 7f7039516e53..c3348af88d3f 100644
> --- a/arch/parisc/include/asm/hardirq.h
> +++ b/arch/parisc/include/asm/hardirq.h
> @@ -35,6 +35,6 @@ DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
>  #define __IRQ_STAT(cpu, member) (irq_stat[cpu].member)
>  #define inc_irq_stat(member)	this_cpu_inc(irq_stat.member)
>  #define __inc_irq_stat(member)	__this_cpu_inc(irq_stat.member)
> -#define ack_bad_irq(irq) WARN(1, "unexpected IRQ trap at vector %02x\n", irq)
> +#define ack_bad_irq(irq) WARN(1, "unexpected IRQ trap at vector 0x%02x\n", irq)
>  
>  #endif /* _PARISC_HARDIRQ_H */
> diff --git a/arch/powerpc/include/asm/hardirq.h b/arch/powerpc/include/asm/hardirq.h
> index f133b5930ae1..ec8cf3cf6e49 100644
> --- a/arch/powerpc/include/asm/hardirq.h
> +++ b/arch/powerpc/include/asm/hardirq.h
> @@ -29,7 +29,7 @@ DECLARE_PER_CPU_SHARED_ALIGNED(irq_cpustat_t, irq_stat);
>  
>  static inline void ack_bad_irq(unsigned int irq)
>  {
> -	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
> +	printk(KERN_CRIT "unexpected IRQ trap at vector 0x%02x\n", irq);
>  }
>  
>  extern u64 arch_irq_stat_cpu(unsigned int cpu);
> diff --git a/arch/s390/include/asm/hardirq.h b/arch/s390/include/asm/hardirq.h
> index dfbc3c6c0674..aaaec5cdd4fe 100644
> --- a/arch/s390/include/asm/hardirq.h
> +++ b/arch/s390/include/asm/hardirq.h
> @@ -23,7 +23,7 @@
>  
>  static inline void ack_bad_irq(unsigned int irq)
>  {
> -	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
> +	printk(KERN_CRIT "unexpected IRQ trap at vector 0x%02x\n", irq);
>  }
>  
>  #endif /* __ASM_HARDIRQ_H */
> diff --git a/arch/um/include/asm/hardirq.h b/arch/um/include/asm/hardirq.h
> index b426796d26fd..2a2e6eae034b 100644
> --- a/arch/um/include/asm/hardirq.h
> +++ b/arch/um/include/asm/hardirq.h
> @@ -15,7 +15,7 @@ typedef struct {
>  #ifndef ack_bad_irq
>  static inline void ack_bad_irq(unsigned int irq)
>  {
> -	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
> +	printk(KERN_CRIT "unexpected IRQ trap at vector 0x%02x\n", irq);
>  }
>  #endif
>  
> diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
> index c5dd50369e2f..957c716f2df7 100644
> --- a/arch/x86/kernel/irq.c
> +++ b/arch/x86/kernel/irq.c
> @@ -37,7 +37,7 @@ atomic_t irq_err_count;
>  void ack_bad_irq(unsigned int irq)
>  {
>  	if (printk_ratelimit())
> -		pr_err("unexpected IRQ trap at vector %02x\n", irq);
> +		pr_err("unexpected IRQ trap at vector 0x%02x\n", irq);
>  
>  	/*
>  	 * Currently unexpected vectors happen only on SMP and APIC.
> -- 
> 2.11.0
