Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 441932067E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 01:07:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s24V567dzDqcq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 09:07:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49s22k301pzDqX3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 09:06:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=Zcm5T9Qh; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49s22k1l2sz9sSS; Wed, 24 Jun 2020 09:06:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49s22j6mJyz9sRR;
 Wed, 24 Jun 2020 09:06:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1592953582;
 bh=7Ji4D7THZhCZNo0abLfTLWxCsbkg8zTPOz80WALNi7o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zcm5T9QhpXBZoloccMeBk0bIhpEauCHhFQkaZ5yV0lsF8wSqxVhgdlPodgr2qDaUI
 EgqKhN7qpKHhuGKzmRadRVzY+/7OKDqrJUm/LlY+O+xlNJrchle6XjMtitI5GdFIMN
 I696j7lhkJ+iAR6Bvyb9go+E5n32bhtwAaZN+qkiDvafuyvR2N6o8j7PA/+2NQ5v9/
 qZlRdvT5y0H9K4pUJsejSm/Jkr+sENTk+tMdkBmHncdrtZkJz9ahHP2Ol1+FNzMLBQ
 B2P1FH3cd3RXjljG3vE3lNOPA7XIN9x+JWIGhZN6iAPRlJ2a0+hgOd+Tb1ptVF48gH
 sOyhG27lWSuxw==
Date: Wed, 24 Jun 2020 09:06:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/boot/dts: Fix dtc "pciex" warnings
Message-ID: <20200624090621.385af1ce@canb.auug.org.au>
In-Reply-To: <20200623130320.405852-1-mpe@ellerman.id.au>
References: <20200623130320.405852-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w/Xs23EAdyJB0mW7wDAXA1F";
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/w/Xs23EAdyJB0mW7wDAXA1F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Tue, 23 Jun 2020 23:03:20 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> With CONFIG_OF_ALL_DTBS=3Dy, as set by eg. allmodconfig, we see lots of
> warnings about our dts files, such as:
>=20
>   arch/powerpc/boot/dts/glacier.dts:492.26-532.5:
>   Warning (pci_bridge): /plb/pciex@d00000000: node name is not "pci"
>   or "pcie"
>=20
> The node name should not particularly matter, it's just a name, and
> AFAICS there's no kernel code that cares whether nodes are *named*
> "pciex" or "pcie". So shutup these warnings by converting to the name
> dtc wants.
>=20
> As always there's some risk this could break something obscure that
> does rely on the name, in which case we can revert.
>=20
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks for that.  I have applied it to my "fixes" tree until it turns
up elsewhere.

--=20
Cheers,
Stephen Rothwell

--Sig_/w/Xs23EAdyJB0mW7wDAXA1F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7yiu0ACgkQAVBC80lX
0GxneQf9GKQ6i5jFhGUj5EtQieKRwXY7+uSQhlQDNLTyDtB88WXOnp8UA7LyXGe+
0BUnl3umHd9Hu2rmkUa/g8n6Iuzl5t1mJd6IK8hJ6qcoC08qkDUoOBRyWLvlM9lw
3qOmETrrmqyImEO/c+/UdvAS3ZxgsxzlvEKI+ECjPVF/X2a7fp86ZgWYdwWPFU41
HO/3pxcrGKfODAu7EHu7HZW68xGKHSqCq89SOVJeqMiIAGZ8TKTQetc8KmuPNG+X
MvVxRYK+wwwjT5u9UhBiG22DBOR38322CvfzvfDd8h8jQBEcsOM6dsSTEBrIxkGw
SJbmrLuqvNMMew/UhvYMBHJBb0jp1Q==
=hFvt
-----END PGP SIGNATURE-----

--Sig_/w/Xs23EAdyJB0mW7wDAXA1F--
