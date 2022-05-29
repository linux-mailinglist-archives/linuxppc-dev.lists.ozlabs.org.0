Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB2B537018
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 08:57:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9q9t1K8Jz3blk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 16:57:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9q9Q3X5Vz2yny
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 May 2022 16:57:28 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nvCrD-0001Nl-TF; Sun, 29 May 2022 08:56:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nvCr5-005D0y-Nd; Sun, 29 May 2022 08:56:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nvCr3-00Cp8z-H3; Sun, 29 May 2022 08:56:49 +0200
Date: Sun, 29 May 2022 08:56:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v2] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
Message-ID: <20220529065637.xgapqjp2342flbuj@pengutronix.de>
References: <20220519091237.676736-1-naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kx2r5dh4j5uektvu"
Content-Disposition: inline
In-Reply-To: <20220519091237.676736-1-naveen.n.rao@linux.vnet.ibm.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, kernel@pengutronix.de, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--kx2r5dh4j5uektvu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

on current linux-next ARCH=3Driscv allmodconfig breaks with:

  CC      arch/riscv/kernel/elf_kexec.o
arch/riscv/kernel/elf_kexec.c:345:5: error: redefinition of =E2=80=98arch_k=
exec_apply_relocations_add=E2=80=99
  345 | int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from arch/riscv/kernel/elf_kexec.c:16:
include/linux/kexec.h:236:1: note: previous definition of =E2=80=98arch_kex=
ec_apply_relocations_add=E2=80=99 with type =E2=80=98int(struct purgatory_i=
nfo *, Elf64_Shdr *, const Elf64_Shdr *, const Elf64_Shdr *)=E2=80=99 {aka =
=E2=80=98int(struct purgatory_info *, struct elf64_shdr *, const struct elf=
64_shdr *, const struct elf64_shdr *)=E2=80=99}
  236 | arch_kexec_apply_relocations_add(struct purgatory_info *pi, Elf_Shd=
r *section,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(I think) because there is a conflict between the two commits:

233c1e6c319c kexec_file: drop weak attribute from arch_kexec_apply_relocati=
ons[_add]
838b3e28488f RISC-V: Load purgatory in kexec_file

And so next is broken starting from
164a9037b1d33f28ba27671c16ec1c23d4a11acf which merges the riscv tree.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kx2r5dh4j5uektvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKTGRsACgkQwfwUeK3K
7AmDxAf9Ggb6UqEX3OJcHfUAj6XII7Pgm7ANdk/sgjvS9u4KABETUJ4Dub8m44b7
YzTKjAz6Aoat5x0aX/BoeMEGOLKrO10yBqljertv1U3F28A0fvUejuJJoBHnmQHO
A2rACjr5HuulnTTeF3vSwtxdKVzyR5bT4ys1ELO0drRWIdeds63oFpM3vg/7Dhkm
6DGR26o5+bBCUsDlpnNlSTy4bqMaXAtqnImET8yrafbTbDhSXbwO57dOlfT0QmTC
p2LoUfw5d64itPHNimGmnAJxtoJEET/gGLFzTbZIJk84CEydkc+3/2DyFU3rwHTZ
DBh5qrnvrwgxqtYd5zu0HPAfvgDQMA==
=tj8R
-----END PGP SIGNATURE-----

--kx2r5dh4j5uektvu--
