Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8B98C7156
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 07:27:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=rothwell.id.au header.i=@rothwell.id.au header.a=rsa-sha256 header.s=201702 header.b=Y71SZzMK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfzBV2CFGz3dXB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 15:27:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=rothwell.id.au header.i=@rothwell.id.au header.a=rsa-sha256 header.s=201702 header.b=Y71SZzMK;
	dkim-atps=neutral
Received: from mail.rothwell.id.au (gimli.rothwell.id.au [103.230.158.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vfy3B0zrVz3cXg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 14:36:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
	s=201702; t=1715834180;
	bh=r1kOvfgIYROHWlLOWok8nOUpUvblp7y8+UA6RrmiDLY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y71SZzMKdNFi775gwXxXQZntcsEzWtoVGOTUG5yNXVlDLCfBWHVFOjfF9lrhTKObR
	 zWA5kOBA+5xP90d/ObePZi8BufFHwGrkhvOjNa8UhtYsDOQUXNH26cTeulASLhduTI
	 AyQNYfJ7XRX/7E4CHPiU5EQF4yk8yuFMKtlAUNpx3m3n0H6aVPWGkte6shEQGVZ8uz
	 bKQFAO//OtvPlcTLQGCg6F4LlaTWrhLR9D9/ei3sdCWmkDp8fYr3kDFeWqKUxUBW6H
	 UCoalryUFWvtD0cCVMV5dN9jsUCvdXLsPj7b/bwo1bxh9Dw+vHePp2hv/uS79DzpG2
	 gpaKQqPlg7YqA==
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.rothwell.id.au (Postfix) with ESMTPSA id 4Vfy354RHgz4L;
	Thu, 16 May 2024 14:36:17 +1000 (AEST)
Date: Thu, 16 May 2024 14:36:12 +1000
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build warning after merge of the powerpc tree
Message-ID: <20240516143612.1a369133@oak>
In-Reply-To: <87cypmwk92.fsf@mail.lhotse>
References: <20240515163708.3380c4d1@canb.auug.org.au>
	<87cypmwk92.fsf@mail.lhotse>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8=rEbHDsm_Vfaw.dcRcMzja";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Mailman-Approved-At: Thu, 16 May 2024 15:27:08 +1000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/8=rEbHDsm_Vfaw.dcRcMzja
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, 16 May 2024 12:42:01 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> >
> > After merging the powerpc tree, today's (it may have been yesterday's)
> > linux-next build (powerpc allyesconfig) produced this warning:
> >
> > WARNING: modpost: vmlinux: section mismatch in reference: fadump_setup_=
param_area+0x200 (section: .text.fadump_setup_param_area) -> memblock_phys_=
alloc_range (section: .init.text) =20
>=20
> I don't see the warning, but clearly it is possible if the compiler
> decides not to inline fadump_setup_param_area().
>=20
> What compiler version are you using?

$ gcc --version
gcc (Debian 13.2.0-7) 13.2.0

(on zz1 if you want to test)
--=20
Cheers,
Stephen Rothwell

--Sig_/8=rEbHDsm_Vfaw.dcRcMzja
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZFjTwACgkQAVBC80lX
0Gz/qgf/UJFGAJa8YAH/RLjgrt44P6TQj7A0baJl0AhyJHCh4vSoeUKU76gt1a4y
yLMDSLtS8ar9pHKQO1+HAVEaboun2nieyDDoM6qDeyw0Pywm58+r5XjeSxEGOEfb
5QPKnGihFEbxxoU2RQjIpT9A4Jk6X9P4gILdcy9EtFSvIK0OG6PgIIaisQCfUWnT
fSjvKKSKcFsz/vRMIvr5rTPXgIUHSyMC93h1cSKv4izciaeGxvmup/iu8FPS7Txl
MTUDFpDINHJOLG82u6CedDXuqlOcCBgtYXBvmCkIH/dEfGeVjevDwokpbrFjk3qC
GGjpxOLqlbzxgqp9o2c7Qs4YG1F0/Q==
=MM25
-----END PGP SIGNATURE-----

--Sig_/8=rEbHDsm_Vfaw.dcRcMzja--
