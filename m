Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4654C9379
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 19:43:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7R3D2Qyzz3bqv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 05:43:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rmv9hvou;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rmv9hvou; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7R2S2KJtz2ywb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 05:42:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1B593B81BF6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 18:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC99AC340EE
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 18:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646160171;
 bh=GxRpf9Q+2Appx8v3h2pnMn2KwceUFf4vJ1NcyF02xXQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rmv9hvouqPAMLkyUFIETdtxuSutqcs5EWmnw7Sb/+7Xv/891xS+he587whXbSuJdI
 Yk2RYtCCog2wEjmeMXANTUfy4ApEOB88w3921vUHzOvW+n5C8gcPm2dNpaJAXCWV3R
 Lopm0uMQYCx20DUr3HzYs38vwMCoXMihrtnDFiHNLhS02G2DGTVzOAdog/n1XBhkOS
 T41lO0KJCTAy03rshcSE/wlbwFexboOhmBJ/EzTZaLJfPG6mp0e+ZiHPI4RuvHquvk
 tBAAXjOsMFoAiLn4vc6lrY9CemZaif99e/RKO96rh7rER7oT/P1knVp/PD/WPPVtYz
 6LS+fOQH/cj8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B1CFAC05FD2; Tue,  1 Mar 2022 18:42:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215567] build failure when PPC_64S_HASH_MMU=n is selected in
 kernel .config
Date: Tue, 01 Mar 2022 18:42:51 +0000
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
Message-ID: <bug-215567-206035-m1vHE8H5ib@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215567-206035@https.bugzilla.kernel.org/>
References: <bug-215567-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215567

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
I just tested your patch top of 5.17-rc5. It applies and build continues but
fails later with:

[...]
  CC      lib/asn1_decoder.o
  GEN     lib/oid_registry_data.c
  CC      lib/oid_registry.o
  CC      lib/ubsan.o
  CC      lib/sbitmap.o
  AR      lib/built-in.a
  CC [M]  lib/crc-ccitt.o
  CC [M]  lib/crc-itu-t.o
  GEN     .version
  CHK     include/generated/compile.h
  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
ld: arch/powerpc/kexec/file_load_64.o: in function
`.arch_kexec_kernel_image_probe':
file_load_64.c:(.text+0x1be8): undefined reference to `.add_htab_mem_range'
make: *** [Makefile:1155: vmlinux] Error 1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
