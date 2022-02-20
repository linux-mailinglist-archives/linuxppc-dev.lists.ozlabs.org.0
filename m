Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEE04BD081
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 19:11:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1tlt53zBz3c9h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 05:11:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BiEtHYkF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BiEtHYkF; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1tl62PyXz3089
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 05:10:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E322860C1D
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 18:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56179C340E8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645380622;
 bh=LE0eYhtCf6Cxu2GuaXbZG8UoIuJhhCeh3uTA9EE5Vdk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BiEtHYkFKNPxsWO7yF7IULjfGsXkBbuJHnUHR7MvDP53NfwLwgbPoPNKAxGCHHyjG
 V4uOmibSdJ433Y1CAYBPRClvyydeQdZqVD4hT/VWNcET4FXrhWqWOgJEWm/WZCi9TJ
 vsJ2KhkuZXNqgKEbgBZLyLf4dCAO83IOZgHFY2DJmyNJZjETZ5n2HhTQgt1RLBVNtH
 UmXouSRCrLebK9i0qv19jcX6jPLXUzHGaCGbIH3/dqqX7RZMRAUlR1H5OsUW2sT0/B
 vymvt298hb8CW+zhpBBkrf5mDARYrGp76qup9BC1nZTuXAwcLp184G1sxC8LijsH4E
 RkvswNWVZo6Pg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 38622C05FD0; Sun, 20 Feb 2022 18:10:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215621] Warning: Unable to mark rodata read only on this CPU.
 (PPC970MP)
Date: Sun, 20 Feb 2022 18:10:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215621-206035-VuFAXSHQNL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215621-206035@https.bugzilla.kernel.org/>
References: <bug-215621-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215621

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
Erm ok, so it seems I did not check this thoroughly...

If MMU_FTRS_PPC970 doesn't provide MMU_FTR_KERNEL_RO then perhaps
CONFIG_STRICT_KERNEL_RWX can be skipped in the .config so it can't be wrong=
ly
selected?

Anyhow you are correct that this is not a bug. Thanks for the background!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
