Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1080570E91F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 00:35:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQq0D6rwQz3f7X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 08:35:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cgagJH94;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cgagJH94;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQpzQ18F2z3bl3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 08:34:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 968636158D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 22:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01F2EC433D2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 22:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684881294;
	bh=V2djgJWqeCjHCRgRuDicGWPS1C9fFKPeQb02SeKFrsI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cgagJH94oHZ/T8N4d5Qqv67i4FDTE9fBm0+cKLdKtqq4iPMSEGGprx1XYQ3J6qHph
	 +A0oHwADKt+vwF3OvnbDWHL/mVJP6d6yOus7na+R+Mp4MDBq67/hb5Dr1aEFRIz9ZF
	 pblddNpVrkEW1+QvoqUOqtlVN6+8SkxVt3oCNO4VALG448rr5l+iQ83LXPPjtGH3eE
	 bp/xsCFxMCk1a26d5TdLVyD7U+d4vd8rrn7x+AwFHibOSdXnM/KcpWcStXfeXwic3j
	 lWwECh0WLi7WA6zwdL4DqfdT9tmESV2TmyFRIXt/6G9YmWjwQFIYkdaMHIKv4txaJc
	 ng5s/uSHTE0tg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D4B01C43142; Tue, 23 May 2023 22:34:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216715] kernel 6.1-rc5 + KASAN_OUTLINE fails to boot at very
 early stage when DEBUG_PAGEALLOC_ENABLE_DEFAULT is enabled (PowerMac G4 3,6)
Date: Tue, 23 May 2023 22:34:53 +0000
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
Message-ID: <bug-216715-206035-PBOPT7wFQh@https.bugzilla.kernel.org/>
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
 Attachment #303257|0                           |1
        is obsolete|                            |

--- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 304310
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304310&action=3Dedit
dmesg (6.4-rc4, PowerMac G4 DP) - succesful boot

KASAN and KCSAN can't be enabled at the same time as it seems. If I select
KASAN, KCSAN is automatically disabled.

But in this case that does not seem to be a problem. Kernel 6.4-rc4 boots f=
ine
with KASAN_OUTLINE and DEBUG_PAGEALLOC_ENABLE_DEFAULT enabled. Tested it ab=
out
a dozen times to be sure.

I'll close here when kernel 6.4.0 is released and this issue is still gone =
for
good.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
