Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D7E5387D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 21:43:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBm6N5Qj4z3bkS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 05:43:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBm5x2bN2z308y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 05:42:43 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nvlGn-0004LO-Ul; Mon, 30 May 2022 21:41:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nvlGh-005Vep-Cd; Mon, 30 May 2022 21:41:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nvlGf-00D9uL-Eh; Mon, 30 May 2022 21:41:33 +0200
Date: Mon, 30 May 2022 21:41:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Prepare dropping week attribute from
 arch_kexec_apply_relocations[_add]
Message-ID: <20220530194133.udwdjsb2l33hsiil@pengutronix.de>
References: <20220530074202.pydmbbgvbtaugw5j@pengutronix.de>
 <mhng-5872aea0-6f64-4685-8f8d-fdeb42e4c972@palmer-mbp2014>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="krrdaxdkw2concro"
Content-Disposition: inline
In-Reply-To: <mhng-5872aea0-6f64-4685-8f8d-fdeb42e4c972@palmer-mbp2014>
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
Cc: wangkefeng.wang@huawei.com, guoren@linux.alibaba.com, sunnanyong@huawei.com, jszhang@kernel.org, mick@ics.forth.gr, linux-riscv@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, alex@ghiti.fr, naveen.n.rao@linux.vnet.ibm.com, lizhengyu3@huawei.com, aou@eecs.berkeley.edu, liaochang1@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Topel <bjorn.topel@gmail.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, penberg@kernel.org, ebiederm@xmission.com, kernel@pengutronix.de, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--krrdaxdkw2concro
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, May 30, 2022 at 11:58:16AM -0700, Palmer Dabbelt wrote:
> On Mon, 30 May 2022 00:42:02 PDT (-0700), u.kleine-koenig@pengutronix.de =
wrote:
> > Without this change arch/riscv/kernel/elf_kexec.c fails to compile once
> > commit 233c1e6c319c ("kexec_file: drop weak attribute from
> > arch_kexec_apply_relocations[_add]") is also contained in the tree.
> > This currently happens in next-20220527.
> >=20
> > Prepare the RISC-V similar to the s390 adaption done in 233c1e6c319c.
> > This is safe to do on top of the riscv change even without the change to
> > arch_kexec_apply_relocations.
> >=20
> > Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
> > Looks-good-to: liaochang (A) <liaochang1@huawei.com>
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >=20
> > On Mon, May 30, 2022 at 09:43:26AM +0800, liaochang (A) wrote:
> > > > I can confirm that doing
> > > > > diff --git a/arch/riscv/include/asm/kexec.h
> > > b/arch/riscv/include/asm/kexec.h
> > > > index 206217b23301..eee260e8ab30 100644
> > > > --- a/arch/riscv/include/asm/kexec.h
> > > > +++ b/arch/riscv/include/asm/kexec.h
> > > > @@ -55,6 +55,13 @@ extern riscv_kexec_method riscv_kexec_norelocate;
> > > >  >  #ifdef CONFIG_KEXEC_FILE
> > > >  extern const struct kexec_file_ops elf_kexec_ops;
> > > > +
> > > > +struct purgatory_info;
> > > > +int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
> > > > +				     Elf_Shdr *section,
> > > > +				     const Elf_Shdr *relsec,
> > > > +				     const Elf_Shdr *symtab);
> > > > +#define arch_kexec_apply_relocations_add arch_kexec_apply_relocati=
ons_add
> > > >  #endif
> > > >  >  #endif
> > >=20
> > > LGTM, you could send a fixup patch to riscv, thanks.
> > >=20
> > > > > on top of 838b3e28488f results in a compilable tree. And when
> > > merging
> > > > 233c1e6c319c into this, it is still building.
> > > > > I'm not enough into kexec (and riscv) to judge if this is
> > > sensible, or
> > > > create a useful commit log but the obvious way forward is to apply =
the
> > > > above patch to the riscv tree before it hits Linus' tree.
> >=20
> > Ok, here comes a patch with a generic commit log.
> >=20
> > @riscv people: If you prefer, squash it into 838b3e28488f.
>=20
> Sorry, just saw this after I sent my version of the fix.  They're the sam=
e,
> but do you mind sending a full-on patch so I can merge it?

Sorry, I don't understand your request. I found
https://lore.kernel.org/linux-riscv/20220530180408.16239-1-palmer@rivosinc.=
com/

but I don't know what a full-on patch is and what stops you merging my
patch.=20

Is it that it's in reply to a patch series and b4 fails to fetch the
right patch and you ask to send it in a new thread?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--krrdaxdkw2concro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKVHeoACgkQwfwUeK3K
7AmIjAf/cIdZXzTm8ALuTDgUrKH3cNzpFjQ944mYn/qfLoGkdCnQlYzghw570rDo
0QKgHNkqRQQ7lgaXGnex5HizEMdc+++QESut+gBcrV92K33EZU3XSXUp+75SE+Jz
DjRnmCm4xkh/9zZysNW0OXLnjd4AtGMlbzXYFKsKKxtaGgd7+f06D3cTzoVOfLbL
i0DPa56ftXEmEYl6WpqIg1gb9gQMQx7E9vsscEgoOX6u9AlinTk/cxkDA6lhMNEj
03qeCXcYyUQtszhTYw3jo8cLqM1KGLVU3i9Blj0mAIQ8DVaXUd3hWx3AFqjeA55K
bErpEBzedIdALZNq1g3XX9JHLEMP7Q==
=qw7s
-----END PGP SIGNATURE-----

--krrdaxdkw2concro--
