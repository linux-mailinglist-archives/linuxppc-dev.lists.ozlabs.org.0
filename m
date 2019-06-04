Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F074634466
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 12:30:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J7VY3xPRzDqSF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 20:30:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J7Sy2SjhzDqJl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 20:29:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="gZ2toIQ0"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45J7Sx4Bx3z9s3Z;
 Tue,  4 Jun 2019 20:29:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1559644162;
 bh=WIejSqOqVWArGUwS80dnLpzCIBBF7ejgcfIQE3A3wCQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gZ2toIQ0UxbHR2sJ10+sYJ3SvpmBB8I1fSgYFk5s+1NZdNGar/HAcbyHm5IeGMFnH
 mIiH8YPx44nfKkr/q/hDb3RwgsTD7mHa1pIO9HBM+5s7yUuv4QAGknaIx13Gi/8gfh
 uLt9OYtw0QMul/6N0CtaibZsOIxxjoju2iQDgG6kU+NxG+Bhhd0TO7ifDJ+Al3Kqny
 nicJfwpClEdmH/2G2HMmhS68zeaBoDK65fE0Pw2hSKXCpaTnMO4TbkaygK5k/rP9ZQ
 phjpn1em8KVoDSvmML+aNpDeGayvraC72jiEM4KaLulnjWkRMKl56VhAokuXcJSF9H
 VjhbSUfU8DQOw==
Date: Tue, 4 Jun 2019 20:29:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [POWERPC][next-20190603] Boot failure : Kernel BUG at
 mm/vmalloc.c:470
Message-ID: <20190604202918.17a1e466@canb.auug.org.au>
In-Reply-To: <9F9C0085-F8A4-4B66-802B-382119E34DF5@linux.vnet.ibm.com>
References: <9F9C0085-F8A4-4B66-802B-382119E34DF5@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n.aGLPJk/wsZDAk8OiMeL=b"; protocol="application/pgp-signature"
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
Cc: linux-mm@kvack.org, linux-next@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Uladzislau Rezki \(Sony\)" <urezki@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/n.aGLPJk/wsZDAk8OiMeL=b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sachin,

On Tue, 4 Jun 2019 14:45:43 +0530 Sachin Sant <sachinp@linux.vnet.ibm.com> =
wrote:
>
> While booting linux-next [next-20190603] on a POWER9 LPAR following
> BUG is encountered and the boot fails.
>=20
> If I revert the following 2 patches I no longer see this BUG message
>=20
> 07031d37b2f9 ( mm/vmalloc.c: switch to WARN_ON() and move it under unlink=
_va() )
> 728e0fbf263e ( mm/vmalloc.c: get rid of one single unlink_va() when merge=
 )

This latter patch has been fixed in today's linux-next ...

--=20
Cheers,
Stephen Rothwell

--Sig_/n.aGLPJk/wsZDAk8OiMeL=b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz2R/4ACgkQAVBC80lX
0GxNXwf/fJ0Go1oz1h68yR3tc7OY90gu/bZ5Klbs+GSN973ZKndwaWH4q79zzjie
LYHNzKdPpxDLckq08NQSFajRzh6gIvzI+qeaLHjss93qbxpOhzLRjI7UQsD+isR2
S2HsUU7Tn1hAsVZhbZp3McmIOPIRet/p6jA0K43BH+eeXrcT7R6TOTNkiIV1X1/o
AGsvFmJ80rVbJ/q4mCeC4q5Dz0BrTnCRKhHXChocYDPqSRvjSrwfnI+Uqk9ywHuD
TIMSsoc1JR/xDGmxnoR8hW91OkQkQ5q8N4OSQSxEqS42HSQkLShxyyHiCBQDQa3N
8jYQuik/cymkDKNlptMJG/Ft6lrldA==
=JezC
-----END PGP SIGNATURE-----

--Sig_/n.aGLPJk/wsZDAk8OiMeL=b--
