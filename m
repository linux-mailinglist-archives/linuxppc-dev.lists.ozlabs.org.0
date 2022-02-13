Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D99944B3939
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 04:20:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxCJz3jyXz3cSM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 14:20:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OYao2XAV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=zhouzhouyi@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OYao2XAV; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxCJL2BYvz30Ml
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 14:19:28 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id hw13so2096016ejc.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 19:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7vevma6Et++fUarCm6r3CEo1zI8E3aMNK+e0IeOzKm8=;
 b=OYao2XAVyKmjFGqp3kg50YjI23sK9mukAMVrobmOrx4Yh7cNdRKIENvJXPWyYUAiSi
 7Kxu5sOGhr9dW/GAM3rU6ILAjFWse3ET41e2QU4BCjG2H+A50UgBi8qEum5K03pJTZQ9
 6nYkdsb1bDMf1r/A8YtDHdliWJjo7OmY+7CK480KKnYQoY+CKOLyEYvnMt/sWUypILIA
 U88W4VFLrHXmjg7mNAWcw9Tv8KMI8yW/4ZTsz1s5PJ6QZz0SaLN895ylNmhXEvgEt4xb
 i1UUi463Rl7JG1Mzq/C5kGa6gtT5aetDkSBKYaC5d4Xk506KUhBgB+QTI/Y8uDxEzmW8
 xAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7vevma6Et++fUarCm6r3CEo1zI8E3aMNK+e0IeOzKm8=;
 b=q2l5uzcrAVVNhqss/L3MN7pCeSZn/K7v1Ylce5gwufykwEWz0mELr585IEX+aIumFF
 H2QemvzbypUM2g2J+oCxcABSfOx+/aIrJ/XBAwc4Q/4ESrLofbEXrEqbiAvK6kbpZVtI
 iX5uS3rxa8ayaLtRXF913j18kmFDNEWSD0smrvovNNtcpO/i4N34eHGax4ilMDF4Zndi
 dvmnBDr+GqRldpdKc3C8e53sJwY34YZttFB7h1bpMVtlLGmuRmhanHUomgZckbCCInig
 ZTa+icru3oLC6Es0a1ZuI9Ch42KHGIAlOX8zid9A+g5kqdKtNLOtD/dSnoN9NkA6qq+N
 LIPw==
X-Gm-Message-State: AOAM532Gc+5aQkovG0yKRDEszodPAsKUHLFIvhqceDtrdZDVEi8YgIV/
 b8oY3cTVA584Ut/polkokHyNRr9XfewxnCVZ+m0=
X-Google-Smtp-Source: ABdhPJwx57SaDpNDKLPGkY4YAlA/M1ABz/dFN8QdTsCigRt8M+YSWHd0i8mzaIsMT9pakA5d202Lgpka70wKo0y0eVc=
X-Received: by 2002:a17:906:649c:: with SMTP id
 e28mr6462893ejm.324.1644722360622; 
 Sat, 12 Feb 2022 19:19:20 -0800 (PST)
MIME-Version: 1.0
References: <244218af-df6a-236e-0a52-268247dd8271@molgen.mpg.de>
In-Reply-To: <244218af-df6a-236e-0a52-268247dd8271@molgen.mpg.de>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Sun, 13 Feb 2022 11:19:09 +0800
Message-ID: <CAABZP2ycCjiZ0CySc2Lgr_DnUfuDf1iagEKnWwNEkVkR9-gADA@mail.gmail.com>
Subject: Re: BUG: sleeping function called from invalid context at
 include/linux/sched/mm.h:256
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 rcu <rcu@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Jason Baron <jbaron@akamai.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Paul

I think the key to the problem lies in your attached console.log
(pasted below), at times 0.014987 and 0.015995, I see there are two
locks (cpu_hotplug_lock and jump_label_mutex)  holded while
kmem_cache_alloc calls __might_resched (0.023356).

I guess PowerPC's map_patch_area should  temporary release above two
locks before invoking map_kernel_page (which will call
kmem_cache_alloc):

static int map_patch_area(void *addr, unsigned long text_poke_addr)
{
        unsigned long pfn;
        int err;

        if (is_vmalloc_or_module_addr(addr))
                pfn = vmalloc_to_pfn(addr);
        else
                pfn = __pa_symbol(addr) >> PAGE_SHIFT;

        err = map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KERNEL);

        pr_devel("Mapped addr %lx with pfn %lx:%d\n", text_poke_addr, pfn, err);
        if (err)
                return -1;

        return 0;
}

I will try to think it over in the coming days.

[    0.012154][    T1] BUG: sleeping function called from invalid
context at include/linux/sched/mm.h:256
[    0.013128][    T1] in_atomic(): 0, irqs_disabled(): 1, non_block:
0, pid: 1, name: swapper/0
[    0.014015][    T1] preempt_count: 0, expected: 0
[    0.014505][    T1] 2 locks held by swapper/0/1:
[    0.014987][    T1]  #0: c0000000026108a0
(cpu_hotplug_lock){.+.+}-{0:0}, at: static_key_enable+0x24/0x50
[    0.015995][    T1]  #1: c0000000027416c8
(jump_label_mutex){+.+.}-{3:3}, at:
static_key_enable_cpuslocked+0x88/0x120
[    0.017107][    T1] irq event stamp: 46
[    0.017507][    T1] hardirqs last  enabled at (45):
[<c0000000010c1054>] _raw_spin_unlock_irqrestore+0x94/0xd0
[    0.018549][    T1] hardirqs last disabled at (46):
[<c0000000000a9bc4>] do_patch_instruction+0x3b4/0x4a0
[    0.019549][    T1] softirqs last  enabled at (0):
[<c000000000149540>] copy_process+0x8d0/0x1df0
[    0.020474][    T1] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    0.021200][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
5.17.0-rc3-00349-gd3a9fd9fed88 #34
[    0.022115][    T1] Call Trace:
[    0.022443][    T1] [c0000000084837d0] [c000000000961aac]
dump_stack_lvl+0xa0/0xec (unreliable)
[    0.023356][    T1] [c000000008483820] [c00000000019b314]
__might_resched+0x2f4/0x310
[    0.024174][    T1] [c0000000084838b0] [c0000000004c0c70]
kmem_cache_alloc+0x220/0x4b0
[    0.025000][    T1] [c000000008483920] [c000000000448af4]
__pud_alloc+0x74/0x1d0
[    0.025772][    T1] [c000000008483970] [c00000000008fe3c]
hash__map_kernel_page+0x2cc/0x390
[    0.026643][    T1] [c000000008483a20] [c0000000000a9944]
do_patch_instruction+0x134/0x4a0
[    0.027511][    T1] [c000000008483a70] [c0000000000559d4]
arch_jump_label_transform+0x64/0x78
[    0.028401][    T1] [c000000008483a90] [c0000000003d6288]
__jump_label_update+0x148/0x180
[    0.029254][    T1] [c000000008483b30] [c0000000003d6800]
static_key_enable_cpuslocked+0xd0/0x120
[    0.030179][    T1] [c000000008483ba0] [c0000000003d6880]
static_key_enable+0x30/0x50
[    0.030996][    T1] [c000000008483bd0] [c00000000200a8f4]
check_kvm_guest+0x60/0x88
[    0.031799][    T1] [c000000008483c00] [c000000002027744]
pSeries_smp_probe+0x54/0xb0
[    0.032617][    T1] [c000000008483c30] [c000000002011db8]
smp_prepare_cpus+0x3e0/0x430
[    0.033444][    T1] [c000000008483cd0] [c000000002004908]
kernel_init_freeable+0x20c/0x43c
[    0.034307][    T1] [c000000008483db0] [c000000000012c00]
kernel_init+0x30/0x1a0
[    0.035078][    T1] [c000000008483e10] [c00000000000cd64]
ret_from_kernel_thread+0x5c/0x64

Thanks for your trust in me!
Cheers
Zhouyi

On Sun, Feb 13, 2022 at 7:05 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Linux folks,
>
>
> Running rcutorture on the POWER8 system IBM S822LC with Ubuntu 20.10, it
> found the bug below. I more or less used rcu/dev (0ba8896d2fd7
> (lib/irq_poll: Declare IRQ_POLL softirq vector as ksoftirqd-parking
> safe)) [1]. The bug manifested for the four configurations below.
>
> 1.  results-rcutorture-kasan/SRCU-T
> 2.  results-rcutorture-kasan/TINY02
> 3.  results-rcutorture/SRCU-T
> 4.  results-rcutorture/TINY02
>
> For example, the attached
>
>
> /dev/shm/linux/tools/testing/selftests/rcutorture/res/2022.02.11-22.00.51-torture/results-rcutorture-kasan/SRCU-T/console.log
>
> contains:
>
> ```
> [    0.012154][    T1] BUG: sleeping function called from invalid
> context at include/linux/sched/mm.h:256
> [    0.013128][    T1] in_atomic(): 0, irqs_disabled(): 1, non_block: 0,
> pid: 1, name: swapper/0
> [    0.014015][    T1] preempt_count: 0, expected: 0
> [    0.014505][    T1] 2 locks held by swapper/0/1:
> [    0.014987][    T1]  #0: c0000000026108a0
> (cpu_hotplug_lock){.+.+}-{0:0}, at: static_key_enable+0x24/0x50
> [    0.015995][    T1]  #1: c0000000027416c8
> (jump_label_mutex){+.+.}-{3:3}, at: static_key_enable_cpuslocked+0x88/0x120
> [    0.017107][    T1] irq event stamp: 46
> [    0.017507][    T1] hardirqs last  enabled at (45):
> [<c0000000010c1054>] _raw_spin_unlock_irqrestore+0x94/0xd0
> [    0.018549][    T1] hardirqs last disabled at (46):
> [<c0000000000a9bc4>] do_patch_instruction+0x3b4/0x4a0
> [    0.019549][    T1] softirqs last  enabled at (0):
> [<c000000000149540>] copy_process+0x8d0/0x1df0
> [    0.020474][    T1] softirqs last disabled at (0):
> [<0000000000000000>] 0x0
> [    0.021200][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 5.17.0-rc3-00349-gd3a9fd9fed88 #34
> [    0.022115][    T1] Call Trace:
> [    0.022443][    T1] [c0000000084837d0] [c000000000961aac]
> dump_stack_lvl+0xa0/0xec (unreliable)
> [    0.023356][    T1] [c000000008483820] [c00000000019b314]
> __might_resched+0x2f4/0x310
> [    0.024174][    T1] [c0000000084838b0] [c0000000004c0c70]
> kmem_cache_alloc+0x220/0x4b0
> [    0.025000][    T1] [c000000008483920] [c000000000448af4]
> __pud_alloc+0x74/0x1d0
> [    0.025772][    T1] [c000000008483970] [c00000000008fe3c]
> hash__map_kernel_page+0x2cc/0x390
> [    0.026643][    T1] [c000000008483a20] [c0000000000a9944]
> do_patch_instruction+0x134/0x4a0
> [    0.027511][    T1] [c000000008483a70] [c0000000000559d4]
> arch_jump_label_transform+0x64/0x78
> [    0.028401][    T1] [c000000008483a90] [c0000000003d6288]
> __jump_label_update+0x148/0x180
> [    0.029254][    T1] [c000000008483b30] [c0000000003d6800]
> static_key_enable_cpuslocked+0xd0/0x120
> [    0.030179][    T1] [c000000008483ba0] [c0000000003d6880]
> static_key_enable+0x30/0x50
> [    0.030996][    T1] [c000000008483bd0] [c00000000200a8f4]
> check_kvm_guest+0x60/0x88
> [    0.031799][    T1] [c000000008483c00] [c000000002027744]
> pSeries_smp_probe+0x54/0xb0
> [    0.032617][    T1] [c000000008483c30] [c000000002011db8]
> smp_prepare_cpus+0x3e0/0x430
> [    0.033444][    T1] [c000000008483cd0] [c000000002004908]
> kernel_init_freeable+0x20c/0x43c
> [    0.034307][    T1] [c000000008483db0] [c000000000012c00]
> kernel_init+0x30/0x1a0
> [    0.035078][    T1] [c000000008483e10] [c00000000000cd64]
> ret_from_kernel_thread+0x5c/0x64
> ```
>
>
> Kind regards,
>
> Paul
>
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
