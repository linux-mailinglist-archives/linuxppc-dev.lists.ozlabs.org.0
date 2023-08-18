Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7FC7802FA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 03:18:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=PK/TgGoI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRkWw04gDz3cXy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 11:18:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=PK/TgGoI;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRkW24zpyz2xwG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 11:17:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1692321430;
	bh=Wj52K4lZS/g/aHhULzZG+L4pSUEP25cWrpsFG22rQf0=;
	h=Date:From:To:Cc:Subject:From;
	b=PK/TgGoIQym7SkBAW1O619pBDmh4ZWIrHy1ZL1APXY1N9PgjuOVNcTzqPtKff2vYi
	 Gm7bS7g0PJ4d2KglE8k0r5qvWWdA1vCq6ii1d3iT6cxXJPx45zzQF3Sk1k86qbD6el
	 RMmOEDIk41xRL/0VgCavqBSaiYodX63u27EIdo5P0YrBkKZRzNQ5nzAo+LdUalEKVC
	 8OJ2Yf6TWujxCDBc7WsSAS53/afWGZteBLytxD6NEWqyD+pBHhU0CmlG9Hc+KaEts+
	 k5QE0f5tVm234ehT17BNVL95wGY+QLKHhrZWi/a02fTqXZInuIqjfO+UzmDj+HdBod
	 G48goFp5a/woQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRkVs1gXZz4wy5;
	Fri, 18 Aug 2023 11:17:08 +1000 (AEST)
Date: Fri, 18 Aug 2023 11:17:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the net-next tree with the powerpc tree
Message-ID: <20230818111707.2714e8cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kWOSr8h3qHdBONR47hMwJfY";
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
Cc: Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/kWOSr8h3qHdBONR47hMwJfY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/freescale/fs_enet/fs_enet.h

between commit:

  60bc069c433f ("powerpc/include: Remove unneeded #include <asm/fs_pd.h>")

from the powerpc tree and commit:

  7a76918371fe ("net: fs_enet: Move struct fs_platform_info into fs_enet.h")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/freescale/fs_enet/fs_enet.h
index aad96cb2ab4e,d371072fff60..000000000000
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
@@@ -9,8 -10,8 +10,6 @@@
  #include <linux/phy.h>
  #include <linux/dma-mapping.h>
 =20
- #include <linux/fs_enet_pd.h>
 -#include <asm/fs_pd.h>
--
  #ifdef CONFIG_CPM1
  #include <asm/cpm1.h>
  #endif

--Sig_/kWOSr8h3qHdBONR47hMwJfY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTexpMACgkQAVBC80lX
0Gzrpgf/V3aE/K9DCrHYO5zLpcikiGZfJrSz5DX6IxzUB4v1iVCexGFyh8o1T6T9
IRYb4RRcbtOuxMl40T3yL4UJsjjVP2gTU/TRazpeoMcMvqFbLbv3+83f9TiP6jwF
dSv77sdA2jfN9UopC19hX9+aBDCKbit+HT1jJ75g4eAP8/vy/MJH2nWnFLRHwo9h
39cUiX0Rhi/1lXtmv2XbUHhMDegF/Zq2SECGGJ0Bf9XThjeeNiRDWAK/qfIjzZba
ZjK5HMPZakBGxHf38Ro/XG46AY374cNQ8ZWo6T6M4u813h3vV6zHRsQc05vPJBhJ
r8vckszA3e0kbWlsYd+/WYHo6jGAzQ==
=fzpM
-----END PGP SIGNATURE-----

--Sig_/kWOSr8h3qHdBONR47hMwJfY--
