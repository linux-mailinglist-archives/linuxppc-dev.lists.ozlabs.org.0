Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C7DDF943
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 02:08:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xv3g5pgYzDqLd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 11:08:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=enjt=yp=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xv0W1XCszDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 11:05:30 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205283] New: BUG: KASAN: global-out-of-bounds in
 _copy_to_iter+0x3d4/0x5a8
Date: Tue, 22 Oct 2019 00:05:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: CC platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: btrfs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: fs_btrfs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-205283-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205283

            Bug ID: 205283
           Summary: BUG: KASAN: global-out-of-bounds in
                    _copy_to_iter+0x3d4/0x5a8
           Product: File System
           Version: 2.5
    Kernel Version: 5.4-rc4
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: btrfs
          Assignee: fs_btrfs@kernel-bugs.kernel.org
          Reporter: erhard_f@mailbox.org
                CC: platform_ppc-32@kernel-bugs.osdl.org
        Regression: No

Created attachment 285605
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D285605&action=3Dedit
dmesg (kernel 5.4.0-rc4, PowerMac G4 DP)

First of all apologies 'cause I am not quite sure under what kernel subsyst=
em
tracker I should file this bug. It was triggered running btrfs filesystem t=
ests
(misc tests) on a PowerMac G4 DP and seems to touch some memcopy routine:

[...]
[  601.897623]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  601.905117] BUG: KASAN: global-out-of-bounds in _copy_to_iter+0x3d4/0x5a8
[  601.912512] Write of size 4096 at addr f18b8000 by task modprobe/10589

[  601.927287] CPU: 1 PID: 10589 Comm: modprobe Tainted: G        W=20=20=
=20=20=20=20=20=20
5.4.0-rc4-PowerMacG4+ #20
[  601.934991] Call Trace:
[  601.942534] [eb9cf848] [c0769184] dump_stack+0xb0/0x10c (unreliable)
[  601.950307] [eb9cf878] [c023aea8]
print_address_description.isra.5+0x3c/0x420
[  601.958167] [eb9cf908] [c023b470] __kasan_report+0x140/0x188
[  601.966030] [eb9cf948] [c023bea8] check_memory_region+0x28/0x184
[  601.973925] [eb9cf958] [c0239f30] memcpy+0x48/0x74
[  601.981792] [eb9cf978] [c044ab9c] _copy_to_iter+0x3d4/0x5a8
[  601.989705] [eb9cfaa8] [c044af18] copy_page_to_iter+0x90/0x550
[  601.997585] [eb9cfb08] [c01bcc60] generic_file_read_iter+0x5c8/0x7bc
[  602.005374] [eb9cfb78] [c0251e5c] __vfs_read+0x1b0/0x1f4
[  602.013027] [eb9cfca8] [c0251f5c] vfs_read+0xbc/0x124
[  602.020671] [eb9cfcd8] [c0252018] kernel_read+0x54/0x70
[  602.028302] [eb9cfd08] [c025c7d8] kernel_read_file+0x240/0x358
[  602.035930] [eb9cfdb8] [c025c9dc] kernel_read_file_from_fd+0x54/0x74
[  602.043581] [eb9cfdf8] [c010c494] sys_finit_module+0xd8/0x140
[  602.051183] [eb9cff38] [c001a274] ret_from_syscall+0x0/0x34
[  602.058641] --- interrupt: c01 at 0x7062c4
                   LR =3D 0x88e7c4


[  602.087858] Memory state around the buggy address:
[  602.095160]  f18b7f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  602.102601]  f18b7f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  602.109845] >f18b8000: 00 06 fa fa fa fa fa fa 00 00 03 fa fa fa fa fa
[  602.117150]               ^
[  602.124218]  f18b8080: 00 00 04 fa fa fa fa fa 00 03 fa fa fa fa fa fa
[  602.131467]  f18b8100: 00 07 fa fa fa fa fa fa 00 00 03 fa fa fa fa fa
[  602.138638]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--=20
You are receiving this mail because:
You are watching someone on the CC list of the bug.=
