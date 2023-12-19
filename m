Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA552818DDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 18:20:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LzdQPjoA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Svk384W3yz3cTn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Dec 2023 04:20:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LzdQPjoA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Svk2N0MNMz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Dec 2023 04:19:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1FAC1B81598;
	Tue, 19 Dec 2023 17:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDDAC433C9;
	Tue, 19 Dec 2023 17:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703006359;
	bh=SYX9p4gi9+/zBHEK/mikAFU01h6uY5iOIkUyj8418Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzdQPjoA8VJRjFK/J/ijbwQbl+1YZusNVbJGMESqfmz6i4K8ARaId/cPS7xp8H7hX
	 yycH8QMD9Q0/1VlvSkCzEntfmHLqfXjUnEHT60n/I/+TRAGEr8p8qyl1LV5sggL3xS
	 y7HV2oTyR2QcBsFypQWndXdTmfnNKz5BtF/b6BwtcwurpRtK22NGSKi5s3tP8znhaB
	 6tXNVENf/fpCX3YwE5pxp+q1W7jBvJLNMLZeO0SJPkoQrO7vtqXB533qDdL3vbdaKB
	 uUl+EgjDvyidVnEiXNOS2XQc+wzRv5lYumPDOXl1Kf/fYolCZkREZ5WScGvWsTau0r
	 dbaPW36yjizgw==
Date: Tue, 19 Dec 2023 18:19:16 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] i2c: cpm: Remove linux,i2c-index conversion from be32
Message-ID: <ZYHQlAVMEnkXHwtb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jochen Friedrich <jochen@scram.de>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	kernel test robot <lkp@intel.com>
References: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AMQaoeTeSrN0+RF5"
Content-Disposition: inline
In-Reply-To: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Andi Shyti <andi.shyti@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--AMQaoeTeSrN0+RF5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 11:24:03PM +0100, Christophe Leroy wrote:
> sparse reports an error on some data that gets converted from be32.
>=20
> That's because that data is typed u32 instead of __be32.
>=20
> The type is correct, the be32_to_cpu() conversion is not.
>=20
> Remove the conversion.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312042210.QL4DA8Av-lkp@i=
ntel.com/
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Applied to for-next, thanks!


--AMQaoeTeSrN0+RF5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWB0JQACgkQFA3kzBSg
KbZWhA//bbjGBdyZHdVcVAiA7PwvcpVpxon0nuv8UUlQw4f7YcS2Gr8bTlc4woz2
pw+1L5kBKNoi7qWriqTYKqbrVJC3wH7/5sgrqA/IwnrEK9RljFheI9SxchAkxmdT
noTN6/DJkHCkGMpA4fW9pictdQXqx3CDH4rWccdR0qUfxmEgEqF4B2NakG9UOzSZ
EmKg9mRDTxq/2AFJbjVYrDtSib0ZCzjoOXgrbgFgvqg4nVwgiXBL8g/R4gPw6p6U
eRPo1D8HN8mTAsEutx3ZfPbQCjxnNLKNbipzviFMCBli2ZdtnxoGDpSSCFzAVpG6
FQK+Sc702ZE+kiGRSQczvTsrAinv0JCDObNG8jFJxgtlk2ddzW29ECl36gw76lYJ
5oKF83Qk91r5b5ZovnOhTTFAPJPw0pUCKCpnnH7ryP1/t0OSj5VB9z2cJz90tw87
Pudw4Ev/HG9XyCg1DPDTsD26fdixVVUmQs1dPBd7iItCNhKqL6mVXJv08hOemp2l
7f4N/6nB3ovObXkkgTKTzEFuAssj9Iko10S7AHxmbUeTTVRhUcbj8YlYBQ3EotQB
O4KJNAjGU4hiJrRZEuJ542zjkPvCd/xSpDC8KTGHCOwV7UVua5RT76D2UizpQ9Jf
ncmuWJb10e9gzMPAvudOao7rZdrMJsGFfugi6CEXeRxa+7Ol0QQ=
=BGje
-----END PGP SIGNATURE-----

--AMQaoeTeSrN0+RF5--
