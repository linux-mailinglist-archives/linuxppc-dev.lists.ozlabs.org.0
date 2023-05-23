Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 500F270E619
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 21:56:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQlSh1gNlz3f6L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 05:56:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bvBUJoE9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bvBUJoE9;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQlRp4J8Rz3f5K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 05:55:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61E7063631
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 19:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C262CC43443
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 19:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684871746;
	bh=G8TsZgbIcvFrF+fpm0ZaS3niDlw8B+3aLmWPdDb19XE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bvBUJoE9k9LZ8QXWUeGpe4iwe8nvIklGygH2fokYfo7yjlUpLpej6Euz+lj2sdARu
	 gZ4ycw0oPdtNU0TE4rqe98Hd6WItd913mMVmI6l5GEL1AVnMJe0aE6ZYmLbEjaWuXM
	 YWSBvk1IqKr9t+aDW5L1bp+Othrw/y6/kn1ddd7A/Al6gcPAOXXZRpk0QC02stL/6C
	 ggrPy+TiqwtKvj9XIBgUG+Mtb6sdlyAvjiHhbZWG1BgUBIWhA2bEcqdkgZWdO8ot/o
	 3o/n+xiuowp43Mh8yw+XWoKSi+Y0XApnFJYuHw5RKcnipwNR5fFh5mixkuJA0K745k
	 iFGcw1qZtslow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A608BC43142; Tue, 23 May 2023 19:55:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Tue, 23 May 2023 19:55:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215389-206035-YCChAKmOnl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #37 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 304308
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304308&action=3Dedit
dmesg (6.3.3, KCSAN, PowerMac G4 DP)

Thanks for taking another look into this Christophe!

Applied the patches on top of 6.3.3 and these are my findings so far:

1. KCSAN works fine on my G4 and passes self tests.
2. It does not generate any additional output when I hit the "pagealloc: me=
mory
corruption".
3. When setting CONFIG_KCSAN_WEAK_MEMORY=3Dy my G4 won't finish booting. Ea=
rly
boot works, the screen shows some dmesg but booting gets stuck there never
reaching console. I also don't get any netconsole output with
CONFIG_KCSAN_WEAK_MEMORY=3Dy.
4. As soon as I set CONFIG_KCSAN_EARLY_ENABLE=3Dy dmesg shows plenty of data
races!

netconsole output and kernel .config attached.

To provoke the memory corruption 'stress' is a good tool. stress -m2 --vm-b=
ytes
915M provokes the corruption easily and --vm-bytes 915M is small enough to =
not
provoke the OOM killer on my G4 DP with its' 2 CPUs and 2 GiB RAM.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
