Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 564EB6331A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 01:53:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGQjP1wpgz3cK9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 11:53:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NITcBboB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NITcBboB;
	dkim-atps=neutral
X-Greylist: delayed 101708 seconds by postgrey-1.36 at boromir; Tue, 22 Nov 2022 11:52:26 AEDT
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGQhV1Y8Vz2xDv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 11:52:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8BC88CE1AF4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 00:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6D09C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 00:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669078341;
	bh=Y/fAAA+NZJd7D5viHjPGeq9kMFgUeYBw921uvFW39D4=;
	h=From:To:Subject:Date:From;
	b=NITcBboBiWHWu/xOyeJNmNHvkSGjtfVpnRtUvDjMjw8Yc1roYDhuq9eNtFC90xveh
	 7PoGaYjgiCbb6nB75aGNeccSv5YNi5zxvD3AXBZQraM/gou0tIW1VVmAMjo6iDoL2N
	 5Jlv+uY2e65zs68R9Dqs8bkzpQff39lJZ7Wtfrzh0jD9vg4WdPlUsE6+yokk63vWFp
	 LK3H5664zj+htDjsdf32kdpjwxI//mK2zLo4YgFxxwJVqagEq95v2pRTE14/aeosbc
	 IyFoucFP5hWegb5ccDqbGIFFT/jqTrmsSkmkmuDoFwwkuxCnCEsbEiUj3pI6jj/VK6
	 CeTOZ1XkIXQDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9D6C1C433E4; Tue, 22 Nov 2022 00:52:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216723] New: BUG: spinlock wrong CPU on CPU#0, swapper/0/1 with
 CONFIG_NETCONSOLE=y (on a PowerMac G4 DP)
Date: Tue, 22 Nov 2022 00:52:21 +0000
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
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216723-206035@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216723

            Bug ID: 216723
           Summary: BUG: spinlock wrong CPU on CPU#0, swapper/0/1 with
                    CONFIG_NETCONSOLE=3Dy (on a PowerMac G4 DP)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 6.1-rc6
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 303258
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303258&action=3Dedit
kernel dmesg (6.1-rc6, PowerMac G4 DP)

With netconsole on I get hits like this sometimes at boot:

[...]
netpoll: netconsole: local port 6666
netpoll: netconsole: local IPv4 address 192.168.2.5
netpoll: netconsole: interface 'eth0'
netpoll: netconsole: remote port 6666
netpoll: netconsole: remote IPv4 address 192.168.2.2
netpoll: netconsole: remote ethernet address 70:85:c2:30:ec:01
netpoll: netconsole: device eth0 not up yet, forcing it
sungem_phy: PHY ID: 2060e1, addr: 0
gem 0002:20:0f.0 eth0: Found BCM5421 PHY
gem 0002:20:0f.0 eth0: Link is up at 1000 Mbps, full-duplex
gem 0002:20:0f.0 eth0: Pause is enabled (rxfifo: 10240 off: 7168 on: 5632)
IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
printk: console [netcon0] enabled
------------[ cut here ]------------
netpoll_send_skb_on_dev(): eth0 enabled interrupts in poll
(gem_start_xmit+0x0/0x7ac)
WARNING: CPU: 1 PID: 1 at net/core/netpoll.c:353 netpoll_send_skb+0x378/0x3=
cc
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Tainted: G                T  6.1.0-rc6-PMacG4=
 #21
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
NIP:  c0b27a78 LR: c0b27a78 CTR: 00000000
REGS: f1033950 TRAP: 0700   Tainted: G                T   (6.1.0-rc6-PMacG4)
MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 44002884  XER: 00000000

GPR00: 00000000 f1033a10 c192a5a0 00000000 00000000 00000000 00000000 00000=
000=20
GPR08: 00000000 00000000 00000000 00000000 00000000 00000000 00000001 00000=
000=20
GPR16: fe20677a c1579b80 00000075 c168f9c8 c168f990 00009032 c18575b0 c329c=
090=20
GPR24: 00000000 c1857558 00001032 c348fe80 c3475404 c3480260 c329c000 c0f37=
3e0=20
NIP [c0b27a78] netpoll_send_skb+0x378/0x3cc
LR [c0b27a78] netpoll_send_skb+0x378/0x3cc
Call Trace:
[f1033a10] [c0b27a78] netpoll_send_skb+0x378/0x3cc (unreliable)
[f1033a50] [c09fe8f4] write_msg+0x198/0x1b4
[f1033a90] [c0105e8c] console_emit_next_record.constprop.0+0x284/0x488
[f1033bc0] [c0106408] console_unlock+0x378/0x420
[f1033c60] [c0108228] vprintk_emit+0x2ec/0x3d4
[f1033ca0] [c0108d84] _printk+0x9c/0xe8
[f1033d20] [c01068c4] register_console+0x39c/0x490
[f1033d50] [c1450410] init_netconsole+0x388/0x518
[f1033df0] [c0007bb8] do_one_initcall+0xb0/0x33c
[f1033ec0] [c1404a18] kernel_init_freeable+0x2bc/0x3fc
[f1033f10] [c0008128] kernel_init+0x28/0x178
[f1033f30] [c0022338] ret_from_kernel_thread+0x5c/0x64
Instruction dump:
387e0078 99490002 4b80f78d 83fe0078 387f0010 4b80f781 80bf0010 3c60c0f7=20
38634880 7fc4f378 38630540 4b53bed1 <0fe00000> 92a10014 7d2000a6 71298000=20
---[ end trace 0000000000000000 ]---
------------[ cut here ]------------
raw_local_irq_restore() called with IRQs enabled
WARNING: CPU: 1 PID: 1 at kernel/locking/irqflag-debug.c:10
warn_bogus_irq_restore+0x3c/0x60
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W       T  6.1.0-rc6-PMacG4=
 #21
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
NIP:  c0d654f0 LR: c0d654f0 CTR: 00000000
REGS: f1033940 TRAP: 0700   Tainted: G        W       T   (6.1.0-rc6-PMacG4)
MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 44002884  XER: 20000000

GPR00: 00000000 f1033a00 c192a5a0 00000000 00000000 00000000 00000000 00000=
000=20
GPR08: 00000000 00000000 00000000 00000000 00000000 00000000 00000001 00000=
000=20
GPR16: fe20677a c1579b80 00000075 c168f9c8 c168f990 00009032 00001032 c171b=
280=20
GPR24: 00000038 c3475404 00001032 c348fe80 c3475404 c3480260 c329c000 00000=
000=20
NIP [c0d654f0] warn_bogus_irq_restore+0x3c/0x60
LR [c0d654f0] warn_bogus_irq_restore+0x3c/0x60
Call Trace:
[f1033a00] [c0d654f0] warn_bogus_irq_restore+0x3c/0x60 (unreliable)
[f1033a10] [c0b278e0] netpoll_send_skb+0x1e0/0x3cc
[f1033a50] [c09fe8f4] write_msg+0x198/0x1b4
[f1033a90] [c0105e8c] console_emit_next_record.constprop.0+0x284/0x488
[f1033bc0] [c0106408] console_unlock+0x378/0x420
[f1033c60] [c0108228] vprintk_emit+0x2ec/0x3d4
[f1033ca0] [c0108d84] _printk+0x9c/0xe8
[f1033d20] [c01068c4] register_console+0x39c/0x490
[f1033d50] [c1450410] init_netconsole+0x388/0x518
[f1033df0] [c0007bb8] do_one_initcall+0xb0/0x33c
[f1033ec0] [c1404a18] kernel_init_freeable+0x2bc/0x3fc
[f1033f10] [c0008128] kernel_init+0x28/0x178
[f1033f30] [c0022338] ret_from_kernel_thread+0x5c/0x64
Instruction dump:
38000000 38600000 39400000 4ca20020 9421fff0 3c60c0da 7c0802a6 39400001=20
3863aca0 9949bc5c 90010014 4b2fe459 <0fe00000> 80010014 38210010 7c0803a6=20
---[ end trace 0000000000000000 ]---
BUG: spinlock wrong CPU on CPU#0, swapper/0/1
 lock: 0xc168f840, .magic: dead4ead, .owner: swapper/0/1, .owner_cpu: 1
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       T  6.1.0-rc6-PMacG4=
 #21
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[f1033a20] [c0d1e7e0] dump_stack_lvl+0x60/0xa4 (unreliable)
[f1033a40] [c01003ac] do_raw_spin_unlock+0x184/0x188
[f1033a70] [c0d71e08] _raw_spin_unlock_irqrestore+0x18/0x78
[f1033a90] [c0105e8c] console_emit_next_record.constprop.0+0x284/0x488
[f1033bc0] [c0106408] console_unlock+0x378/0x420
[f1033c60] [c0108228] vprintk_emit+0x2ec/0x3d4
[f1033ca0] [c0108d84] _printk+0x9c/0xe8
[f1033d20] [c01068c4] register_console+0x39c/0x490
[f1033d50] [c1450410] init_netconsole+0x388/0x518
[f1033df0] [c0007bb8] do_one_initcall+0xb0/0x33c
[f1033ec0] [c1404a18] kernel_init_freeable+0x2bc/0x3fc
[f1033f10] [c0008128] kernel_init+0x28/0x178
[f1033f30] [c0022338] ret_from_kernel_thread+0x5c/0x64
netconsole: network logging started
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
