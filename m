Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A01A67A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 16:14:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4919br1LVnzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 00:14:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=qxs9=55=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4919YB22l8zDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 00:12:13 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205099] KASAN hit at raid6_pq: BUG: Unable to handle kernel
 data access at 0x00f0fd0d
Date: Mon, 13 Apr 2020 14:12:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-205099-206035-54mmoFn30H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205099-206035@https.bugzilla.kernel.org/>
References: <bug-205099-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205099

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #287621|0                           |1
        is obsolete|                            |

--- Comment #28 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 288411
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D288411&action=3Dedit
dmesg (5.7-rc1, OUTLINE KASAN, PowerMac G4 DP)

Re-tested with v5.7-rc1 out of curiosity. Not much change here, the bug sho=
ws
up with OUTLINE KASAN but not with INLINE KASAN, everything else being equa=
l.

[...]
Apr 13 16:01:11 T600 kernel: BUG: Unable to handle kernel data access on re=
ad
at 0x0050a0f0
Apr 13 16:01:11 T600 kernel: Faulting instruction address: 0xf1aa1564
Apr 13 16:01:11 T600 kernel: Oops: Kernel access of bad area, sig: 11 [#1]
Apr 13 16:01:11 T600 kernel: BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 P=
owerMac
Apr 13 16:01:11 T600 kernel: Modules linked in: raid6_pq(+) zlib_inflate
firewire_ohci firewire_core ehci_pci(+) ohci_hcd crc_itu_t sr_mod cdrom
ehci_hcd snd_aoa_i2sbus snd_aoa_soundbus snd_pcm snd_timer snd ss>
Apr 13 16:01:11 T600 kernel: CPU: 0 PID: 149 Comm: modprobe Tainted: G     =
   W
        5.7.0-rc1-PowerMacG4+ #1
Apr 13 16:01:11 T600 kernel: NIP:  f1aa1564 LR: f1aa14e8 CTR: c0255b78
Apr 13 16:01:11 T600 kernel: REGS: f1963780 TRAP: 0300   Tainted: G        =
W=20=20=20
      (5.7.0-rc1-PowerMacG4+)
Apr 13 16:01:11 T600 kernel: MSR:  02009032 <VEC,EE,ME,IR,DR,RI>  CR: 28228=
828=20
XER: 00000000
Apr 13 16:01:11 T600 kernel: DAR: 0050a0f0 DSISR: 40000000=20
                             GPR00: f19639d8 f1963838 ebd1de60 eb1dc070
00001000 00000003 f1aa14e8 00000000=20
                             GPR08: 00000000 0050a0f0 5d0dfdad fffffff0
c0255b78 00a48ff4 00000060 00000050=20
                             GPR16: eb1dc000 eb1df000 eb1de000 00000070
00000060 00000050 00000040 00000030=20
                             GPR24: 00000020 00000010 00000008 f1963a8c
f1963a78 eb1df010 eb1de010 00000000=20
Apr 13 16:01:11 T600 kernel: NIP [f1aa1564]
raid6_altivec8_gen_syndrome_real+0x3c4/0x480 [raid6_pq]
Apr 13 16:01:11 T600 kernel: LR [f1aa14e8]
raid6_altivec8_gen_syndrome_real+0x348/0x480 [raid6_pq]
Apr 13 16:01:11 T600 kernel: Call Trace:
Apr 13 16:01:11 T600 kernel: [f1963838] [0000000a] 0xa (unreliable)
Apr 13 16:01:11 T600 kernel: [f1963a28] [f1aa1654]
raid6_altivec8_gen_syndrome+0x34/0x58 [raid6_pq]
Apr 13 16:01:11 T600 kernel: [f1963a48] [f12603cc] init_module+0x3cc/0x530
[raid6_pq]
Apr 13 16:01:11 T600 kernel: [f1963b18] [c00058e4] do_one_initcall+0xb8/0x3=
6c
Apr 13 16:01:11 T600 kernel: [f1963be8] [c0117f64] do_init_module+0xa8/0x2c4
Apr 13 16:01:11 T600 kernel: [f1963c18] [c011ae38] load_module+0x2bd8/0x2d5c
Apr 13 16:01:11 T600 kernel: [f1963e18] [c011b230] sys_finit_module+0x100/0=
x138
Apr 13 16:01:11 T600 kernel: [f1963f38] [c001a224] ret_from_syscall+0x0/0x34
Apr 13 16:01:11 T600 kernel: --- interrupt: c01 at 0x892988
                                 LR =3D 0xa20a14
Apr 13 16:01:11 T600 kernel: Instruction dump:
Apr 13 16:01:11 T600 kernel: 1304c4c4 7d2048ce 39210090 1325ccc4 7d6048ce
1346d4c4 81210088 1367dcc4=20
Apr 13 16:01:11 T600 kernel: 8141008c 11284cc4 115f5b06 116b5800 <7c0048ce>
392100a0 7d8048ce 392100b0=20
Apr 13 16:01:11 T600 kernel: ---[ end trace ebe3b589d509d4f6 ]---
[...]

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
