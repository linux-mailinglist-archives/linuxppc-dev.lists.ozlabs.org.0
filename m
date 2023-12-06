Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FF68075DB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 17:55:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GOpN4SXl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Slk6q4SRWz3d8K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 03:55:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GOpN4SXl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Slk5x6LYXz3cBH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 03:54:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 507D5B82344;
	Wed,  6 Dec 2023 16:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41949C433C8;
	Wed,  6 Dec 2023 16:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701881678;
	bh=byr4iKaQR/A3UJDoHCSCnyLKNyvGROhGH9e9jyC+wMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GOpN4SXlw4x1/dU2POw/8AZkN/KGJd1O1nz5pL5dskKSKJuW+ZT8zMtbhgRJuLxRp
	 9tpDoll5pRy+N/0iHjDuF+k+KzzEpsLOXICrRKSn0xTjh/1ZGckb89gSpNbIwPizM/
	 vZpyk6fnK1fif1hnU78PLVrz2Up6ryXzxPUl1dNMLbRanVrO5moPnoG0aFMzRj5zQ2
	 XBl6De2XRcwqo1CGILZgoXJGSio6m7JmCma7pEtAq8tZv8oBHFECGEYSptAS7fD5TQ
	 vOPefdItLrHoSasbsVzn1PyYg8twu81qh+HpQHdq548aZWh45HsMqPltXGZylalJN5
	 6yy+KqyoBcFaQ==
Date: Wed, 6 Dec 2023 16:54:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v3 5/7] kexec_file, ricv: print out debugging message if
 required
Message-ID: <20231206-pasta-embassy-c7250740b16c@spud>
References: <20231130023955.5257-1-bhe@redhat.com>
 <20231130023955.5257-6-bhe@redhat.com>
 <20231201-blog-blasphemy-985d2665903c@wendy>
 <ZW3yXWJ7rTrtZzyg@MiWiFi-R3L-srv>
 <20231204-liftoff-enclosure-d3e3daf0ab6e@spud>
 <ZXCVUD9cCYEShrrj@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+ZoXCPpIBvMNs/9S"
Content-Disposition: inline
In-Reply-To: <ZXCVUD9cCYEShrrj@MiWiFi-R3L-srv>
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, nathan@kernel.org, Conor Dooley <conor.dooley@microchip.com>, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--+ZoXCPpIBvMNs/9S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 11:37:52PM +0800, Baoquan He wrote:
> On 12/04/23 at 04:14pm, Conor Dooley wrote:
> > On Mon, Dec 04, 2023 at 11:38:05PM +0800, Baoquan He wrote:
> > > On 12/01/23 at 10:38am, Conor Dooley wrote:
> > > > On Thu, Nov 30, 2023 at 10:39:53AM +0800, Baoquan He wrote:
> > > >=20
> > > > $subject has a typo in the arch bit :)
> > >=20
> > > Indeed, will fix if need report. Thanks for careful checking.
> > >=20
> > > >=20
> > > > > Replace pr_debug() with the newly added kexec_dprintk() in kexec_=
file
> > > > > loading related codes.
> > > >=20
> > > > Commit messages should be understandable in isolation, but this only
> > > > explains (part of) what is obvious in the diff. Why is this change
> > > > being made?
> > >=20
> > > The purpose has been detailedly described in cover letter and patch 1
> > > log. Andrew has picked these patches into his tree and grabbed the co=
ver
> > > letter log into the relevant commit for people's later checking. All
> > > these seven patches will be present in mainline together. This is com=
mon
> > > way when posting patch series? Please let me know if I misunderstand
> > > anything.
> >=20
> > Each patch having a commit message that explains why a change is being
> > made is the expectation. It is especially useful to explain the why
> > here, since it is not just a mechanical conversion of pr_debug()s as the
> > commit message suggests.
>=20
> Sounds reasonable. I rephrase the patch 3 log as below, do you think
> it's OK to you?

Yes, but with one comment.

>=20
> I will also adjust patch logs on other ARCH once this one is done.
> Thanks.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> Subject: [PATCH v3 5/7] kexec_file, ricv: print out debugging message if =
required
>=20
> Then when specifying '-d' for kexec_file_load interface, loaded
> locations of kernel/initrd/cmdline etc can be printed out to help debug.
>=20
> Here replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> loading related codes.
>=20

> And also replace pr_notice() with kexec_dprintk() in elf_kexec_load()
> because it's make sense to always print out loaded location of purgatory
> and device tree even though users don't expect the message.

This seems to contradict what you said in your earlier mail, about
moving these from notice to debug. I think you missed a negation in your
new version of the commit message. What you said in response to me seems
like a more complete explanation anyway:
	always printing out the loaded location of purgatory and
	device tree doesn't make sense. It will be confusing when users
	see these even when they do normal kexec/kdump loading.

Thanks,
Conor.

> And also remove kexec_image_info() because the content has been printed
> out in generic code.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
> >=20
> > > >=20
> > > > >=20
> > > > > And also remove kexec_image_info() because the content has been p=
rinted
> > > > > out in generic code.
> > > > >=20
> > > > > Signed-off-by: Baoquan He <bhe@redhat.com>
> > > > > ---
> > > > >  arch/riscv/kernel/elf_kexec.c     | 11 ++++++-----
> > > > >  arch/riscv/kernel/machine_kexec.c | 26 --------------------------
> > > > >  2 files changed, 6 insertions(+), 31 deletions(-)
> > > > >=20
> > > > > diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/el=
f_kexec.c
> > > > > index e60fbd8660c4..5bd1ec3341fe 100644
> > > > > --- a/arch/riscv/kernel/elf_kexec.c
> > > > > +++ b/arch/riscv/kernel/elf_kexec.c
> > > > > @@ -216,7 +216,6 @@ static void *elf_kexec_load(struct kimage *im=
age, char *kernel_buf,
> > > > >  	if (ret)
> > > > >  		goto out;
> > > > >  	kernel_start =3D image->start;
> > > > > -	pr_notice("The entry point of kernel at 0x%lx\n", image->start);
> > > > > =20
> > > > >  	/* Add the kernel binary to the image */
> > > > >  	ret =3D riscv_kexec_elf_load(image, &ehdr, &elf_info,
> > > > > @@ -252,8 +251,8 @@ static void *elf_kexec_load(struct kimage *im=
age, char *kernel_buf,
> > > > >  		image->elf_load_addr =3D kbuf.mem;
> > > > >  		image->elf_headers_sz =3D headers_sz;
> > > > > =20
> > > > > -		pr_debug("Loaded elf core header at 0x%lx bufsz=3D0x%lx memsz=
=3D0x%lx\n",
> > > > > -			 image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
> > > > > +		kexec_dprintk("Loaded elf core header at 0x%lx bufsz=3D0x%lx m=
emsz=3D0x%lx\n",
> > > > > +			      image->elf_load_addr, kbuf.bufsz, kbuf.memsz);
> > > > > =20
> > > > >  		/* Setup cmdline for kdump kernel case */
> > > > >  		modified_cmdline =3D setup_kdump_cmdline(image, cmdline,
> > > > > @@ -275,6 +274,8 @@ static void *elf_kexec_load(struct kimage *im=
age, char *kernel_buf,
> > > > >  		pr_err("Error loading purgatory ret=3D%d\n", ret);
> > > > >  		goto out;
> > > > >  	}
> > > > > +	kexec_dprintk("Loaded purgatory at 0x%lx\n", kbuf.mem);
> > > > > +
> > > > >  	ret =3D kexec_purgatory_get_set_symbol(image, "riscv_kernel_ent=
ry",
> > > > >  					     &kernel_start,
> > > > >  					     sizeof(kernel_start), 0);
> > > > > @@ -293,7 +294,7 @@ static void *elf_kexec_load(struct kimage *im=
age, char *kernel_buf,
> > > > >  		if (ret)
> > > > >  			goto out;
> > > > >  		initrd_pbase =3D kbuf.mem;
> > > >=20
> > > > > -		pr_notice("Loaded initrd at 0x%lx\n", initrd_pbase);
> > > > > +		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_pbase);
> > > >=20
> > > > This is not a pr_debug().
> > > >=20
> > > > >  	}
> > > > > =20
> > > > >  	/* Add the DTB to the image */
> > > > > @@ -318,7 +319,7 @@ static void *elf_kexec_load(struct kimage *im=
age, char *kernel_buf,
> > > > >  	}
> > > > >  	/* Cache the fdt buffer address for memory cleanup */
> > > > >  	image->arch.fdt =3D fdt;
> > > >=20
> > > > > -	pr_notice("Loaded device tree at 0x%lx\n", kbuf.mem);
> > > > > +	kexec_dprintk("Loaded device tree at 0x%lx\n", kbuf.mem);
> > > >=20
> > > > Neither is this. Why are they being moved from pr_notice()?
> > >=20
> > > You are right.=20
> > >=20
> > > While always printing out the loaded location of purgatory and
> > > device tree doesn't make sense. It will be confusing when users
> > > see these even when they do normal kexec/kdump loading. It should be
> > > changed to pr_debug().
> > >=20
> > > Which way do you suggest?
> > > 1) change it back to pr_debug(), fix it in another patch;
> > > 2) keep it as is in the patch;
> >=20
> > Personally I think it is fine to change them all in one patch, but the
> > rationale for converting pr_notice() to your new debug infrastructure
> > needs to be in the commit message.
>=20
> Sure, sounds good to me. I have changed the patch log to reflect this as
> you suggested, please help check. Thanks again.
>=20

--+ZoXCPpIBvMNs/9S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXCnSQAKCRB4tDGHoIJi
0hSRAP4syRlZOyJw1n/YG43/qr9A2uscWNjv96tsTpRdHhZuhQEAx8XL/7OFrX0X
gOHyX1y7zxLOH70IlST6DVGjMoDzYgg=
=fWts
-----END PGP SIGNATURE-----

--+ZoXCPpIBvMNs/9S--
