Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A90262AF3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 00:12:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBhmD0C67z3c9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 10:12:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UATLgWj0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UATLgWj0;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBhlJ60GBz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 10:11:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 209FBCE19A2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 23:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61C3CC433C1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 23:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668553910;
	bh=dTTldIbGX97ZaPo+WWt1nzuehZ7XVsOsKuqEHtNkEhI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UATLgWj0tkTRvIiwO9S2q3yYMeB/PNHDhD7kh5txM29X6rDCyn4bGUk+lbYC4amJb
	 I6Y2AmA3bOV0tu0NEUn/1dvJxEkij0drKMolcQe5pK8x6999zH5lL0rXP+fPZ4Q+uJ
	 ogxeZVNCZw3pC8vZ1g3nRK8+gQdbt+aIEtyY0dSun8SUECNAx9YwECzS6XQrPdr+fs
	 a48kB/m12DVvhWkHcmOBZlj514TWR3dBshoXJ03l+jvPoSxiLYz5it7f9luooRHhuE
	 Fb/zS5g+BINmES/f5jgSUgm1LN1UAiNxDaNKTj2qkLOyqdCJFXqBDhkOQs07YRRNj2
	 xy7irC8EJVu6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 437F3C433E4; Tue, 15 Nov 2022 23:11:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215862] clang-15 fails ppc64 BE kernel build - ld.lld: error:
 undefined symbol: .early_setup
Date: Tue, 15 Nov 2022 23:11:50 +0000
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
X-Bugzilla-Changed-Fields: bug_file_loc
Message-ID: <bug-215862-206035-FlNNdaAEax@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215862-206035@https.bugzilla.kernel.org/>
References: <bug-215862-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215862

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                URL|                            |https://github.com/ClangBui
                   |                            |ltLinux/linux/issues/1761

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Christophe Leroy from comment #3)
> If not already done, can you report the problem at
> https://github.com/ClangBuiltLinux/linux/issues
I was not aware of this issue tracker. Thanks for the hint!

Filed now unter https://github.com/ClangBuiltLinux/linux/issues/1761

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
