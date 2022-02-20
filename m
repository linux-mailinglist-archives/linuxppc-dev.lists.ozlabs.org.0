Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C04BCFEF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 17:39:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1rkS5XSbz3c9d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 03:39:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p08qlw9v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p08qlw9v; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1rjj0f8Pz303n
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 03:39:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2547AB80DA6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 16:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4EBBC340F0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645375139;
 bh=xVBnOAXzDlHFn9CgVT087DC9uHd3MrzpCxqpItUDics=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=p08qlw9vqccTXoszTIEIYxFoumlUN7jO1I9jE2paC6lLIEF+VTJoBx8av/xjXzaQd
 u3cqxVfRHc3U4IwkYiUtcdG8owrb3A3xfACnD0Ux+g+O/sWQsoSBMUF2K8Z81te2O2
 c0RPyUTGK24pPFh5kPxIUEfGZoGt4bLV+T9w+z44LLvHMgdo1X4R2ZkykQzpn4y1dS
 2BtBse09KB6IJAg+rfbvxS3u6yq4RE4W695gdATR8AeLa+cOHsxIFRMgzLUa9DU5pV
 +C+lxf2tDVuv6/7mz9NaWZMeDTB9Dmrm63BeJvtMj1LPUqE2qqbr0C3vTW2DK6vGI4
 +cuaHTVXdnjHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A4EC4C05FD0; Sun, 20 Feb 2022 16:38:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215621] Warning: Unable to mark rodata read only on this CPU.
 (PPC970MP)
Date: Sun, 20 Feb 2022 16:38:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215621-206035-ifcRAGX5oN@https.bugzilla.kernel.org/>
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

Christophe Leroy (christophe.leroy@csgroup.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christophe.leroy@csgroup.eu

--- Comment #2 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
Look at
https://elixir.bootlin.com/linux/v5.17-rc4/source/arch/powerpc/kernel/cputa=
ble.c#L196
at you'll see that your processor has .mmu_features =3D MMU_FTRS_PPC970

Then you see at
https://elixir.bootlin.com/linux/v5.17-rc4/source/arch/powerpc/include/asm/=
mmu.h#L135
that MMU_FTRS_PPC970 doesn't include MMU_FTR_KERNEL_RO.

MMU_FTR_KERNEL_RO is in POWER6.

In commit 984d7a1ec67c ("powerpc/mm: Fixup kernel read only mapping") you s=
ee
that this feature appears in ISA 2.04.

Previous version of ISA only has PP bits which only provides RW for kernel
pages.

So this bug is not a bug, it's a limitation of PPC970MP, and the warning in
dmesg is there to warn you that allthough you have select
CONFIG_STRICT_KERNEL_RWX, this CPU doesn't support it.

And for the same reason, CONFIG_STRICT_MODULE_RWX doesn't work either.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
