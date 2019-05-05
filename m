Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A67A13C75
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2019 02:59:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44xSDz1xZkzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2019 10:59:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44xRPY6hBbzDqLZ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 May 2019 10:21:37 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 894FF28823
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 May 2019 00:21:35 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 7A2272882D; Sun,  5 May 2019 00:21:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 203517] New: WARNING: inconsistent lock state. inconsistent
 {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
Date: Sun, 05 May 2019 00:21:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-203517-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 05 May 2019 10:55:26 +1000
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203517

            Bug ID: 203517
           Summary: WARNING: inconsistent lock state. inconsistent
                    {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.1.0-rc7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: Yes

Created attachment 282613
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D282613&action=3Dedit
dmesg (5.1.0-rc7, Talos II)

I have not seen this on my amd64 machines on the 5.1-rcX kernels I've been
running for some time, so I am filing this agains ppc64 platform specific.

I am running some zram-compressed swap space via systemd:
/sbin/zram-init -d0 -s32 -azstd -Lzram_swap 4096

Have not seen this in 5.0.x and before.

[...]
[  313.402874] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  313.402875] WARNING: inconsistent lock state
[  313.402879] 5.1.0-rc7 #1 Not tainted
[  313.402880] --------------------------------
[  313.402882] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
[  313.402885] swapper/5/0 [HC0[0]:SC1[1]:HE1:SE0] takes:
[  313.402888] 0000000080d1120c (&(&wsm.lock)->rlock){+.?.}, at:
.zstd_reclaim_timer_fn+0x40/0x230
[  313.402895] {SOFTIRQ-ON-W} state was registered at:
[  313.402899]   .lock_acquire+0xd0/0x240
[  313.402903]   ._raw_spin_lock+0x34/0x60
[  313.402906]   .zstd_get_workspace+0xd0/0x360
[  313.402908]   .end_compressed_bio_read+0x3b8/0x540
[  313.402911]   .bio_endio+0x174/0x2c0
[  313.402914]   .end_workqueue_fn+0x4c/0x70
[  313.402917]   .normal_work_helper+0x138/0x7e0
[  313.402920]   .process_one_work+0x324/0x790
[  313.402922]   .worker_thread+0x68/0x570
[  313.402925]   .kthread+0x19c/0x1b0
[  313.402928]   .ret_from_kernel_thread+0x58/0x78
[  313.402930] irq event stamp: 2629216
[  313.402933] hardirqs last  enabled at (2629216): [<c0000000009da738>]
._raw_spin_unlock_irq+0x38/0x60
[  313.402936] hardirqs last disabled at (2629215): [<c0000000009da4c4>]
._raw_spin_lock_irq+0x24/0x70
[  313.402939] softirqs last  enabled at (2629212): [<c0000000000af9fc>]
.irq_enter+0x8c/0xd0
[  313.402942] softirqs last disabled at (2629213): [<c0000000000afb58>]
.irq_exit+0x118/0x170
[  313.402944]=20
               other info that might help us debug this:
[  313.402945]  Possible unsafe locking scenario:

[  313.402947]        CPU0
[  313.402948]        ----
[  313.402949]   lock(&(&wsm.lock)->rlock);
[  313.402951]   <Interrupt>
[  313.402952]     lock(&(&wsm.lock)->rlock);
[  313.402954]=20
                *** DEADLOCK ***

[  313.402957] 1 lock held by swapper/5/0:
[  313.402958]  #0: 000000004b612042 ((&wsm.timer)){+.-.}, at:
.call_timer_fn+0x0/0x3c0
[  313.402963]=20
               stack backtrace:
[  313.402967] CPU: 5 PID: 0 Comm: swapper/5 Not tainted 5.1.0-rc7 #1
[  313.402968] Call Trace:
[  313.402972] [c0000007fa262e70] [c0000000009b3294] .dump_stack+0xe0/0x15c
(unreliable)
[  313.402975] [c0000007fa262f10] [c000000000125548]
.print_usage_bug+0x348/0x390
[  313.402978] [c0000007fa262fd0] [c000000000125cb4] .mark_lock+0x724/0x930
[  313.402981] [c0000007fa263080] [c000000000126c20]
.__lock_acquire+0xc90/0x16a0
[  313.402984] [c0000007fa2631b0] [c000000000128040] .lock_acquire+0xd0/0x2=
40
[  313.402987] [c0000007fa263280] [c0000000009da2b4] ._raw_spin_lock+0x34/0=
x60
[  313.402990] [c0000007fa263300] [c00000000054b0b0]
.zstd_reclaim_timer_fn+0x40/0x230
[  313.402993] [c0000007fa2633d0] [c000000000158b38] .call_timer_fn+0xc8/0x=
3c0
[  313.402996] [c0000007fa2634a0] [c000000000158f74] .expire_timers+0x144/0=
x260
[  313.402999] [c0000007fa263550] [c000000000159178]
.run_timer_softirq+0xe8/0x230
[  313.403002] [c0000007fa263680] [c0000000009db288] .__do_softirq+0x188/0x=
5d4
[  313.403004] [c0000007fa263790] [c0000000000afb58] .irq_exit+0x118/0x170
[  313.403008] [c0000007fa263800] [c000000000028d88]
.timer_interrupt+0x158/0x430
[  313.403012] [c0000007fa2638b0] [c0000000000091d4]
decrementer_common+0x134/0x140
[  313.403017] --- interrupt: 901 at replay_interrupt_return+0x0/0x4
                   LR =3D .arch_local_irq_restore.part.0+0x68/0x80
[  313.403020] [c0000007fa263bb0] [c00000000001a3ac]
.arch_local_irq_restore.part.0+0x2c/0x80 (unreliable)
[  313.403024] [c0000007fa263c30] [c0000000007bbbcc]
.cpuidle_enter_state+0xec/0x670
[  313.403027] [c0000007fa263d00] [c0000000000f5130] .call_cpuidle+0x40/0x90
[  313.403031] [c0000007fa263d70] [c0000000000f554c] .do_idle+0x2dc/0x3a0
[  313.403034] [c0000007fa263e30] [c0000000000f59ac]
.cpu_startup_entry+0x2c/0x30
[  313.403037] [c0000007fa263ea0] [c000000000045674]
.start_secondary+0x644/0x650
[  313.403041] [c0000007fa263f90] [c00000000000ad5c]
start_secondary_prolog+0x10/0x14
[...]

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
