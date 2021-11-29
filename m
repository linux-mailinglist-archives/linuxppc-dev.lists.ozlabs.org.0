Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 157F9460BB1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 01:35:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2RFj36vkz3cDC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 11:35:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kx8fY+oo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kx8fY+oo; 
 dkim-atps=neutral
X-Greylist: delayed 81 seconds by postgrey-1.36 at boromir;
 Mon, 29 Nov 2021 11:34:28 AEDT
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2RF05xcQz2yYS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 11:34:28 +1100 (AEDT)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42150B80DD0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 00:34:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B1F5A604DC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 00:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638146064;
 bh=m+ddBF8p4EclGkwrb+tXJRFDbKKcHS0DFuPKuuj2Z8E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kx8fY+oogmakbD9zSsfV3Y1z43Q5pzRBJYIxjNqUk42UCB827dorRzHywnLvMN8cN
 IMotC7WPC65mUG31jJ3wje9MIwYcUXuem5oOFW+S4XdMr4dyu1mEQMzfbfHSIc+CwV
 cZPxu3JX9KSBFSUyLoxqJjAFYiWJnZVuPHGMJV58hRjdU7MJ9rn1qdNIAQJqmI49Xh
 jK8GDG1o+l5QwChBAfFPAX0O4TULlo4fQT36xECtItaFLeUIl2O6k046JG2iMXuAqA
 y9XTgCn6u3EjQhqugMOFpjg+26/9pvh+vfBv1CKV+yv2TKjLsOrKdJW8ckhsLWvqBy
 Rb/1wJD3YoqIg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A68A960F46; Mon, 29 Nov 2021 00:34:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 205099] KASAN hit at raid6_pq: BUG: Unable to handle kernel
 data access at 0x00f0fd0d
Date: Mon, 29 Nov 2021 00:34:24 +0000
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
Message-ID: <bug-205099-206035-LW1fCIVVvY@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #299715|0                           |1
        is obsolete|                            |

--- Comment #43 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299763
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299763&action=3Dedit
kernel .config (5.15.5, PowerMac G4 DP)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
