Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE7126B952
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 03:23:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Brj6336bfzDqP3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 11:23:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.14.49; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=ptumVNCr; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140049.outbound.protection.outlook.com [40.107.14.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Brj4H6j0yzDqL4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 11:21:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lKv36e03JNw73Wz5Zx/Jqikon59MhEINt2XsO/wSta+d0GbaCk0MqILFcklnOSrXVeY7dR2InOC6FPNCbh43x3aBqK4+DRyH9Do+j9SljWfEWAFOVsTHlhfTeKsvvV1XhWUXc8D959vT+cLouWJBDY2uD8ZAhcMLyr+Vik1rc1nd5gvet+pqsyK8sZUlb6cytBl/o1q0D9YhwDrr631HV9WmJcA1sDRuonJabwbVHzrCb/yru+zYDRAPxpwX7+O/g2UwLyT8ZIv0sphLZWBrCeV2GfnGFPqARG49ce3zKgtj0aUIi467mCJeEnac8xQ4GM/Z76txGGTVcLZNnrxypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRGZC5rV431h9+tzLJPeMOFuOcLtwkqQvIw1V4Btm2E=;
 b=HUqHQiX+axnJUNAMBn3hUsAWGCrD8TlildR57LJewOz+Ybg6QkWALVLJGFnKFtUiR9YCCDPP31f0rAzZx17Qj2HvVnP9bPTW+FCFRi5+neLLm+IOCwSuPMSnx2ppSetBO8hWVZAuXgcyK3z5JB3aQJlSY5jkolcJwp/MJMPgRKzLuvAkmuDVMc7Ci5DStAGp5MnCfJ34mQC4j8ZYRyXOiVB7rZHAlfJrIknYDwE0qNJtBRmNkheXWkGXiFh4nuJ8OrUeWEIfwGMiWaWe4VS5z0gjy+kCBWZTfHoFHf1qg3AfjLz//3jZbLxMhYvVJYh92scnr+sP1zOuNXSN8DbrlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRGZC5rV431h9+tzLJPeMOFuOcLtwkqQvIw1V4Btm2E=;
 b=ptumVNCrEWy9z41ZpqiyEBRCnS6mtun3JggcH6CEL0HUzHG1qciWdHjOwGpENatwzY6SsK2ZTtvIOWz4Y62/h68QLdp0ccAASY/LJpeu/agfAqBwkGyja0UhWWkohxoegz83lCZpAwAl+uOyNffpU5s66A3nDjVDF/ndcvqIw70=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB4742.eurprd04.prod.outlook.com (2603:10a6:20b:4::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.18; Wed, 16 Sep
 2020 01:21:44 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 01:21:44 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: kuldip dwivedi <kuldip.dwivedi@puresoftware.com>, Leo Li
 <leoyang.li@nxp.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1] soc: fsl: rcpm: Add ACPI support
Thread-Topic: [PATCH v1] soc: fsl: rcpm: Add ACPI support
Thread-Index: AQHWi1Bdrf69Hjks3kmx49279KDQI6lqdRfQ
Date: Wed, 16 Sep 2020 01:21:44 +0000
Message-ID: <AM6PR04MB5413CCFCC68AE2BF90C72C47F1210@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20200915110647.846-1-kuldip.dwivedi@puresoftware.com>
In-Reply-To: <20200915110647.846-1-kuldip.dwivedi@puresoftware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: puresoftware.com; dkim=none (message not signed)
 header.d=none;puresoftware.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4a2f0fac-aefa-4ab5-ce0b-08d859dedfbb
x-ms-traffictypediagnostic: AM6PR04MB4742:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB47428D2C733936A6164E224CF1210@AM6PR04MB4742.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Ioogp2HN9TNouBCMmIDEAlUUSr0chz3yEgSUb2gGLFtpQIxexAMz9nr9uNkxryCrISq77XTsAdWXbD/u+nl4GIcQdcnKPGbkzCq3/C3pka6KYQjDaEb4tn9Z32bRERxETQ45DQQ8tddwFuq9li0SIo5Wb1I0c7tPpPWnmRfQGoYD8Heuwr99POjxiys3J8V+1bdcE6QuAcSajiJZiVEBA6NKATmiSREnxHPPdRcaTT4n4S6temdlhxcLewAVCuZ5eReG+tJBYoCaeSl09AV2Vo+qu2xPjCRXzxLLOuJs3WsgJy8Yn73EgU8hwraZvX4DnQEfKB+63XqxkKY1dAgwierNgASE5TUKsq+gak0+kxFpe4lhDweSkT4QIrPH3HpjGpUCLap9blYXmXCJ+5jEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5413.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(76116006)(4326008)(66946007)(66446008)(64756008)(66556008)(55016002)(66476007)(9686003)(8676002)(7696005)(71200400001)(86362001)(478600001)(6506007)(53546011)(8936002)(110136005)(966005)(186003)(83380400001)(54906003)(2906002)(33656002)(26005)(5660300002)(52536014)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: speHqpjpby+LPx1DWzkqpz2e8L3ZiLOVpOWKkVyJhER+np7cAWNgZDFauQwymOv7/W8OlXAh/ZySPkYWtlBc9yo1bDo+mZ8QoDirHHOsiw5g4+WwDHqAN5YOE3ehiLOHFyz4B6HO1fKE44iLN+BSnd4bZp76DHgRN6TH4OpGj3pmLIc/XMbAx5Sj0VEHexabdhwyscmPSI+uW/N0JoMRre5p2BASH01f9TGu+I7A77TQikQ8hpgnIE00Kt0/gBBTG5tHwyIPLj67ESiu9ZrGzfOAERJoJwcf0nlINPgKcO7qvcZzmeP/orqjSHMscPToPCEydsURpB1n0M8fpA+RmuYh5MQ51gdNba92SOCt0ii40sutrvd7PHNDzUafCp9BTLKOfHB/HN6fVHbl3sc9cSMrsTueNASKcVuRXOoLxM2nPvEOBFq5P5dMVCNzRFGMIaOElaEkQDxbOhSqvoRxWWZcLX4ieNAG6KRa9IfFVxaWClAiYq6TRMl+ZLE/1s/iIifFbikSUYUDhAQ/VPvIVFVEYqC1gSNsMygzSJDbPwcRFA8uffgXsjZ6hAUPP92jfn8NTHfb8dJxl+8NUiQW442ifNNaOlSWuWQSFe+mgcBMWA3EseI/xlPdz9zsIetDG4psb7LDGaqVt126qxRSww==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2f0fac-aefa-4ab5-ce0b-08d859dedfbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2020 01:21:44.3494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DdU82NemEaJIFHg30ffA3HcTnMk6TJhJpCGSYmfROL9DchVNUkReFByxj942ZuCnkMnm6xsXEMdxi5kDxitWRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4742
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
Cc: Biwen Li <biwen.li@nxp.com>,
 Samer El-Haj-Mahmoud <Samer.El-Haj-Mahmoud@arm.com>,
 tanveer <tanveer.alam@puresoftware.com>, Paul Yang <Paul.Yang@arm.com>,
 kuldip dwivedi <kuldip.dwivedi@puresoftware.com>,
 Varun Sethi <V.Sethi@nxp.com>, Ard Biesheuvel <Ard.Biesheuvel@arm.com>,
 Arokia Samy <arokia.samy@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kuldip,

On Tuesday, September 15, 2020 7:07 PM, kuldip dwivedi wrote:
> Subject: [PATCH v1] soc: fsl: rcpm: Add ACPI support

Actually I also post a patch for this recently: https://lore.kernel.org/pat=
chwork/patch/1299959/  :)

Regards,
Ran

> Add ACPI support in fsl RCPM driver. This is required to support ACPI S3 =
state.
> S3 is the ACPI sleep state that is known as "sleep" or "suspend to RAM".
> It essentially turns off most power of the system but keeps memory powere=
d.

Actually the low power mode is to gate clocks rather than power down on Lay=
erscape platforms.

> Signed-off-by: tanveer <tanveer.alam@puresoftware.com>
> Signed-off-by: kuldip dwivedi <kuldip.dwivedi@puresoftware.com>
> ---
>=20
> Notes:
>     1. Add ACPI match table
>     2. NXP team members are added for confirming HID changes
>     3. There is only one node in ACPI so no need to check for
>        current device explicitly
>     4. These changes are tested on LX2160A and LS1046A platforms
>=20
>  drivers/soc/fsl/rcpm.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c index
> a093dbe6d2cb..e75a436fb159 100644
> --- a/drivers/soc/fsl/rcpm.c
> +++ b/drivers/soc/fsl/rcpm.c
> @@ -2,10 +2,12 @@
>  //
>  // rcpm.c - Freescale QorIQ RCPM driver  // -// Copyright 2019 NXP
> +// Copyright 2019-2020 NXP
> +// Copyright 2020 Puresoftware Ltd.
>  //
>  // Author: Ran Wang <ran.wang_1@nxp.com>
>=20
> +#include <linux/acpi.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -57,8 +59,13 @@ static int rcpm_pm_prepare(struct device *dev)
>  				rcpm->wakeup_cells + 1);
>=20
>  		/*  Wakeup source should refer to current rcpm device */
> -		if (ret || (np->phandle !=3D value[0]))
> -			continue;
> +		if (is_acpi_node(dev->fwnode)) {
> +			if (ret)
> +				continue;
> +		} else {
> +			if (ret || (np->phandle !=3D value[0]))
> +				continue;
> +		}
>  		/* Property "#fsl,rcpm-wakeup-cells" of rcpm node defines the
>  		 * number of IPPDEXPCR register cells, and "fsl,rcpm-wakeup"
> @@ -139,10 +146,19 @@ static const struct of_device_id rcpm_of_match[] =
=3D
> {  };  MODULE_DEVICE_TABLE(of, rcpm_of_match);
>=20
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id rcpm_acpi_match[] =3D {
> +	{ "NXP0015", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, rcpm_acpi_match); #endif
> +
>  static struct platform_driver rcpm_driver =3D {
>  	.driver =3D {
>  		.name =3D "rcpm",
>  		.of_match_table =3D rcpm_of_match,
> +		.acpi_match_table =3D ACPI_PTR(rcpm_acpi_match),
>  		.pm	=3D &rcpm_pm_ops,
>  	},
>  	.probe =3D rcpm_probe,
> --
> 2.17.1

