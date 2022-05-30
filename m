Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 349345375B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 09:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBS861H7Bz3bnF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 17:43:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBS7f1X8xz302N
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 17:43:07 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nva2d-0006ni-4F; Mon, 30 May 2022 09:42:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nva2W-005PS2-BU; Mon, 30 May 2022 09:42:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nva2T-00D2mA-SD; Mon, 30 May 2022 09:42:09 +0200
Date: Mon, 30 May 2022 09:42:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Li Zhengyu <lizhengyu3@huawei.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH] RISC-V: Prepare dropping week attribute from
 arch_kexec_apply_relocations[_add]
Message-ID: <20220530074202.pydmbbgvbtaugw5j@pengutronix.de>
References: <20220519091237.676736-1-naveen.n.rao@linux.vnet.ibm.com>
 <20220529065637.xgapqjp2342flbuj@pengutronix.de>
 <264786d9-7756-19e0-2742-8b8d17f5ace5@csgroup.eu>
 <20220529140655.bnd4fgggccrorj4t@pengutronix.de>
 <59e8faec-05fd-805d-7de0-4b0508f8467f@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="izltdsmj2dkmzuym"
Content-Disposition: inline
In-Reply-To: <59e8faec-05fd-805d-7de0-4b0508f8467f@huawei.com>
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
Cc: wangkefeng.wang@huawei.com, guoren@linux.alibaba.com, sunnanyong@huawei.com, Palmer Dabbelt <palmer@rivosinc.com>, jszhang@kernel.org, mick@ics.forth.gr, linux-riscv@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, alex@ghiti.fr, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Li Zhengyu <lizhengyu3@huawei.com>, aou@eecs.berkeley.edu, "liaochang \(A\)" <liaochang1@huawei.com>, paul.walmsley@sifive.com, bjorn.topel@gmail.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, penberg@kernel.org, Eric Biederman <ebiederm@xmission.com>, kernel@pengutronix.de, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--izltdsmj2dkmzuym
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Without this change arch/riscv/kernel/elf_kexec.c fails to compile once
commit 233c1e6c319c ("kexec_file: drop weak attribute from
arch_kexec_apply_relocations[_add]") is also contained in the tree.
This currently happens in next-20220527.

Prepare the RISC-V similar to the s390 adaption done in 233c1e6c319c.
This is safe to do on top of the riscv change even without the change to
arch_kexec_apply_relocations.

Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
Looks-good-to: liaochang (A) <liaochang1@huawei.com>
Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
---

On Mon, May 30, 2022 at 09:43:26AM +0800, liaochang (A) wrote:
> > I can confirm that doing
> >=20
> > diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/ke=
xec.h
> > index 206217b23301..eee260e8ab30 100644
> > --- a/arch/riscv/include/asm/kexec.h
> > +++ b/arch/riscv/include/asm/kexec.h
> > @@ -55,6 +55,13 @@ extern riscv_kexec_method riscv_kexec_norelocate;
> > =20
> >  #ifdef CONFIG_KEXEC_FILE
> >  extern const struct kexec_file_ops elf_kexec_ops;
> > +
> > +struct purgatory_info;
> > +int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
> > +				     Elf_Shdr *section,
> > +				     const Elf_Shdr *relsec,
> > +				     const Elf_Shdr *symtab);
> > +#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_=
add
> >  #endif
> > =20
> >  #endif
>=20
> LGTM, you could send a fixup patch to riscv, thanks.
>=20
> >=20
> > on top of 838b3e28488f results in a compilable tree. And when merging
> > 233c1e6c319c into this, it is still building.
> >=20
> > I'm not enough into kexec (and riscv) to judge if this is sensible, or
> > create a useful commit log but the obvious way forward is to apply the
> > above patch to the riscv tree before it hits Linus' tree.

Ok, here comes a patch with a generic commit log.=20

@riscv people: If you prefer, squash it into 838b3e28488f.

Best regards
Uwe

 arch/riscv/include/asm/kexec.h | 7 +++++++
 1 file changed, 7 insertions(+)

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

base-commit: 838b3e28488f702e2b5477b393f009b2639d2b1a
--=20
2.36.1

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--izltdsmj2dkmzuym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKUdUEACgkQwfwUeK3K
7AnmPQf+IN+rB4o/lVwe+g3nQDfd/LaYheXdhsHmaXF/6uNO5ya9wxPbn66pESxt
l1koX5LbpqE0geRqIuHtWqxOxsRfhTp7TYNB0KRBuMKPMikGZ8zsd2halcf8DVzc
TYf7Iz1T49mUZCAOnzUozlX6DLLFWP1CrelQWBePufBtYUzqdFjNRXmoxMuRSUQP
rJnOFN8EWAokXC8ZCtmqHr/rGZka6+BVpxN7QGPBv2uxrRfEUfh7+JGw72f8BImg
KzYA7hXaR42x+gv+ilqDTe4h7MNy/6tmUzqToba0hIeG4WNCIhzqG+mBp4iBO3n2
yEwq9TSpGdW4uIr0YDQx9mp6hz4jwA==
=CgD8
-----END PGP SIGNATURE-----

--izltdsmj2dkmzuym--
