Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FFA446305
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 12:54:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlzSP442Rz2ypn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 22:54:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WX/UONiX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WX/UONiX; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlzRf5CZrz2xrq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 22:53:34 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 21D676120A
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 11:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636113211;
 bh=oI0X23X0q454/57ereELjc5xSzsAsYdpFUcu0D9nif8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WX/UONiX8Z6I9aOh9dVFQUNAJh8q2rwGyR/0f3/iq+tL3jvg4gZMScHxSoiaij5ZZ
 AQlw+0jv1hoQacGBC9IZQSXpDGwaFbdvYJVZmOu1jPi7vlYBvoS50P/KhQXaT1jQFS
 YYWFTEzUiaxs4bBov8oFcg5ty4CNGhC2ryqF/6ZEZUqUXx9j7IcYTYPSmMDzD1uMud
 OpPlwoCMb8SQXu8jZSPSRjyEAaKGRUTC4tiw+XNjaUVtmQx3R9/rXnYq3yt9h1L54k
 iF34+wO1zBqvYSHTOPWW9+fpuFUd143aWGzgH9JcGw36Fza5mFF9Gwd/BIgqYK4sCS
 uZqm4YcsqQD6A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0DC2560FD7; Fri,  5 Nov 2021 11:53:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214913] [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
Date: Fri, 05 Nov 2021 11:53:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zlang@redhat.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214913-206035-1RlZKjjlW4@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D214913

--- Comment #4 from Zorro Lang (zlang@redhat.com) ---
(In reply to Michal Suchanek from comment #3)
> What CPU is this?
>=20
> Does it go away if you boot with ppc_tm=3Doff

(In reply to Michael Ellerman from comment #2)
> Thanks for the report, I agree this looks like a powerpc bug not an XFS b=
ug.
>=20
> I won't have time to look at this until next week probably, unless someone
> beats me to it.

Thanks for you reply. (Un)fortunately, due to linux keeps updating, I can't
reproduce this panic on latest mainline linux master branch now. The HEAD
commit is 7ddb58cb0eca. From 8bb7eca972ad (v5.15) to 7ddb58cb0eca (v5.15+),
there're many changes, I can't sure which commit fixes this bug, or hide it=
? Do
you know if there was a known issue about this has been fixed?

Thanks,
Zorro

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
