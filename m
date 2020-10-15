Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 283DF28FA88
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 23:17:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CC2DG60yyzDqbx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 08:17:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cerno.tech (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=maxime@cerno.tech;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=cerno.tech
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm1 header.b=VpK1rgiG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=qkJfUAlR; 
 dkim-atps=neutral
X-Greylist: delayed 348 seconds by postgrey-1.36 at bilbo;
 Fri, 16 Oct 2020 01:10:57 AEDT
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBrmK5ZR2zDqL4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 01:10:57 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id F0E285800F2;
 Thu, 15 Oct 2020 10:05:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 15 Oct 2020 10:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Z9xTzrKE90Xd3ra3VJfEuWMqFvx
 8M30d0ikEN/YU2Q4=; b=VpK1rgiG7CnlzeiebRXiMWglDV7yzG7X5v1zpJiZUjW
 NLjv4yySGF5TnuRaMaxipzyOynqWcM8LTNOhO1wLH3hbAE0bfb0lA3gpZtHjr9Vz
 YXCcoOPeGg6Ytvw6qG7uR/e2oKIGnQQb+aXfmcCEcOF3DWjyPawRyaFc3CGg8gaO
 3gaY7tXQ0AYcK3s1UumjHkOaTFNK4cbCEZjQj432SqGxsgs9sb4EWXiqcSTMo5op
 8wVfX0yhhNFIPiMEcOPXF6NFZIQ3BPVfqhTLphS/0okhYqMCBXyhji6h4mn3RgTh
 gjTWPcQktVK+tN/J31qLAPDt3MRtXF2fT/uiP9rkBGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Z9xTzr
 KE90Xd3ra3VJfEuWMqFvx8M30d0ikEN/YU2Q4=; b=qkJfUAlRyppCWMNmdIsZDw
 3wF9OAjW5ZbrOkPgof7keJFLQtMj7YVr1h8Ixeokwt+4QOD0AJxU7XxvJrRcXMu9
 4JyW96/V2Yr7jUyGvhOvmNc4sgKccvhDzMR1HRV32Mah4CkH84nk5IF3Z1xWh6xN
 IxrO4bgEAUwE4C6uXOZuvbuFAXjFrwrqW6LpDXmj+03vOtA9hsa5ixDd3c6NSdih
 zZEV94Y3NKXlN8+GugHjVD7QJd8awD7nYz6W9BlA1HFLE5+qdzmzBwhBFWvU0qwh
 BRDqF7I/d7C1sBvxLAxsRNXf/sGA/oKA+UgiCElmzu+i/6xXGQv5QhYQgpfgJPYw
 ==
X-ME-Sender: <xms:CFeIX8oKODlkVSjd0G1WqyqcdB9mZWzKnFunFnBn_DWbLvqoAWGGwA>
 <xme:CFeIXyowvBx2DQ80yck3i4p8icsdU6-rcDtrc-c6xpj0q2_XcFwii78awaNP7k8eU
 S4TxvM6DNP2Kj1fa-4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CFeIXxOWfhkddmN7eJ-75GBKo7cSfZpcLWxJKPU5XhJ6hAeGQaeb3A>
 <xmx:CFeIXz5kIq6_CTxLUEiN-M3kWq1KfGqOmEH6WR6oXN8MqSgVJzE9jg>
 <xmx:CFeIX74mIHRmeGiDN8ZIlDsb_SGz1dkETC0lRDqgT1WPX51sTScQcg>
 <xmx:DVeIX8OEcJRjikTroT85KOgZc0Ze9oIXDyey6A75lvN8S3rnYOu05A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E92303280065;
 Thu, 15 Oct 2020 10:04:55 -0400 (EDT)
Date: Thu, 15 Oct 2020 16:04:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
Message-ID: <20201015140454.mctkhgkhegwdnfxk@gilmour.lan>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <878sc8lx0e.fsf@kernel.org>
 <20201014143720.yny3jco5pkb7dr4b@mobilestation>
 <875z7blrqu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7qefs4ajnodpk4f6"
Content-Disposition: inline
In-Reply-To: <875z7blrqu.fsf@kernel.org>
X-Mailman-Approved-At: Fri, 16 Oct 2020 08:15:33 +1100
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
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linuxppc-dev@lists.ozlabs.org, Patrice Chotard <patrice.chotard@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--7qefs4ajnodpk4f6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2020 at 01:15:37PM +0300, Felipe Balbi wrote:
> Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
>=20
> > On Wed, Oct 14, 2020 at 05:09:37PM +0300, Felipe Balbi wrote:
> >>=20
> >> Hi Serge,
> >>=20
> >> Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
> >> > In accordance with the DWC USB3 bindings the corresponding node name=
 is
> >> > suppose to comply with Generic USB HCD DT schema, which requires the=
 USB
> >>=20
> >
> >> DWC3 is not a simple HDC, though.
> >
> > Yeah, strictly speaking it is equipped with a lot of vendor-specific st=
uff,
> > which are tuned by the DWC USB3 driver in the kernel. But after that the
> > controller is registered as xhci-hcd device so it's serviced by the xHC=
I driver,
>=20
> in Dual-role or host-only builds, that's correct. We can also have
> peripheral-only builds (both SW or HW versions) which means xhci isn't
> even in the picture.

It doesn't really matter though, or at least it does for what the new
name might be, but the old one currently used is still pretty bad.

The DT spec says that the node name is the class of the device. "usb" as
the HCD binding mandates is one, but the current nodes currently have
completely different names from one DT to another - which is already an
issue - and most of them have dwc3 or some variant of it, which doesn't
really qualify for a class name.

Maxime

--7qefs4ajnodpk4f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX4hXBgAKCRDj7w1vZxhR
xc/hAP46ODmwvjIPqwI5nlO3xwJrtwfpxoSlSPh1JvpLEN72cwEAjRtVXTcj4t09
7kGf6xqLq3NWxWeo2Ic3p5EpiWIBzgA=
=pGih
-----END PGP SIGNATURE-----

--7qefs4ajnodpk4f6--
