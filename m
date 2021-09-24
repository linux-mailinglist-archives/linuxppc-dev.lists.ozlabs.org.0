Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0123417DB3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 00:17:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGRGv4py5z30gd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 08:17:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=icisRjuU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=icisRjuU; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGRG70YqDz2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Sep 2021 08:16:46 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5875760F9C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 22:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632521803;
 bh=cl6GMFu9jzYPs2KCLAq6Qm+hwe5yfYyBsoFnbKhsLkI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=icisRjuUwII+lTAURRO4s1SLIMmp9W9lsGDj3CRlpLc2qwQqY8o4pKoYL8z1d5Pvf
 +DQ3443xJI2qfO4hsDSgvvanUrFmZZX26abL5aup3P//1dgXU7hNOae/HHbWN1eIiw
 oozIEyk3K8hJxr2EFpr7KO8df9tWV9rzUIjWXrQ+zSjtTkAWxrknE1e1RAwjC2qkTO
 O9I+GGwE0VvqSBwC7PCXqjnV/ZHTu9UWICqi0tqxcZaWLYBcvlsn5ilRV1cX5g8lzU
 X/A7JwDJ5LEr7lUEy8YbRqyBUt9ChlQqvc5QyqlIJbqqqqVBOGC6a1p3lf5ZXCbdxo
 I2C68UrM2LxbQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 40A6E60FED; Fri, 24 Sep 2021 22:16:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Fri, 24 Sep 2021 22:16:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213837-206035-OYmGzWe8ei@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213837-206035@https.bugzilla.kernel.org/>
References: <bug-213837-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

--- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298959
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298959&action=3Dedit
kernel .config (5.15-rc2 + CONFIG_THREAD_SHIFT=3D15, PowerMac G5 11,2)

(In reply to mpe from comment #8)
> You could also try changing CONFIG_THREAD_SHIFT to 15, that might keep
> the system running a bit longer and give us some other clues.
The stack seems just large enough with CONFIG_THREAD_SHIFT=3D15 to not run =
into
this bug. I let the G5 build stuff via distcc in zram disk for a day withou=
t an
issue. With  CONFIG_THREAD_SHIFT=3D14 I hit the bug within minutes.

Just for completeness I'll upload the System.map and kernel .config with
CONFIG_THREAD_SHIFT=3D15.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
