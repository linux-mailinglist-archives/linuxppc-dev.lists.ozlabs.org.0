Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4B42490F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 00:34:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWQh640CRzDqt3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 08:34:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=rsta=b4=bugzilla.kernel.org=bugzilla-daemon@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWQf66P0gzDqrT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 08:32:46 +1000 (AEST)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linuxppc-dev@lists.ozlabs.org
Subject: =?UTF-8?B?W0J1ZyAyMDg5NTddIE5ldzogNS45LXJjMSBmYWlscyB0byBidWls?=
 =?UTF-8?B?ZCBmb3IgYSBQb3dlck1hYyBHNTogLi4uL2Jvb2szczY0L2hhc2hfdXRpbHMu?=
 =?UTF-8?B?YzoxMTE5OjIxOiBlcnJvcjog4oCYZGVmYXVsdF91YW1vcuKAmSB1bmRlY2xh?=
 =?UTF-8?B?cmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikgIDExMTkgfCAgIG10?=
 =?UTF-8?B?c3ByKFNQUk5fVUFNT1IsIGRlZmF1bHRfdWFtb3IpOw==?=
Date: Tue, 18 Aug 2020 22:32:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-208957-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208957

            Bug ID: 208957
           Summary: 5.9-rc1 fails to build for a PowerMac G5:
                    .../book3s64/hash_utils.c:1119:21: error:
                    =E2=80=98default_uamor=E2=80=99 undeclared (first use i=
n this
                    function)  1119 |   mtspr(SPRN_UAMOR, default_uamor);
           Product: Platform Specific/Hardware
           Version: 2.5
    Kernel Version: 5.9-rc1
          Hardware: PPC-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 292021
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D292021&action=3Dedit
kernel .config (kernel 5.9-rc1, PowerMac G5 11,2)

[...]
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  CHK     include/generated/compile.h
  CC      arch/powerpc/mm/book3s64/hash_utils.o
In file included from ./arch/powerpc/include/asm/processor.h:9,
                 from ./arch/powerpc/include/asm/thread_info.h:40,
                 from ./include/linux/thread_info.h:38,
                 from ./include/asm-generic/preempt.h:5,
                 from ./arch/powerpc/include/generated/asm/preempt.h:1,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/spinlock.h:51,
                 from arch/powerpc/mm/book3s64/hash_utils.c:21:
arch/powerpc/mm/book3s64/hash_utils.c: In function
=E2=80=98hash__early_init_mmu_secondary=E2=80=99:
arch/powerpc/mm/book3s64/hash_utils.c:1119:21: error: =E2=80=98default_uamo=
r=E2=80=99
undeclared (first use in this function)
 1119 |   mtspr(SPRN_UAMOR, default_uamor);
      |                     ^~~~~~~~~~~~~
./arch/powerpc/include/asm/reg.h:1396:33: note: in definition of macro =E2=
=80=98mtspr=E2=80=99
 1396 |          : "r" ((unsigned long)(v)) \
      |                                 ^
arch/powerpc/mm/book3s64/hash_utils.c:1119:21: note: each undeclared identi=
fier
is reported only once for each function it appears in
 1119 |   mtspr(SPRN_UAMOR, default_uamor);
      |                     ^~~~~~~~~~~~~
./arch/powerpc/include/asm/reg.h:1396:33: note: in definition of macro =E2=
=80=98mtspr=E2=80=99
 1396 |          : "r" ((unsigned long)(v)) \
      |                                 ^
make[3]: *** [scripts/Makefile.build:283:
arch/powerpc/mm/book3s64/hash_utils.o] Error 1
make[2]: *** [scripts/Makefile.build:500: arch/powerpc/mm/book3s64] Error 2
make[1]: *** [scripts/Makefile.build:500: arch/powerpc/mm] Error 2
make: *** [Makefile:1789: arch/powerpc] Error 2

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
