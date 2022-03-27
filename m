Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD24E8B14
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 01:33:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRXG23sRQz3c3S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 10:33:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=uD2kHHFO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRXFL6TLSz2xSN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 10:33:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=uD2kHHFO; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KRXFG0wzRz4xNm;
 Mon, 28 Mar 2022 10:33:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1648423986;
 bh=M45XB28xn1/Bfs1hY9Y7+mO4qS8oFV3iu8erEC4NRrQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uD2kHHFOLwv0rF/dZHQ4eFU4hP3pCeCRLnP8J+DyiFrU/Zqp4r2nylkn/LdYPo/9Y
 W9ofIO7msOyC0WMQ2THEbk1Nzu5YZpgPW/0GOXzoabj4OfGEKD8NV9JyQfUJIDPe6M
 ydgu8vqbnZdArq5QCP6Uez0JF9i2zftZHgK59016uIJtkN1/B7eFmafyjruv6XRaNw
 JDBpjQio+yzcR8DKWdCpCiwfyZJEPkjqw0c6KKS9omcIkdU1hTiuAiNIVjHCKpa3W+
 MSNdzy6UXZVjrZ8bZ75EpQazjQ7mb2d37bWgXBFAEhPSlSFFGYXWsfaxcjL9zNn5Py
 0VR9HF6+2EzOQ==
Date: Mon, 28 Mar 2022 10:33:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure in Linus' tree
Message-ID: <20220328103305.3fa42f9a@canb.auug.org.au>
In-Reply-To: <CAHk-=whGmZrYZ=YdcjeJbpviUTShj0NOiG2q-3d1-RJtz6vBPQ@mail.gmail.com>
References: <20220328090111.26f8980f@canb.auug.org.au>
 <CAHk-=whGmZrYZ=YdcjeJbpviUTShj0NOiG2q-3d1-RJtz6vBPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p376M4UlT+aL0d52XU_L2Rq";
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
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/p376M4UlT+aL0d52XU_L2Rq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sun, 27 Mar 2022 15:23:24 -0700 Linus Torvalds <torvalds@linux-foundatio=
n.org> wrote:
>
> Will apply that patch asap.

Thanks

--=20
Cheers,
Stephen Rothwell

--Sig_/p376M4UlT+aL0d52XU_L2Rq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJA9DEACgkQAVBC80lX
0GxZ+QgAoPtxju6+mSyCVBHtCXujWtF8Zw/IfpgGl2yzFD4wOT/Ox3SHHnle9EOu
d4d6hDWTKcRRDLT99nH75jc/V72TSFcXERBpOLM57FkUi8fCJzC7J2R6MNo+d4l8
o7EB5Uer8fz2n23Scda0AcUQsHZQc89T+fGL+OVXyUBPsjmgQcUtwyTivCiKUMoJ
80U+Az/RmlGxSvmt+XuLrhy/dF1AViIMhcgpVvBtUNw6MbPeBei94xgkrXUJ0niw
wMCTZ9Eww9z5qufTe7SCdkKwHIdHZP2A0MINvmAwDnfi6j73MbrHmvB2pBQpV0lf
K1jyT9aTQ63MpUT72pq8ZOdJt9m7NQ==
=rum5
-----END PGP SIGNATURE-----

--Sig_/p376M4UlT+aL0d52XU_L2Rq--
