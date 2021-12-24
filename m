Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB7647EF39
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 14:35:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JL7P152dlz2ybK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 00:35:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lu9yHVCK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Lu9yHVCK; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JL7NH6sWbz2yPT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 00:35:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24491B822D5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Dec 2021 13:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA04BC36AE5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Dec 2021 13:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640352907;
 bh=xipJ9rn4PtpAeH9KbMdvcJO0PbpME/vYNBNH6ArvAiU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Lu9yHVCKVADD6xC2bSxUT5kogIbfKI3qAiuuTo9HVgrd0KxyqQxbuoSDv0d/bGk7S
 DpK5pfDgeH5IrYOe8QS61EpaEttGt5G9+KbnZrccOV2TQKjgk5kH+DJZHPBS+X+enT
 qLO8VSLHvx4A7L5zaJp50rsOxkTD6NMdhcYS4FFFK9fVYZrmlqVJgoNhHe+kol6C/w
 u3Dg39kCKb6IPY0pECUH48VZLRq89X+cuYDp9m8Jjy9amYJ3ZO0gf6N7XwVh4koApw
 cja4YYASWjJ9iweXVSiwhR/FrGqVBm1hFok9R1NkeDHSkD9YhfOKwryLgU+r4cdem6
 t/VyiLGvyFHlg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BC6E360EB2; Fri, 24 Dec 2021 13:35:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Fri, 24 Dec 2021 13:35:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215389-206035-4DIClVPcEi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

Christophe Leroy (christophe.leroy@csgroup.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christophe.leroy@csgroup.eu

--- Comment #2 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
Probably hard to track.

Any chance to bisect the issue ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
