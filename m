Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 031B88B046E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 10:35:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=cYK4eWIl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VPXPb4zQtz3cWR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 18:35:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=cYK4eWIl;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VPXNq6t87z2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 18:35:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1713947706;
	bh=8StTTalxlnMb1zc1cqHQoff1rypJp3VvX0Tzv0JqIXw=;
	h=Date:From:To:Cc:Subject:From;
	b=cYK4eWIlLLM9KQwaKQkBu45/9UIlJvqtfBuFfJg8qRgdVlCDm5r5O6OXisC7TsnKt
	 ah3kBN0tOxdmnHtpbi37HRv+J2H7K9KxgpvOaKM1WtXH0PIuZ9j/lK4zCKPnvVyuHM
	 VmPAVWnNhtncbGltM/MynwQ1/8mG3EvTJZhVJs17gRR0EaK7J1NI0CrBVIBi3NDZnv
	 MaXT5/U9xgGqqxy6y4X4SaR30lTrxUUaQmpyVBsaLbqnN/chNDWtcZ42uvaBxHUDNW
	 abyNht02KppioZKlWQJ/EJHpq2lPhLAiwl727bh0Ajd49t2J906ImmFW8pNxXmXCJJ
	 kgfyyJ33oJVsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VPXNp2hMwz4wcC;
	Wed, 24 Apr 2024 18:35:06 +1000 (AEST)
Date: Wed, 24 Apr 2024 18:35:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: linux-next: boot failure after merge of the modules tree
Message-ID: <20240424183503.2a6ce847@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.efID6=zWrPD=ivTQPrCikc";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/.efID6=zWrPD=ivTQPrCikc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the modules tree, today's linux-next boot (powerpc
pseries_le_defconfig) failed like this:

BUG: Kernel NULL pointer dereference at 0x00000030
Faulting instruction address: 0xc00000000057a4ec
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc5-08179-ga5ea707d10dc #1
Hardware name: IBM pSeries (emulated by qemu) POWER8 (raw) 0x4d0200 0xf0000=
04 of:SLOF,HEAD pSeries
NIP:  c00000000057a4ec LR: c0000000002cd32c CTR: c0000000002cd304
REGS: c000000004997700 TRAP: 0380   Not tainted  (6.9.0-rc5-08179-ga5ea707d=
10dc)
MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 84002484  XER: 20000=
000
CFAR: c0000000002cd328 IRQMASK: 0=20
GPR00: c0000000002cd32c c0000000049979a0 c00000000163a500 0000000000010000=
=20
GPR04: 0000000000010000 0000000000004000 0000000000000000 0000000000002cc0=
=20
GPR08: 0000000000000030 0000000000000100 ffffffffffffffff 0000000000002000=
=20
GPR12: c0000000002cd304 c000000002b70000 c00000000001111c 0000000000000000=
=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR24: 0000000000000000 0000000000000000 c000000002aa0940 c0000000026c0a40=
=20
GPR28: 0000000000010000 c0000000002cd32c 0000000000000030 c0000000027d0f78=
=20
NIP [c00000000057a4ec] execmem_alloc+0x5c/0x12c
LR [c0000000002cd32c] alloc_insn_page+0x28/0x70
Call Trace:
[c000000004997a40] [c0000000002cd32c] alloc_insn_page+0x28/0x70
[c000000004997a60] [c0000000002d07a4] __get_insn_slot+0x1cc/0x29c
[c000000004997aa0] [c00000000005c434] arch_prepare_kprobe+0xbc/0x31c
[c000000004997b20] [c0000000002d1b40] register_kprobe+0x54c/0x878
[c000000004997b90] [c000000002018828] arch_init_kprobes+0x28/0x40
[c000000004997bb0] [c00000000204b33c] init_kprobes+0x138/0x218
[c000000004997c30] [c000000000010da8] do_one_initcall+0x80/0x2f8
[c000000004997d00] [c000000002005aa8] kernel_init_freeable+0x1f8/0x520
[c000000004997de0] [c000000000011148] kernel_init+0x34/0x26c
[c000000004997e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
--- interrupt: 0 at 0x0
Code: fbe1fff8 3940ffff 38e02cc0 7c9c2378 7fa802a6 e8c91e48 f8010010 fb41ff=
d0 39200100 fb61ffd8 f821ff61 7fc64214 <7ca6402a> eb5e0020 837e0028 e8de000=
8=20
---[ end trace 0000000000000000 ]---

note: swapper/0[1] exited with irqs disabled
Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b

Bisected to commit

  18da532eefc8 ("mm/execmem, arch: convert remaining overrides of module_al=
loc to execmem")

I have used the modules tree from next-20240423 for today.

This is a qemu boot test using:

qemu-system-ppc64 -M pseries -cpu POWER8 -m 2G -vga none -nographic -kernel=
 ~/next/powerpc_pseries_le_defconfig/vmlinux -initrd ./ppc64le-rootfs.cpio.=
gz

--=20
Cheers,
Stephen Rothwell

--Sig_/.efID6=zWrPD=ivTQPrCikc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYoxDcACgkQAVBC80lX
0GzQcwf/U40DU/cscWGcfGCeC2vL0Xp+EnBRAoPvjcF86HoyYNI5yNGHDkOXWwTz
0E76CpgC7w+XmHqLxZx+jz+eiZnB1u0AP8GtYJb2wOB4ZdkTdH7BZUDYfJ6AgtiJ
rapL1zQmyNr+T8vU1M2pPlz9t645s72o11jJgD04dPh+em8sb7kbNLy49kGcUTMI
sNI6+yOhjT9SX6Zg37+wt8QnV0NHY6ihGO2og2nofmxE/tW/W8s2qiT16/rIAQco
/813SuBm1ekdSQT1/fD3+mqJwk7C58tRkaOzbEe36z9uJaPNJJs4xD4UAeEuROqn
EQgitQ3uM2+A8MWfypdyKqIsm3sG/w==
=UlUt
-----END PGP SIGNATURE-----

--Sig_/.efID6=zWrPD=ivTQPrCikc--
