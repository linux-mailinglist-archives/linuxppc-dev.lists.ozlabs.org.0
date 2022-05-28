Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A25536E17
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 20:51:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9W325g4Sz3c7N
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 04:50:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Irsku3R6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Irsku3R6;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9W2J1rsXz3bk4
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 May 2022 04:50:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA46E60E8D
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 18:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16D26C34100
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 18:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653763813;
	bh=w5S6+3n9UCFdsdmPFHj/szHr2oMxQob6Q7qqQ2u40pw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Irsku3R6l+Ae672VFE7uscRf9wtgcjEtm1VXYYppQr1+tFX1bSv+e7rIA25yj4CH8
	 mQXkLQ011F+tfQtDUaOmKChAskNw1y44hWx5sB024QujJGgP09JScG2pHnxhpY5x16
	 b30fSDfkY2puaOwslr+4VrCqL3xtsd9bBA+MzQEogPu2OYFse4LjCRXI71uAc1woY2
	 Kwe16zb8ROlPmtIMdBRs/1FUblrHCHFX2tjnz8gl7a6pKUP7eEiygzsCxOhB9CkLpB
	 trM9iOLHT1ZYVEG1wEjHZWsEzglK7+TcPsbpHkISc8UdEsZpKX8HOjK6ZucaQateMZ
	 ebuHIISBLKRLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F1234C05FD4; Sat, 28 May 2022 18:50:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216041] Stack overflow at boot (do_IRQ: stack overflow: 1984)
 on a PowerMac G4 DP, KASAN debug build
Date: Sat, 28 May 2022 18:50:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arnd@arndb.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216041-206035-VofFoHiJIj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216041-206035@https.bugzilla.kernel.org/>
References: <bug-216041-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216041

Arnd Bergmann (arnd@arndb.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |arnd@arndb.de

--- Comment #4 from Arnd Bergmann (arnd@arndb.de) ---
Setting it higher is probably a good idea, but there really isn't a safe li=
mit
with KASAN, at least if KASAN_STACK is active, running with KASAN always ha=
s a
risk of running into stack overflow issues.

One thing that sticks out is that there is an interrupt on the same stack as
the task, in=20

[eaa1c800] [c0009258] do_IRQ+0x20/0x34
[eaa1c820] [c00045b4] HardwareInterrupt_virt+0x108/0x10c
[eaa1c920] [c0c59b2c] __schedule+0x3f0/0x9dc
[eaa1c9b0] [c0c5a18c] schedule+0x74/0x13c


It looks like on ppc32, as of 547db12fd8a0 ("powerpc/32: Use vmapped stacks=
 for
interrupts"), you have either VMAP_STACK (to detect stack overflows) or IRQ
stacks (to make them less likely). I think you really want both instead, and
allocate the  IRQ stacks from vmalloc space as well.

The ext4 read path is a bit wasteful with KASAN enabled, using 1776 bytes f=
rom
ext4_lookup to ext4_read_bh, but not excessively so.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
