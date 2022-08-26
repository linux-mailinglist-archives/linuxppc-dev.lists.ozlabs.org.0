Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3395A29A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 16:37:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDj8l68Fwz3c2W
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 00:37:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iWylspwy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iWylspwy;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDj806dKwz3bZc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Aug 2022 00:36:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED9D561E5A
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 14:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A196C433D6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661524588;
	bh=pE/AIXGtZIs4cp474WjLi0aOElY4BsU+mUf7gFJkjHI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iWylspwybg0XKYa9AFaZ9f04Rm5bGOxuZUImeDv14Qoit9/Ru0pO/6NvQOtuzGlRV
	 QnDd4BLNBdxAriC//KC/xuIGwbvJOa8DADtEeSAb5DWwy+FEj+kqpyIzt7dBsA+410
	 /8t5Scd5Sh/0cEaWam1SXksj3KPn1qNFT5NcB0ON1KeEEEt8U+PdQW7B8WYYZrZM8I
	 jgPvWRz2JbZn4YQCK3m9o4yId3MW2qsFk+d/QPdUTHr0+feKIsw0bRzLXR3mU+ktwm
	 LYpILSAaR177ZQrg432Z9yjaQinuEtLnS3DYT5mGtmaPemelVuybQybsyfQEAuukN1
	 ctU95/DWD/Log==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4A9A7C433E7; Fri, 26 Aug 2022 14:36:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215443] [radeon] BUG: Unable to handle kernel data access on
 read at 0xc007ffffffff9130, Oops: Kernel access of bad area, sig: 11 [#1]
Date: Fri, 26 Aug 2022 14:36:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215443-206035-s7AbLn26FS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215443-206035@https.bugzilla.kernel.org/>
References: <bug-215443-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215443

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Have not seen this since quite a few stable kernel releases on the same
hardware. I think it's save to close here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
