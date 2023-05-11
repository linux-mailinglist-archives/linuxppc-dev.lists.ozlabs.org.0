Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B916FEDF8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 10:42:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH54Q0lbXz3fQ0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 18:42:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oKiYQqIh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oKiYQqIh;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH53Z4z70z3Wtr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 18:41:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 116E263FA2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 08:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BCCFC433D2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 08:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683794502;
	bh=sOD42ess+WBDenKbIYt801wf+CuLDumP8UQlD5Mq8z8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oKiYQqIh90C7V2TJLEYvriPwRqJe3feqVL+UkJDrm3ON4QesacqJEKnxsYVCwkYSB
	 T5mJ4pjI+e81rFNt24O8euElDuUjc4GdeiTiyIi/oYHc7GWhnUhvTPy7MAZ6Wau8Ut
	 qXroEeFXHUZw3ZiAyZy+Chq7czwUwarE44volQcTIt7RqBSmkL9apApQA6A6ef9Lbm
	 bprip4hZbfjNq9KaROA6E7WPf9jgLMlpAz8a2dqWjgaMtwezGIsoZF8Lg/BHcNY+/z
	 V7tkI6s5cldN78Cs5TnsRJiotFPM2cr5shCK3cyhfEU48WOg1Yu5dZ+NWZQvUd09Oa
	 3umd3V/BMNwpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 293FFC43141; Thu, 11 May 2023 08:41:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 217427] Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel
 attempted to read user page (1128) - exploit attempt? (uid: 0)
Date: Thu, 11 May 2023 08:41:42 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217427-206035-jSc39dQxK5@https.bugzilla.kernel.org/>
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

--- Comment #3 from darkbasic (darkbasic@linuxsystems.it) ---
Gitlab issue: https://gitlab.freedesktop.org/drm/amd/-/issues/2553

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
