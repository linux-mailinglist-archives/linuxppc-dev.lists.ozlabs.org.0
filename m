Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398B764E484
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 00:10:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NY7HF0Q2Dz3bd0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 10:10:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=bAQtHBYQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NY7GL1L7zz2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 10:09:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=bAQtHBYQ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NY7GC4hZgz4xG6;
	Fri, 16 Dec 2022 10:09:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1671145750;
	bh=Llmkiue3cLjus3rNqXb++NFu9PSb6Z8V18DU2c6iraA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bAQtHBYQ66yQl0Scoi6ywb3ugDIPkBZQXZFiZJ9g+7aYoVlohlrV/76+dQQ1l+/hD
	 EuMVTVrukfOtfVi/k/VHhf0i7AKxMVbgCSmVqvZyOJgax+IxTRum/4+mQQoDXx1GLc
	 zKblPNT3ASivVIiwV/hMzlLO47rleofMs3f2vvhxwj61M4Z3r3sSVVnJmkNjvVC9zs
	 7IL/2qX1T5+dVff+aH86CpoBNynYIkOVw+WsaQDsY6tmJKhvjz1qzJmWMksuu74j8l
	 NW3jpM4YtIsmviM5VLpDrmLjLV74ceF0mZl8LWOSU3aCD8tQPSe+QcOdZyJQ9c2eWV
	 bdUbmwFyR36ew==
Date: Fri, 16 Dec 2022 10:09:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the tip tree with the
 powerpc-objtool tree
Message-ID: <20221216100905.78f9ecd9@canb.auug.org.au>
In-Reply-To: <20221124122931.266df8c7@canb.auug.org.au>
References: <20221124122931.266df8c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YZiFqCTqNMQ9KhLJxGw8IT2";
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
Cc: Peter Zijlstra <peterz@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/YZiFqCTqNMQ9KhLJxGw8IT2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 24 Nov 2022 12:29:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   tools/objtool/check.c
>=20
> between commit:
>=20
>   efb11fdb3e1a ("objtool: Fix SEGFAULT")
>=20
> from the powerpc-objtool tree and commit:
>=20
>   dbcdbdfdf137 ("objtool: Rework instruction -> symbol mapping")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc tools/objtool/check.c
> index 7580c66ca5c8,4f1a7384426b..000000000000
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@@ -207,7 -204,7 +204,7 @@@ static bool __dead_end_function(struct=20
>   		return false;
>  =20
>   	insn =3D find_insn(file, func->sec, func->offset);
> - 	if (!insn || !insn->func)
>  -	if (!insn_func(insn))
> ++	if (!insn || !insn_func(insn))
>   		return false;
>  =20
>   	func_for_each_insn(file, func, insn) {
> @@@ -850,11 -861,73 +861,73 @@@ static int create_ibt_endbr_seal_sectio
>   	return 0;
>   }
>  =20
> + static int create_cfi_sections(struct objtool_file *file)
> + {
> + 	struct section *sec, *s;
> + 	struct symbol *sym;
> + 	unsigned int *loc;
> + 	int idx;
> +=20
> + 	sec =3D find_section_by_name(file->elf, ".cfi_sites");
> + 	if (sec) {
> + 		INIT_LIST_HEAD(&file->call_list);
> + 		WARN("file already has .cfi_sites section, skipping");
> + 		return 0;
> + 	}
> +=20
> + 	idx =3D 0;
> + 	for_each_sec(file, s) {
> + 		if (!s->text)
> + 			continue;
> +=20
> + 		list_for_each_entry(sym, &s->symbol_list, list) {
> + 			if (sym->type !=3D STT_FUNC)
> + 				continue;
> +=20
> + 			if (strncmp(sym->name, "__cfi_", 6))
> + 				continue;
> +=20
> + 			idx++;
> + 		}
> + 	}
> +=20
> + 	sec =3D elf_create_section(file->elf, ".cfi_sites", 0, sizeof(unsigned=
 int), idx);
> + 	if (!sec)
> + 		return -1;
> +=20
> + 	idx =3D 0;
> + 	for_each_sec(file, s) {
> + 		if (!s->text)
> + 			continue;
> +=20
> + 		list_for_each_entry(sym, &s->symbol_list, list) {
> + 			if (sym->type !=3D STT_FUNC)
> + 				continue;
> +=20
> + 			if (strncmp(sym->name, "__cfi_", 6))
> + 				continue;
> +=20
> + 			loc =3D (unsigned int *)sec->data->d_buf + idx;
> + 			memset(loc, 0, sizeof(unsigned int));
> +=20
> + 			if (elf_add_reloc_to_insn(file->elf, sec,
> + 						  idx * sizeof(unsigned int),
> + 						  R_X86_64_PC32,
> + 						  s, sym->offset))
> + 				return -1;
> +=20
> + 			idx++;
> + 		}
> + 	}
> +=20
> + 	return 0;
> + }
> +=20
>   static int create_mcount_loc_sections(struct objtool_file *file)
>   {
>  -	struct section *sec;
>  -	unsigned long *loc;
>  +	int addrsize =3D elf_class_addrsize(file->elf);
>   	struct instruction *insn;
>  +	struct section *sec;
>   	int idx;
>  =20
>   	sec =3D find_section_by_name(file->elf, "__mcount_loc");

This is now a conflict between the powerpc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YZiFqCTqNMQ9KhLJxGw8IT2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmObqREACgkQAVBC80lX
0Gyevgf+Jaog/4cPR9caBIeop8dVQj+x41sLPTWbYZJwMAdXlf2dRUrTwVuiMMYo
IRT9KNco030SzNgwEUnSZRRiew0HjWXsqgJYJUcY029C0/6YKDTScWioUZgsSnhA
LGLOAS5g+tOQTfdiubsfy2P5qnbOXSEerv+KZUnR0AQIpYgAKkBSZJUrCdZs9MeL
2nAe3PUiKe52zgzAGYd6nmOmh2uI98/0i2+sa3MSDUt3OHnp4q6i3GK0cKZEfSBn
PLxQQAUdZaR6Y8hMP56vbwD2oRmrjfQi2D9YyzVX/QO8dYzpegMnxhDPI0Lfd+nO
UwnyRlhbdVDkxsuGNrDEwElx+21paw==
=q+A3
-----END PGP SIGNATURE-----

--Sig_/YZiFqCTqNMQ9KhLJxGw8IT2--
