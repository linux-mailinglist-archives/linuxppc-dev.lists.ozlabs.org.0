Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBF3170323
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 16:52:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SKzx5pqBzDqXf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 02:51:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=+jiy=4o=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SKxY3KSSzDqdj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 02:49:53 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205099] KASAN hit at raid6_pq: BUG: Unable to handle kernel
 data access at 0x00f0fd0d
Date: Wed, 26 Feb 2020 15:49:50 +0000
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
Message-ID: <bug-205099-206035-It6X7MlCRs@https.bugzilla.kernel.org/>
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
 Attachment #286251|0                           |1
        is obsolete|                            |
 Attachment #286397|0                           |1
        is obsolete|                            |
 Attachment #286929|0                           |1
        is obsolete|                            |

--- Comment #25 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 287621
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D287621&action=3Dedit
dmesg (5.6-rc3+, KASAN_VMALLOC + VMAP_STACK + OUTLINE KASAN, PowerMac G4 DP)

Gave 5.6-rc3 + KASAN_VMALLOC + VMAP_STACK + OUTLINE KASAN a test ride and i=
t's
still in:

[...]
Feb 26 16:29:30 T600 kernel: BUG: Unable to handle kernel data access on re=
ad
at 0x0050a0f0
Feb 26 16:29:30 T600 kernel: Faulting instruction address: 0xf168b560
Feb 26 16:29:30 T600 kernel: Oops: Kernel access of bad area, sig: 11 [#1]
Feb 26 16:29:30 T600 kernel: BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 P=
owerMac
Feb 26 16:29:30 T600 kernel: Modules linked in: raid6_pq(+) libcrc32c
zlib_inflate snd_aoa_i2sbus snd_aoa_soundbus snd_pcm ohci_hcd ehci_pci(+) s=
sb
snd_timer ehci_hcd pcmcia snd pcmcia_core soundcore uninorth_agp usbcore
agpgart usb_common
Feb 26 16:29:30 T600 kernel: CPU: 1 PID: 118 Comm: modprobe Tainted: G     =
   W
        5.6.0-rc3-PowerMacG4+ #1
Feb 26 16:29:30 T600 kernel: NIP:  f168b560 LR: f168b4e8 CTR: c024b2e0
Feb 26 16:29:30 T600 kernel: REGS: f10bd780 TRAP: 0300   Tainted: G        =
W=20=20=20
      (5.6.0-rc3-PowerMacG4+)
Feb 26 16:29:30 T600 kernel: MSR:  02009032 <VEC,EE,ME,IR,DR,RI>  CR: 28228=
828=20
XER: 00000000
Feb 26 16:29:30 T600 kernel: DAR: 0050a0f0 DSISR: 40000000=20
                             GPR00: f10bd9d8 f10bd838 ebeca380 ec56c070
00000010 00000000 f168b4e8 00000000=20
                             GPR08: 00000000 0050a0f0 5d0dfdad fffffff0
c024b2e0 007efff4 00000060 00000050=20
                             GPR16: ec56c000 ec56f000 ec56e000 00000070
00000060 00000050 00000040 00000030=20
                             GPR24: 00000020 00000010 00000008 f10bda8c
f10bda78 ec56f010 ec56e010 00000000=20
Feb 26 16:29:30 T600 kernel: NIP [f168b560]
raid6_altivec8_gen_syndrome_real+0x3c0/0x480 [raid6_pq]
Feb 26 16:29:30 T600 kernel: LR [f168b4e8]
raid6_altivec8_gen_syndrome_real+0x348/0x480 [raid6_pq]
Feb 26 16:29:30 T600 kernel: Call Trace:
Feb 26 16:29:30 T600 kernel: [f10bd838] [0000000a] 0xa (unreliable)
Feb 26 16:29:30 T600 kernel: [f10bda28] [f168b654]
raid6_altivec8_gen_syndrome+0x34/0x58 [raid6_pq]
Feb 26 16:29:30 T600 kernel: [f10bda48] [f145b3cc] init_module+0x3cc/0x530
[raid6_pq]
Feb 26 16:29:30 T600 kernel: [f10bdb18] [c00058e4] do_one_initcall+0xb8/0x3=
6c
Feb 26 16:29:30 T600 kernel: [f10bdbe8] [c010f760] do_init_module+0xa8/0x2c4
Feb 26 16:29:30 T600 kernel: [f10bdc18] [c0112630] load_module+0x2bd4/0x2d58
Feb 26 16:29:30 T600 kernel: [f10bde18] [c0112a28] sys_finit_module+0x100/0=
x138
Feb 26 16:29:30 T600 kernel: [f10bdf38] [c001a234] ret_from_syscall+0x0/0x34
Feb 26 16:29:30 T600 kernel: --- interrupt: c01 at 0x639988

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
