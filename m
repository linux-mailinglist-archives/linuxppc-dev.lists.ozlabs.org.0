Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582DE631575
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 18:25:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFcpl0FyMz3dxq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 04:25:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ERgZ65b0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ERgZ65b0;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFcnl570sz30F7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 04:24:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5E769B8092B
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 17:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AA1FC433D7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 17:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668965046;
	bh=GT60ZQZgSCbGPc1d0N4uzFms0pIFreMgKZmDmekRrr4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ERgZ65b0O35PvTXXFKG/kaitxNiLUnlLXk9gpkT4/6p88yKYApj1hRr9Tfh04EJjR
	 ydkzQR174PmuMQxlpjriGYJ4kBS2J7MF4JVEIWcuFkNx6gfUS+stZkrCNS9c13E0i3
	 G/z9rcYRErSZQlEliJhGxiSHGIJuKt0zF2jlqilggzJGFlq/u2H89wFvmqW1C46wbA
	 aQl2naOnJP2o8VImUYyI62tyNA5Luzazp3GAD337dFdYstHtaJhX4mNJLTHEfmq7Fb
	 UXmHFfnTfVnM+wqnSZkCxrLgvSvSeTJOx1JkxOmXh8xXBTwA883SwvYjrFXt8NufOV
	 X9PTxx+udg1jw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E9F55C433E6; Sun, 20 Nov 2022 17:24:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 206203] kmemleak reports various leaks in drivers/of/unittest.c
Date: Sun, 20 Nov 2022 17:24:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-206203-206035-nN4YrLPILC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206203-206035@https.bugzilla.kernel.org/>
References: <bug-206203-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206203

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #289679|0                           |1
        is obsolete|                            |
 Attachment #292285|0                           |1
        is obsolete|                            |
 Attachment #292287|0                           |1
        is obsolete|                            |
 Attachment #292289|0                           |1
        is obsolete|                            |

--- Comment #23 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 303239
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303239&action=3Dedit
kernel dmesg (kernel 6.1-rc5, PowerMac G4 3,6)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
