Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF55C5B5D12
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 17:25:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR9QX6HQXz3f1q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 01:25:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mNlGyxuG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mNlGyxuG;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR9Ns4Lkwz3cgR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 01:23:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 589F9B80D68
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 15:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06EB4C433C1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 15:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996230;
	bh=3GrMKLVgkd9kEze+SlS5Rz+Qgdox+qRU8+kOCRzjKrI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mNlGyxuGFSdWkeb0ETyBj+oEEr/4KiEnSqbqrYAKJv2THf2A2vZF4UuP/Bj5+SaVE
	 9NWsZTE3ISVLdok0WbdmD+F0vhTiFXlCKnQV5KY6iVylChE0JMIelOSiNhljmGalm4
	 arkDQAweW/KIKNKB8c/JLcPGFCsqC5IXh/M9C1loLbSsKPnmr8tjqwPlcdW+xq5vMu
	 NOWSQx8p2ZjE//n1wEFsw2Y4Twszq3M58g0sTdhji8jCVt49zHM/0FTYLMupacQAf/
	 SPJ1rCEU5Iqhoqn9sbKusi3rT4iaVg5N80TZGt+GUwcWOr7I1kOaBYgkFty4nqmKOo
	 SJ7lJ+dt0pK3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E1DB4C433E4; Mon, 12 Sep 2022 15:23:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 208197] OF: /pci@f2000000/mac-io@17/gpio@50/...: could not find
 phandle
Date: Mon, 12 Sep 2022 15:23:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-208197-206035-ZgCgpVUw6M@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208197-206035@https.bugzilla.kernel.org/>
References: <bug-208197-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208197

--- Comment #11 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301794
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301794&action=3Dedit
dmesg (kernel 6.0-rc3, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
