Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A005FD421
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 07:15:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnyQB2WZyz3cht
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 16:15:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gY9EL5TR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gY9EL5TR;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnyPH4kZfz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 16:14:25 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 129so663119pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 22:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVQyEX1g/f41jMTfERxd1InAul+jcjavb10aq9vV5iY=;
        b=gY9EL5TRfR+atOWXk/o2e6zfOgScIftCLf+8ubXXzWbZNDeqepYkagdvA/ZyUDBW84
         2upz6l8gMMBkrWtot2DH4z3SpIrKG2sOLMgnF5E8CALtKrldGUbDFaCb2LPZHRXo49bv
         IoOWSuy8aYj1Dlyp2k4MmBvgFOiWuMWf664dygOihGO3DIitS4DIKe2fH/HhmKFCl5MU
         67te7toZ+WiIhKjyJoEa+gVwGfcCS3fvL4McYqcscBJq+wRy3FV+VImRE2nyFQzkY4gu
         Hm4hpCTZEzhEzs+byeaERa5NSTQAqmCQkMEeg3APCO+vu8ZoUg9TIKW0yUx8IGL8k2zD
         EvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DVQyEX1g/f41jMTfERxd1InAul+jcjavb10aq9vV5iY=;
        b=wV07+PEAK6fo/X882Fs1Qh6EYJNtv6njljHL53rKJ+vtRhE0rrvNm6Qm/sYhALSDzF
         L33R7pQCwRBpFOJQBwdqjfCtpVOCLElleTVaq96l+U2RNfZ1OQ0lhc2Dccwpd84xDxSn
         GbU6xT4tl2CLNdq+fQYG1vh0n4kP1H2itqWpgu+cojkYZJPlmqMwcvRPDSO2bEMwZ0VK
         4BwvtQ+9GocPyaP7PqI/uDHatYVKBH3Ozcd0oJWrjRZKM1FHAV9NaPQfgiutVZLDMiW3
         v8fWF4xIays9eFSb+rFhXiv6RcrroyiURc1WUJW4GwvV1Zb+x9DAozHPaepSsvdqi4QB
         pVpw==
X-Gm-Message-State: ACrzQf0tqduTqRBhIkYEm4AREiDYVtzgyZ0Qn+YaHrRdffciRCRvUS+A
	6VoDLp7UcJ5Xsurur7ZI3aU=
X-Google-Smtp-Source: AMsMyM7JFEIZu2VTMmxC6ESdI6U9zGqK84jimZr0+TFrcSvoZy7wSS4IuchJ3MXHl8LA1prBerREYw==
X-Received: by 2002:a63:1d22:0:b0:439:3e7c:8af7 with SMTP id d34-20020a631d22000000b004393e7c8af7mr28829040pgd.78.1665638062754;
        Wed, 12 Oct 2022 22:14:22 -0700 (PDT)
Received: from localhost ([202.173.165.98])
        by smtp.gmail.com with ESMTPSA id h16-20020aa79f50000000b00562f9ea47a5sm795737pfr.190.2022.10.12.22.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 22:14:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Oct 2022 15:14:08 +1000
Message-Id: <CNKJES19WP6K.LOS0TA0Q4MRO@bobo>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Guenter Roeck" <linux@roeck-us.net>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
X-Mailer: aerc 0.11.0
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net> <Y0biBtCUtc2mowbQ@zx2c4.com>
 <20221012164452.GA2990467@roeck-us.net> <Y0b3ZsTRHWG6jGK8@zx2c4.com>
 <bba714ce-4af7-a7ea-21b5-10e5578b6db8@roeck-us.net>
In-Reply-To: <bba714ce-4af7-a7ea-21b5-10e5578b6db8@roeck-us.net>
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
Cc: david@redhat.com, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, haren@linux.ibm.com, Ingo Molnar <mingo@kernel.org>, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, aneesh.kumar@linux.ibm.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Oct 13, 2022 at 2:43 PM AEST, Guenter Roeck wrote:
> On 10/12/22 10:20, Jason A. Donenfeld wrote:
> > On Wed, Oct 12, 2022 at 09:44:52AM -0700, Guenter Roeck wrote:
> >> On Wed, Oct 12, 2022 at 09:49:26AM -0600, Jason A. Donenfeld wrote:
> >>> On Wed, Oct 12, 2022 at 07:18:27AM -0700, Guenter Roeck wrote:
> >>>> NIP [c000000000031630] .replay_soft_interrupts+0x60/0x300
> >>>> LR [c000000000031964] .arch_local_irq_restore+0x94/0x1c0
> >>>> Call Trace:
> >>>> [c000000007df3870] [c000000000031964] .arch_local_irq_restore+0x94/0=
x1c0 (unreliable)
> >>>> [c000000007df38f0] [c000000000f8a444] .__schedule+0x664/0xa50
> >>>> [c000000007df39d0] [c000000000f8a8b0] .schedule+0x80/0x140
> >>>> [c000000007df3a50] [c00000000092f0dc] .try_to_generate_entropy+0x118=
/0x174
> >>>> [c000000007df3b40] [c00000000092e2e4] .urandom_read_iter+0x74/0x140
> >>>> [c000000007df3bc0] [c0000000003b0044] .vfs_read+0x284/0x2d0
> >>>> [c000000007df3cd0] [c0000000003b0d2c] .ksys_read+0xdc/0x130
> >>>> [c000000007df3d80] [c00000000002a88c] .system_call_exception+0x19c/0=
x330
> >>>> [c000000007df3e10] [c00000000000c1d4] system_call_common+0xf4/0x258
> >>>
> >>> Obviously the first couple lines of this concern me a bit. But I thin=
k
> >>> actually this might just be a catalyst for another bug. You could vie=
w
> >>> that function as basically just:
> >>>
> >>>      while (something)
> >>>      	schedule();
> >>>
> >>> And I guess in the process of calling the scheduler a lot, which togg=
les
> >>> interrupts a lot, something got wedged.
> >>>
> >>> Curious, though, I did try to reproduce this, to no avail. My .config=
 is
> >>> https://xn--4db.cc/rBvHWfDZ . What's yours?
> >>>
> >>
> >> Attached. My qemu command line is
> >=20
> > Okay, thanks, I reproduced it. In this case, I suspect
> > try_to_generate_entropy() is just the messenger. There's an earlier
> > problem:
> >=20
> > BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0=
/1
> > caller is .__flush_tlb_pending+0x40/0xf0
> > CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-28380-gde492c83cae0-dir=
ty #4
> > Hardware name: PowerMac3,1 PPC970FX 0x3c0301 PowerMac
> > Call Trace:
> > [c0000000044c3540] [c000000000f93ef0] .dump_stack_lvl+0x7c/0xc4 (unreli=
able)
> > [c0000000044c35d0] [c000000000fc9550] .check_preemption_disabled+0x140/=
0x150
> > [c0000000044c3660] [c000000000073dd0] .__flush_tlb_pending+0x40/0xf0
> > [c0000000044c36f0] [c000000000334434] .__apply_to_page_range+0x764/0xa3=
0
> > [c0000000044c3840] [c00000000006cad0] .change_memory_attr+0xf0/0x160
> > [c0000000044c38d0] [c0000000002a1d70] .bpf_prog_select_runtime+0x150/0x=
230
> > [c0000000044c3970] [c000000000d405d4] .bpf_prepare_filter+0x504/0x6f0
> > [c0000000044c3a30] [c000000000d4085c] .bpf_prog_create+0x9c/0x140
> > [c0000000044c3ac0] [c000000002051d9c] .ptp_classifier_init+0x44/0x78
> > [c0000000044c3b50] [c000000002050f3c] .sock_init+0xe0/0x100
> > [c0000000044c3bd0] [c000000000010bd4] .do_one_initcall+0xa4/0x438
> > [c0000000044c3cc0] [c000000002005008] .kernel_init_freeable+0x378/0x428
> > [c0000000044c3da0] [c0000000000113d8] .kernel_init+0x28/0x1a0
> > [c0000000044c3e10] [c00000000000ca3c] .ret_from_kernel_thread+0x58/0x60
> >=20
> > This in turn is because __flush_tlb_pending() calls:
> >=20
> > static inline int mm_is_thread_local(struct mm_struct *mm)
> > {
> >          return cpumask_equal(mm_cpumask(mm),
> >                                cpumask_of(smp_processor_id()));
> > }
> >=20
> > __flush_tlb_pending() has a comment about this:
> >=20
> >   * Must be called from within some kind of spinlock/non-preempt region=
...
> >   */
> > void __flush_tlb_pending(struct ppc64_tlb_batch *batch)
> >=20
> > So I guess that didn't happen for some reason? Maybe this is indicative
> > of some lock imbalance that then gets hit later?
>
> I managed to bisect that problem. Unfortunately it points to the
> scheduler merge. No idea what to do about that. Any idea ?
> I am copying Peter and Ingo for comments.
>

> # first bad commit: [30c999937f69abf935b0228b8411713737377d9e] Merge tag =
'sched-core-2022-10-07' of git://git.kernel.org/pub/scm/linux/kernel/git/ti=
p/tip

This might be a red herring because I can reproduce without it.
I think we can fix this with some preempt critical sections, they
don't look too much of a problem.

I don't know why it's not showing up earlier than this release,
I'll look into it a bit more.

Thanks,
Nick
