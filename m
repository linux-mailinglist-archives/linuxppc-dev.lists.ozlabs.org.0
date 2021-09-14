Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E57DE40A39C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 04:40:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7ncv6h6Gz2ywt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 12:39:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=RxWoqC8f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=RxWoqC8f; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7ncD22ZTz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 12:39:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1631587161;
 bh=NNLdb+tECq1l7xogf7Au1N/ustEDQllv2zv66oTGgyw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RxWoqC8fZvwPwEJrTLsNOSlk3DTOTx7zLVy+eV586m5Ls6i4NqwCow0eUFM/SpuMQ
 EoAdWDY7N5bKIRYzNFJ+QvNAT5B1SfOZhhK/ifPri4SAnkkJ10e4yYMMe6i471GrHt
 z3w1VgrWxo/xOOIUuTu2V/wSOXYmbNx9aqjCRwuEf3B9iZEXb1dAs3gapMlnAYkrp6
 sgPCnqWA9ESkqVdkge5pMu2WnB82/IzfQcPSLWh3gFgmgggMttfiYiMgX0KBnXT9XP
 pQ+DIMPN9wHQ2SHUjyKeHnFd0XTSRfgkba/EAvVzgr5U0pzXUh7gAih1n0NkuWpgg0
 g2GbR4VL4MbFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H7nc85xK1z9sPf;
 Tue, 14 Sep 2021 12:39:20 +1000 (AEST)
Date: Tue, 14 Sep 2021 12:39:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <20210914123919.58203eef@canb.auug.org.au>
In-Reply-To: <20210914120818.4a102b46@canb.auug.org.au>
References: <20210914100853.3f502bc9@canb.auug.org.au>
 <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
 <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
 <20210914105359.5c651d55@canb.auug.org.au>
 <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
 <20210914120818.4a102b46@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W27Rs8bNl2dBu3K5aSr+_f0";
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

--Sig_/W27Rs8bNl2dBu3K5aSr+_f0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 Sep 2021 12:08:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> That patch works for me - for the ppc64_defconfig build at least.

also allnoconfig, 64bit allnoconfig, pseries_le_defconfig and ppc44x_defcon=
fig
--=20
Cheers,
Stephen Rothwell

--Sig_/W27Rs8bNl2dBu3K5aSr+_f0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFAC1cACgkQAVBC80lX
0GyFpwf9G08XKB33hmCsxFax7/TDrvGw4LjQgaGMmSAGRyoNbUfaQDKufP6jlej4
w+ZJt8Dulpbi8y9gczXXtbwT65gU8jjK8M67ufP76UL+GJ5fcSqx6hwA8yq0RV2/
t5HaQd83VM+PzVpSsiAcqOhMntuZrbz3wIieqGgytFUKUKtpA2MfBSsH4zm2pD9X
uw/LtGyjsCk39CIMRBbeKxBbtMcrOaxnW/Q2JK5XEyTIT9LSInuHehh/xXQ9+I3d
Bnz9JabAJKl3ke5GkRX/pq97oenQNx1J0udAaztYdbeGg+me96aNohEPZkITLl5S
AV6jJUq3ruoETgb85CFKIjVoiij/kw==
=N9Ki
-----END PGP SIGNATURE-----

--Sig_/W27Rs8bNl2dBu3K5aSr+_f0--
