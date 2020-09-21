Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E32012735ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 00:44:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwKJF0JT9zDqwp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 08:44:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.0.76; helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=KmB4k0zX; 
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00076.outbound.protection.outlook.com [40.107.0.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwKG860XzzDqvD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 08:42:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uu5lVLJTNaFWA/hEu+MC8l8Io20WfZLWwyTv8Fs+oBH0wbpsy3lBOP9dNhNzRYU8rOU2X/9GgBxobCh3+tqupChznfQ/25ZSpL2th07u277Hl+CroSuCrHmBiLgk3XOFzbuPxWg297xA7K2qHCkdF+s/tCJnHAnE9D1beHEoYUZs7BCiI8BDKgfTtXhgXx4yBuJD9vcEv9fiiGKbPzA9rA8T/kjTtYaLNEblT7mKXj0JRMjYkCsmeyGcQ76aJg4afJYmx7avBlcJaGYIsh3qBkirb1rMo6Hoe+xM1K1mXW7zGgTbcMF5PdAzwhmU4BJ264j31UNYTDNTZwkMfQrxew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyD4JMsuWfSSLHU6zIx2/oO/W+cWYSxK0osz5cnYqFs=;
 b=UixpYx0cwU9uTXzngsQLapWinlrmvJ6b26bKvKZSLJlydyYrdrf+h0icv/lUudaF0pvq4S5ZtqrWT++7va41m4jx25Nkg4bdgyJW+4mvJwn+gHuuLRPxP4FyAWhQsmbfgGByO1cPzTy+MdVH6fI3Mp0/0RxmPkMe+1ZAhaHd8Goil2UyQPmIGzpFj20pWJxWLZGb41aOItAJ5yTU8T/UOkegcz1nbhR7O26jICtow2VdGSzOgB5g1ayfMXiT0XBlRwslAsRINoc2S2cJ0Y053Dj7CG5FFP4YvfbtOxpVdixBsKABA65N2KbnNUnTQZs/eFlYIDl0qiGTuDeIibSSow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyD4JMsuWfSSLHU6zIx2/oO/W+cWYSxK0osz5cnYqFs=;
 b=KmB4k0zXnv9+ov+aOL3paBDpr7e9BhqgGsFOladvgBpa61RASxIVamKPPwA7ZuV0ej+bKgBILqtQlVyhS9eJ5+wd0sHnFzWtOENKGj9gpcx+ZS19c8YnPWa+wPepr0/jgHNKGNBIZbFgy6XevrHZNRqkx8+w9neTBRt/7qPXDws=
Received: from AM0PR04MB6676.eurprd04.prod.outlook.com (2603:10a6:208:177::33)
 by AM0PR04MB4770.eurprd04.prod.outlook.com (2603:10a6:208:cd::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Mon, 21 Sep
 2020 22:42:49 +0000
Received: from AM0PR04MB6676.eurprd04.prod.outlook.com
 ([fe80::b0c6:15b9:582:e7f3]) by AM0PR04MB6676.eurprd04.prod.outlook.com
 ([fe80::b0c6:15b9:582:e7f3%5]) with mapi id 15.20.3391.026; Mon, 21 Sep 2020
 22:42:49 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Ran Wang <ran.wang_1@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>
Subject: RE: [PATCH 2/5] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
Thread-Topic: [PATCH 2/5] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
Thread-Index: AQHWjAMhiFVIvWSvtEq/tN3zoOUi36lztzMQ
Date: Mon, 21 Sep 2020 22:42:49 +0000
Message-ID: <AM0PR04MB66769C7080A32C95AD438ADF8F3A0@AM0PR04MB6676.eurprd04.prod.outlook.com>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
 <20200916081831.24747-2-ran.wang_1@nxp.com>
In-Reply-To: <20200916081831.24747-2-ran.wang_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.234.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3754c19c-dd24-4b57-c709-08d85e7fab16
x-ms-traffictypediagnostic: AM0PR04MB4770:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB4770D4936A82EA337750701A8F3A0@AM0PR04MB4770.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wDrljWDtnUvCFnRjJ4p2h2puOsd5wK16Mq0Klmd2pGMqLb+jL+lsCukJPwc7vBrlZT5hFLh96CrHfXPNo/TOuJM/ZL3lLtkGAzlipYTA2MBvNPK2RwznmTsDIAZNnUlgiieYKDNp6+vb+AuaRncpUG75yW4b1Nr77TpBfU6uL1O2dVB8KqJdejWSDmlRs/5jPp+nvt19Jpj6LrhA8dx63jGfq3BkKtpbK3jKfrN9U2bK1l+tU/g1m8sA+bJpyDNEFa8R/5ysl7cLuMinW/aD/3COtN1zgmcIGZpza5oInYzK/tCWisbbxI1rSDdnfX23JB/J77FUIs/EOjRWUOf6/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB6676.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(8676002)(71200400001)(2906002)(54906003)(8936002)(4326008)(110136005)(316002)(83380400001)(6506007)(53546011)(5660300002)(9686003)(7696005)(33656002)(66476007)(66556008)(64756008)(66446008)(52536014)(76116006)(55016002)(186003)(26005)(478600001)(66946007)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: bFUbE+o0zHeDJuqFpSbKfxEkzHeF0tsM//zSASq4NzMlWUiVy9RYNYA7igfCSv+twfQhiml3ataJ/6kxeDCJ0yqBBpMpCpcncCX86WeNqtIT7KEKR6pg9fLNMX1N9eHtVDflOuVx+6UUSRIoZwz+Xl2vHeO2qzANHQAuBxV2vbKVeoVXsWvVT2qE5SyymENQ6lpjhgPNz6ECNXnv6WUVXT8Hyw7Kw69cNQAvHu3dalt4Cxq0f/BKl/ko6/Cdt1JyuZKwYxB4iKLWsVVCV0/gXPuij+m7NDRo8u7raOfWs1K+rq+TId3GuPnsXB7zeN1/Qv8zDMe/fer2NNEnVLxph5hSySKqMxvfJGvJkT6ue/DpqzBkYqUloHXpDqqQ2mUmk3tqdJ4GoZ0WwDqHcdmsBtMQofsXBHA4tG/hch06CGKKqs28CViClKqada203Fi0HG7gWvJIs9uGqSCHPK6WSGhYfL/nD4d/rX5zBKfv4gyZ/HKSZQ63RAwuJqpnflRRXSmmscqMADi8WaE0Fbn6MN1qiDsoBEfd+mzMmWNgjXaL3Kw8JYM/pTGmvJ1lTFpgMWS2kAJmwlUkVoKGLk/JBJga7g5AlZ20x0xnxV/w4wtopCFG1KvroS6OocY6+9UgHC4qN1E9QjAlvrI3hefNYg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3754c19c-dd24-4b57-c709-08d85e7fab16
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 22:42:49.5720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJAyWtWNzmYvCDZrKr49LMOi0Rhh3qEOPrgjKGAApyb08TY2JfDtM5L5TUm7PGl3Xth5uOisDjMO76ejVMJkmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4770
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
 Biwen Li <biwen.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ran Wang <ran.wang_1@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Ran Wang <ran.wang_1@nxp.com>
> Sent: Wednesday, September 16, 2020 3:18 AM
> To: Leo Li <leoyang.li@nxp.com>; Rob Herring <robh+dt@kernel.org>;
> Shawn Guo <shawnguo@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Biwen Li
> <biwen.li@nxp.com>; Ran Wang <ran.wang_1@nxp.com>
> Subject: [PATCH 2/5] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
>=20
> From: Biwen Li <biwen.li@nxp.com>
>=20
> Description:
> 	- Reading configuration register RCPM_IPPDEXPCR1
> 	  always return zero
>=20
> Workaround:
> 	- Save register RCPM_IPPDEXPCR1's value to
> 	  register SCFG_SPARECR8.(uboot's psci also
> 	  need reading value from the register SCFG_SPARECR8
> 	  to set register RCPM_IPPDEXPCR1)
>=20
> Impact:
> 	- FlexTimer module will cannot wakeup system in
Will not..
Also it will be better to merge this with the issue description part above =
to prevent confusion.

> 	  deep sleep on SoC LS1021A
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
>  drivers/soc/fsl/rcpm.c | 42
> +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
> index a093dbe..e6354f5 100644
> --- a/drivers/soc/fsl/rcpm.c
> +++ b/drivers/soc/fsl/rcpm.c
> @@ -2,7 +2,7 @@
>  //
>  // rcpm.c - Freescale QorIQ RCPM driver
>  //
> -// Copyright 2019 NXP
> +// Copyright 2019-2020 NXP
>  //
>  // Author: Ran Wang <ran.wang_1@nxp.com>
>=20
> @@ -13,6 +13,9 @@
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
>  #include <linux/kernel.h>
> +#include <linux/acpi.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
>=20
>  #define RCPM_WAKEUP_CELL_MAX_SIZE	7
>=20
> @@ -37,6 +40,9 @@ static int rcpm_pm_prepare(struct device *dev)
>  	struct device_node	*np =3D dev->of_node;
>  	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
>  	u32 setting[RCPM_WAKEUP_CELL_MAX_SIZE] =3D {0};
> +	struct regmap *scfg_addr_regmap =3D NULL;
> +	u32 reg_offset[2];
> +	u32 reg_value =3D 0;
>=20
>  	rcpm =3D dev_get_drvdata(dev);
>  	if (!rcpm)
> @@ -90,6 +96,40 @@ static int rcpm_pm_prepare(struct device *dev)
>  			tmp |=3D ioread32be(address);
>  			iowrite32be(tmp, address);
>  		}
> +		/*
> +		 * Workaround of errata A-008646 on SoC LS1021A:
> +		 * There is a bug of register ippdexpcr1.
> +		 * Reading configuration register RCPM_IPPDEXPCR1
> +		 * always return zero. So save ippdexpcr1's value
> +		 * to register SCFG_SPARECR8.And the value of
> +		 * ippdexpcr1 will be read from SCFG_SPARECR8.
> +		 */
> +		if (device_property_present(dev, "fsl,ippdexpcr1-alt-addr"))
> {
> +			if (dev_of_node(dev)) {
> +				scfg_addr_regmap =3D
> syscon_regmap_lookup_by_phandle(np,
> +
> 	   "fsl,ippdexpcr1-alt-addr");
> +			} else if (is_acpi_node(dev->fwnode)) {
> +				continue;
> +			}
> +
> +			if (scfg_addr_regmap && (i =3D=3D 1)) {
> +				if (device_property_read_u32_array(dev,
> +				    "fsl,ippdexpcr1-alt-addr",
> +				    reg_offset,
> +				    2)) {

It is not necessary to read out the whole fsl,ippdexpcr1-alt-addr property =
if we only need the offset.  Also you can change to use the syscon_regmap_l=
ookup_by_phandle_args() API above to simplify the code.

> +					scfg_addr_regmap =3D NULL;
> +					continue;
> +				}
> +				/* Read value from register SCFG_SPARECR8
> */
> +				regmap_read(scfg_addr_regmap,
> +					    reg_offset[1],
> +					    &reg_value);
> +				/* Write value to register SCFG_SPARECR8 */
> +				regmap_write(scfg_addr_regmap,
> +					     reg_offset[1],
> +					     tmp | reg_value);
> +			}
> +		}
>  	}
>=20
>  	return 0;
> --
> 2.7.4

