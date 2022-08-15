Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 642B15946F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 01:29:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M69VK1hG1z3c5q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 09:29:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gYn2cZAG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gYn2cZAG;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M69TZ1KGHz2xG4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 09:29:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A6B84B81235
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 23:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A975C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 23:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660606141;
	bh=QIE/nYTNxHlkIUM8iHPquamhnXGk6E1fkeaDynjn1PU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gYn2cZAG34nd34Z7D7uKTyTN+Rglm/Brozcj/kkL6LH1gIDBw7/pjJgqTu7uAsdyS
	 cRQyuKRGeR6SxRi9Ez6lEt/Pv8K95N1ARDVctv7xfKcqhTZTTMBidqbmvev+yd3Dya
	 3CtG1mQdaQ/meFopMqUXCP/005ZoLV5jHVokCRZlOfnQ6MF0aDKeEVRGYbwUCCmJga
	 naQmNOTT9bb7KggPfqtqVJ2wWmQvvwZn+zGOOxbd6pa4Jqr1t35TQ0naDxAiVDyTBp
	 jQT5z/GBbFVKtkSbWeQO3jxiJYzkoxvnAKtCty3Fwacy4ezYAjHZTLHE7AnfhPisqT
	 aZUw5Z7CgMX8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2FD25C433E6; Mon, 15 Aug 2022 23:29:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216095] sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
Date: Mon, 15 Aug 2022 23:29:00 +0000
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
Message-ID: <bug-216095-206035-miY9jYb0BK@https.bugzilla.kernel.org/>
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

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301576
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301576&action=3Dedit
dmesg (6.0-rc1, PowerMac G5 11,2)

Still a problem in 6.0-rc1:

[...]
sysfs: cannot create duplicate filename '/devices/platform/of-display'
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                T  6.0.0-rc1-PMacG5=
 #1
Call Trace:
[c0000000015eb620] [c0000000006d0200] .dump_stack_lvl+0x7c/0xc4 (unreliable)
[c0000000015eb6b0] [c0000000003c2684] .sysfs_warn_dup+0x74/0xa0
[c0000000015eb740] [c0000000003c287c] .sysfs_create_dir_ns+0x11c/0x160
[c0000000015eb7e0] [c0000000006d9190] .kobject_add_internal+0x130/0x380
[c0000000015eb890] [c0000000006d9b28] .kobject_add+0x68/0xf0
[c0000000015eb920] [c00000000079005c] .device_add+0x13c/0xb40
[c0000000015eba10] [c00000000087b408] .of_device_add+0x58/0x70
[c0000000015eba90] [c00000000087bbd0]
.of_platform_device_create_pdata+0xc0/0x170
[c0000000015ebb30] [c00000000103a718]
.of_platform_default_populate_init+0x1cc/0x20c
[c0000000015ebbd0] [c00000000000f7b4] .do_one_initcall+0x64/0x250
[c0000000015ebcb0] [c000000001004400] .kernel_init_freeable+0x2ec/0x388
[c0000000015ebda0] [c00000000000fc10] .kernel_init+0x20/0x190
[c0000000015ebe10] [c00000000000bb50] .ret_from_kernel_thread+0x58/0x60
kobject_add_internal failed for of-display with -EEXIST, don't try to regis=
ter
things with the same name in the same directory.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
