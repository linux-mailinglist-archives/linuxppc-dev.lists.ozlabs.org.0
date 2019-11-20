Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8CC1031DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 04:04:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HnbW5R79zDqsj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 14:04:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HmHh1sbszDqlm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 13:05:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="dY7Thfk/"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47HmHg44D7z9sPZ; Wed, 20 Nov 2019 13:05:35 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47HmHf2vjSz9sPK;
 Wed, 20 Nov 2019 13:05:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1574215535;
 bh=lSfFCEYhhKnh8tz6CK8SGQ+GHvCao8yS4zOVSz1rlKM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dY7Thfk/SmVGNhf1CwzWd0VToC3uejpJd2UkD+1eMKnDRFGIP/m4MGC/5NHt5qK94
 dJs9BIZch687jBda5gtnBizI38pW/AKe8lDalwsLsp60g9zpp3uZuJpUW6IodCnEwe
 1yV9h52SQS8WCLPiI0tU2CgPxUhvyYIoEf/HuUXhZ9OoZYwjcn5AglJwaKEVOc9hni
 eF0uyVVjGQq5+R85BKALLTwcv7eRDz/kvnhjVcQW53ETUlkZ73A6m5E+hRbMYnHQCS
 94OshlUzAuj4HykiOrhH26igKlHeo5ja1EqJIimpqK7x90GGSho5eKbSlR7buytNEA
 so+hSKxvULK+Q==
Date: Wed, 20 Nov 2019 13:05:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: Add const qual to local_read() parameter
Message-ID: <20191120130532.74844fb2@canb.auug.org.au>
In-Reply-To: <20191120011451.28168-1-mpe@ellerman.id.au>
References: <20191120011451.28168-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3gHtgYrcMa6xEZr1_kkvIuh";
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
Cc: linuxppc-dev@ozlabs.org, netdev@vger.kernel.org, edumazet@google.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/3gHtgYrcMa6xEZr1_kkvIuh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 20 Nov 2019 12:14:51 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> From: Eric Dumazet <edumazet@google.com>
>=20
> A patch in net-next triggered a compile error on powerpc:
>=20
>   include/linux/u64_stats_sync.h: In function 'u64_stats_read':
>   include/asm-generic/local64.h:30:37: warning: passing argument 1 of 'lo=
cal_read' discards 'const' qualifier from pointer target type
>=20
> This seems reasonable to relax powerpc local_read() requirements.
>=20
> Fixes: 316580b69d0a ("u64_stats: provide u64_stats_t type")
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build only

--=20
Cheers,
Stephen Rothwell

--Sig_/3gHtgYrcMa6xEZr1_kkvIuh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3Un2wACgkQAVBC80lX
0Gy86Af8DJ2cdW4dN38n9ofBTe3NKtzh4L8r54R2/+/O/z5M730yoet72WkTZHuR
P64gaVtiwmIDO62eS5aG/kknNnLt36MR2M36GjbES8f3/ZN2TFnXMSU8wntqYrJo
ei9JkBWKuXbnxXSgYXV41vgCLodvxJZ6Zz72GgD7QMk4UotpB7oJsQyckpxFndLl
OqY4vIBQs7YflJNwQP4s+RcDcb8e3Vymr0eDRV6bfzfgCub2nrFxG5mqcscTYJZg
lgRQg+tuQBvWi1uNUZkx7PdTiTFJ4W7orhpbaLhM+RH4gH9RchsNhJ8+53y3ZuTE
SzUFtdcMgWkABWE9uDFPONiw6PB0eA==
=rR9i
-----END PGP SIGNATURE-----

--Sig_/3gHtgYrcMa6xEZr1_kkvIuh--
