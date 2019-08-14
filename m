Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3FA8D703
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 17:14:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467tRN2JzfzDqvr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 01:14:40 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 467tNd4Tm3zDqPB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 01:12:16 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 27DA6288D2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 15:12:14 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 1B786288CE; Wed, 14 Aug 2019 15:12:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204371] BUG kmalloc-4k (Tainted: G        W        ): Object
 padding overwritten
Date: Wed, 14 Aug 2019 15:12:13 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Slab Allocator
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: akpm@linux-foundation.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204371-206035-ANDSeS66Sr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204371-206035@https.bugzilla.kernel.org/>
References: <bug-204371-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204371

--- Comment #18 from Erhard F. (erhard_f@mailbox.org) ---
On Wed, 14 Aug 2019 08:56:34 +0000
bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=3D204371
>=20
> --- Comment #17 from Christophe Leroy (christophe.leroy@c-s.fr) ---
> Created attachment 284379
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D284379&action=3Dedi=
t=20=20
> Patch to trace misaligned destination in copy_page() on PPC32
>=20
> Can you try the attached patch to trace misaligned destination on copy_pa=
ge()
> ?
Sorry, the patched kernel does not build:

# LC_ALL=3DC git status
HEAD detached at v5.3-rc4
You are currently bisecting, started from branch 'master'.
  (use "git bisect reset" to get back to the original branch)

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   arch/powerpc/include/asm/page_32.h
        modified:   arch/powerpc/kernel/misc_32.S

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        trace_misaligned_copy_page.diff

no changes added to commit (use "git add" and/or "git commit -a")
# LC_ALL=3DC make
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
  CHK     include/generated/compile.h
  CALL    arch/powerpc/kernel/prom_init_check.sh
  CC      lib/generic-radix-tree.o
In file included from ./arch/powerpc/include/asm/page.h:244,
                 from ./include/linux/generic-radix-tree.h:39,
                 from lib/generic-radix-tree.c:3:
./arch/powerpc/include/asm/page_32.h: In Funktion =C2=BBcopy_page=C2=AB:
./arch/powerpc/include/asm/page_32.h:58:2: Fehler: Implizite Deklaration der
Funktion =C2=BBWARN_ON=C2=AB; meinten Sie =C2=BBKERN_SOH=C2=AB?
[-Werror=3Dimplicit-function-declaration]
  WARN_ON((unsigned long)to & (L1_CACHE_BYTES - 1));
  ^~~~~~~
  KERN_SOH
cc1: Einige Warnungen werden als Fehler behandelt
make[1]: *** [scripts/Makefile.build:281: lib/generic-radix-tree.o] Fehler 1
make: *** [Makefile:1083: lib] Error 2

--=20
You are receiving this mail because:
You are on the CC list for the bug.=
