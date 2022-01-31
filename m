Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025624A5349
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 00:34:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnksk59n6z3cBv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 10:34:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tm63bwn6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tm63bwn6; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jnkrv6QFlz2xvP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 10:33:19 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EC145B82CBC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 23:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0F9AC340EF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 23:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643671993;
 bh=+/CO/XDzeBk3OjYW+6nbdc0JQnXjbLV1/S2wFI8u3bk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Tm63bwn6/uGbzUTLjwHRN8O+c2QBDzTuRcOwf5lCOFAhML1EroFVpJJ51Pq9yTROM
 ThT2ZJyZrcI4VL3Kz6onrJYxHYb1KMyy6Ci3t1Ruvt1FImnshthgqgi7XsvjNS7H3y
 3xDn6WvCWBqq54INTQoVYmilvv8tkCE4F7wF3GPWwTmKSEVtRm79QbO5V23iyN/O95
 dv4HU9fCywU3exghKUacV8OkM3viMBKYX6+R2ZQk6M6GKZdTxgdaHnzOxsJj9yuuA+
 craO6kF9vbeW5aXhCWc/n4PdVmPBbxxXwc3yDfaxm8g+a52ZeAZb4RRsz1m+yzyI9L
 SdaWKTpqerGTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 951DBC05FD1; Mon, 31 Jan 2022 23:33:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Mon, 31 Jan 2022 23:33:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215389-206035-4W4sAdcLtr@https.bugzilla.kernel.org/>
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

--- Comment #11 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Christophe Leroy from comment #10)
> I'm wondering whether you could be running out of vmalloc space. I initia=
lly
> thought you were using KASAN, but it seems not according to your .config.
Correct, I was not using KASAN. I use it only for testing -rc kernels or wh=
en I
am particularly wary. This memory corruption I noticed during regular usage.
Seems running the kernel with slub_debug=3DFZP page_poison=3D1 is a good th=
ing. ;)

> Could you try reducing CONFIG_LOWMEM_SIZE to 0x28000000 for instance and =
see
> if the memory corruption still happens ?
Thanks, that did the trick! With CONFIG_LOWMEM_SIZE=3D0x28000000 the memory
corruption is gone on VMAP_STACK enabled kernels. Tested it additionally on
current 5.16.4 where this works too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
