Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DA038188E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 13:58:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fj3p770Zfz3bxR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 21:58:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RJLXPzQ/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RJLXPzQ/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fj3nf1lrYz30Hk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 21:58:29 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id CDA61613BB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621079907;
 bh=LXDCZKPpN7mTHryX7nk2vKzS/8BKclpWaA6nEkKjytQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RJLXPzQ/M01rzDipG7+m+FHAgHfJXyFG+dHo5QS0jVFJSdjWASrseaPnzEf3GM2Ma
 0jBjurETR7MCoFQH7aPcsBGUe0aL0nw4x9lR9H3IcRKSMEjqDxDQN+QyTmW1nZNb13
 vE0DToqeB/gHgWKg7LZgyb2yEnOPHoSoKvrivgD15OhsXzc8mPDawsVMmk1BeGWJjP
 HbANE4cEnVAjUYrt+nSE3dXCg46ef7ac6aYbzeAHodYJzsgL3WwZwte04GEC/iS1Dc
 3xAoucMGgBUdGJKN2vnDnBU1X3LHv2NcqGnbkhcVz2ZazRmWjmXXMkwG9fIKr0uVob
 N9V2uhg/TUd2w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C917661026; Sat, 15 May 2021 11:58:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213079] IRQ problems and crashes on a PowerMac G5 with 5.13-rc1
Date: Sat, 15 May 2021 11:58:27 +0000
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
Message-ID: <bug-213079-206035-AKGcwthTPj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213079-206035@https.bugzilla.kernel.org/>
References: <bug-213079-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213079

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 296761
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296761&action=3Dedit
kernel .config (5.13-rc1, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
