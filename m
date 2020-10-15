Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E4828EFF8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 12:17:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBlZn4XvSzDqWx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 21:17:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=balbi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=WCURctuR; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBlY80bQ3zDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 21:15:56 +1100 (AEDT)
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2533920BED;
 Thu, 15 Oct 2020 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602756952;
 bh=Z6L85tl0hUzxc/Wf2yAWwRbRBy0g42YVSMNsAOso/ic=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WCURctuRAO7apKBpnigKSW4w0RrSEIpplBnDIjs+ve/o+8+46MlY5TmxYzakNSnGt
 wshd18tKRcbQS+ist8JlaxoOpSixojILJcBphDceJNvzEVJ7nc77SPULh7DZu7zIN5
 MdYW0FZqoioit4bvm377ZfhSD1iKvlH90Ra8372k=
From: Felipe Balbi <balbi@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
In-Reply-To: <20201014143720.yny3jco5pkb7dr4b@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <878sc8lx0e.fsf@kernel.org>
 <20201014143720.yny3jco5pkb7dr4b@mobilestation>
Date: Thu, 15 Oct 2020 13:15:37 +0300
Message-ID: <875z7blrqu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-usb@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wei Xu <xuwei5@hisilicon.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linuxppc-dev@lists.ozlabs.org, Patrice Chotard <patrice.chotard@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Manu Gautam <mgautam@codeaurora.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:

> On Wed, Oct 14, 2020 at 05:09:37PM +0300, Felipe Balbi wrote:
>>=20
>> Hi Serge,
>>=20
>> Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
>> > In accordance with the DWC USB3 bindings the corresponding node name is
>> > suppose to comply with Generic USB HCD DT schema, which requires the U=
SB
>>=20
>
>> DWC3 is not a simple HDC, though.
>
> Yeah, strictly speaking it is equipped with a lot of vendor-specific stuf=
f,
> which are tuned by the DWC USB3 driver in the kernel. But after that the
> controller is registered as xhci-hcd device so it's serviced by the xHCI =
driver,

in Dual-role or host-only builds, that's correct. We can also have
peripheral-only builds (both SW or HW versions) which means xhci isn't
even in the picture.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+IIUoRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZO3Q//SiuQrPc8kbjk55HntU2Nq2ql7KHubHOj
ZhrcegAbPbzA0vqIIasxjkXAC8Abbz3Bn59kDuu0ohRtTG1sKXMrN1aqkIo1tTh+
zkF7t+k5cdunzJ19jb0lohFu/eDK0JPuXRoByJfUhbxIZfWbacO7bG8TkClU7zhL
denO6pfQG1nOetdAaHZV9imMuTKJOrnl+bcHx5tNcV9sH02sC6OVXBn4dN5ZnABf
/FdDd671tZMcz43t7jm1vNk7yxgZPSqQ6myBeXQ45ZL2mn9i0gyi4eEWy29vLwu9
kVUhb9nrliaBsf/X/+oh05qRACLg/noIcuSpXMtu8tmR2DIcwDijYG8XOsBaDLEj
ZYSJju7/JQ2XUmrS2s/xWtjcqQN0ZxVsJx0Vy4JZNRQ404qs2cqjDeUFdclP+fdJ
90W74TKzXS1/t52pQyG84LSM648I/7PhUWara2RV9jds7XPgFuFCwWTxEKkyQCSW
ayPWVASHrKX0Kzp77GW2UUILCIo+luyMMd7V/BraTI6L+PMBL6+etB/O72UUXdb9
E2hQyJojMpg7BZ6dnpLcvbtHetLtW1hLisTOfD3NbPUyJzPJAgLt8D77SN5ncTUy
nC8/57GA0Bs2uzYEB6TlPV4i7c9tLT3MJrlVE/p4uziQ7R/b34xbHDX3xNcspk9Q
vO7uMM8lF9I=
=XrV0
-----END PGP SIGNATURE-----
--=-=-=--
