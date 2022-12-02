Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FFE63FECF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 04:32:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNdm90W9vz3bf3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 14:32:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=IqwSsQev;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNdl75c0Kz3057
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 14:31:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=IqwSsQev;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NNdl54qh8z4x1V;
	Fri,  2 Dec 2022 14:31:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1669951875;
	bh=dGmf72ncD/4NdOoAGiGfp2ldEHsmrOX7GeYxxIlw1iI=;
	h=Date:From:To:Cc:Subject:From;
	b=IqwSsQevBvTlcZghD8RrbvK/OS1wagK/DoQO2amlxJp9gve2/yirsqhJvflP01OMy
	 O+JRzcYLYc63mCysVf2ase6i7kAOk15Nn73eaedITQEohbVom+5XlHXx+fcPgMIq/w
	 jemmvGcw3801mcrgqjyv6aU27PvYQSWDEU28hZGWvbn0mB1pQJymPLXYNEx3STmHJC
	 pyYWKTW01v0zFiG6b94/nl0l61JYWlDcCMzHke7kcCQKN33YMs6dtTytyVKWNGBn41
	 tp9v7a1eO7g0AcRjqXF1OubW1kiqhMX/bNi8/cB9jc+PTfuQz6sMl5x1lbYxGFGky2
	 9AWg/asmYeY/Q==
Date: Fri, 2 Dec 2022 14:31:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: boot failure after merge of the powerpc tree
Message-ID: <20221202143110.0f00c3e5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BjbHU/pbGfn0Mh7nb5lWnVd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Christopher M. Riedl" <cmr@bluescreens.de>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/BjbHU/pbGfn0Mh7nb5lWnVd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging all the trees, today's linux-next qemu run (powerpc
pseries_le_defconfig with kvm) crashed like this:

Memory: 2029504K/2097152K available (14592K kernel code, 2944K rwdata, 1817=
6K rodata, 5120K init, 1468K bss, 67648K reserved, 0K cma-reserved)
SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D1, Nodes=3D1
BUG: Kernel NULL pointer dereference on read at 0x0000001c
Faulting instruction address: 0xc00000000047e9bc
Oops: Kernel access of bad area, sig: 7 [#1]
LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeries
Modules linked in:
CPU: 0 PID: 0 Comm: swapper Not tainted 6.1.0-rc7 #1
Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf0000=
05 of:SLOF,HEAD hv:linux,kvm pSeries
NIP:  c00000000047e9bc LR: c000000000e06718 CTR: c00000000047e970
REGS: c000000002773770 TRAP: 0300   Not tainted  (6.1.0-rc7)
MSR:  8000000002001033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 22004220  XER: 00000000
CFAR: c000000000070508 DAR: 000000000000001c DSISR: 00080000 IRQMASK: 3=20
GPR00: c000000000e06718 c000000002773a10 c00000000116fc00 0000000000000000=
=20
GPR04: 0000000000002900 0000000000002800 0000000000000000 0000000000000000=
=20
GPR08: 000000000000000e c0000000027afc00 0000000000000000 0000000000004000=
=20
GPR12: c00000000047e970 c000000002950000 0000000000000000 00000000013c8ff0=
=20
GPR16: 000000000000000d 0000000002be00d0 0000000000000001 00000000013c8e60=
=20
GPR20: 00000000013c8fa8 00000000013c8d90 c0000000027b2160 0000000000000000=
=20
GPR24: 0000000000000005 c0000000027b3568 c000000000e06718 0000000000002900=
=20
GPR28: 0000000000002900 0000000007fff33f 0000000000000000 c000000002773bc8=
=20
NIP [c00000000047e9bc] kmem_cache_alloc+0x5c/0x610
LR [c000000000e06718] mas_alloc_nodes+0xe8/0x350
Call Trace:
[c000000002773a10] [0040000000000000] 0x40000000000000 (unreliable)
[c000000002773a70] [c000000000e06718] mas_alloc_nodes+0xe8/0x350
[c000000002773ad0] [c000000000e0f7f4] mas_expected_entries+0x94/0x110
[c000000002773b10] [c00000000012cc44] dup_mmap+0x194/0x730
[c000000002773c80] [c00000000012d260] dup_mm+0x80/0x180
[c000000002773cc0] [c00000000008e7c0] text_area_cpu_up_mm+0x20/0x1a0
[c000000002773d20] [c00000000013367c] cpuhp_invoke_callback+0x15c/0x810
[c000000002773db0] [c0000000001348dc] cpuhp_issue_call+0x28c/0x2a0
[c000000002773e00] [c000000000134e44] __cpuhp_setup_state_cpuslocked+0x154/=
0x3e0
[c000000002773eb0] [c000000000135180] __cpuhp_setup_state+0xb0/0x1d0
[c000000002773f10] [c000000002016f9c] poking_init+0x40/0x9c
[c000000002773f30] [c00000000200434c] start_kernel+0x598/0x914
[c000000002773fe0] [c00000000000d990] start_here_common+0x1c/0x20
Code: fb81ffe0 7c9b2378 3b293968 fbc1fff0 f8010010 7c7e1b78 fba1ffe8 fbe1ff=
f8 91610008 f821ffa1 f8410018 83b90000 <83e3001c> 7fbd2038 7bbc0020 7f84e37=
8=20
---[ end trace 0000000000000000 ]---

Kernel panic - not syncing: Attempted to kill the idle task!

Reverting commits

  55a02e6ea958 ("powerpc/code-patching: Use temporary mm for Radix MMU")
  d0462ee02fdd ("powerpc/code-patching: Consolidate and cache per-cpu patch=
ing context")
(this second just because it follows the other and modifies the same file)

fixes the panic.  I have done that in linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/BjbHU/pbGfn0Mh7nb5lWnVd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmOJcX4ACgkQAVBC80lX
0GwWOwgAjqKajQf1EBA6Y9xvIrOMk/sU97LDyRymafQAqS80fWM650XoDOfaJR4v
PwvLMBEXnXJKqf3Flhr2GxDC0o6SuSRm2oK7/DnPovpyZgnxatLq4wfpGF3YWIlj
D9EfIgNXzt78xTMrDu2O9oFnso1m4WSzQa+FqMm0DFZNRCIkqLMOv3BPqn48ofD3
3rtrk5xuShrqxnHtdyUXBO/C9IB9dSHW6OLCECBipVUATQEjcDkavogDkNpIMeWk
bXO/CiZDphejKIP8W003wuVbHXwy5SkvxrLv86/xjQpTwKM81vuIfZPNJ+XjagJ0
+SA9Dd10CDQLrPgsNnA4RO9XLE6eyQ==
=NakJ
-----END PGP SIGNATURE-----

--Sig_/BjbHU/pbGfn0Mh7nb5lWnVd--
