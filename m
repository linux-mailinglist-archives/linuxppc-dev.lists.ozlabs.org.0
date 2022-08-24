Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A70D35A00DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 19:58:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCYkC4GLyz3bwr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 03:58:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oihSINW6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oihSINW6;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCYjV2gcHz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 03:58:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5B89FB82619
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 17:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A978C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661363881;
	bh=P7fr1MGEL6FoEXgjZqVc35+N4MZ92w915AtorS8bYZY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oihSINW6maJYttsHVlHSV6uNKSOOtk53iLBHrlE0uay3h5m/qPUWjcTSYtCkia4aq
	 b5EIDA5no+zxUDaG5KHPHYOt+BgSBGc2yKYEvk3ItHox9YjLu0gjhwhqAQ0A/HW+fT
	 az5m7y1R/09g8wBwK9wwJVvr1OOW3l7zcSI6yUQ7+YPKTWc588RctHJZMky8zIabbQ
	 /I6ETAtnck23GcQ3rTLAmoAA4T9F2D+x44vzvdsXMASTmKHrJlacgT4+N3b2JwhOxc
	 Ja9o1b4Dub/Gug4ogHFkmCn+KYbmbt21sKh3ZpDP61niYM047+35EjAwFBtyyxyuGN
	 /jj/8tbu6+BPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E7DE5C433E4; Wed, 24 Aug 2022 17:58:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216407] OF: unittest fails some tests on ppc and ppc64 (###
 dt-test ### end of unittest - 266 passed, 6 failed)
Date: Wed, 24 Aug 2022 17:58:00 +0000
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
Message-ID: <bug-216407-206035-Y7fm6XuplN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216407-206035@https.bugzilla.kernel.org/>
References: <bug-216407-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216407

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301646
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301646&action=3Dedit
dmesg (kernel 6.0-rc2, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
