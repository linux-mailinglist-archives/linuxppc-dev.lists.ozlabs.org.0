Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EE68B68C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 13:23:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4679MK74WbzDqgn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 21:23:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4679KP5P7GzDqfJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 21:22:01 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id D2C9F285E5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 11:21:58 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id C5A9A28617; Tue, 13 Aug 2019 11:21:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204479] KASAN hit at modprobe zram
Date: Tue, 13 Aug 2019 11:21:57 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Flash/Memory Technology Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: dwmw2@infradead.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204479-206035-yggrwokVsI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204479-206035@https.bugzilla.kernel.org/>
References: <bug-204479-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204479

--- Comment #20 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Christophe Leroy from comment #18)
> Two possibilities, either the value in .rodata.cst16 is wrong or the stack
> gets corrupted.
>=20
> Maybe you could try disabling KASAN in lib/raid6/Makefile for altivec8.o ?
> Or maybe for the entire lib/raid6/ directory, just to see what happens ?
Disabled KASAN with KASAN_SANITIZE :=3D n in lib/raid6/Makefile. As you can=
 see
in my latest dmesg, the G4 continues booting without further issues.

If btrfs gets loaded it still fails with KASAN (will update bug #204397).

Another funny issue. Mounting my nfs share works via:
modprobe nfs
mount /media/distanthome

If I mount it without modprobing nfs beforehand I get:
[...]
[   66.271748]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   66.272076] BUG: KASAN: global-out-of-bounds in _copy_to_iter+0x3d4/0x5a8
[   66.272331] Write of size 4096 at addr f1c27000 by task modprobe/312

[   66.272598] CPU: 0 PID: 312 Comm: modprobe Tainted: G        W=20=20=20=
=20=20=20=20=20
5.3.0-rc4+ #1
[   66.272883] Call Trace:
[   66.272964] [e100b848] [c075026c] dump_stack+0xb0/0x10c (unreliable)
[   66.273211] [e100b878] [c02334a8] print_address_description+0x80/0x45c
[   66.273456] [e100b908] [c0233128] __kasan_report+0x140/0x188
[   66.273667] [e100b948] [c0233fbc] check_memory_region+0x28/0x184
[   66.273889] [e100b958] [c023206c] memcpy+0x48/0x74
[   66.274061] [e100b978] [c044342c] _copy_to_iter+0x3d4/0x5a8
[   66.274265] [e100baa8] [c04437a8] copy_page_to_iter+0x90/0x550
[   66.274482] [e100bb08] [c01b6898] generic_file_read_iter+0x5c8/0x7bc
[   66.274720] [e100bb78] [c0249034] __vfs_read+0x1b0/0x1f4
[   66.274912] [e100bca8] [c0249134] vfs_read+0xbc/0x124
[   66.275094] [e100bcd8] [c02491f0] kernel_read+0x54/0x70
[   66.275284] [e100bd08] [c02535c8] kernel_read_file+0x240/0x358
[   66.275499] [e100bdb8] [c02537cc] kernel_read_file_from_fd+0x54/0x74
[   66.275737] [e100bdf8] [c01068ac] sys_finit_module+0xd8/0x140
[   66.275949] [e100bf38] [c001a274] ret_from_syscall+0x0/0x34
[   66.276152] --- interrupt: c01 at 0xa602c4
                   LR =3D 0xbe87c4


[   66.276417] Memory state around the buggy address:
[   66.276588]  f1c27a00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   66.276824]  f1c27a80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   66.277060] >f1c27b00: 00 00 00 00 00 00 00 00 05 fa fa fa fa fa fa fa
[   66.277293]                                    ^
[   66.277453]  f1c27b80: 07 fa fa fa fa fa fa fa 00 03 fa fa fa fa fa fa
[   66.277688]  f1c27c00: 04 fa fa fa fa fa fa fa 00 06 fa fa fa fa fa fa
[   66.277920]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   66.428224] RPC: Registered named UNIX socket transport module.
[   66.428484] RPC: Registered udp transport module.
[   66.428647] RPC: Registered tcp transport module.
[   66.428809] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   66.741275] Key type dns_resolver registered
[   67.974192] NFS: Registering the id_resolver key type
[   67.974534] Key type id_resolver registered
[   67.974681] Key type id_legacy registered


But maybe it's better to not open too many ppc32 KASAN related bugs for now=
. ;)
It probably can wait until you patches are in some later 5.3-rc I guess.

--=20
You are receiving this mail because:
You are on the CC list for the bug.=
