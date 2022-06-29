Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7663C55FD1D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 12:26:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXyLN2Lxlz3fkv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 20:26:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LCCG8kLA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LCCG8kLA;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXyKf2Vpcz3bq3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 20:25:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 49C3560EAD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 10:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCCCCC341D8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656498352;
	bh=f13oGyCbk2pAdK4DdjbptnWZFUvxlEdpdcW8FgfFdXE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LCCG8kLA3y+FDy5ng9YOoiT0p4f6Vp5Ov51bSm7UGVsQ79UT5D0BFEmhsMzaRGVOB
	 O/TRbyxQwEolXWTvfaUfkiIRV0wFZzm1HwERdzYRSGv4uBIzrnJtH+Yj3oxvOnQQYX
	 ChuaMxCA/EWTVgPZdXtezcMgKo51vjC7f8pmO12qWYZhDXvd7+GQ0l9G2WNHRe048E
	 +2ystB1kxw5Hvhmawa78U10NT8G5kUXd8dCEPxPenAdx3k8bGPz+SZmfN2kGwnS9Ud
	 q335gbInZdI2wJbgEYv7MPyRulgEINn2sr0VyD53SnusCt0VQfL3l6WWlTrM9AYkva
	 IsFY1QxwATkgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9350BC05FD2; Wed, 29 Jun 2022 10:25:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 215389] pagealloc: memory corruption at building glibc-2.33 and
 running its' testsuite
Date: Wed, 29 Jun 2022 10:25:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215389-206035-vaAXPU0v8m@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215389-206035@https.bugzilla.kernel.org/>
References: <bug-215389-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215389

--- Comment #31 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Michael Ellerman from comment #30)
> It's a bit of a stab in the dark, but can you try turning preempt off?
>=20
> ie. CONFIG_PREEMPT_NONE=3Dy
Just tested that. Backtrace looks a little different but not much.

[..]
pagealloc: memory corruption
fffdfff0: 00 00 00 00                                      ....
CPU: 0 PID: 29086 Comm: localedef Not tainted 5.19.0-rc4-PMacG4 #2
Call Trace:
[f397bc90] [c05eb280] dump_stack_lvl+0x60/0x90 (unreliable)
[f397bcb0] [c0233128] __kernel_unpoison_pages+0x1a8/0x1ec
[f397bd00] [c02172ec] get_page_from_freelist+0xc20/0xe70
[f397bdc0] [c0217de0] __alloc_pages+0x180/0xe98
[f397be80] [c01fa164] handle_mm_fault+0x450/0xd64
[f397bf00] [c00215d8] do_page_fault+0x1d0/0x82c
[f397bf30] [c000433c] DataAccess_virt+0x124/0x17c
--- interrupt: 300 at 0x83f1b8
NIP:  0083f1b8 LR: 0083e25c CTR: 00000000
REGS: f397bf40 TRAP: 0300   Not tainted  (5.19.0-rc4-PMacG4)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 88224462  XER: 00000000
DAR: 01232b3c DSISR: 42000000=20
GPR00: 00840220 af9416c0 a7ca4000 01231b50 00000fe0 00000005 01232b38 00000=
000=20
GPR08: 00000ff1 01231b48 0000f4c9 008422b0 01067408 00a2fe34 00000070 01231=
b50=20
GPR16: 00000000 00000000 00000000 00000007 0000003f 009ba23c 01067010 009ba=
79c=20
GPR24: 00000062 009bdac8 000000fe 009ba79c 00000fe0 009ba764 009b9ff4 00000=
ff0=20
NIP [0083f1b8] 0x83f1b8
LR [0083e25c] 0x83e25c
--- interrupt: 300
page:ef4bd80c refcount:1 mapcount:0 mapping:00000000 index:0x1 pfn:0x310ab
flags: 0x80000000(zone=3D2)
raw: 80000000 00000100 00000122 00000000 00000001 00000000 ffffffff 00000001
raw: 00000000
page dumped because: pagealloc: corrupted page details


Interesting thing is the memory corruption always seems to happen in the la=
st
stage of installing, after building is done at copying over the binaries fr=
om
build directory to target directory:

[...]
if test -r
/var/tmp/portage/sys-libs/glibc-2.34-r13/image//usr/include/gnu/stubs-32.h =
&&
cmp -s
/var/tmp/portage/sys-libs/glibc-2.34-r13/work/build-ppc-powerpc-unknown-lin=
ux-gnu-nptl/stubs.h
/var/tmp/portage/sys-libs/glibc-2.34-r13/image//usr/include/gnu/stubs-32.h;=
 \
then echo 'stubs.h unchanged'; \
else /usr/lib/portage/python3.10/ebuild-helpers/xattr/install -c -m 644
/var/tmp/portage/sys-libs/glibc-2.34-r13/work/build-ppc-powerpc-unknown-lin=
ux-gnu-nptl/stubs.h
/var/tmp/portage/sys-libs/glibc-2.34-r13/image//usr/include/gnu/stubs-32.h;=
 fi
rm -f
/var/tmp/portage/sys-libs/glibc-2.34-r13/work/build-ppc-powerpc-unknown-lin=
ux-gnu-nptl/stubs.h
make[1]: Leaving directory
'/var/tmp/portage/sys-libs/glibc-2.34-r13/work/glibc-2.34'
>>> Completed installing sys-libs/glibc-2.34-r13 into
>>> /var/tmp/portage/sys-libs/glibc-2.34-r13/image

 * Final size of build directory: 635640 KiB (620.7 MiB)
 * Final size of installed tree:  109892 KiB (107.3 MiB)

making executable: /usr/lib/libc.so
compressme           : 44.96%   (  3.80 KiB =3D>   1.71 KiB, compressme.zst=
)=20=20=20=20=20
[...]
/var/tmp/portage/sys-libs/glibc-2.34-r13/image/usr/share/doc/glibc-2.34-r13=
/NEWS
: 33.98%   (   315 KiB =3D>    107 KiB,
/var/tmp/portage/sys-libs/glibc-2.34-r13/image/usr/share/doc/glibc-2.34-r13=
/NEWS.zst)=20
strip: powerpc-unknown-linux-gnu-strip --strip-unneeded -N
__gentoo_check_ldflags__ -R .comment -R .GCC.command.line -R
.note.gnu.gold-version
   /usr/lib/crt1.o
   /usr/lib/Mcrt1.o
   /usr/lib/gcrt1.o
   /usr/lib/Scrt1.o
[...]
   /lib/ld.so.1
   /usr/lib/audit/sotruss-lib.so
   /usr/bin/pldd
installsources: rsyncing source files
rsync: [sender] link_stat
"/var/tmp/portage/sys-libs/glibc-2.34-r13/work/glibc-2.34/iconv/charmap-kw.=
gperf"
failed: No such file or directory (2)
rsync: [sender] link_stat
"/var/tmp/portage/sys-libs/glibc-2.34-r13/work/glibc-2.34/locale/charmap-kw=
.gperf"
failed: No such file or directory (2)
rsync: [sender] link_stat
"/var/tmp/portage/sys-libs/glibc-2.34-r13/work/glibc-2.34/locale/locfile-kw=
.gperf"
failed: No such file or directory (2)
rsync error: some files/attrs were not transferred (see previous errors) (c=
ode
23) at main.c(1326) [sender=3D3.2.4]

>>> Installing (1 of 1) sys-libs/glibc-2.34-r13::gentoo
 * Defaulting /etc/host.conf:multi to on
 * Last-minute run tests with ./ld.so.1 in /lib ...
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
