Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D68628DC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 00:53:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NB5jx6p5bz3cjY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 10:53:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BSnocln1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BSnocln1;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NB5hy4gl6z2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 10:52:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C607CB815FA
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 23:52:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76074C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 23:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668469964;
	bh=JbEL/9zXB4UrCoSyTp/0oQUzAWs3F6LPezvCJUPtHnc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BSnocln1w37CzCqA6jmoylFPPAsp0rPKVsD6fV2vdKwr+wa/a6FWXuvefBVEtUMTp
	 PMOhTBMrfwwYhyQTkpoK//4xSu7Nhca+uUSZvTpGkb7Pe3rMohOJh8DnNGim3P43ak
	 c7AuVSE4y5ggSzQEu0zf3j2Y9ptPSTO4MJy4eKDYv/22pUi+e6ZVOwj1G1GUQK1jN1
	 7UNGZI9TeurRQ6LgtXf/3D/3MN5wKfBfDL7DmIB2WBkuh6wUUPzVVploABKO1l7cMx
	 MX5YBHxRqxD0yVWaEgKfLWJG6Oqzk0VEpVDe5irIPpNhI1gljJ/7TGerpXnKk4NutG
	 IU1yKV9buCGLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 53783C433E6; Mon, 14 Nov 2022 23:52:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216095] sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
Date: Mon, 14 Nov 2022 23:52:44 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216095-206035-ogsUE2rddP@https.bugzilla.kernel.org/>
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

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303182
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303182&action=3Dedit
dmesg (6.0-rc1, PowerMac G5 11,2)

Still shows up in 6.1-rc5:

[...]
sysfs: cannot create duplicate filename '/devices/platform/of-display'
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                T  6.1.0-rc5-PMacG5=
 #2
Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
Call Trace:
[c000000001b37610] [c000000000b4e7c0] .dump_stack_lvl+0x7c/0xd8 (unreliable)
[c000000001b376a0] [c00000000040c338] .sysfs_warn_dup+0x78/0xc0
[c000000001b37730] [c00000000040c56c] .sysfs_create_dir_ns+0x13c/0x160
[c000000001b377d0] [c000000000b5869c] .kobject_add_internal+0x14c/0x3c0
[c000000001b37870] [c000000000b590a8] .kobject_add+0x68/0x100
[c000000001b37900] [c0000000008074b0] .device_add+0xe0/0xbd0
[c000000001b379f0] [c000000000909f44] .of_device_add+0x44/0x70
[c000000001b37a60] [c00000000090a790]
.of_platform_device_create_pdata+0xc0/0x160
[c000000001b37b00] [c0000000010737e8]
.of_platform_default_populate_init+0x41c/0x4c4
[c000000001b37be0] [c00000000000fa84] .do_one_initcall+0x84/0x2b8
[c000000001b37cc0] [c000000001005c98] .kernel_init_freeable+0x420/0x54c
[c000000001b37da0] [c00000000000ff50] .kernel_init+0x20/0x190
[c000000001b37e10] [c00000000000bd58] .ret_from_kernel_thread+0x58/0x60
kobject_add_internal failed for of-display with -EEXIST, don't try to regis=
ter
things with the same name in the same directory.
PCI: Probing PCI hardware

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
