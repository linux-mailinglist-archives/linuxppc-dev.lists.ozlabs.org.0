Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE82726D742
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 10:59:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsW9L63KQzDqV7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 18:59:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsW7b03p0zDqV3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 18:57:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=hIpHaiHj; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BsW7Z2M8fz9sSC;
 Thu, 17 Sep 2020 18:57:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1600333050;
 bh=x+1vU5s/qiYCUF+IZF2QwlxWyd8G1Gbr/+jRFDRLYsQ=;
 h=Date:From:To:Cc:Subject:From;
 b=hIpHaiHjARQMG9yODevuXD3saGCjTXzTfRhk1DdtHGusBJMlkuFIStPOnaw8YVF42
 QXb2IYOzKa0yvxAgfn4GzWmUtUI/kVxeshowDOTN8AWizwm28DZd7ZRikTqPJ5DRxd
 2153q1PVAwjM4Uiy6J470i148Y0ERQU2TpiMPm645dFjG5vZ7jEweswMhui4wdGef/
 hm3sTUmjxanSU05jyVviyLLwwUf/xzxxK9kwjGnC/1j0JQ4yw24OVz/CZTQjGl8zrR
 nWWfFRQwiJHiKKMvIHLOmjHseXabNFKPYPrxxQ7tZUyiEwXSZM0fP8wKDjPsMaUC17
 t24uqqPFB1GZQ==
Date: Thu, 17 Sep 2020 18:57:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Message-ID: <20200917185729.7911e2b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h=lzTyWsgBMheYWQVF1XVyg";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/h=lzTyWsgBMheYWQVF1XVyg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/mm/kasan/kasan_init_32.c

between commit:

  4c42dc5c69a8 ("powerpc/kasan: Fix CONFIG_KASAN_VMALLOC for 8xx")

from the powerpc tree and commit:

  76713c119a9d ("arch, drivers: replace for_each_membock() with for_each_me=
m_range()")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/mm/kasan/kasan_init_32.c
index 929716ea21e9,26fda3203320..000000000000
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@@ -137,12 -138,12 +137,12 @@@ void __init kasan_mmu_init(void
 =20
  void __init kasan_init(void)
  {
- 	struct memblock_region *reg;
+ 	phys_addr_t base, end;
 +	int ret;
+ 	u64 i;
 =20
- 	for_each_memblock(memory, reg) {
- 		phys_addr_t base =3D reg->base;
- 		phys_addr_t top =3D min(base + reg->size, total_lowmem);
+ 	for_each_mem_range(i, &base, &end) {
+ 		phys_addr_t top =3D min(end, total_lowmem);
 -		int ret;
 =20
  		if (base >=3D top)
  			continue;

--Sig_/h=lzTyWsgBMheYWQVF1XVyg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9jJPkACgkQAVBC80lX
0GzX1Qf/WyTnkTqyUByLSsUHq60F3H+M30drzVVUeJ62iEtD/O42AYpwitbMsJTf
QHZNYbop7aCBXjmPTbSg93xiV/npJz71eFbbwYxjdWG2WNcRHT6TEKtFzqdkmI7d
or+2qYkq14sYkqm1jv3+8dLBmKBS2lGZ0XCdrnQKk4NmwtcLo443o5TGZZhxl7Ee
sfRK7oxl3ESYSVPUL7B/uBC59Iwkr0f7WhTQ6lKZLDXMZLKXOQ2AoNL9RwAI21D6
7yakCPtax05i0aJl4FJEuOGuP32pgJmdxvqFK4WemEoOXrXK6CUDBr7IE5e7jliO
/2U/kf7dDag+gQL9tklDqdHkkL/NUQ==
=f7B6
-----END PGP SIGNATURE-----

--Sig_/h=lzTyWsgBMheYWQVF1XVyg--
