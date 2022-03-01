Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC11C4C9759
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 21:53:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7TxL0Kpdz3bvb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 07:53:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KeUKj23f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KeUKj23f; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7TwZ1bLWz30Hp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 07:53:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D7238B81B7B
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 20:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7ED2BC340F1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 20:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646167976;
 bh=MPwtdRaU+1DJOpdJLfquglMkGWtqidCRVw9Z4/YGMWs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KeUKj23fX7I+wrV2YG3639KT5dxBuONMaaHhcLMnTa3HVEOkpPomEqwFGFHAGXmBg
 lQXP8W/VIMh94/0FH9Mv8qtRlrIhgIuOWMk7zCge96cXCRkgijkjXQFy2dhhDaduq3
 6hchvewSIF3/9uXlpNyPSkVg7mqH9dB4xx07TtR6IxlEmsDkHjuBayG+uiXoVkIfMR
 ISUX6zyQjgFEVmHws0i4xRJlcimEo2kd9Oh+NfD1MehLXnrr03F4KHnDhItDDsuHKO
 T+5Yw65bO6iefUzlV1VhL1/bBDQJ9z5OPvIXg5oOCLPq18e5v+lFUdDFLuUpJlwydf
 m8700gS//EitA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5E94DC05FD5; Tue,  1 Mar 2022 20:52:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215567] build failure when PPC_64S_HASH_MMU=n is selected in
 kernel .config
Date: Tue, 01 Mar 2022 20:52:56 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215567-206035-QI3PvmfnbG@https.bugzilla.kernel.org/>
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

--- Comment #4 from Murilo Opsfelder Ara=C3=BAjo (mopsfelder@gmail.com) ---
Erhard, would you mind trying the v2?

https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-March/240715.html

Christophe, thanks for the suggestion.  That's exactly what I did in the v2.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
