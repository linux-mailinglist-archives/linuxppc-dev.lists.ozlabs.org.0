Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B2C868513
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 01:41:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qmiopzOr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkJZc0ByCz3vXJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 11:41:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qmiopzOr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkJYp4tVSz3byl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 11:40:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9B9EECE1AF5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 00:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6B1FC433C7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 00:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708994441;
	bh=+7GvV3WXymZOdra6eUUWBmt9HyHlx6/TT+DKP3ejHCU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qmiopzOrbntYm4onsQRt+ytIhGvsGuWqmgQ2utWCm+NSubbvmyBhTBYgYIHbJMaE2
	 WUTra4lCzYWwQyIq6En0yxbdFBlCC+++4Nmw98X5lxndVplDRsdaH032HK2oOEHdtK
	 636RHXfhUk28sqkTzhpnnnF+6ivIUaVuw9yVfJVZyKr3mL/lpXusc7t0lswTDAKLIy
	 kUn1xrOzOA9ZzrvbIh1z3RWNgKpsHcWErd1k1g8DWlR74d6kol6CRHn/Zn/er2khBT
	 TQNLg2SkkKlafqT+OEV/gKQCA8VcB72qUVFNZHcLj3yQA0B00PmnqufCUYWUvq+x7u
	 AsTdCghQACmag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BCFB2C4332E; Tue, 27 Feb 2024 00:40:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 207129] PowerMac G4 DP (5.6.2 debug kernel + inline KASAN)
 freezes shortly after booting with "do_IRQ: stack overflow: 1760"
Date: Tue, 27 Feb 2024 00:40:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-207129-206035-Yg0i5THwEN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207129-206035@https.bugzilla.kernel.org/>
References: <bug-207129-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D207129

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|CLOSED                      |REOPENED
         Resolution|CODE_FIX                    |---

--- Comment #8 from Erhard F. (erhard_f@mailbox.org) ---
Currently (as of v6.8-rc6) and since quite a while my G4 does not boot at a=
ll
with CONFIG_KASAN_INLINE=3Dy.

When I try booting an KASAN_INLINE enabled kernel it fails with an invalid
memory access and I get dropped out to the OpenFirmaware console.

A small difference is when I boot the 56M vmlinux-6.8.0-rc6-PMacG4:

Please wait, loading kernel...
   Elf32 kernel loaded...

Invalid memory access at   %SRR0: 00000013   %SRR1: 00001300

Apple PowerMac3,6 4.6.0f1 BootROM built on 02/20/03 at 13:52:27
[...]


vs. booting the 16M arch/powerpc/boot/zImage:


Please wait, loading kernel...
   Elf32 kernel loaded...

zImage starting: loaded at 0x00400000 (sp: 0x012eefb0)
OF version =3D 'OpenFirmware 3'
Allocating 0x2c337e0 bytes for kernel...
Trying to claim from 0x400000 to 0x12ef5d8 (0xeef5d8) got ffffffff
Decompressing (0x01414000 <- 0x00410000:0x12ea9c9)...
Done! Decompressed 0x2bcc80c bytes

Linux/PowerPC load: ro root=3D/dev/sda5 slub_debug=3DFZP page_poison=3D1
netconsole=3D6666@192.168.2.8/eth0,6666@192.168.2.3/A8:A1:59:16:4F:EA debug

Finalizing device tree... using OF tree (promptr=3Dff847240)

Invalid memory access at   %SRR0: 40000000   %SRR1: 00000000

Apple PowerMac3,6 4.6.0f1 BootROM built on 02/20/03 at 13:52:27
[...]


Same kernel with CONFIG_KASAN_OUTLINE=3Dy instead of KASAN_INLINE boots and=
 runs
ok.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
