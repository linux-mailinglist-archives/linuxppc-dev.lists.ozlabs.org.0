Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC254D7503
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Mar 2022 12:34:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KGcz30BTHz3bTm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Mar 2022 22:34:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ohc2bswN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ohc2bswN; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KGcyL6XyDz2xTd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Mar 2022 22:34:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98263B80C9E
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Mar 2022 11:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 600BAC340E8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Mar 2022 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647171255;
 bh=WBkFQ0x8umqPt+xPItQ/RgyC5r0z0UH46ofvQXV2Srs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ohc2bswNvaU69C5Cto1RxkieNTYpJtrbq+Rm8SQEtC3Xq57Z5sLCqN6uzr+YYFbQ1
 ePxGrAAawaJ2nfWecaTN3aSXTRxSesChcGEfDBSIQiuQLr9009MQmcYHpaiz3LONN8
 nBzjMFqOoMlm8sDqmbi0PITPbDL4sGx/u8ahqmFPpGGeT4L+YjRwuhw13Wc3Z4Rdu0
 memNQue6QK71yuB+8QMUrJ1su4SV01ZDHo3hvE1mnpF536woiASQzSGnWzOoTSSmmO
 oB7QbNrTajC+6QhTL5I40EErpnl7hEg9STq6lR2U9I6lM7IXQpUu6TvDq7z0EFgAT1
 4lcLNf2rSFhTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4EE1DC05FCE; Sun, 13 Mar 2022 11:34:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] [bisected] "Kernel panic - not syncing: corrupted stack
 end detected inside scheduler" at building via distcc on a G5
Date: Sun, 13 Mar 2022 11:34:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-213837-206035-halGjVPal1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213837-206035@https.bugzilla.kernel.org/>
References: <bug-213837-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #298919|0                           |1
        is obsolete|                            |
 Attachment #298963|0                           |1
        is obsolete|                            |

--- Comment #20 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300563
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300563&action=3Dedit
dmesg (5.17-rc7 + patch, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
