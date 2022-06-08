Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB36543F19
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 00:24:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJMGk5W62z3cBp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 08:24:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F4Yafks6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F4Yafks6;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJMG16rm0z2yZv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 08:24:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DC0A6006F
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 22:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0BDFC341C0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 22:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654727046;
	bh=PjRXGAuim5/LXXEbbCc//h+vpKvQPGH3RfRHhCCkAUk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F4Yafks6+86JxEo2/2vQTJht/rUlesspPx9OLHZO7F3k+cYluWJKMARscpn+rZjEz
	 DgwRRX1LIrA1gCwWgM8Fu7LUSiCkFRyFtTnODNfHrxG54AuxZhsSq16H7F4oNCTm+l
	 RpWxXQZDVculKgHogzZ6tNHCxkUMcuaNYHeydtLkw/ciqxARkt+F/QQ3aI3pTbkl4W
	 k2aWTYIbynSL2HEeW0t7eAQV+RbwM6KfKC+o0dQvLVI9+attj/MVOVUdu4ax4uC+pV
	 73j53NMUVy38pQZ38zrqPvcxIBzvzvu/6nvivVTTZWR3oX3Jtx3PHad461iPXSrhhK
	 4enF4H0CS2XqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD664C05FD5; Wed,  8 Jun 2022 22:24:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216095] sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
Date: Wed, 08 Jun 2022 22:24:06 +0000
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
Message-ID: <bug-216095-206035-phwmlmYX52@https.bugzilla.kernel.org/>
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

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301128
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301128&action=3Dedit
kernel .config (5.19-rc1, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
