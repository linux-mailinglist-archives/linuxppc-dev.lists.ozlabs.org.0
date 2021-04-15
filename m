Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DC8360614
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 11:44:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLZFB4Lm9z3byn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 19:44:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=BsfLSY40;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=BsfLSY40; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLZDn2h5nz2ym4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 19:44:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLZDd64Wkz9sCD;
 Thu, 15 Apr 2021 19:44:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1618479858;
 bh=RArAJTCC/ZsrvJupSUTPB3sBlqWIRoaht0fIS/nB95g=;
 h=Date:From:To:Cc:Subject:From;
 b=BsfLSY40emsL0vivTjnEkhsGnCJs8cEpyKuPyXAP8NMMGbnPBwdvNADn6YKVi14Le
 mN6JzuWvqbonYnHmFsWcc2oCZ5lmSie0bDW9ur8j9A6iDpuFZ1eUZAt0nToLPE8NMs
 P9nT827Znb8aFV/tNMQKOjaxH83mwbXPFmeyW3JmdPhr5IbvlMTV6fikKNig4n3z32
 aGqCFbgnggMvtzBJSsbd+nwCXzoi6C+YJHXV987hszLdT1zVDQlIY2rtJGone+dejB
 9swXIpTDtk4VsdB11GJCSNJK8cE89/huNhwFPDD74iV22E4pWcO1KgggjxvQBMxwEJ
 EZ8fjopNUu9QQ==
Date: Thu, 15 Apr 2021 19:44:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Message-ID: <20210415194417.498e71b7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/szb=KuBpGlQVv4KE55mef8A";
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/szb=KuBpGlQVv4KE55mef8A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/kernel/module.c

between commit:

  2ec13df16704 ("powerpc/modules: Load modules closer to kernel text")

from the powerpc tree and commit:

  4930ba789f8d ("powerpc/64s/radix: enable huge vmalloc mappings")

from the akpm-current tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/kernel/module.c
index fab84024650c,cdb2d88c54e7..000000000000
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@@ -88,29 -88,26 +89,42 @@@ int module_finalize(const Elf_Ehdr *hdr
  	return 0;
  }
 =20
- #ifdef MODULES_VADDR
 -void *module_alloc(unsigned long size)
 +static __always_inline void *
 +__module_alloc(unsigned long size, unsigned long start, unsigned long end)
  {
 -	unsigned long start =3D VMALLOC_START;
 -	unsigned long end =3D VMALLOC_END;
 -
 -#ifdef MODULES_VADDR
 -	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
 -	start =3D MODULES_VADDR;
 -	end =3D MODULES_END;
 -#endif
 -
+ 	/*
+ 	 * Don't do huge page allocations for modules yet until more testing
+ 	 * is done. STRICT_MODULE_RWX may require extra work to support this
+ 	 * too.
+ 	 */
+=20
  	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
- 				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
+ 				    PAGE_KERNEL_EXEC,
+ 				    VM_NO_HUGE_VMAP | VM_FLUSH_RESET_PERMS,
+ 				    NUMA_NO_NODE,
  				    __builtin_return_address(0));
  }
 +
++
 +void *module_alloc(unsigned long size)
 +{
++	unsigned long start =3D VMALLOC_START;
++	unsigned long end =3D VMALLOC_END;
 +	unsigned long limit =3D (unsigned long)_etext - SZ_32M;
 +	void *ptr =3D NULL;
 +
++#ifdef MODULES_VADDR
 +	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
++	start =3D MODULES_VADDR;
++	end =3D MODULES_END;
 +
 +	/* First try within 32M limit from _etext to avoid branch trampolines */
 +	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
- 		ptr =3D __module_alloc(size, limit, MODULES_END);
++		ptr =3D __module_alloc(size, limit, end);
 +
 +	if (!ptr)
- 		ptr =3D __module_alloc(size, MODULES_VADDR, MODULES_END);
++#endif
++		ptr =3D __module_alloc(size, start, end);
 +
 +	return ptr;
 +}
- #endif

--Sig_/szb=KuBpGlQVv4KE55mef8A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB4CvEACgkQAVBC80lX
0GwD/QgAgJkGhiT2ejF09nPIJxN78qxXool7C4G+20Rj1C+FobjN8ZRQM6DfN9rD
wRPUraPTJCOAxgebasRcPzbHQMQkpeMQP2JCvOI//NTm/UxKoAdgEnVJzSvZO34b
FE2mgTAyDK457IiuKu1/JyW77NA8MH33XVHyZdckw3pcivkqgErNCb5bd39VG+de
vzhGH+0U8clZPJwJnCEhaQshsdbtxrGHq+E9YTiwnzjQreIP/Nqf3rnbrGdjFE/X
ly4Ai0VLcj0OBzUFs6AyMIoXs83BuvMj8OgEnoLBfaCpiVX0KiUuOJNrRgxSNaWo
MaKvwQJ00nwZQ9tqNqNhV4flRYFwKA==
=oaik
-----END PGP SIGNATURE-----

--Sig_/szb=KuBpGlQVv4KE55mef8A--
