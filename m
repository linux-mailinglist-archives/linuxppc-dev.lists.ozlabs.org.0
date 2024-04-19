Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1BE8AAA2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 10:31:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZlSEtxog;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLSXh4msQz3dC2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 18:31:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZlSEtxog;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLSWy0pYQz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 18:30:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9BA7FCE19BC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 08:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD719C072AA
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 08:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713515434;
	bh=vyrFQZasVDNOe4i8f3TbNx6gayPwVIM/2GzMTogmosQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZlSEtxogoFUisqRUWo+1OmKYKaUzCuB6cqjK8fRYwv8fp6Z9Y8Ugu3htkesnIM8Se
	 2NQ+oH8JIkTC1OaSlmukFT9u+JxmWp3oA/4RAbQ9B4dp3c70mH6hFnvNLtxs5D8WLm
	 vcph5L9fdHpDwsKuWA05YDyCMzsz5fgF3lqqiTGYHMWYCHViWS8ZCA8SwzLWETE7qh
	 x/HOrHnYFMykJNSBNYqZBcRQvBmoEj2X3D0epEzK/dDg7z1Fed0aZXocJPqdgB2BSz
	 sTQBTRlhnuARdG+rYDX6rtDOu3S/oVMm7CCjJvLkvKBmlxLqhaoubDPRY/DdFn8K6G
	 8H1hPyK7JT20w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD458C433DE; Fri, 19 Apr 2024 08:30:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216156] [bisected] kmemleak: Not scanning unknown object at
 0xc00000007f000000
Date: Fri, 19 Apr 2024 08:30:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216156-206035-VCaJQkjaGV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216156-206035@https.bugzilla.kernel.org/>
References: <bug-216156-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216156

--- Comment #17 from Erhard F. (erhard_f@mailbox.org) ---
Just noticed the issue is still there in v6.9-rc4. Does some side effects
prevented the patch to get upstream or was it overlooked? ;)

[..]
Page orders: linear mapping =3D 12, virtual =3D 12, io =3D 12
hash-mmu: Initializing hash mmu with SLB
Linux version 6.9.0-rc4-PMacG5-dirty (root@T1000) (gcc (Gentoo 13.2.1_p2024=
0210
p14) 13.2.1 20240210, GNU ld (Gentoo 2.42 p3) 2.42.0) #1 SMP Fri Apr 19
01:23:36 CEST 2024
ioremap() called early from pmac_feature_init+0x5e8/0x12d8. Use early_iorem=
ap()
instead
ioremap() called early from pmac_feature_init+0x1040/0x12d8. Use
early_ioremap() instead
Found U4 memory controller & host bridge @ 0xf8000000 revision: 0x42
Mapped at 0xc0003e0080000000
ioremap() called early from probe_one_macio+0x3e4/0x6cc. Use early_ioremap()
instead
Found a Shasta mac-io controller, rev: 0, mapped at 0x(____ptrval____)
PowerMac motherboard: PowerMac G5 Dual Core
ioremap() called early from btext_map+0x6c/0xf0. Use early_ioremap() instead
ioremap() called early from iommu_init_early_dart+0x174/0xac4. Use
early_ioremap() instead
kmemleak: Not scanning unknown object at 0xc00000007f000000
CPU: 0 PID: 0 Comm: swapper Not tainted 6.9.0-rc4-PMacG5-dirty #1
Call Trace:
[c0000000022f3c50] [c000000000d6524c] dump_stack_lvl+0x84/0x10c (unreliable)
[c0000000022f3c80] [c000000000379118] kmemleak_no_scan+0x118/0x12c
[c0000000022f3cf0] [c000000002029110] iommu_init_early_dart+0x1e4/0xac4
[c0000000022f3e00] [c00000000202a3d8] pmac_probe+0x158/0x290
[c0000000022f3e60] [c000000002011608] setup_arch+0x2b0/0xa18
[c0000000022f3f30] [c00000000200613c] start_kernel+0x98/0x81c
[c0000000022f3fe0] [c00000000000c848] start_here_common+0x1c/0x20
DART table allocated at: (____ptrval____)
DART IOMMU initialized for U4 type chipset
Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
printk: legacy bootconsole [udbg0] enabled
CPU maps initialized for 1 thread per core
 (thread shift is 0)
Allocated 1040 bytes for 2 pacas
-----------------------------------------------------
phys_mem_size     =3D 0x400000000
dcache_bsize      =3D 0x80
icache_bsize      =3D 0x80
cpu_features      =3D 0x00000100900c218a
  possible        =3D 0x001ffbebfbffb18f
  always          =3D 0x0000000000000180
cpu_user_features =3D 0xdc080000 0x00000000
mmu_features      =3D 0x0c008001
firmware_features =3D 0x0000000000000000
vmalloc start     =3D 0xc0003d0000000000
IO start          =3D 0xc0003e0000000000
vmemmap start     =3D 0xc0003f0000000000
hash-mmu: ppc64_pft_size    =3D 0x0
hash-mmu: htab_hash_mask    =3D 0x1fffff
-----------------------------------------------------

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
