Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F2F53E523
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 16:48:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGxDl21wgz3blK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 00:48:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s3RIqBtF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s3RIqBtF;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGxCy2VSDz2xKj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 00:47:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE41A61386
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 14:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AC55C385A9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 14:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654526843;
	bh=4BiP6+T0WH4xOkE/iQrydOW9l8M+ig87LF6DPsNh0Rc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s3RIqBtFRAy3d8MQ7qgj4DDfzMy8CG1DoNERI2QVZ299VO1PlTCx42okcqyEmA0dX
	 nihDvlBvi7qxitoRqVWunptqoWjuwjBQqf27RLNosWbErB7O2HesUJc+Wdu7+MhZn2
	 Pp9HXdUbkjuHorMNKgbOkiGRxE+C5raCIr2RnVtcdxUdDDqb7hY60p9wqPazi7NR+i
	 pRXTo2HwiUA3Fc+0VBJUGrb+Z8v3oCN2a3z9O3FTO/agj6NeiEwdsDnBuMXRXOXrf8
	 V7NxkbfFf4C6hXTtpQtna9fQkCn+CH3NNjwN0lFeKHVBSDxJNC3JXySiL838EmfV/y
	 d0QYPc4dBCWDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 00576C05FD4; Mon,  6 Jun 2022 14:47:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 209277] powerpc: obsolete driver: Marvell MV64X60 MPSC
Date: Mon, 06 Jun 2022 14:47:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-209277-206035-mYH8RjpDLF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209277-206035@https.bugzilla.kernel.org/>
References: <bug-209277-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209277

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |michael@ellerman.id.au
         Resolution|---                         |CODE_FIX

--- Comment #5 from Michael Ellerman (michael@ellerman.id.au) ---
The watchdog driver was removed in:
  bc65baf73b68 ("watchdog: Remove MV64x60 watchdog driver")

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
