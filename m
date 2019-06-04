Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1734A4B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 16:25:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JDjD0RTDzDqZq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 00:25:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JDbq2N7HzDqKv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 00:20:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="nIZmN1Fq"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45JDbl1Dcjz9sBb;
 Wed,  5 Jun 2019 00:20:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1559658035;
 bh=tMGxwX7P22L3/MD7F7w+Qs6FF3WSaRYGYVCWNvm7c50=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nIZmN1Fq4Q1801Z3veCCCfGDYCbUh15plZiiVaxoVVw29tO9T2wVlGVylk2C/BIvy
 YrpzWuSY4mMQV5r/7XJIkkM5CU9ZjLlzDtc8jJ7WTVHDBWY8VauQTvz4qkFMTDBxJL
 9mx8/ZNS95tq7YzPeLiswHb0R00YJiJIiyGhxqgtSm2sz1AwRE4GuH32TRYjk5dFc/
 BkBluR76uYKKGGFPKqR9smRuvRYC39A0okf4DTeluT6WwGSMiB4Lx9USVX35+qijBJ
 ru3RjE+NVau98oTj7AIh6bcvQdX7oDcIgnWO0LPisGkJ6jNzc303fy1Tq9LMoXFDB6
 kAGbD+uvJC17g==
Date: Wed, 5 Jun 2019 00:20:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [POWERPC][next-20190603] Boot failure : Kernel BUG at
 mm/vmalloc.c:470
Message-ID: <20190605002021.12392167@canb.auug.org.au>
In-Reply-To: <88ADCAAE-4F1A-49FE-A454-BBAB12A88C70@linux.vnet.ibm.com>
References: <9F9C0085-F8A4-4B66-802B-382119E34DF5@linux.vnet.ibm.com>
 <20190604202918.17a1e466@canb.auug.org.au>
 <88ADCAAE-4F1A-49FE-A454-BBAB12A88C70@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_igep8kUAWl9L/+0neHtMzK"; protocol="application/pgp-signature"
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

--Sig_/_igep8kUAWl9L/+0neHtMzK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Sachin,

On Tue, 4 Jun 2019 19:09:26 +0530 Sachin Sant <sachinp@linux.vnet.ibm.com> =
wrote:
>
> With today=E2=80=99s next (20190604) I no longer see this issue.

Excellent, thanks for verifying.

--=20
Cheers,
Stephen Rothwell

--Sig_/_igep8kUAWl9L/+0neHtMzK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz2fiUACgkQAVBC80lX
0GwP7Af+Nds/li0BeO7YFEHCVlP8ZGoPFFEQWkfiT8toFusuPbkFeVnHRYq3wODm
5FviWpQpujr9p5c2XrArh4o+CmZR9Ht7DJrpN2pwpNLYzDE6ewRX42sK3zWEr7wf
MIYwHJRSjLyxcQ2gJDKUe1UjHQZZpaBnk9zjuuPbVNLilOMUUgYUXCZwWS8AU2Qr
/8DVv3lT5EQSB3lDQNJR6ULYYPOTXmdA8B1DrDV4knmzc/VtOdevKhEHAQabbXj5
e7mcLfr91dqNQU+pNakAd+bT6h8Z54a7nqNHL8ObT4SoIi/K4uCYpNM4dfk0+n31
MrkfBaVsgQll4+Gbt7/Sflxco6udxQ==
=SSN/
-----END PGP SIGNATURE-----

--Sig_/_igep8kUAWl9L/+0neHtMzK--
