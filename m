Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 874544BCB24
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 00:30:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1PtQ6gpQz3cY3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 10:30:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U50y/GLv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U50y/GLv; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1Psg2zvHz30L1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 10:29:27 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3651B80108
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 23:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 972F9C340EB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 23:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645313362;
 bh=qNQq3iPMvppSuPI89qYcZ4qQPPt/i0CVlABhQ7QMdHI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=U50y/GLvxfYUCQz6YeSOM+2tHZC/PBb3autmaZAWqJ+yU4uggNnGXOAzZyk+XK7Bp
 wLjYeXfWZnRuIfikCbMEZUzQD7NiQTHv//jmE5IwUU55y1OL8Hw/XFiDtMNIX4Ez/w
 ootLBQDgjTQ1yJpuCr3zuhA1CRzL8KJqRVyrlpKiET53/AXfqkUC+Aqb76gDzefA6g
 0XryfszSjg7RnLLvuBytAbBXMypnkBR6rJWdUO1FlXyjq6T3/wwnZKLp4/rLdWKhJM
 nTMJ01nOV5LzNp5g195V2VlGVUHtYgY81pV1tNm6dDVLjWA12jmHVgDyub/hKbGx8x
 E2d0XRktbKC8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6B5C1C05FD2; Sat, 19 Feb 2022 23:29:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] [bisected] "Kernel panic - not syncing: corrupted stack
 end detected inside scheduler" at building via distcc on a G5
Date: Sat, 19 Feb 2022 23:29:22 +0000
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
Message-ID: <bug-213837-206035-MYtwpikELL@https.bugzilla.kernel.org/>
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
 Attachment #298019|0                           |1
        is obsolete|                            |
 Attachment #298671|0                           |1
        is obsolete|                            |
 Attachment #298959|0                           |1
        is obsolete|                            |

--- Comment #16 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300486
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300486&action=3Dedit
kernel .config (5.17-rc4, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
