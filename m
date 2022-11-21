Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA80631781
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 01:20:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFp1X5FpPz3000
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 11:20:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NLc2hrKL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NLc2hrKL;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFp0Y5BzVz2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 11:19:09 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 32AF7B80C8B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 00:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB46FC433D6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 00:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668989945;
	bh=iHkNdDT7+g8X+tRzTkBRLQqzBJkAy2hjLmoOXulZcPg=;
	h=From:To:Subject:Date:From;
	b=NLc2hrKL/KCHT9bt7CTuJRFaZ2JjBNjnMciL3Hcm5cQ8fwTUEFeRYTo4S6IUCtcbr
	 8gpDRer7ZbOqHlXKeIzWKGD1aipTOZpuddH/dPjR/MYcDSxhwbyNpROQrETf7W8tec
	 7v8mR1Nax+jUy2lLCCJ8pPRSld7pqvlHnQXxDp0dlERs4vCyVeex9r7hf69xxpO3te
	 xzUUrWjYfFGjPKPTpGpAVUDDO7UR34bElKHlnstKqlV3HMM8aapCr5O+cm5Ts1i6mM
	 Zws1Qs4Jn4Kmqn9jTuSs9WdBrAJM52oF6c3IoBqh6PciwZlbST4N+MLRfw1y7vZbl+
	 rrKrcM2yZzHEg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9B1CC433E4; Mon, 21 Nov 2022 00:19:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216715] New: kernel 6.1-rc5 + KASAN_OUTLINE fails to boot at
 very early stage when DEBUG_PAGEALLOC_ENABLE_DEFAULT is enabled (PowerMac G4
 3,6)
Date: Mon, 21 Nov 2022 00:19:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-216715-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216715

            Bug ID: 216715
           Summary: kernel 6.1-rc5 + KASAN_OUTLINE fails to boot at very
                    early stage when DEBUG_PAGEALLOC_ENABLE_DEFAULT is
                    enabled (PowerMac G4 3,6)
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 6.1-rc5
          Hardware: PPC-32
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
                CC: christophe.leroy@csgroup.eu
        Regression: No

Created attachment 303245
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303245&action=3Dedit
kernel .config (6.1-rc5, PowerMac G4 DP)

Kernel 6.1-rc5 fails to boot on my PowerMac G4 3,6 at a very early stage
(OpenFirmware console, white background) when built with CONFIG_KASAN_OUTLI=
NE=3Dy
and CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=3Dy.

Same kernel .config without CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT just boots
fine, even when Outline KASAN is enabled and CONFIG_DEBUG_PAGEALLOC=3Dy is =
set.
Only CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT seems to provoke the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
