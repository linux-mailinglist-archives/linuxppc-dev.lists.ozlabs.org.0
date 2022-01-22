Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA40B496880
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 01:08:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jgc5x6RsJz3bTH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 11:08:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ephFtghX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ephFtghX; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jgc572S4sz2xXy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 11:07:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E3B561A1D
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 00:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15B3AC340E4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 00:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642810054;
 bh=FamL52xvCgraPes4fUEEzCn/uONjdqINtVXCTyyqw5w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ephFtghXAp32kRMfr7V8iYYcKJcJlm3NjLqiD3YWB0Y/K1efevLAP5VKXPGSPeKDN
 AhEF+IoTOsc4j3v5AFHejCZ6z4BCBzjkQ8ID73OSVzZH7WlT7G8m1wso6nmDEAJNsD
 PfPfezKfKkrpgLZLe4flSm9SEMXZgO6MhICtsZ+1F2OWKSJGTOuCcEef01W+22ieqs
 c7IfWNjM1cm9EnnGib0CqI5J1n++Sl0uOidSe6jE+PzI40ZBOJ6vZKe2jh1VQGy6J0
 Mg0+j7iXcmg/RF2oswF9TRjSMAHraikQPvNbuh6085IgMTeR/Pd4cp7beodYEzzDMh
 WQWIadpOAp1lQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D1069CC13A6; Sat, 22 Jan 2022 00:07:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Sat, 22 Jan 2022 00:07:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213837-206035-kw8GKwt1qx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213837-206035@https.bugzilla.kernel.org/>
References: <bug-213837-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

--- Comment #14 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300297
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300297&action=3Dedit
bisect.log

Finally did a bisect which revealed the following commit:

 # git bisect good
c2c11289021dfacec1658b2019faab10e12f383a is the first bad commit
commit c2c11289021dfacec1658b2019faab10e12f383a
Merge: 63bef48fd6c9 ef516e8625dd
Author: David S. Miller <davem@davemloft.net>
Date:   Tue Apr 7 18:08:06 2020 -0700

    Merge git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf

    Pablo Neira Ayuso says:

    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Netfilter fixes for net

    The following patchset contains Netfilter fixes for net, they are:

    1) Fix spurious overlap condition in the rbtree tree, from Stefano Briv=
io.

    2) Fix possible uninitialized pointer dereference in nft_lookup.

    3) IDLETIMER v1 target matches the Android layout, from
       Maciej Zenczykowski.

    4) Dangling pointer in nf_tables_set_alloc_name, from Eric Dumazet.

    5) Fix RCU warning splat in ipset find_set_type(), from Amol Grover.

    6) Report EOPNOTSUPP on unsupported set flags and object types in sets.

    7) Add NFT_SET_CONCAT flag to provide consistent error reporting
       when users defines set with ranges in concatenations in old kernels.
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    Signed-off-by: David S. Miller <davem@davemloft.net>

 include/net/netfilter/nf_tables.h           |  2 +-
 include/uapi/linux/netfilter/nf_tables.h    |  2 ++
 include/uapi/linux/netfilter/xt_IDLETIMER.h |  1 +
 net/netfilter/ipset/ip_set_core.c           |  3 ++-
 net/netfilter/nf_tables_api.c               |  7 ++++---
 net/netfilter/nft_lookup.c                  | 12 +++++++-----
 net/netfilter/nft_set_bitmap.c              |  1 -
 net/netfilter/nft_set_rbtree.c              | 23 +++++++++++------------
 net/netfilter/xt_IDLETIMER.c                |  3 +++
 9 files changed, 31 insertions(+), 23 deletions(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
