Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AC5250873
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 20:48:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb1NR1KS9zDqDb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 04:48:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.21.50; helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=f2HNT4N9; 
 dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2050.outbound.protection.outlook.com [40.107.21.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb1LQ30TvzDqDb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 04:46:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPgV0gDOfPfy60A4BH7SjzWbgn3vMaBf16030ZGpXmlESktcFc9wEVoqTgUQ/y45mmdRmCFyv5MpnXzIiN09Yh64GjNRanuWZV1SqYdU5odQcdNKkYT61UPmW5JnwDuIEMbiqpa37KTa10F+IPu/4qeqrm1EEmrPoJBuQUBw0pFn7lkWUYgUry9weCR5KeoTaG3nARVTf8q1b2Zz4MM1ou9acoCy2Gq+EA/SO5zoOZGMdovD9g5aE4jaeluNajtPkeWWLwW43Z4WsK0FmNHXg2ve0IzyC8rT/6WBu0DKNWmkI4GfvhxY50SI2ajcU9IVrbJuezTfnCApmyLsgheNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jR1k9SgR/0XxlULt/xVupuRjW6+3psfngBRhkl8XAxE=;
 b=D2GRSujtnae4WiDGpMmc0yqZ6muEiwiuACcq2mtRYDFtST+SQ7uJO9m/UsHDuQA6297LJPou1+XvUZJ1oO32SFcJHU6o+C33z8gfSJpWT3vKVzUQg7hQioEt+nwb+KYKxo6UMely3FZtQV7hIuKI5wpGhyXUtsrbF5U29nIkEK3I3+5mMCF1j77wvcLWz0e5kyYxH2KHGCIAZX3qA4aCjMOCxgW1ophXd8vPwlj5I1ByJgMOk8f+gfaMWAko156jJTbP/bHOaXo/ptkpd4FQoDfdMbd5YwVg8dOtZ9SXg+FnUq+AHkzfcS0LZOPA/2FeFL2WVXLdXaavBoUUGbOnzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jR1k9SgR/0XxlULt/xVupuRjW6+3psfngBRhkl8XAxE=;
 b=f2HNT4N9jq5Y7UNtyxRrgHwerW+QGcNPAA9XOU0Pxr9Sye6fzY8GZg2hABMhd62PPaqvIDKyP/ZwLAzZC2bt+DUDB3laA8v3gJwMXiq0fFmPrjYawvktriaMuCfIJKMUpTwq0k5jWdWBbWDemlvjfPPn9+JA45n7OOZpoH8+1mA=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (2603:10a6:803:121::30)
 by VI1PR0402MB3343.eurprd04.prod.outlook.com (2603:10a6:803:8::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 18:46:21 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d%3]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 18:46:21 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Ye Bin <yebin10@huawei.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH v2] usb: gadget: fsl: Fix unsigned expression compared
 with zero in fsl_udc_probe
Thread-Topic: [PATCH v2] usb: gadget: fsl: Fix unsigned expression compared
 with zero in fsl_udc_probe
Thread-Index: AQHWefKXSYMnYlOdLkmAODAMRUk7talHmbLg
Date: Mon, 24 Aug 2020 18:46:21 +0000
Message-ID: <VE1PR04MB668787116F273FFDEFBBF84F8F560@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20200824084234.232179-1-yebin10@huawei.com>
In-Reply-To: <20200824084234.232179-1-yebin10@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.234.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: eea08eda-a819-496a-7343-08d8485dfed0
x-ms-traffictypediagnostic: VI1PR0402MB3343:
x-microsoft-antispam-prvs: <VI1PR0402MB334303476561816EC40FB00B8F560@VI1PR0402MB3343.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZtAoz2rIwmzUAayNBbOQ2uZif7F3i89UvA92gGuTXT0AeILj0DPsHC2uZ1a3HbC4QWpCMbMm01gxBk4/s9/9YcO/FK97PJQU28vr/pwd2r8AHWH7jslTGDdA//U6z4ioKX9O1ZcQWlbC3+tTAaV36/rXnShap1QYxskBYtZ41Uer426iTTXOSsxwndq4GPYj6e8F1CK/AxhTBbzRVbdtIJMWOK213tL9sMPux7oDR2SpFYBH5Uz1y241DnWd/BuG8wcs7J46FTjCjpZzsnSlBtso7v6g1I+U5bqYk0YgGC2/vj4xU3LQVX9k8jaQmV0MyPTIMRoeVteoJypG5SVVqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6687.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(7696005)(53546011)(2906002)(6506007)(55016002)(9686003)(186003)(478600001)(8676002)(64756008)(66556008)(66476007)(52536014)(86362001)(316002)(66946007)(26005)(33656002)(76116006)(5660300002)(83380400001)(8936002)(66446008)(110136005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: gOOnt8lyOebB6BLPnPkA2BnTcm4QwA2g0JiThW9bWTJNsAVXCqZiNN0M1qJCNCGOnAbk+CqEiWHMGI6lXY7RsPhKx2WIwvAETA+54pIzjW9l9N2x/RwWckHHvMh9pOZrNQ/U1heTZM50sdCzoFXk9ujUDTuX70RrF9zAc5zKnmBa1Ujik4s/Kms+zI9iv6qRp2TRffAO0IkqklITDuggKRKbzLeEgI5dl4T2iVhfqIC2kR+rVaRGIHa5tkzRWJwrBw08eLketOWCtzckiitJhbfC8kawNBQvGfDBGvxrZ9wFAjX00J/o1wI0srhK+z34SvcmXF1vG34oG4Mo8fZH9HIlm02ahddd/4ocrLWC95GzlCzeP6pYjxibfNev7K4CbJ1GKMsb8/3tZ3pmXMVsSWcv9lgZcaQJo5OnveCwj6sHuod+lcsNGFZmkrrSmt3iyIJajMCqW+cV3abPu9MJI2FgL/99CR3P0F8KnKYD003f+L+XLwpCXGg/jddAlm+1ZL4QTHFWhqJA10sFWU4KiIuwqKfDV4x5jTZMNHNp95yLkrTKe4lel3mI4YZJ0PVFQtcm4lhrliLeb5kPU4InURGU9t2K+C1yJI4JTStLfTvucE2OeocRiQtE/NuEgSHfVTsLQuyiJNMM6SVShRfFyg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6687.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea08eda-a819-496a-7343-08d8485dfed0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 18:46:21.6307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fRXIwgSXlMLStrBtZQpExIrs2mQTGot1tJtav9kR88n13yzNog3fZZnP8wrJhZ7LJ3mSdkTd9+MPyYt8izM3BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3343
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Ye Bin <yebin10@huawei.com>
> Sent: Monday, August 24, 2020 3:43 AM
> To: Leo Li <leoyang.li@nxp.com>; linux-usb@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org
> Cc: Ye Bin <yebin10@huawei.com>
> Subject: [PATCH v2] usb: gadget: fsl: Fix unsigned expression compared wi=
th
> zero in fsl_udc_probe
>=20
> udc_controller->irq is "unsigned int" always >=3D 0, but platform_get_irq=
 may
> return little than zero. So "dc_controller->irq < 0" condition is never
> accessible.
>=20
> Signed-off-by: Ye Bin <yebin10@huawei.com>

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
>  drivers/usb/gadget/udc/fsl_udc_core.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c
> b/drivers/usb/gadget/udc/fsl_udc_core.c
> index a6f7b2594c09..3e98740b8cfc 100644
> --- a/drivers/usb/gadget/udc/fsl_udc_core.c
> +++ b/drivers/usb/gadget/udc/fsl_udc_core.c
> @@ -2439,11 +2439,12 @@ static int fsl_udc_probe(struct platform_device
> *pdev)
>  	/* DEN is bidirectional ep number, max_ep doubles the number */
>  	udc_controller->max_ep =3D (dccparams & DCCPARAMS_DEN_MASK)
> * 2;
>=20
> -	udc_controller->irq =3D platform_get_irq(pdev, 0);
> -	if (udc_controller->irq <=3D 0) {
> -		ret =3D udc_controller->irq ? : -ENODEV;
> +	ret =3D platform_get_irq(pdev, 0);
> +	if (ret <=3D 0) {
> +		ret =3D ret ? : -ENODEV;
>  		goto err_iounmap;
>  	}
> +	udc_controller->irq =3D ret;
>=20
>  	ret =3D request_irq(udc_controller->irq, fsl_udc_irq, IRQF_SHARED,
>  			driver_name, udc_controller);
> --
> 2.25.4

