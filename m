Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74594240209
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 08:39:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ5sn22C0zDqS2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 16:39:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ5qr1TNTzDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 16:37:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=GRnC6c3k; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BQ5qp4BQbz9sTn;
 Mon, 10 Aug 2020 16:37:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1597041463;
 bh=m+zOoQuk8SkP+Bz9FQL/66wMPnFFbtixWy/eubpVc0Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GRnC6c3kHlAqKRx0LQCN/eSiXg6JyuwQxXF26dpH/zwelh7n8I5BAbKixbxOgTALd
 d1FNqa0hMZ0wA+/Lac3jCRAaye6afo//J74jGpyACMDx0h0wjFnsaMBlLcaYhNr/eG
 B8iuZ2iifGKil9RtVplDQ8hndUqD9Tde1coEE95d8dA6Xa/fEbypbRZ6UfHXWO5i6g
 5K1j69Ga+La7x11Kor+Ap27qBFTU4IbqnQ1JvYJhBKxGDY0mD0zWNykJoj8PUXhZFR
 bn3ugZxKkAxJXOiXEcGzpVbHLGFwqnStep+wszFLp5mMyvLa3KoZJ/JRXcsVwdF/an
 1MANABR55yTjQ==
Date: Mon, 10 Aug 2020 16:37:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the set_fs tree with the powerpc tree
Message-ID: <20200810163740.2a2f7ba6@canb.auug.org.au>
In-Reply-To: <20200810061106.GA29318@lst.de>
References: <20200717190931.701ddf08@canb.auug.org.au>
 <20200809185726.5d8e5f55@canb.auug.org.au>
 <20200810061106.GA29318@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UaY.fUB6ypMAT2JtcongkbH";
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/UaY.fUB6ypMAT2JtcongkbH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Mon, 10 Aug 2020 08:11:06 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> please drop my set_fs tree from linux-next.  It is not going to be
> merged for 5.9 in this form.

OK, done from tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/UaY.fUB6ypMAT2JtcongkbH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8w6zQACgkQAVBC80lX
0Gyw6Af/dnAIhTY9v20Q1FEZX7FMIi+4CELeOIvbteK/AsBTGmZQ7Bhfbi6ugUA1
LnVBWdyGhQJGtSIZGrbKkLUBIunRk9nYmlY3yAe8mad08302E2uvQfLrJwr8q+GY
BUP+R8ko7sWweYD2S8LAR7W3dCZySjFtoEKs6WL3i7Ulb39BKpoQAc+aWRcAIkMW
sOcTJrYjaDSs4ZOoJQFgUtbozwaPKkVRN3iU57d+2QGraDs09v2eSY61rbup0JZU
Otot6cSJKksyP5uI0a+i8fxS5X6PdPVa4F59M5fhecNSGg2HSaKVWyEbI1UVgoNs
P4koAbElkhVeaPcfNvcgYV3rcovz8Q==
=G4eH
-----END PGP SIGNATURE-----

--Sig_/UaY.fUB6ypMAT2JtcongkbH--
