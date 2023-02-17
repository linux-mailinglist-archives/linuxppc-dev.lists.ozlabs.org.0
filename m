Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 849A169B1B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 18:23:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJJYS3Gdtz3fRq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 04:23:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lug-owl.de (client-ip=188.68.32.151; helo=lug-owl.de; envelope-from=jbglaw@lug-owl.de; receiver=<UNKNOWN>)
X-Greylist: delayed 504 seconds by postgrey-1.36 at boromir; Sat, 18 Feb 2023 04:22:36 AEDT
Received: from lug-owl.de (lug-owl.de [188.68.32.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJJXr1Mhbz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 04:22:36 +1100 (AEDT)
Received: by lug-owl.de (Postfix, from userid 1001)
	id 46D2142074; Fri, 17 Feb 2023 18:14:07 +0100 (CET)
Date: Fri, 17 Feb 2023 18:14:07 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: microwatt_defconfig broken: fined reference to `hash__tlb_flush'
Message-ID: <20230217171407.zuhmdozno3am6flk@lug-owl.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rjxwbo7nvlvyuvkv"
Content-Disposition: inline
X-Operating-System: Linux chamaeleon 5.14.0-0.bpo.2-amd64 
X-gpg-fingerprint: 250D 3BCF 7127 0D8C A444  A961 1DBD 5E75 8399 E1BB
X-gpg-key: wwwkeys.de.pgp.net
X-Echelon-Enable: howto poison arsenous mail psychological biological nuclear
 warfare test the bombastical terror of flooding the spy listeners explosion
 sex drugs and rock'n'roll
X-TKUeV: howto poison arsenous mail psychological biological nuclear warfare
 test the bombastical terror of flooding the spy listeners explosion sex
 drugs and rock'n'roll
X-message-flag: Please send plain text messages only. Do not send HTML
 emails. Thank you. 
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--rjxwbo7nvlvyuvkv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

My CI builds showed that the microwatt_defconfig broke somewhere between
(upstream Linus) 6d796c50f84ca79f1722bb131799e5a5710c4700 (last known good,=
 log
at [1]) and 033c40a89f55525139fd5b6342281b09b97d05bf (first known bad, log =
at
[2]) with this:

[...]
make V=3D1 ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64le-linux- INSTALL_MOD_PA=
TH=3D/var/lib/laminar/run/linux-powerpc-microwatt_defconfig/28/linux-powerp=
c-microwatt_defconfig INSTALL_DTBS_PATH=3D/var/lib/laminar/run/linux-powerp=
c-microwatt_defconfig/28/linux-powerpc-microwatt_defconfig all
[...]
[mk all 2023-02-17 01:42:27] + powerpc64le-linux-ld -EL -z noexecstack --no=
-warn-rwx-segments -Bstatic --build-id=3Dsha1 --orphan-handling=3Dwarn --sc=
ript=3D./arch/powerpc/kernel/vmlinux.lds --strip-debug -o .tmp_vmlinux.kall=
syms1 --whole-archive vmlinux.a init/version-timestamp.o --no-whole-archive=
 --start-group lib/lib.a --end-group
[mk all 2023-02-17 01:42:28] powerpc64le-linux-ld: mm/memory.o: in function=
 `tlb_flush_mmu_tlbonly':
[mk all 2023-02-17 01:42:28] memory.c:(.text+0x320): undefined reference to=
 `hash__tlb_flush'
[mk all 2023-02-17 01:42:28] powerpc64le-linux-ld: mm/mmu_gather.o: in func=
tion `tlb_flush_mmu_tlbonly':
[mk all 2023-02-17 01:42:28] mmu_gather.c:(.text+0xe0): undefined reference=
 to `hash__tlb_flush'
[mk all 2023-02-17 01:42:28] powerpc64le-linux-ld: mm/mprotect.o: in functi=
on `change_protection':
[mk all 2023-02-17 01:42:28] mprotect.c:(.text+0x59c): undefined reference =
to `hash__tlb_flush'
[mk all 2023-02-17 01:42:28] powerpc64le-linux-ld: mm/madvise.o: in functio=
n `tlb_end_vma.isra.0':
[mk all 2023-02-17 01:42:28] madvise.c:(.text+0x1f0): undefined reference t=
o `hash__tlb_flush'
[mk all 2023-02-17 01:42:28] make[1]: *** [scripts/Makefile.vmlinux:35: vml=
inux] Error 1
[mk all 2023-02-17 01:42:28] make: *** [Makefile:1264: vmlinux] Error 2


It's not yet bisected fully, but I guess it was caused while trying to
fix a missing tlb flush:

commit 1665c027afb225882a5a0b014c45e84290b826c2
Author: Michael Ellerman <mpe@ellerman.id.au>
Date:   Tue Jan 31 22:14:07 2023 +1100

    powerpc/64s: Reconnect tlb_flush() to hash__tlb_flush()
   =20
    Commit baf1ed24b27d ("powerpc/mm: Remove empty hash__ functions")
    removed some empty hash MMU flushing routines, but got a bit overeager
    and also removed the call to hash__tlb_flush() from tlb_flush().
   =20
    In regular use this doesn't lead to any noticable breakage, which is a
    little concerning. Presumably there are flushes happening via other
    paths such as arch_leave_lazy_mmu_mode(), and/or a bit of luck.
   =20
    Fix it by reinstating the call to hash__tlb_flush().
   =20
    Fixes: baf1ed24b27d ("powerpc/mm: Remove empty hash__ functions")
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
    Link: https://lore.kernel.org/r/20230131111407.806770-1-mpe@ellerman.id=
=2Eau

MfG, JBG


[1] http://toolchain.lug-owl.de/laminar/jobs/linux-powerpc-microwatt_defcon=
fig/27
[2] http://toolchain.lug-owl.de/laminar/jobs/linux-powerpc-microwatt_defcon=
fig/28
--=20

--rjxwbo7nvlvyuvkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQQlDTvPcScNjKREqWEdvV51g5nhuwUCY++13AAKCRAdvV51g5nh
u5FGAJ4iTkSgpGWQmfdkLtozkK6pSZzWDwCfZ7VJbH792YKW49yyt98MUxfLyg8=
=Tt60
-----END PGP SIGNATURE-----

--rjxwbo7nvlvyuvkv--
