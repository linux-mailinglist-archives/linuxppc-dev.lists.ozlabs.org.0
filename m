Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5291F5A0448
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 00:51:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MChCs1y4Tz307F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 08:51:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cbRzGDZ6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cbRzGDZ6;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MChCB2bVWz2xGk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 08:50:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A2358B826C1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 22:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6189DC43470
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 22:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661381441;
	bh=84QF4ptNAEDyqdvXHraVm3ED/ocZtUIrVoLkqMy8iBk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cbRzGDZ6RzYbaKXUerjBGmlOJzCqlvy14HllhSx4MbXGSRiPr+591MVj5QO7/U8rr
	 ZehBQ3/BNJJnuCCdumlhbgovWO0RTTj4oBVovZLpBxy45HscPMyVm1oNEFECuO7Dz3
	 FWLxSoqAHy4oJ9+sO5iAMh06yTDgCT0wfJxIlz8w9st0ylTtkfX5iK2vDL21yKITPw
	 aWIa3XTCekhr3TbY1nZyNg6gExJQnpUm+yPMjYMmDa7OKuS4H4PvxOFe+Bolc4Vx/x
	 lRkRWEjy3r/7lZOZqyrbIsWdQ3uODY6ZncSuqy+cKVH7Ur/pQLBJy/dgE++RFxjAy+
	 5v7JVj7+Lav4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 41C92C433E6; Wed, 24 Aug 2022 22:50:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216410] WARNING: inconsistent lock state, "inconsistent
 {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage" at boot
Date: Wed, 24 Aug 2022 22:50:41 +0000
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
Message-ID: <bug-216410-206035-MDrEwf4EiP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216410-206035@https.bugzilla.kernel.org/>
References: <bug-216410-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216410

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #301649|0                           |1
        is obsolete|                            |

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301651
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301651&action=3Dedit
dmesg (6.0-rc2, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
