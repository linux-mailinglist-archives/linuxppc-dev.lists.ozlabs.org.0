Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA52B7C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2019 16:41:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CKRx4sLwzDqBv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 00:41:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bugzilla.kernel.org
 (client-ip=198.145.29.98; helo=mail.wl.linuxfoundation.org;
 envelope-from=bugzilla-daemon@bugzilla.kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CKKj4HHNzDqK9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 00:36:24 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id DA8772851E
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2019 14:36:21 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id CE97A286EE; Mon, 27 May 2019 14:36:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=ham version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 203723] New: Build error: taking address of packed member of
 'struct ftrace_graph_ent' may result in an unaligned pointer value
Date: Mon, 27 May 2019 14:36:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jason@bluehome.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-203723-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203723

            Bug ID: 203723
           Summary: Build error: taking address of packed member of
                    'struct ftrace_graph_ent' may result in an unaligned
                    pointer value
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 4.14.122
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: jason@bluehome.net
        Regression: No

Created attachment 282967
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D282967&action=3Dedit
Build log

This error appears while building 4.14.122. I'm building with GCC 9.1 for
ppc64el.

make -f ./scripts/Makefile.build obj=3Darch/powerpc/kernel/trace
  powerpc64le-linux-gcc -m64 -Wp,-MD,arch/powerpc/kernel/trace/.ftrace.o.d=
=20
-nostdinc -isystem
/home/jason/toolchain/bin/../lib/gcc/powerpc64le-linux/9.1.0/include
-I./arch/powerpc/include -I./arch/powerpc/include/generated  -I./include
-I./arch/powerpc/include/uapi -I./arch/powerpc/include/generated/uapi
-I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfi=
g.h
-D__KERNEL__ -DCC_USING_MPROFILE_KERNEL -Iarch/powerpc -DHAVE_AS_ATHIGH=3D1=
 -Wall
-Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-fshort-wchar -Werror-implicit-function-declaration -Wno-format-security
-std=3Dgnu89 -fno-PIE -msoft-float -pipe -Iarch/powerpc -mtraceback=3Dno
-mabi=3Delfv2 -mcmodel=3Dmedium -mno-pointers-to-nested-functions -mcpu=3Dp=
ower8
-mno-altivec -mno-vsx -funit-at-a-time -fno-dwarf2-cfi-asm -mno-string
-Wa,-maltivec -mlittle-endian -mno-strict-align -fno-delete-null-pointer-ch=
ecks
-Wno-frame-address -Wno-format-truncation -Wno-format-overflow
-Wno-int-in-bool-context -Wno-attribute-alias -O2
--param=3Dallow-store-data-races=3D0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=
=3D2048
-fno-stack-protector -Wno-unused-but-set-variable -Wno-unused-const-variable
-fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-si=
gn
-Wno-stringop-truncation -fno-strict-overflow -fno-merge-all-constants
-fmerge-constants -fno-stack-check -fconserve-stack -Werror=3Dimplicit-int
-Werror=3Dstrict-prototypes -Werror=3Ddate-time -Werror=3Dincompatible-poin=
ter-types
-Werror=3Ddesignated-init -Wno-packed-not-aligned -Werror -Werror=20=20=20
-DKBUILD_BASENAME=3D'"ftrace"'  -DKBUILD_MODNAME=3D'"ftrace"' -c -o
arch/powerpc/kernel/trace/ftrace.o arch/powerpc/kernel/trace/ftrace.c
arch/powerpc/kernel/trace/ftrace.c: In function 'prepare_ftrace_return':
arch/powerpc/kernel/trace/ftrace.c:596:43: error: taking address of packed
member of 'struct ftrace_graph_ent' may result in an unaligned pointer value
[-Werror=3Daddress-of-packed-member]
  596 |  if (ftrace_push_return_trace(parent, ip, &trace.depth, 0,
      |                                           ^~~~~~~~~~~~
cc1: all warnings being treated as errors
scripts/Makefile.build:326: recipe for target
'arch/powerpc/kernel/trace/ftrace.o' failed
make[2]: *** [arch/powerpc/kernel/trace/ftrace.o] Error 1
scripts/Makefile.build:585: recipe for target 'arch/powerpc/kernel/trace'
failed
make[1]: *** [arch/powerpc/kernel/trace] Error 2
Makefile:1038: recipe for target 'arch/powerpc/kernel' failed
make: *** [arch/powerpc/kernel] Error 2

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
