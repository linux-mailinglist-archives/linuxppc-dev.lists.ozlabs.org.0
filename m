Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE32537141
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 16:07:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LB0jy4F3fz2ysv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 00:07:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LB0jV3K8Bz2ymf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 00:07:24 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nvJZU-0006Ii-Jf; Sun, 29 May 2022 16:07:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nvJZO-005H9k-2S; Sun, 29 May 2022 16:07:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nvJZL-00Ct7w-OW; Sun, 29 May 2022 16:06:59 +0200
Date: Sun, 29 May 2022 16:06:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
Message-ID: <20220529140655.bnd4fgggccrorj4t@pengutronix.de>
References: <20220519091237.676736-1-naveen.n.rao@linux.vnet.ibm.com>
 <20220529065637.xgapqjp2342flbuj@pengutronix.de>
 <264786d9-7756-19e0-2742-8b8d17f5ace5@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qvv5wvvttflg77jh"
Content-Disposition: inline
In-Reply-To: <264786d9-7756-19e0-2742-8b8d17f5ace5@csgroup.eu>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Eric Biederman <ebiederm@xmission.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Li Zhengyu <lizhengyu3@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--qvv5wvvttflg77jh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, May 29, 2022 at 09:46:47AM +0000, Christophe Leroy wrote:
> Le 29/05/2022 =C3=A0 08:56, Uwe Kleine-K=C3=B6nig a =C3=A9crit=C2=A0:
> > Hello,
> >=20
> > on current linux-next ARCH=3Driscv allmodconfig breaks with:
> >=20
> >    CC      arch/riscv/kernel/elf_kexec.o
> > arch/riscv/kernel/elf_kexec.c:345:5: error: redefinition of =E2=80=98ar=
ch_kexec_apply_relocations_add=E2=80=99
> >    345 | int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
> >        |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > In file included from arch/riscv/kernel/elf_kexec.c:16:
> > include/linux/kexec.h:236:1: note: previous definition of =E2=80=98arch=
_kexec_apply_relocations_add=E2=80=99 with type =E2=80=98int(struct purgato=
ry_info *, Elf64_Shdr *, const Elf64_Shdr *, const Elf64_Shdr *)=E2=80=99 {=
aka =E2=80=98int(struct purgatory_info *, struct elf64_shdr *, const struct=
 elf64_shdr *, const struct elf64_shdr *)=E2=80=99}
> >    236 | arch_kexec_apply_relocations_add(struct purgatory_info *pi, El=
f_Shdr *section,
> >        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >=20
> > (I think) because there is a conflict between the two commits:
> >=20
> > 233c1e6c319c kexec_file: drop weak attribute from arch_kexec_apply_relo=
cations[_add]
> > 838b3e28488f RISC-V: Load purgatory in kexec_file
> >=20
> > And so next is broken starting from
> > 164a9037b1d33f28ba27671c16ec1c23d4a11acf which merges the riscv tree.
> >=20
>=20
> In arch/riscv/include/asm/kexec.h, do the same as s390 did in commit=20
> 233c1e6c319c:
>=20
> diff --git a/arch/s390/include/asm/kexec.h b/arch/s390/include/asm/kexec.h
> index 7f3c9ac34bd8..540dd469b088 100644
> --- a/arch/s390/include/asm/kexec.h
> +++ b/arch/s390/include/asm/kexec.h
> @@ -83,4 +83,12 @@ struct kimage_arch {
>   extern const struct kexec_file_ops s390_kexec_image_ops;
>   extern const struct kexec_file_ops s390_kexec_elf_ops;
>=20
> +#ifdef CONFIG_KEXEC_FILE
> +struct purgatory_info;
> +int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
> +				     Elf_Shdr *section,
> +				     const Elf_Shdr *relsec,
> +				     const Elf_Shdr *symtab);
> +#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_add
> +#endif
>   #endif /*_S390_KEXEC_H */

I can confirm that doing

diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
index 206217b23301..eee260e8ab30 100644
--- a/arch/riscv/include/asm/kexec.h
+++ b/arch/riscv/include/asm/kexec.h
@@ -55,6 +55,13 @@ extern riscv_kexec_method riscv_kexec_norelocate;
=20
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops elf_kexec_ops;
+
+struct purgatory_info;
+int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
+				     Elf_Shdr *section,
+				     const Elf_Shdr *relsec,
+				     const Elf_Shdr *symtab);
+#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_add
 #endif
=20
 #endif

on top of 838b3e28488f results in a compilable tree. And when merging
233c1e6c319c into this, it is still building.

I'm not enough into kexec (and riscv) to judge if this is sensible, or
create a useful commit log but the obvious way forward is to apply the
above patch to the riscv tree before it hits Linus' tree.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qvv5wvvttflg77jh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKTffwACgkQwfwUeK3K
7Ak9FQf/SQrMKKxpQ8gVUDFht3yFkQLOJJe/adkmkFoMpxOZklvcq5hSdJP2Y1NL
I3Y35bb9SR1VPi6fFHHGuBqB0BiK9mKo1KLb9ZY7/7udpfI1e6tPW4ea2QuscqZt
i7IQb1Gff1YzWYfW7/Y8ZugIJTDFvuTiHTFxrOlwiQVkQnywWACEMsCBjb0Aj9XE
9yKOSWeqmnvhvS2+2U9v8FWLJOPTSaeQ3hSjJ3xXjEkoJz3L0pHcnqyIz8UAmQhl
DRO6UpPbq6hLtMkKF8AmIFLstoEaEt636vw7pl+9MrM3zJX7DMYiIpwGZ/431+YB
6ERUkRrVesGri6hOFffuYrCwXZHfdw==
=Cu9X
-----END PGP SIGNATURE-----

--qvv5wvvttflg77jh--
