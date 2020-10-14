Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9B328E1F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 16:12:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBDr66QhjzDqpv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 01:12:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=balbi@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=YKV/QHc6; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBDnj4tdRzDql2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 01:10:01 +1100 (AEDT)
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B74722201;
 Wed, 14 Oct 2020 14:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602684598;
 bh=nXHNrmeiegcAFrQHpZXClaxYDTMwa1rlJ2izCsCrXN8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YKV/QHc62ApKcYfobKVgr7H4uuaIl0Ym5KPsO03PueFYTPIdAa9yS3LR0EwZ8HOwE
 TcL6jF+RwT4ABH1kDb5oHOxvnawJXJUclIoLNBHrYdepJyQT5rQ5R11/OPvOyIAMKq
 7ODxxrUbh0gZi9Rm21ebmCKNc4FTGHkE4lsI7GBs=
From: Felipe Balbi <balbi@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Jason
 Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Kukjin Kim
 <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?utf-8?Q?Beno=C3=AEt?= Cousson
 <bcousson@baylibre.com>, Tony
 Lindgren <tony@atomide.com>, Patrice Chotard <patrice.chotard@st.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Wei Xu
 <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
In-Reply-To: <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
Date: Wed, 14 Oct 2020 17:09:37 +0300
Message-ID: <878sc8lx0e.fsf@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mips@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Manu Gautam <mgautam@codeaurora.org>, linux-omap@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Serge,

Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
> In accordance with the DWC USB3 bindings the corresponding node name is
> suppose to comply with Generic USB HCD DT schema, which requires the USB

DWC3 is not a simple HDC, though.

> nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> the dtbs_check procedure failure. Let's fix the nodes naming to be
> compatible with the DWC USB3 DT schema to make dtbs_check happy.
>
> Note we don't change the DWC USB3-compatible nodes names of
> arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> in-source comment says that the nodes name need to be preserved as
> "^dwusb@.*" for some backward compatibility.

interesting, compatibility with what? Some debugfs files, perhaps? :-)

In any case, I don't have any problems with this, so I'll let other
folks comment.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+HBqERHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZk7w//f7M1cvtdCrKz6Ex3lntgWpy1b1/3CtTd
mvDjI3ih9c0Lb8I32xXaiI6KCbZ4eNrTj44yQGYTqyCX3MTK3XhtDsifpFsScl3V
HNZ5Aeru3C07GbrJgOm7anOpkrtOe8D5prOys0uLczDpjlK2nhg58Sy41jGaoqjH
X4AW8yiKWmvPhuqqX/vzqhYettYoS2B6bNL21uXqyfcmXubL2+WOBKoXeYrZUfd+
1xuyAt/jucQh8nhY5050kmbWKt7l5R3eUxe8be064Vi3n6CgDELde8+i+t3ULBkn
GzjZjv9cTjZXcd3qpLXLamKnCGSmM5ckc5O5sRKQHaBmtHuCW7SbH4/6iTJBv+n/
0WlVCedKu6N5OM3Q/+kfu33BDFfG2Dl6uK6vrt97G3jbx/IeddwccIGU9DmFfI8J
5Yv7hMCi9vPLxVNPCi/26FxsL7PmziOjofwUfuvP5ot8EKs90frsJCsE//ADssca
n+st1b+uqmK8qEtUigv9cC6h0DlrpzGTMyOwx4QBo4BN6YEICxzXq9wI/UOoZopx
tOoqi5JpD/2MpJ2qQhNLlsJ6voBSI4pMSGAV18RpSchZ5WhvL+IvFUU1gFsq7fek
MtrO6wBURV7ypfo9V7dWpM2trYsJQIWZs7x5nR8vnejZ/YspsdOcipU3QlKW+Eez
Pu/hVbbAotY=
=wmBj
-----END PGP SIGNATURE-----
--=-=-=--
