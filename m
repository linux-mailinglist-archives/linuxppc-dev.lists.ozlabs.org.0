Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB8360651
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 11:58:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLZYB1fg0z3by4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 19:58:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=AlXu6KUb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=AlXu6KUb; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLZXn3xYgz2xy8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 19:58:17 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLZXl44Zbz9sVw;
 Thu, 15 Apr 2021 19:58:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1618480695;
 bh=1uvsyyLpIENjUj5/+XbE4hdxkNFTsrbNH/LtFMS8UAY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AlXu6KUbaDof2ItQcld3YGAmRa8HdzwPRfaWHUAYAd5ql2lQKYi4lUxcNvu6I/3qH
 mlqHykQ0qA1++CEyRrKozetNw/imXZnkLEKxEcEoPiRx3DfhqqAUZh6m/gmVadGfGN
 9uFRVtfAcN6uA5Z+YyLzvmCZF+IfhHfTZEVugeQBvGT5atM+dGpB6MGJZkMvfR4Tkz
 4Yg64uPlJkOdH68kxufb+YBPGm4j4D7zXmcYpFqQMlSeJBSJw+tQA+Ua1HPD367BkC
 D60sYe5RP3PPmxT7UIfQQG4EybyZzdfXg1k7B6ZZAc9pWPC4uRiYvQHa71EclTykZq
 mowwMOBuylw9Q==
Date: Thu, 15 Apr 2021 19:58:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc tree
Message-ID: <20210415195814.0dc4ced9@canb.auug.org.au>
In-Reply-To: <20210415194417.498e71b7@canb.auug.org.au>
References: <20210415194417.498e71b7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ExMvwKVEhJY+RZj1n_J_Q/A";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/ExMvwKVEhJY+RZj1n_J_Q/A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 15 Apr 2021 19:44:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   arch/powerpc/kernel/module.c
>=20
> between commit:
>=20
>   2ec13df16704 ("powerpc/modules: Load modules closer to kernel text")
>=20
> from the powerpc tree and commit:
>=20
>   4930ba789f8d ("powerpc/64s/radix: enable huge vmalloc mappings")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/powerpc/kernel/module.c
> index fab84024650c,cdb2d88c54e7..000000000000
> --- a/arch/powerpc/kernel/module.c
> +++ b/arch/powerpc/kernel/module.c
> @@@ -88,29 -88,26 +89,42 @@@ int module_finalize(const Elf_Ehdr *hdr
>   	return 0;
>   }
>  =20
> - #ifdef MODULES_VADDR
>  -void *module_alloc(unsigned long size)
>  +static __always_inline void *
>  +__module_alloc(unsigned long size, unsigned long start, unsigned long e=
nd)
>   {
>  -	unsigned long start =3D VMALLOC_START;
>  -	unsigned long end =3D VMALLOC_END;
>  -
>  -#ifdef MODULES_VADDR
>  -	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
>  -	start =3D MODULES_VADDR;
>  -	end =3D MODULES_END;
>  -#endif
>  -
> + 	/*
> + 	 * Don't do huge page allocations for modules yet until more testing
> + 	 * is done. STRICT_MODULE_RWX may require extra work to support this
> + 	 * too.
> + 	 */
> +=20
>   	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
> - 				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
> + 				    PAGE_KERNEL_EXEC,
> + 				    VM_NO_HUGE_VMAP | VM_FLUSH_RESET_PERMS,
> + 				    NUMA_NO_NODE,
>   				    __builtin_return_address(0));
>   }
>  +
> ++
>  +void *module_alloc(unsigned long size)
>  +{
> ++	unsigned long start =3D VMALLOC_START;
> ++	unsigned long end =3D VMALLOC_END;
>  +	unsigned long limit =3D (unsigned long)_etext - SZ_32M;
>  +	void *ptr =3D NULL;
>  +
> ++#ifdef MODULES_VADDR
>  +	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> ++	start =3D MODULES_VADDR;
> ++	end =3D MODULES_END;
>  +
>  +	/* First try within 32M limit from _etext to avoid branch trampolines =
*/
>  +	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
> - 		ptr =3D __module_alloc(size, limit, MODULES_END);
> ++		ptr =3D __module_alloc(size, limit, end);
>  +
>  +	if (!ptr)
> - 		ptr =3D __module_alloc(size, MODULES_VADDR, MODULES_END);
> ++#endif
> ++		ptr =3D __module_alloc(size, start, end);
>  +
>  +	return ptr;
>  +}
> - #endif

Unfortunately, it also needs this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 15 Apr 2021 19:53:58 +1000
Subject: [PATCH] merge fix up for powerpc merge fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/module.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index d8ab1ad2eb05..c060f99afd4d 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -110,7 +110,9 @@ void *module_alloc(unsigned long size)
 {
 	unsigned long start =3D VMALLOC_START;
 	unsigned long end =3D VMALLOC_END;
+#ifdef MODULES_VADDR
 	unsigned long limit =3D (unsigned long)_etext - SZ_32M;
+#endif
 	void *ptr =3D NULL;
=20
 #ifdef MODULES_VADDR
--=20
2.30.2

--=20
Cheers,
Stephen Rothwell

--Sig_/ExMvwKVEhJY+RZj1n_J_Q/A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB4DjYACgkQAVBC80lX
0Gy0LggAhCiWf+SJ7ED/qi8II8H7hqc0WFIFjp3ehHQUhxUPKbMRkTF1TDdSQCkO
ct2iwvcIoRITqGWP/Znaf/LbcArlJlKbjTQyc9mqdWl+mIVLhaZm9htfiwC9Uktb
lS5DjGDYyIVAanA6aTxU/wKWRYJ3PR9vSZhoHxmMIaYKQeCjTvQ/8vtpWzJGW9x8
j9uJYhL3/VhbIY9ovmTQVLPeLNk8NIeNiXcZxx9FW3Ovef3ZDdN/aswVxfhczXlv
ZdKh+3xzw1nvZUCYiK1zSYjGMn+qeHi6fMR1x9KOGt9C5TQTCbKSYI0gCjbrUDc0
koocZAH932c7hL2xIE5nAN8Jwc6OCA==
=fnEY
-----END PGP SIGNATURE-----

--Sig_/ExMvwKVEhJY+RZj1n_J_Q/A--
