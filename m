Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938B273625
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 01:03:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwKjT4vWnzDqx5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 09:03:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.22.56; helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=B10rX5PD; 
 dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwKgb4W2bzDq9S
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 09:01:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWqNynVEaXzgxztBs76qd3i2Axvtiyo8jSR1zt4Ore8zO9TZLEK24jJCS8aP4oGt4g7t+M1259t+gRuE3hgtHbpTQaDDWvr0OJdr5H5TXIhhMG452U20U00kQKQ12uRg8ViF67P7Nvzp19NkZEzRt4Ib9M+Ui8SC5ul/kUhH2vZfMUZrebMks1EdL2XD6Dy6KNxSR8g+onR4dVdP5iM0XAxEHqYD+pGEJ3cxA/JmchtYN87jO+/uteLaL0JOXGGWD9P1qbzvh5ENWXstWALUTOGQ6cLvG7IutkwU20mEQ8Ppp9LtrVzoMXJ0mZr0B/xZ7U96It2S3Syo4TQjgZJiiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGOuLbNbJvJNR+v0K8n6vgxREEe21OIAyZWInQtVN0M=;
 b=ZlOSTgLVepT1w2cWiMD+/dEdjCO4pJXSvjDDgpQvtFWY8Upi5W5+vf2qTt554KOFjqxwSM8FHm+vTR6QqD1OaQ35Ioc8UeeGJjrwiup7vWjvNBmJBMj7LpPtym+JFuV+o3mYG6Mr674ZCVa+LzSfmLGCZTFFOvVzk1zhk1igvcToejm4rcmfN7N/2sKETA1iuBI8uc5ndlsu5ydq4uDcwK9aUtv+rKn0GY5IwMdOXvH7IUYNiq51bzq7K8KgwkhTAGNn5MbTnUKYVRsFmq8ioJkXVqnAzg7TGWAFvUOsjgKd4LoAm6wpo69F6JbeUbGK+pvDIRqH3rosMZq8oFMiZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGOuLbNbJvJNR+v0K8n6vgxREEe21OIAyZWInQtVN0M=;
 b=B10rX5PDBAxCuPsIVjWsMqPYvtBCyG3C/jNkdUv9Cd0PpZUVyPxQz4mTNnSa8+isOLJGMlT9luwNMPI1TExVELBudXnM9t0o9RY00nU/ggNtZ5LxiZNAhr0skAY3xiTZUkVzI8vtwbHhG9IuECrY+S9pyFDfogUaRPRCzQEp05U=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (2603:10a6:803:121::30)
 by VE1PR04MB7390.eurprd04.prod.outlook.com (2603:10a6:800:1aa::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Mon, 21 Sep
 2020 23:01:25 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d%3]) with mapi id 15.20.3391.026; Mon, 21 Sep 2020
 23:01:25 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Ran Wang <ran.wang_1@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>
Subject: RE: [PATCH 4/5] arm: dts: ls1021a: fix flextimer failed to wake system
Thread-Topic: [PATCH 4/5] arm: dts: ls1021a: fix flextimer failed to wake
 system
Thread-Index: AQHWjAMhcedYYapaJ0uByJ9LpdgQZqlzvh3Q
Date: Mon, 21 Sep 2020 23:01:25 +0000
Message-ID: <VE1PR04MB66877A1D86F74C026D83AD8A8F3A0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
 <20200916081831.24747-4-ran.wang_1@nxp.com>
In-Reply-To: <20200916081831.24747-4-ran.wang_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.234.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 79f8b505-0ed1-401a-28f6-08d85e82440c
x-ms-traffictypediagnostic: VE1PR04MB7390:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB73902C68E067F95C1DC1B2D78F3A0@VE1PR04MB7390.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:425;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GyCsGQJD24CGq1UE+/ftDLUGugMCeI+QxsCdFMAW7dYcu8ZUSzNdBEh30ywa/PwHDjEcsKHu4zn3jgy0UBqHGzxe5mivpehHREObJQnwxpg/ywFEvUsfVFhA+G4Aep3IWJQgeCbgcQ2mqIu0GdqhXjcd4jGCZv9713emkWMFmF3AV+vFYWi5y4xv7nyMnLVoYF/BKO+5AL3KxU0k+GHhrRovDvtDo8za0jd5Tl/7MJeAT0w53Fvr4npecM7jG+367fYSaJj2OVrcIDXHUhr2KKF7zyhAHrzX2rP8QIpBMzBaRMK6U/adWbyG+CoMcU/j97ezl6fNqdtebKksHeGlYeW/lTLsTSE0lOhNIx1RJFUiBAdlVcI+ZGD2ivsjl+Y+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6687.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(4326008)(9686003)(33656002)(55016002)(83380400001)(5660300002)(478600001)(52536014)(86362001)(76116006)(64756008)(66556008)(66476007)(66946007)(71200400001)(66446008)(8676002)(53546011)(8936002)(316002)(2906002)(54906003)(6506007)(186003)(7696005)(26005)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: B4uWlOfyt7YHu5L9BdenSiPqf/Etmt/KBQcZQ2OtNQfNbiF7m/YuC5mb3z3aMMFEt7GE5zuGM+ebEbVVq0QYKo1nNEfKzK+3EgKrki0XayyzKIXRy1klPhn8dopjSFghtCBXQXj9dWxZ0LbTbZ4u0VNcl3NWnd+sb0XEZt/0x1Dp4VlOv/owcbS6YHymxbvyAKwCv1GEa/4M7Rg/5S0P68+cU2r77rEIyWD/EKJi585lxJFZWfZNkpfes4Bi3RV6sFKFPIzfSV8przDXd4iu6wKXmDHghfy2rClLydvVsTXTEFes+I/vWizNuEF0Xbf7HdOSLCz74PGUcesp1GvMWI4l0/c4u1KkroGZHntybLupDmt0uNnqWXVWhiGDx/bzvlnBzjwiPEhphiz+8y7aD6a/WqTm44s8zn3Qw83UUIEEVTi2/dHi5oBrvSPys5Ll3uNI2lZ7ZuOdllpIsOJc4A8G2DEZuXJJoYd+KuU5Xqa20QxUfLNawshoK8V1ZE0XbJ6pU4mLP/keTuUv/D+b7Yi4S3lTZiFxLIlfpsJ2qCVu0RtMh0FroUtovU9klL1p4YhkRkZeR+zGAuIY+9ODAUEx+TkxGB+TXcTMmdSNfNfBawpgE9qkHBGrC/Boc6TvTcM2xc4B+HUcejfEcuXLOA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6687.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f8b505-0ed1-401a-28f6-08d85e82440c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 23:01:25.1962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0iHnp+5kbDvDbZ8RHGIdLVaTQTA6T6VkwNUNJhRjcez1BY6eyzQjrdG+ogfY/caqOa6d6UrafKT8NZUOut0e7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7390
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
 Ran Wang <ran.wang_1@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Ran Wang <ran.wang_1@nxp.com>
> Sent: Wednesday, September 16, 2020 3:19 AM
> To: Leo Li <leoyang.li@nxp.com>; Rob Herring <robh+dt@kernel.org>;
> Shawn Guo <shawnguo@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Ran Wang
> <ran.wang_1@nxp.com>
> Subject: [PATCH 4/5] arm: dts: ls1021a: fix flextimer failed to wake syst=
em
>=20
> The data of property 'fsl,rcpm-wakeup' is not corrcet, which causing RCPM
> driver incorrectly program register IPPDEXPCR1, then flextimer is wrongly
> clock gated during system suspend, can't send interrupt to wake.
>=20
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
>  arch/arm/boot/dts/ls1021a.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.d=
tsi
> index 089fe86..e372630f 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -1014,7 +1014,7 @@
>  			compatible =3D "fsl,ls1021a-ftm-alarm";
>  			reg =3D <0x0 0x29d0000 0x0 0x10000>;
>  			reg-names =3D "ftm";
> -			fsl,rcpm-wakeup =3D <&rcpm 0x20000 0x0>;
> +			fsl,rcpm-wakeup =3D <&rcpm 0x0 0x20000000>;
>  			interrupts =3D <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
>  			big-endian;
>  		};
> --
> 2.7.4

