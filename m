Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E5D66AB7A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 14:12:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NvJc66Lbtz3fDF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 00:12:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mSv+0gxj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mSv+0gxj;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NvJb81Plbz3c1p
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jan 2023 00:11:48 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0032360B33
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 13:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EAF4C433D2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 13:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673701905;
	bh=DPfdE+beEx8txnwdo9WYNTRzsMgb69iq3s5u+FyoCvk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mSv+0gxjFoJ0yb94x18FdSl68bxVk0b5dhL+aeczLhLSr+lFbV6mkzIklAVfZl6Pl
	 oFS7roiu/eTdEjg8sS/DGyZppX9/APQnBBmCmMOfXPJQg5QstsGxXSLOEOc6PvlPtH
	 DiyQaFgqMksB4kbEi8rBg3vyUD8znEBu2FrYFTbjQsGUuiG+a0Si4y81y/kXoLjPCp
	 KL0c4NMFu8P2BRFnfU1N5AEw4gz8QIzmJzOp6J09HSuO+ISAkaUox2vpDQiECSA6af
	 jUOvgR2STor80xrEfUzUAGqHU5nrNhnNlFLIXtV1gO24GNtdOUt0PkFQrgR2rkESPP
	 Pg0QV8/lFe/aA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1E8A6C43142; Sat, 14 Jan 2023 13:11:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216095] sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
Date: Sat, 14 Jan 2023 13:11:44 +0000
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
Message-ID: <bug-216095-206035-Z1T1SeJmhX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216095-206035@https.bugzilla.kernel.org/>
References: <bug-216095-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216095

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #303509|0                           |1
        is obsolete|                            |

--- Comment #13 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303600
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303600&action=3Dedit
dmesg (6.2-rc3, PowerMac G4 DP)

(In reply to Michal Such=C3=A1nek from comment #12)
> Thanks for the DT dumps.
>=20
> So you really do have two outputs but the problem is likely different:
Two outputs? I got only a Radeon 9600 in the G4 and it does show up as a si=
ngle
card in lspci (no secondary output). Xorg.log. only shows a single device.

 # lspci=20
0000:00:0b.0 Host bridge: Apple Inc. UniNorth 2 AGP
0000:00:10.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/A=
TI]
RV350 [Radeon 9550/9600/X1050 Series]
0001:10:0b.0 Host bridge: Apple Inc. UniNorth 2 PCI
0001:10:12.0 USB controller: NEC Corporation OHCI USB Controller (rev 43)
0001:10:12.1 USB controller: NEC Corporation OHCI USB Controller (rev 43)
0001:10:12.2 USB controller: NEC Corporation uPD72010x USB 2.0 Controller (=
rev
04)
0001:10:13.0 Mass storage controller: Silicon Image, Inc. SiI 3112
[SATALink/SATARaid] Serial ATA Controller (rev 02)
0001:10:15.0 Serial controller: MosChip Semiconductor Technology Ltd. PCI 9=
865
Multi-I/O Controller
0001:10:15.1 Serial controller: MosChip Semiconductor Technology Ltd. PCI 9=
865
Multi-I/O Controller
0001:10:15.2 Parallel controller: Illegal Vendor ID Device 9865
0001:10:16.0 Network controller: Broadcom Inc. and subsidiaries BCM4306
802.11b/g Wireless LAN Controller (rev 02)
0001:10:17.0 Unassigned class [ff00]: Apple Inc. KeyLargo Mac I/O (rev 03)
0001:10:18.0 USB controller: Apple Inc. KeyLargo USB
0001:10:19.0 USB controller: Apple Inc. KeyLargo USB
0001:10:1b.0 USB controller: NEC Corporation OHCI USB Controller (rev 43)
0001:10:1b.1 USB controller: NEC Corporation OHCI USB Controller (rev 43)
0001:10:1b.2 USB controller: NEC Corporation uPD72010x USB 2.0 Controller (=
rev
04)
0002:20:0b.0 Host bridge: Apple Inc. UniNorth 2 Internal PCI
0002:20:0d.0 Unassigned class [ff00]: Apple Inc. UniNorth 2 ATA/100
0002:20:0e.0 FireWire (IEEE 1394): Apple Inc. UniNorth 2 FireWire (rev 01)
0002:20:0f.0 Ethernet controller: Apple Inc. UniNorth 2 GMAC (Sun GEM)

 # lspci -v -s 0000:00:10.0
0000:00:10.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/A=
TI]
RV350 [Radeon 9550/9600/X1050 Series] (prog-if 00 [VGA controller])
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] R9600 Pro primary
(Asus OEM for HP)
        Device tree node:
/sys/firmware/devicetree/base/pci@f0000000/ATY,AlteracParent@10
        Flags: bus master, 66MHz, medium devsel, latency 255, IRQ 48
        Memory at a0000000 (32-bit, prefetchable) [size=3D256M]
        I/O ports at 0400 [disabled] [size=3D256]
        Memory at 90000000 (32-bit, non-prefetchable) [size=3D64K]
        Expansion ROM at 90020000 [disabled] [size=3D128K]
        Capabilities: [58] AGP version 2.0
        Capabilities: [50] Power Management version 2

> The hardware-specific driver gets initialized earlier, and then the
> offb/ofdrm driver cannot get the resources for the framebuffer because the
> native driver is already using them.
>=20
> That should be fine but the message it prints is not exactly clear.
Ok. To rule out influence of other drivers I disabled them (# CONFIG_FB is =
not
set, # CONFIG_DRM_RADEON is not set) and only set CONFIG_DRM=3Dy,
CONFIG_DRM_OFDRM=3Dy but it made no difference. Sill I get this:
sysfs: cannot create duplicate filename '/devices/platform/of-display'
[...]
of-display: probe of of-display failed with error -22

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
