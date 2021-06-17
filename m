Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F00C93ABFE6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:55:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5f7Y4Btvz3c1P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 09:55:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c3UDf/Sc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c3UDf/Sc; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5f743t3Mz2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 09:54:56 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7DD9D61369
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 23:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623974093;
 bh=joJjLM9hnI6O0ucsB1uSoJ2sF7rXok70uL/Byq5XWG0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=c3UDf/ScRUvZaw//Fw0n/0ann+fTWJ9LZOhNf0awa2/hR1UOpiQX0VPlM/plSnsci
 EfZ86GCAD0am8boGJHZzsFZU3M1LMBMjucCdyCFLeoS70pJyKP3stA1R46hnid1xkt
 YCF3sCP31Zvu0Ok/BiuFo5mxBgdqUx4jZNh/76vTL6BeliIwlibQP3JEzKH12RSFQS
 JdiTMKClUqLq2zYy/VeOgNikEx060OOLmaVlYfEe0xL5+9QZCCz6AtUXM8CB3k31XA
 XOA4u5mJWd1LQylppQaO9sVaSXqsNxOTyi+oASKBJ/TiE4/eu8Fqn8kYqYoDEO29Ca
 J8uegZyECFETA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 740D061107; Thu, 17 Jun 2021 23:54:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213079] [bisected] IRQ problems and crashes on a PowerMac G5
 with 5.12.3
Date: Thu, 17 Jun 2021 23:54:53 +0000
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
Message-ID: <bug-213079-206035-O52QDp7hdb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213079-206035@https.bugzilla.kernel.org/>
References: <bug-213079-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213079

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #296759|0                           |1
        is obsolete|                            |
 Attachment #296761|0                           |1
        is obsolete|                            |

--- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 297439
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297439&action=3Dedit
kernel .config (5.13-rc6, PowerMac G5 11,2)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
