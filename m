Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6944468C77
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Dec 2021 18:49:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6Yvz66jXz30BM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 04:49:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sPfpAKQK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sPfpAKQK; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6YvC408yz2xC3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 04:48:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 28F88B80ED3
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Dec 2021 17:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0559C00446
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Dec 2021 17:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638726498;
 bh=xzVYVC9zD7cqGNWf2nuQvwYICW5oMMuR5muLTxisIEE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sPfpAKQK1czyGfXYg2uW/zAR9xQqxD+N7AeyU6vlMRPG18Gh3Pe/17SXT+yvRO8Kz
 0ACxJuPC2/HXIYqVTUEhFQMXnaGmWSWcJtj2hZw4nt01w+vh6VWe6l9u/U8keaxgzF
 DsRD+mekGcyp6pzlXe6frNpNwNOXo+/hC7ivxIhkcPpNywPSyVPkKNO8aJBw5vivcA
 OONWOQsiILnSzGpiiJjfl9Vo4KI+DqTRjpt7BnDfe+eFYT00XEVtxMkH1brH31FYY6
 r4NRtTMorz2ay/6cFaueJ+4amZagmxSVt1HiUgzFLnhGDVWQ5b8vEslg1WZtQpcUHQ
 2o/lGoU3TYv9g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B2AC160FD8; Sun,  5 Dec 2021 17:48:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215217] Kernel fails to boot at an early stage when built with
 GCC_PLUGIN_LATENT_ENTROPY=y (PowerMac G4 3,6)
Date: Sun, 05 Dec 2021 17:48:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215217-206035-FCuYD8w5BQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215217-206035@https.bugzilla.kernel.org/>
References: <bug-215217-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215217

--- Comment #3 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
I tried your config under QEMU and it works. So I don't know how I could he=
lp.

>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> OpenBIOS 1.1 [Jul 22 2021 22:33]
>> Configuration device id QEMU version 1 machine id 1
>> CPUs: 1
>> Memory: 2048M
>> UUID: 00000000-0000-0000-0000-000000000000
>> CPU type PowerPC,G4
milliseconds isn't unique.
Welcome to OpenBIOS v1.1 built on Jul 22 2021 22:33
>> [ppc] Kernel already loaded (0x01000000 + 0x00f39460) (initrd 0x0203a000=
 +
>> 0x001d1a3b)
>> [ppc] Kernel command line: noreboot
>> switching to new context:
OF stdout device is: /pci@f2000000/mac-io@c/escc@13000/ch-a@13020
Preparing to boot Linux version 5.16.0-rc3-PowerMacG4+
(chleroy@PO20335.IDSI0.si.c-s.fr) (powerpc64-linux-gcc (GCC) 11.1.0, GNU ld
(GNU Binutils) 2.36.1) #669 SMP Sun Dec 5 18:41:30 CET 2021
Detected machine type: 00000400
command line:=20=20
memory layout at init:
  memory_limit : 00000000 (16 MB aligned)
  alloc_bottom : 01f3e000
  alloc_top    : 30000000
  alloc_top_hi : 80000000
  rmo_top      : 30000000
  ram_top      : 80000000
found display   : /pci@f2000000/QEMU,VGA@e, opening... done
copying OF device tree...
Building dt strings...
Building dt structure...
Device tree strings 0x01f3f000 -> 0x01f3e0a4
Device tree struct  0x01f40000 -> 0x7fde7ef8
Quiescing Open Firmware ...
Booting Linux via __start() @ 0x01000000 ...
Hello World !
Total memory =3D 2048MB; using 4096kB for hash table
Activating Kernel Userspace Execution Prevention
Activating Kernel Userspace Access Protection
Linux version 5.16.0-rc3-PowerMacG4+ (chleroy@PO20335.IDSI0.si.c-s.fr)
(powerpc64-linux-gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #669 SMP S=
un
Dec 5 18:41:30 CET 2021
KASAN init done
ioremap() called early from pmac_feature_init+0x248/0xfe4. Use early_iorema=
p()
instead
Found UniNorth memory controller & host bridge @ 0xf8000000 revision: 0x07
Mapped at 0xf53bf000
ioremap() called early from probe_one_macio+0x228/0x414. Use early_ioremap()
instead
Found a Keylargo mac-io controller, rev: 0, mapped at 0x(ptrval)
PowerMac motherboard: PowerMac G4 AGP Graphics
ioremap() called early from udbg_scc_init+0x1dc/0x380. Use early_ioremap()
instead
boot stdout isn't a display !
Using PowerMac machine description
printk: bootconsole [udbg0] enabled
CPU maps initialized for 1 thread per core

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
