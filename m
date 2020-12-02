Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FC32CBFEC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 15:42:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmMBs4BprzDqyp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 01:42:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=urezki@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AkoFLeZX; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmM7l29YxzDr42
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 01:40:02 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id j10so4008297lja.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Dec 2020 06:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DHlhaZVKNEfUqVr4P1bEw/d7LEH+sY+B1nqmO86+hj8=;
 b=AkoFLeZX5Id98EQJ8bKI8lYAojpkc0WxLzsSSLjL26B4fYUOTfBoROHcWrq3nXLjnO
 a81UsU+6YxeHM2THau3E6qCAob+gKHnjICQyIJC3Eb9342Vb0VEmC6IJkZjP2ZvyAJHs
 5zLLEe/pHull3SrGxm0samdUBwI0RjlW/QDiuo2oxErzdnwwHkQkVJdlVhGSVyQ3mc9J
 /+wTmdpXwB+cEBJATZ44Xj+XRVndSRhqQ0WtRxjDOUEJm1S7sptGvgtHFxsoRWprOpbD
 /aJo/ruq63LcCl4USm+UGOqfAyVHkvOemFn9ICnohvQUBhH9nagMFpjlZsD/CQB20K84
 LMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DHlhaZVKNEfUqVr4P1bEw/d7LEH+sY+B1nqmO86+hj8=;
 b=BB+x728eUu3x/8VwKe0XfmR5fnTUIF1aPjouIKQTOmzsJ5lXoVhtrMVm7Mb/jbuZ7l
 CQHATQdCa/YxbelCKlN95B6V2uk0NeCewGTKg12NZBue5b573Wmk58AuAGT60MeiD855
 El840HIYyinP6DdkH8tRWDOudpUwgV8uNXpwf61QO0f9DxCKow/qf1OyhUM2if4h5k4C
 2hBGK7glvF9EpFryQw7JHz6OgG5B/EKfAwT2uW+dUNG7g0jUiPyf9xlmZkYehf1FLkxX
 jkHGeEaCYwreYBTUkMDhHCSX/1JE6iPdQYnIK5AnCcmNHi6GoMnSr97inyNXVj7Uc38Q
 IaTw==
X-Gm-Message-State: AOAM532F4SBrXMtgTWKI4IFDiBKlZsdHrX8o3y2fV8N9ipeVQBvI37Wj
 IN/VL4wIAEdsVLAnXy70DEU=
X-Google-Smtp-Source: ABdhPJwmln5I7Uxw4a2UqKIDd2kKrfBNReZjZ4o03yPhl5BBMud8JPHJ3uMFCATipZXUzVBkaurgEw==
X-Received: by 2002:a2e:885a:: with SMTP id z26mr1268261ljj.58.1606919998046; 
 Wed, 02 Dec 2020 06:39:58 -0800 (PST)
Received: from pc636 (h5ef52e3d.seluork.dyn.perspektivbredband.net.
 [94.245.46.61])
 by smtp.gmail.com with ESMTPSA id 8sm490364lfz.66.2020.12.02.06.39.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 06:39:57 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 2 Dec 2020 15:39:55 +0100
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: powerpc 5.10-rcN boot failures with RCU_SCALE_TEST=m
Message-ID: <20201202143955.GA12300@pc636>
References: <87eekfh80a.fsf@dja-thinkpad.axtens.net>
 <87v9dkuwy3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9dkuwy3.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: rcu@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "Paul E . McKenney" <paulmck@kernel.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 03, 2020 at 01:03:32AM +1100, Michael Ellerman wrote:
> Daniel Axtens <dja@axtens.net> writes:
> > Hi all,
> >
> > I'm having some difficulty tracking down a bug.
> >
> > Some configurations of the powerpc kernel since somewhere in the 5.10
> > merge window fail to boot on some ppc64 systems. They hang while trying
> > to bring up SMP. It seems to depend on the RCU_SCALE/PERF_TEST option.
> > (It was renamed in the 5.10 merge window.)
> >
> > I can reproduce it as follows with qemu tcg:
> >
> > make -j64 pseries_le_defconfig
> > scripts/config -m RCU_SCALE_TEST
> > scripts/config -m RCU_PERF_TEST
> > make -j 64 vmlinux CC="ccache gcc"
> >
> > qemu-system-ppc64 -cpu power9 -M pseries -m 1G -nographic -vga none -smp 4 -kernel vmlinux
> >
> > ...
> > [    0.036284][    T0] Mount-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
> > [    0.036481][    T0] Mountpoint-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
> > [    0.148168][    T1] POWER9 performance monitor hardware support registered
> > [    0.151118][    T1] rcu: Hierarchical SRCU implementation.
> > [    0.186660][    T1] smp: Bringing up secondary CPUs ...
> > <hangs>
> 
> One does not simply hang :)
> 
> > I have no idea why RCU_SCALE/PERF_TEST would be causing this, but that
> > seems to be what does it: if I don't set that, the kernel boots fine.
> 
> It seems to be TASKS_RCU that is the key.
> 
> I don't need RCU_SCALE_TEST enabled, I can trigger it just with the
> following applied:
> 
> diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
> index 0ebe15a84985..f3500c95d6a1 100644
> --- a/kernel/rcu/Kconfig
> +++ b/kernel/rcu/Kconfig
> @@ -78,7 +78,7 @@ config TASKS_RCU_GENERIC
>  	  task-based RCU implementations.  Not for manual selection.
>  
>  config TASKS_RCU
> -	def_bool PREEMPTION
> +	def_bool y
>  	help
>  	  This option enables a task-based RCU implementation that uses
>  	  only voluntary context switch (not preemption!), idle, and
> 
> 
> And bisect points to:
>   36dadef23fcc ("kprobes: Init kprobes in early_initcall")
> 
> Which moved init_kprobes() prior to SMP bringup.
> 
> 
> For some reason when it gets stuck sysrq doesn't work, but I was able to
> get it into gdb and manually call handle_sysrq('t') to get the output
> below.
> 
> The SMP bringup stalls because _cpu_up() is blocked trying to take
> cpu_hotplug_lock for writing:
> 
> [  401.403132][    T0] task:swapper/0       state:D stack:12512 pid:    1 ppid:     0 flags:0x00000800
> [  401.403502][    T0] Call Trace:
> [  401.403907][    T0] [c0000000062c37d0] [c0000000062c3830] 0xc0000000062c3830 (unreliable)
> [  401.404068][    T0] [c0000000062c39b0] [c000000000019d70] __switch_to+0x2e0/0x4a0
> [  401.404189][    T0] [c0000000062c3a10] [c000000000b87228] __schedule+0x288/0x9b0
> [  401.404257][    T0] [c0000000062c3ad0] [c000000000b879b8] schedule+0x68/0x120
> [  401.404324][    T0] [c0000000062c3b00] [c000000000184ad4] percpu_down_write+0x164/0x170
> [  401.404390][    T0] [c0000000062c3b50] [c000000000116b68] _cpu_up+0x68/0x280
> [  401.404475][    T0] [c0000000062c3bb0] [c000000000116e70] cpu_up+0xf0/0x140
> [  401.404546][    T0] [c0000000062c3c30] [c00000000011776c] bringup_nonboot_cpus+0xac/0xf0
> [  401.404643][    T0] [c0000000062c3c80] [c000000000eea1b8] smp_init+0x40/0xcc
> [  401.404727][    T0] [c0000000062c3ce0] [c000000000ec43dc] kernel_init_freeable+0x1e0/0x3a0
> [  401.404799][    T0] [c0000000062c3db0] [c000000000011ec4] kernel_init+0x24/0x150
> [  401.404958][    T0] [c0000000062c3e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
> 
> It can't get it because kprobe_optimizer() has taken it for read and is now
> blocked waiting for synchronize_rcu_tasks():
> 
> [  401.418808][    T0] task:kworker/0:1     state:D stack:13392 pid:   12 ppid:     2 flags:0x00000800
> [  401.418951][    T0] Workqueue: events kprobe_optimizer
> [  401.419078][    T0] Call Trace:
> [  401.419121][    T0] [c0000000062ef650] [c0000000062ef710] 0xc0000000062ef710 (unreliable)
> [  401.419213][    T0] [c0000000062ef830] [c000000000019d70] __switch_to+0x2e0/0x4a0
> [  401.419281][    T0] [c0000000062ef890] [c000000000b87228] __schedule+0x288/0x9b0
> [  401.419347][    T0] [c0000000062ef950] [c000000000b879b8] schedule+0x68/0x120
> [  401.419415][    T0] [c0000000062ef980] [c000000000b8e664] schedule_timeout+0x2a4/0x340
> [  401.419484][    T0] [c0000000062efa80] [c000000000b894ec] wait_for_completion+0x9c/0x170
> [  401.419552][    T0] [c0000000062efae0] [c0000000001ac85c] __wait_rcu_gp+0x19c/0x210
> [  401.419619][    T0] [c0000000062efb40] [c0000000001ac90c] synchronize_rcu_tasks_generic+0x3c/0x70
> [  401.419690][    T0] [c0000000062efbe0] [c00000000022a3dc] kprobe_optimizer+0x1dc/0x470
> [  401.419757][    T0] [c0000000062efc60] [c000000000136684] process_one_work+0x2f4/0x530
> [  401.419823][    T0] [c0000000062efd20] [c000000000138d28] worker_thread+0x78/0x570
> [  401.419891][    T0] [c0000000062efdb0] [c000000000142424] kthread+0x194/0x1a0
> [  401.419976][    T0] [c0000000062efe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
> 
> But why is the synchronize_rcu_tasks() not completing?
> 
I think that it is because RCU is not fully initialized by that time.

The 36dadef23fcc ("kprobes: Init kprobes in early_initcall") patch
switches to early_initcall() that has a higher priority sequence than
core_initcall() that is used to complete an RCU setup in the rcu_set_runtime_mode().

--
Vlad Rezki
