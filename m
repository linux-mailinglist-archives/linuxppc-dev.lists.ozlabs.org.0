Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 660135FE305
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 21:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpL2G2Ts4z3drT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 06:59:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wabuw8JG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wabuw8JG;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpL1J6NW0z30M2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 06:58:26 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id c24so2763578pls.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 12:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VtUW4cisGIxxKyzxG0RjRaHU4KOUs3BpVfJWAYy5JY=;
        b=Wabuw8JGAmblm05QJJAxa1wwBvP2/pHKXEyFYOCb/9Ff2csgWfTroujy2hlCWJeuCx
         rBvEbRQMn3dkxgevv3jBT05z8esSh6T55h/ee8i2mFOA7UfA3vZs56JqPRoCIK5prgiA
         Sim0jZTWIwhVPti2WFNeyPjsc/3AygvMEj090iemZTMfozztjgsqiR50I384VoR5ihfn
         mD+P1zjEn5LZVYLctPBlsSVQC25J+aRsjKrS0O23Uv0yfGzCmXpRELJQxtZkkb4lxRUf
         sZvPZ4oqARb/xU6dKItSrj6xbEIbNU2cd3m18LtI2/D1NzqV/xK6PD/fjWAuaBegvO9k
         WV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VtUW4cisGIxxKyzxG0RjRaHU4KOUs3BpVfJWAYy5JY=;
        b=jH23jwGB0Y4ifoO7Bjb7BabG0IeH+zxsy4/T0b8Di9XUlZ2sL5Yv3nc3aS/ws5/WfF
         xB34A+1Kyeus2iQlTmkm+Rhzy79k7kEdT2ZLxY/E2lGbkpd6M4NRe5PVzmqKtbY1Xdkm
         4ojWgP/wYO6xaiX247sg4mJLM3ZHq01cLw3BsTdFP2E1r+ytDq9lebAwSDs/jvUBcooY
         uUp88OE0hT+/EahjTnqzOcKJMwQR9SiKpC1lNB1q4t4pEjnejqjfdv1+dyO4QHeeTpAW
         +NsT1WHJvEAFoUtjt2O7qZ5Vdy+J7G8uhfsJE5TQrCIIdlTqWL6l3Al5vI2y5uUc07ZW
         cbWw==
X-Gm-Message-State: ACrzQf2qw0Q0Ey0bSTfc3E3tMNtSuuhwkFFRXkidIZX/67Z0fhDvevZP
	7yNRRhnVv2u/Xrab4aN70KQ=
X-Google-Smtp-Source: AMsMyM4tM4dwe3qXSw7jpbKTk41uqOshub+6UMbAB0VTeh2EVZmjD2Ep2qUxRuHDq3E0TRX20rJzzA==
X-Received: by 2002:a17:90b:1643:b0:20c:c7c7:d598 with SMTP id il3-20020a17090b164300b0020cc7c7d598mr13285367pjb.97.1665691104519;
        Thu, 13 Oct 2022 12:58:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l18-20020a17090aaa9200b0020a11217682sm155308pjq.27.2022.10.13.12.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 12:58:23 -0700 (PDT)
Date: Thu, 13 Oct 2022 12:58:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] powerpc: fix reschedule bug in KUAP-unlocked user
 copy
Message-ID: <20221013195821.GA2934311@roeck-us.net>
References: <20221013151647.1857994-1-npiggin@gmail.com>
 <20221013151647.1857994-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013151647.1857994-3-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 14, 2022 at 01:16:47AM +1000, Nicholas Piggin wrote:
> schedule must not be explicitly called while KUAP is unlocked, because
> the AMR register will not be saved across the context switch on 64s
> (preemption is allowed because that is driven by interrupts which do
> save the AMR).
> 
> exit_vmx_usercopy() runs inside an unlocked user access region, and it
> calls preempt_enable() which will call schedule() if need_resched() was
> set while non-preemptible. This can cause tasks to run unprotected when
> the should not, and can cause the user copy to be improperly blocked
> when scheduling back to it.
> 
> Fix this by avoiding the explicit resched for preempt kernels by
> generating an interrupt to reschedule the context if need_resched() got
> set.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

With:

0cbbc95b12ac (HEAD -> ppc) powerpc: fix reschedule bug in KUAP-unlocked user copy
28f6b1f174f4 powerpc/64s: Fix hash__change_memory_range preemption warning
20cbdcbb2b09 powerpc/64s: Disable preemption in hash lazy mmu mode
a8b305a95113 powerpc/pseries: Fix CONFIG_DTL=n build
9c55696dd278 powerpc/64s/interrupt: Fix lost interrupts when returning to soft-masked context
f2b220ef93ea (local/master, master) Merge tag 'docs-6.1-2' of git://git.lwn.net/linux

I observed the traceback below. This is with KFENCE and various module
tests (re-)enabled, so the problem may well be unrelated to any of the
above patches.

Guenter

---
WARNING: inconsistent lock state
6.0.0-11845-g0cbbc95b12ac #1 Tainted: G                 N
--------------------------------
inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
swapper/0/1 [HC0[0]:SC0[0]:HE1:SE1] takes:
c000000002734de8 (native_tlbie_lock){+.?.}-{2:2}, at: .native_hpte_updateboltedpp+0x1a4/0x600
{IN-SOFTIRQ-W} state was registered at:
  .lock_acquire+0x20c/0x520
  ._raw_spin_lock+0x4c/0x70
  .native_hpte_invalidate+0x62c/0x840
  .hash__kernel_map_pages+0x450/0x640
  .kfence_protect+0x58/0xc0
  .kfence_guarded_free+0x374/0x5a0
  .__slab_free+0x3d0/0x630
  .put_cred_rcu+0xcc/0x120
  .rcu_core+0x3c4/0x14e0
  .__do_softirq+0x1dc/0x7dc
  .do_softirq_own_stack+0x40/0x60
  0xc00000000869f6d0
  .irq_exit+0x1e8/0x220
  .timer_interrupt+0x284/0x700
  decrementer_common_virt+0x214/0x220
  .rwsem_wake+0x88/0xe0
  .crypto_alg_tested+0x26c/0x370
  .cryptomgr_test+0x34/0x70
  .kthread+0x154/0x180
  .ret_from_kernel_thread+0x58/0x60
irq event stamp: 162973
hardirqs last  enabled at (162973): [<c0000000010cb724>] ._raw_spin_unlock_irqrestore+0xa4/0x120
hardirqs last disabled at (162972): [<c0000000010cb2e0>] ._raw_spin_lock_irqsave+0x40/0xa0
softirqs last  enabled at (162280): [<c0000000010cea2c>] .__do_softirq+0x7ac/0x7dc
softirqs last disabled at (162271): [<c000000000014a60>] .do_softirq_own_stack+0x40/0x60

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(native_tlbie_lock);
  <Interrupt>
    lock(native_tlbie_lock);

 *** DEADLOCK ***

no locks held by swapper/0/1.

stack backtrace:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                 N 6.0.0-11845-g0cbbc95b12ac #1
Hardware name: PowerMac3,1 PPC970FX 0x3c0301 PowerMac
Call Trace:
[c000000005607520] [c0000000010853a8] .dump_stack_lvl+0xa4/0x100 (unreliable)
[c0000000056075b0] [c00000000017e34c] .print_usage_bug+0x2dc/0x310
[c000000005607690] [c00000000017ec8c] .mark_lock.part.42+0x90c/0x9d0
[c0000000056077c0] [c00000000018071c] .__lock_acquire+0x58c/0x2070
[c000000005607910] [c00000000017f3bc] .lock_acquire+0x20c/0x520
[c000000005607a20] [c0000000010cb05c] ._raw_spin_lock+0x4c/0x70
[c000000005607ab0] [c00000000007af94] .native_hpte_updateboltedpp+0x1a4/0x600
[c000000005607b70] [c0000000000721cc] .hash__change_memory_range+0xec/0x200
[c000000005607c20] [c000000000072904] .hash__mark_initmem_nx+0x54/0x90
[c000000005607ca0] [c00000000006e490] .mark_initmem_nx+0x30/0x70
[c000000005607d10] [c00000000006d440] .free_initmem+0x30/0xf0
[c000000005607d90] [c0000000000116ec] .kernel_init+0x5c/0x1c0
[c000000005607e10] [c00000000000ca3c] .ret_from_kernel_thread+0x58/0x60
