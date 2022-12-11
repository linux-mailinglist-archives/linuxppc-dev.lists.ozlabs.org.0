Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D702649465
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Dec 2022 14:20:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVQNP2q49z3bhV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 00:20:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ffuHRXQQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ffuHRXQQ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVQMT3hRcz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 00:19:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 096FBB80AC6
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Dec 2022 13:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A59CEC433D2
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Dec 2022 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670764752;
	bh=nIaUubYJAFDOmL+nG8KKY6j8IEKs3sjxx+QPwTbR6WQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ffuHRXQQigOfPALbAUxpUCcSnZDIxd6HzlrbQmKXfcL/5Mte+Rk7tv6Na4NYpvoVc
	 lrNj4MmmqyZ4xMzRCB9PvN0HjOo9GcWvW67NmdJGA9bvT8zEU5/iNTLBW/E4Nn8IBI
	 M2ynsT7YUe/VuKf/FrcuutkEZ6XPnivN8IqM7rW+UxpT9FDfiCUn1uc5BLnIXO6JRn
	 A40CBqPw1fNvjP9nd6W8XElvJGASA8Q6qGLJYf4+hYfnWKIIArc6mgx6r0PJYGY3ea
	 YDk+NxH2Zomz6tpXZIiUrwKgXo6M+7LzTTsLB3BJhZpNHI1uBHjnooBPKYskS8LMGQ
	 98yqcC6KVnzXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7CBBDC43142; Sun, 11 Dec 2022 13:19:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214913] [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
Date: Sun, 11 Dec 2022 13:19:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zlang@redhat.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214913-206035-wclPzMFhaA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214913-206035@https.bugzilla.kernel.org/>
References: <bug-214913-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214913

--- Comment #7 from Zorro Lang (zlang@redhat.com) ---
(In reply to Michael Ellerman from comment #5)
> Sorry I don't have any idea which commit could have fixed this.
>=20
> The process that crashed was "fsstress", do you know if it uses io_uring?

Yes, fsstress has io_uring read/write operations. And from the kernel .conf=
ig
file(as attachment), the CONFIG_IO_URING=3Dy

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
