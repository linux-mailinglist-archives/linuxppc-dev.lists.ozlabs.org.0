Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C615D58B581
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 14:31:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M0MKF57f4z3bYS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 22:31:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=WVW4o4UA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=WVW4o4UA;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M0MGh715Qz2xk9
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Aug 2022 22:29:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1659788970;
	bh=2Q7uVoi9etUHQcg6k8CWD2qINr2lwPxkOfHfz7vCqgM=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=WVW4o4UAsWnO8EhWWGn8B4i/eBIDn2vVCIH72z1hZcNBCwCShWHdb6ggWCTQbuu98
	 V6Ga4XBzY+0PKzIrDfVhgG/xUCTW3vvdCD2PhuRcamMH8B3p4Bzp5M9G0mNK1/hv1y
	 iD6CxhcFwjbL7edhut3TOEP8Tn1gDyemmNkHUzhI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.170.46]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2wGs-1oGzSU1xXg-003PL9; Sat, 06
 Aug 2022 14:23:50 +0200
From: Helge Deller <deller@gmx.de>
To: linux-s390@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Josh Triplett <josh@joshtriplett.org>,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 0/3] Dump command line of faulting process to syslog
Date: Sat,  6 Aug 2022 14:23:45 +0200
Message-Id: <20220806122348.82584-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SFsa6Df2ppv7VmXIO81pLmiWdYqA+5p7hjdVr9P8sJdlxgTdXyx
 4V3iT2wC6bHvXC7t2xifm5y+1XtJi7CeGrvmNskRuT+NUD70O1J5kP8BJ76oKwyi2IlzJAr
 BeVqMiWEYJvxsEVrSmCLgUqGp4CJmeKFij/TJWDQe8IoiingusSdIpMlpJ9baRQDqGsZIjv
 Umt6qVYh0t5eerHTwNAng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pcrII/Jg5I4=:gil+UrlBVAIDvuWSx+h8qR
 HApYBc/p0yQE6hcTAKkYoTxikoaXdEZ5WDAvzcuVNlW6ELze78lZxzIHIwYhsxlpO028rkfXi
 /squ+2OTkGsrSUDhvhW8WKuAMc2G97kRKAjmShFjCuHyLs92wOh+F+dmrOAB8GB4fgqXJ5SFO
 5/irjBcfkEQz5f0yVhTC4T3POpDNpLoeniqCKYUhMFV4qvdEONhtmZaH/vU3gbiSl1Urprezq
 iaYzAerQUK1L/f47TE6Pmn7/u8mEAcm5aG6doutd+lZl2Dy7ETz439gjv/QdX/r1o50bBeW78
 7mvcbaAK1BXRyXPx4as+BTI+EgU0O0ebAlqso+JfZZN/61Re0FWfBm+PyK4Asl0Od8Oik57S8
 Yoqt1W9z+gWekuikhvezI1fRlLQ8q//jkCOTDoriJy8Xcgc3wg1lfUCT2GrXW4/6pQh2QBQop
 PCnEwilPvq6INI5J9H8ncJD5nqWnIuDtgWaTzRGLn+9ZdxDqaaklTlvQkF1DAWKc/iTJ+DgZW
 snF8tPJYqfVyuvmfJCgw/lH5H5yaOepmOmKo3e6HrwVmEH2pC0hdaczHrUX+DwhM8MlGTZzkX
 UQZZGsphIzfZeuzLUtzPxgX6ZE6XL8pj8o6XO8biN5VXMEJiiup6IhfO8249uUq43A2wkQtQg
 EXdmItJa83SLY6d0OmiqI4VHnCo1PsqJJuwfQCLuMU6FSFyJXJPZvuMTsLa25MPPB2LLvmwh/
 fhUxp4wkVvc8jKULG7cnlOAg0ZrLfsX3Z8t9Ii4dY+yaZUVKhE2tJ29gYtM2BJUd6dFEnrTNy
 gtiIEt/ChgFH9xhARtavQ7S2KGDy5oIQ95bZPF6Fm9GnR5elY+gEvIT+5RvZdPpckjExeA+t5
 Wq0AyqLtA4QNXdKzpiA7Q59siakCZKjOU1yjgSgLWQhKnOAD98dAM/Ec8FKDh6RZtHVb1avJ/
 laqZRp/Yg/VrNKDVv44MnXZChPuIFXkHhOdcLB5h1hOB95cCKbPPryiqbw309vDRE5SBd5xYj
 pv8WeiwtFsv68MsPlqgdVQkIovXGRNtUOFnDmlmWba69vBSAhujMp3YH/GIafdLqPyGJlO6/J
 npcqqhQSUrg6qe0qPyu/jB0oRlt56mjHs4zmmanB7uyPNElrdIcKTaMAQ==
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

This patch series allows the arch-specific kernel fault handlers to dump
the command line parameters of the faulting process.

The motivation for this patch is that it's sometimes quite hard to find ou=
t and
annoying to not know which program *exactly* faulted when looking at the s=
yslog.

Some examples from the syslog are:

On parisc:
   do_page_fault() command=3D'cc1' type=3D15 address=3D0x00000000 in libc-=
2.33.so[f6abb000+184000]
   CPU: 1 PID: 13472 Comm: cc1 Tainted: G            E     5.10.133+ #45
   Hardware name: 9000/785/C8000

-> We see the "cc1" compiler crashed, but it would be useful to know which=
 file was compiled.

With this patch series, the kernel now prints in addition:
   cc1[13472] cmdline: /usr/lib/gcc/hppa-linux-gnu/12/cc1 -quiet @/tmp/ccR=
kFSfY -imultilib . -imultiarch hppa-linux-gnu -D USE_MINIINTERPRETER -D NO=
_REGS -D _HPUX_SOURCE -D NOSMP -D THREADED_RTS -include /build/ghc/ghc-9.0=
.2/includes/dist-install/build/ghcversion.h -iquote compiler/GHC/Iface -qu=
iet -dumpdir /tmp/ghc13413_0/ -dumpbase ghc_5.hc -dumpbase-ext .hc -O -Wim=
plicit -fno-PIC -fwrapv -fno-builtin -fno-strict-aliasing -o /tmp/ghc13413=
_0/ghc_5.s

-> now we know that cc1 crashed while compiling some haskell code.

Another parisc example:
   do_page_fault() command=3D'ld.so.1' type=3D15 address=3D0x565921d8 in l=
ibc.so[f7339000+1bb000]
   CPU: 1 PID: 1151 Comm: cc1 Tainted: G            E     5.10.133+ #45
   Hardware name: 9000/785/C8000

-> apparently here a program from the glibc testsuite segfaulted.

With this patch we now additionally get:
   ld.so.1[1151] cmdline: /home/gnu/glibc/objdir/elf/ld.so.1 --library-pat=
h /home/gnu/glibc/objdir:/home/gnu/glibc/objdir/math:/home/gnu/
        /home/gnu/glibc/objdir/malloc/tst-safe-linking-malloc-hugetlb1

-> it was the tst-safe-linking-malloc-hugetlb1 testcase which faulted.

An example of a typical x86 fault shows up as:
   crash[2326]: segfault at 0 ip 0000561a7969c12e sp 00007ffe97a05630 erro=
r 6 in crash[561a7969c000+1000]
   Code: 68 ff ff ff c6 05 19 2f 00 00 01 5d c3 0f 1f 80 00 00 00 00 c3 0f=
 1f 80 00 00 00 00 e9 7b ff ff ff 55 48 89 e5 b8 00 00 00 00 <c7> 00 01 00=
 00 00 b8 00 00 00 00 5d c3 0f 1f 44 00 00 41 57 4c 8d

-> with this patch we now will see the whole command line:
   crash[2326] cmdline: ./crash test_write_to_page_0

The patches are relatively small, and reuses functions which are used
to create the output for the /proc/<pid>/cmdline files.

In this version 2 of the patch set, all or parts of the command line isn't
shown if the value of the kptr_restrict sysctl >=3D 1.

Thanks!
Helge

=2D--

Changes compared to v1 of this patchset:
=2D---------------------------------------
- Don't dump all or parts of the commandline depending on the
  kptr_restrict sysctl value (suggested by Josh Triplett).
- Patch sent to more arch mailing lists

Helge Deller (3):
  proc: Add get_task_cmdline_kernel() function
  lib/dump_stack: Add dump_stack_print_cmdline() and wire up in
    dump_stack_print_info()
  x86/fault: Dump command line of faulting process to syslog

 arch/x86/mm/fault.c     |  2 ++
 fs/proc/base.c          | 68 +++++++++++++++++++++++++++--------------
 include/linux/printk.h  |  5 +++
 include/linux/proc_fs.h |  5 +++
 lib/dump_stack.c        | 34 +++++++++++++++++++++
 5 files changed, 91 insertions(+), 23 deletions(-)

=2D-
2.37.1

