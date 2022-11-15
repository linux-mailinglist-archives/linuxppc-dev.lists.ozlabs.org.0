Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0174C62A18F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 19:49:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBZwt5qSwz3cM3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 05:49:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vGj7NCDJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vGj7NCDJ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBZvv2rYbz301Z
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 05:48:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 472CDB81722
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 18:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 030B0C433D7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 18:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668538133;
	bh=I/BHw/WI9D8wWAyQSBHKe8PcnvRTM6wAAi5bDfw6toA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vGj7NCDJgcbJU0XjXDhsR17eMtfIo3xMuJlzefXbQDWMPXaqiJqRqlHI9WEoRw+er
	 9auho12p6StyHjxpEkC5H+pNNZXQ/LNjULA52WM3jChny5yWLT7q8F0sSPFy+nqlHf
	 tMYVPGU6QZQr9tdE+g34HOtmufXFwwpag3UthLlb1LJkBCPOHSCaLx+z+KsDTeU0sp
	 8Q6xG3tO++S9/sBH0CkLTMKQkFs18TrYfvqTIHPEuM4YYbYJbPZKeohp10OLXpESCK
	 70oyZ3XQx+eXVF9uJHCfxFWUQ65F77NqoiQTzd///pFSj0iYS6EUTJCtu3/UgN5A15
	 ZBPoH/YamPMdg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D7414C433E6; Tue, 15 Nov 2022 18:48:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215862] clang-15 fails ppc64 BE kernel build - ld.lld: error:
 undefined symbol: .early_setup
Date: Tue, 15 Nov 2022 18:48:52 +0000
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
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-215862-206035-tjDyNzyBri@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215862-206035@https.bugzilla.kernel.org/>
References: <bug-215862-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215862

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|clang-14 fails 5.18-rc3     |clang-15 fails ppc64 BE
                   |ppc64 BE kernel build -     |kernel build - ld.lld:
                   |<unknown>:0: error:         |error: undefined symbol:
                   |expected relocatable        |.early_setup
                   |expression                  |

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Reinvestigated with clang 15 on my PowerMac G5 11,2.

Got further on as kernel + modules are built now. But I get an error at the
linking stage:

 # LLVM=3D1 LLVM_IAS=3D1 make
  CALL    scripts/checksyscalls.sh
  UPD     include/generated/utsversion.h
  CC      init/version-timestamp.o
  LD      .tmp_vmlinux.kallsyms1
ld.lld: error: undefined symbol: .early_setup
>>> referenced by head_64.S:973
>>> (/usr/src/linux-stable/arch/powerpc/kernel/head_64.S:973)
>>>               arch/powerpc/kernel/head_64.o:(.ref.text+0xBE) in archive
>>>               vmlinux.a
>>> referenced by head_64.S:973
>>> (/usr/src/linux-stable/arch/powerpc/kernel/head_64.S:973)
>>>               arch/powerpc/kernel/head_64.o:(.ref.text+0xC2) in archive
>>>               vmlinux.a
>>> did you mean: early_setup
>>> defined in: vmlinux.a(arch/powerpc/kernel/setup_64.o)
make[1]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
make: *** [Makefile:1236: vmlinux] Error 2

Toolchain used was llvm/clang/lld-15.0.3. Same kernel builds fine with
gcc-12.2, binutils-2.39.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
