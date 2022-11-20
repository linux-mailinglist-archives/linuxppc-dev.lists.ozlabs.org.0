Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 848DE63161F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 21:01:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFhH232R2z3dvW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 07:01:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FyjNHZR7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FyjNHZR7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFhG32F60z2yyZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 07:00:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E3B4060CA4
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 20:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 269B5C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 20:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668974422;
	bh=EfQbGmqsNI2LphgQ68QxEeCi41mRKVm0Xf3NFpR6sKA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FyjNHZR7pIuywVIKy5TPbhaGPg/PjHX4rNg3THUZHdyY18ydY7IdzloFGYygQXUA/
	 mWzuDuIYgb4Gi3QEgb4Wq+WksFYTP+LnXNRYQ0WXXHWR8XNmv24RKHz/+YgxnPV6zY
	 cFAeBW8r5nT7TwRsPjb8zMgeVqiGCL8xcY4zNqaA4muvMRkc7lHIs+L03aQW0fcyHx
	 cTXZOvrnFbXNQIxllAzpguiGD/Hzd5VIDxHJVQhEaUOwY4vQ6Ygzl4kVf6G2Mpca3m
	 gNRvx2okcJS0n7w03WTGh4cLUtK+T32bFfeImbjn3w01zJ7z+GEDofjWZJ+6kiXf6a
	 mRmvOiZxTUJCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EC88FC433E4; Sun, 20 Nov 2022 20:00:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216407] OF: unittest fails some tests on ppc and ppc64 (###
 dt-test ### end of unittest - 266 passed, 6 failed)
Date: Sun, 20 Nov 2022 20:00:21 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-216407-206035-fft2F8BebS@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #301646|0                           |1
        is obsolete|                            |

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303242
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303242&action=3Dedit
kernel dmesg (6.1-rc5, PowerMac G4 DP)

On a PowerMac G4 DP:

[...]
### dt-test ### pass of_unittest_overlay_high_level():3443
### dt-test ### pass of_unittest_overlay_high_level():3446
### dt-test ### end of unittest - 265 passed, 4 failed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
