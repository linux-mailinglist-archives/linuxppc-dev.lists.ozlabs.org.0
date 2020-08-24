Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AF0250BE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 00:51:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb6mg707nzDqRr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 08:51:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=6cwj=cc=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb6l26QJpzDqLF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 08:49:50 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 209029] New: kernel 5.9-rc2 fails to boot on a PowerMac G5 11, 2
 - BUG: Kernel NULL pointer dereference on read at 0x00000020
Date: Mon, 24 Aug 2020 22:49:47 +0000
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
Message-ID: <bug-209029-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209029

            Bug ID: 209029
           Summary: kernel 5.9-rc2 fails to boot on a PowerMac G5 11,2 -
                    BUG: Kernel NULL pointer dereference on read at
                    0x00000020
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.9-rc2
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 292153
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D292153&action=3Dedit
kernel .config (kernel 5.9-rc2, PowerMac G5 11,2)

Transcribed the stacktrace from a screenshot with my camera:

[...]
REGS: c00000047d0d7850 TRAP:   0700 Tainted: G        W=20=20=20=20=20=20=
=20=20=20
(5.9.0-rc2-PowerMacG5)
MSR:  9000000000029032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44000448  XER: 200fffff
IRQMASK: 0
GPR00: c000000000af853c c00000047d0d7ae0 c000000000d17300 0000000000000001
GPR04: 00001ccccf255000 c00000047b5c92a8 0000000000000001 0000000000000000
GPR08: c000000000000000 0000000000000001 3fffffffffffffff 4000000000000000
GPR12: 0000000024000448 c00000000ffffc80 c00000000000fd78 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000c3e000 c000000000c3e307 c000000000d83b90 c000300000030f80
GPR24: c000000000d83c28 0000000000000c00 c00000047b5c74b0 8000000000000105
GPR28: ee1fffffffffffbf c00000047d64f800 00001ccccf255000 00001ccccf255000
NIP [c000000000af8568] .debug_um_pgtable+0x884/0xa20
LR [c000000000af853c] .debug_vm_pgtable+0x858/0xa20
Call Trace:
[c00000047d0d7ae0] [c000000000af853c] .debug_vm_pgtable++0x858/0xa20
(unreliable)
[c00000047d0d7be0] [c00000000000f62c] .do_one_initcall+0x60/0x344
[c00000047d0d7cc0] [c000000000ad8d64] .kerne]_init_freeable+0x3c0/0x3f4
[c00000047d0d7db0] [c00000000000fd88] .kernel_init+0x10/0x130
[c00000047d0d7e20] [c00000000000b9d8] .ret_from_kerne!_thread+0x58/0x60
Instruction dump:
4b53b145 60000000 e8df0000 7f863278 3f80ee1f 639cffff 7b9c07c6 679cffff
639cffbf 7cc6e038 3146ffff 7cca3110 <0b060000> 39000000 38e00000 38c0ffff
irg event stamp: 369
hardirgs last  enabled at (369): [<c0000000000cd624>]
.console_unlock+0x650/0x664
hardirgs last disabled at (366): [<c0000000000cd144>]
.console_unlock+0x170/0x664
softirgs last  enabled at (0): [<c00000000005ff38>] .copy_process+0x69c/0x1=
510
softirgs last disabled at (0): [<0000000000000000>] 0x0
---[ end trace 0561544ca9dc6c57 ]---
BUG: Kernel NULL pointer dereference on read at 0x00000020
ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
Faulting instruction address: 0xc000000000033924
Oops: Kernel access of bad area, sig: 11 [#1]
BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D4 NUMA PowerMac
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W         5.9.0-rc2-PowerMa=
cG5
#2
NIP:  c000000000033924 LR: c0000000000338e4 CTR: 0000000000000000
REGS: c00000047d0d77a0 TRAP: 0380 Tainted: G        W=20=20=20=20=20=20=20=
=20=20
(5.9.0-rc2-PowerMacG5)
MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI> CR: 44000448 XER: 200fffff
IRQMASK: 0
GPR00: c0000000000338e4 c00000047d0d7a30 c000000000d17300 c00000047d0d7aa8
GPR04: 8000000000c3e387 0000000000000001 8000000000c3e387 0000000000000001
GPR08: c000000000000000 0000000000000000 c000000000d83d48 0000000000000000
GPR12: 0000000024000448 c00000000ffffc80 c00000000000fd78 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000c3e000 c000000000c3e307 c000000000d83b90 c000300000030f80
GPR24: c000000000d83c28 0000000000000c00 c00000047b5c74b0 8000000000000105
GPR28: c00000047b5c74b0 0000000000000001 8000000000c3e387 c00000047b5c92a8
NIP [c000000000033924] .huge_ptep_set_access_flags+0x70/0x114
LR [c0000000000338e4] .huge_ptep_set_access_flags+0x30/0x114
Call Trace:
[c00000047d0d7a30] [c0000000000338e4] .huge_ptep_set_access_flags+0x30/0x114
(unreliable)
[c00000047d0d7ae0] [c000000000af86b4] .debug_vm_pgtable++0x9d0/0xa20
[c00000047d0d7be0] [c00000000000f62c] .do_one_initcall+0x60/0x344
[c00000047d0d7cc0] [c000000000ad8d64] .kerne]_init_freeable+0x3c0/0x3f4
[c00000047d0d7db0] [c00000000000fd88] .kernel_init+0x10/0x130
[c00000047d0d7e20] [c00000000000b9d8] .ret_from_kerne!_thread+0x58/0x60
Instruction dump:
794a07c6 654affff 7fc94a78 614affbf 7d295038 2c290000 33a9ffff 7fbd4910
4182008c e93c00a0 3d420007 394aca48 <e9290020> 810a0268 e9290028 e9290648
---[ end trace 0561544ca9dc6c58 ]---

note: swapper/0[1] exited with preempt_count 1
ata2.00: ATA-8: WDC WD5000BPKX-22HPJT0, 01.01A01, max UDMA/133
Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b
ata2.00: 976773168 sectors, multi 0: LBA48 NCQ (depth 0/32)
Rebooting in 120 seconds..

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
