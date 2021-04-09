Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E035A554
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 20:10:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FH5lg5nRxz3c02
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 04:10:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eeTThpnJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eeTThpnJ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FH5lF2B7Pz3bTC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 04:10:17 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2604C6115B
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 18:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617991815;
 bh=5UlhbkUvii4M0SbxsDudAP/SdnpNZXKJ5xTscmhM2wI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eeTThpnJrcDIYsqEH20tbG398ApKwD18VnJzGUxrAdPIgDprGpPMY45iaRCKvncCn
 VYm2Xn8Uke/I931Y1ygLV6sZV74da9FfglGvtiepDGHvJb3+My585K7jcFlzo0MHVy
 ZjGnFR8fRw8FoNZM0qDrAbu2UK4NATBLnvQRANx/kRdysCOavkpct7ApxFI5mop3dc
 JCp/voxIpRfKp2UBGGVcJUa3Y3hFtExXDqIGSu7f7tgYECKWNUROAOjkfEAG+HiyXE
 V8k9fIDzwWbdXhroyRNF7TPLKGsRK4kt2Tuja+vm9e94zi+QuGzcrUnAuLctq/6n6u
 s2IaYor/+FFzw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0F29E6113B; Fri,  9 Apr 2021 18:10:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 212631] Misaligned floating point loads and store occasionally
 fail
Date: Fri, 09 Apr 2021 18:10:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: trevor_davenport@selinc.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212631-206035-WRoLvV3Zqb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212631-206035@https.bugzilla.kernel.org/>
References: <bug-212631-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212631

--- Comment #2 from Trevor Davenport (trevor_davenport@selinc.com) ---
A git bisect found this has existed for quite a while.=20

git bisect start
# bad: [0cc244011f40280b78fc344d5c2aac5a0c659f77] Linux 4.14.229
git bisect bad 0cc244011f40280b78fc344d5c2aac5a0c659f77
# good: [a0c646821e9dedc5368abd2f71f50ebe2c351d19] Linux 4.4.265
git bisect good a0c646821e9dedc5368abd2f71f50ebe2c351d19
# good: [afd2ff9b7e1b367172f18ba7f693dfb62bdcb2dc] Linux 4.4
git bisect good afd2ff9b7e1b367172f18ba7f693dfb62bdcb2dc
# good: [786a72d79140028537382fa63bea63d5640c27d6] Merge tag 'armsoc-dt' of
git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc
git bisect good 786a72d79140028537382fa63bea63d5640c27d6
# good: [e0f25a3f2d052e36ff67a9b4db835c3e27e950d8] Merge tag 'hwlock-v4.13'=
 of
git://github.com/andersson/remoteproc
git bisect good e0f25a3f2d052e36ff67a9b4db835c3e27e950d8
# bad: [dd9d064e34a1b1c96d631cca73e2a6efc5834f4a] Merge tag 'staging-4.14-r=
c6'
of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
git bisect bad dd9d064e34a1b1c96d631cca73e2a6efc5834f4a
# good: [b88f55774f20c0c306e0a95d22ca9ab5f08187c7] Merge tag 'spi-v4.14' of
git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi
git bisect good b88f55774f20c0c306e0a95d22ca9ab5f08187c7
# good: [b88f55774f20c0c306e0a95d22ca9ab5f08187c7] Merge tag 'spi-v4.14' of
git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi
git bisect good b88f55774f20c0c306e0a95d22ca9ab5f08187c7
# bad: [cef5d0f952a03d42051141742632078d488b0c6b] Merge branch 'for-linus' =
of
git://git.kernel.org/pub/scm/linux/kernel/git/pmladek/printk
git bisect bad cef5d0f952a03d42051141742632078d488b0c6b
# good: [aae3dbb4776e7916b6cd442d00159bea27a695c1] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next
git bisect good aae3dbb4776e7916b6cd442d00159bea27a695c1
# good: [aae3dbb4776e7916b6cd442d00159bea27a695c1] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next
git bisect good aae3dbb4776e7916b6cd442d00159bea27a695c1
# bad: [3645e6d0dc80be4376f87acc9ee527768387c909] Merge tag 'md/4.14-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/shli/md
git bisect bad 3645e6d0dc80be4376f87acc9ee527768387c909
# bad: [bac65d9d87b383471d8d29128319508d71b74180] Merge tag 'powerpc-4.14-1=
' of
git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
git bisect bad bac65d9d87b383471d8d29128319508d71b74180
# good: [57e88b43b81301d9b28f124a5576ac43a1cf9e8d] Merge branch
'x86-platform-for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect good 57e88b43b81301d9b28f124a5576ac43a1cf9e8d
# good: [f9065c83ccf4a6c1ff5419d216ad8276e99bee6c] powerpc/configs: Explici=
tly
drop CONFIG_INPUT_MOUSEDEV
git bisect good f9065c83ccf4a6c1ff5419d216ad8276e99bee6c
# good: [d1e1b351f50f9e5941f436f6c63949731979e00c] powerpc/xmon: Add ISA v3=
.0
SPRs to SPR dump
git bisect good d1e1b351f50f9e5941f436f6c63949731979e00c
# bad: [146e9f1b65478643f2729a97ccb8be60bb4492e5] crypto/nx: Add P9 NX spec=
ific
error codes for 842 engine
git bisect bad 146e9f1b65478643f2729a97ccb8be60bb4492e5
# good: [5762e08344bd7c5bfc41030f74c4ab6ce6e461d0] powerpc: Don't update CR=
0 in
emulation of popcnt, prty, bpermd instructions
git bisect good 5762e08344bd7c5bfc41030f74c4ab6ce6e461d0
# bad: [d2b65ac6526a82965212b632d42687251e122a36] powerpc: Emulate load/sto=
re
floating point as integer word instructions
git bisect bad d2b65ac6526a82965212b632d42687251e122a36
# good: [1f41fb790460acf432f826f4aeeff6f7da891ff7] powerpc: Emulate load/st=
ore
floating double pair instructions
git bisect good 1f41fb790460acf432f826f4aeeff6f7da891ff7
# good: [d955189ae42796621fb439e5e778ccaeebc2a1e7] powerpc: Handle
opposite-endian processes in emulation code
git bisect good d955189ae42796621fb439e5e778ccaeebc2a1e7
# bad: [31bfdb036f1281831db2532178f0da41f4dc9bed] powerpc: Use instruction
emulation infrastructure to handle alignment faults
git bisect bad 31bfdb036f1281831db2532178f0da41f4dc9bed
# good: [a53d5182e24c22986ad0e99e52f8fe343ee7d7ac] powerpc: Separate out
load/store emulation into its own function
git bisect good a53d5182e24c22986ad0e99e52f8fe343ee7d7ac
# first bad commit: [31bfdb036f1281831db2532178f0da41f4dc9bed] powerpc: Use
instruction emulation infrastructure to handle alignment faults


31bfdb036f1281831db2532178f0da41f4dc9bed is the first bad commit
commit 31bfdb036f1281831db2532178f0da41f4dc9bed
Author: Paul Mackerras <paulus@ozlabs.org>
Date:   Wed Aug 30 14:12:40 2017 +1000

    powerpc: Use instruction emulation infrastructure to handle alignment
faults

    This replaces almost all of the instruction emulation code in
    fix_alignment() with calls to analyse_instr(), emulate_loadstore()
    and emulate_dcbz().  The only emulation code left is the SPE
    emulation code; analyse_instr() etc. do not handle SPE instructions
    at present.

    One result of this is that we can now handle alignment faults on
    all the new VSX load and store instructions that were added in POWER9.
    VSX loads/stores will take alignment faults for unaligned accesses
    to cache-inhibited memory.

    Another effect is that we no longer rely on the DAR and DSISR values
    set by the processor.

    With this, we now need to include the instruction emulation code
    unconditionally.

    Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

 arch/powerpc/Kconfig        |   4 -
 arch/powerpc/kernel/align.c | 803 ++--------------------------------------=
----
 arch/powerpc/lib/Makefile   |   4 +-
 3 files changed, 34 insertions(+), 777 deletions(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
