Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CE63734C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 07:46:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZm1L3bCbz30Ff
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 15:46:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=HWCBOcxr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=HWCBOcxr; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZm0s43ZRz2xfp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 15:46:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FZm0j3tH6z9sRR;
 Wed,  5 May 2021 15:46:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1620193574;
 bh=wApHHOtDSJWFYUVgVqWGMm/xWrWFB/6uOr1gW+gaYqs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HWCBOcxrvUtyOD9IAmDMNTxrzh0FIa4vnV1jf6Kxhxd+oXMSbawXfC/7VPoQMlt63
 ob50wGzc60fy6MM8w8Mye5RjKKLKxF45/ssKb3fzFSOgZITxyS/UnNRQqSCANvIYxm
 JTqRRw8C3U+QCHaMLNYxgsTLB6VZQUmiZohUq4G5jukLOVgQpW08dVOtxHYNe9DyEM
 DiN2c6uKLMfeSH7TZCQksyI0lOnDfnzD2iaKXe5kwV02atqDjGDD3DiZIPzZcUgsSt
 wE2u7n3i8OaEqomjdeYsCbdFxUQG3hUiKeF+Te3xn0291KVF1bdrxyji0ij69bFmQu
 97AGMXsEZwsbw==
Date: Wed, 5 May 2021 15:46:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc tree
Message-ID: <20210505154612.514b1779@canb.auug.org.au>
In-Reply-To: <87wnsd93rl.fsf@mpe.ellerman.id.au>
References: <20210505113959.43340f19@canb.auug.org.au>
 <87wnsd93rl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//z8aK/HK4ZSVA=0YSLM2hYG";
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_//z8aK/HK4ZSVA=0YSLM2hYG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Wed, 05 May 2021 14:57:18 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Urgh, I did check linux-next to see if that patch would conflict but
> didn't think it would conflict *that* badly.

Its not as bad as it looks, the akpm-current patches just added three
selects and just need to be put in the proper place.

--=20
Cheers,
Stephen Rothwell

--Sig_//z8aK/HK4ZSVA=0YSLM2hYG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCSMSQACgkQAVBC80lX
0Gznkgf9GdW0eJlCaVO0o4bXI9ZF4pTCI0iJGRcD108K+NgqzZPhgm+2qMalombw
0E3NUlg5DKxtctuO6G8afAjer99FdaB+19gT/2rfCM6NT78PrksIQDqpbQPn4VlN
K1AkK873BW2VHWGZDrm01chQDcs3FVKBhRvLz3+K7omo0hI4rOMoKaTK3e6sdDDm
s9TQ1xnJLidnbm/mWO5RKh6i9urqLTLZ012brxlet9BiFkxyr8BdLJ0g8ba4rzyP
OZ0+sZfn4pLQvMPDIijni/Z2Xvzvb/EBdXP22ux+0D6vFc5tQGpHh8WhJ5Q7DTsr
UPca4LiTLxbkJCZeF5qZ/MD/nAlQgA==
=f3Gv
-----END PGP SIGNATURE-----

--Sig_//z8aK/HK4ZSVA=0YSLM2hYG--
