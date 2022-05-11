Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1F5228E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 03:24:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KycdF3nwKz3c8t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 11:24:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=OH4n7+K5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=OH4n7+K5; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyccT6CV4z2yh9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 11:23:36 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so3480075pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 18:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3QbBdjb6KO72TonoHk3FFMiDAj9hfQHrJb2cxEohuv8=;
 b=OH4n7+K58RQjGltKX544CnW5gWYsOQy8o2E1gOuVYqXYBwIDX9K9mtYnOZhqWMDSOF
 ZmO4IGzgU/mqHJD4CRPWzYyabKP4Rw4xdvmXQ9MeczIdFU8A2wF1MOI0xb3eNVOU5Im2
 QQY3eEKyp7rlJ9Ax1umajRGPoI6eU//K4MxYmXyQrGflmk4ChnxewvZhAQ6T4tfhGekQ
 q4vEDYY2gg/Ws2zhj7PXx3YxdKo3dI0dlqASWZ8ufC0f/ZAmucaffa24NKplFoHU9WNy
 vMdrxZztY8HOHvnckTh6sZ9vpuAUJs9XKKNCCFzg1GRxouLYSfJaBRsBJ6Bhzw9DU4pb
 ylHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3QbBdjb6KO72TonoHk3FFMiDAj9hfQHrJb2cxEohuv8=;
 b=D4wAraDdCHmcheAwkiHYFcrFs9qLdQq+/VSOTB+b7ZbkRQJMuNHl0PHJ7o4td1imau
 s9X+yqw4skme9ZIE2S9i71cmj41ouzFXokAGQg5k96vGA6bRGMdpAMiLGhAxrVNbYOJX
 qzGaZ9mXoe5Faka6srtyAhVc2dHJ+hujnvoMvmQDzXtr5qM98FQ7EmvvnHylt2wgXHeO
 X6YVwoprP03Ai/ZDUcD2T/AnhT063K2D9rGVTw/nXNKaYX1euPmikDt0gjPB7bYM8TxT
 Oowm8wTUiJ14baDmVBTRdoPEP7n6LNatbDrhB82QQsWuqGJbk1jjY9zCCzUyUURVPbQV
 mfKA==
X-Gm-Message-State: AOAM5305J4Px71BDpzx5BYyUb9J4yVtPs3YSQXEp6T9thl5cZS7OkyIq
 UKa6/TS9Q8Ef0jlWYNp933ZLyQ==
X-Google-Smtp-Source: ABdhPJzCWHg1NZDUOeskizjn0x4+Rf+Kn39oy/fU8Mv+eDbe8Yf1I1uLBSuO0gp8LKmxOVPwM3Horw==
X-Received: by 2002:a17:902:e8cd:b0:15e:ee3b:7839 with SMTP id
 v13-20020a170902e8cd00b0015eee3b7839mr21909030plg.92.1652232212737; 
 Tue, 10 May 2022 18:23:32 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 h9-20020a170902680900b0015e8d4eb295sm253370plk.223.2022.05.10.18.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 18:23:32 -0700 (PDT)
Message-ID: <131fe089-9f4e-2e23-5130-ab0ad0037168@ozlabs.ru>
Date: Wed, 11 May 2022 11:23:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH kernel] KVM: PPC: Book3s: Remove real mode interrupt
 controller hcalls handlers
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20220509071150.181250-1-aik@ozlabs.ru>
 <d43e961e-ce0c-ff90-f34a-d81b17b2c007@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <d43e961e-ce0c-ff90-f34a-d81b17b2c007@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/11/22 03:58, Cédric Le Goater wrote:
> Hello Alexey,
> 
> On 5/9/22 09:11, Alexey Kardashevskiy wrote:
>> Currently we have 2 sets of interrupt controller hypercalls handlers
>> for real and virtual modes, this is from POWER8 times when switching
>> MMU on was considered an expensive operation.
>>
>> POWER9 however does not have dependent threads and MMU is enabled for
>> handling hcalls so the XIVE native 
> 
> XIVE native does not have any real-mode hcall handlers. In fact, all
> are handled at the QEMU level.
> 
>> or XICS-on-XIVE real mode handlers never execute on real P9 and > 
>> later CPUs.
> 
> They are not ? I am surprised. It must be a "recent" change. Any how,
> if you can remove them safely, this is good news and you should be able
> to clean up some more code in the PowerNV native interface.


Yes, this is the result of that massive work of Nick to move the KVM's 
asm to c for p9. It could have been the case even before that but harder 
to see in that asm code :)


>>
>> This untemplate the handlers and only keeps the real mode handlers for
>> XICS native (up to POWER8) and remove the rest of dead code. Changes
>> in functions are mechanical except few missing empty lines to make
>> checkpatch.pl happy.
>>
>> The default implemented hcalls list already contains XICS hcalls so
>> no change there.
>>
>> This should not cause any behavioral change.
> 
> In the worse case, it impacts performance a bit but only on "old" distros
> (kernel < 4.14), I doubt anyone will complain.
> 
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> Acked-by: Cédric Le Goater <clg@kaod.org>


Thanks!

> 
> Thanks,
> 
> C.
> 
> 
>> ---
>>   arch/powerpc/kvm/Makefile               |   2 +-
>>   arch/powerpc/include/asm/kvm_ppc.h      |   7 -
>>   arch/powerpc/kvm/book3s_xive.h          |   7 -
>>   arch/powerpc/kvm/book3s_hv_builtin.c    |  64 ---
>>   arch/powerpc/kvm/book3s_hv_rm_xics.c    |   5 +
>>   arch/powerpc/kvm/book3s_hv_rm_xive.c    |  46 --
>>   arch/powerpc/kvm/book3s_xive.c          | 638 +++++++++++++++++++++++-
>>   arch/powerpc/kvm/book3s_xive_template.c | 636 -----------------------
>>   arch/powerpc/kvm/book3s_hv_rmhandlers.S |  12 +-
>>   9 files changed, 632 insertions(+), 785 deletions(-)
>>   delete mode 100644 arch/powerpc/kvm/book3s_hv_rm_xive.c
>>   delete mode 100644 arch/powerpc/kvm/book3s_xive_template.c
>>
>> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
>> index 8e3681a86074..f17379b0f161 100644
>> --- a/arch/powerpc/kvm/Makefile
>> +++ b/arch/powerpc/kvm/Makefile
>> @@ -73,7 +73,7 @@ kvm-hv-$(CONFIG_PPC_TRANSACTIONAL_MEM) += \
>>       book3s_hv_tm.o
>>   kvm-book3s_64-builtin-xics-objs-$(CONFIG_KVM_XICS) := \
>> -    book3s_hv_rm_xics.o book3s_hv_rm_xive.o
>> +    book3s_hv_rm_xics.o
>>   kvm-book3s_64-builtin-tm-objs-$(CONFIG_PPC_TRANSACTIONAL_MEM) += \
>>       book3s_hv_tm_builtin.o
>> diff --git a/arch/powerpc/include/asm/kvm_ppc.h 
>> b/arch/powerpc/include/asm/kvm_ppc.h
>> index 44200a27371b..a775377a570e 100644
>> --- a/arch/powerpc/include/asm/kvm_ppc.h
>> +++ b/arch/powerpc/include/asm/kvm_ppc.h
>> @@ -787,13 +787,6 @@ long kvmppc_rm_h_page_init(struct kvm_vcpu *vcpu, 
>> unsigned long flags,
>>                  unsigned long dest, unsigned long src);
>>   long kvmppc_hpte_hv_fault(struct kvm_vcpu *vcpu, unsigned long addr,
>>                             unsigned long slb_v, unsigned int status, 
>> bool data);
>> -unsigned long kvmppc_rm_h_xirr(struct kvm_vcpu *vcpu);
>> -unsigned long kvmppc_rm_h_xirr_x(struct kvm_vcpu *vcpu);
>> -unsigned long kvmppc_rm_h_ipoll(struct kvm_vcpu *vcpu, unsigned long 
>> server);
>> -int kvmppc_rm_h_ipi(struct kvm_vcpu *vcpu, unsigned long server,
>> -                    unsigned long mfrr);
>> -int kvmppc_rm_h_cppr(struct kvm_vcpu *vcpu, unsigned long cppr);
>> -int kvmppc_rm_h_eoi(struct kvm_vcpu *vcpu, unsigned long xirr);
>>   void kvmppc_guest_entry_inject_int(struct kvm_vcpu *vcpu);
>>   /*
>> diff --git a/arch/powerpc/kvm/book3s_xive.h 
>> b/arch/powerpc/kvm/book3s_xive.h
>> index 09d0657596c3..1e48f72e8aa5 100644
>> --- a/arch/powerpc/kvm/book3s_xive.h
>> +++ b/arch/powerpc/kvm/book3s_xive.h
>> @@ -285,13 +285,6 @@ static inline u32 __xive_read_eq(__be32 *qpage, 
>> u32 msk, u32 *idx, u32 *toggle)
>>       return cur & 0x7fffffff;
>>   }
>> -extern unsigned long xive_rm_h_xirr(struct kvm_vcpu *vcpu);
>> -extern unsigned long xive_rm_h_ipoll(struct kvm_vcpu *vcpu, unsigned 
>> long server);
>> -extern int xive_rm_h_ipi(struct kvm_vcpu *vcpu, unsigned long server,
>> -             unsigned long mfrr);
>> -extern int xive_rm_h_cppr(struct kvm_vcpu *vcpu, unsigned long cppr);
>> -extern int xive_rm_h_eoi(struct kvm_vcpu *vcpu, unsigned long xirr);
>> -
>>   /*
>>    * Common Xive routines for XICS-over-XIVE and XIVE native
>>    */
>> diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c 
>> b/arch/powerpc/kvm/book3s_hv_builtin.c
>> index 7e52d0beee77..88a8f6473c4e 100644
>> --- a/arch/powerpc/kvm/book3s_hv_builtin.c
>> +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
>> @@ -489,70 +489,6 @@ static long kvmppc_read_one_intr(bool *again)
>>       return kvmppc_check_passthru(xisr, xirr, again);
>>   }
>> -#ifdef CONFIG_KVM_XICS
>> -unsigned long kvmppc_rm_h_xirr(struct kvm_vcpu *vcpu)
>> -{
>> -    if (!kvmppc_xics_enabled(vcpu))
>> -        return H_TOO_HARD;
>> -    if (xics_on_xive())
>> -        return xive_rm_h_xirr(vcpu);
>> -    else
>> -        return xics_rm_h_xirr(vcpu);
>> -}
>> -
>> -unsigned long kvmppc_rm_h_xirr_x(struct kvm_vcpu *vcpu)
>> -{
>> -    if (!kvmppc_xics_enabled(vcpu))
>> -        return H_TOO_HARD;
>> -    vcpu->arch.regs.gpr[5] = get_tb();
>> -    if (xics_on_xive())
>> -        return xive_rm_h_xirr(vcpu);
>> -    else
>> -        return xics_rm_h_xirr(vcpu);
>> -}
>> -
>> -unsigned long kvmppc_rm_h_ipoll(struct kvm_vcpu *vcpu, unsigned long 
>> server)
>> -{
>> -    if (!kvmppc_xics_enabled(vcpu))
>> -        return H_TOO_HARD;
>> -    if (xics_on_xive())
>> -        return xive_rm_h_ipoll(vcpu, server);
>> -    else
>> -        return H_TOO_HARD;
>> -}
>> -
>> -int kvmppc_rm_h_ipi(struct kvm_vcpu *vcpu, unsigned long server,
>> -            unsigned long mfrr)
>> -{
>> -    if (!kvmppc_xics_enabled(vcpu))
>> -        return H_TOO_HARD;
>> -    if (xics_on_xive())
>> -        return xive_rm_h_ipi(vcpu, server, mfrr);
>> -    else
>> -        return xics_rm_h_ipi(vcpu, server, mfrr);
>> -}
>> -
>> -int kvmppc_rm_h_cppr(struct kvm_vcpu *vcpu, unsigned long cppr)
>> -{
>> -    if (!kvmppc_xics_enabled(vcpu))
>> -        return H_TOO_HARD;
>> -    if (xics_on_xive())
>> -        return xive_rm_h_cppr(vcpu, cppr);
>> -    else
>> -        return xics_rm_h_cppr(vcpu, cppr);
>> -}
>> -
>> -int kvmppc_rm_h_eoi(struct kvm_vcpu *vcpu, unsigned long xirr)
>> -{
>> -    if (!kvmppc_xics_enabled(vcpu))
>> -        return H_TOO_HARD;
>> -    if (xics_on_xive())
>> -        return xive_rm_h_eoi(vcpu, xirr);
>> -    else
>> -        return xics_rm_h_eoi(vcpu, xirr);
>> -}
>> -#endif /* CONFIG_KVM_XICS */
>> -
>>   void kvmppc_bad_interrupt(struct pt_regs *regs)
>>   {
>>       /*
>> diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c 
>> b/arch/powerpc/kvm/book3s_hv_rm_xics.c
>> index 587c33fc4564..e2246b715f68 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
>> +++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
>> @@ -479,6 +479,11 @@ static void icp_rm_down_cppr(struct kvmppc_xics 
>> *xics, struct kvmppc_icp *icp,
>>       }
>>   }
>> +unsigned long xics_rm_h_xirr_x(struct kvm_vcpu *vcpu)
>> +{
>> +    vcpu->arch.regs.gpr[5] = get_tb();
>> +    return xics_rm_h_xirr(vcpu);
>> +}
>>   unsigned long xics_rm_h_xirr(struct kvm_vcpu *vcpu)
>>   {
>> diff --git a/arch/powerpc/kvm/book3s_hv_rm_xive.c 
>> b/arch/powerpc/kvm/book3s_hv_rm_xive.c
>> deleted file mode 100644
>> index dd9880731bd6..000000000000
>> --- a/arch/powerpc/kvm/book3s_hv_rm_xive.c
>> +++ /dev/null
>> @@ -1,46 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0
>> -#include <linux/kernel.h>
>> -#include <linux/kvm_host.h>
>> -#include <linux/err.h>
>> -#include <linux/kernel_stat.h>
>> -#include <linux/pgtable.h>
>> -
>> -#include <asm/kvm_book3s.h>
>> -#include <asm/kvm_ppc.h>
>> -#include <asm/hvcall.h>
>> -#include <asm/xics.h>
>> -#include <asm/debug.h>
>> -#include <asm/synch.h>
>> -#include <asm/cputhreads.h>
>> -#include <asm/ppc-opcode.h>
>> -#include <asm/pnv-pci.h>
>> -#include <asm/opal.h>
>> -#include <asm/smp.h>
>> -#include <asm/xive.h>
>> -#include <asm/xive-regs.h>
>> -
>> -#include "book3s_xive.h"
>> -
>> -/* XXX */
>> -#include <asm/udbg.h>
>> -//#define DBG(fmt...) udbg_printf(fmt)
>> -#define DBG(fmt...) do { } while(0)
>> -
>> -static inline void __iomem *get_tima_phys(void)
>> -{
>> -    return local_paca->kvm_hstate.xive_tima_phys;
>> -}
>> -
>> -#undef XIVE_RUNTIME_CHECKS
>> -#define X_PFX xive_rm_
>> -#define X_STATIC
>> -#define X_STAT_PFX stat_rm_
>> -#define __x_tima        get_tima_phys()
>> -#define __x_eoi_page(xd)    ((void __iomem *)((xd)->eoi_page))
>> -#define __x_trig_page(xd)    ((void __iomem *)((xd)->trig_page))
>> -#define __x_writeb    __raw_rm_writeb
>> -#define __x_readw    __raw_rm_readw
>> -#define __x_readq    __raw_rm_readq
>> -#define __x_writeq    __raw_rm_writeq
>> -
>> -#include "book3s_xive_template.c"
>> diff --git a/arch/powerpc/kvm/book3s_xive.c 
>> b/arch/powerpc/kvm/book3s_xive.c
>> index c0ce5531d9bc..65515a96498a 100644
>> --- a/arch/powerpc/kvm/book3s_xive.c
>> +++ b/arch/powerpc/kvm/book3s_xive.c
>> @@ -30,27 +30,629 @@
>>   #include "book3s_xive.h"
>> -
>> -/*
>> - * Virtual mode variants of the hcalls for use on radix/radix
>> - * with AIL. They require the VCPU's VP to be "pushed"
>> - *
>> - * We still instantiate them here because we use some of the
>> - * generated utility functions as well in this file.
>> - */
>> -#define XIVE_RUNTIME_CHECKS
>> -#define X_PFX xive_vm_
>> -#define X_STATIC static
>> -#define X_STAT_PFX stat_vm_
>> -#define __x_tima        xive_tima
>>   #define __x_eoi_page(xd)    ((void __iomem *)((xd)->eoi_mmio))
>>   #define __x_trig_page(xd)    ((void __iomem *)((xd)->trig_mmio))
>> -#define __x_writeb    __raw_writeb
>> -#define __x_readw    __raw_readw
>> -#define __x_readq    __raw_readq
>> -#define __x_writeq    __raw_writeq
>> -#include "book3s_xive_template.c"
>> +/* Dummy interrupt used when taking interrupts out of a queue in 
>> H_CPPR */
>> +#define XICS_DUMMY    1
>> +
>> +static void xive_vm_ack_pending(struct kvmppc_xive_vcpu *xc)
>> +{
>> +    u8 cppr;
>> +    u16 ack;
>> +
>> +    /*
>> +     * Ensure any previous store to CPPR is ordered vs.
>> +     * the subsequent loads from PIPR or ACK.
>> +     */
>> +    eieio();
>> +
>> +    /* Perform the acknowledge OS to register cycle. */
>> +    ack = be16_to_cpu(__raw_readw(xive_tima + TM_SPC_ACK_OS_REG));
>> +
>> +    /* Synchronize subsequent queue accesses */
>> +    mb();
>> +
>> +    /* XXX Check grouping level */
>> +
>> +    /* Anything ? */
>> +    if (!((ack >> 8) & TM_QW1_NSR_EO))
>> +        return;
>> +
>> +    /* Grab CPPR of the most favored pending interrupt */
>> +    cppr = ack & 0xff;
>> +    if (cppr < 8)
>> +        xc->pending |= 1 << cppr;
>> +
>> +    /* Check consistency */
>> +    if (cppr >= xc->hw_cppr)
>> +        pr_warn("KVM-XIVE: CPU %d odd ack CPPR, got %d at %d\n",
>> +            smp_processor_id(), cppr, xc->hw_cppr);
>> +
>> +    /*
>> +     * Update our image of the HW CPPR. We don't yet modify
>> +     * xc->cppr, this will be done as we scan for interrupts
>> +     * in the queues.
>> +     */
>> +    xc->hw_cppr = cppr;
>> +}
>> +
>> +static u8 xive_vm_esb_load(struct xive_irq_data *xd, u32 offset)
>> +{
>> +    u64 val;
>> +
>> +    if (offset == XIVE_ESB_SET_PQ_10 && xd->flags & 
>> XIVE_IRQ_FLAG_STORE_EOI)
>> +        offset |= XIVE_ESB_LD_ST_MO;
>> +
>> +    val = __raw_readq(__x_eoi_page(xd) + offset);
>> +#ifdef __LITTLE_ENDIAN__
>> +    val >>= 64-8;
>> +#endif
>> +    return (u8)val;
>> +}
>> +
>> +
>> +static void xive_vm_source_eoi(u32 hw_irq, struct xive_irq_data *xd)
>> +{
>> +    /* If the XIVE supports the new "store EOI facility, use it */
>> +    if (xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
>> +        __raw_writeq(0, __x_eoi_page(xd) + XIVE_ESB_STORE_EOI);
>> +    else if (xd->flags & XIVE_IRQ_FLAG_LSI) {
>> +        /*
>> +         * For LSIs the HW EOI cycle is used rather than PQ bits,
>> +         * as they are automatically re-triggred in HW when still
>> +         * pending.
>> +         */
>> +        __raw_readq(__x_eoi_page(xd) + XIVE_ESB_LOAD_EOI);
>> +    } else {
>> +        uint64_t eoi_val;
>> +
>> +        /*
>> +         * Otherwise for EOI, we use the special MMIO that does
>> +         * a clear of both P and Q and returns the old Q,
>> +         * except for LSIs where we use the "EOI cycle" special
>> +         * load.
>> +         *
>> +         * This allows us to then do a re-trigger if Q was set
>> +         * rather than synthetizing an interrupt in software
>> +         */
>> +        eoi_val = xive_vm_esb_load(xd, XIVE_ESB_SET_PQ_00);
>> +
>> +        /* Re-trigger if needed */
>> +        if ((eoi_val & 1) && __x_trig_page(xd))
>> +            __raw_writeq(0, __x_trig_page(xd));
>> +    }
>> +}
>> +
>> +enum {
>> +    scan_fetch,
>> +    scan_poll,
>> +    scan_eoi,
>> +};
>> +
>> +static u32 xive_vm_scan_interrupts(struct kvmppc_xive_vcpu *xc,
>> +                       u8 pending, int scan_type)
>> +{
>> +    u32 hirq = 0;
>> +    u8 prio = 0xff;
>> +
>> +    /* Find highest pending priority */
>> +    while ((xc->mfrr != 0xff || pending != 0) && hirq == 0) {
>> +        struct xive_q *q;
>> +        u32 idx, toggle;
>> +        __be32 *qpage;
>> +
>> +        /*
>> +         * If pending is 0 this will return 0xff which is what
>> +         * we want
>> +         */
>> +        prio = ffs(pending) - 1;
>> +
>> +        /* Don't scan past the guest cppr */
>> +        if (prio >= xc->cppr || prio > 7) {
>> +            if (xc->mfrr < xc->cppr) {
>> +                prio = xc->mfrr;
>> +                hirq = XICS_IPI;
>> +            }
>> +            break;
>> +        }
>> +
>> +        /* Grab queue and pointers */
>> +        q = &xc->queues[prio];
>> +        idx = q->idx;
>> +        toggle = q->toggle;
>> +
>> +        /*
>> +         * Snapshot the queue page. The test further down for EOI
>> +         * must use the same "copy" that was used by __xive_read_eq
>> +         * since qpage can be set concurrently and we don't want
>> +         * to miss an EOI.
>> +         */
>> +        qpage = READ_ONCE(q->qpage);
>> +
>> +skip_ipi:
>> +        /*
>> +         * Try to fetch from the queue. Will return 0 for a
>> +         * non-queueing priority (ie, qpage = 0).
>> +         */
>> +        hirq = __xive_read_eq(qpage, q->msk, &idx, &toggle);
>> +
>> +        /*
>> +         * If this was a signal for an MFFR change done by
>> +         * H_IPI we skip it. Additionally, if we were fetching
>> +         * we EOI it now, thus re-enabling reception of a new
>> +         * such signal.
>> +         *
>> +         * We also need to do that if prio is 0 and we had no
>> +         * page for the queue. In this case, we have non-queued
>> +         * IPI that needs to be EOId.
>> +         *
>> +         * This is safe because if we have another pending MFRR
>> +         * change that wasn't observed above, the Q bit will have
>> +         * been set and another occurrence of the IPI will trigger.
>> +         */
>> +        if (hirq == XICS_IPI || (prio == 0 && !qpage)) {
>> +            if (scan_type == scan_fetch) {
>> +                xive_vm_source_eoi(xc->vp_ipi,
>> +                               &xc->vp_ipi_data);
>> +                q->idx = idx;
>> +                q->toggle = toggle;
>> +            }
>> +            /* Loop back on same queue with updated idx/toggle */
>> +            WARN_ON(hirq && hirq != XICS_IPI);
>> +            if (hirq)
>> +                goto skip_ipi;
>> +        }
>> +
>> +        /* If it's the dummy interrupt, continue searching */
>> +        if (hirq == XICS_DUMMY)
>> +            goto skip_ipi;
>> +
>> +        /* Clear the pending bit if the queue is now empty */
>> +        if (!hirq) {
>> +            pending &= ~(1 << prio);
>> +
>> +            /*
>> +             * Check if the queue count needs adjusting due to
>> +             * interrupts being moved away.
>> +             */
>> +            if (atomic_read(&q->pending_count)) {
>> +                int p = atomic_xchg(&q->pending_count, 0);
>> +
>> +                if (p) {
>> +                    WARN_ON(p > atomic_read(&q->count));
>> +                    atomic_sub(p, &q->count);
>> +                }
>> +            }
>> +        }
>> +
>> +        /*
>> +         * If the most favoured prio we found pending is less
>> +         * favored (or equal) than a pending IPI, we return
>> +         * the IPI instead.
>> +         */
>> +        if (prio >= xc->mfrr && xc->mfrr < xc->cppr) {
>> +            prio = xc->mfrr;
>> +            hirq = XICS_IPI;
>> +            break;
>> +        }
>> +
>> +        /* If fetching, update queue pointers */
>> +        if (scan_type == scan_fetch) {
>> +            q->idx = idx;
>> +            q->toggle = toggle;
>> +        }
>> +    }
>> +
>> +    /* If we are just taking a "peek", do nothing else */
>> +    if (scan_type == scan_poll)
>> +        return hirq;
>> +
>> +    /* Update the pending bits */
>> +    xc->pending = pending;
>> +
>> +    /*
>> +     * If this is an EOI that's it, no CPPR adjustment done here,
>> +     * all we needed was cleanup the stale pending bits and check
>> +     * if there's anything left.
>> +     */
>> +    if (scan_type == scan_eoi)
>> +        return hirq;
>> +
>> +    /*
>> +     * If we found an interrupt, adjust what the guest CPPR should
>> +     * be as if we had just fetched that interrupt from HW.
>> +     *
>> +     * Note: This can only make xc->cppr smaller as the previous
>> +     * loop will only exit with hirq != 0 if prio is lower than
>> +     * the current xc->cppr. Thus we don't need to re-check xc->mfrr
>> +     * for pending IPIs.
>> +     */
>> +    if (hirq)
>> +        xc->cppr = prio;
>> +    /*
>> +     * If it was an IPI the HW CPPR might have been lowered too much
>> +     * as the HW interrupt we use for IPIs is routed to priority 0.
>> +     *
>> +     * We re-sync it here.
>> +     */
>> +    if (xc->cppr != xc->hw_cppr) {
>> +        xc->hw_cppr = xc->cppr;
>> +        __raw_writeb(xc->cppr, xive_tima + TM_QW1_OS + TM_CPPR);
>> +    }
>> +
>> +    return hirq;
>> +}
>> +
>> +static unsigned long xive_vm_h_xirr(struct kvm_vcpu *vcpu)
>> +{
>> +    struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
>> +    u8 old_cppr;
>> +    u32 hirq;
>> +
>> +    pr_devel("H_XIRR\n");
>> +
>> +    xc->stat_vm_h_xirr++;
>> +
>> +    /* First collect pending bits from HW */
>> +    xive_vm_ack_pending(xc);
>> +
>> +    pr_devel(" new pending=0x%02x hw_cppr=%d cppr=%d\n",
>> +         xc->pending, xc->hw_cppr, xc->cppr);
>> +
>> +    /* Grab previous CPPR and reverse map it */
>> +    old_cppr = xive_prio_to_guest(xc->cppr);
>> +
>> +    /* Scan for actual interrupts */
>> +    hirq = xive_vm_scan_interrupts(xc, xc->pending, scan_fetch);
>> +
>> +    pr_devel(" got hirq=0x%x hw_cppr=%d cppr=%d\n",
>> +         hirq, xc->hw_cppr, xc->cppr);
>> +
>> +    /* That should never hit */
>> +    if (hirq & 0xff000000)
>> +        pr_warn("XIVE: Weird guest interrupt number 0x%08x\n", hirq);
>> +
>> +    /*
>> +     * XXX We could check if the interrupt is masked here and
>> +     * filter it. If we chose to do so, we would need to do:
>> +     *
>> +     *    if (masked) {
>> +     *        lock();
>> +     *        if (masked) {
>> +     *            old_Q = true;
>> +     *            hirq = 0;
>> +     *        }
>> +     *        unlock();
>> +     *    }
>> +     */
>> +
>> +    /* Return interrupt and old CPPR in GPR4 */
>> +    vcpu->arch.regs.gpr[4] = hirq | (old_cppr << 24);
>> +
>> +    return H_SUCCESS;
>> +}
>> +
>> +static unsigned long xive_vm_h_ipoll(struct kvm_vcpu *vcpu, unsigned 
>> long server)
>> +{
>> +    struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
>> +    u8 pending = xc->pending;
>> +    u32 hirq;
>> +
>> +    pr_devel("H_IPOLL(server=%ld)\n", server);
>> +
>> +    xc->stat_vm_h_ipoll++;
>> +
>> +    /* Grab the target VCPU if not the current one */
>> +    if (xc->server_num != server) {
>> +        vcpu = kvmppc_xive_find_server(vcpu->kvm, server);
>> +        if (!vcpu)
>> +            return H_PARAMETER;
>> +        xc = vcpu->arch.xive_vcpu;
>> +
>> +        /* Scan all priorities */
>> +        pending = 0xff;
>> +    } else {
>> +        /* Grab pending interrupt if any */
>> +        __be64 qw1 = __raw_readq(xive_tima + TM_QW1_OS);
>> +        u8 pipr = be64_to_cpu(qw1) & 0xff;
>> +
>> +        if (pipr < 8)
>> +            pending |= 1 << pipr;
>> +    }
>> +
>> +    hirq = xive_vm_scan_interrupts(xc, pending, scan_poll);
>> +
>> +    /* Return interrupt and old CPPR in GPR4 */
>> +    vcpu->arch.regs.gpr[4] = hirq | (xc->cppr << 24);
>> +
>> +    return H_SUCCESS;
>> +}
>> +
>> +static void xive_vm_push_pending_to_hw(struct kvmppc_xive_vcpu *xc)
>> +{
>> +    u8 pending, prio;
>> +
>> +    pending = xc->pending;
>> +    if (xc->mfrr != 0xff) {
>> +        if (xc->mfrr < 8)
>> +            pending |= 1 << xc->mfrr;
>> +        else
>> +            pending |= 0x80;
>> +    }
>> +    if (!pending)
>> +        return;
>> +    prio = ffs(pending) - 1;
>> +
>> +    __raw_writeb(prio, xive_tima + TM_SPC_SET_OS_PENDING);
>> +}
>> +
>> +static void xive_vm_scan_for_rerouted_irqs(struct kvmppc_xive *xive,
>> +                           struct kvmppc_xive_vcpu *xc)
>> +{
>> +    unsigned int prio;
>> +
>> +    /* For each priority that is now masked */
>> +    for (prio = xc->cppr; prio < KVMPPC_XIVE_Q_COUNT; prio++) {
>> +        struct xive_q *q = &xc->queues[prio];
>> +        struct kvmppc_xive_irq_state *state;
>> +        struct kvmppc_xive_src_block *sb;
>> +        u32 idx, toggle, entry, irq, hw_num;
>> +        struct xive_irq_data *xd;
>> +        __be32 *qpage;
>> +        u16 src;
>> +
>> +        idx = q->idx;
>> +        toggle = q->toggle;
>> +        qpage = READ_ONCE(q->qpage);
>> +        if (!qpage)
>> +            continue;
>> +
>> +        /* For each interrupt in the queue */
>> +        for (;;) {
>> +            entry = be32_to_cpup(qpage + idx);
>> +
>> +            /* No more ? */
>> +            if ((entry >> 31) == toggle)
>> +                break;
>> +            irq = entry & 0x7fffffff;
>> +
>> +            /* Skip dummies and IPIs */
>> +            if (irq == XICS_DUMMY || irq == XICS_IPI)
>> +                goto next;
>> +            sb = kvmppc_xive_find_source(xive, irq, &src);
>> +            if (!sb)
>> +                goto next;
>> +            state = &sb->irq_state[src];
>> +
>> +            /* Has it been rerouted ? */
>> +            if (xc->server_num == state->act_server)
>> +                goto next;
>> +
>> +            /*
>> +             * Allright, it *has* been re-routed, kill it from
>> +             * the queue.
>> +             */
>> +            qpage[idx] = cpu_to_be32((entry & 0x80000000) | XICS_DUMMY);
>> +
>> +            /* Find the HW interrupt */
>> +            kvmppc_xive_select_irq(state, &hw_num, &xd);
>> +
>> +            /* If it's not an LSI, set PQ to 11 the EOI will force a 
>> resend */
>> +            if (!(xd->flags & XIVE_IRQ_FLAG_LSI))
>> +                xive_vm_esb_load(xd, XIVE_ESB_SET_PQ_11);
>> +
>> +            /* EOI the source */
>> +            xive_vm_source_eoi(hw_num, xd);
>> +
>> +next:
>> +            idx = (idx + 1) & q->msk;
>> +            if (idx == 0)
>> +                toggle ^= 1;
>> +        }
>> +    }
>> +}
>> +
>> +static int xive_vm_h_cppr(struct kvm_vcpu *vcpu, unsigned long cppr)
>> +{
>> +    struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
>> +    struct kvmppc_xive *xive = vcpu->kvm->arch.xive;
>> +    u8 old_cppr;
>> +
>> +    pr_devel("H_CPPR(cppr=%ld)\n", cppr);
>> +
>> +    xc->stat_vm_h_cppr++;
>> +
>> +    /* Map CPPR */
>> +    cppr = xive_prio_from_guest(cppr);
>> +
>> +    /* Remember old and update SW state */
>> +    old_cppr = xc->cppr;
>> +    xc->cppr = cppr;
>> +
>> +    /*
>> +     * Order the above update of xc->cppr with the subsequent
>> +     * read of xc->mfrr inside push_pending_to_hw()
>> +     */
>> +    smp_mb();
>> +
>> +    if (cppr > old_cppr) {
>> +        /*
>> +         * We are masking less, we need to look for pending things
>> +         * to deliver and set VP pending bits accordingly to trigger
>> +         * a new interrupt otherwise we might miss MFRR changes for
>> +         * which we have optimized out sending an IPI signal.
>> +         */
>> +        xive_vm_push_pending_to_hw(xc);
>> +    } else {
>> +        /*
>> +         * We are masking more, we need to check the queue for any
>> +         * interrupt that has been routed to another CPU, take
>> +         * it out (replace it with the dummy) and retrigger it.
>> +         *
>> +         * This is necessary since those interrupts may otherwise
>> +         * never be processed, at least not until this CPU restores
>> +         * its CPPR.
>> +         *
>> +         * This is in theory racy vs. HW adding new interrupts to
>> +         * the queue. In practice this works because the interesting
>> +         * cases are when the guest has done a set_xive() to move the
>> +         * interrupt away, which flushes the xive, followed by the
>> +         * target CPU doing a H_CPPR. So any new interrupt coming into
>> +         * the queue must still be routed to us and isn't a source
>> +         * of concern.
>> +         */
>> +        xive_vm_scan_for_rerouted_irqs(xive, xc);
>> +    }
>> +
>> +    /* Apply new CPPR */
>> +    xc->hw_cppr = cppr;
>> +    __raw_writeb(cppr, xive_tima + TM_QW1_OS + TM_CPPR);
>> +
>> +    return H_SUCCESS;
>> +}
>> +
>> +static int xive_vm_h_eoi(struct kvm_vcpu *vcpu, unsigned long xirr)
>> +{
>> +    struct kvmppc_xive *xive = vcpu->kvm->arch.xive;
>> +    struct kvmppc_xive_src_block *sb;
>> +    struct kvmppc_xive_irq_state *state;
>> +    struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
>> +    struct xive_irq_data *xd;
>> +    u8 new_cppr = xirr >> 24;
>> +    u32 irq = xirr & 0x00ffffff, hw_num;
>> +    u16 src;
>> +    int rc = 0;
>> +
>> +    pr_devel("H_EOI(xirr=%08lx)\n", xirr);
>> +
>> +    xc->stat_vm_h_eoi++;
>> +
>> +    xc->cppr = xive_prio_from_guest(new_cppr);
>> +
>> +    /*
>> +     * IPIs are synthetized from MFRR and thus don't need
>> +     * any special EOI handling. The underlying interrupt
>> +     * used to signal MFRR changes is EOId when fetched from
>> +     * the queue.
>> +     */
>> +    if (irq == XICS_IPI || irq == 0) {
>> +        /*
>> +         * This barrier orders the setting of xc->cppr vs.
>> +         * subsquent test of xc->mfrr done inside
>> +         * scan_interrupts and push_pending_to_hw
>> +         */
>> +        smp_mb();
>> +        goto bail;
>> +    }
>> +
>> +    /* Find interrupt source */
>> +    sb = kvmppc_xive_find_source(xive, irq, &src);
>> +    if (!sb) {
>> +        pr_devel(" source not found !\n");
>> +        rc = H_PARAMETER;
>> +        /* Same as above */
>> +        smp_mb();
>> +        goto bail;
>> +    }
>> +    state = &sb->irq_state[src];
>> +    kvmppc_xive_select_irq(state, &hw_num, &xd);
>> +
>> +    state->in_eoi = true;
>> +
>> +    /*
>> +     * This barrier orders both setting of in_eoi above vs,
>> +     * subsequent test of guest_priority, and the setting
>> +     * of xc->cppr vs. subsquent test of xc->mfrr done inside
>> +     * scan_interrupts and push_pending_to_hw
>> +     */
>> +    smp_mb();
>> +
>> +again:
>> +    if (state->guest_priority == MASKED) {
>> +        arch_spin_lock(&sb->lock);
>> +        if (state->guest_priority != MASKED) {
>> +            arch_spin_unlock(&sb->lock);
>> +            goto again;
>> +        }
>> +        pr_devel(" EOI on saved P...\n");
>> +
>> +        /* Clear old_p, that will cause unmask to perform an EOI */
>> +        state->old_p = false;
>> +
>> +        arch_spin_unlock(&sb->lock);
>> +    } else {
>> +        pr_devel(" EOI on source...\n");
>> +
>> +        /* Perform EOI on the source */
>> +        xive_vm_source_eoi(hw_num, xd);
>> +
>> +        /* If it's an emulated LSI, check level and resend */
>> +        if (state->lsi && state->asserted)
>> +            __raw_writeq(0, __x_trig_page(xd));
>> +
>> +    }
>> +
>> +    /*
>> +     * This barrier orders the above guest_priority check
>> +     * and spin_lock/unlock with clearing in_eoi below.
>> +     *
>> +     * It also has to be a full mb() as it must ensure
>> +     * the MMIOs done in source_eoi() are completed before
>> +     * state->in_eoi is visible.
>> +     */
>> +    mb();
>> +    state->in_eoi = false;
>> +bail:
>> +
>> +    /* Re-evaluate pending IRQs and update HW */
>> +    xive_vm_scan_interrupts(xc, xc->pending, scan_eoi);
>> +    xive_vm_push_pending_to_hw(xc);
>> +    pr_devel(" after scan pending=%02x\n", xc->pending);
>> +
>> +    /* Apply new CPPR */
>> +    xc->hw_cppr = xc->cppr;
>> +    __raw_writeb(xc->cppr, xive_tima + TM_QW1_OS + TM_CPPR);
>> +
>> +    return rc;
>> +}
>> +
>> +static int xive_vm_h_ipi(struct kvm_vcpu *vcpu, unsigned long server,
>> +                   unsigned long mfrr)
>> +{
>> +    struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
>> +
>> +    pr_devel("H_IPI(server=%08lx,mfrr=%ld)\n", server, mfrr);
>> +
>> +    xc->stat_vm_h_ipi++;
>> +
>> +    /* Find target */
>> +    vcpu = kvmppc_xive_find_server(vcpu->kvm, server);
>> +    if (!vcpu)
>> +        return H_PARAMETER;
>> +    xc = vcpu->arch.xive_vcpu;
>> +
>> +    /* Locklessly write over MFRR */
>> +    xc->mfrr = mfrr;
>> +
>> +    /*
>> +     * The load of xc->cppr below and the subsequent MMIO store
>> +     * to the IPI must happen after the above mfrr update is
>> +     * globally visible so that:
>> +     *
>> +     * - Synchronize with another CPU doing an H_EOI or a H_CPPR
>> +     *   updating xc->cppr then reading xc->mfrr.
>> +     *
>> +     * - The target of the IPI sees the xc->mfrr update
>> +     */
>> +    mb();
>> +
>> +    /* Shoot the IPI if most favored than target cppr */
>> +    if (mfrr < xc->cppr)
>> +        __raw_writeq(0, __x_trig_page(&xc->vp_ipi_data));
>> +
>> +    return H_SUCCESS;
>> +}
>>   /*
>>    * We leave a gap of a couple of interrupts in the queue to
>> diff --git a/arch/powerpc/kvm/book3s_xive_template.c 
>> b/arch/powerpc/kvm/book3s_xive_template.c
>> deleted file mode 100644
>> index b0015e05d99a..000000000000
>> --- a/arch/powerpc/kvm/book3s_xive_template.c
>> +++ /dev/null
>> @@ -1,636 +0,0 @@
>> -// SPDX-License-Identifier: GPL-2.0-only
>> -/*
>> - * Copyright 2017 Benjamin Herrenschmidt, IBM Corporation
>> - */
>> -
>> -/* File to be included by other .c files */
>> -
>> -#define XGLUE(a,b) a##b
>> -#define GLUE(a,b) XGLUE(a,b)
>> -
>> -/* Dummy interrupt used when taking interrupts out of a queue in 
>> H_CPPR */
>> -#define XICS_DUMMY    1
>> -
>> -static void GLUE(X_PFX,ack_pending)(struct kvmppc_xive_vcpu *xc)
>> -{
>> -    u8 cppr;
>> -    u16 ack;
>> -
>> -    /*
>> -     * Ensure any previous store to CPPR is ordered vs.
>> -     * the subsequent loads from PIPR or ACK.
>> -     */
>> -    eieio();
>> -
>> -    /* Perform the acknowledge OS to register cycle. */
>> -    ack = be16_to_cpu(__x_readw(__x_tima + TM_SPC_ACK_OS_REG));
>> -
>> -    /* Synchronize subsequent queue accesses */
>> -    mb();
>> -
>> -    /* XXX Check grouping level */
>> -
>> -    /* Anything ? */
>> -    if (!((ack >> 8) & TM_QW1_NSR_EO))
>> -        return;
>> -
>> -    /* Grab CPPR of the most favored pending interrupt */
>> -    cppr = ack & 0xff;
>> -    if (cppr < 8)
>> -        xc->pending |= 1 << cppr;
>> -
>> -#ifdef XIVE_RUNTIME_CHECKS
>> -    /* Check consistency */
>> -    if (cppr >= xc->hw_cppr)
>> -        pr_warn("KVM-XIVE: CPU %d odd ack CPPR, got %d at %d\n",
>> -            smp_processor_id(), cppr, xc->hw_cppr);
>> -#endif
>> -
>> -    /*
>> -     * Update our image of the HW CPPR. We don't yet modify
>> -     * xc->cppr, this will be done as we scan for interrupts
>> -     * in the queues.
>> -     */
>> -    xc->hw_cppr = cppr;
>> -}
>> -
>> -static u8 GLUE(X_PFX,esb_load)(struct xive_irq_data *xd, u32 offset)
>> -{
>> -    u64 val;
>> -
>> -    if (offset == XIVE_ESB_SET_PQ_10 && xd->flags & 
>> XIVE_IRQ_FLAG_STORE_EOI)
>> -        offset |= XIVE_ESB_LD_ST_MO;
>> -
>> -    val =__x_readq(__x_eoi_page(xd) + offset);
>> -#ifdef __LITTLE_ENDIAN__
>> -    val >>= 64-8;
>> -#endif
>> -    return (u8)val;
>> -}
>> -
>> -
>> -static void GLUE(X_PFX,source_eoi)(u32 hw_irq, struct xive_irq_data *xd)
>> -{
>> -    /* If the XIVE supports the new "store EOI facility, use it */
>> -    if (xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
>> -        __x_writeq(0, __x_eoi_page(xd) + XIVE_ESB_STORE_EOI);
>> -    else if (xd->flags & XIVE_IRQ_FLAG_LSI) {
>> -        /*
>> -         * For LSIs the HW EOI cycle is used rather than PQ bits,
>> -         * as they are automatically re-triggred in HW when still
>> -         * pending.
>> -         */
>> -        __x_readq(__x_eoi_page(xd) + XIVE_ESB_LOAD_EOI);
>> -    } else {
>> -        uint64_t eoi_val;
>> -
>> -        /*
>> -         * Otherwise for EOI, we use the special MMIO that does
>> -         * a clear of both P and Q and returns the old Q,
>> -         * except for LSIs where we use the "EOI cycle" special
>> -         * load.
>> -         *
>> -         * This allows us to then do a re-trigger if Q was set
>> -         * rather than synthetizing an interrupt in software
>> -         */
>> -        eoi_val = GLUE(X_PFX,esb_load)(xd, XIVE_ESB_SET_PQ_00);
>> -
>> -        /* Re-trigger if needed */
>> -        if ((eoi_val & 1) && __x_trig_page(xd))
>> -            __x_writeq(0, __x_trig_page(xd));
>> -    }
>> -}
>> -
>> -enum {
>> -    scan_fetch,
>> -    scan_poll,
>> -    scan_eoi,
>> -};
>> -
>> -static u32 GLUE(X_PFX,scan_interrupts)(struct kvmppc_xive_vcpu *xc,
>> -                       u8 pending, int scan_type)
>> -{
>> -    u32 hirq = 0;
>> -    u8 prio = 0xff;
>> -
>> -    /* Find highest pending priority */
>> -    while ((xc->mfrr != 0xff || pending != 0) && hirq == 0) {
>> -        struct xive_q *q;
>> -        u32 idx, toggle;
>> -        __be32 *qpage;
>> -
>> -        /*
>> -         * If pending is 0 this will return 0xff which is what
>> -         * we want
>> -         */
>> -        prio = ffs(pending) - 1;
>> -
>> -        /* Don't scan past the guest cppr */
>> -        if (prio >= xc->cppr || prio > 7) {
>> -            if (xc->mfrr < xc->cppr) {
>> -                prio = xc->mfrr;
>> -                hirq = XICS_IPI;
>> -            }
>> -            break;
>> -        }
>> -
>> -        /* Grab queue and pointers */
>> -        q = &xc->queues[prio];
>> -        idx = q->idx;
>> -        toggle = q->toggle;
>> -
>> -        /*
>> -         * Snapshot the queue page. The test further down for EOI
>> -         * must use the same "copy" that was used by __xive_read_eq
>> -         * since qpage can be set concurrently and we don't want
>> -         * to miss an EOI.
>> -         */
>> -        qpage = READ_ONCE(q->qpage);
>> -
>> -skip_ipi:
>> -        /*
>> -         * Try to fetch from the queue. Will return 0 for a
>> -         * non-queueing priority (ie, qpage = 0).
>> -         */
>> -        hirq = __xive_read_eq(qpage, q->msk, &idx, &toggle);
>> -
>> -        /*
>> -         * If this was a signal for an MFFR change done by
>> -         * H_IPI we skip it. Additionally, if we were fetching
>> -         * we EOI it now, thus re-enabling reception of a new
>> -         * such signal.
>> -         *
>> -         * We also need to do that if prio is 0 and we had no
>> -         * page for the queue. In this case, we have non-queued
>> -         * IPI that needs to be EOId.
>> -         *
>> -         * This is safe because if we have another pending MFRR
>> -         * change that wasn't observed above, the Q bit will have
>> -         * been set and another occurrence of the IPI will trigger.
>> -         */
>> -        if (hirq == XICS_IPI || (prio == 0 && !qpage)) {
>> -            if (scan_type == scan_fetch) {
>> -                GLUE(X_PFX,source_eoi)(xc->vp_ipi,
>> -                               &xc->vp_ipi_data);
>> -                q->idx = idx;
>> -                q->toggle = toggle;
>> -            }
>> -            /* Loop back on same queue with updated idx/toggle */
>> -#ifdef XIVE_RUNTIME_CHECKS
>> -            WARN_ON(hirq && hirq != XICS_IPI);
>> -#endif
>> -            if (hirq)
>> -                goto skip_ipi;
>> -        }
>> -
>> -        /* If it's the dummy interrupt, continue searching */
>> -        if (hirq == XICS_DUMMY)
>> -            goto skip_ipi;
>> -
>> -        /* Clear the pending bit if the queue is now empty */
>> -        if (!hirq) {
>> -            pending &= ~(1 << prio);
>> -
>> -            /*
>> -             * Check if the queue count needs adjusting due to
>> -             * interrupts being moved away.
>> -             */
>> -            if (atomic_read(&q->pending_count)) {
>> -                int p = atomic_xchg(&q->pending_count, 0);
>> -                if (p) {
>> -#ifdef XIVE_RUNTIME_CHECKS
>> -                    WARN_ON(p > atomic_read(&q->count));
>> -#endif
>> -                    atomic_sub(p, &q->count);
>> -                }
>> -            }
>> -        }
>> -
>> -        /*
>> -         * If the most favoured prio we found pending is less
>> -         * favored (or equal) than a pending IPI, we return
>> -         * the IPI instead.
>> -         */
>> -        if (prio >= xc->mfrr && xc->mfrr < xc->cppr) {
>> -            prio = xc->mfrr;
>> -            hirq = XICS_IPI;
>> -            break;
>> -        }
>> -
>> -        /* If fetching, update queue pointers */
>> -        if (scan_type == scan_fetch) {
>> -            q->idx = idx;
>> -            q->toggle = toggle;
>> -        }
>> -    }
>> -
>> -    /* If we are just taking a "peek", do nothing else */
>> -    if (scan_type == scan_poll)
>> -        return hirq;
>> -
>> -    /* Update the pending bits */
>> -    xc->pending = pending;
>> -
>> -    /*
>> -     * If this is an EOI that's it, no CPPR adjustment done here,
>> -     * all we needed was cleanup the stale pending bits and check
>> -     * if there's anything left.
>> -     */
>> -    if (scan_type == scan_eoi)
>> -        return hirq;
>> -
>> -    /*
>> -     * If we found an interrupt, adjust what the guest CPPR should
>> -     * be as if we had just fetched that interrupt from HW.
>> -     *
>> -     * Note: This can only make xc->cppr smaller as the previous
>> -     * loop will only exit with hirq != 0 if prio is lower than
>> -     * the current xc->cppr. Thus we don't need to re-check xc->mfrr
>> -     * for pending IPIs.
>> -     */
>> -    if (hirq)
>> -        xc->cppr = prio;
>> -    /*
>> -     * If it was an IPI the HW CPPR might have been lowered too much
>> -     * as the HW interrupt we use for IPIs is routed to priority 0.
>> -     *
>> -     * We re-sync it here.
>> -     */
>> -    if (xc->cppr != xc->hw_cppr) {
>> -        xc->hw_cppr = xc->cppr;
>> -        __x_writeb(xc->cppr, __x_tima + TM_QW1_OS + TM_CPPR);
>> -    }
>> -
>> -    return hirq;
>> -}
>> -
>> -X_STATIC unsigned long GLUE(X_PFX,h_xirr)(struct kvm_vcpu *vcpu)
>> -{
>> -    struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
>> -    u8 old_cppr;
>> -    u32 hirq;
>> -
>> -    pr_devel("H_XIRR\n");
>> -
>> -    xc->GLUE(X_STAT_PFX,h_xirr)++;
>> -
>> -    /* First collect pending bits from HW */
>> -    GLUE(X_PFX,ack_pending)(xc);
>> -
>> -    pr_devel(" new pending=0x%02x hw_cppr=%d cppr=%d\n",
>> -         xc->pending, xc->hw_cppr, xc->cppr);
>> -
>> -    /* Grab previous CPPR and reverse map it */
>> -    old_cppr = xive_prio_to_guest(xc->cppr);
>> -
>> -    /* Scan for actual interrupts */
>> -    hirq = GLUE(X_PFX,scan_interrupts)(xc, xc->pending, scan_fetch);
>> -
>> -    pr_devel(" got hirq=0x%x hw_cppr=%d cppr=%d\n",
>> -         hirq, xc->hw_cppr, xc->cppr);
>> -
>> -#ifdef XIVE_RUNTIME_CHECKS
>> -    /* That should never hit */
>> -    if (hirq & 0xff000000)
>> -        pr_warn("XIVE: Weird guest interrupt number 0x%08x\n", hirq);
>> -#endif
>> -
>> -    /*
>> -     * XXX We could check if the interrupt is masked here and
>> -     * filter it. If we chose to do so, we would need to do:
>> -     *
>> -     *    if (masked) {
>> -     *        lock();
>> -     *        if (masked) {
>> -     *            old_Q = true;
>> -     *            hirq = 0;
>> -     *        }
>> -     *        unlock();
>> -     *    }
>> -     */
>> -
>> -    /* Return interrupt and old CPPR in GPR4 */
>> -    vcpu->arch.regs.gpr[4] = hirq | (old_cppr << 24);
>> -
>> -    return H_SUCCESS;
>> -}
>> -
>> -X_STATIC unsigned long GLUE(X_PFX,h_ipoll)(struct kvm_vcpu *vcpu, 
>> unsigned long server)
>> -{
>> -    struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
>> -    u8 pending = xc->pending;
>> -    u32 hirq;
>> -
>> -    pr_devel("H_IPOLL(server=%ld)\n", server);
>> -
>> -    xc->GLUE(X_STAT_PFX,h_ipoll)++;
>> -
>> -    /* Grab the target VCPU if not the current one */
>> -    if (xc->server_num != server) {
>> -        vcpu = kvmppc_xive_find_server(vcpu->kvm, server);
>> -        if (!vcpu)
>> -            return H_PARAMETER;
>> -        xc = vcpu->arch.xive_vcpu;
>> -
>> -        /* Scan all priorities */
>> -        pending = 0xff;
>> -    } else {
>> -        /* Grab pending interrupt if any */
>> -        __be64 qw1 = __x_readq(__x_tima + TM_QW1_OS);
>> -        u8 pipr = be64_to_cpu(qw1) & 0xff;
>> -        if (pipr < 8)
>> -            pending |= 1 << pipr;
>> -    }
>> -
>> -    hirq = GLUE(X_PFX,scan_interrupts)(xc, pending, scan_poll);
>> -
>> -    /* Return interrupt and old CPPR in GPR4 */
>> -    vcpu->arch.regs.gpr[4] = hirq | (xc->cppr << 24);
>> -
>> -    return H_SUCCESS;
>> -}
>> -
>> -static void GLUE(X_PFX,push_pending_to_hw)(struct kvmppc_xive_vcpu *xc)
>> -{
>> -    u8 pending, prio;
>> -
>> -    pending = xc->pending;
>> -    if (xc->mfrr != 0xff) {
>> -        if (xc->mfrr < 8)
>> -            pending |= 1 << xc->mfrr;
>> -        else
>> -            pending |= 0x80;
>> -    }
>> -    if (!pending)
>> -        return;
>> -    prio = ffs(pending) - 1;
>> -
>> -    __x_writeb(prio, __x_tima + TM_SPC_SET_OS_PENDING);
>> -}
>> -
>> -static void GLUE(X_PFX,scan_for_rerouted_irqs)(struct kvmppc_xive *xive,
>> -                           struct kvmppc_xive_vcpu *xc)
>> -{
>> -    unsigned int prio;
>> -
>> -    /* For each priority that is now masked */
>> -    for (prio = xc->cppr; prio < KVMPPC_XIVE_Q_COUNT; prio++) {
>> -        struct xive_q *q = &xc->queues[prio];
>> -        struct kvmppc_xive_irq_state *state;
>> -        struct kvmppc_xive_src_block *sb;
>> -        u32 idx, toggle, entry, irq, hw_num;
>> -        struct xive_irq_data *xd;
>> -        __be32 *qpage;
>> -        u16 src;
>> -
>> -        idx = q->idx;
>> -        toggle = q->toggle;
>> -        qpage = READ_ONCE(q->qpage);
>> -        if (!qpage)
>> -            continue;
>> -
>> -        /* For each interrupt in the queue */
>> -        for (;;) {
>> -            entry = be32_to_cpup(qpage + idx);
>> -
>> -            /* No more ? */
>> -            if ((entry >> 31) == toggle)
>> -                break;
>> -            irq = entry & 0x7fffffff;
>> -
>> -            /* Skip dummies and IPIs */
>> -            if (irq == XICS_DUMMY || irq == XICS_IPI)
>> -                goto next;
>> -            sb = kvmppc_xive_find_source(xive, irq, &src);
>> -            if (!sb)
>> -                goto next;
>> -            state = &sb->irq_state[src];
>> -
>> -            /* Has it been rerouted ? */
>> -            if (xc->server_num == state->act_server)
>> -                goto next;
>> -
>> -            /*
>> -             * Allright, it *has* been re-routed, kill it from
>> -             * the queue.
>> -             */
>> -            qpage[idx] = cpu_to_be32((entry & 0x80000000) | XICS_DUMMY);
>> -
>> -            /* Find the HW interrupt */
>> -            kvmppc_xive_select_irq(state, &hw_num, &xd);
>> -
>> -            /* If it's not an LSI, set PQ to 11 the EOI will force a 
>> resend */
>> -            if (!(xd->flags & XIVE_IRQ_FLAG_LSI))
>> -                GLUE(X_PFX,esb_load)(xd, XIVE_ESB_SET_PQ_11);
>> -
>> -            /* EOI the source */
>> -            GLUE(X_PFX,source_eoi)(hw_num, xd);
>> -
>> -        next:
>> -            idx = (idx + 1) & q->msk;
>> -            if (idx == 0)
>> -                toggle ^= 1;
>> -        }
>> -    }
>> -}
>> -
>> -X_STATIC int GLUE(X_PFX,h_cppr)(struct kvm_vcpu *vcpu, unsigned long 
>> cppr)
>> -{
>> -    struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
>> -    struct kvmppc_xive *xive = vcpu->kvm->arch.xive;
>> -    u8 old_cppr;
>> -
>> -    pr_devel("H_CPPR(cppr=%ld)\n", cppr);
>> -
>> -    xc->GLUE(X_STAT_PFX,h_cppr)++;
>> -
>> -    /* Map CPPR */
>> -    cppr = xive_prio_from_guest(cppr);
>> -
>> -    /* Remember old and update SW state */
>> -    old_cppr = xc->cppr;
>> -    xc->cppr = cppr;
>> -
>> -    /*
>> -     * Order the above update of xc->cppr with the subsequent
>> -     * read of xc->mfrr inside push_pending_to_hw()
>> -     */
>> -    smp_mb();
>> -
>> -    if (cppr > old_cppr) {
>> -        /*
>> -         * We are masking less, we need to look for pending things
>> -         * to deliver and set VP pending bits accordingly to trigger
>> -         * a new interrupt otherwise we might miss MFRR changes for
>> -         * which we have optimized out sending an IPI signal.
>> -         */
>> -        GLUE(X_PFX,push_pending_to_hw)(xc);
>> -    } else {
>> -        /*
>> -         * We are masking more, we need to check the queue for any
>> -         * interrupt that has been routed to another CPU, take
>> -         * it out (replace it with the dummy) and retrigger it.
>> -         *
>> -         * This is necessary since those interrupts may otherwise
>> -         * never be processed, at least not until this CPU restores
>> -         * its CPPR.
>> -         *
>> -         * This is in theory racy vs. HW adding new interrupts to
>> -         * the queue. In practice this works because the interesting
>> -         * cases are when the guest has done a set_xive() to move the
>> -         * interrupt away, which flushes the xive, followed by the
>> -         * target CPU doing a H_CPPR. So any new interrupt coming into
>> -         * the queue must still be routed to us and isn't a source
>> -         * of concern.
>> -         */
>> -        GLUE(X_PFX,scan_for_rerouted_irqs)(xive, xc);
>> -    }
>> -
>> -    /* Apply new CPPR */
>> -    xc->hw_cppr = cppr;
>> -    __x_writeb(cppr, __x_tima + TM_QW1_OS + TM_CPPR);
>> -
>> -    return H_SUCCESS;
>> -}
>> -
>> -X_STATIC int GLUE(X_PFX,h_eoi)(struct kvm_vcpu *vcpu, unsigned long 
>> xirr)
>> -{
>> -    struct kvmppc_xive *xive = vcpu->kvm->arch.xive;
>> -    struct kvmppc_xive_src_block *sb;
>> -    struct kvmppc_xive_irq_state *state;
>> -    struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
>> -    struct xive_irq_data *xd;
>> -    u8 new_cppr = xirr >> 24;
>> -    u32 irq = xirr & 0x00ffffff, hw_num;
>> -    u16 src;
>> -    int rc = 0;
>> -
>> -    pr_devel("H_EOI(xirr=%08lx)\n", xirr);
>> -
>> -    xc->GLUE(X_STAT_PFX,h_eoi)++;
>> -
>> -    xc->cppr = xive_prio_from_guest(new_cppr);
>> -
>> -    /*
>> -     * IPIs are synthetized from MFRR and thus don't need
>> -     * any special EOI handling. The underlying interrupt
>> -     * used to signal MFRR changes is EOId when fetched from
>> -     * the queue.
>> -     */
>> -    if (irq == XICS_IPI || irq == 0) {
>> -        /*
>> -         * This barrier orders the setting of xc->cppr vs.
>> -         * subsquent test of xc->mfrr done inside
>> -         * scan_interrupts and push_pending_to_hw
>> -         */
>> -        smp_mb();
>> -        goto bail;
>> -    }
>> -
>> -    /* Find interrupt source */
>> -    sb = kvmppc_xive_find_source(xive, irq, &src);
>> -    if (!sb) {
>> -        pr_devel(" source not found !\n");
>> -        rc = H_PARAMETER;
>> -        /* Same as above */
>> -        smp_mb();
>> -        goto bail;
>> -    }
>> -    state = &sb->irq_state[src];
>> -    kvmppc_xive_select_irq(state, &hw_num, &xd);
>> -
>> -    state->in_eoi = true;
>> -
>> -    /*
>> -     * This barrier orders both setting of in_eoi above vs,
>> -     * subsequent test of guest_priority, and the setting
>> -     * of xc->cppr vs. subsquent test of xc->mfrr done inside
>> -     * scan_interrupts and push_pending_to_hw
>> -     */
>> -    smp_mb();
>> -
>> -again:
>> -    if (state->guest_priority == MASKED) {
>> -        arch_spin_lock(&sb->lock);
>> -        if (state->guest_priority != MASKED) {
>> -            arch_spin_unlock(&sb->lock);
>> -            goto again;
>> -        }
>> -        pr_devel(" EOI on saved P...\n");
>> -
>> -        /* Clear old_p, that will cause unmask to perform an EOI */
>> -        state->old_p = false;
>> -
>> -        arch_spin_unlock(&sb->lock);
>> -    } else {
>> -        pr_devel(" EOI on source...\n");
>> -
>> -        /* Perform EOI on the source */
>> -        GLUE(X_PFX,source_eoi)(hw_num, xd);
>> -
>> -        /* If it's an emulated LSI, check level and resend */
>> -        if (state->lsi && state->asserted)
>> -            __x_writeq(0, __x_trig_page(xd));
>> -
>> -    }
>> -
>> -    /*
>> -     * This barrier orders the above guest_priority check
>> -     * and spin_lock/unlock with clearing in_eoi below.
>> -     *
>> -     * It also has to be a full mb() as it must ensure
>> -     * the MMIOs done in source_eoi() are completed before
>> -     * state->in_eoi is visible.
>> -     */
>> -    mb();
>> -    state->in_eoi = false;
>> -bail:
>> -
>> -    /* Re-evaluate pending IRQs and update HW */
>> -    GLUE(X_PFX,scan_interrupts)(xc, xc->pending, scan_eoi);
>> -    GLUE(X_PFX,push_pending_to_hw)(xc);
>> -    pr_devel(" after scan pending=%02x\n", xc->pending);
>> -
>> -    /* Apply new CPPR */
>> -    xc->hw_cppr = xc->cppr;
>> -    __x_writeb(xc->cppr, __x_tima + TM_QW1_OS + TM_CPPR);
>> -
>> -    return rc;
>> -}
>> -
>> -X_STATIC int GLUE(X_PFX,h_ipi)(struct kvm_vcpu *vcpu, unsigned long 
>> server,
>> -                   unsigned long mfrr)
>> -{
>> -    struct kvmppc_xive_vcpu *xc = vcpu->arch.xive_vcpu;
>> -
>> -    pr_devel("H_IPI(server=%08lx,mfrr=%ld)\n", server, mfrr);
>> -
>> -    xc->GLUE(X_STAT_PFX,h_ipi)++;
>> -
>> -    /* Find target */
>> -    vcpu = kvmppc_xive_find_server(vcpu->kvm, server);
>> -    if (!vcpu)
>> -        return H_PARAMETER;
>> -    xc = vcpu->arch.xive_vcpu;
>> -
>> -    /* Locklessly write over MFRR */
>> -    xc->mfrr = mfrr;
>> -
>> -    /*
>> -     * The load of xc->cppr below and the subsequent MMIO store
>> -     * to the IPI must happen after the above mfrr update is
>> -     * globally visible so that:
>> -     *
>> -     * - Synchronize with another CPU doing an H_EOI or a H_CPPR
>> -     *   updating xc->cppr then reading xc->mfrr.
>> -     *
>> -     * - The target of the IPI sees the xc->mfrr update
>> -     */
>> -    mb();
>> -
>> -    /* Shoot the IPI if most favored than target cppr */
>> -    if (mfrr < xc->cppr)
>> -        __x_writeq(0, __x_trig_page(&xc->vp_ipi_data));
>> -
>> -    return H_SUCCESS;
>> -}
>> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S 
>> b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> index 44d74bfe05df..5003563ca38f 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> @@ -1803,11 +1803,11 @@ hcall_real_table:
>>       .long    0        /* 0x5c */
>>       .long    0        /* 0x60 */
>>   #ifdef CONFIG_KVM_XICS
>> -    .long    DOTSYM(kvmppc_rm_h_eoi) - hcall_real_table
>> -    .long    DOTSYM(kvmppc_rm_h_cppr) - hcall_real_table
>> -    .long    DOTSYM(kvmppc_rm_h_ipi) - hcall_real_table
>> -    .long    DOTSYM(kvmppc_rm_h_ipoll) - hcall_real_table
>> -    .long    DOTSYM(kvmppc_rm_h_xirr) - hcall_real_table
>> +    .long    DOTSYM(xics_rm_h_eoi) - hcall_real_table
>> +    .long    DOTSYM(xics_rm_h_cppr) - hcall_real_table
>> +    .long    DOTSYM(xics_rm_h_ipi) - hcall_real_table
>> +    .long    0        /* 0x70 - H_IPOLL */
>> +    .long    DOTSYM(xics_rm_h_xirr) - hcall_real_table
>>   #else
>>       .long    0        /* 0x64 - H_EOI */
>>       .long    0        /* 0x68 - H_CPPR */
>> @@ -1977,7 +1977,7 @@ hcall_real_table:
>>       .long    0        /* 0x2f4 */
>>       .long    0        /* 0x2f8 */
>>   #ifdef CONFIG_KVM_XICS
>> -    .long    DOTSYM(kvmppc_rm_h_xirr_x) - hcall_real_table
>> +    .long    DOTSYM(xics_rm_h_xirr_x) - hcall_real_table
>>   #else
>>       .long    0        /* 0x2fc - H_XIRR_X*/
>>   #endif
> 
