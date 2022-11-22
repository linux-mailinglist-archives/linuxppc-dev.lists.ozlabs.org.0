Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C86163312F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 01:13:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGPqG1QQHz3cKb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 11:13:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oPOHQeW0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oPOHQeW0;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGPpH1vPTz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 11:12:23 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3D96BB816FF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 00:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDD6AC433C1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 00:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669075937;
	bh=FErL81GeetSDQonVVUf+7jjrNl5PckhP+YSLGRFtGe0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oPOHQeW02lNQnZ6Hrs1nktciQSvDGjVNnH4RCGDSexKIPWFNDcWgUvmozMjB7OM9X
	 +keK49L8ffF0MNgQ9KpVnTaU1Yz137eYiyR5y96Qchf8YNbIu67Yz6mdOFvJnN4qrH
	 sKvrgpTdOQvWRi6BO/NInXvt3dEbBqa1pw7ITM+gyc1v/7aLzckwML3E2JSpnLqytY
	 EtOis++uYMCjKk0UroDlM8cNFx3DVU50BseDcUBwy7nauubXTfAyaJySf3SmzHAd/g
	 iw2lZ7Xu2g4gtdgIfc8yl8rykMNxmmtpoDQNAUw9k+NDDMk0nsRZQbKWQgsKmG9zOV
	 jBWJTOOe2jSzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C4C51C433E4; Tue, 22 Nov 2022 00:12:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216715] kernel 6.1-rc5 + KASAN_OUTLINE fails to boot at very
 early stage when DEBUG_PAGEALLOC_ENABLE_DEFAULT is enabled (PowerMac G4 3,6)
Date: Tue, 22 Nov 2022 00:12:17 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-216715-206035-jBeQr1s7eL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216715-206035@https.bugzilla.kernel.org/>
References: <bug-216715-206035@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #303245|0                           |1
        is obsolete|                            |

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303254
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303254&action=3Dedit
kernel .config (6.1-rc6, PowerMac G4 DP)

Somehow I had a hard time reproducing this...

Finally it turned out that this is not 100% deterministic. I'll attach my n=
ew
-rc6 .config which provokes the early boot failure best.

The same kernel can run into this early boot issue, or it can fail boot lat=
er
with "BUG: KASAN: slab-out-of-bounds in filemap_map_pages+0x2c8/0x5d0" or it
can boot up just fine.

I had the impression the early boot issue is provoked easier when
CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=3Dy is set or debug_pagealloc=3Don is=
 set as
boot parameter as you suggested. Also it seems to be provoked easier when
CONFIG_NETCONSOLE=3Dy is used and properly configured (perhaps also linked =
to my
yet-to-be-posted netconsole bug?).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
