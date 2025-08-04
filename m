Return-Path: <linuxppc-dev+bounces-10591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF8B1A419
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 16:10:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwdjg6N2lz3byF;
	Tue,  5 Aug 2025 00:09:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754316599;
	cv=none; b=bM47+4UlFsItVEqZVe5vugL75oTFs+FyY/gtH+7ilZw3VH2lwFjY5cr/XHxdvvkuC0PQBKqyYE267JR9thrmxbMH4TkUltrm2U5u/dqHSc9fJbcuNj/GsMAIFfSWbBTiBiU5litwYgji4EFsRS1LfylTgpG3fDx9YeqYM4zSBjHRYwxjEHKhijon6RWJcEBC/SEaeaoNc3OsBTovjypOt9yp+4WCLjNx2QpIWkgspzPTQJJjO5PIjYOKJEST5K0AT1Trt1NBfcnxjLIKrNyGMCoTZTTkWljPaTGxGUUUi09W7As9V89XTOUYH5jwypC+a6zteg47l6j91CVliQo0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754316599; c=relaxed/relaxed;
	bh=maeUrwruKZ5pcRHm1lii96PPS/UgYKiMKyss5hALvWw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MkzadED76sUWZa9bBB+U0T3FNQKzFQKQJz80rTM9tDXzDLW1Mv8YPNWDXbmXZ2Mg4KhAGIDdPHrwHz5ROpXXJQ/DVbC/KIYMfpbz7W/4MUPiEoTsOOOYApxZS81lBygKB23XSjCfGOKLluPN6U3WJTN9bRUjy3vYn64/I0Hk4OQSnsCsmKfQuB1owjnnnLOezS+k/6H38ob95+otWtbzRhg6nE/wCPvT89vcdJJg5EhSYUfKtrMriGtIQgqfgbxHR1yvTHgtJezEC3HSxFDA55xoRcMOiAISOE1t2B2Mpoj1t/yhHbINegPMOU7FL40ewJzd6g6EVzdW5q+VyPG2iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cwRGgNT2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cwRGgNT2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwdjf733vz3by8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 00:09:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1D085C6251
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 14:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D0C1C4CEF6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 14:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754316596;
	bh=LBBjk71rUAycmLq8HPSd7ebX20gJuj9bSBiP+qiR7pY=;
	h=From:To:Subject:Date:From;
	b=cwRGgNT20FUCgZsWxlBsiU8+9CWejo5TldtGwyJ66Nztns+8TlRHgw5nvmKO2hGFO
	 oRvRlxnfSrJm387VDebB//yJxhIkU/fDMjfh6Rg9oujWP2YCA7RUELG3cgrTrxOxbF
	 o4lHDTXtnTQraDJEHT4IHdh9GPLYyxkTewnGN0RZRDxxV6wa1Ijkbt06uLhjlLHqQp
	 1bIhWXjIlsu+sg82V7rnZoOu3R9Me1PBsczBe4oaub1W26XT59mbSNUwAJ8/ZBBpyu
	 EI7y9Dydb5g1nLXHmQ95vu6bjWqqUf7Me1lQfEdKv8Rw8JTJ7ZOYkB7uqxrTwJC5Wb
	 pY6ztoVqr9Lwg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4EE6BC4160E; Mon,  4 Aug 2025 14:09:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 220407] New: arch/powerpc/boot/types.h:43:13: error: 'bool'
 cannot be defined via 'typedef' when building with GCC 15
Date: Mon, 04 Aug 2025 14:09:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220407-206035@https.bugzilla.kernel.org/>
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

            Bug ID: 220407
           Summary: arch/powerpc/boot/types.h:43:13: error: 'bool' cannot
                    be defined via 'typedef' when building with GCC 15
           Product: Platform Specific/Hardware
           Version: 2.5
          Hardware: PPC-32
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: PPC-32
          Assignee: platform_ppc-32@kernel-bugs.osdl.org
          Reporter: anhollander516@gmail.com
        Regression: No

Created attachment 308441
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308441&action=3Dedit
Gentoo default kernel config

I have been slowly bringing up a Gentoo PPC system in QEMU to host binary
packages for an iBook G3.

The kernel fails to compile with GCC 15 due to C23 issues:

  DESCEND objtool
  CALL    scripts/checksyscalls.sh
  INSTALL libsubcmd_headers
  COPY    arch/powerpc/boot/inflate.c
  COPY    arch/powerpc/boot/inffast.c
  COPY    arch/powerpc/boot/inftrees.c
  BOOTCC  arch/powerpc/boot/cuboot.o
  COPY    arch/powerpc/boot/fdt.c
  BOOTCC  arch/powerpc/boot/devtree.o
  COPY    arch/powerpc/boot/fdt_ro.c
  COPY    arch/powerpc/boot/fdt_rw.c
  COPY    arch/powerpc/boot/fdt_strerror.c
  COPY    arch/powerpc/boot/fdt_sw.c
  COPY    arch/powerpc/boot/fdt_wip.c
  BOOTCC  arch/powerpc/boot/libfdt-wrapper.o
  BOOTCC  arch/powerpc/boot/main.o
  BOOTCC  arch/powerpc/boot/ns16550.o
  BOOTCC  arch/powerpc/boot/ofconsole.o
  BOOTCC  arch/powerpc/boot/oflib.o
  BOOTCC  arch/powerpc/boot/serial.o
  BOOTCC  arch/powerpc/boot/simple_alloc.o
  BOOTCC  arch/powerpc/boot/stdio.o
  BOOTCC  arch/powerpc/boot/stdlib.o
In file included from arch/powerpc/boot/ops.h:13,
                 from arch/powerpc/boot/cuboot.c:12:
arch/powerpc/boot/types.h:43:13: error: 'bool' cannot be defined via 'typed=
ef'
   43 | typedef int bool;
      |             ^~~~
arch/powerpc/boot/types.h:43:13: note: 'bool' is a keyword with '-std=3Dc23'
onwards
arch/powerpc/boot/types.h:43:1: warning: useless type name in empty declara=
tion
   43 | typedef int bool;
      | ^~~~~~~
In file included from arch/powerpc/boot/devtree.c:12:
arch/powerpc/boot/types.h:43:13: error: 'bool' cannot be defined via 'typed=
ef'
   43 | typedef int bool;
      |             ^~~~
In file included from arch/powerpc/boot/serial.c:14:
arch/powerpc/boot/types.h:43:13: error: 'bool' cannot be defined via 'typed=
ef'
   43 | typedef int bool;
      |             ^~~~
arch/powerpc/boot/types.h:43:13: note: 'bool' is a keyword with '-std=3Dc23'
onwards
In file included from arch/powerpc/boot/ns16550.c:13:
arch/powerpc/boot/types.h:43:13: error: 'bool' cannot be defined via 'typed=
ef'
   43 | typedef int bool;
      |             ^~~~
arch/powerpc/boot/types.h:43:13: note: 'bool' is a keyword with '-std=3Dc23'
onwards
arch/powerpc/boot/types.h:43:13: note: 'bool' is a keyword with '-std=3Dc23'
onwards
arch/powerpc/boot/types.h:43:1: warning: useless type name in empty declara=
tion
   43 | typedef int bool;
      | ^~~~~~~
arch/powerpc/boot/types.h:43:1: warning: useless type name in empty declara=
tion
   43 | typedef int bool;
      | ^~~~~~~
arch/powerpc/boot/types.h:43:1: warning: useless type name in empty declara=
tion
   43 | typedef int bool;
      | ^~~~~~~
In file included from arch/powerpc/boot/ops.h:13,
                 from arch/powerpc/boot/main.c:13:
arch/powerpc/boot/types.h:43:13: error: 'bool' cannot be defined via 'typed=
ef'
   43 | typedef int bool;
      |             ^~~~
In file included from ./arch/powerpc/boot/libfdt_env.h:5,
                 from ./arch/powerpc/boot/libfdt.h:9,
                 from arch/powerpc/boot/libfdt-wrapper.c:13:
./arch/powerpc/boot/types.h:43:13: error: 'bool' cannot be defined via
'typedef'
   43 | typedef int bool;
      |             ^~~~
arch/powerpc/boot/types.h:43:13: note: 'bool' is a keyword with '-std=3Dc23'
onwards
./arch/powerpc/boot/types.h:43:13: note: 'bool' is a keyword with '-std=3Dc=
23'
onwards
./arch/powerpc/boot/types.h:43:1: warning: useless type name in empty
declaration
   43 | typedef int bool;
      | ^~~~~~~
arch/powerpc/boot/types.h:43:1: warning: useless type name in empty declara=
tion
   43 | typedef int bool;
      | ^~~~~~~
In file included from arch/powerpc/boot/oflib.c:6:
arch/powerpc/boot/types.h:43:13: error: 'bool' cannot be defined via 'typed=
ef'
   43 | typedef int bool;
      |             ^~~~
In file included from arch/powerpc/boot/ofconsole.c:8:
arch/powerpc/boot/types.h:43:13: error: 'bool' cannot be defined via 'typed=
ef'
   43 | typedef int bool;
      |             ^~~~
arch/powerpc/boot/types.h:43:13: note: 'bool' is a keyword with '-std=3Dc23'
onwards
arch/powerpc/boot/types.h:43:13: note: 'bool' is a keyword with '-std=3Dc23'
onwards
arch/powerpc/boot/types.h:43:1: warning: useless type name in empty declara=
tion
   43 | typedef int bool;
      | ^~~~~~~
arch/powerpc/boot/types.h:43:1: warning: useless type name in empty declara=
tion
   43 | typedef int bool;
      | ^~~~~~~
make[2]: *** [arch/powerpc/boot/Makefile:234: arch/powerpc/boot/cuboot.o] E=
rror
1
make[2]: *** Waiting for unfinished jobs....
In file included from arch/powerpc/boot/simple_alloc.c:11:
arch/powerpc/boot/types.h:43:13: error: 'bool' cannot be defined via 'typed=
ef'
   43 | typedef int bool;
      |             ^~~~
arch/powerpc/boot/types.h:43:13: note: 'bool' is a keyword with '-std=3Dc23'
onwards
arch/powerpc/boot/types.h:43:1: warning: useless type name in empty declara=
tion
   43 | typedef int bool;
      | ^~~~~~~
In file included from arch/powerpc/boot/ops.h:13,
                 from arch/powerpc/boot/stdio.c:9:
arch/powerpc/boot/types.h:43:13: error: 'bool' cannot be defined via 'typed=
ef'
   43 | typedef int bool;
      |             ^~~~
arch/powerpc/boot/types.h:43:13: note: 'bool' is a keyword with '-std=3Dc23'
onwards
arch/powerpc/boot/types.h:43:1: warning: useless type name in empty declara=
tion
   43 | typedef int bool;
      | ^~~~~~~
make[2]: *** [arch/powerpc/boot/Makefile:234: arch/powerpc/boot/ns16550.o]
Error 1
make[2]: *** [arch/powerpc/boot/Makefile:234: arch/powerpc/boot/serial.o] E=
rror
1
make[2]: *** [arch/powerpc/boot/Makefile:234: arch/powerpc/boot/devtree.o]
Error 1
make[2]: *** [arch/powerpc/boot/Makefile:234: arch/powerpc/boot/ofconsole.o]
Error 1
make[2]: *** [arch/powerpc/boot/Makefile:234: arch/powerpc/boot/main.o] Err=
or 1
make[2]: *** [arch/powerpc/boot/Makefile:234: arch/powerpc/boot/simple_allo=
c.o]
Error 1
make[2]: *** [arch/powerpc/boot/Makefile:234: arch/powerpc/boot/oflib.o] Er=
ror
1
make[2]: *** [arch/powerpc/boot/Makefile:234:
arch/powerpc/boot/libfdt-wrapper.o] Error 1
make[2]: *** [arch/powerpc/boot/Makefile:234: arch/powerpc/boot/stdio.o] Er=
ror
1
make[1]: *** [arch/powerpc/Makefile:236: zImage] Error 2
make: *** [Makefile:248: __sub-make] Error 2

I tried adding KBUILD_CFLAGS +=3D -std=3Dgnu11 to arch/powerpc/boot/Makefil=
e, but
that didn't fix the issue. I am building Linux 6.15.9 because that is the
latest that Gentoo has an official default config for, but
arch/powerpc/boot/types.h and arch/powerpc/boot/Makefile haven't changed fr=
om
there to master. 6.12 fails too, for that matter.



(Truncated) output from emerge --info (I am using a 64-bit kernel in the
emulator, and building a 32-bit userland + kernel for the target system):

Portage 3.0.68 (python 3.13.5-final-0, default/linux/ppc/23.0/desktop, gcc-=
15,
glibc-2.41-r4, 6.12.21-gentoo-ppc64-ppc ppc64)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
System uname:
Linux-6.12.21-gentoo-ppc64-ppc-ppc64-POWER9_-architected-,_altivec_supporte=
d-with-glibc2.41
KiB Mem:    24096492 total,  10071272 free
KiB Swap:          0 total,         0 free
Head commit of repository gentoo: 5fbe5609e04996b5d2c6bed17f8bc55970d759bb

ld GNU ld (Gentoo 2.44 p4) 2.44.0
sys-devel/binutils:        2.44-r3::gentoo, 2.45::gentoo
sys-devel/gcc:             15.1.1_p20250705-r1::gentoo
sys-kernel/linux-headers:  6.16::gentoo (virtual/os-headers)
sys-libs/glibc:            2.41-r4::gentoo

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

