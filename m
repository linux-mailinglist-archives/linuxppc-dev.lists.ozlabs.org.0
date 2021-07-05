Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D1B3BC155
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 18:05:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJVs600dZz3bY1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 02:05:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QdJLEvFD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QdJLEvFD; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJVrb2F4Gz2yMd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 02:05:01 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id D3D6B613AB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jul 2021 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625501098;
 bh=zzarP4lorM5QumDtHFAa7o1nj/Ohobm6jrm0sw/plUI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QdJLEvFDVUtBvpeTT8lx6q0SwQAJLxJ21e7zYasqFaCl2rT0Q2TxoUATuVwDhLkK8
 7vGwfq1Y2AghhV8gg3D4rpOrSKKJmIcdA9iNF4o8mBKYGrwCqyrnnzJxqy/BuxYXZP
 EoYhlPyS7C6qBN5XdkpAvb65grAVO3PZuas4UtN5P+egjQw5R/eHN3nt4LwgwuJGlA
 TnDQsYNhrpMa1b7kR7SAwHOd/IEF4YDNjugMRZB25zDx6EbRyuB4XOEYODscnCyVsb
 yq8gL2IpoArftvv/WZpgEjhTtWL95/ZwwOS+KAhtrUTtBcGTdGfk1M2DsfL7/cn3Tz
 Tj7RuvXGg0SHw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C8F4061206; Mon,  5 Jul 2021 16:04:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213079] [bisected] IRQ problems and crashes on a PowerMac G5
 with 5.12.3
Date: Mon, 05 Jul 2021 16:04:58 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213079-206035-bu1jekN1ob@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213079-206035@https.bugzilla.kernel.org/>
References: <bug-213079-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213079

--- Comment #14 from Erhard F. (erhard_f@mailbox.org) ---
Thanks for the patch! I will try it as soon as I get to this G5 again.

Don't know whether write access is necessary to trigger the bug. The past
weekend I've seen it only by doing an 'emerge -pv distcc' on its' Gentoo
partition, which only shows the flags and version distcc is going to be
installed, but does not build anything yet. Still the bug was triggered.
Filesystem was ext4, but I've seen it on btrfs at other times. Running kern=
el
5.10.x LTS for the time being which works just fine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
