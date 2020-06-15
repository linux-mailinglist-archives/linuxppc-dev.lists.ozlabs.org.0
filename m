Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE101F9527
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 13:19:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lpkS6SCWzDqBs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 21:19:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=roh1=74=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lphZ2zx1zDq6q
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 21:17:34 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 208181] New: BUG: KASAN: stack-out-of-bounds in strcmp+0x58/0xd8
Date: Mon, 15 Jun 2020 11:17:31 +0000
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
Message-ID: <bug-208181-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208181

            Bug ID: 208181
           Summary: BUG: KASAN: stack-out-of-bounds in strcmp+0x58/0xd8
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.8-rc1
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

Created attachment 289659
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D289659&action=3Dedit
dmesg (5.8-rc1, INLINE KASAN, PowerMac G4 DP)

The G4 DP boots up and is useable, though I get this at early boot:

[...]
Jun 15 11:41:11 T600 kernel: setbat: no BAT available for mapping 0x2a000000
Jun 15 11:41:11 T600 kernel: setbat: no BAT available for mapping 0x2c000000
Jun 15 11:41:11 T600 kernel: KASAN init done
Jun 15 11:41:11 T600 kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Jun 15 11:41:11 T600 kernel: BUG: KASAN: stack-out-of-bounds in
strcmp+0x58/0xd8
Jun 15 11:41:11 T600 kernel: Read of size 1 at addr c11c1a80 by task swappe=
r/0
Jun 15 11:41:11 T600 kernel:=20
Jun 15 11:41:11 T600 kernel: CPU: 0 PID: 0 Comm: swapper Not tainted
5.8.0-rc1-PowerMacG4 #2
Jun 15 11:41:11 T600 kernel: Call Trace:
Jun 15 11:41:11 T600 kernel: [c1ae97d0] [c0a2069c] dump_stack+0xfc/0x158
(unreliable)
Jun 15 11:41:11 T600 kernel: [c1ae9800] [c04ac5cc]
print_address_description.isra.0+0x30/0x3fc
Jun 15 11:41:11 T600 kernel: [c1ae9870] [c04acb28] kasan_report+0x110/0x170
Jun 15 11:41:11 T600 kernel: [c1ae98b0] [c0a44c00] strcmp+0x58/0xd8
Jun 15 11:41:11 T600 kernel: [c1ae98d0] [c0170790]
register_lock_class+0xfa4/0x10a0
Jun 15 11:41:11 T600 kernel: [c1ae9990] [c0170a34] __lock_acquire+0x1a8/0x3=
82c
Jun 15 11:41:11 T600 kernel: [c1ae9b40] [c016f398] lock_acquire+0x5e0/0x854
Jun 15 11:41:11 T600 kernel: [c1ae9c00] [c1144014]
_raw_spin_lock_irqsave+0x48/0x70
Jun 15 11:41:11 T600 kernel: [c1ae9c20] [c0ccbe84] of_find_property+0x2c/0x=
5c
Jun 15 11:41:11 T600 kernel: [c1ae9c50] [c0ccbec8] of_get_property+0x14/0x6c
Jun 15 11:41:11 T600 kernel: [c1ae9c70] [c0cdbcd8]
unflatten_dt_nodes+0xc4c/0xcdc
Jun 15 11:41:11 T600 kernel: [c1ae9ec0] [c0cdbe90]
__unflatten_device_tree+0x114/0x1e0
Jun 15 11:41:11 T600 kernel: [c1ae9ef0] [c184a294]
unflatten_device_tree+0x38/0x54
Jun 15 11:41:11 T600 kernel: [c1ae9f10] [c1808600] setup_arch+0xc8/0x630
Jun 15 11:41:11 T600 kernel: [c1ae9f50] [c1803268] start_kernel+0xcc/0x4cc
Jun 15 11:41:11 T600 kernel: [c1ae9ff0] [000038a0] 0x38a0
Jun 15 11:41:11 T600 kernel:=20
Jun 15 11:41:11 T600 kernel: The buggy address belongs to the variable:
Jun 15 11:41:11 T600 kernel:  __func__.22122+0x80/0x320
Jun 15 11:41:11 T600 kernel:=20
Jun 15 11:41:11 T600 kernel: Memory state around the buggy address:
Jun 15 11:41:11 T600 kernel:  c11c1980: 00 00 00 00 00 00 00 00 00 00 f1 f1=
 f1
f1 f1 f1
Jun 15 11:41:11 T600 kernel:  c11c1a00: 04 f2 04 f2 04 f2 04 f2 04 f2 00 00=
 00
04 f2 f2
Jun 15 11:41:11 T600 kernel: >c11c1a80: f2 f2 00 00 00 04 f3 f3 f3 f3 00 00=
 00
00 00 00
Jun 15 11:41:11 T600 kernel:            ^
Jun 15 11:41:11 T600 kernel:  c11c1b00: 00 00 00 00 00 00 00 00 00 00 f1 f1=
 f1
f1 00 00
Jun 15 11:41:11 T600 kernel:  c11c1b80: 00 00 f3 f3 f3 f3 00 00 00 00 00 00=
 00
00 00 00
Jun 15 11:41:11 T600 kernel:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Jun 15 11:41:11 T600 kernel: Disabling lock debugging due to kernel taint
[...]

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
