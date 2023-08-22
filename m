Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B844783757
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 03:23:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Lc1ahpj1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVBS009kWz3c3H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 11:23:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Lc1ahpj1;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVBR60NRTz2y1f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 11:22:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1692667341;
	bh=QsNDGFvVo1SvxEvhU10jBdQRvP3U/A2CgPljhigcvQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Lc1ahpj1fWUVwYlCjg/HPm13YYYVnVyCLWQC8lbkw04saXWFi2yu8wC1Jv8iBaoWw
	 o+C/wq2UFi/FzQqou+SQa5Rgqzy47ZMQTscW3nkmJo4aLpfnSkenVcZN9ByuWL98w9
	 wKf5Xn+W8OEgiHEkV6eEn1rA+Cnssd9HGrcRklIdC3btw3XnFhWAjq3HAy/iMpiK+V
	 xx3wQdDESzeMEbIALJ4wDINggUCpHuOdWGaz8wSXNXV0cH0cR8JJIBKGlCtpKz/ETv
	 X1yUmWp655AzuJ/CpImlcFgjGS2oZVWKMlIQSTvb85iPVW6JwPhCsHpTdGCof59Fiq
	 99711Z8IDpy/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RVBR13HQ0z4wxx;
	Tue, 22 Aug 2023 11:22:21 +1000 (AEST)
Date: Tue, 22 Aug 2023 11:22:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20230822112217.185c3357@canb.auug.org.au>
In-Reply-To: <ZOQLUMBB7amLUJLY@casper.infradead.org>
References: <20230822095537.500047f7@canb.auug.org.au>
	<ZOQLUMBB7amLUJLY@casper.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CYCJ/0.1wJKizPBWXmOeEhD";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/CYCJ/0.1wJKizPBWXmOeEhD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

On Tue, 22 Aug 2023 02:11:44 +0100 Matthew Wilcox <willy@infradead.org> wro=
te:
>
> On Tue, Aug 22, 2023 at 09:55:37AM +1000, Stephen Rothwell wrote:
> > In file included from include/trace/trace_events.h:27,
> >                  from include/trace/define_trace.h:102,
> >                  from fs/xfs/xfs_trace.h:4428,
> >                  from fs/xfs/xfs_trace.c:45:
> > include/linux/pgtable.h:8:25: error: initializer element is not constant
> >     8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT) =20
>=20
> Ummm.  PowerPC doesn't have a compile-time constant PMD size?

Yeah, you are not the first (or probably the last) to be caught by that.

--=20
Cheers,
Stephen Rothwell

--Sig_/CYCJ/0.1wJKizPBWXmOeEhD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTkDckACgkQAVBC80lX
0Gw/wAf/SCxysM9kgwBGXjE8mdNaMmTV0RuXSW5fILUfaH2K1bwzirH/1UYXENFe
h78SXWxhzCtvQsEpLMYiaNRdaAsbFwXebMAreYkEVSA7y+QWZ+PyIlLE7/cjjSpO
RPe10UzO/fdzXdjzz8Ll3MvCLgMiPxUWoonouaBz7roLcv8EAjEjXl/TS5fcQoqp
XFZLn4PzY4HH7tNI2pVBhH8bhELoX8mU8FC+h3a2ygQSANdASi9u/2BXAroJVbCY
7AwW30IKzdD0JJnmlsL+59JyaMEE9Pd1m+o3JzXkoi0MJicvpKiL3oIss2z74vfH
7bupmKGqIkxtkbHGVd+UWhsMJWK/Iw==
=u0m7
-----END PGP SIGNATURE-----

--Sig_/CYCJ/0.1wJKizPBWXmOeEhD--
