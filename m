Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF176FDEB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 15:39:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGbjq3x80z3fb6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 23:39:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=twRTnFmX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=twRTnFmX;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGbhy5DH6z3cj8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 23:38:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E60BD60A71
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58995C433D2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683725935;
	bh=NMye2GmwxVxEiKbrUQ3fVKvx3QLFTCfijPeWIKYOvkU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=twRTnFmX2ywTBybZYPtU4bWoar6PQ6PvAZiiWXX3mNpOgMA0jEl5qQOSrkKMafBDn
	 Z5umGBdnXMA3vvSQl286ISWsZL5VNmr6WJcE6/FlFApqxoZ2E94VonjIceHUSrKRcL
	 I1KxJHM3vmTIkGcGThnuz4qKHuprCavUDLfqelrEYVMOLfX4Igb61SoFK1jt60XZH3
	 rgkgf8/gI4HG53HjNCrZczufjeAoGZjUDvTEGMxQswcDccCIwy7ZZm5tPHPr+rUYzo
	 RHdqroMT1HiywFVGqJf9kSwoeGzwLX/c0b2oXUOdAj8yIQ4ZIwLgUa9co042u9Dpz3
	 tsOM4w9intsEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3C632C43141; Wed, 10 May 2023 13:38:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 217427] Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel
 attempted to read user page (1128) - exploit attempt? (uid: 0)
Date: Wed, 10 May 2023 13:38:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: darkbasic@linuxsystems.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217427-206035-bN741bEpdB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217427-206035@https.bugzilla.kernel.org/>
References: <bug-217427-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217427

--- Comment #1 from darkbasic (darkbasic@linuxsystems.it) ---
Created attachment 304241
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304241&action=3Dedit
journalctl_6.3.1.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
