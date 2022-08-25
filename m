Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB71C5A053B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 02:41:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCkfQ3jR1z3cd7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 10:41:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L7yDxMlg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L7yDxMlg;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCkdW3XLyz3c6S
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 10:40:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 283ED6197B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 00:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B78EC433D6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 00:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661388012;
	bh=Eigg8BrZ3yHRCUL1u01JTLL1tvMJq1n5ZXhcF75PsE8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L7yDxMlgfbfwIaU6Zb6G8mrt9bFESkyUuYu8MZFcb5vWo6L5VWHbXezzFvTOQ6JpG
	 f+27bzbkKeMdbe3i5CyIE5d0Z2B62Riq5qShARjLR9gMFokzkzSc0P4rNgq/u0VoKu
	 4LfbIAjJkuc/GSanAO4G/dVjC1YYATd85cT67Nn2vBVopAX65cTW4bJuddhrPrB6ZE
	 g1FTllhTxnRqyn7VX0z1nhULiwuyFMTFwhq25cQDZYKVn/OXhsBPMz39f+kbO4vkVk
	 5QNGI0qgcwl7jeP6lPEw6rCANLBkPisl0qjBTdveiA0bgnS1nua6eS/Yl3zDXvEA1Y
	 Te4O9n7u8NruA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 79364C433E6; Thu, 25 Aug 2022 00:40:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216156] kmemleak: Not scanning unknown object at
 0xc00000007f000000
Date: Thu, 25 Aug 2022 00:40:12 +0000
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
Message-ID: <bug-216156-206035-yWjIXYBVAd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216156-206035@https.bugzilla.kernel.org/>
References: <bug-216156-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216156

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301654
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301654&action=3Dedit
kernel .config (6.0-rc2, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
