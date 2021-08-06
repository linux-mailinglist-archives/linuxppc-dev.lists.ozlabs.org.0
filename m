Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 809EB3E3222
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 01:42:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhMV93Q53z3d95
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 09:42:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=l6LsWCZ/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.20.87; helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=l6LsWCZ/; 
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhMTc22Xvz30Jf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 09:42:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VALgu7+EncF7WfHXddarlObbE9f58pdNwaOf//eyOk+7wz7eHL911mQEnVR+xIiJ7jaAtDD9qtn3m2t7Ardw6lbuX1U2QmLxba9jdgkrv6JWQZEYxhCa9zI9Ap9wfl/pLy68bK8OlnvBSpGk7sTP31P+UmHnk+TQOzy/pID9XolJXSV8dSP+pWBMadxC42X78ab/Z9OzA70MaMwa20y98sDdxlaynZZRxoIYHI+WR80eJuqTqxLXSztfAjHTMofYTJLV3RpG/89xzc38Opus0viP+0FV4xBsWXI1kVVbCgF3+1DAST21V3iMy9FM0nUxVd6CY7f7vwGtrn1Hxi8hdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6Ct8SRbycxMnHTy6brwuct+sn/qmRPwoeRQDqKqDqI=;
 b=L+QPB4/4oSTR/V3xGZfFzzbqOYbIlRyoy3AIAwzuYMcIgiL2nQ5k3jLz0/LjCtz0MU13tX9OIj+lRgqiN7DvuYvU4cozXBC/HED7GdlTYvu+x8YRy3OHFd1bKqiKDk1Hi66rKU1LMmDBXM4j6waFRlSVbUd0QxlHk9B5VBO8KHTLcctzBxA+dP5UBzmQkPml0j3aLWKLp7kALilXehgAs0iT6VVY3b5sSuhaIcljWLcY8XiyUPFlpcAIYihHPzsJhOgmTAuOZ8/tq3PS9DhM25rGdz0ba6UcIejAU068/HLIZ5lgEuxWEKvpScaFkAf9lvI+48UG6Zl9opFfcsZm1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6Ct8SRbycxMnHTy6brwuct+sn/qmRPwoeRQDqKqDqI=;
 b=l6LsWCZ/iss626GB4untYpnnb97lsnh7BFjZ2UpkeDvnM14cdv9wXL22ozr7ws7NwRdjULEv/HGJsmZdUOLc/djmhg8pziXgr1FhaAFeJr1/3MDO5PY2kHbszMmr+s+3JM2yZk8X+tHSbUNf9DPV9FW5zMkVjMENqJAdVWoyS9s=
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com (2603:10a6:20b:42d::18)
 by AS8PR04MB8785.eurprd04.prod.outlook.com (2603:10a6:20b:42c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Fri, 6 Aug
 2021 23:42:07 +0000
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::4d62:f78d:cea9:1ba6]) by AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::4d62:f78d:cea9:1ba6%6]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 23:42:06 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Maxim Kochetkov <fido_max@inbox.ru>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH v4] soc: fsl: qe: convert QE interrupt controller to
 platform_device
Thread-Topic: [PATCH v4] soc: fsl: qe: convert QE interrupt controller to
 platform_device
Thread-Index: AQHXiFtse0rH8X985U2FIR+ORMsFXKtnKBbw
Date: Fri, 6 Aug 2021 23:42:06 +0000
Message-ID: <AS8PR04MB89468FF7C9C43EF2D70FF0608FF39@AS8PR04MB8946.eurprd04.prod.outlook.com>
References: <20210803113538.560277-1-fido_max@inbox.ru>
In-Reply-To: <20210803113538.560277-1-fido_max@inbox.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: inbox.ru; dkim=none (message not signed)
 header.d=none;inbox.ru; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96a45199-2571-4604-f514-08d95933ccd7
x-ms-traffictypediagnostic: AS8PR04MB8785:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB87851A6803BEE7CA66DC806D8FF39@AS8PR04MB8785.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TwzeJiB2aEeSIAzssni/JH3dfvSNDjA5ql/adkDvKAgbAWhesKo86WLq0+XaaybDKeCyo+6NcVgz5wrChZPwzVSvXdIGjS1cx5/hcstyBBeNSWTmr/59Op7pqalA6P35LRJAsSjlETTw9Wu0A55SusYLlAkEvVBWaT5SuLIGsCHq8kva7p3jG6V/NX1TDHYhncQI3KB2IhUzSkxl2aWDuNe6DGr2zSwkYw6JZLHkRrKFWC1c3E+PXwHN9X78gvC3Y6hCF0WyEdSbCvQbwja/W1n9U46s6Z6D2MnyN+6ASytgbzofQppij6Uk1Jl/SyTyZ54m1Fz8gqPR13tOXkDzCnZ0KMUMdKRjm+umJNG6G1jT7x2i0oHYwAI8T17YUjbV+WiYRJ1sMdqIkc7lmpVtBrT0WqwkpyExPjMgA4mjDk0U1PXf0P6aJmw9NWePPdQJ9P3P6sJ7uiBgjjtmlJMB7zKCcucaTkrNPBtYQ/pQ9slyTqRBb0wnTkKVwCn6fv6lCKVaYL7z0WSjFzJmQLUUtEnHALOuZDD5nplfpoMLT6rXbuaSmTq/gplZv3rH2A+FjwvJUrbhK+pSv0TFMzpjRUppARFbTVDYgkKlQp3ddOYTcJv3/wBKIiacJcYzQiRL0TyzIqhQBg9ZydbEow3A9qNQoDO3pwaYCPCqbCEgtk0xqZ9Eo53d23E8AVTdC5xVZ4vLkmdHu0FGeUWYJDyxvg4i56aRUsVXIONqKHrknVsxQLoC4HFyv8SxCDbh4ymeoPjqQlosNGZ6+/vlkFMRfJkQHeZtFcAJv600OGaqZyQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8946.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(54906003)(38070700005)(83380400001)(8676002)(110136005)(45080400002)(66446008)(122000001)(8936002)(9686003)(66476007)(64756008)(66556008)(5660300002)(76116006)(38100700002)(316002)(966005)(86362001)(26005)(186003)(33656002)(71200400001)(52536014)(66946007)(53546011)(55016002)(4326008)(2906002)(6506007)(478600001)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Br4u/MRz4dqsd080DFrvG3woZmZ1Np3cQg/rFGiYi/7iCLGstK5keLaqH1kF?=
 =?us-ascii?Q?MAhxHrEvhKA9u9vnnx/k2adTwdxgKbCsxGbEgUbuCU1rEQ33y2TKfh5spXX4?=
 =?us-ascii?Q?cradsvQtP6MrbQoqFo8RCGaVtFCqGAg1obdkDsG8o4a6HGSpU579iTJasHPg?=
 =?us-ascii?Q?8d6YX+OTGqQPQXx9a5fKsi194JvY37M2w2VGuze7DOKC33/s+/sJZtcLqnDm?=
 =?us-ascii?Q?1NUMrO4DHs+5EKppvn5ghak/IAASoyIlWcvLUMY1obHbTyoOP7zRQX7kw5HJ?=
 =?us-ascii?Q?q15zL5iptZzdgiCnyKS9cgU2DImmbWb1qV4MdZZZyX63Tj9HpBNZ8tK8Urc1?=
 =?us-ascii?Q?Tv+iT1Fd61D97iJNIj3BwnWftKYoHsVXyc0NAl5Tf+LkcVBxa90BNh46WNjm?=
 =?us-ascii?Q?/NaLvIB4hjboLyEzLxlVJruu+0theFk0RfKpTQNLpiLvc+2R0QxvZ6MRvUId?=
 =?us-ascii?Q?TdKqBNpkRB2uCbwfRCQZFZkEI7V0HiY+NsV54P0Ar7BqTkNDiZHAvmGfrp8K?=
 =?us-ascii?Q?Mqd8O3jzUY+9cMJf/yagYSAakQsJBBzF1bPd3U9cejaVHUs3BVSCy+Ygo6Av?=
 =?us-ascii?Q?87+880N2beWrhF4Zh/x+gLsFt+3iSYMtkQ3K9eC7kqmvYYiCjvUIaoxL5q2c?=
 =?us-ascii?Q?wy90K3Y3eB5W1lBzY/iORn/9r09GET/jSbFKb18bwye+waoFoffKgaFp1MhF?=
 =?us-ascii?Q?4xlVMuKO1DOBGb4ouvDexq3/y5fIcNW1I0r3ZPw3N9c+eGCnaLeMQ9mH9BZP?=
 =?us-ascii?Q?6WFevqSMnJmGi0OK1LnnlbBf8MfwqfjI2TgF0W2+OSZYvbZMAXu9lOam/28J?=
 =?us-ascii?Q?87CScszUN0A9DVwUKKLdj2F5XagPCnUXXzoFEilsstEe0qFaj+rMqZNd6HAJ?=
 =?us-ascii?Q?wctIlSN0+JrImrHYJnegPOMe3gArnCOVP2aOtuYS//oq5SLkRQ13kJ/q+I+p?=
 =?us-ascii?Q?RZVZ5pOVQ5wYY/Ei2cHm0qS5SgQtSyDuSiiIQ1WTc95CdimJ7PGQOpGBvJ7l?=
 =?us-ascii?Q?cXZJHVYZIQuSUyaIBmDL4S+65713TmHCx0T+AeHGdnsqy4eQNzPtlI4CRWsX?=
 =?us-ascii?Q?8RIQfUEc4oLfV1iSmXrEDVPPWnSohckFZ6i+ByYu8yXX/hfz02ogYxBdoZFR?=
 =?us-ascii?Q?ylGorKeAfOGf483+5PpjD45WUH3H6g8moEzTN8ixTJ16EtuC16CCHOJK4U2+?=
 =?us-ascii?Q?s1WxA0fcpDycAUMP3/N8CyXZN2of3WI1LNqYKqw8f8uIg8DaVIusOefMyBK/?=
 =?us-ascii?Q?N7odqTkegDv1DeDPpY9kiQ/YUvpXnRl4xYzJGSH0yZI42nkouKTESl8PPNQq?=
 =?us-ascii?Q?u6GyEYF2JZVEozmP9qz5g3tM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8946.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a45199-2571-4604-f514-08d95933ccd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 23:42:06.3499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zg9jwzevBJjn+yutkOp83uySbBhobcsAXDd2wpyrYgt3dcaxwnLV+26372fJduiLwSnuM/hR+5/CZCEvZfuN/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8785
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
> Sent: Tuesday, August 3, 2021 6:36 AM
> To: linuxppc-dev@lists.ozlabs.org
> Cc: Qiang Zhao <qiang.zhao@nxp.com>; Leo Li <leoyang.li@nxp.com>;
> gregkh@linuxfoundation.org; saravanak@google.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Maxim Kochetkov
> <fido_max@inbox.ru>; kernel test robot <lkp@intel.com>; Dan Carpenter
> <dan.carpenter@oracle.com>
> Subject: [PATCH v4] soc: fsl: qe: convert QE interrupt controller to
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
> m%7C1833b32e26de4ed7ef7908d956728eae%7C686ea1d3bc2b4c6fa92cd99c5
> c301635%7C0%7C0%7C637635872281355718%7CUnknown%7CTWFpbGZsb3d
> 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
> 3D%7C1000&amp;sdata=3DHrivK73GYFAwygPz24JtO%2BTdkicCVYXOl3uywjOqS
> %2BA%3D&amp;reserved=3D0
> Fixes: e590474768f1 ("driver core: Set fw_devlink=3Don by default")
> Fixes: ea718c699055 ("Revert "Revert "driver core: Set fw_devlink=3Don by
> default""")
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to fix.  Thanks.

> ---
>  drivers/soc/fsl/qe/qe_ic.c | 75 ++++++++++++++++++++++----------------
>  1 file changed, 44 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c inde=
x
> 3f711c1a0996..e710d554425d 100644
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
> +	{ .type =3D "qeic"},
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

