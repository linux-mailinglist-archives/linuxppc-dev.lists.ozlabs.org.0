Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5D9C1E21
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 11:37:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hck92sw4zDqMT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 19:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=7tux=xz=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hch60zhvzDqL0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 19:35:17 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 195755] rcu_sched detected stalls on CPUs/tasks: (detected by
 0, t=6302 jiffies, g=11405, c=11404, q=1880), ppc64, G5
Date: Mon, 30 Sep 2019 09:35:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: micron10@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-195755-206035-6O9w4F5iMN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-195755-206035@https.bugzilla.kernel.org/>
References: <bug-195755-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D195755

Martin Zaharinov (micron10@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |micron10@gmail.com

--- Comment #27 from Martin Zaharinov (micron10@gmail.com) ---
I see this bug is back in kernel 5.3.x=20

Sep 28 15:40:01  [  611.520537][    C0] rcu: INFO: rcu_sched self-detected
stall on CPU
Sep 28 15:40:01  [  611.520992][    C0] rcu:    0-...!: (5998 ticks this GP)
idle=3Dace/1/0x4000000000000004 softirq=3D46973/46973 fqs=3D73
Sep 28 15:40:01  [  611.521721][    C0]         (t=3D6000 jiffies g=3D83505=
 q=3D2615)
Sep 28 15:40:01  [  611.522076][    C0] rcu: rcu_sched kthread starved for =
5853
jiffies! g83505 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D1
Sep 28 15:40:01  [  611.522858][    C0] rcu: RCU grace-period kthread stack
dump:
Sep 28 15:40:01  [  611.523269][    C0] rcu_sched       I    0    10      2
0x80004000
Sep 28 15:40:01  [  611.523710][    C0] Call Trace:
Sep 28 15:40:01  [  611.523938][    C0]  ? __schedule+0x1db/0x5d0
Sep 28 15:40:01  [  611.524251][    C0]  schedule+0x34/0xa0
Sep 28 15:40:01  [  611.524525][    C0]  schedule_timeout+0x1f7/0x3e0
Sep 28 15:40:01  [  611.524861][    C0]  ? collect_expired_timers+0x270/0x2=
70
Sep 28 15:40:01  [  611.525248][    C0]  rcu_gp_kthread+0x49f/0xea0
Sep 28 15:40:01  [  611.525572][    C0]  kthread+0x11a/0x150
Sep 28 15:40:01  [  611.525851][    C0]  ? rcu_report_qs_rnp+0x160/0x160
Sep 28 15:40:01  [  611.534554][    C0]  ? kthread_park+0x70/0x70
Sep 28 15:40:01  [  611.543250][    C0]  ret_from_fork+0x1f/0x30
Sep 28 15:40:01  [  611.551953][    C0] NMI backtrace for cpu 0
Sep 28 15:40:01  [  611.560402][    C0] CPU: 0 PID: 10870 Comm: ifmgr Taint=
ed:
G           O      5.3.1 #1
Sep 28 15:40:01  [  611.576928][    C0] Hardware name: HP ProLiant ML110 G7,
BIOS J01 08/10/2012
Sep 28 15:40:01  [  611.585641][    C0] Call Trace:
Sep 28 15:40:01  [  611.594279][    C0]  <IRQ>
Sep 28 15:40:01  [  611.602783][    C0]  dump_stack+0x47/0x5a
Sep 28 15:40:01  [  611.611375][    C0]  nmi_cpu_backtrace.cold+0x14/0x53
Sep 28 15:40:01  [  611.620076][    C0]  ? lapic_can_unplug_cpu.cold+0x37/0=
x37
Sep 28 15:40:01  [  611.628588][    C0]=20
nmi_trigger_cpumask_backtrace+0xef/0xf1
Sep 28 15:40:01  [  611.637040][    C0]  rcu_dump_cpu_stacks+0x8d/0xbb
Sep 28 15:40:01  [  611.645425][    C0]  rcu_sched_clock_irq.cold+0x1b1/0x3=
a6
Sep 28 15:40:01  [  611.653707][    C0]  update_process_times+0x5b/0x90
Sep 28 15:40:01  [  611.661857][    C0]  tick_sched_timer+0x65/0x100
Sep 28 15:40:01  [  611.669733][    C0]  ? get_cpu_iowait_time_us+0x100/0x1=
00
Sep 28 15:40:01  [  611.677571][    C0]  __hrtimer_run_queues+0x105/0x1b0
Sep 28 15:40:01  [  611.685267][    C0]  hrtimer_interrupt+0x10b/0x3d0
Sep 28 15:40:01  [  611.692709][    C0]  smp_apic_timer_interrupt+0x50/0x80
Sep 28 15:40:01  [  611.700044][    C0]  apic_timer_interrupt+0xf/0x20
Sep 28 15:40:01  [  611.707293][    C0] RIP:
0010:native_queued_spin_lock_slowpath+0x63/0x1d0
Sep 28 15:40:01  [  611.714847][    C0] Code: ba 2f 08 0f 92 c0 0f b6 c0 c1=
 e0
08 89 c2 8b 07 30 e4 09 d0 a9 00 01 ff ff 75 1c 85 c0 74 0f 8b 07 84 c0 74 =
09
0f ae e8 8b 07 <84> c0 75 f7 b8 01 00 00 00 66 89 07 c3 f6 c4 01 75 04 c6 4=
7 01
00
Sep 28 15:40:01  [  611.738876][    C0] RSP: 0000:ffffc90000003ad8 EFLAGS:
00000202 ORIG_RAX: ffffffffffffff13
Sep 28 15:40:01  [  611.755477][    C0] RAX: 0000000000080101 RBX:
0000000000000000 RCX: 0000000000000000
Sep 28 15:40:01  [  611.772993][    C0] RDX: 0000000000000000 RSI:
0000000000000000 RDI: ffff8882dcf72080
Sep 28 15:40:01  [  611.791481][    C0] RBP: ffff8882c7527800 R08:
ffff8882c7765890 R09: 0000000000000000
Sep 28 15:40:01  [  611.810932][    C0] R10: 0000000000000000 R11:
ffffffff817b5d30 R12: ffff8882db3a7000
Sep 28 15:40:01  [  611.830825][    C0] R13: ffff8882dcf72000 R14:
ffff8882dcf71800 R15: ffff8882db3a7000
Sep 28 15:40:01  [  611.851397][    C0]  ? apic_timer_interrupt+0xa/0x20
Sep 28 15:40:01  [  611.862019][    C0]  ? ip_fragment.constprop.0+0x80/0x80
Sep 28 15:40:01  [  611.872654][    C0]  _raw_spin_lock+0x15/0x20
Sep 28 15:40:01  [  611.883227][    C0]  __imq_nf_queue+0x3a5/0x6d0 [imq]
Sep 28 15:40:01  [  611.893786][    C0]  imq_nf_queue+0x326/0x423 [imq]
Sep 28 15:40:01  [  611.904278][    C0]  nf_queue+0x1b8/0x320
Sep 28 15:40:01  [  611.914713][    C0]  nf_hook_slow+0x82/0xe0
Sep 28 15:40:01  [  611.925061][    C0]  ip_output+0xb3/0x280
Sep 28 15:40:01  [  611.935355][    C0]  ? ip_fragment.constprop.0+0x80/0x80
Sep 28 15:40:01  [  611.945745][    C0]  ip_push_pending_frames+0x52/0x80
Sep 28 15:40:01  [  611.956106][    C0]  __icmp_send+0x4ac/0x5a0
Sep 28 15:40:01  [  611.966513][    C0]  ? nf_xfrm_me_harder+0xf4/0x110
[nf_nat]
Sep 28 15:40:02  [  611.976960][    C0]  ? ip_fragment.constprop.0+0x6d/0x80
Sep 28 15:40:02  [  611.987406][    C0]  ip_fragment.constprop.0+0x6d/0x80
Sep 28 15:40:02  [  611.997743][    C0]  nf_reinject+0x15d/0x18f
Sep 28 15:40:02  [  612.007855][    C0]  imq_dev_xmit+0x70/0xb0 [imq]
Sep 28 15:40:02  [  612.017725][    C0]  dev_hard_start_xmit+0x96/0x130
Sep 28 15:40:02  [  612.027513][    C0]  __qdisc_run+0x1bf/0x2d0
Sep 28 15:40:02  [  612.037043][    C0]  net_tx_action+0xd3/0x150
Sep 28 15:40:02  [  612.046310][    C0]  __do_softirq+0xc8/0x206
Sep 28 15:40:02  [  612.055317][    C0]  irq_exit+0xa7/0xf0
Sep 28 15:40:02  [  612.064020][    C0]  smp_apic_timer_interrupt+0x55/0x80
Sep 28 15:40:02  [  612.072615][    C0]  apic_timer_interrupt+0xf/0x20
Sep 28 15:40:02  [  612.080970][    C0]  </IRQ>
Sep 28 15:40:02  [  612.088957][    C0] RIP: 0033:0x55e6e4
Sep 28 15:40:02  [  612.096796][    C0] Code: 48 01 d0 48 89 c2 4c 01 c0 4c=
 0f
be 47 fb 48 c1 e2 05 48 01 c2 48 89 d0 48 c1 e0 05 4c 01 c2 4c 0f be 47 fc =
48
01 d0 48 89 c2 <48> c1 e2 05 4c 01 c0 48 01 d0 48 0f be 57 fd 49 89 c0 49 c=
1 e0
05
Sep 28 15:40:02  [  612.120192][    C0] RSP: 002b:00007ffc8f1f1fd8 EFLAGS:
00000287 ORIG_RAX: ffffffffffffff13
Sep 28 15:40:02  [  612.135465][    C0] RAX: a888682638287cbb RBX:
00000000000002d0 RCX: 00007fb6b4431f88
Sep 28 15:40:02  [  612.151470][    C0] RDX: a888682638287cbb RSI:
000000000000001a RDI: 00007fb6b4431f80
Sep 28 15:40:02  [  612.168344][    C0] RBP: 0000000000001680 R08:
000000000000004c R09: 000000000000001a
Sep 28 15:40:02  [  612.186162][    C0] R10: 00007fb6b8541948 R11:
00007fb6b8a930a0 R12: 0000000000000090
Sep 28 15:40:02  [  612.205010][    C0] R13: 00007fb6b442daa0 R14:
00007fb6b41044d0 R15: 0000000001619440

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
