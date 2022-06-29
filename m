Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907955FD1E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 12:28:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXyNw0FS0z3dy0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 20:28:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hTdzqSuX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hTdzqSuX;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXyNF2NTTz2yMj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 20:28:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1B15FB82277
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 10:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C20A1C34114
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656498488;
	bh=vrefOvYlyzXoRvnyyF6JASiNKiV13et3/AQmZCexTWg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hTdzqSuXr8xO1VUFMd5i/1IDmmGson3chQDQ97Q7KOfvi/sKpwPfgZIkxmZ/zVhd/
	 n4NisBnJhJbnBSWkbs8PZO38KsuCx3lGqoWOk0GIwAe712k13zt0S7TeZqOudjeo4l
	 +0lbi9zqR5v/oipWQmVSfpe4KntFhk+9JEZVRC3sH+Ba0K7a6HTX50aGtCzq0jcZ/F
	 Q4sAQm5OmWS4I3nIcmnDqKqTrvX6+yWzax4eFRJHnnaNdDqaxbrZ4C+y8IIMz2hmir
	 g0Z30MykczER5QUpObN5/72whYQNYjfWFq5Kd5/tRUV9aWc1QhOO+DbiUIZvCVWzlJ
	 gcjpNqpPhJ/xA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A765BC05FD6; Wed, 29 Jun 2022 10:28:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216183] Kernel 5.19-rc4 boots ok with CONFIG_PPC_RADIX_MMU=y
 but fails to boot with CONFIG_PPC_HASH_MMU_NATIVE=y
Date: Wed, 29 Jun 2022 10:28:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216183-206035-b1zyOAyt4A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216183-206035@https.bugzilla.kernel.org/>
References: <bug-216183-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216183

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
Biggest difference probably is that I run the Talos 2 on Big Endian. ;)

I'll check out older LTS kernels and see I can get a bisect if they just wo=
rk
with Hash MMU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
