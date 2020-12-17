Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA22DCA25
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 01:50:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxD266CdbzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 11:50:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxCzh0rq5zDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 11:48:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=kLR639Nc; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxCzf3ncRz9sTK;
 Thu, 17 Dec 2020 11:48:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1608166127;
 bh=es0EnsoCQ2ifCTtAA+adaRfzfcRnwMUs2I8Ux5lFmD8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kLR639NcfbLoXZUlgkG4fIGl19uM4kCYDARQzm/b+0MYzgb2tddZtktyajhX8fjqF
 nw0ndWXzphISZcPy63dtAW6dOSqnrp8/dIb+ApuffRw1Va8x5nzttGhVz10gt68nYp
 5IcyecRBp2nCR31rHhz+cxv/ZBXtS71XsPGJJQOegcolxD+OjbHIqnOj32z8rMdSfB
 c2rkQlQX8o5PngZzgYcQIGBHnCzy9zjUAgp0wg0Epm9+TCwfBpxvU2oLMXng1NuR2I
 Q3kXfWlfgKTridgquKZSkFH3+JwksOek98Ccj+yYdoUs9DpLv+J3yUYKbLqCxTRG1P
 hSywz+pPz7krw==
Date: Thu, 17 Dec 2020 11:48:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc tree
Message-ID: <20201217114845.47fe50fb@canb.auug.org.au>
In-Reply-To: <20201208204016.4eb18ca4@canb.auug.org.au>
References: <20201208204016.4eb18ca4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T61_sMexRa0TWOjwLJzjnGx";
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Francis Laniel <laniel_francis@privacyrequired.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/T61_sMexRa0TWOjwLJzjnGx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Dec 2020 20:40:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the akpm-current tree got conflicts in:
>=20
>   drivers/misc/lkdtm/Makefile
>   drivers/misc/lkdtm/lkdtm.h
>   tools/testing/selftests/lkdtm/tests.txt
>=20
> between commit:
>=20
>   3ba150fb2120 ("lkdtm/powerpc: Add SLB multihit test")
>=20
> from the powerpc tree and commit:
>=20
>   014a486edd8a ("drivers/misc/lkdtm: add new file in LKDTM to test fortif=
ied strscpy")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc drivers/misc/lkdtm/Makefile
> index 5a92c74eca92,d898f7b22045..000000000000
> --- a/drivers/misc/lkdtm/Makefile
> +++ b/drivers/misc/lkdtm/Makefile
> @@@ -10,7 -10,7 +10,8 @@@ lkdtm-$(CONFIG_LKDTM)		+=3D rodata_objcop
>   lkdtm-$(CONFIG_LKDTM)		+=3D usercopy.o
>   lkdtm-$(CONFIG_LKDTM)		+=3D stackleak.o
>   lkdtm-$(CONFIG_LKDTM)		+=3D cfi.o
> + lkdtm-$(CONFIG_LKDTM)		+=3D fortify.o
>  +lkdtm-$(CONFIG_PPC_BOOK3S_64)	+=3D powerpc.o
>  =20
>   KASAN_SANITIZE_stackleak.o	:=3D n
>   KCOV_INSTRUMENT_rodata.o	:=3D n
> diff --cc drivers/misc/lkdtm/lkdtm.h
> index 79ec05c18dd1,6aa6d6a1a839..000000000000
> --- a/drivers/misc/lkdtm/lkdtm.h
> +++ b/drivers/misc/lkdtm/lkdtm.h
> @@@ -102,7 -104,7 +104,10 @@@ void lkdtm_STACKLEAK_ERASING(void)
>   /* cfi.c */
>   void lkdtm_CFI_FORWARD_PROTO(void);
>  =20
> + /* fortify.c */
> + void lkdtm_FORTIFIED_STRSCPY(void);
> +=20
>  +/* powerpc.c */
>  +void lkdtm_PPC_SLB_MULTIHIT(void);
>  +
>   #endif
> diff --cc tools/testing/selftests/lkdtm/tests.txt
> index 18e4599863c0,92ba4cc41314..000000000000
> --- a/tools/testing/selftests/lkdtm/tests.txt
> +++ b/tools/testing/selftests/lkdtm/tests.txt
> @@@ -68,4 -68,4 +68,5 @@@ USERCOPY_STACK_BEYON
>   USERCOPY_KERNEL
>   STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
>   CFI_FORWARD_PROTO
> + FORTIFIED_STRSCPY
>  +PPC_SLB_MULTIHIT Recovered

These conflicts are now between the powerpc tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/T61_sMexRa0TWOjwLJzjnGx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/aqu0ACgkQAVBC80lX
0Gzh1Qf/YjaYBc6q7yRUBcnVpD/l9a4dHyHV/exrXAIx6st0ZX4YNtRXKt3p9LJ+
S6kpR3lntIc61u/YV1zMgD0rT6wPRk9cPYc9iqz+mW7iyXlPgh2h7diuF1WNNpgt
ChBgpuHNdi+E6KZ7rhhCwJIEzSmzPb6kD13eMCxgjVGOQFGf1W4oWPhBGVcJTbzc
XwXGWun+BtsASn2VTIeMzVsJWYaHYnkGrF8ZtKo31kSt4wStiYCDA3xw8r/wlRue
lTqqJsmJ5qxmbzc5oRWX9KuhHDjYRVZzMriNuERQvVcPNmifRzB9basXdfi+MNTl
S3RZk4xR66z1DyZHjZ4UkfaN1gJRMw==
=BO9i
-----END PGP SIGNATURE-----

--Sig_/T61_sMexRa0TWOjwLJzjnGx--
