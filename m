Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 206EF77C54
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2019 00:48:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45x1MF0SL4zDqSJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2019 08:48:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bugzilla.kernel.org
 (client-ip=198.145.29.98; helo=mail.wl.linuxfoundation.org;
 envelope-from=bugzilla-daemon@bugzilla.kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45x1Km12QlzDqD0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 08:47:07 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 30E0C2898B
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2019 22:47:05 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 1E0FC28A08; Sat, 27 Jul 2019 22:47:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 200055] WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:3214
 .__lockdep_init_map+0x260/0x270
Date: Sat, 27 Jul 2019 22:47:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-200055-206035-tlHVbbYdYq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200055-206035@https.bugzilla.kernel.org/>
References: <bug-200055-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D200055

--- Comment #19 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 284001
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D284001&action=3Dedit
bisect.log

At last... I got the offending commit. Funnily enough it is about silencing
lockdep warnings. ;)

9e607f72748ddc5620aeeb8d1f32f30c79b360b9 is the first bad commit
commit 9e607f72748ddc5620aeeb8d1f32f30c79b360b9
Author: Denis Kirjanov <kda@linux-powerpc.org>
Date:   Wed Sep 21 14:34:58 2016 +0300

    i2c_powermac: shut up lockdep warning

    That's unclear why lockdep shows the following warning but adding a
    lockdep class to struct pmac_i2c_bus solves it

    [   20.507795] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    [   20.507796] [ INFO: possible circular locking dependency detected ]
    [   20.507800] 4.8.0-rc7-00037-gd2ffb01 #21 Not tainted
    [   20.507801] -------------------------------------------------------
    [   20.507803] swapper/0/1 is trying to acquire lock:
    [   20.507818]  (&bus->mutex){+.+.+.}, at: [<c000000000052830>]
.pmac_i2c_open+0x30/0x100
    [   20.507819]
    [   20.507819] but task is already holding lock:
    [   20.507829]  (&policy->rwsem){+.+.+.}, at: [<c00000000068adcc>]
.cpufreq_online+0x1ac/0x9d0
    [   20.507830]
    [   20.507830] which lock already depends on the new lock.
    [   20.507830]
    [   20.507832]
    [   20.507832] the existing dependency chain (in reverse order) is:
    [   20.507837]
    [   20.507837] -> #4 (&policy->rwsem){+.+.+.}:
    [   20.507844]        [<c00000000082385c>] .down_write+0x6c/0x110
    [   20.507849]        [<c00000000068adcc>] .cpufreq_online+0x1ac/0x9d0
    [   20.507855]        [<c0000000004d76d8>]
.subsys_interface_register+0xb8/0x110
    [   20.507860]        [<c000000000689bb0>]
.cpufreq_register_driver+0x1d0/0x250
    [   20.507866]        [<c000000000b4f8f4>] .g5_cpufreq_init+0x9cc/0xa28
    [   20.507872]        [<c00000000000a98c>] .do_one_initcall+0x5c/0x1d0
    [   20.507878]        [<c000000000b0f86c>]
.kernel_init_freeable+0x1ac/0x28c
    [   20.507883]        [<c00000000000b3bc>] .kernel_init+0x1c/0x140
    [   20.507887]        [<c0000000000098f4>]
.ret_from_kernel_thread+0x58/0x64
    [   20.507894]
    [   20.507894] -> #3 (subsys mutex#2){+.+.+.}:
    [   20.507899]        [<c000000000820448>] .mutex_lock_nested+0xa8/0x590
    [   20.507903]        [<c0000000004d7f24>] .bus_probe_device+0x44/0xe0
    [   20.507907]        [<c0000000004d5208>] .device_add+0x508/0x730
    [   20.507911]        [<c0000000004dd528>] .register_cpu+0x118/0x190
    [   20.507916]        [<c000000000b14450>] .topology_init+0x148/0x248
    [   20.507921]        [<c00000000000a98c>] .do_one_initcall+0x5c/0x1d0
    [   20.507925]        [<c000000000b0f86c>]
.kernel_init_freeable+0x1ac/0x28c
    [   20.507929]        [<c00000000000b3bc>] .kernel_init+0x1c/0x140
    [   20.507934]        [<c0000000000098f4>]
.ret_from_kernel_thread+0x58/0x64
    [   20.507939]
    [   20.507939] -> #2 (cpu_add_remove_lock){+.+.+.}:
    [   20.507944]        [<c000000000820448>] .mutex_lock_nested+0xa8/0x590
    [   20.507950]        [<c000000000087a9c>] .register_cpu_notifier+0x2c/=
0x70
    [   20.507955]        [<c000000000b267e0>] .spawn_ksoftirqd+0x18/0x4c
    [   20.507959]        [<c00000000000a98c>] .do_one_initcall+0x5c/0x1d0
    [   20.507964]        [<c000000000b0f770>] .kernel_init_freeable+0xb0/0=
x28c
    [   20.507968]        [<c00000000000b3bc>] .kernel_init+0x1c/0x140
    [   20.507972]        [<c0000000000098f4>]
.ret_from_kernel_thread+0x58/0x64
    [   20.507978]
    [   20.507978] -> #1 (&host->mutex){+.+.+.}:
    [   20.507982]        [<c000000000820448>] .mutex_lock_nested+0xa8/0x590
    [   20.507987]        [<c0000000000527e8>] .kw_i2c_open+0x18/0x30
    [   20.507991]        [<c000000000052894>] .pmac_i2c_open+0x94/0x100
    [   20.507995]        [<c000000000b220a0>] .smp_core99_probe+0x260/0x410
    [   20.507999]        [<c000000000b185bc>] .smp_prepare_cpus+0x280/0x2ac
    [   20.508003]        [<c000000000b0f748>] .kernel_init_freeable+0x88/0=
x28c
    [   20.508008]        [<c00000000000b3bc>] .kernel_init+0x1c/0x140
    [   20.508012]        [<c0000000000098f4>]
.ret_from_kernel_thread+0x58/0x64
    [   20.508018]
    [   20.508018] -> #0 (&bus->mutex){+.+.+.}:
    [   20.508023]        [<c0000000000ed5b4>] .lock_acquire+0x84/0x100
    [   20.508027]        [<c000000000820448>] .mutex_lock_nested+0xa8/0x590
    [   20.508032]        [<c000000000052830>] .pmac_i2c_open+0x30/0x100
    [   20.508037]        [<c000000000052e14>] .pmac_i2c_do_begin+0x34/0x120
    [   20.508040]        [<c000000000056bc0>] .pmf_call_one+0x50/0xd0
    [   20.508045]        [<c00000000068ff1c>] .g5_pfunc_switch_volt+0x2c/0=
xc0
    [   20.508050]        [<c00000000068fecc>]
.g5_pfunc_switch_freq+0x1cc/0x1f0
    [   20.508054]        [<c00000000068fc2c>] .g5_cpufreq_target+0x2c/0x40
    [   20.508058]        [<c0000000006873ec>]
.__cpufreq_driver_target+0x23c/0x840
    [   20.508062]        [<c00000000068c798>]
.cpufreq_gov_performance_limits+0x18/0x30
    [   20.508067]        [<c00000000068915c>]
.cpufreq_start_governor+0xac/0x100
    [   20.508071]        [<c00000000068a788>] .cpufreq_set_policy+0x208/0x=
260
    [   20.508076]        [<c00000000068abdc>] .cpufreq_init_policy+0x6c/0x=
b0
    [   20.508081]        [<c00000000068ae70>] .cpufreq_online+0x250/0x9d0
    [   20.508085]        [<c0000000004d76d8>]
.subsys_interface_register+0xb8/0x110
    [   20.508090]        [<c000000000689bb0>]
.cpufreq_register_driver+0x1d0/0x250
    [   20.508094]        [<c000000000b4f8f4>] .g5_cpufreq_init+0x9cc/0xa28
    [   20.508099]        [<c00000000000a98c>] .do_one_initcall+0x5c/0x1d0
    [   20.508103]        [<c000000000b0f86c>]
.kernel_init_freeable+0x1ac/0x28c
    [   20.508107]        [<c00000000000b3bc>] .kernel_init+0x1c/0x140
    [   20.508112]        [<c0000000000098f4>]
.ret_from_kernel_thread+0x58/0x64
    [   20.508113]
    [   20.508113] other info that might help us debug this:
    [   20.508113]
    [   20.508121] Chain exists of:
    [   20.508121]   &bus->mutex --> subsys mutex#2 --> &policy->rwsem
    [   20.508121]
    [   20.508123]  Possible unsafe locking scenario:
    [   20.508123]
    [   20.508124]        CPU0                    CPU1
    [   20.508125]        ----                    ----
    [   20.508128]   lock(&policy->rwsem);
    [   20.508132]                                lock(subsys mutex#2);
    [   20.508135]                                lock(&policy->rwsem);
    [   20.508138]   lock(&bus->mutex);
    [   20.508139]
    [   20.508139]  *** DEADLOCK ***
    [   20.508139]
    [   20.508141] 3 locks held by swapper/0/1:
    [   20.508150]  #0:  (cpu_hotplug.lock){++++++}, at: [<c000000000087838=
>]
.get_online_cpus+0x48/0xc0
    [   20.508159]  #1:  (subsys mutex#2){+.+.+.}, at: [<c0000000004d7670>]
.subsys_interface_register+0x50/0x110
    [   20.508168]  #2:  (&policy->rwsem){+.+.+.}, at: [<c00000000068adcc>]
.cpufreq_online+0x1ac/0x9d0
    [   20.508169]
    [   20.508169] stack backtrace:
    [   20.508173] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
4.8.0-rc7-00037-gd2ffb01 #21
    [   20.508175] Call Trace:
    [   20.508180] [c0000000790c2b90] [c00000000082cc70] .dump_stack+0xe0/0=
x14c
(unreliable)
    [   20.508184] [c0000000790c2c20] [c000000000828c88]
.print_circular_bug+0x350/0x388
    [   20.508188] [c0000000790c2cd0] [c0000000000ecb0c]
.__lock_acquire+0x196c/0x1d30
    [   20.508192] [c0000000790c2e50] [c0000000000ed5b4]
.lock_acquire+0x84/0x100
    [   20.508196] [c0000000790c2f20] [c000000000820448]
.mutex_lock_nested+0xa8/0x590
    [   20.508201] [c0000000790c3030] [c000000000052830]
.pmac_i2c_open+0x30/0x100
    [   20.508206] [c0000000790c30c0] [c000000000052e14]
.pmac_i2c_do_begin+0x34/0x120
    [   20.508209] [c0000000790c3150] [c000000000056bc0]
.pmf_call_one+0x50/0xd0
    [   20.508213] [c0000000790c31e0] [c00000000068ff1c]
.g5_pfunc_switch_volt+0x2c/0xc0
    [   20.508217] [c0000000790c3250] [c00000000068fecc]
.g5_pfunc_switch_freq+0x1cc/0x1f0
    [   20.508221] [c0000000790c3320] [c00000000068fc2c]
.g5_cpufreq_target+0x2c/0x40
    [   20.508226] [c0000000790c3390] [c0000000006873ec]
.__cpufreq_driver_target+0x23c/0x840
    [   20.508230] [c0000000790c3440] [c00000000068c798]
.cpufreq_gov_performance_limits+0x18/0x30
    [   20.508235] [c0000000790c34b0] [c00000000068915c]
.cpufreq_start_governor+0xac/0x100
    [   20.508239] [c0000000790c3530] [c00000000068a788]
.cpufreq_set_policy+0x208/0x260
    [   20.508244] [c0000000790c35d0] [c00000000068abdc]
.cpufreq_init_policy+0x6c/0xb0
    [   20.508249] [c0000000790c3940] [c00000000068ae70]
.cpufreq_online+0x250/0x9d0
    [   20.508253] [c0000000790c3a30] [c0000000004d76d8]
.subsys_interface_register+0xb8/0x110
    [   20.508258] [c0000000790c3ad0] [c000000000689bb0]
.cpufreq_register_driver+0x1d0/0x250
    [   20.508262] [c0000000790c3b60] [c000000000b4f8f4]
.g5_cpufreq_init+0x9cc/0xa28
    [   20.508267] [c0000000790c3c20] [c00000000000a98c]
.do_one_initcall+0x5c/0x1d0
    [   20.508271] [c0000000790c3d00] [c000000000b0f86c]
.kernel_init_freeable+0x1ac/0x28c
    [   20.508276] [c0000000790c3db0] [c00000000000b3bc]
.kernel_init+0x1c/0x140
    [   20.508280] [c0000000790c3e30] [c0000000000098f4]
.ret_from_kernel_thread+0x58/0x64

    Signed-off-by: Denis Kirjanov <kda@linux-powerpc.org>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

:040000 040000 18ec5f23dbd03c624aae71f3cbb05466dd38bf91
d4d7866e7cf3060e9ae1c76ad390194d4d789dcd M      arch

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
