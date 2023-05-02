Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1306F431A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 13:53:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9dl60Jjnz3c9R
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 21:53:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PGR6q92t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PGR6q92t;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9dkH0XV2z307T
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 21:52:54 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EA986233E
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 11:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12DDBC433D2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 11:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683028371;
	bh=PqiUs849uz2pRjGAI9PCXxP2D9fp9UG7fWkaVbgTszU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PGR6q92tDd0ZY53IPjYw+onZcS5R3LoOPe4R7aXrr9bJi5IP3+kQBWW/7TFTYwZYX
	 XBjlHIQ8uLv0pDuvfLiHUyx+E5I2eYMQENvlmeXSl1L4QjAfgnOHPgJMR3f8Y9FfGJ
	 Z3zniib94I4m19k+lxAA4xYbf3FoTXMAY2UMEo1TwB+uzUn8kjgsv6P9AEai1pMCZg
	 FbQ7sYjZPHpSvUdspLgV+lu8ORc6jv9DgSfKyR5A3cgKLP9Bxbib1JCLBHCSYVGQ9r
	 NTPIubGArM660DXdhMcnDz82VExmGaQm5svz8qnUphF911dzQ3+vdokE8bN1KgXfhC
	 /B89kmIWnrBSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E8BB5C43141; Tue,  2 May 2023 11:52:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 217390] use after free in spufs_switch_log_poll
Date: Tue, 02 May 2023 11:52:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: james010kim@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_severity
Message-ID: <bug-217390-206035-1XWUk4keiu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217390-206035@https.bugzilla.kernel.org/>
References: <bug-217390-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217390

James Kim (james010kim@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|high                        |normal

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
