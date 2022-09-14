Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 873525B8A04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 16:10:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSMfW3chyz3bqj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 00:09:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hma2vUd8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hma2vUd8;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSMdv2lJgz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 00:09:21 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so19091121pja.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 07:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cTK8cJbS/ws6+PlwvkmR36xAxDhAxwd+5E+3gwhbNAQ=;
        b=hma2vUd8O6BeEEYBdXVqT2/zn0kg7fNO+1DnqAfgtItEHQT1wNp+JtKt8z4AyAbQk5
         xejSezfiAy2XaYaJHECpeVAvKqzrNR90gIWeovW7QYAIf8ZFOW0Nwxbo1P4KXqj+Eq76
         DZkuEqtqTRInShl2zW3VWE06PULC0GkB+eoWsPKnpRDdkQTn5KQRQeZ68wlmIlvkgk7e
         y9jCkgxgWmYaaK6ra+w6wBdT7yac0vGFz32qpoqaydsZeh1/UzcfQAbuvXijipC9nzlf
         jyLQSlka2P974PQVXXkNq+1/SzQdfp97xonM11tWJvBRA0Zol4eldqZc3BQQ1uwIl//p
         iSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cTK8cJbS/ws6+PlwvkmR36xAxDhAxwd+5E+3gwhbNAQ=;
        b=jt4/LKu+OHAX1swX7zqN39ksj0hmb7vNU88uqsQzIy8+6hZt8cLkKwBOCti0GDHoWc
         1wQQ0soBI0+49Q0mzkNtEeG0Mf11rOL9zgNOCP3WkgE+b5yxyFSbphJLH3OIApoK95ID
         UC/grQs7eB7OhpvPU/kqYgRhOy4wcOtoxowYxkWZyPg8b6XEOISsdTAsFb2apKSJGYRy
         4C6e8JPU68lzc9Eyz5OSA9yDShefSSS1AqfWlxHs3JazfCQmw/oN7AGe7N81R/36XMlM
         ow4mnJzEcfptbizRgs5cWXVkKiCeQTyESe0ULLBaZtaWkq71IGT7qocb0N+W7JzMhs2R
         xqNg==
X-Gm-Message-State: ACgBeo1zTeaki5YIEmLoXs0bJ07bf2btVlrY4vB1Elcj5kiIinl7R0/t
	1E4HV4REaVkyN6RzGBQLvnAfwgDVcH80ZJXUkKk=
X-Google-Smtp-Source: AA6agR6TR37QGO7dUboPfGV1jZNyZmYbq9cIch9BtKGAc9RfMZoICz0fKJ129wEN6m3pzYvf7s1QFhlGgoGXsJ+Olpo=
X-Received: by 2002:a17:902:e5cd:b0:176:ad01:ab47 with SMTP id
 u13-20020a170902e5cd00b00176ad01ab47mr36619995plf.133.1663164556474; Wed, 14
 Sep 2022 07:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220914021528.15946-1-zhouzhouyi@gmail.com> <20220914121717.GY246308@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220914121717.GY246308@paulmck-ThinkPad-P17-Gen-1>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 14 Sep 2022 22:09:04 +0800
Message-ID: <CAABZP2woOSE7-OgZxVD4kt9YAs4MmU2Cq+AchOpibtic-5G2Sg@mail.gmail.com>
Subject: Re: [PATCH linux-next][RFC] powerpc: protect cpu offlining by RCU
 offline lock
To: paulmck@kernel.org
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
Cc: atrajeev@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, lance@osuosl.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 14, 2022 at 8:17 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Wed, Sep 14, 2022 at 10:15:28AM +0800, Zhouyi Zhou wrote:
> > During the cpu offlining, the sub functions of xive_teardown_cpu will
> > call __lock_acquire when CONFIG_LOCKDEP=y. The latter function will
> > travel RCU protected list, so "WARNING: suspicious RCU usage" will be
> > triggered.
> >
> > Try to protect cpu offlining by RCU offline lock.
>
Thank Paul for your guidance!
> Rather than acquiring the RCU lock, why not change the functions called
> by xive_teardown_cpu() to avoid calling __lock_acquire()?  For example,
> a call to spin_lock() could be changed to arch_spin_lock().
Great idea!
I will take a try, and perform new rounds of rcutorture tests. I will
submit a new version next week.
Also thank PPC developers for your patience on me ;-)

Cheers
Zhouyi
>
>                                                         Thanx, Paul
>
> > Tested on PPC VM of Open Source Lab of Oregon State University.
> > (Each round of tests takes about 19 hours to finish)
> > Test results show that although "WARNING: suspicious RCU usage" has gone,
> > but there are more "BUG: soft lockup" reports than the original kernel
> > (10 vs 6), so I add a [RFC] to my subject line.
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> > [it seems that there are some delivery problem in my previous email,
> >  so I send again via gmail, sorry for the trouble]
> >
> > Dear PPC and RCU developers
> >
> > I found this bug when trying to do rcutorture tests in ppc VM of
> > Open Source Lab of Oregon State University.
> >
> > console.log report following bug:
> > [   37.635545][    T0] WARNING: suspicious RCU usage^M
> > [   37.636409][    T0] 6.0.0-rc4-next-20220907-dirty #8 Not tainted^M
> > [   37.637575][    T0] -----------------------------^M
> > [   37.638306][    T0] kernel/locking/lockdep.c:3723 RCU-list traversed in non-reader section!!^M
> > [   37.639651][    T0] ^M
> > [   37.639651][    T0] other info that might help us debug this:^M
> > [   37.639651][    T0] ^M
> > [   37.641381][    T0] ^M
> > [   37.641381][    T0] RCU used illegally from offline CPU!^M
> > [   37.641381][    T0] rcu_scheduler_active = 2, debug_locks = 1^M
> > [   37.667170][    T0] no locks held by swapper/6/0.^M
> > [   37.668328][    T0] ^M
> > [   37.668328][    T0] stack backtrace:^M
> > [   37.669995][    T0] CPU: 6 PID: 0 Comm: swapper/6 Not tainted 6.0.0-rc4-next-20220907-dirty #8^M
> > [   37.672777][    T0] Call Trace:^M
> > [   37.673729][    T0] [c000000004653920] [c00000000097f9b4] dump_stack_lvl+0x98/0xe0 (unreliable)^M
> > [   37.678579][    T0] [c000000004653960] [c0000000001f2eb8] lockdep_rcu_suspicious+0x148/0x16c^M
> > [   37.680425][    T0] [c0000000046539f0] [c0000000001ed9b4] __lock_acquire+0x10f4/0x26e0^M
> > [   37.682450][    T0] [c000000004653b30] [c0000000001efc2c] lock_acquire+0x12c/0x420^M
> > [   37.684113][    T0] [c000000004653c20] [c0000000010d704c] _raw_spin_lock_irqsave+0x6c/0xc0^M
> > [   37.686154][    T0] [c000000004653c60] [c0000000000c7b4c] xive_spapr_put_ipi+0xcc/0x150^M
> > [   37.687879][    T0] [c000000004653ca0] [c0000000010c72a8] xive_cleanup_cpu_ipi+0xc8/0xf0^M
> > [   37.689856][    T0] [c000000004653cf0] [c0000000010c7370] xive_teardown_cpu+0xa0/0xf0^M
> > [   37.691877][    T0] [c000000004653d30] [c0000000000fba5c] pseries_cpu_offline_self+0x5c/0x100^M
> > [   37.693882][    T0] [c000000004653da0] [c00000000005d2c4] arch_cpu_idle_dead+0x44/0x60^M
> > [   37.695739][    T0] [c000000004653dc0] [c0000000001c740c] do_idle+0x16c/0x3d0^M
> > [   37.697536][    T0] [c000000004653e70] [c0000000001c7a1c] cpu_startup_entry+0x3c/0x40^M
> > [   37.699694][    T0] [c000000004653ea0] [c00000000005ca20] start_secondary+0x6c0/0xb50^M
> > [   37.701742][    T0] [c000000004653f90] [c00000000000d054] start_secondary_prolog+0x10/0x14^M
> >
> >
> > I am a beginner, hope I can be of some beneficial to the community ;-)
> >
> > Thanks
> > Zhouyi
> > --
> >  arch/powerpc/platforms/pseries/hotplug-cpu.c |  5 ++++-
> >  include/linux/rcupdate.h                     |  3 ++-
> >  kernel/rcu/tree.c                            | 10 ++++++++++
> >  3 files changed, 16 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > index 0f8cd8b06432..ddf66a253c70 100644
> > --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> > @@ -64,11 +64,14 @@ static void pseries_cpu_offline_self(void)
> >
> >       local_irq_disable();
> >       idle_task_exit();
> > +
> > +     /* Because the cpu is now offline, let rcu know that */
> > +     rcu_state_ofl_lock();
> >       if (xive_enabled())
> >               xive_teardown_cpu();
> >       else
> >               xics_teardown_cpu();
> > -
> > +     rcu_state_ofl_unlock();
> >       unregister_slb_shadow(hwcpu);
> >       rtas_stop_self();
> >
> > diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> > index 63d2e6a60ad7..d857955a02ba 100644
> > --- a/include/linux/rcupdate.h
> > +++ b/include/linux/rcupdate.h
> > @@ -1034,5 +1034,6 @@ rcu_head_after_call_rcu(struct rcu_head *rhp, rcu_callback_t f)
> >  /* kernel/ksysfs.c definitions */
> >  extern int rcu_expedited;
> >  extern int rcu_normal;
> > -
> > +void rcu_state_ofl_lock(void);
> > +void rcu_state_ofl_unlock(void);
> >  #endif /* __LINUX_RCUPDATE_H */
> > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > index 6bb8e72bc815..3282725f1054 100644
> > --- a/kernel/rcu/tree.c
> > +++ b/kernel/rcu/tree.c
> > @@ -4796,6 +4796,16 @@ void __init rcu_init(void)
> >               (void)start_poll_synchronize_rcu_expedited();
> >  }
> >
> > +void rcu_state_ofl_lock(void)
> > +{
> > +     arch_spin_lock(&rcu_state.ofl_lock);
> > +}
> > +
> > +void rcu_state_ofl_unlock(void)
> > +{
> > +     arch_spin_unlock(&rcu_state.ofl_lock);
> > +}
> > +
> >  #include "tree_stall.h"
> >  #include "tree_exp.h"
> >  #include "tree_nocb.h"
> > --
> > 2.34.1
> >
