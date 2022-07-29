Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA71584C3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 08:58:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvJJ16lcZz2xkY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 16:58:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XIkgnkyV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XIkgnkyV;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvJHD73vKz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 16:57:28 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DE854B826F0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 06:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0EE5C433B5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 06:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659077843;
	bh=4+ps4jhic18z3a295PKxXGHl9/G196qqiHsA9FxSdLc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XIkgnkyVm5Z/GsiJBLaH5r0ytnxspQVnS+hbnvKqSGvYAg30RJIqNYQSLLyUiys1Y
	 zHx2J+HRUoW/u3w47yzcTMz5jBzYCVZx0n5Sd/543fbgm+TP8xOGVj5TqxS9EmlZv/
	 EmvP44E9PZrybXp/VYFEYIiWtbeYMkv2rQoQwDBTtTUWo6Z48xMKJlNNtoLG6eZpBK
	 H/IuidJDCfONURGfbaF3r8NvdEZAdKiPfB34AGSqS2rOmvBTA0kwtVjhhKXdAahMb+
	 +y3nlSQ4kguktlIFCprsxlV+DSS7Ms3YfU0aFUW2SNUMRxOuTE9Q+NwTa51xq6EeTl
	 zrhisAfIP7KYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8813BC433E4; Fri, 29 Jul 2022 06:57:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216090] GCC12: printk.h:446:44: error: using a dangling pointer
 to '__str'
Date: Fri, 29 Jul 2022 06:57:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc resolution
Message-ID: <bug-216090-206035-ui5n2dBSRL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216090-206035@https.bugzilla.kernel.org/>
References: <bug-216090-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216090

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michael@ellerman.id.au
         Resolution|ANSWERED                    |CODE_FIX

--- Comment #2 from Michael Ellerman (michael@ellerman.id.au) ---
Fixed in 2a83afe72a2b ("powerpc/64: Drop ppc_inst_as_str()").

The warning has also been disabled in 49beadbd47c2 ("gcc-12: disable
'-Wdangling-pointer' warning for now").

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
