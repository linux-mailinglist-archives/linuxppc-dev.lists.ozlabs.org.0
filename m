Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F2214A34B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2020 12:51:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 485p3l3MF4zDqCY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2020 22:50:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::628;
 helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=gQ0lmTxP; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 485p1B5ypDzDqHb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2020 22:48:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MW/W5G30m4Abg1GX+PpCtMUbfewF9Gkk5+AirIvewy6ZxedIgn8IgR/iW8ipfy++4AqcuIQH0bz7+OHd3TUM4d1fXMGdXrWcmYMDgDIRcIv1T+oFo6W53VX62BYVz4GA0OHSQttjpZgmk2bYwAs6Oop4SkPsFQbG/zr3t/M2scqlpA7DSovXo/gVjOiPRjxdCgfFLPKwDLlr4Usy76IAg0XWUWWiJU/ybnmo5vSe7z7LIeRZRQwwmE/2645PNLQVGV935+N0NHSx3F7tHcgqESx76YAIQhuxADhFt7ZVLrdx5846y4S37Za969AEzohelKkznuXsgZunPCaFbQik4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymtPsovAOyqb3Q18H1slA4uWD5aoakipgNTgV0lupCA=;
 b=WD7zxhfIegfIEzaD+n4crI9Y8iuD3qZ8wF94nI3Q6EkX8tOp/lDEPHCaL8t5epU4ExIaSZtsZy3Vgt158MCTAU5ll76SkgPltcPKLsYctOYL1IhpKnKO6aMGtRJC69rF6dr8H52ZEC0wwrETieR2BiTxpDX9fr5zeLn1lbKin1ygCP77bO8V8yBQauItQidPMwurpPFbwmOOwF910WJWJTy0dh3vLoowVdmqE/8dSWN+kRX/xF9tzYvWR80ccKUqLW3w58BfmRRdGhylets+0SrsA1YeiMknioCzNUw7tOLqEwFPRxxvYV3SvV+cOlovr5pSxoSrZex0/puIgPKHIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymtPsovAOyqb3Q18H1slA4uWD5aoakipgNTgV0lupCA=;
 b=gQ0lmTxPclusz4mO54O2/yvbzBD9MHXHxpYjLSGTlwD9nYxfT3Bt2NZ3aXSBEEKk2j2MYPuEIFd5MCe32kS7ec5av3KhtC+EnmqdKN/0cc0a+ARn28/mkFjPsqAyWuPyig3tdGvb9YL0WmY5B94AH9QGVfggI5u9Csgn0MCkeKE=
Received: from AM6PR04MB5878.eurprd04.prod.outlook.com (20.179.0.89) by
 AM6PR04MB5733.eurprd04.prod.outlook.com (20.179.1.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.22; Mon, 27 Jan 2020 11:48:36 +0000
Received: from AM6PR04MB5878.eurprd04.prod.outlook.com
 ([fe80::bcef:1c59:7d27:d0e]) by AM6PR04MB5878.eurprd04.prod.outlook.com
 ([fe80::bcef:1c59:7d27:d0e%6]) with mapi id 15.20.2665.026; Mon, 27 Jan 2020
 11:48:36 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: Andrei Botila <andrei.botila@nxp.com>, Stuart Yoder <stuyoder@gmail.com>, 
 Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH] bus: fsl-mc: add api to retrieve mc version
Thread-Topic: [PATCH] bus: fsl-mc: add api to retrieve mc version
Thread-Index: AQHV1QNKvLjP3UuObkmXzkCe27o2Qqf+ZGRg
Date: Mon, 27 Jan 2020 11:48:36 +0000
Message-ID: <AM6PR04MB58788A33BCFD161773375C8DEC0B0@AM6PR04MB5878.eurprd04.prod.outlook.com>
References: <1580123761-19536-1-git-send-email-andrei.botila@nxp.com>
In-Reply-To: <1580123761-19536-1-git-send-email-andrei.botila@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.tudor@nxp.com; 
x-originating-ip: [81.196.82.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fd754c66-b5f5-4d03-7277-08d7a31ed842
x-ms-traffictypediagnostic: AM6PR04MB5733:|AM6PR04MB5733:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5733116E21274E3A4F67EE83EC0B0@AM6PR04MB5733.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02951C14DC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(199004)(189003)(316002)(6636002)(81166006)(4326008)(81156014)(110136005)(54906003)(8676002)(55016002)(8936002)(5660300002)(9686003)(44832011)(26005)(186003)(52536014)(64756008)(66946007)(66556008)(66476007)(7696005)(2906002)(478600001)(71200400001)(66446008)(6506007)(86362001)(76116006)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB5733;
 H:AM6PR04MB5878.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +fKF/rcnl/6CTRJtBrmqufBwIWvO94RIsyaK+m/wcIegJNzSILtOaGv58RK/rTbdkMFQUz7tb7hz3HEnm2befIiwNB2Z71yYWqW6yofeuzbmAkbBs3N8fPhZ5egsed/VvlmdOx+lNSA2LPLDi3dKoXAK128uK6DqV4ImYCnPl6dH+X2TJu3KhdSzSC7zMwjW9gchoFiTUEKeCcbKkMXBOocesP5xyUaoU0lqvGVHZBQwiLzcCvkkA6LKXnpdhPUZCT9YfuJBXY8W5CGxrHggU1fYrid2CcYsYVZm4WNwbmMSoFGk8g7SE1PyLxMhcAO/GbfbzNhjJVaRFIy+I3Tdrw9IBHRJd+OjUSmlW4vCQlT0K9diuLud6OLR3m2JfowkJohFA9r86Sx0KHqEkdg6qvQ6tL+jE9p2bL4RhSHTMo9QllD1boI3Ei5DwBViVMwK
x-ms-exchange-antispam-messagedata: GWmE5sQo38H72xZ1jkzz6doKnptGJhtlJmwopuKaWwuf+5iERT91KNhjI7OlMPk2weO44RElxo0IvkW3aX4yhoWBihKh3riRdok6KztD7gWQNl+LARcmPbdd6/O+Gv5JHn55hFCmcQR1MA4QQOQwvQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd754c66-b5f5-4d03-7277-08d7a31ed842
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2020 11:48:36.8144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 338bzBq0DVkV3ynOiqaIVaEQYWca4XYzDLSLorl7RUlBKKMKw4PVv1IWOAUjDVsuM8kEiMcLLfi9ppvo0iPeVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5733
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrei Botila <andrei.botila@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> -----Original Message-----
> From: Andrei Botila <andrei.botila@nxp.com>
> Sent: Monday, January 27, 2020 1:16 PM
>=20
> Add a new api that returns Management Complex firmware version
> and make the required structure public. The api's first user will be
> the caam driver for setting prediction resistance bits.
>=20
> Signed-off-by: Andrei Botila <andrei.botila@nxp.com>

Acked-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

> ---
>  drivers/bus/fsl-mc/fsl-mc-bus.c | 33 +++++++++++++++++----------------
>  include/linux/fsl/mc.h          | 16 ++++++++++++++++
>  2 files changed, 33 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-
> bus.c
> index a07cc19becdb..330c76181604 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -26,6 +26,8 @@
>   */
>  #define FSL_MC_DEFAULT_DMA_MASK	(~0ULL)
>=20
> +static struct fsl_mc_version mc_version;
> +
>  /**
>   * struct fsl_mc - Private data of a "fsl,qoriq-mc" platform device
>   * @root_mc_bus_dev: fsl-mc device representing the root DPRC
> @@ -54,20 +56,6 @@ struct fsl_mc_addr_translation_range {
>  	phys_addr_t start_phys_addr;
>  };
>=20
> -/**
> - * struct mc_version
> - * @major: Major version number: incremented on API compatibility change=
s
> - * @minor: Minor version number: incremented on API additions (that are
> - *		backward compatible); reset when major version is incremented
> - * @revision: Internal revision number: incremented on implementation
> changes
> - *		and/or bug fixes that have no impact on API
> - */
> -struct mc_version {
> -	u32 major;
> -	u32 minor;
> -	u32 revision;
> -};
> -
>  /**
>   * fsl_mc_bus_match - device to driver matching callback
>   * @dev: the fsl-mc device to match against
> @@ -338,7 +326,7 @@ EXPORT_SYMBOL_GPL(fsl_mc_driver_unregister);
>   */
>  static int mc_get_version(struct fsl_mc_io *mc_io,
>  			  u32 cmd_flags,
> -			  struct mc_version *mc_ver_info)
> +			  struct fsl_mc_version *mc_ver_info)
>  {
>  	struct fsl_mc_command cmd =3D { 0 };
>  	struct dpmng_rsp_get_version *rsp_params;
> @@ -363,6 +351,20 @@ static int mc_get_version(struct fsl_mc_io *mc_io,
>  	return 0;
>  }
>=20
> +/**
> + * fsl_mc_get_version - function to retrieve the MC f/w version
> information
> + *
> + * Return:	mc version when called after fsl-mc-bus probe; NULL otherwise=
.
> + */
> +struct fsl_mc_version *fsl_mc_get_version(void)
> +{
> +	if (mc_version.major)
> +		return &mc_version;
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(fsl_mc_get_version);
> +
>  /**
>   * fsl_mc_get_root_dprc - function to traverse to the root dprc
>   */
> @@ -862,7 +864,6 @@ static int fsl_mc_bus_probe(struct platform_device
> *pdev)
>  	int container_id;
>  	phys_addr_t mc_portal_phys_addr;
>  	u32 mc_portal_size;
> -	struct mc_version mc_version;
>  	struct resource res;
>=20
>  	mc =3D devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
> diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
> index 54d9436600c7..2b5f8366dbe1 100644
> --- a/include/linux/fsl/mc.h
> +++ b/include/linux/fsl/mc.h
> @@ -381,6 +381,22 @@ int __must_check __fsl_mc_driver_register(struct
> fsl_mc_driver *fsl_mc_driver,
>=20
>  void fsl_mc_driver_unregister(struct fsl_mc_driver *driver);
>=20
> +/**
> + * struct fsl_mc_version
> + * @major: Major version number: incremented on API compatibility change=
s
> + * @minor: Minor version number: incremented on API additions (that are
> + *		backward compatible); reset when major version is incremented
> + * @revision: Internal revision number: incremented on implementation
> changes
> + *		and/or bug fixes that have no impact on API
> + */
> +struct fsl_mc_version {
> +	u32 major;
> +	u32 minor;
> +	u32 revision;
> +};
> +
> +struct fsl_mc_version *fsl_mc_get_version(void);
> +
>  int __must_check fsl_mc_portal_allocate(struct fsl_mc_device *mc_dev,
>  					u16 mc_io_flags,
>  					struct fsl_mc_io **new_mc_io);
> --
> 2.17.1

