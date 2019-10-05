Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CDFCCCA2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Oct 2019 22:10:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lyXC33YZzDqHx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Oct 2019 07:10:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=yxab=x6=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lySn37ChzDqDF
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Oct 2019 07:07:03 +1100 (AEDT)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204789] Boot failure with more than 256G of memory on Power9
 with 4K pages & Hash MMU
Date: Sat, 05 Oct 2019 20:07:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: samuel@sholland.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204789-206035-vLVyW1CYLf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204789-206035@https.bugzilla.kernel.org/>
References: <bug-204789-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204789

Samuel Holland (samuel@sholland.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |samuel@sholland.org

--- Comment #12 from Samuel Holland (samuel@sholland.org) ---
I am also experiencing this issue on a Talos II, however with much less RAM.
Right now I have 16 GB attached to each CPU:

# grep RAM /proc/iomem=20
00000000-3ffffffff : System RAM
200000000000-2003ffffffff : System RAM

Without the patchset linked above, I also have a failure to boot with 5.2 a=
nd
later kernels.

(/proc/cmdline)
console=3Dhvc0 disable_radix ignore_loglevel no_console_suspend

With the first patch from the patchset linked above, the RAM attached to the
second node is ignored, as expected, but the system boots and otherwise runs
fine.

With the full patchset linked above, I get panics on boot, as mentioned in
comment 9:

[    5.286513] Oops: Machine check, sig: 7 [#1]
[    5.286536] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D256 NUMA PowerNV
[    5.286545] Modules linked in: soundcore
[    5.286554] CPU: 4 PID: 0 Comm: swapper/4 Tainted: G   M=20=20=20=20=20=
=20=20=20=20=20=20=20=20
5.3.4-00012-g8fc24abb8c31 #1
[    5.286569] NIP:  0000000000000000 LR: 7265677368657265 CTR:
0000000000000000
[    5.286590] REGS: c0000003ffb66fb0 TRAP: c00000000120dd00   Tainted: G  =
 M=20=20
            (5.3.4-00012-g8fc24abb8c31)
[    5.286602] MSR:  0000000000000000 <>  CR: c000000000036f04  XER: 000000=
00
[    5.286611] CFAR: 0000000000000000 IRQMASK: c0000003ffb67370
[    5.286611] GPR00: 0000000000000000 c0003d0000083d28 ffffffffffffffff
0000000006000000
[    5.286611] GPR04: 0500000002010101 00c75e1bc4c00a58 ffffffffffffffff
c000000000036530
[    5.286611] GPR08: c0003d0000083d28 c0000003ffb67510 0000000000000000
c0000003ffb670e0
[    5.286611] GPR12: c0000003ffb67040 8804422200000000 c0000000000804ec
c00000000120dd00
[    5.286611] GPR16: 0000000000000000 c0000003ffb673fc c0000003ffb67070
0000000000000000
[    5.286611] GPR20: c0000000000367f4 c00000000120dd00 0000000000000000
c0000003ffb670e0
[    5.286611] GPR24: c0000003ffb67370 0000000000000000 c000000000008380
0000000000000000
[    5.286611] GPR28: 0000000000000000 0000000000000000 0000000000000000
0000000000000000
[    5.286777] NIP [0000000000000000] 0x0
[    5.286792] LR [7265677368657265] 0x7265677368657265
[    5.286809] Call Trace:
[    5.286823] Instruction dump:
[    5.286838] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXX=
XX
XXXXXXXX
[    5.286858] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 60000000 60000000 600000=
00
60000000
[    5.286889] ---[ end trace 60912b64b73c973e ]---
[    5.819189]
[    5.819203] Oops: Machine check, sig: 7 [#2]
[    5.819205] Disabling lock debugging due to kernel taint
[    5.819223] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D256 NUMA PowerNV
[    5.819233] Modules linked in: snd_hda_intel(+) snd_hda_codec snd_hwdep
snd_hda_core snd_pcm tg3(+) snd_timer snd libphy ttm soundcore
[    5.819264] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G   M  D=20=20=20=20=
=20=20=20=20=20=20
5.3.4-00012-g8fc24abb8c31 #1=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
[    5.819286] NIP:  0000000000000000 LR: 7265677368657265 CTR:
0000000000000000
[    5.819315] REGS: c0000003ffb7efb0 TRAP: c00000000120dd00   Tainted: G  =
 M=20
D            (5.3.4-00012-g8fc24abb8c31)=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
[    5.819328] MSR:  0000000000000000 <>  CR: c000000000036f04  XER: 000000=
00
[    5.819347] CFAR: 0000000000000000 IRQMASK: c0000003ffb7f370
[    5.819347] GPR00: 0000000000000000 c0003d0000063d28 ffffffffffffffff
0000000006000000
[    5.819347] GPR04: 0500000002010101 000ed5d8325a5873 ffffffffffffffff
c000000000036530
[    5.819347] GPR08: c0003d0000063d28 c0000003ffb7f510 0000000000000000
c0000003ffb7f0e0
[    5.819347] GPR12: c0000003ffb7f040 8804424200000000 c0000000000804ec
c00000000120dd00
[    5.819347] GPR16: 0000000000000000 c0000003ffb7f3fc c0000003ffb7f070
0000000000000000
[    5.819347] GPR20: c0000000000367f4 c00000000120dd00 0000000000000000
c0000003ffb7f0e0
[    5.819347] GPR24: c0000003ffb7f370 0000000000000000 c000000000008380
0000000000000000
[    5.819347] GPR28: 0000000000000000 0000000000000000 0000000000000000
0000000000000000
[    5.819537] NIP [0000000000000000] 0x0
[    5.819554] LR [7265677368657265] 0x7265677368657265
[    5.819562] Call Trace:
[    5.819567] Instruction dump:
[    5.819573] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXX=
XX
XXXXXXXX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    5.819603] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 60000000 60000000 600000=
00
60000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    5.819648] ---[ end trace 60912b64b73c973f ]---=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311806]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311820] Oops: Machine check, sig: 7 [#3]=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311829] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D256 NUMA PowerNV=
=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311839] Modules linked in: snd_hda_intel(+) snd_hda_codec snd_hwdep
snd_hda_core snd_pcm tg3(+) snd_timer snd libphy ttm soundcore=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311869] CPU: 0 PID: 734 Comm: udevd Tainted: G   M  D=20=20=20=20=20=
=20=20=20=20=20
5.3.4-00012-g8fc24abb8c31 #1=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311882] NIP:  0000000000000000 LR: 7265677368657265 CTR:
0000000000000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311903] REGS: c0000003ffbc6fb0 TRAP: c00000000120dd00   Tainted: G  =
 M=20
D            (5.3.4-00012-g8fc24abb8c31)=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
[    6.311917] MSR:  0000000000000000 <>  CR: c000000000036f04  XER: 000000=
00=20=20=20
[    6.311937] CFAR: 0000000000000000 IRQMASK: c0000003ffbc7370=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311937] GPR00: 0000000000000000 c0003d0000003d28 ffffffffffffffff
0000000006000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311937] GPR04: 0500000002010101 00b492f4c8c2175c ffffffffffffffff
c000000000036530=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311937] GPR08: c0003d0000003d28 c0000003ffbc7510 0000000000000000
c0000003ffbc70e0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311937] GPR12: c0000003ffbc7040 8024428200000000 c0000000000804ec
c00000000120dd00=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311937] GPR16: 0000000000000000 c0000003ffbc73fc c0000003ffbc7070
0000000000000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311937] GPR20: c0000000000367f4 c00000000120dd00 0000000000000000
c0000003ffbc70e0=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311937] GPR24: c0000003ffbc7370 0000000000000000 c000000000008380
0000000000000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.311937] GPR28: 0000000000000000 0000000000000000 0000000000000000
0000000000000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.312109] NIP [0000000000000000] 0x0=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20
[    6.312126] LR [7265677368657265] 0x7265677368657265=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.312143] Call Trace:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.312148] Instruction dump:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
[    6.312155] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXX=
XX
XXXXXXXX=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.312190] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 60000000 60000000 600000=
00
60000000=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.312226] ---[ end trace 60912b64b73c9740 ]---=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
[    6.819242] Kernel panic - not syncing: Fatal

I have easy physical access to this machine, so I'd be able to try out patc=
hes
if needed.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
