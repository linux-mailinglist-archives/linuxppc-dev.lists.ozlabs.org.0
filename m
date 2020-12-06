Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B54672D04A8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 12:59:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CplNg6shDzDqkJ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 22:59:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=wan.ahmad.zainie.wan.mohamad@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=jJODwUib; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CphgR3gwFzDqSx
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 20:56:59 +1100 (AEDT)
IronPort-SDR: XDLHDE+CJPbUrXZ2FYuKZsGmsQXLgoA7/ImDIdOa+L3TqSnUQ7z8FJ6GbdWI4h/IMWMgGHb80E
 Zu7vHtPk+fYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9826"; a="173725693"
X-IronPort-AV: E=Sophos;i="5.78,397,1599548400"; d="scan'208";a="173725693"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2020 01:56:55 -0800
IronPort-SDR: KhxUeEQd/syJmbZykVKhh1zEdmFK6e12NRRPY0/au+ifpaPxN3itLaKi9tmNrBMHnX9e2vgQ2R
 cLe1JYVa3TDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,397,1599548400"; d="scan'208";a="362713421"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 06 Dec 2020 01:56:55 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 6 Dec 2020 01:56:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 6 Dec 2020 01:56:54 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.54) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 6 Dec 2020 01:56:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOGXWzvL7rYXMOGyLG/SrXxu/LDXRKZYTrc57Sj1/bsBdrc/HXNEP9JMBgVl00yWqTf4/ckGK3W3IhDCohe3tVmAntOPUT+seEDgLtXmxJF7IsGkuwGhJM8RXpY0pNuZXL6XSMPniGif0DYDWRgZfoiixvzxy60i2r1IwR6S5d3ogZpwyW6LBZ5m8P8o0YAJLkNT6DcPT9ybEc0H/zsti+lnDvJFhGb/nPA0Qe7GDxzYQTR2BHMUczkwMXcDJCNeRU34Ft+dY0yPoJbjqVYByxYUUfz8hy3GX2swvkwlbFTvr37sAK8jUAin+GemOJTwU2SjLIuIPpB5TBHsV1kPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwN13DuImlzbBBF6LPQebFBrO5c0//za4wRcIfu4XTw=;
 b=aTvDgy8cDH92dKqOoiz318bm86217m0pXdJS1QXE2tniSyyYZvohuyxU1LC4D9Wj60AzOM03lHcf2yFhucls+aNW+VRm6US3h6Kfwf6u2N6pZHIIJt3N5KLw2jsgQY/aWzf1Mq+uh7tWlVCNlBKkUKyJepTfsHYJGcfcQXtpxywEfCduYdD9H7MkgDcxp9juEzCO4hUBibnMrpBocvywFr5pSIzQmop8HLNf3kLoTlBf9PC2HZCBNrK6Yw/+2arg9PCRmpbBfNE83WKMNBhk9CMiY0KCb8CJGvBAK6BThaBt7Ob0Z6yzNIG8BkUs6pOUFwVHJX+p+fuSDXIOZzQReQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwN13DuImlzbBBF6LPQebFBrO5c0//za4wRcIfu4XTw=;
 b=jJODwUibBUUjyyO5aCfYP3GolXtTIL96wWY4yC6IoI7E07VvWoYBrtg8hQHxfmRGXl6NK19gCtpr+iXFxOCe89GZIphZ6slnv7gRbsrN5kkoZi10cLVfxFLbpU7089Q2ksSHazhdEfIVku7x1MXbq03QPXHcotZ+qE1kOVUb6S0=
Received: from DM6PR11MB3721.namprd11.prod.outlook.com (2603:10b6:5:142::10)
 by DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Sun, 6 Dec
 2020 09:56:48 +0000
Received: from DM6PR11MB3721.namprd11.prod.outlook.com
 ([fe80::51e0:f848:dadc:bc01]) by DM6PR11MB3721.namprd11.prod.outlook.com
 ([fe80::51e0:f848:dadc:bc01%4]) with mapi id 15.20.3632.021; Sun, 6 Dec 2020
 09:56:47 +0000
From: "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>, "Nyman, Mathias"
 <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: RE: [PATCH v5 19/19] dt-bindings: usb: intel,keembay-dwc3: Validate
 DWC3 sub-node
Thread-Topic: [PATCH v5 19/19] dt-bindings: usb: intel, keembay-dwc3: Validate
 DWC3 sub-node
Thread-Index: AQHWyxrmBiVjzOaGF0u497ZUMOTKoKnp1GiA
Date: Sun, 6 Dec 2020 09:56:47 +0000
Message-ID: <DM6PR11MB3721E8FEB4E755328D7A517EDDCF0@DM6PR11MB3721.namprd11.prod.outlook.com>
References: <20201205152427.29537-1-Sergey.Semin@baikalelectronics.ru>
 <20201205152427.29537-20-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201205152427.29537-20-Sergey.Semin@baikalelectronics.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: baikalelectronics.ru; dkim=none (message not signed)
 header.d=none;baikalelectronics.ru; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [14.1.225.240]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66df4d4e-9db2-45cc-4b13-08d899cd3f19
x-ms-traffictypediagnostic: DM6PR11MB4705:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4705A42CFA47FB2CD1683701DDCF0@DM6PR11MB4705.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l8bN9Sr+unexKeVMOvp5qxu0thj52TP4qQDrg/SrjpPMgGdcLxaqo4a6I+Hn1C53+CH9Wz07YvizXNBemMLk0gZfNKvyfw6YpmEPDtxHOtvyLPf7hQ7cGmojM96En6ZDGkotDEzVsh+egTQ7UPGDRNCJyL+Rdc69TgXQLBJFghooKacIMoYvUrjktpxwo0R/HJ5zwV1Ak7DpAuQTjLYpFLG0M1/Vp4yya4+IWTPp31eeIuafJe5YWT4uFwmUm8Qcc+XLZQXyZbiHfqUKQZj7afeZS4qoCxW4XRWF6XjYgdTgE11/2zTz3p8WN8d5gJXLFy3SocQrSP3+zZ0DN2f6OQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3721.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(52536014)(6506007)(478600001)(54906003)(33656002)(15650500001)(2906002)(4326008)(7696005)(8676002)(55016002)(9686003)(26005)(7416002)(8936002)(53546011)(110136005)(316002)(86362001)(71200400001)(186003)(64756008)(66476007)(76116006)(5660300002)(66946007)(66556008)(66446008)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?k6pbexTVprzmcOUoyXXwJlSDP6D84muysO6D//mYTIKF2cngU3wl7K86KSBj?=
 =?us-ascii?Q?ffUoYep5iDCHgXkfP7O8cna0sTZuram9Z73qxG/Lxpn+si/aDycBNVKurGCo?=
 =?us-ascii?Q?ZMqZma5gaMWMEVunbNhcT928dw7oJXezgzxsdPyQ3AQ9kOxexepZCue5nafA?=
 =?us-ascii?Q?At0WQkpSVzicietwsMqNalUy2F1opdCHBSU1bzkMaDJ/vM5mRx+RTEehXpXu?=
 =?us-ascii?Q?X9qM7n//pXUt/QZUgo1IqX/iDyvN3+d3kiG/wDHN+AFNn6apE3f7Mzf1zqRM?=
 =?us-ascii?Q?+qQsiMNzsStANbnMpnI2uG1FgljZA/ld5OItYyZ6gz+Bf3jsHzgUKKGYb/ut?=
 =?us-ascii?Q?X43o4SXq9kfrjCQtE5MiubASLL4wzieTlZgDzjmLXk7xCVsgyHN8Rl6eX8q3?=
 =?us-ascii?Q?3mfrzwUhlka1Nk5mLkE+rP9yn0vOXKCXQbPSpAGuosFtXbsgs0Isn7in5nA2?=
 =?us-ascii?Q?faV0EqCyAObb6TY9gZbZc0TYC3o2WrtDXSDFc70xssnd3n9k7aRCTV+OU/IH?=
 =?us-ascii?Q?d+tNqUBscQ/cZTXNAr9BZftPne8Nrzfo7jcGYb2k6ik4yRMxR036N/MPZgfI?=
 =?us-ascii?Q?dVLRMBmQ2U0W5iYvnxzoJFMsDYL/RdtsgJ2WIu5VhwE1hG6I1QXMpNzXMhEV?=
 =?us-ascii?Q?bi+4G64Omyzuccin3fJavJlcZnkx8vm/3IAa8K8MzCUwwtAgWV8X44p5h9e8?=
 =?us-ascii?Q?osxMuifRpBSvcb2IXW6OSGlQu0y4lJ7iBM8cAbK7o6A6L6KkVgyiYDy+J+bi?=
 =?us-ascii?Q?F5zBVH4paXLrcDy0+tEC2QBeA7eUYhCpTb4C4GGe6whwJilX1hStTEf9LDaX?=
 =?us-ascii?Q?1eg11IjP/1R8S0sPgg/7utd+MG166kx3zzw4PqlnK91N9pV4tdDp4YltY3d2?=
 =?us-ascii?Q?t/6ncLVzpANYc6aqimRpQ09073Mgv8H6opsKIg5EjkiaEtnF/xxtBjj5zgQ3?=
 =?us-ascii?Q?J6nuT6KdyXA4LtnwpmXgEtHBDW/YAHtpjbzqu0RIHJA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3721.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66df4d4e-9db2-45cc-4b13-08d899cd3f19
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2020 09:56:47.8203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C2+f1NJwq3hUNjTioQIqBZJYhTdP6tFGNWlokZdSNFQoj/FWFP71WTHL/gO2IoKWCrgHQioPRuxqja9M3nbY1qQl7Ivw7Cwh7KgDjyLqC8k4uYELfS5ZSTg3qfYPzpot
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Sun, 06 Dec 2020 22:47:10 +1100
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 narmstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manu Gautam <mgautam@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Serge.

> -----Original Message-----
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Sent: Saturday, December 5, 2020 11:24 PM
> To: Nyman, Mathias <mathias.nyman@intel.com>; Felipe Balbi
> <balbi@kernel.org>; Krzysztof Kozlowski <krzk@kernel.org>; Greg Kroah-
> Hartman <gregkh@linuxfoundation.org>; Rob Herring
> <robh+dt@kernel.org>; Chunfeng Yun <chunfeng.yun@mediatek.com>;
> Wan Mohamad, Wan Ahmad Zainie
> <wan.ahmad.zainie.wan.mohamad@intel.com>
> Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>; Serge Semin
> <fancer.lancer@gmail.com>; Alexey Malahov
> <Alexey.Malahov@baikalelectronics.ru>; Pavel Parkhomenko
> <Pavel.Parkhomenko@baikalelectronics.ru>; Andy Gross
> <agross@kernel.org>; Bjorn Andersson <bjorn.andersson@linaro.org>;
> Manu Gautam <mgautam@codeaurora.org>; Roger Quadros
> <rogerq@ti.com>; Lad Prabhakar <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>; narmstrong
> <narmstrong@baylibre.com>; Kevin Hilman <khilman@baylibre.com>;
> Martin Blumenstingl <martin.blumenstingl@googlemail.com>; linux-arm-
> kernel@lists.infradead.org; linux-snps-arc@lists.infradead.org; linux-
> mips@vger.kernel.org; linuxppc-dev@lists.ozlabs.org; linux-
> usb@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH v5 19/19] dt-bindings: usb: intel,keembay-dwc3: Validate
> DWC3 sub-node
>=20
> Intel Keem Bay DWC3 compatible DT nodes are supposed to have a DWC
> USB3 compatible sub-node to describe a fully functioning USB interface. L=
et's
> use the available DWC USB3 DT schema to validate the Qualcomm DWC3 sub-
> nodes.
>=20
> Note since the generic DWC USB3 DT node is supposed to be named as
> generic USB HCD ("^usb(@.*)?") one we have to accordingly fix the sub-
> nodes name regexp and fix the DT node example.
>=20
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

LGTM. With minor change to fix the typo above, Qualcomm to Intel
Keem Bay,
Acked-by: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>

>=20
> ---
>=20
> Changelog v5:
> - This is a new patch created for the new Intel Keem Bay bindings file,
>   which has been added just recently.
> ---
>  .../devicetree/bindings/usb/intel,keembay-dwc3.yaml      | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/intel,keembay-
> dwc3.yaml b/Documentation/devicetree/bindings/usb/intel,keembay-
> dwc3.yaml
> index dd32c10ce6c7..43b91ab62004 100644
> --- a/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.yaml
> @@ -34,11 +34,8 @@ properties:
>  # Required child node:
>=20
>  patternProperties:
> -  "^dwc3@[0-9a-f]+$":
> -    type: object
> -    description:
> -      A child node must exist to represent the core DWC3 IP block.
> -      The content of the node is defined in dwc3.txt.
> +  "^usb@[0-9a-f]+$":
> +    $ref: snps,dwc3.yaml#
>=20
>  required:
>    - compatible
> @@ -68,7 +65,7 @@ examples:
>            #address-cells =3D <1>;
>            #size-cells =3D <1>;
>=20
> -          dwc3@34000000 {
> +          usb@34000000 {
>                  compatible =3D "snps,dwc3";
>                  reg =3D <0x34000000 0x10000>;
>                  interrupts =3D <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
> --
> 2.29.2

Best regards,
Zainie
