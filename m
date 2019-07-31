Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA147B8E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 06:52:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45z1HM5hCmzDqZy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 14:51:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45z1Dz69t6zDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 14:49:55 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 4C9B5288B7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 04:49:53 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 4045A288C3; Wed, 31 Jul 2019 04:49:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204375] kernel 5.2.4 w. KASAN enabled fails to boot on a
 PowerMac G4 3,6 at very early stage
Date: Wed, 31 Jul 2019 04:49:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@c-s.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204375-206035-OmkaB9Isjl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204375-206035@https.bugzilla.kernel.org/>
References: <bug-204375-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204375

Christophe Leroy (christophe.leroy@c-s.fr) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christophe.leroy@c-s.fr

--- Comment #2 from Christophe Leroy (christophe.leroy@c-s.fr) ---
Looks like a panic happens in kasan_mmu_init() due to page allocation failu=
re.

#0  __delay (loops=3D0x186a0) at arch/powerpc/kernel/time.c:470
#1  0xc0043b34 in panic (fmt=3D<optimized out>) at kernel/panic.c:305
#2  0xc0049f1c in do_exit (code=3D0xb) at kernel/exit.c:789
#3  0xc0012c30 in oops_end (signr=3D<optimized out>, regs=3D<optimized out>,
flags=3D<optimized out>) at arch/powerpc/kernel/traps.c:249
#4  die (str=3D0xc08c78a0 <read_bhrb+8956080> "Kernel access of bad area",
regs=3D0xc0f60000 <reservation_seqcount_class>, err=3D0xb) at
arch/powerpc/kernel/traps.c:294
#5  0xc00194a8 in handle_page_fault () at arch/powerpc/kernel/entry_32.S:632
#6  0xc011ca64 in task_css (task=3D0xc0da69a0 <init_task>, subsys_id=3D<opt=
imized
out>) at ./include/linux/cgroup.h:486
#7  0xc011ca7c in task_cs (task=3D<optimized out>) at kernel/cgroup/cpuset.=
c:199
#8  0xc011fed4 in cpuset_print_current_mems_allowed () at
kernel/cgroup/cpuset.c:3444
#9  0xc0210c64 in warn_alloc (gfp_mask=3D<optimized out>, nodemask=3D0x0,
fmt=3D0xc093e080 <read_bhrb+9441424> "page allocation failure: order:%u") at
mm/page_alloc.c:3765
#10 0xc021151c in __alloc_pages_slowpath (ac=3D<optimized out>, order=3D<op=
timized
out>, gfp_mask=3D<optimized out>) at mm/page_alloc.c:4637
#11 __alloc_pages_nodemask (gfp_mask=3D0x100, order=3D0x0, preferred_nid=3D=
<optimized
out>, nodemask=3D<optimized out>) at mm/page_alloc.c:4745
#12 0xc0022480 in __alloc_pages (order=3D<optimized out>,
preferred_nid=3D<optimized out>, gfp_mask=3D<optimized out>) at
./include/linux/gfp.h:473
#13 __alloc_pages_node (order=3D<optimized out>, gfp_mask=3D<optimized out>,
nid=3D<optimized out>) at ./include/linux/gfp.h:486
#14 alloc_pages_node (nid=3D<optimized out>, order=3D<optimized out>,
gfp_mask=3D<optimized out>) at ./include/linux/gfp.h:500
#15 __alloc_for_ptecache (mm=3D<optimized out>, kernel=3D<optimized out>) at
arch/powerpc/mm/pgtable-frag.c:69
#16 pte_fragment_alloc (mm=3D<optimized out>, kernel=3D<optimized out>) at
arch/powerpc/mm/pgtable-frag.c:106
#17 0xc0024034 in pte_alloc_one_kernel (mm=3D<optimized out>) at
./arch/powerpc/include/asm/pgalloc.h:27
#18 kasan_init_shadow_page_tables (k_start=3D0xf8400000, k_end=3D<optimized=
 out>)
at arch/powerpc/mm/kasan/kasan_init_32.c:38
#19 0xc0c92734 in kasan_mmu_init () at
arch/powerpc/mm/kasan/kasan_init_32.c:104
#20 0xc0c91560 in MMU_init () at arch/powerpc/mm/init_32.c:178
#21 0xc000354c in start_here () at arch/powerpc/kernel/head_32.S:899

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
