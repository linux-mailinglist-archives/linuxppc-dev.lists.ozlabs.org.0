Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7F53615CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 01:05:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLw0s6gjXz3c0v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 09:05:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=XgtjymfR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=XgtjymfR; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLw0N3qlyz302c
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 09:04:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLw0C5xDmz9sVv;
 Fri, 16 Apr 2021 09:04:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1618527885;
 bh=ZhL6BpAiTk9FcT+T5DgCqZyNjJQV/rrieoSAtVXb50k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XgtjymfRlfy1wmujSuDaVsubNDGDI5cH8Ky3frmMzce1GQ5CKbJkNiSIznaOEpZO4
 vfEk//aaBOnBej919i4EXHnvy7FrEC2yVTdagClMBE4tiLT5Emib4z76kpvl6SZX4s
 DYK5q7kV2Gzt3dgqVCkf161CB2BIpgUvjs+wO7zq/Q7fDzrYAcZLmbAZY32qgDszjJ
 5690y8zA4KpyEnKuQuwNk1PrSkoMWS+M8pv7mMlTGcRV8f8zhml6F9mKtknF7lWwLH
 Oedb+T8o64ZBpog6+Sey6OBFynbC9yywm6vPvZFWA6UGV+UMHYn2jsCLKf7O1qYi4r
 Qv6w4A497We/Q==
Date: Fri, 16 Apr 2021 09:04:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v13 14/14] powerpc/64s/radix: Enable huge vmalloc mappings
Message-ID: <20210416090442.3852817d@canb.auug.org.au>
In-Reply-To: <20210415115529.9703ba8e9f7a38dea39efa56@linux-foundation.org>
References: <20210317062402.533919-1-npiggin@gmail.com>
 <20210317062402.533919-15-npiggin@gmail.com>
 <a5c57276-737d-930b-670c-58dc0c815501@csgroup.eu>
 <20210415115529.9703ba8e9f7a38dea39efa56@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CoWv8MZ9HFnuCaw0+k+d2WJ";
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/CoWv8MZ9HFnuCaw0+k+d2WJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 15 Apr 2021 11:55:29 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> On Thu, 15 Apr 2021 12:23:55 +0200 Christophe Leroy <christophe.leroy@csg=
roup.eu> wrote:
> > > +	 * is done. STRICT_MODULE_RWX may require extra work to support this
> > > +	 * too.
> > > +	 */
> > >  =20
> > > -	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, GF=
P_KERNEL,
> > > -				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE, =20
> >=20
> >=20
> > I think you should add the following in <asm/pgtable.h>
> >=20
> > #ifndef MODULES_VADDR
> > #define MODULES_VADDR VMALLOC_START
> > #define MODULES_END VMALLOC_END
> > #endif
> >=20
> > And leave module_alloc() as is (just removing the enclosing #ifdef MODU=
LES_VADDR and adding the=20
> > VM_NO_HUGE_VMAP  flag)
> >=20
> > This would minimise the conflits with the changes I did in powerpc/next=
 reported by Stephen R.
> >  =20
>=20
> I'll drop powerpc-64s-radix-enable-huge-vmalloc-mappings.patch for now,
> make life simpler.

I have dropped that patch from linux-next.
--=20
Cheers,
Stephen Rothwell

--Sig_/CoWv8MZ9HFnuCaw0+k+d2WJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB4xooACgkQAVBC80lX
0GyqrwgAmtxuo7IZ6/S/4r8/v7sJcfEh324RYwwpvHZyWyBU4D0WMZ3u6tLaT08i
8909zACOYf6M/4cLPDrztpz6xfeM1mGyPNhjB/0aplDRtKW5KSQ2a51Q3YBbkK84
rlb8vDTWM0o2a6hffjkcx+0jgEA9QjwXcZ9hzQ1pAu27d7tzix6FjJrcU6/Hx3hS
j/v5q26pEdh7NDF/Fwke1K5dZqucYA7sf4mW2H3/49eD0FOryNLR29URiqjZKJuq
uvDep2QoGIFIzlZxgAmJqphMrVZB/QNmTeyf62QWLCWP/bZUJA+ZBwN+CfZ6V/hG
3DnNR1inpWry4OGBBtKmNzLCfRZluA==
=/HhO
-----END PGP SIGNATURE-----

--Sig_/CoWv8MZ9HFnuCaw0+k+d2WJ--
