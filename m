Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A0731F105
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 21:32:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhRG71vxvz3cK6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 07:32:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=BT0oUzaN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=BT0oUzaN; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhRFg5mCMz30Km
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 07:31:50 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DhRFc2P3Hz9sBJ;
 Fri, 19 Feb 2021 07:31:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1613680309;
 bh=T7NkwprmT9RkSXY9BhJPx5gnQ8fIAkwLW7VbvdNNmmA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BT0oUzaN2r8Yj0e49LDCpG6EcpLktyqFC54wiM/aOPBihxmLTgU9VgLtMC+Z6H10+
 RlWOVfBVc6g+kR2W1MJHyY9jvPYE/hrJtiwIDWUTeOOMeJ9tFWMgoNbxyxu/sW+sZI
 /LewTN6KD05w0leCLiw51BneD3JvXcvZuCGU6ElyVVhJmlsLrCGoYwdPRgIo35N1KP
 aJH6zPs53NYmXAuxfQwis3Q4LEvgmmyYFomp3kZnSFr0g0/qGHdv1Ib0HuqeqxMiz6
 JzVcVGHbxz9JxBRiplITV0D1vrGMtD902R4UTgIPC4oALK6rSM8q7h63uxfimleZnC
 urX+xyvd3O8xQ==
Date: Fri, 19 Feb 2021 07:31:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robherring2@gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 powerpc tree
Message-ID: <20210219073147.478c3dda@canb.auug.org.au>
In-Reply-To: <CAL_JsqJ9Ske4hkWn3uo8-nef29MQ1DkNdtE=gxbqj8CKrtQorg@mail.gmail.com>
References: <20210218144815.5673ae6f@canb.auug.org.au>
 <874ki9vene.fsf@mpe.ellerman.id.au>
 <20210218223427.77109d83@canb.auug.org.au>
 <CAL_JsqJ9Ske4hkWn3uo8-nef29MQ1DkNdtE=gxbqj8CKrtQorg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VL/IDpRzhxGm.r6/d2BAaVo";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/VL/IDpRzhxGm.r6/d2BAaVo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 18 Feb 2021 07:52:52 -0600 Rob Herring <robherring2@gmail.com> wrot=
e:
>
> On Thu, Feb 18, 2021 at 5:34 AM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > On Thu, 18 Feb 2021 21:44:37 +1100 Michael Ellerman <mpe@ellerman.id.au=
> wrote: =20
> > >
> > > I think it just needs this?
> > >
> > > diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> > > index 87e34611f93d..0492ca6003f3 100644
> > > --- a/arch/powerpc/kexec/elf_64.c
> > > +++ b/arch/powerpc/kexec/elf_64.c
> > > @@ -104,7 +104,7 @@ static void *elf64_load(struct kimage *image, cha=
r *kernel_buf,
> > >
> > >       fdt =3D of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
> > >                                          initrd_len, cmdline,
> > > -                                        fdt_totalsize(initial_boot_p=
arams));
> > > +                                        kexec_fdt_totalsize_ppc64(im=
age));
> > >       if (!fdt) {
> > >               pr_err("Error setting up the new device tree.\n");
> > >               ret =3D -EINVAL;
> > > =20
> >
> > I thought about that, but the last argument to
> > of_kexec_alloc_and_setup_fdt() is extra_fdt_size and the allocation
> > done is for this:
> >
> > fdt_size =3D fdt_totalsize(initial_boot_params) +
> >                    (cmdline ? strlen(cmdline) : 0) +
> >                    FDT_EXTRA_SPACE +
> >                    extra_fdt_size;
> >
> > and kexec_fdt_totalsize_ppc64() also includes
> > fdt_totalsize(initial_boot_params) so I was not sure.  Maybe
> > kexec_fdt_totalsize_ppc64() needs modification as well? =20
>=20
> You're both right. Michael's fix is sufficient for the merge. The only
> risk with a larger size is failing to allocate it, but we're talking
> only 10s of KB. Historically until the commit causing the conflict,
> PPC was just used 2x fdt_totalsize(initial_boot_params). You could
> drop 'fdt_size =3D fdt_totalsize(initial_boot_params) + (2 *
> COMMAND_LINE_SIZE);' from kexec_fdt_totalsize_ppc64() as well, but
> then the function name is misleading.
>=20
> Lakshmi can send a follow-up patch to fine tune the size and rename
> kexec_fdt_totalsize_ppc64.

OK, I have mode Michael's suggested change to my resolution from today.

--=20
Cheers,
Stephen Rothwell

--Sig_/VL/IDpRzhxGm.r6/d2BAaVo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAuzrMACgkQAVBC80lX
0Gz/sQf2Oa4cPoAqWhSG0uktD7yrbzN7VOp5Au+0oPJY/sO/e33kIOdNrY+6VoRT
QlPVZRxA0R8HaFBTND8hnBSyorOuvzATF5W6NQQ1v8x9i1iojZ1wil+F8SJS7b5g
ODlcpHsqeqk1wygkRAyZJENGeh3tClpYdZlGushVYfDO4gUD8BFsr0aILVk7HPH1
xN2NKv0/aH8JjqlLSElJWQwozmHiEKlgizR3whi9jGHe52dFhPVt/4JKzwvTpT/U
dnydBS5ao8FGtCXAegqHcXzEJd27bX229zUdwmOcA5miLURBcrYIfP93QnMjy4TN
EXoFPaY8KweEJhquoypTwAbkCl6B
=/1tk
-----END PGP SIGNATURE-----

--Sig_/VL/IDpRzhxGm.r6/d2BAaVo--
