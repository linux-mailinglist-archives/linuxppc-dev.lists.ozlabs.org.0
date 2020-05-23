Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ED11DFB53
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 00:23:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TyYz2cfpzDqgV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 08:23:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=abjp=7f=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TyWq5fSwzDqWr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 08:21:59 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 207873] New: BUG at swapops + rcu stall + soft lockup at
 running btrfs test suite (TEST=013\* ./misc-tests.sh)
Date: Sat, 23 May 2020 22:21:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-207873-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D207873

            Bug ID: 207873
           Summary: BUG at swapops + rcu stall + soft lockup at running
                    btrfs test suite (TEST=3D013\* ./misc-tests.sh)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.7-rc6
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: fs_btrfs@kernel-bugs.osdl.org
        Regression: No

Created attachment 289253
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D289253&action=3Dedit
kernel .config (5.7-rc6, PowerMac G4 DP)

The bug is triggered by running "TEST=3D013\* ./misc-tests.sh" of btrfs-pro=
gs
test suite, built from git master:

 # git clone https://github.com/kdave/btrfs-progs && cd btrfs-progs/
 # ./autogen.sh && ./configure --disable-documentation
 # make && make fssum
 # cd tests/
 # TEST=3D013\* ./misc-tests.sh

The G4 crashes and the reboot timer kicks in. Before it shows a series of s=
tack
traces, starting with the "kernel BUG at include/linux/swapops.h:197!"-part
from bug #207221. After that I get an rcu stall and a soft lockup. For the =
full
stacktrace have a look at the transcript of both screenshots.

[...]
rcu: INFO: rcu_sched self-detected stall on CPU
rcu: o1-....: (7799 ticks this GP) idle=3Da06/1/0x40000002 soft irq=3D11075=
/11075
fqs=3D2599
o(t=3D7804 jiffies g=3D21629 q=3D59)
Task dump for CPU 1:
dd              R  running task        0  2200    394 0x0000000c
Call Trace:
[f49fb458] [c00fcddc] sched_show_task+0x3bc/Ox3fe (unreliable)
[f49fb498] [c01c650c] rcu_dump_cpu_stacks+0x228/0x23c
[f49fb4e8] [c01c2e18] rcu_sched_clock_irq+0x81c/0x1360
[f49fb568] [c01d8940] update_process_times+0x2c/0x98
[f49fb588] [c02027d4] tick_sched_timer+0x128/0x1d8
[f49fb5a8] [c01dc49c] __hrtimer_run_queues+0x490/Oxae8
[f49fb698] [c01dd788] hrtimer_interrupt+0x278/0x520
[f49fb6f8] [c001710c] timer_interrupt+0x374/0xb4c
[f49fb738] [c002c5e4] ret_from_except+0x0/0x14
--- interrupt: 901 at do_raw_spin_lock+0x1c8/0x2cc
    LR =3D do_raw_spin_lock+0x1a4/0x2cc
[f49fb800] [c0180e0c] do_raw_spin_lock+0x188/0x2cc (unrelable)
[f49fb830] [c0428890] unmap_page_range+0x244/0xb08
[f49fb910] [c0429610] unmap_vmas+0x94/0xdc
[f49fb930] [c043c25c] exit_mmap+0x340/0x46c
[f49fba20] [c0078260] __mmput+0x78/0x360
[f49fba50] [c0090514] do_exit+0x9c4/0x21fc
[f49fbb20] [c0019d38] user_single_step_report+0x0/0x74
[f49fbb70] [c002c5e0] ret_from_except+0x0/0x4
--- interrupt: 700 at __migration_entry_wait+0x13c/0x198
    LR =3D __migration_entry_wait+0xf0/0x198
[f49fbc58] [c042c0f0] do_swap_page+0x1f0/0x198
[f49fbd28] [c042e7e4] handle_mm_fault+0x794/0x16f4
[f49fbe48] [c0039868] do_page_fault+0xf50/0x12f8
[f49fbf38] [c002c468] handle_page_fault+0x10/0x3c
--- interrupt: 301 at 0x87e378
    LR =3D 0x87e33c
[...]

I don't know wether this is a btrfs bug, or a bug only triggered by this
specific test. So I am filing this as platform specific as I have not seen =
it
on x86 yet.

Unlike bug #207221 KASAN is enabled here, so the stack trace looks slightly
different.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
