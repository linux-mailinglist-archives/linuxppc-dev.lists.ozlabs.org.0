Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA2156A1BA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 14:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldw7V5ZzFz3c9p
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 22:04:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=gGLCNrRD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ldw6t1Wtgz3byv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 22:03:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=gGLCNrRD;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ldw6l1QM9z4xDB;
	Thu,  7 Jul 2022 22:03:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1657195423;
	bh=YC/2OozYTGWuIXVFqvGcKXNJFtQMKiJOfOeSbGoL3v8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gGLCNrRD3X/IqnbeA4V+qfCrmER7TsrFOnupgQEOQHzkeiDXoKKDCkU9POUatYYLP
	 WpSIOUR4Yhj3nLF0tqJtp7TkFYxk7HoS3rQgNP5iaYSkRz+mfMQJ4M1/AgkrOlJEg2
	 dvGs0qRBjD4RLCaBjiC+zODI6fQi8cQYEUttnz4uXfmFmre7YiL+P/wKM7nJQduNt+
	 DvkJ4AEOO414rh9aml/Z+h40gqwnwBEFzAf1bH5sPtjtAoy1nEbWBPEgomhGQRPQkI
	 wbFQknKEO9+VmZ+qFycokRUUkmVKStze0jBIjvxVxPi3x2IO3bcwunuLPf2KqlwfMa
	 BOAXsopphNDYg==
Date: Thu, 7 Jul 2022 22:03:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: linux-next: manual merge of the random tree with the powerpc
 tree
Message-ID: <20220707220335.36087d5e@canb.auug.org.au>
In-Reply-To: <CAHmME9qCTZpRKrvXVDhCGTD6z15BwDFupX0Z5QwhoWCCT2w2Fw@mail.gmail.com>
References: <20220707173252.5fff21f2@canb.auug.org.au>
	<CAHmME9qCTZpRKrvXVDhCGTD6z15BwDFupX0Z5QwhoWCCT2w2Fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RZw/=ITfff_AmIDTe9mkTMr";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Juerg Haefliger <juerg.haefliger@canonical.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/RZw/=ITfff_AmIDTe9mkTMr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Thu, 7 Jul 2022 12:52:54 +0200 "Jason A. Donenfeld" <Jason@zx2c4.com> wr=
ote:
>
> Oh darn. Any clever tricks to prevent the merge conflict from
> happening? Or is this trivial enough that we'll let Linus deal with
> it?

Just leave it for Linus, its pretty trivial.

--=20
Cheers,
Stephen Rothwell

--Sig_/RZw/=ITfff_AmIDTe9mkTMr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmLGy5cACgkQAVBC80lX
0Gxswgf+P5svBBU4WZUfNjPdqEFVlotiBELcLj9aQQOVg43ggtrYWXuMUPEZmgw3
3mhRaBpjQ9uTbNw7+rLZhDmhe/FNN5kol/KKwLS29AM2zvLRM0sexabHmSdKjsDM
tc/Z++3JKRah5n/RGNt+WQVZjDrxSQozsvhNsmQ2w8kbkWHNDXewy0+shkdDE5sL
CVAWw/XHYKWWNfBqkryf63tPy3Dlxe38Mxg7CpBFO+S32XmUnmemGRm244aYqnkW
p0B4T+QUkW2st0siclSvWnA/xTNoZdj0HrYjZgK617mlJEYuVmGu0T1n1BpjEIIq
pEeE/QK8EMkdhepSJ+zr9aP9CBQ+Mw==
=nulz
-----END PGP SIGNATURE-----

--Sig_/RZw/=ITfff_AmIDTe9mkTMr--
