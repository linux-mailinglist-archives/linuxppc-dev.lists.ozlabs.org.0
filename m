Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 674FF4FB0B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 00:46:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kc6Xr2rT3z3bff
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 08:46:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T7cjx/nl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T7cjx/nl; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kc6X74R7Mz2xZp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 08:45:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 39F66B80ECB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 22:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D566FC385A5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 22:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649630737;
 bh=6UkPIpIoHnSYMIZ184N1Cwt8I6jxl9Byi8oN6b9Hi58=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=T7cjx/nll+xXf3+4LNAkShBfFTZ5oWXx/nqKP/E+d6tA8VWR7rdPotp1zpoZLBQuz
 Xf7ShJ5b+wGA8g+J0w9cBs4xGBj7CMK/omlqBwXwsygd7dN9Tvbt1riHHw9ocqhEqO
 yF1SflhfItyzmNW2MCY/QnHmCk/GsdXtD9lFACUVlIMEbZO8vptNmzYlM/34s2KEvW
 cJS4Oq9oeQ1JG6zcTa4KzGdfGh8RjVhTfX5MuK+Opd8bEJA2NByqX++bOcORiJzLJr
 8rkSac3d1abYqv5sUn8iL8cbZVD3/c7LdBmVGnAkkMIS2nQpcAKX33WZHCJ/t3wTEV
 YodMAK780GooQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BDD11C05F98; Sun, 10 Apr 2022 22:45:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215803] ppc64le(P9):  BUG: Kernel NULL pointer dereference on
 read at 0x00000060  NIP: do_remove_conflicting_framebuffers+0x184/0x1d0
Date: Sun, 10 Apr 2022 22:45:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@octaforge.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215803-206035-M99EIgtj4A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215803-206035@https.bugzilla.kernel.org/>
References: <bug-215803-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215803

Daniel Kolesa (linux@octaforge.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |linux@octaforge.org

--- Comment #2 from Daniel Kolesa (linux@octaforge.org) ---
This now hits 5.15.33. I noticed this when virtio-gpu failed to come up.

Commit:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/dri=
vers/video/fbdev/core?h=3Dlinux-5.15.y&id=3Dc894ac44786cfed383a6c6b20c1bfb1=
2eb96018a

More detailed backtrace:
https://gist.github.com/q66/6ffc1bd18cf241e6ad894dc4409a2f72

This is also on a ppc64le system. However, I think this bug may not be ppc64
specific...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
