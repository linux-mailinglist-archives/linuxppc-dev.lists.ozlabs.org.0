Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9E957099F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 19:58:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhWny224Lz3c3G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 03:58:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LTE7odOq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LTE7odOq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhWnF5MLxz2xXw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 03:57:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DFFAB61386
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 17:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BFA8C34115
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 17:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657562254;
	bh=L0xhPAyCozwrHZIHuq7y8yLuORTVWkdACJU5X/wieH0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LTE7odOq3tnqawwf+MVOQn5vVcui8cZ72C8W1Y9PyyS6L1UWUoyQVzG2pF8HWxg4l
	 inrAdgRpHMsif3QSVEUnaqGyJbM7J7k9T6LZh4bb5fZ3YOyKk7F8Cfv34oaZu2Bj86
	 YOKVGhnGJKG97+CwxXirBGXDV6eO1RvZMVUhQJv3rm5ig4nzBCcXF1qxVBGgcegy9/
	 oYr5bOZk+EWU3WADUNB7QRom27r+vqtGD+XScegtOnI5cCWTCstPcoULmJpQmM40To
	 WpD96S9Y9KalqJtzXAxPob5S+fU2QGfslGWanCyet9TjfhENkVW21v5Uy60lU2y5X+
	 6MPchSB393JfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 37DE8CC13B0; Mon, 11 Jul 2022 17:57:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216238] Kernel 5.10.129 fails to boot on a Talos 2 with HASH
 MMU (PPC_RADIX_MMU not set) with CONFIG_PAGE_POISONING=y
Date: Mon, 11 Jul 2022 17:57:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216238-206035-bA1JVsxMCc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216238-206035@https.bugzilla.kernel.org/>
References: <bug-216238-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216238

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301394
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301394&action=3Dedit
kernel .config (kernel 5.10.129, with PAGE_POISONING, Talos II)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
