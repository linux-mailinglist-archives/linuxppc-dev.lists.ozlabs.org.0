Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A232200C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 00:37:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5wPh2mf7zDqbX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 08:37:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=x8ix=az=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5wMq1PD4zDqDP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 08:35:50 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 208181] BUG: KASAN: stack-out-of-bounds in strcmp+0x58/0xd8
Date: Tue, 14 Jul 2020 22:35:48 +0000
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
Message-ID: <bug-208181-206035-f8VXs53nw3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208181-206035@https.bugzilla.kernel.org/>
References: <bug-208181-206035@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #289937|0                           |1
        is obsolete|                            |

--- Comment #16 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 290285
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D290285&action=3Dedit
kernel .config (5.8-rc5, PowerMac G4 DP)

Did some additional test-runs, seems there are still problems with stack us=
age
when running (inline) KASAN:

5.8-rc3 + the 2 patches applied:
Instruction dump:
usercopy: Kernel memory overwrite attemp detected to kernel text (offset 54=
32,
size 4)!
------------[ cut here ]------------
kernel BUG at mm/usercopy.c:99!
Oops: Exeption in kernel mode, sig:5 [#6]
BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc
b43legacy input_leds joydev mac80211 hid_generic g4_windtunnel sungem
sungem_phy btrfs ohci_pci xor lzo_compress lzo_decompress zlib_deflate raid=
6_pq
zlib_inflate firewire_ohci hcd soundcore ssb pcmcia usbcore uninorth_agp
pcmcia_core agpart usb_common
CPU: 1 PID: 5250 Comm: mount.nfs Tainted: G       W=20=20=20=20=20=20=20
5.8.0-rc3-PowerMacG4+ #8
NIP: c04d654c LR: c04d654c CTR: 00000000
REGS: c0001198 TRAP: 0700  Tainted: G       W        (5.8.0-rc3-PowerMacG4+)
MSR:  00021031 <MR,IR,DR,RI> CR: 24028822 XER: 00000000

GPR00: c04d654c c0001498 e719b980 00000058 c01899f4 00000000 00000027 e8dc4=
e0c
GPR08: 00000023 00000000 00000000 c0001498 44028822 0061bff4 f80002s9 00000=
003
GPR16: c115a340 f80002d7 c00016b8 c00016c8 c04d654c c115a260 c04d651c f8000=
2d5
GPR24: c00016ac 180002d5 e8dda024 c0000000 c000153c 00000000 00000004 c0001=
538
NIP [c04d654c] usercopy_abort+0x68/0x78
LR [c04d654c] usercopy_abort+0x68/0x78
Call Trace:
Instruction dump:
usercopy: Kernel memory overwrite attemp detected to kernel text (offset 48=
48,
size 4)!
------------[ cut here ]------------
kernel BUG at mm/usercopy.c:99!
Oops: Exeption in kernel mode, sig:5 [#7]
BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
Modules linked in: auth_rpcgss nfsv4 dns_resolver nfs lockd grace sunrpc
b43legacy input_leds joydev mac80211 hid_generic g4_windtunnel sungem
sungem_phy btrfs ohci_pci xor lzo_compress lzo_decompress zlib_deflate raid=
6_pq
zlib_inflate firewire_ohci hcd soundcore ssb pcmcia usbcore uninorth_agp
pcmcia_core agpart usb_common
CPU: 1 PID: 5250 Comm: mount.nfs Tainted: G       W=20=20=20=20=20=20=20
5.8.0-rc3-PowerMacG4+ #8
NIP: c04d654c LR: c04d654c CTR: 00000000
REGS: c0001198 TRAP: 0700  Tainted: G       W        (5.8.0-rc3-PowerMacG4+)
MSR:  00021031 <MR,IR,DR,RI> CR: 24028822 XER: 00000000

GPR00: c04d654c c0001250 e719b980 00000058 c01899f4 00000000 00000027 e8dc4=
e0c
GPR08: 00000023 00000000 00000000 c0001250 44028822 0061bff4 f8000290 00000=
003
GPR16: c115a340 f800028e c0001470 c0001480 c04d654c c115a260 c04d651c f8000=
28c
GPR24: c0001464 1800028c e8dda024 c0000000 c00012f4 00000000 00000004 c0001=
2f0
NIP [c04d654c] usercopy_abort+0x68/0x78
Unrecoverable FP Unavailable Exception 801 at 908
LR [c04d654c] usercopy_abort+0x68/0x78
Call Trace:


5.8-rc5 + the 2 patches applied:
do_IRQ: stack overflow: 1984
CPU: 1 PID: 347 Comm: gzip Tainted: G       W        5.8.0-rc5-PowerMacG4+ =
#1
Call Trace:

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
