Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57011460BD2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 01:42:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2RQC247Mz3c57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 11:42:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BVe+Qwbp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=145.40.68.75;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BVe+Qwbp; 
 dkim-atps=neutral
X-Greylist: delayed 522 seconds by postgrey-1.36 at boromir;
 Mon, 29 Nov 2021 11:41:46 AEDT
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2RPQ4Wv1z2x9X
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 11:41:46 +1100 (AEDT)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AD5F9B80DB7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 00:33:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 490FA6069B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 00:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638145979;
 bh=+NqCSMFVSZiRvNBNOnBRPB26mYGHhBGvwpNWOaGtc2I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BVe+QwbpKTiBtnJLdolw3cma0sUYjH1hAe6tKAhRg099sLXHwHHqH1E9Wj9zgGvWX
 4Hot/pb2UrnmA9H9+EHiCblBet/LEXgZYCmLnfCmpi8ab9Cc/wsjJ+1vrdHoJcTXyl
 CtxnPks+WYN5u/aIgj4ajpY2AUlme43UdZAX9P1jaGTCB/71ViWF8CS8tnh0Q5xrBt
 v6WNkJkVArPV3XDfBZBxD9EaXGMkTXj0evQkjOVPdtSQla7mP1cOUkhOP5gU7fKq1Z
 0fVR4Rx4VtaChoIw9UM9ZS29owLCqHVHYLsdqQtwlgPq+hVp+Me0/kmjxT5wH/O7CR
 SDkw2uo3rOhvg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4547760F46; Mon, 29 Nov 2021 00:32:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205099] KASAN hit at raid6_pq: BUG: Unable to handle kernel
 data access at 0x00f0fd0d
Date: Mon, 29 Nov 2021 00:32:59 +0000
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
Message-ID: <bug-205099-206035-N4lEPlmIZd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205099-206035@https.bugzilla.kernel.org/>
References: <bug-205099-206035@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D205099

--- Comment #42 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299761
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299761&action=3Dedit
dmesg (5.15.5, INLINE KASAN, LOWMEM_SIZE=3D0x20000000, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
