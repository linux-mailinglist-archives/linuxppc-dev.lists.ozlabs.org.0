Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F56C4D4805
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 14:26:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDqZv1cbDz2yQG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 00:26:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lr5GalxD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lr5GalxD; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDqZ91zFVz2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 00:25:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B393CB825BA
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 13:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66A94C340F4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 13:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646918732;
 bh=7lMfV6QDcQsnZB9rAGPDeCsg9Fr7+MkN20vUwu9J8UY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lr5GalxDSdrgA+ig72jtbwBvRQ0lGbh14f1GWOlygB66KqZlaQKEKid0HI4E9a8Es
 RSM7tja7epQURTiqlw7A7V1zGtNLOCoeT2qUcYky7getzYy24WxYunLcfB3xy/rcSx
 /SGXm46keXMw4RVFM3Fl8qmj9sCUNr5QqN3nUZFt/373ciAWoUuc8l6WzGCH1kflyW
 715fQxVWdh8Kiln40nx+kphp+mDQ89jS84Kz/z2EvYtjU1o7Hrwf5u/ke9HotRu8MQ
 dbD+D9sMmJQhmLDAoaNDCv5kMfHIUm3X/hP3PF0V2GUZJzZZkxSCuj6HxA9nq59YwT
 al8VHg5VO5kJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4420EC05F98; Thu, 10 Mar 2022 13:25:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215658] arch/powerpc/mm/mmu_context.o Assembler messages:
 Error: unrecognized opcode: `dssall' (PowerMac G4)
Date: Thu, 10 Mar 2022 13:25:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215658-206035-WQa3mS9nhc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215658-206035@https.bugzilla.kernel.org/>
References: <bug-215658-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215658

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
This was Gentoo Sources v5.16.12 not upstream sources. But now I am not abl=
e to
reproduce it which is even more strange... Also Gentoos' v5.16.13 builds ok.

What I did in the meantime was downgrading to binutils 2.37 (had 2.38 befor=
e)
and rebuilding the toolchain afterwards.

So this probably was never a bug but an issue with my setup. ;) Closing her=
e.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
