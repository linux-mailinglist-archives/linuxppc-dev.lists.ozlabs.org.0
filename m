Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 547AC33FEF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 06:40:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1G8329zdz3bwX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 16:40:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BSX6358s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BSX6358s; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1G7X3n6Mz2y8L
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 16:39:52 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC9D764EE2;
 Thu, 18 Mar 2021 05:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616045989;
 bh=bLb6B3Kwic8zqedLAeoNWlXD3yE5rWf/jO7SfuSY/Vw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BSX6358sGuNNu+JoPZDgITjf5dGGtU7ejVKRRXg5vh2jCemiiYA7c4inEDJbtdWML
 la8CdzSv59wsaVvV4D1lDNTWqkRT4bnIwto/+zW7zrCJwv+JxGvBseOblTa6Ylps9/
 zrEV88ovb7nk1/IgYYFeai67+kaLtcgqG8xEZOcvc2HQYreDy1NSd20i0ok6cjIIz+
 /I3dOfZFGmEaDGXnVxUN2ASyA14JqV1eyElNxCCqp/c+xBws8iNGRmEyFcr0+t0nqL
 yog+beSksYB5rrmeb4TgaNRYuMavtjxkJRQYBHlmN8OYRWCuy+rx74nk6MZXARV4/N
 qFpZ/C8aNuCAg==
Date: Thu, 18 Mar 2021 06:39:40 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Errant readings on LM81 with T2080 SoC
Message-ID: <20210318053940.GA1053@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20210311081842.GA1070@ninjato>
 <94dfa9dc-a80c-98ba-4169-44cce3d810f7@alliedtelesis.co.nz>
 <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
 <9c912424-2cc9-8753-1352-1a5c27722cd2@alliedtelesis.co.nz>
 <8e516ef6-340e-a873-68a9-71a10008f32c@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <8e516ef6-340e-a873-68a9-71a10008f32c@roeck-us.net>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The polling code is from pre-git times. Like 2005 and earlier.
> I'd say it is about time to get rid of it. Any out-of-tree users
> had more than 15 years to upstream their code, after all.

Parts of the polling mode might be interesting for the atomic_xfer mode
maybe? Which is not implemented yet.


--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBS55gACgkQFA3kzBSg
Kba2vRAAg5fp6fMbPzHqo6G9u5ftRMSPW6GewoQk8xj0lZdY8HiKBJYSnNu8CgfN
wSeXMwvz+9sXnvVmTTABfDhHwyTLe4FmMLmXEWCpkctH7JECfgwupch2+R7IcVON
SJl8Jc5/z08eUjiLIyHP4NpkHdMdkkZMdbLYnjlSyxS/i/GY0sKZDomm56103vY+
MKX4M/YT144LxfNX+T/cLqrSKbxJaz1lMqufo6McPs5oIzBljLMtffKD/nNyc6Wf
ht5XVJ2frzhO0iix3OXpnBpr5m6NpSNlnHGmaM+VhxRIpzomDyKJX4El1e0IKumJ
JExGPYROBbVvWjX1iuN264Gt0OrYmJ2GcIdKJWIwIzmoPTAM5/J3Zw+6924LPmqH
ubXDwwRJGt8pixJf7iYfld2KCoWbCqnp1HsiBtijP3x1/HzjDUquQ2BsIsicIX48
w7C7AXuhrF4tilLecUaAIN3Mfn1oYXBAvQyUNODkqSfiChtjZfuX9PvRpF0KZsuO
Z0hVjPQc/nDUvXXH/gA/81leJcGIO+xUs/sy+5tVYE/dxVflZPFue2Ub2Sapj+5N
lniAtiiFyTYUaMi3VqyyWbm/lyoHJCUg7euliN3km843nqMy9KAeLzClbpc5VzgB
R+lCzi6PJheLUgNL3l3lS50wDbMm1D6zd10Nvur58yOSeAGEpdo=
=Tea3
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
