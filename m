Return-Path: <linuxppc-dev+bounces-10624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9068B1A95A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 21:05:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwmGn2YH8z2yZ6;
	Tue,  5 Aug 2025 05:05:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754334337;
	cv=none; b=K6DUSIWiLAoaXOtP81YzBoZbqNAPrBjtl57yrL3Lu0yK2oize4CCK0Xe+wrjA0LcoEYdwcDothQRxLPky268rgkkj/Otpf9enZHsHdFn0IBxqmkoA+l/qU6KBvC0dV/1ri3N0COkLFhD0+DX/Wk5gro7291cY1uz0x15GcaPmt7ZC9PMnpzjvKBBty4r6/dLQ6NnkalT2Ro9kdBpqNBGW9kauFZyDXm+TkmjvmtKUv4Jdn0jRBwybu4wWBB+wthvESA5Na3ILvEfZNX5ECxO5kgY+qZXE8TneyXg9gS8UhQCjkKp7NdPGQyufpTzF6zmTyMU4ycSAqOuJWGLxjdDTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754334337; c=relaxed/relaxed;
	bh=MTHshTZ3G/LzUYu/KonrSHvVnqlf3hz/kQLzD3Es+CM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VRUNLqLh8n5/cqwLEAsnCHiZzOVTtKNePNFu0hZNPSWmlqR0z7J2ntLU+4bmGt2zAcuSci9L7NWYjfhBe7yYccXLoPegveJMKP/XpIoOe0Q5IeNdd7Bu2BbVvjFy4tG6oJ3d+DHRDcApFoHmQnjKjsCM5ac3y1+XT6x7w7u5NZCB0C/i/Jv9IlforUb7EneR/DTj176YeHQjxzvNAdsC+ttBbzROv1JE7Y0EPJQRWs3rAKhTKDxy0jsKwzyszrh0WyperUjw1EcId1s9zpA9qLkIZHRdFcHOWN4NHxIyaphA3LSAyKVTO5zc4Nwn4ILzyBUeUcElQcpQ453Eeo3Zow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RVyaMPXp; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RVyaMPXp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwmGm5tMKz2ySY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 05:05:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93E0643D8D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 19:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74208C4CEE7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 19:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754334334;
	bh=MTHshTZ3G/LzUYu/KonrSHvVnqlf3hz/kQLzD3Es+CM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RVyaMPXp2rS02rgAeivchA5zK05h8/xrEGcENa2SOke5uKyEQXhLIlzWk4GOaCV8/
	 zwyqcH+zt3wgYHL2Z3h4KvHePSE9ptUG3byqB7HVoNL4Ac7snhozWjK3NWgiFyGjDp
	 Jwo3ztvwuM2f3V5cUaSy53rgx8hr7BdhLO9+L7iKrhB0SxuVdbwQaKzFHAX04Fm73J
	 DW/oBCTq069F50zO4H8KswMI+rhO0/2yI9xT9kgLqK/eUsEoOGq1lDCsc18MNXVWvI
	 X9C/T7EU0Zr9Sn6e9hFXPspuzfOMbF9cplxFZBxtUAlLglcxumP0/F478j7DFyKwRd
	 sYubE9ePmBt0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6C072C433E1; Mon,  4 Aug 2025 19:05:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 220407] arch/powerpc/boot/types.h:43:13: error: 'bool' cannot
 be defined via 'typedef' when building with GCC 15
Date: Mon, 04 Aug 2025 19:05:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220407-206035-7xqTaPW6Zh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220407-206035@https.bugzilla.kernel.org/>
References: <bug-220407-206035@https.bugzilla.kernel.org/>
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
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D220407

--- Comment #2 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Christophe Leroy from comment #1)
> This is fixed with commit
> https://github.com/torvalds/linux/commit/
> 5a821e2d69e26b51b7f3740b6b0c3462b8cacaff

Oh now I see that that commit is already present in Linux 6.16 but not 6.15=
.x.
Not sure how I missed that. It should probably be backported at some point =
but
for now I can just patch it myself.

So -std=3Dgnu11 goes to BOOTCFLAGS, not KBUILD_CFLAGS. Makes sense. Thanks =
for
pointing me to the patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

