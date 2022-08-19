Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B189599990
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 12:17:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8Hkj0W0Zz3cfC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 20:17:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DNT/+n3s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DNT/+n3s;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8Hjx1r5Dz2xX6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 20:17:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E0777B82746
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 10:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A769CC433C1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660904223;
	bh=rlrPp3C0VcTnQjPuaggVd/yfW387NXRyK3+d2EUGIKU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DNT/+n3sp14V6pS3p8+OgdkNmPvNeKzJRpaCxZY0q/g6f+qt+92IUweJWm88SRfjc
	 rn6FeGnuGSIjJnI3o2UXLHBVab8VTIiBo06U0IVbAmhPdgncOtGPG5dM1gSQVoG4rK
	 m7eQm4FyfQt6/BqNbruExgz3EAqeLqMHYaO4SKFCYTppMUNg/2Za07CX7ue4/tY3+D
	 Qbaea49aVLtew9rgyQfvXQxz3Vmg32LDFbeofix8QW9zMMFi6lqyzguUrwv3kv53MQ
	 n+ikVWQH8Sql41mfV0hahMlcJypvyJueJDF6zERyPswjwkaCf2d7Pc5Dwzeg+GkHva
	 AlKvw2Q+MLB8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 57666C433E6; Fri, 19 Aug 2022 10:17:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216190] 5.19-rc4 kernel + KASAN fails to boot at very early
 stage when CONFIG_SMP=y is selected (PowerMac G4 3,6)
Date: Fri, 19 Aug 2022 10:17:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216190-206035-L15s0pM9b5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216190-206035@https.bugzilla.kernel.org/>
References: <bug-216190-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216190

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Patch landed in stable (v5.19.2) meanwhile.

Closing here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
