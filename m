Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A15A95FC720
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 16:19:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnZXX4C0kz3c2g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 01:19:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bm355Ctd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bm355Ctd;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnZWY6RHFz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 01:18:33 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id y1so9486922pfr.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 07:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvAcGLtt6Cfb3BGCG2urxrj4E9S/TnAlrCGOKagFlro=;
        b=Bm355Ctd3ShfR0c7dUkErA5orrH0Id+tTW+ZWvOAXDwcQa7kufHkK8izXEtrZX348N
         pQBo78SBIIWRDKcDocx6CnBAG9wkJd1JU79NMYX31KdkjHD/HuW1uGJoNbpN0wKNizHF
         nKyKpx6D/tDiSISI9XcQKGdZiHV3yn1RoUpyI5fEC7k8MElFiW2lxZ3gUEjSXoMKlZNa
         zJ9/Vq7wD6ZrNKpl7nIB0Z4qm3HJH9lHnDZoJ/b8gngmZSLDXUES5TMXfyuLjaFUp4uW
         lLUF1ZXM2leydhXVU+sEPJkZJoH9XP4kRfnQEOZ7sCs9WR4hBI3ZHMtCotQZdbYr7DDf
         QxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvAcGLtt6Cfb3BGCG2urxrj4E9S/TnAlrCGOKagFlro=;
        b=5oy7effzuIQh3qWtU7DjwR5w+NoPKgmkmPn9uwHlxAxd9KtmMrK/DSnXtKHYJC1KE1
         5KF1ncjSDlmelX6EsbP6v1LBz+PQ9SLq5fzeBQe0eNn9JYneR32SvIs+yvMX0AhUQ7pN
         9vTs36vMtQkuvQz67bzMSnc0EJW7XpjtPMD8knN2Y9bQPitk2YAQE24sqEr5cESzYAS7
         kB3Uwg5ab6NAVdm3J25dhiZHZuPIrESQMXvMeSCcgMp9yz7Zqhj2lbgF94Nh/X+SMs1A
         7X3bjbqA/x6ZJ2r9GJ35Mwny0OWkLwspQc2INm8o7JWebLtcEVrZCADfDj0+QD+giBv9
         7lRw==
X-Gm-Message-State: ACrzQf0GRntxQlZ38r/3WUWaV2pGlLnC9j6Tdh4IVZVrkkMt7rBth8Cs
	w0412lxOGVK3w0AqRgHxXKc=
X-Google-Smtp-Source: AMsMyM5AhzgCIJQ9kT5JAogHTs04xAYzFZdRQck3a0Tlat7OQuvrrYzzbddhmdEnvz5Ykpxs7OrePw==
X-Received: by 2002:a63:3155:0:b0:45a:553a:3479 with SMTP id x82-20020a633155000000b0045a553a3479mr25694349pgx.408.1665584309826;
        Wed, 12 Oct 2022 07:18:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cp17-20020a170902e79100b00176b3c9693esm10609102plb.299.2022.10.12.07.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 07:18:28 -0700 (PDT)
Date: Wed, 12 Oct 2022 07:18:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Message-ID: <20221012141827.GA2405914@roeck-us.net>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87edvhntv0.fsf@mpe.ellerman.id.au>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 09, 2022 at 10:01:39PM +1100, Michael Ellerman wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
> 
> Hi Linus,
> 
> Please pull powerpc updates for 6.1.
> 
> No conflicts with your tree. There will be a conflict when you merge the kbuild tree, due
> to us renaming head_fsl_booke.S to head_85xx.S. The resolution is mostly trivial,
> linux-next has the correct result if it's unclear.
> 

Post-merge problems are much more exciting when trying to run mac99
emulations in qemu.

Enabling KFENCE results in log messages such as

================================
WARNING: inconsistent lock state
6.0.0-rc2-00163-ga5edf9815dd7 #1 Tainted: G                 N
--------------------------------
inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
swapper/0/1 [HC0[0]:SC0[0]:HE1:SE1] takes:
c000000002734d68 (native_tlbie_lock){+.?.}-{2:2}, at: .native_hpte_updateboltedpp+0x1a4/0x600
{IN-SOFTIRQ-W} state was registered at:
  .lock_acquire+0x20c/0x520
  ._raw_spin_lock+0x4c/0x70
  .native_hpte_invalidate+0x62c/0x840
  .hash__kernel_map_pages+0x450/0x640
  .kfence_protect+0x58/0xc0
  .kfence_guarded_free+0x374/0x5a0
  .__slab_free+0x340/0x670
  .__d_free+0x2c/0x50
  .rcu_core+0x3f4/0x1750
  .__do_softirq+0x1dc/0x7dc
  .do_softirq_own_stack+0x40/0x60
  0xc00000000775bca0
  .irq_exit+0x1e8/0x220
  .timer_interrupt+0x284/0x700
  decrementer_common_virt+0x208/0x210
irq event stamp: 243607
hardirqs last  enabled at (243607): [<c0000000003bd424>] .__slab_free+0x324/0x670
hardirqs last disabled at (243606): [<c0000000003bd2f4>] .__slab_free+0x1f4/0x670
softirqs last  enabled at (242982): [<c0000000010a387c>] .__do_softirq+0x7ac/0x7dc
softirqs last disabled at (242973): [<c000000000014b20>] .do_softirq_own_stack+0x40/0x60

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(native_tlbie_lock);
  <Interrupt>
    lock(native_tlbie_lock);

 *** DEADLOCK ***

and, indeed, there appear to be various deadlocks.

I had to disable KFENCE to be able to test further (or maybe KFENCE works
and points out the soft lockup problem observed below - hard for me to
determine).

>       powerpc/pseries: Move dtl scanning and steal time accounting to pseries platform

With this patch, CONFIG_DTL must be enabled if CONFIG_PPC_SPLPAR is enabled.
CONFIG_PPC_SPLPAR=y and CONFIG_DTL=n results in build failures due to

irq.c:(.text+0x2798): undefined reference to `.pseries_accumulate_stolen_time'

and many similar errors.

I had to enable CONFIG_DTL explicitly to be able to build my test images.
CONFIG_PPC_SPLPAR now depends on or requires CONFIG_DTL which in turn
depends on CONFIG_DEBUG_FS. That seems odd.

With all this worked around, I still get soft lockup problems when trying to boot
from SDHCI. I have not been able to bisect this problem.

BUG: soft lockup - CPU#0 stuck for 23s! [dd:111]
Modules linked in:
CPU: 0 PID: 111 Comm: dd Not tainted 6.0.0-10822-g60bb8154d1d7 #1
Hardware name: PowerMac3,1 PPC970FX 0x3c0301 PowerMac
NIP:  c000000000031630 LR: c000000000031964 CTR: 0000000000000000
REGS: c000000007df36a8 TRAP: 0900   Not tainted  (6.0.0-10822-g60bb8154d1d7)
MSR:  800000000000b032 <SF,EE,FP,ME,IR,DR,RI>  CR: 28002228  XER: 00000000
IRQMASK: 0
GPR00: c000000000031964 c000000007df3870 c0000000013e5500 c000000007df36a8
GPR04: c00000000125dd80 0000000000000000 c000000007df3814 c00000000291d018
GPR08: c000000002d4bbb8 0000000000000000 c000000007365100 c000000002d21098
GPR12: 0000000028002222 c000000002e20000 00000000100d32e0 00000000100d32b4
GPR16: 00000000100d3301 00000000100d32b9 00000000100d3358 00000000100d32bf
GPR20: 0000000000002000 00000000100d3372 00000000100d331e c000000007365918
GPR24: 0000000000000000 0000000000000e60 0000000000000900 0000000000000500
GPR28: 0000000000000a00 0000000000000f00 0000000000000002 0000000000000003
NIP [c000000000031630] .replay_soft_interrupts+0x60/0x300
LR [c000000000031964] .arch_local_irq_restore+0x94/0x1c0
Call Trace:
[c000000007df3870] [c000000000031964] .arch_local_irq_restore+0x94/0x1c0 (unreliable)
[c000000007df38f0] [c000000000f8a444] .__schedule+0x664/0xa50
[c000000007df39d0] [c000000000f8a8b0] .schedule+0x80/0x140
[c000000007df3a50] [c00000000092f0dc] .try_to_generate_entropy+0x118/0x174
[c000000007df3b40] [c00000000092e2e4] .urandom_read_iter+0x74/0x140
[c000000007df3bc0] [c0000000003b0044] .vfs_read+0x284/0x2d0
[c000000007df3cd0] [c0000000003b0d2c] .ksys_read+0xdc/0x130
[c000000007df3d80] [c00000000002a88c] .system_call_exception+0x19c/0x330
[c000000007df3e10] [c00000000000c1d4] system_call_common+0xf4/0x258
--- interrupt: c00 at 0x7fff829fd49c
NIP:  00007fff829fd49c LR: 000000001000da90 CTR: 0000000000000000
REGS: c000000007df3e80 TRAP: 0c00   Not tainted  (6.0.0-10822-g60bb8154d1d7)
MSR:  800000000000f032 <SF,EE,PR,FP,ME,IR,DR,RI>  CR: 22002422  XER: 00000000
IRQMASK: 0
GPR00: 0000000000000003 00007ffff138df70 00007fff82af7300 0000000000000000
GPR04: 00000000101102a0 0000000000000020 0000000000000000 0000000000000000
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR12: 0000000000000000 00007fff82bcaac0 00000000100d32e0 00000000100d32b4
GPR16: 00000000100d3301 00000000100d32b9 00000000100d3358 00000000100d32bf
GPR20: 0000000000002000 00000000100d3372 00000000100d331e 0000000000000000
GPR24: 7fffffffffffffff 00000000100b3a9c 00000000101102a0 0000000000000020
GPR28: 00000000101025c0 0000000000000020 0000000000000000 0000000000000000
NIP [00007fff829fd49c] 0x7fff829fd49c
LR [000000001000da90] 0x1000da90
--- interrupt: c00
Instruction dump:
3b600500 3b800a00 3ba00f00 f8010010 f821fdc1 60000000 60000000 38610078
e92d0af8 f92101f8 39200000 48039745 <60000000> 39000000 e9410180 892d0933
Kernel panic - not syncing: softlockup: hung tasks
CPU: 0 PID: 111 Comm: dd Tainted: G             L     6.0.0-10822-g60bb8154d1d7 #1
Hardware name: PowerMac3,1 PPC970FX 0x3c0301 PowerMac
Call Trace:
[c000000007df3180] [c000000000f584c0] .dump_stack_lvl+0x7c/0xc4 (unreliable)
[c000000007df3210] [c0000000000d5b58] .panic+0x174/0x42c
[c000000007df32c0] [c000000000231054] .watchdog_timer_fn+0x3a4/0x3e0
[c000000007df3380] [c0000000001cc65c] .__hrtimer_run_queues+0x1fc/0x650
[c000000007df3490] [c0000000001cd5cc] .hrtimer_interrupt+0x11c/0x320
[c000000007df3550] [c000000000021f5c] .timer_interrupt+0x1cc/0x600
[c000000007df3630] [c0000000000316c8] .replay_soft_interrupts+0xf8/0x300
[c000000007df3870] [c000000000031964] .arch_local_irq_restore+0x94/0x1c0
[c000000007df38f0] [c000000000f8a444] .__schedule+0x664/0xa50
[c000000007df39d0] [c000000000f8a8b0] .schedule+0x80/0x140
[c000000007df3a50] [c00000000092f0dc] .try_to_generate_entropy+0x118/0x174
[c000000007df3b40] [c00000000092e2e4] .urandom_read_iter+0x74/0x140
[c000000007df3bc0] [c0000000003b0044] .vfs_read+0x284/0x2d0
[c000000007df3cd0] [c0000000003b0d2c] .ksys_read+0xdc/0x130
[c000000007df3d80] [c00000000002a88c] .system_call_exception+0x19c/0x330
[c000000007df3e10] [c00000000000c1d4] system_call_common+0xf4/0x258
--- interrupt: c00 at 0x7fff829fd49c
NIP:  00007fff829fd49c LR: 000000001000da90 CTR: 0000000000000000
REGS: c000000007df3e80 TRAP: 0c00   Tainted: G             L      (6.0.0-10822-g60bb8154d1d7)
MSR:  800000000000f032 <SF,EE,PR,FP,ME,IR,DR,RI>  CR: 22002422  XER: 00000000
IRQMASK: 0
GPR00: 0000000000000003 00007ffff138df70 00007fff82af7300 0000000000000000
GPR04: 00000000101102a0 0000000000000020 0000000000000000 0000000000000000
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR12: 0000000000000000 00007fff82bcaac0 00000000100d32e0 00000000100d32b4
GPR16: 00000000100d3301 00000000100d32b9 00000000100d3358 00000000100d32bf
GPR20: 0000000000002000 00000000100d3372 00000000100d331e 0000000000000000
GPR24: 7fffffffffffffff 00000000100b3a9c 00000000101102a0 0000000000000020
GPR28: 00000000101025c0 0000000000000020 0000000000000000 0000000000000000
NIP [00007fff829fd49c] 0x7fff829fd49c
LR [000000001000da90] 0x1000da90
--- interrupt: c00

Guenter
