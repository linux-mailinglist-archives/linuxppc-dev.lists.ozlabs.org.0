Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6673D6845
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 22:45:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYX4r3LwYz3bWh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 06:45:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=swR4Tlsx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.22.50; helo=eur05-am6-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=swR4Tlsx; 
 dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYX4H2XxRz306n
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 06:45:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bILiN3tyd3P7+26TFrIT4cG0xE7zikZf0Ny6CRLeKxurnqoy8FBu/7XyGW8AKM2hS18PRIMArntC3ApVdJYPEDfdzssPgsw4NK71hhjeJuUFs6+HazFTSRJEX4IgVQf9dRqLagRiqvPJPBgjteNyt1lX0LZsJeRc25CBmuvbQ5kxLbxf5I9MP98QF0DUW4dYxdkiA1hYT7eP7JZ9cupC4FIrRWbMn8CxZ+8OaQLgppJ57seF+5h0jhdzMGItI/h4VNCIwQtXhlJa0oEgM3SMe6AAMFRPAoY/22eNSAJJ1zZ6MyhSZb04rOQkcy3sMWq0U7Urn+jzmKhGXOBQr0CrNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qo5g1d9dZV6i3+adYh4WTRNJEn2bc1tSb9ejTpesMPw=;
 b=RLKsjCseFDJDqxmSN9yv8NY9kZ0931KmNOyG5C2KNZ7D+tEUP1t7KWJKCHuYg3rqE+ZuPZbV6KbL3c97/9TMCYjc/QHTQdIw2aHj0WIFTwNsOBrqEuRiN79IDFV1SQo/33GPV8oWifJB+edWvYWGkjn66Vt5NY6brXMyoXMB4rnoyWoEIgy/Wuk3CjeX+NZ+56OAq+soha8/MSOJfnh53PQ+0gn3n5asSitri/POIUAx/zeQzVAht8ZR95GyXFb5Z0iUl5yhWrVanb9GpmJ5ZsmR+YC9mxrgzKZA5us72gZO9Im1xMz5VpGlozZwQay8zpwzucIZCJ6igPEwJQ+cjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qo5g1d9dZV6i3+adYh4WTRNJEn2bc1tSb9ejTpesMPw=;
 b=swR4TlsxXiFl4b0ETH1xRClxkUDFHiBgjcG9zz6/nk8Omy7GVGcL4jQyUEYK/ezqxfNnqpDPfMwbNRUyhiX3wK5XIz4On0rxaWcYT4wCace3g6LzwWwBATVxevJJbeaOaxDocuVhYfERyJaFwRj3+TMaFNunnJKchux0tcU5aGA=
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com (2603:10a6:20b:42d::18)
 by AS8PR04MB8980.eurprd04.prod.outlook.com (2603:10a6:20b:42f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 20:44:58 +0000
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::4d62:f78d:cea9:1ba6]) by AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::4d62:f78d:cea9:1ba6%4]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 20:44:58 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Maxim Kochetkov <fido_max@inbox.ru>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH v3] soc: fsl: qe: convert QE interrupt controller to
 platform_device
Thread-Topic: [PATCH v3] soc: fsl: qe: convert QE interrupt controller to
 platform_device
Thread-Index: AQHXgd3qhhGq2JPGak+KUVia7LyFBqtVtp/g
Date: Mon, 26 Jul 2021 20:44:58 +0000
Message-ID: <AS8PR04MB894679107E1AE2A899D46FA88FE89@AS8PR04MB8946.eurprd04.prod.outlook.com>
References: <20210726052217.13558-1-fido_max@inbox.ru>
In-Reply-To: <20210726052217.13558-1-fido_max@inbox.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: inbox.ru; dkim=none (message not signed)
 header.d=none;inbox.ru; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 471cc727-7f58-4537-cc2e-08d950763bc2
x-ms-traffictypediagnostic: AS8PR04MB8980:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB89806A4B41E9CFBFB5AEE9648FE89@AS8PR04MB8980.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BRVzINOxzhj/JHyHVy/38nHz2Bd91qZIa4fbvrqjiij9qfU/+OFKfsCNpcDNSA8t8rQ2tE71y+n8IC+JHpFPaC1H8m8FQyNAiYg6Mkj169ynHx+vLxZYgB9P1TnsMSgz8Ghe/jFo6iMiOM3QiIyaRLM/ARhJimsDoP/06lMN02WEevkUzEMF4t4knTjMKMWh7ZUu+oRt0PmSHhsCTFcx8p4tJx4tYDgAVUNlOelaD5G0jYxnKeYeB3UHgdj5alx0maaOHjQPqjiWTewiDk1x/PnrD4j6QVH1zWRYnQMJCkiRAKGLbulN8VPrHQ1bWGBm83KhjT99iEWZ5EdLBVNwzle9/9aXiU6luqEI4MlUDtZSv29GBjQUIKsmOaHqBhecQJvofQTsTEcHjya7S797m3kG9ow41wbuJEqXTE06W2Z6ER78EnOCapquS0SMxtjbT2eyidGgs6O2QLbLKL8579dg9HCkHa8iXuksrIkGGw8LmBOMLk25vurb3GeZLW//qChdya5kMq+KaEWOJjUml5i2oegu4TNxJx58GHOj6M+W/jyDocti2Olwm2J1xPUIOH5tMjz6vy54KxmMslKw9IP4CzOSoHY80YJ/Z6CSfiRHIQgtaUUAXrMJ7NKWOyIbVSqcGc36pVb8EFp6sLO3N1tlsyHZjyUfR5p5wS2pOnqSjEFN8AM9tYbEGStHzAvHNoyBwfL7cWgfS7wvth7pPYfuXVspgt47YkuQxL7xlu0HVoO0wSEXWaii9ajXFnuhPJmbY2piAJoZQykiwh0O7AESCWlip8ZS1/yef6aa/98=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8946.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39850400004)(53546011)(966005)(45080400002)(4326008)(38100700002)(71200400001)(7696005)(9686003)(8936002)(64756008)(6506007)(186003)(2906002)(52536014)(122000001)(55016002)(83380400001)(86362001)(33656002)(316002)(76116006)(478600001)(5660300002)(66946007)(110136005)(8676002)(54906003)(66476007)(66556008)(66446008)(26005)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RaiKqtqt90uND/8xeSWdavcodZe3GV2vaX/AfV875vwQO6Coj1Zk9kka2PDh?=
 =?us-ascii?Q?xxsjfq2FnWMNy9T2VgAC+ovwCAFNnTCsL2uZFS2Uu8dgttna61qfyjxly1zr?=
 =?us-ascii?Q?lo5xPrlFlx02gaTGFbuh3+6iNtvIY/w6ceNQweaunF86isXAPVTINR0IZh/N?=
 =?us-ascii?Q?EPFLHMON+qw5aiTMc1d/Um+eEPWSA0pwO44+FqwyPJW7HAjDp2nDoBfOi1Yy?=
 =?us-ascii?Q?M7zfu68dNJuqH2SoSsBIWfKWkwdixTpMNp4VTzK7Go9Am9aO5zVG/6Sv3DP/?=
 =?us-ascii?Q?xX1MdrbJZHEJRxcev1JeWHWZoCUUa7glmN/Et5h8M8aE7ZzWE6WaCMqfEyyY?=
 =?us-ascii?Q?Hb5xl5dw5Ux8U89aOwyfLfn7mHIGjWhe14/xr/a1kpETm0qhfCvU0AGRtq5x?=
 =?us-ascii?Q?PGNqUDlmZ0p0AgBsvm7yKQ0viTNkaNsF9S7PtFBo4iPRB9wey7tOP+KGjaDM?=
 =?us-ascii?Q?zwP87m36/sJIt8P4N1WqQoaC+H4IxZl9VujkAQ9Oj8ZlPCTHm13whfgb/Slz?=
 =?us-ascii?Q?9ZHVRv7TUzh0+m4dwS8yQx3xqv63qd+teFa7qebApYzGrglCtaCAygmhUCyN?=
 =?us-ascii?Q?5FCIaEEP0GsQ07D31FNZQ5xJ1RCb5+2fSfqWKXC+eFm2ltQ8YUj0i9mK5EZO?=
 =?us-ascii?Q?TlXfenVoFoyR84mg0cXTWzqR4l8s64NTwsvUOfzBFvp07LRpaxh2EBu1q6n2?=
 =?us-ascii?Q?Fh9rW6qB1kX/wc/4iv9bWwSQMAN29frGkwtSMtYeUipkvkDKm/QW/Xc1DSFd?=
 =?us-ascii?Q?OodnOcGn8pKFk6lzoj0CbuPDjZLSvmeECMeSQAmmHrndUEkgJoegc4Iqo9/N?=
 =?us-ascii?Q?U3JOJgE51Xukq+2A2wahNM+g+mNGTAwWgGb71NfYjvxqlAEhmfX3tLiReJ7c?=
 =?us-ascii?Q?Sj/VcV1Zo24tAWTcX86BjkZYv57VuSM02lf+wXXgesyzOzoalnFUUKqhDMdk?=
 =?us-ascii?Q?DHzyqSqsqMJZvGm5XLYtsHyhCKb/4gRrWCj62Bt143rovxAH/AOoMT9k9j9h?=
 =?us-ascii?Q?/TrarVh2axvq8qUUJ3VWn8dCUj7fkor/F4C+R6YeDMKOvDViO71BPctOUm5s?=
 =?us-ascii?Q?B695tEHwfTcp8wBkLE58KbmqfASrhUSBHwdIpDnuqMqmrSHJ41pTsIR8jHGR?=
 =?us-ascii?Q?l/N0DcHZOZYNqp+5mRatdXCmmAyiSE5UF5Lkyy/k21CUAo2PcK+w+ZHBVnQc?=
 =?us-ascii?Q?+coPlOwVnI6oM/rtmN6WePfNs+9UqvcP/T0p/GQHOZifzcFzbckkdGd4tlh9?=
 =?us-ascii?Q?o3aaLwinNaxlXB7GsnVK78QAypdWuqi42s6wbeezx0yf/fPVjlYYHxyTxQhA?=
 =?us-ascii?Q?iiRP1LVjg4l2C5IcCrCIpRIt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8946.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471cc727-7f58-4537-cc2e-08d950763bc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 20:44:58.6938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NHt/4l4ZZpw3OR7/OZhNSL1VqJw1bI0i+wLI5fU0PQ9i8Uwf17XpJIVmzKUc0St24YKWYsmlY5az09gdOhziRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8980
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
Cc: kernel test robot <lkp@intel.com>,
 "saravanak@google.com" <saravanak@google.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Maxim Kochetkov <fido_max@inbox.ru>
> Sent: Monday, July 26, 2021 12:22 AM
> To: linuxppc-dev@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> saravanak@google.com; Leo Li <leoyang.li@nxp.com>; Qiang Zhao
> <qiang.zhao@nxp.com>; gregkh@linuxfoundation.org; Maxim Kochetkov
> <fido_max@inbox.ru>; kernel test robot <lkp@intel.com>; Dan Carpenter
> <dan.carpenter@oracle.com>
> Subject: [PATCH v3] soc: fsl: qe: convert QE interrupt controller to
> platform_device
>=20
> Since 5.13 QE's ucc nodes can't get interrupts from devicetree:
>=20
> 	ucc@2000 {
> 		cell-index =3D <1>;
> 		reg =3D <0x2000 0x200>;
> 		interrupts =3D <32>;
> 		interrupt-parent =3D <&qeic>;
> 	};
>=20
> Now fw_devlink expects driver to create and probe a struct device for
> interrupt controller.
>=20
> So lets convert this driver to simple platform_device with probe().
> Also use platform_get_ and devm_ family function to get/allocate resource=
s
> and drop unused .compatible =3D "qeic".
>=20
> [1] -
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
k
> ernel.org%2Flkml%2FCAGETcx9PiX%3D%3DmLxB9PO8Myyk6u2vhPVwTMsA
> 5NkD-
> ywH5xhusw%40mail.gmail.com&amp;data=3D04%7C01%7Cleoyang.li%40nxp.co
> m%7C6e64e4b86f2d4a89390808d94ff50bec%7C686ea1d3bc2b4c6fa92cd99c5c
> 301635%7C0%7C0%7C637628736153046082%7CUnknown%7CTWFpbGZsb3d8
> eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C1000&amp;sdata=3DG7HhGFmRLvMyNMULSddWctD3HhtVWMfZAxPXjl8
> CBTY%3D&amp;reserved=3D0
> Fixes: e590474768f1 ("driver core: Set fw_devlink=3Don by default")
> Fixes: ea718c699055 ("Revert "Revert "driver core: Set fw_devlink=3Don by
> default""")
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Changes in v3:
>  - use .compatible =3D "qeic" again (Li Yang <leoyang.li@nxp.com> asks to=
 keep
> it)
>=20
> Changes in v2:
>  - use devm_ family functions to allocate mem/resources
>  - use platform_get_ family functions to get resources/irqs
>  - drop unused .compatible =3D "qeic"
>=20
>  drivers/soc/fsl/qe/qe_ic.c | 75 ++++++++++++++++++++++----------------
>  1 file changed, 44 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c inde=
x
> 3f711c1a0996..54cabd2605dd 100644
> --- a/drivers/soc/fsl/qe/qe_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ic.c
> @@ -23,6 +23,7 @@
>  #include <linux/signal.h>
>  #include <linux/device.h>
>  #include <linux/spinlock.h>
> +#include <linux/platform_device.h>
>  #include <asm/irq.h>
>  #include <asm/io.h>
>  #include <soc/fsl/qe/qe.h>
> @@ -404,41 +405,40 @@ static void qe_ic_cascade_muxed_mpic(struct
> irq_desc *desc)
>  	chip->irq_eoi(&desc->irq_data);
>  }
>=20
> -static void __init qe_ic_init(struct device_node *node)
> +static int qe_ic_init(struct platform_device *pdev)
>  {
> +	struct device *dev =3D &pdev->dev;
>  	void (*low_handler)(struct irq_desc *desc);
>  	void (*high_handler)(struct irq_desc *desc);
>  	struct qe_ic *qe_ic;
> -	struct resource res;
> -	u32 ret;
> +	struct resource *res;
> +	struct device_node *node =3D pdev->dev.of_node;
>=20
> -	ret =3D of_address_to_resource(node, 0, &res);
> -	if (ret)
> -		return;
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (res =3D=3D NULL) {
> +		dev_err(dev, "no memory resource defined\n");
> +		return -ENODEV;
> +	}
>=20
> -	qe_ic =3D kzalloc(sizeof(*qe_ic), GFP_KERNEL);
> +	qe_ic =3D devm_kzalloc(dev, sizeof(*qe_ic), GFP_KERNEL);
>  	if (qe_ic =3D=3D NULL)
> -		return;
> +		return -ENOMEM;
>=20
> -	qe_ic->irqhost =3D irq_domain_add_linear(node, NR_QE_IC_INTS,
> -					       &qe_ic_host_ops, qe_ic);
> -	if (qe_ic->irqhost =3D=3D NULL) {
> -		kfree(qe_ic);
> -		return;
> +	qe_ic->regs =3D devm_ioremap(dev, res->start, resource_size(res));
> +	if (qe_ic->regs =3D=3D NULL) {
> +		dev_err(dev, "failed to ioremap() registers\n");
> +		return -ENODEV;
>  	}
>=20
> -	qe_ic->regs =3D ioremap(res.start, resource_size(&res));
> -
>  	qe_ic->hc_irq =3D qe_ic_irq_chip;
>=20
> -	qe_ic->virq_high =3D irq_of_parse_and_map(node, 0);
> -	qe_ic->virq_low =3D irq_of_parse_and_map(node, 1);
> +	qe_ic->virq_high =3D platform_get_irq(pdev, 0);
> +	qe_ic->virq_low =3D platform_get_irq(pdev, 1);
>=20
> -	if (!qe_ic->virq_low) {
> -		printk(KERN_ERR "Failed to map QE_IC low IRQ\n");
> -		kfree(qe_ic);
> -		return;
> +	if (qe_ic->virq_low < 0) {
> +		return -ENODEV;
>  	}
> +
>  	if (qe_ic->virq_high !=3D qe_ic->virq_low) {
>  		low_handler =3D qe_ic_cascade_low;
>  		high_handler =3D qe_ic_cascade_high;
> @@ -447,6 +447,13 @@ static void __init qe_ic_init(struct device_node
> *node)
>  		high_handler =3D NULL;
>  	}
>=20
> +	qe_ic->irqhost =3D irq_domain_add_linear(node, NR_QE_IC_INTS,
> +					       &qe_ic_host_ops, qe_ic);
> +	if (qe_ic->irqhost =3D=3D NULL) {
> +		dev_err(dev, "failed to add irq domain\n");
> +		return -ENODEV;
> +	}
> +
>  	qe_ic_write(qe_ic->regs, QEIC_CICR, 0);
>=20
>  	irq_set_handler_data(qe_ic->virq_low, qe_ic); @@ -456,20 +463,26
> @@ static void __init qe_ic_init(struct device_node *node)
>  		irq_set_handler_data(qe_ic->virq_high, qe_ic);
>  		irq_set_chained_handler(qe_ic->virq_high, high_handler);
>  	}
> +	return 0;
>  }
> +static const struct of_device_id qe_ic_ids[] =3D {
> +	{ .compatible =3D "fsl,qe-ic"},
> +	{ .compatible =3D "qeic"},

Probably you missed the point from my first response.  The original code is=
 match by device type "qeic" instead of compatible string "qeic".   So we s=
hould use { .type =3D "qeic"} here.

> +	{},
> +};
>=20
> -static int __init qe_ic_of_init(void)
> +static struct platform_driver qe_ic_driver =3D
>  {
> -	struct device_node *np;
> +	.driver	=3D {
> +		.name		=3D "qe-ic",
> +		.of_match_table	=3D qe_ic_ids,
> +	},
> +	.probe	=3D qe_ic_init,
> +};
>=20
> -	np =3D of_find_compatible_node(NULL, NULL, "fsl,qe-ic");
> -	if (!np) {
> -		np =3D of_find_node_by_type(NULL, "qeic");
> -		if (!np)
> -			return -ENODEV;
> -	}
> -	qe_ic_init(np);
> -	of_node_put(np);
> +static int __init qe_ic_of_init(void)
> +{
> +	platform_driver_register(&qe_ic_driver);
>  	return 0;
>  }
>  subsys_initcall(qe_ic_of_init);
> --
> 2.31.1

