Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC584A3AE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 00:12:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jn6Rf4nS4z3cBx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 10:12:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dsI8PNWx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dsI8PNWx; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jn2RV3rZrz30L1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 07:12:22 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71E9C612FA
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 20:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1ECCC340EF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 20:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643573537;
 bh=yoW0QdG97OtiNdLfO8GuEcu9q1mW/tPZrZ4/OQNROKU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dsI8PNWxyQHWCNDu9QMu8LU34r6hXjmkvyYrTMI9dOBxQlc9KIVgbk/DcR5rpPzdT
 nHLDcfT4ASQObEqk24eN7J9qy5uP6NmCnivN14U4poq8mTgWCPlw/Kl2r6N3utAK6w
 Tv/0i09XoOiC2aIxRTOoOdHrDkNNyy7ta3Assk26fuFVEjFbGeDUV2W9tiSPqZTyvm
 F0Hm5NsLFbWIZX0uvYa+j2Mnh5NOght5IJSJfmQ9lbaLn4dkYof3vf9cL/Ch2d8ue1
 kKyXZMv97aiUB08p+dUl0B8OeBpO/bfELFuZu9OlKn0eAX12DptukFvLggqxfyLjLY
 dq99VFnyIVABw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 93379C05FCB; Sun, 30 Jan 2022 20:12:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Sun, 30 Jan 2022 20:12:17 +0000
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
Message-ID: <bug-215389-206035-1jCXl391zj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Jan 2022 10:12:10 +1100
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #9 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300354
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300354&action=3Dedit
dmesg (5.10-rc2 with ADB_PMU disabled, PowerMac G4 DP)

Took a little time but I double checked the results (one time using distcc =
'-j8
-l2', one time native '-j3') to be sure:

ADB_PMU disabled, VMAP_STACK disabled  ...  "neverending build"
ADB_PMU enabled,  VMAP_STACK disabled  ...  works ok
ADB_PMU disabled, VMAP_STACK enabled   ...  "neverending build"
ADB_PMU enabled,  VMAP_STACK enabled   ...  memory corruption

Version used was git db972a3787d12b1ce9ba7a31ec376d8a79e04c47, which is the=
 one
before a last 'git bisect bad' ends the git bisect.

The "neverending builds" happen when I run this kernel with ADB_PMU disable=
d.
The G4 runs for several hours building (?) without reaching the glibc test
stage. With ADB_PMU enabled I get a pass or memory corruption much earlier.

Also without ADB_PMU I get a kernel panic when rebooting or shutting down t=
he
G4. Also the G4 does not reboot/poweroff in this case, I need to switch it =
off
manually.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
