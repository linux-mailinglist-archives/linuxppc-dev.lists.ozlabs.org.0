Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F41502CD94F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 15:38:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cmz3M3f3dzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 01:38:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=urezki@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YECvWSHc; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmyzL5qzbzDr7M
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 01:34:51 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id a1so1412098ljq.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Dec 2020 06:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OAGSbbnxeP5a3A1okDwrCv5FWNN6LaKgL8wXrABXm7Y=;
 b=YECvWSHcc306CUnahLtYRBS/6dz+Rx5eMAvoL7WH3g3YAep5JTY3iRwkg2dborVs6s
 XRkr0782hDXSfbL0bMrUcrWrDKpUDFjEaApXnQB3HIbutlTyjWV7yYk3CGXa1UKJM5kc
 cHqkrRMI8kcoi1J+Yk0QoIC/3MKSDLHHoML8YDz4oxfNydrewhXo1CMIzhG4GAh0sRkC
 +MHAhP3fRj5avp4VxgtjICbSM5sYXVPObTjR8piZjWuyhqN50zmsFOZfMWRfm1Y4jQjI
 MBcJ83yutaNS2X1Zq4z+xesXhOH33wnh1Z/qlNar9usblAm6Q0Z+clUT30eMzFVepZos
 LksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OAGSbbnxeP5a3A1okDwrCv5FWNN6LaKgL8wXrABXm7Y=;
 b=S9o2UaQUskkxggpPDJfIDDBYbxinO7OSD6P0za1yomjW3VCmumCcCZ8kaqeVGjWH4b
 eiYtK9j5+ScDeQnY+Ju8cZcm4O+qVPFZNzNPM3KQeob/WWBSrrf3yjCTjCHdK3IrqOhv
 LVaK3u550i8+vkdqV6nMkqzveqfPq9HrQeeFujwvA4BbNkYoT30Jjyyrfckjqj9HBFZ4
 2cJ2QZVXDP4Xa0m8SAnXZh3MSChCP1rA97joh8s/SIiLLyN3i49TsxIxafMHOsOlZqJa
 VnVa7QrGuSqLOsusw5zORH9qvqtQpLiaElM4LwyuhttPWncaKbEROvOhgnjUAVNyCpir
 p/PQ==
X-Gm-Message-State: AOAM532zNSr5FJPdW5YZQT6ZnIRGH2QHUujRLlXDJG4tJnbD+IyiZm2z
 4EmPh2iwYkBIo9A/MzsJMU4=
X-Google-Smtp-Source: ABdhPJyLdlhLM99TE1g36vvj7IjGLrf5sJBwQct07DvCoiB6j36xJBBycfmWcEwpP90NNMOFwSJCWQ==
X-Received: by 2002:a05:651c:1051:: with SMTP id
 x17mr1434696ljm.56.1607006088126; 
 Thu, 03 Dec 2020 06:34:48 -0800 (PST)
Received: from pc636 (h5ef52e3d.seluork.dyn.perspektivbredband.net.
 [94.245.46.61])
 by smtp.gmail.com with ESMTPSA id m13sm587971lfb.14.2020.12.03.06.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 06:34:47 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 3 Dec 2020 15:34:45 +0100
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: powerpc 5.10-rcN boot failures with RCU_SCALE_TEST=m
Message-ID: <20201203143445.GA22204@pc636>
References: <87eekfh80a.fsf@dja-thinkpad.axtens.net>
 <87v9dkuwy3.fsf@mpe.ellerman.id.au> <20201202143955.GA12300@pc636>
 <87sg8nv277.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sg8nv277.fsf@mpe.ellerman.id.au>
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
Cc: rcu@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "Paul E . McKenney" <paulmck@kernel.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 03, 2020 at 05:22:20PM +1100, Michael Ellerman wrote:
> Uladzislau Rezki <urezki@gmail.com> writes:
> > On Thu, Dec 03, 2020 at 01:03:32AM +1100, Michael Ellerman wrote:
> ...
> >> 
> >> The SMP bringup stalls because _cpu_up() is blocked trying to take
> >> cpu_hotplug_lock for writing:
> >> 
> >> [  401.403132][    T0] task:swapper/0       state:D stack:12512 pid:    1 ppid:     0 flags:0x00000800
> >> [  401.403502][    T0] Call Trace:
> >> [  401.403907][    T0] [c0000000062c37d0] [c0000000062c3830] 0xc0000000062c3830 (unreliable)
> >> [  401.404068][    T0] [c0000000062c39b0] [c000000000019d70] __switch_to+0x2e0/0x4a0
> >> [  401.404189][    T0] [c0000000062c3a10] [c000000000b87228] __schedule+0x288/0x9b0
> >> [  401.404257][    T0] [c0000000062c3ad0] [c000000000b879b8] schedule+0x68/0x120
> >> [  401.404324][    T0] [c0000000062c3b00] [c000000000184ad4] percpu_down_write+0x164/0x170
> >> [  401.404390][    T0] [c0000000062c3b50] [c000000000116b68] _cpu_up+0x68/0x280
> >> [  401.404475][    T0] [c0000000062c3bb0] [c000000000116e70] cpu_up+0xf0/0x140
> >> [  401.404546][    T0] [c0000000062c3c30] [c00000000011776c] bringup_nonboot_cpus+0xac/0xf0
> >> [  401.404643][    T0] [c0000000062c3c80] [c000000000eea1b8] smp_init+0x40/0xcc
> >> [  401.404727][    T0] [c0000000062c3ce0] [c000000000ec43dc] kernel_init_freeable+0x1e0/0x3a0
> >> [  401.404799][    T0] [c0000000062c3db0] [c000000000011ec4] kernel_init+0x24/0x150
> >> [  401.404958][    T0] [c0000000062c3e20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
> >> 
> >> It can't get it because kprobe_optimizer() has taken it for read and is now
> >> blocked waiting for synchronize_rcu_tasks():
> >> 
> >> [  401.418808][    T0] task:kworker/0:1     state:D stack:13392 pid:   12 ppid:     2 flags:0x00000800
> >> [  401.418951][    T0] Workqueue: events kprobe_optimizer
> >> [  401.419078][    T0] Call Trace:
> >> [  401.419121][    T0] [c0000000062ef650] [c0000000062ef710] 0xc0000000062ef710 (unreliable)
> >> [  401.419213][    T0] [c0000000062ef830] [c000000000019d70] __switch_to+0x2e0/0x4a0
> >> [  401.419281][    T0] [c0000000062ef890] [c000000000b87228] __schedule+0x288/0x9b0
> >> [  401.419347][    T0] [c0000000062ef950] [c000000000b879b8] schedule+0x68/0x120
> >> [  401.419415][    T0] [c0000000062ef980] [c000000000b8e664] schedule_timeout+0x2a4/0x340
> >> [  401.419484][    T0] [c0000000062efa80] [c000000000b894ec] wait_for_completion+0x9c/0x170
> >> [  401.419552][    T0] [c0000000062efae0] [c0000000001ac85c] __wait_rcu_gp+0x19c/0x210
> >> [  401.419619][    T0] [c0000000062efb40] [c0000000001ac90c] synchronize_rcu_tasks_generic+0x3c/0x70
> >> [  401.419690][    T0] [c0000000062efbe0] [c00000000022a3dc] kprobe_optimizer+0x1dc/0x470
> >> [  401.419757][    T0] [c0000000062efc60] [c000000000136684] process_one_work+0x2f4/0x530
> >> [  401.419823][    T0] [c0000000062efd20] [c000000000138d28] worker_thread+0x78/0x570
> >> [  401.419891][    T0] [c0000000062efdb0] [c000000000142424] kthread+0x194/0x1a0
> >> [  401.419976][    T0] [c0000000062efe20] [c00000000000daf0] ret_from_kernel_thread+0x5c/0x6c
> >> 
> >> But why is the synchronize_rcu_tasks() not completing?
> >> 
> > I think that it is because RCU is not fully initialized by that time.
> 
> Yeah that would explain it :)
> 
> > The 36dadef23fcc ("kprobes: Init kprobes in early_initcall") patch
> > switches to early_initcall() that has a higher priority sequence than
> > core_initcall() that is used to complete an RCU setup in the rcu_set_runtime_mode().
> 
> I was looking at debug_lockdep_rcu_enabled(), which is:
> 
> noinstr int notrace debug_lockdep_rcu_enabled(void)
> {
> 	return rcu_scheduler_active != RCU_SCHEDULER_INACTIVE && debug_locks &&
> 	       current->lockdep_recursion == 0;
> }
> 
> That is not firing any warnings for me because rcu_scheduler_active is:
> 
> (gdb) p/x rcu_scheduler_active
> $1 = 0x1
> 
> Which is:
> 
> #define RCU_SCHEDULER_INIT	1
> 

Agree with that.

> But that's different to RCU_SCHEDULER_RUNNING, which is set in
> rcu_set_runtime_mode() as you mentioned:
> 
> static int __init rcu_set_runtime_mode(void)
> {
> 	rcu_test_sync_prims();
> 	rcu_scheduler_active = RCU_SCHEDULER_RUNNING;
> 	kfree_rcu_scheduler_running();
> 	rcu_test_sync_prims();
> 	return 0;
> }
> 
BTW, since you can reproduce it and have a test setup, could you please
check that:

<snip>
-core_initcall(rcu_set_runtime_mode);
+early_initcall(rcu_set_runtime_mode);
<snip>

Just in case. The the synchronize_rcu_tasks() gets blocked:

<snip>
void __wait_rcu_gp(bool checktiny, int n, call_rcu_func_t *crcu_array,
    if (crcu_array[j] == crcu_array[i])
                                break;
        if (j == i) {
            wait_for_completion(&rs_array[i].completion); <--- here
            destroy_rcu_head_on_stack(&rs_array[i].head);
        }
...
<snip>

but that is obvious when looking at your full traces.

> The comment on rcu_scheduler_active implies that once we're at
> RCU_SCHEDULER_INIT things should work:
> 
> /*
>  * The rcu_scheduler_active variable is initialized to the value
>  * RCU_SCHEDULER_INACTIVE and transitions RCU_SCHEDULER_INIT just before the
>  * first task is spawned.  So when this variable is RCU_SCHEDULER_INACTIVE,
>  * RCU can assume that there is but one task, allowing RCU to (for example)
>  * optimize synchronize_rcu() to a simple barrier().  When this variable
>  * is RCU_SCHEDULER_INIT, RCU must actually do all the hard work required
>  * to detect real grace periods.  This variable is also used to suppress
>  * boot-time false positives from lockdep-RCU error checking.  Finally, it
>  * transitions from RCU_SCHEDULER_INIT to RCU_SCHEDULER_RUNNING after RCU
>  * is fully initialized, including all of its kthreads having been spawned.
>  */
> 
> 
> So I'm not sure, the comments and the debug checks imply that it is OK
> for kprobes to be using RCU this early.
>
Sounds like it should be possible.

> 
> I guess I'll keep digging.
> 
Thank you! I also will dig further with that even though i do not have a setup
for reproducing it.

--
Vlad Rezki
