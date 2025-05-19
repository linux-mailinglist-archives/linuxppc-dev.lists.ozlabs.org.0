Return-Path: <linuxppc-dev+bounces-8665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 200DBABBC49
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 13:25:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1FjB4LTqz2yh4;
	Mon, 19 May 2025 21:25:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747653918;
	cv=none; b=fgZV4QpxGJGZEPzjKo6nTNW+jOKqzu4M2SibedUo3NgvDQhfaTNlAMnCBi+Pvfgt/p/Qc63u6GTfD4pj83tMQDRVawgC+2iCBy3PHfXNPQw6VcNywI3rgLRz5SIR6BcMyog2gAIwoJZ/bJ5pnN/8yuL9CeNKKktGVBq9UoenP0JypwPop+svDBDsikNKqA5lqaJv8aYsF5FCWdPTKVOSS9ieAHg1hFbLBECOrUit8gO7/6zcGgUVFWAsRl2+AqnrKaVoDl5Rl5ILiT8ZXd6VSt2RK8ycxq380OXlHHCALKViYYn6qqDIGYjYa6P9YVeojHTTbrxh+2v2Nqj8wnYwMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747653918; c=relaxed/relaxed;
	bh=36IoVoT4eq+7ZF/rX8bRL+EWFny4tTmAbZhfgFCP11c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIlad+/XVLTWgmkenXnUeqA3kDA2d9R/6tLnO6SE5V4iMpOc/eif6RUlHBZi/L3SZ7TPJPNV3F4RRKuflFFONRKBjHrSWopvaG83itMKVlT9FC4dmox3z5CEMcptUh7oWu0yRy3I9GZAu1FBkCnfoLJozDK16KkZqzeVoxtpPtMymcx2iRhQrd4iuwmqIocHMkDvZx5hQUwU5QhQIl1ikWUNhhkP5uISvSzIHO0Xh1qlPn31scHLq4kgYDYu9b/3amCArFrLt2/AagRj4ivoYyyKjnqfh0sVfyeDAl+/UKZDEOVRYbQSe3TFFqcuTTscz68hn8aQjzwff01546K/oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=OzNEMaBu; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=OzNEMaBu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1Fj92z83z2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 21:25:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=36Io
	VoT4eq+7ZF/rX8bRL+EWFny4tTmAbZhfgFCP11c=; b=OzNEMaBuyxabA3Up6lpU
	Uwu7GZgyHQd1WWlmiTBe4k8QcuMH7SkaoradHH9d1JZ7U0XkRK8jGzqBh2naCnvI
	Rcb9ybNV7zSVghQeuJCNVD+Cupftj3k5odeBLD/tB2P7kwvaspWxVKzDF1LjV666
	nb8wlWZEZNrIKDT6JIDTRtgi/RTx9gYfwrDcg4JVRvLYTkrZ4wJbDh0VXnXX+kT0
	OSqpLo55X9HMkFR1Mbvetq67sypzI/jLTJ2aya3XbXNjsVv2x4+YUaIDlX9eijFa
	/6E/0L0pHeEU1hREy35RcgDmn1JJxhxWgosgTpuTuzjtdVZPHwhjgn+t8GSb3192
	qg==
Received: (qmail 2458104 invoked from network); 19 May 2025 13:25:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:25:14 +0200
X-UD-Smtp-Session: l3s3148p1@dX23Yns1BthZz6+V
Date: Mon, 19 May 2025 13:25:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] i2c: powermac: convert of_node usage to fwnode
Message-ID: <aCsVGUAQ61zAgXMl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
 <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
 <aCsTjM49Ll2fcv4j@smile.fi.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tiLI6c0y3rR33YIN"
Content-Disposition: inline
In-Reply-To: <aCsTjM49Ll2fcv4j@smile.fi.intel.com>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--tiLI6c0y3rR33YIN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -		info.of_node =3D of_node_get(node);
> > +		info.fwnode =3D of_fwnode_handle(of_node_get(node));
>=20
> What puzzles me here is that of_node_get(). We already do the same in the=
 I=C2=B2C
> core, does it really need the second bump of the reference counting?

I'd think so. i2c_board_info has its own source file outside of the I2C
core because it is used before the I2C core is even initialized. That is
basically the reason for its existence.


--tiLI6c0y3rR33YIN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrFRQACgkQFA3kzBSg
KbZnUg//cWSynO4god04ylSSVdsm40lrGzy9pKWcKA4TjkX4svYytQJ2XCfHvxzH
hJ0LMgYgUBdXeekavG565XTQPXPRNKHhEl44LzwACGNa66WaFv3Vh8/TJW2ztRDl
KYo6l8HPSuXis09rYLWBf3qkRxJnt+fkgQXDPClSsbCqIgeWwlS9gmcXty5G3MSQ
oeA0u6I/KXKFNEHX3tQjMZsE/OZAJ3UAk4Pl8V1VSBEP1g4SqhN7ZWNIVevkvp+3
7JSXCLuf9NF3+pgjia4SSZplvPaEgjwlx9ObksoLmaxiOpz0BxHUq8p/IF9+Sh2f
BxZ4zKTYup0Mh5swuFd9WxzQ9azCWnZRRWyqgGBFVZqvrzYuHdEoG6A1ds4WqO+Q
wwXMfafZQ3msIgj79G/R6MN9p3FnmioqC/yQsFvG3a09pm6AoKH1egP5mJajhu8a
Y/a+EA4KDVLyoyvvNvAtF+kbuo8nOgwWT8p/VsY3oshBdgHqU7KisQumGbSV0aET
FGNhU0ScWo4d5pNQSAGNNwbLhe23tFBizJtYHVPHr1/xgjzsnNwa0/8Y+L1ZGbk1
IpKmLzJQZgGi27y74OfHH1kS/F+L8NK2twPABlsmPxM2GZ12oms6XE6hcuKtIWQ2
RK0QukhGpazgEJ6zAVT8iARfUXV+Ix1O63467sgm0GTY//DrQcI=
=paet
-----END PGP SIGNATURE-----

--tiLI6c0y3rR33YIN--

