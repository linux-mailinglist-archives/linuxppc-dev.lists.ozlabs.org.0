Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8DC5EB931
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 06:26:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc64v5v3bz3c1Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 14:26:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Yq57LBzD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Yq57LBzD;
	dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc64C5BjWz309f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 14:25:30 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id u69so8370232pgd.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 21:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=LxbOuUcp4Fl9hDEOZUCmihBUghEH6LuaJsPJ+RBDT+I=;
        b=Yq57LBzDbv3oiuzWFlq6XSE7gOd1EqfBKzoiQRWN3okeLKqWjn+DJN/0LKvTpID8V+
         WhTnX2rem4x42LZEr+1C344NB2Pp9P49cc0kOCZO6lsHqFUTsyhLfkNbKscRHuh7lmIn
         L0dV++ksHe8sAFNeNCnTXHbxg/Nera/5JrEBPkD8XDX6dPYqKiwZXXIvt4NTUfrnFiFV
         8Vnzunyx22JaK32NUqadIR+KaR9wX5wWqC9rMwHPzPRay5utMcPNrzxTXRLQeDH56+I0
         h891SOpl2SCBWq1e3FJ36OyZQ/RBVxkD94GkQyyfTce+vLULVign5e5HDc5Yk+dfq9ER
         Shgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=LxbOuUcp4Fl9hDEOZUCmihBUghEH6LuaJsPJ+RBDT+I=;
        b=Rzu9IXDMHkmj0ukK0JbHZZfRiGG8FcdubPjF8ROFSRj73FjDGKuSo9TOPc1OZNJlrj
         Fiytea5NEune/JMTDjfdlndNfY43t0okw1hv6+FG+n9XG3XV/d77l5wzkxemGctHNwOw
         zjv2loywGXrBl269O4xK/ravWvcHvY8YE4WA03nEe3KIxQzfryVuO/mAb2Igr1TElKsN
         3YIPW2HqBwhWPE+0lU8tuxQsHnOjqw0cQLN3JIcuTdGNKy1FMNGOGucXkF5JcJajgN2F
         imcNUbcmyQvvGzhReaz/jfSADdToCLwmHIlsLMq0L6yH1wiV9LJ/00nJtaB+Xoo2MKb7
         UhWA==
X-Gm-Message-State: ACrzQf2aDqQHs1BVhXSV5o1Ih3Lmyxl0UW5/V0sRdDHPG39ZYQ5rm+8f
	d7OS0BdknvbBMljycKu/i5Qv9q2hYjj+Ig==
X-Google-Smtp-Source: AMsMyM4jbwJBH9/KA7yuA+aWNSWhwZqGyrtNeoPNi1T9QPhwZLiMgk1/cvQpoKtdDEHGUxkZuzOUWA==
X-Received: by 2002:a63:5144:0:b0:43b:ed4b:224 with SMTP id r4-20020a635144000000b0043bed4b0224mr23144492pgl.594.1664252727543;
        Mon, 26 Sep 2022 21:25:27 -0700 (PDT)
Received: from localhost (193-116-92-8.tpgi.com.au. [193.116.92.8])
        by smtp.gmail.com with ESMTPSA id y24-20020a634958000000b0043941566481sm353486pgk.39.2022.09.26.21.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 21:25:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Sep 2022 14:25:14 +1000
Message-Id: <CN6WCMKCWHOG.LT2QV3910UJ2@bobo>
Subject: Re: [PATCH linux-next][RFC] powerpc: avoid lockdep when we are
 offline
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Zhouyi Zhou" <zhouzhouyi@gmail.com>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>, <atrajeev@linux.vnet.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <lance@osuosl.org>, <paulmck@kernel.org>, <rcu@vger.kernel.org>
X-Mailer: aerc 0.11.0
References: <20220927014823.11439-1-zhouzhouyi@gmail.com>
In-Reply-To: <20220927014823.11439-1-zhouzhouyi@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Sep 27, 2022 at 11:48 AM AEST, Zhouyi Zhou wrote:
> This is second version of my fix to PPC's  "WARNING: suspicious RCU usage=
",
> I improved my fix under Paul E. McKenney's guidance:
> Link: https://lore.kernel.org/lkml/20220914021528.15946-1-zhouzhouyi@gmai=
l.com/T/
>
> During the cpu offlining, the sub functions of xive_teardown_cpu will
> call __lock_acquire when CONFIG_LOCKDEP=3Dy. The latter function will
> travel RCU protected list, so "WARNING: suspicious RCU usage" will be
> triggered.
>
> Avoid lockdep when we are offline.

I don't see how this is safe. If RCU is no longer watching the CPU then
the memory it is accessing here could be concurrently freed. I think the
warning is valid.

powerpc's problem is that cpuhp_report_idle_dead() is called before
arch_cpu_idle_dead(), so it must not rely on any RCU protection there.
I would say xive cleanup just needs to be done earlier. I wonder why it
is not done in __cpu_disable or thereabouts, that's where the interrupt
controller is supposed to be stopped.

Thanks,
Nick

>
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Dear PPC and RCU developers
>
> I found this bug when trying to do rcutorture tests in ppc VM of
> Open Source Lab of Oregon State University
>
> console.log report following bug:
> [   37.635545][    T0] WARNING: suspicious RCU usage^M
> [   37.636409][    T0] 6.0.0-rc4-next-20220907-dirty #8 Not tainted^M
> [   37.637575][    T0] -----------------------------^M
> [   37.638306][    T0] kernel/locking/lockdep.c:3723 RCU-list traversed i=
n non-reader section!!^M
> [   37.639651][    T0] ^M
> [   37.639651][    T0] other info that might help us debug this:^M
> [   37.639651][    T0] ^M
> [   37.641381][    T0] ^M
> [   37.641381][    T0] RCU used illegally from offline CPU!^M
> [   37.641381][    T0] rcu_scheduler_active =3D 2, debug_locks =3D 1^M
> [   37.667170][    T0] no locks held by swapper/6/0.^M
> [   37.668328][    T0] ^M
> [   37.668328][    T0] stack backtrace:^M
> [   37.669995][    T0] CPU: 6 PID: 0 Comm: swapper/6 Not tainted 6.0.0-rc=
4-next-20220907-dirty #8^M
> [   37.672777][    T0] Call Trace:^M
> [   37.673729][    T0] [c000000004653920] [c00000000097f9b4] dump_stack_l=
vl+0x98/0xe0 (unreliable)^M
> [   37.678579][    T0] [c000000004653960] [c0000000001f2eb8] lockdep_rcu_=
suspicious+0x148/0x16c^M
> [   37.680425][    T0] [c0000000046539f0] [c0000000001ed9b4] __lock_acqui=
re+0x10f4/0x26e0^M
> [   37.682450][    T0] [c000000004653b30] [c0000000001efc2c] lock_acquire=
+0x12c/0x420^M
> [   37.684113][    T0] [c000000004653c20] [c0000000010d704c] _raw_spin_lo=
ck_irqsave+0x6c/0xc0^M
> [   37.686154][    T0] [c000000004653c60] [c0000000000c7b4c] xive_spapr_p=
ut_ipi+0xcc/0x150^M
> [   37.687879][    T0] [c000000004653ca0] [c0000000010c72a8] xive_cleanup=
_cpu_ipi+0xc8/0xf0^M
> [   37.689856][    T0] [c000000004653cf0] [c0000000010c7370] xive_teardow=
n_cpu+0xa0/0xf0^M
> [   37.691877][    T0] [c000000004653d30] [c0000000000fba5c] pseries_cpu_=
offline_self+0x5c/0x100^M
> [   37.693882][    T0] [c000000004653da0] [c00000000005d2c4] arch_cpu_idl=
e_dead+0x44/0x60^M
> [   37.695739][    T0] [c000000004653dc0] [c0000000001c740c] do_idle+0x16=
c/0x3d0^M
> [   37.697536][    T0] [c000000004653e70] [c0000000001c7a1c] cpu_startup_=
entry+0x3c/0x40^M
> [   37.699694][    T0] [c000000004653ea0] [c00000000005ca20] start_second=
ary+0x6c0/0xb50^M
> [   37.701742][    T0] [c000000004653f90] [c00000000000d054] start_second=
ary_prolog+0x10/0x14^M
>
>
> Tested on PPC VM of Open Source Lab of Oregon State University.
> Test results show that although "WARNING: suspicious RCU usage" has gone,
> and there are less "BUG: soft lockup" reports than the original kernel
> (9 vs 13), which sounds good ;-)
>
> But after my modification, results-rcutorture-kasan/SRCU-P/console.log.di=
ags
> shows a new warning:
> [  222.289242][  T110] WARNING: CPU: 6 PID: 110 at kernel/rcu/rcutorture.=
c:2806 rcu_torture_fwd_prog+0xc88/0xdd0
>
> I guess above new warning also exits in original kernel, so I write a tin=
y test script as follows:
>
> #!/bin/sh
>
> COUNTER=3D0
> while [ $COUNTER -lt 1000 ] ; do
>     qemu-system-ppc64 -nographic -smp cores=3D8,threads=3D1 -net none -M =
pseries -nodefaults -device spapr-vscsi -serial file:/tmp/console.log -m 2G=
 -kernel /tmp/vmlinux -append "debug_boot_weak_hash panic=3D-1 console=3Dtt=
yS0 rcupdate.rcu_cpu_stall_suppress_at_boot=3D1 torture.disable_onoff_at_bo=
ot rcupdate.rcu_task_stall_timeout=3D30000 rcutorture.torture_type=3Dsrcud =
rcupdate.rcu_self_test=3D1 rcutorture.fwd_progress=3D3 srcutree.big_cpu_lim=
=3D5 rcutorture.onoff_interval=3D1000 rcutorture.onoff_holdoff=3D30 rcutort=
ure.n_barrier_cbs=3D4 rcutorture.stat_interval=3D15 rcutorture.shutdown_sec=
s=3D420 rcutorture.test_no_idle_hz=3D1 rcutorture.verbose=3D1"&
>     qemu_pid=3D$!
>     cd ~/next1/linux-next
>     make clean
> #I use "make vmlinux -j 8" to create heavy background jitter
>     make vmlinux -j 8  > /dev/null 2>&1=20
>     make_pid=3D$!
>     wait $qemu_pid
>     kill $qemu_pid
>     kill $make_id
>     if grep -q WARN /tmp/console.log;
>     then
>         echo $COUNTER > /tmp/counter
>         exit
>     fi
>     COUNTER=3D$(($COUNTER+1))
> done
>
> Above test shows that original kernel also warn about
> "WARNING: CPU: 6 PID: 110 at kernel/rcu/rcutorture.c:2806 rcu_torture_fwd=
_prog+0xc88/0xdd0"
>
> But I am not very sure about my results, so I still add a [RFC] to my sub=
ject line.
>
> Thank all of you for your guidance and encouragement ;-)
>
> Cheers
> Zhouyi
> --
>  arch/powerpc/platforms/pseries/hotplug-cpu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/=
platforms/pseries/hotplug-cpu.c
> index e0a7ac5db15d..e47098f00da1 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -64,10 +64,15 @@ static void pseries_cpu_offline_self(void)
> =20
>  	local_irq_disable();
>  	idle_task_exit();
> +	/* prevent lockdep code from traveling RCU protected list
> +	 * when we are offline.
> +	 */
> +	lockdep_off();
>  	if (xive_enabled())
>  		xive_teardown_cpu();
>  	else
>  		xics_teardown_cpu();
> +	lockdep_on();
> =20
>  	unregister_slb_shadow(hwcpu);
>  	rtas_stop_self();
> --=20
> 2.25.1

