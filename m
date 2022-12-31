Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2891965A57F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Dec 2022 16:23:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nkm940Hygz3c23
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Jan 2023 02:23:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HysJ0pAO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HysJ0pAO;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nkm84555sz3bWZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Jan 2023 02:22:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD1BD60AB6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Dec 2022 15:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FC14C433D2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Dec 2022 15:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672500129;
	bh=YvF1Llp2de7HAanaXl/oZHHVmFwLyjpv7w0aZBmxu8U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HysJ0pAOBsFy+CNKibHv80qTNzcczCOeFdwhW1gzRYUrsltAk3JgFmJyiJgvvWis+
	 GFCgmK4c5Li/N3U+vRL8tMEoIGJrFgyASGZlY5vx7OaLTvL3f7eHxLRxyBfi7XuF2l
	 3V6q4bEBZe8c4ktmyVrH3Vqel6ad6+wyOPvhD4f3VwwSvT0iRrZFfPzQvaekQKNAez
	 isqsHFK+u5AzaKDh8dIWCQLKJTTG/XYezQWKHENQ2t4OD/qT/qrtaXyrKIexQLJONo
	 7Roz1RrUzYI6UoeI345aTcPtcyPkVFP3Rz8zdz0cIsUbCEGL7ip99ce0LcSzBWcDPH
	 b0kszVs123vuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2FE18C43141; Sat, 31 Dec 2022 15:22:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216095] sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
Date: Sat, 31 Dec 2022 15:22:09 +0000
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
Message-ID: <bug-216095-206035-rgmW7QPqZj@https.bugzilla.kernel.org/>
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

--- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303509
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303509&action=3Dedit
dmesg (6.2-rc1, PowerMac G4 DP)

Now as the new ofdrm driver is in 6.2-rc1 the G4 fails to pick it up. ;)

When I try to load it manually as a module I get "Error: Driver 'of-display=
' is
already registered, aborting..." in the dmesg.

When I build it statically into the kernel it says "of-display: probe of
of-display failed with error -22".

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
