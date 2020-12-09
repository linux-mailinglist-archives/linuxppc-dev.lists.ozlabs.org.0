Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7202D3BF7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 08:08:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrSnj02k8zDqsK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 18:08:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrSlt5Pn7zDqmF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 18:07:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=AbGdFvek; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrSls3kbVz9sW9;
 Wed,  9 Dec 2020 18:07:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1607497626;
 bh=y/7AxITvnZjCAk7hXsrFICRcD4MaIkQMcAoXL89bsy4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AbGdFvekqDdywfKyedVnYsS6DszF3DGKyEhnfrUaNxF7I85AhybRUQ7+GrmZ+Cu/u
 9dThE8/5mnORzUFIt2UKr1R99E4kBxVEPRgZr9gH5iqWG0SzxyY1Ofqk78gl4YVdUC
 MSki2Vzj6EVkCn+YM/WwUsIkxKnCzOgv8mk1lh8K1GfQstBWcY3//CvbghZZpztLvR
 97eTA6AuoyKFBbvJnIs+3HegHhhYcNZsywihOC27x8txYBcy7tpAWVq1oHLO+/ROzp
 c0AL0ObpZpgCd9OMnkCJrfzexfAvxPXkaboyKsm+YjfSo9pnCNh5rPkoUkwqfzXXlG
 7jDBrnELWuChg==
Date: Wed, 9 Dec 2020 18:07:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build warning after merge of the akpm tree
Message-ID: <20201209180703.404eb4cb@canb.auug.org.au>
In-Reply-To: <87r1nzsi4s.fsf@mpe.ellerman.id.au>
References: <20201204210000.660293c6@canb.auug.org.au>
 <20201208230157.42c42789@canb.auug.org.au>
 <87r1nzsi4s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HLUhotdS6r8oYyBamqDPwLP";
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
Cc: Kees Cook <keescook@chromium.org>, Mathieu Malaterre <malat@debian.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/HLUhotdS6r8oYyBamqDPwLP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Wed, 09 Dec 2020 15:44:35 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> They should really be in DATA_DATA or similar shouldn't they?

No other architecture appears t need them ...

--=20
Cheers,
Stephen Rothwell

--Sig_/HLUhotdS6r8oYyBamqDPwLP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Qd5cACgkQAVBC80lX
0GyQKQf+IQ7APd2lQVndfNhpMSaNqgjyM50ktUG4sbEP9NurjHT7RytwNfLgSPds
Tw+WEUKkkQ3tavRvf1jai+OKM/hpY/B8hKH7Kbzsl7WcPuGptAe/mKmTa0NO7Esr
gwDQoZbyrZ5vRYik99t7ozP8w67KrARiYLqKNqZYLTMRUPndMQ+OLcj8Pqb2Tqyb
IbFJaVpHo7b6bjUl/ZB0dmoUvx/7ApKijNTlWnRfg22hmN5km6lig5QTX1Qy1NXZ
UvWPtoWMdnMziy8Bw7pu2vq2Kk3XhJa2rykkB395QKOcnDTHtS2sBu2G8PQ0xG1k
k7cJRMZxz2nBd6FCJ7uSmlMxYy/gWg==
=fQhx
-----END PGP SIGNATURE-----

--Sig_/HLUhotdS6r8oYyBamqDPwLP--
