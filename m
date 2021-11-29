Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B774621CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 21:10:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2xKr69Zsz3cRJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 07:10:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HVd/95hi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HVd/95hi; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2xK4621pz2ywX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 07:09:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5AC12B8159E
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 20:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12C80C53FC7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 20:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638216580;
 bh=9sKHjYTpoALXoSUdaxh1Z233b6dgwH/bnn3dwa7LSqE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HVd/95hi5173WHaYizQIZgBo1fzdRy6TrwiBzbQzlwpM/PkcmmBZsxq3qLu7Tr4Gb
 h0uoF2sgqn3M4vXGlsPWBL/TJc2VmJc77/u6wewF5sQ9W1q1TssrW0R2W3669oUzYK
 /qS2nULSJxFSklTHsL5Buhz4bWzEe4Qa5QRsL5IzfmaQijUh7GgUbp4xWy3fy5Wufb
 3dhbWb09bldbUR3TeVmfKFISy3HN342os1hDq9mAw8IG+MIh1j09s5tL5OwKVbNb2J
 mvRIIyM9V6ib/5ir9Gf+dV66j/btGYi3XCc6Fs0w3A8tBplY7cg63T279pAVyDN/3U
 NZxB890H4zObg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E7DE660E90; Mon, 29 Nov 2021 20:09:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215169] UBSAN: shift-out-of-bounds in
 arch/powerpc/mm/kasan/book3s_32.c:22:23
Date: Mon, 29 Nov 2021 20:09:39 +0000
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
Message-ID: <bug-215169-206035-YT894Cp5Zm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215169-206035@https.bugzilla.kernel.org/>
References: <bug-215169-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215169

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299779
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299779&action=3Dedit
kernel .config (5.15.5, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
