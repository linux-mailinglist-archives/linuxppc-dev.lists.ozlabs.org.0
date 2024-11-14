Return-Path: <linuxppc-dev+bounces-3164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D129C8171
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 04:21:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xplmz5Mhzz2yl1;
	Thu, 14 Nov 2024 14:21:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731554499;
	cv=none; b=YT4t3zjJXhmaIS4+4FYFw6hQ/7R/C3RlmmmUl5c9SyB3xW5EC9xKiBlDJrJm34WXLZYsHfiFW8qqwGTDo31jZqURuLFPAHUADxeu2bl+/SZlkSvB47HwACfaifD7HTk19fX2m9tYumXpqxcrvYDqFyOi4koIRpuBjUGyd2w7ohcQv9fKoJjQ61xRBR+alIiXwm7GpCRoCoRdfmhVSdzY5Z+cPGCN8HSugwlMS5cCE8Go3lxaqQcRKGWUQ7ZBlcaMJnl3tzFha5cmiqDS0lwhufhT16byEcVe/4CUB+ZoK2iU2iXgADtn6d3rkSay7B37XcnhEuTjyG+slGE8RYZzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731554499; c=relaxed/relaxed;
	bh=7+B8iXy3VtI2Kgb0hqCKpDgrFXb3Qnx2RqGhcRpgohA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K0jPRT+GxBQYrHugSKlY0ejGTLI6o2efd9vTEsoCH4WDaVIv8DgEA062psn8j1xiq2Q11lm0aXMaiRMr7dHmJHRT6fgHbWzw1x75Uv5rz6gkzWcTqZp3h+csWCod6+F+8QuPRa2rGld0COwBDin/nCguJ40qQLSJqGrB1WYaXxHcC09+xUAQW9/XbCSejuKL8l2j4Wvm20P0EyvOqnK8srQr2tO1MFWQITB7vci4Id7kFBnV84biz9vCO55rj2rDeK3ycoP/Wi3BbghQ2+uNODfW7E1/a36ofhtAVEwFKQS7iKbJU3Z5GfIXBYYAruzwlZMZVdbgvdFk3lQZKB06yA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GHlOzOAQ; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GHlOzOAQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xplmy5ZsDz2yXm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 14:21:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37D0E5C5C96
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 03:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E60FC4CED2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 03:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731554496;
	bh=7XJ5UasotTLD7kOsnQkUZF0/ktlUWrYm2i69DsQDKME=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GHlOzOAQMHuhhHjYtu1e7V1n/Znqjg0fgs9ASSLzpo+WquM5BFO8u7MYt/PBwsI3D
	 /peCG7a+AfttxB2K1389VPpDSQfY0tHIYGCbKeLnYTJ3TU7K/VKoVBQmTZAW+Xa1AW
	 nRia/RT0oNnTBrkuHgNCeiopYTfgSnFalJThBk3JTymFzR3FMzcZ/zV5jzAykXX2+6
	 eyXhznmfrfuCL97rLTsNhijYxv6kLNT9QmXouhyfJ1Y2tVDAwJZhLn9BWGFbSauCNf
	 faZuMZ2mgwismbdrbEDEX0eqZPxpATr0lde9cPyRm4kpQJRgzbr8vhY4WEVT4yLTge
	 v3w25fYzHeL9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3D5DDC53BC2; Thu, 14 Nov 2024 03:21:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214913] [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
Date: Thu, 14 Nov 2024 03:21:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@ellerman.id.au
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214913-206035-OVinRwNaM2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214913-206035@https.bugzilla.kernel.org/>
References: <bug-214913-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214913

Michael Ellerman (michael@ellerman.id.au) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |CLOSED
         Resolution|---                         |CODE_FIX

--- Comment #12 from Michael Ellerman (michael@ellerman.id.au) ---
I believe this was fixed by the series merged as:

https://git.kernel.org/powerpc/c/89fb39134ae3b1e1f207af44a037721d92b32f70

Which was merged into v6.4.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

