Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C5F4C9166
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 18:21:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7PDp1DXzz3bsr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 04:21:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UfTWLhYc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UfTWLhYc; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7PD10bZZz30Jk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 04:21:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C2146123F
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 17:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44450C340FD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 17:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646155260;
 bh=rcFq80RIPzsdpGKBbGsaTN7spuMGIE91/ONIICdgMZo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UfTWLhYctIgejcCtMtXcUBGCW+GUyQ/vbP8wjcc+FnWLFlGIk2Nn/Xx0+oBL+Kcza
 2X6wUPFABN6jwSDlynZO1s/SpgNmoxER9+Km63bWXRUjVsjfSFsDEP5/KY9kvfJmJ6
 Sws9pWRmCH9EOp1JaIoCCC5HLVypL28vOflLQLIUoYuvnMajHKK7u4lYpzjXVjbG6S
 gG+BTt3VPDXd0W7XrIUc5ltjw/nS06t5WgzpSB/BxaQUplbBx5qfa219PMKr6f0uUB
 nlpewkWtgkNByTaYgwzwtn/YdGOkTxfXI4Tqmp4idLc3ZoHtxH93C0BrDS/i5gwlJv
 QFzkUhBMgOiRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2DBFFC05FF5; Tue,  1 Mar 2022 17:21:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215567] build failure when PPC_64S_HASH_MMU=n is selected in
 kernel .config
Date: Tue, 01 Mar 2022 17:20:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mopsfelder@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215567-206035-QZqT1ygghB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215567-206035@https.bugzilla.kernel.org/>
References: <bug-215567-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215567

Murilo Opsfelder Ara=C3=BAjo (mopsfelder@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mopsfelder@gmail.com

--- Comment #1 from Murilo Opsfelder Ara=C3=BAjo (mopsfelder@gmail.com) ---
Hi, Erhard.

Thanks for reporting the issue.
I've sent a fix proposal for this:

https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-March/240698.html

Please let me know if the proposed fix worked for you.
You can reply here on Bugzilla or to the list with your 'Tested-by:' tag.

Thank you!
Murilo

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
