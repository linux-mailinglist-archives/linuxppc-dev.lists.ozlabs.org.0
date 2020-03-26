Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBA0193DDA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 12:30:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p2pG1S4gzDqLr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 22:29:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.59; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=peter.chen@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=McsYNAFO; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80059.outbound.protection.outlook.com [40.107.8.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p2ln21lczDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 22:27:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcE0t/+P/ROT7bJqhMuRE+o/8HkX5ukQtoBcR2LkKrwaeZtKuBrueU1/cdBe+GjeVxBuTmRFoh6Fa+jIP0HsmLR7Srs/ta3cx42SC8g7SIV6d/+4Z9myU4Sr2IxzYUQ57KlLG6IalH3Ss15m/IVspJhtnKynGet58aPM1/VpTm1TbTsW3kGOYfGrjBy43ifeT+6Cd+U0f1rdcbF2yqDkLi/uVna7IS46Y1iSpfH1dAZf4V2464IRSnoFR+eZDrgqRfSNKlgdlYh6uhJUf4UsEII1N9pGvPpLK1ssAc8KZvOOe0NZdVn6WgZDWT4C+Z8gBH0MO8tbKRJqsZud7Oc/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=881QD6+SCFjpQD28jCSSQPDg3w4/ooncGEL1dHSZSYY=;
 b=RFgfKUtTsyLm0aze/i/S8/WqO7Kkr4aH4pE+UDt3xbA2Ytl3nw9Wl1OdF+554z7Ws9CMVV7p5CNbazuJIZ8RRvKOgNKrOZEWX2e/WlH3eCjUEiL6pDpZ/GXelYFOkSYHZfFr6v/wlv//KiK8M7+hfyHas8Y5XxQP7Wx3V7xG0ZwSobIAHJ1xSIOEPVtZwwAvgn2s0jhm0VrntK/khbjEqs//esrabAkbBi5MwXNEsQ9Jx6vcsW7lBt9Ofd5uMGZjWnUb3eh0WCfiiaAMdVpjcz2P8GmlfRCLOke+cV7ME0CFvE24VfqTSfVdxrPPMNEcXvz5pCxCkB1TpDEWPkULvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=881QD6+SCFjpQD28jCSSQPDg3w4/ooncGEL1dHSZSYY=;
 b=McsYNAFOdo+N/U4JywO14dPPqsrsofvjYmeQl0RNJhTqW2Y64AVLKdCugzh4rtOGsYsmf3sFN0JZ5EoZ6CDfLKAGZxS3ASGfz9fu1fENMJD3dfK4cMSYgNGPY9y5ZGKYNq8G4xxy605pLkXSklkDLU0kO6rLUylDqo7VHaapkPg=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (52.135.57.84) by
 AM7PR04MB7109.eurprd04.prod.outlook.com (52.135.57.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Thu, 26 Mar 2020 11:27:39 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::902c:71:6377:4273%5]) with mapi id 15.20.2835.023; Thu, 26 Mar 2020
 11:27:39 +0000
From: Peter Chen <peter.chen@nxp.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] usb: gadget: fsl: remove unused variable
 'driver_desc'
Thread-Topic: [PATCH -next] usb: gadget: fsl: remove unused variable
 'driver_desc'
Thread-Index: AQHWAz46AEx9LC9yH0mnhgCbnlg976havLiA
Date: Thu, 26 Mar 2020 11:27:38 +0000
Message-ID: <20200326112759.GB23632@b29397-desktop>
References: <20200326071419.19240-1-yuehaibing@huawei.com>
In-Reply-To: <20200326071419.19240-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 88ca04b9-f938-41dc-d988-08d7d178b0ed
x-ms-traffictypediagnostic: AM7PR04MB7109:|AM7PR04MB7109:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB71094A505D179E5D93EEFEA18BCF0@AM7PR04MB7109.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(54906003)(5660300002)(6506007)(53546011)(8676002)(33656002)(478600001)(2906002)(44832011)(8936002)(26005)(6916009)(71200400001)(1076003)(66476007)(66556008)(64756008)(66446008)(4744005)(4326008)(91956017)(6512007)(86362001)(66946007)(76116006)(9686003)(316002)(33716001)(6486002)(81166006)(186003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR04MB7109;
 H:AM7PR04MB7157.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NB4n2WwV6gNRhhBlHxuRWIgH/M+O6LqeznisGC5xQxg9XRq0TecnWQcfwN1tpQkfKaHZPVua9+BfVGN8LdmKMgfvcvSFUQEz/MrEnRCO2X22bpcKPiXtqvdkmVkT0qFISN484wHV0bA6PTGe2imh+ZE6x+Yec+gCWLGgz8a169E30+bYs1PeaxcI//025CNB5sxI4Y9v4znY+hmp6RUtdw05QkouU5Yk1T0K7KhKZNtLMk7ckVWGEmDcANxjEgarJr4N7k5lzgeD8bzS70H+GdBmPdIjDNKui8+X/SDVC1kd1FeodKYhmzNTR7Iu/NRDccv0MGuXKyPOyg+2ufrKz2uwNY7M6dWvQPVTWvYjGo7J1t+8GVegvpbeDJD+k7uk3Mb2UG8U/5TiZmU129RUtW/zAEex49sXzEjPX+0kGMsv8xw8n/z9jDJhAlY0ZZ/h
x-ms-exchange-antispam-messagedata: t6a5bzMGvRmlYW7adR0kSacCBiShuQbMoUI8Woh7NEJvtEbyrGHoUB7c+L8g4spFPFCQ4WpJbKskVmCw+kccnUH/IkCSpNheaKHrhnogSph2lfEvWMgbBQx5DClblVI3gPGI7KwanRi0N9nwqBypoQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4243D766E89A814D926F964C91D19B01@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ca04b9-f938-41dc-d988-08d7d178b0ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 11:27:39.0325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bIYnYNPCxCaDSRWn0xoz/r9T+/BYdpQ6sjwEm/oSqj92ir95Xss3TgGKkdTEQC42v9skXe/nSFJ+6nfan9zJTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7109
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
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20-03-26 15:14:19, YueHaibing wrote:
> drivers/usb/gadget/udc/fsl_udc_core.c:56:19:
>  warning: 'driver_desc' defined but not used [-Wunused-const-variable=3D]
>=20
> It is never used, so remove it.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/usb/gadget/udc/fsl_udc_core.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/u=
dc/fsl_udc_core.c
> index ec6eda426223..febabde62f71 100644
> --- a/drivers/usb/gadget/udc/fsl_udc_core.c
> +++ b/drivers/usb/gadget/udc/fsl_udc_core.c
> @@ -53,7 +53,6 @@
>  #define	DMA_ADDR_INVALID	(~(dma_addr_t)0)
> =20
>  static const char driver_name[] =3D "fsl-usb2-udc";
> -static const char driver_desc[] =3D DRIVER_DESC;
> =20
>  static struct usb_dr_device __iomem *dr_regs;
> =20
> --=20
> 2.17.1
>=20
>=20

Reviewed-by: Peter Chen <peter.chen@nxp.com>

--=20

Thanks,
Peter Chen=
