Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E0827386E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 04:18:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwQ3038J7zDqsx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 12:18:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.40; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=a6MZi02D; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20040.outbound.protection.outlook.com [40.107.2.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwQ112dxCzDqbB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 12:16:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k12dEh+Z40JBinaMb8+QWD/tlkdmwGe43qWSnqRdk48aPFuj6N4NrTzalaf+vomDYMCbsOLGBeynFmXag3LxEd9XcRDKTMUcZSA2ulohVsb0U+vzRPk6asZXFq+qzh9ZLf5hyRt3pdmF0uTu7l7glx2KXJ+NGDEYiH49vW1id3uxO0ylpUyfdxl0RwcCRqMK3C6w+LjyVO/bhxHSQI9iE9/8RqNy9EGWmZX1VU6Ijl6B60L+6XGO4ATCmbxikJ2TMchTny5Ac8P5/vyMQIjK1KKXM2xGKxKP1nzdm4+E53+BrvyBw+tHkmBguczTuoeqydJ2ERhyZIOmg8SkYNrxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4in98yiffeV4ty/ZeTBR+1kjApjC8PmzOWxK3XkohU=;
 b=JCTtmwo7okVJc3Y2Hk7Nlv6RSWmlg4Cgd9SPxzhpO0c9GUEFVKhw8UNfGfR3fjVJpW07sXDO1RYPJBI/RJJoPrOv5DSO5rhrQXS6GrPGcBPR0oUF5LoppqklPVv+V7hQS8BpPRQ60Y5PDO6RpfdUXartOnCmLfgQgkS7wUS4QPCaLkw3hlWvPBuHV+RSoP4FTUmduU+Pv8fv3kgbKD4Vtz2ny8uX2TZ/bjA0EhQ6rFvVzsvM/ooDVAorL+4eXjdjHmemz3tEBFOSDR2rjisMzI8SAJuqyzmnrvzysOPmyWkely45UVRV/3i2Ib4FsG6xPzw7yBJzpLTB5G79cwWxag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4in98yiffeV4ty/ZeTBR+1kjApjC8PmzOWxK3XkohU=;
 b=a6MZi02DtAK5BeN94bVemfP91osLeqxBF4MjFxSGzfI1O+k+lo63/o6jguyPRNz5G/+J/pHhcw7KhFjx6mINpPM0cZ/8wwSo9T/fB7mu7UW+7BkxpVwXTc/AAouKwZtfjz2EyVGFZB1mcgOQ5oGIM0jxhLpxhNmN9FEx1OOkaNA=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB4741.eurprd04.prod.outlook.com (2603:10a6:20b:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Tue, 22 Sep
 2020 02:16:45 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3391.024; Tue, 22 Sep 2020
 02:16:45 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>
Subject: RE: [PATCH 2/5] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
Thread-Topic: [PATCH 2/5] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
Thread-Index: AQHWjAMhWunpOeJt302Zdw6IODFVGKlzuQqAgAA7ByA=
Date: Tue, 22 Sep 2020 02:16:45 +0000
Message-ID: <AM6PR04MB5413AC535051641B4DEFBB83F13B0@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
 <20200916081831.24747-2-ran.wang_1@nxp.com>
 <AM0PR04MB66769C7080A32C95AD438ADF8F3A0@AM0PR04MB6676.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB66769C7080A32C95AD438ADF8F3A0@AM0PR04MB6676.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ccdc3422-0023-4b60-f447-08d85e9d8de5
x-ms-traffictypediagnostic: AM6PR04MB4741:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4741BA4314700D301B70FF8FF13B0@AM6PR04MB4741.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uGJ56HZ1jMfcX7FyOKcYSe0zHpLgEKgmlrZHVNcFaIJBEqUjwPYwnKSga87F++rYVo0359L/OPH2mBujYw9d7nkAGpBk7lVH95wyW599oF3yUJb/PMoQpPCNBNhEPDxtDnC1Mf7PFOxrvKXEvuSbDteP+DF2AAihHYqazdTEqXd1IdnaVvqlifAh9fLj16ekaiEDmoOH9oAjoHhzZCLhS38QFNB4EzfKN/7xtpg2fIjUcSRHkzjfe2oZWrOiCqZmP6NTDivcwccW1pqRxvMRSZApxdFeDOI0H8qTZrmipOasLUSzNorS6QM4rH/RoNvn9zw3UgkPUBiIOax/vraIIg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5413.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39850400004)(64756008)(316002)(66946007)(83380400001)(76116006)(66446008)(53546011)(6506007)(54906003)(66476007)(66556008)(33656002)(86362001)(8676002)(478600001)(2906002)(71200400001)(7696005)(4326008)(8936002)(52536014)(9686003)(186003)(26005)(55016002)(110136005)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Dzt/4so/RiDhMo5B7/u4pi2N1mPT0uU11zNlaKZKc2acew6JxGoTBquFNBHEEpdU4OD7G79LXguLu/JPdHKNG6wh/rNPwS20PpEiM1IQixVWfxORDQRnEabiDWOP9/VXIqkL5cGbGi+yyEu3pfZTPOdH4j7ZpcP+upFLQFjTsyM3qEwKZUwnTJ3C0vbeSo+/a2eCqORd55yBsoKiRlnZTX4SB6tVnRleNC4ly9vxvoc2wAk1z9Qezo0s2NOU5PDvsPfKU4wqYLqqUWbiFh2GXbm9AK8oqAbWxCxlSRi6hFvmMclJcmacY0MEs/+IOsNhLx6I325Py58zGbAfEsV4Ggtj6zglaybWhPDfRook4B8DA+rVwJgihVcBNvmLGPgI0FcvxNT2snocbBWLeug4tN6FSHTUUu8cR7dCm/04x8isEXmgvaIM3IbI7ZxpVqLC+gch+AWmtF6GABWyb+hItFT1UPQt9+R1LR5/Rm0jd6z1SE/B+Ns1wRCWnJY5MVwEkeAdu7W2/CWnbdmgDeRvlpSmVJBCFiSlJHJ6mtEwgpZGVi66VM7rXB1sUD502uCKoi10Qaqgf1nVTSNnt0QMXU1ATY/Y6ey7FEFn49Z+8Fs1Z4lbBVkw0DmcNtPcZlcFzh7vBXMuuEgEXbEeqX5MKg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccdc3422-0023-4b60-f447-08d85e9d8de5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 02:16:45.4970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KM3YNdFW90t/zVAzjlEGpzdvloyof8vuaH/3heoQGFOPB/5kRN0R9Ji+a4+hhwGf03qK3jI9lDVBKr09iYwpGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4741
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
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Biwen Li <biwen.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Leo

Tuesday, September 22, 2020 6:43 AM, Leo Li wrote:
>=20
>=20
> > -----Original Message-----
> > From: Ran Wang <ran.wang_1@nxp.com>
> > Sent: Wednesday, September 16, 2020 3:18 AM
> > To: Leo Li <leoyang.li@nxp.com>; Rob Herring <robh+dt@kernel.org>;
> > Shawn Guo <shawnguo@kernel.org>
> > Cc: linuxppc-dev@lists.ozlabs.org;
> > linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Biwen Li
> > <biwen.li@nxp.com>; Ran Wang <ran.wang_1@nxp.com>
> > Subject: [PATCH 2/5] soc: fsl: handle RCPM errata A-008646 on SoC
> > LS1021A
> >
> > From: Biwen Li <biwen.li@nxp.com>
> >
> > Description:
> > 	- Reading configuration register RCPM_IPPDEXPCR1
> > 	  always return zero
> >
> > Workaround:
> > 	- Save register RCPM_IPPDEXPCR1's value to
> > 	  register SCFG_SPARECR8.(uboot's psci also
> > 	  need reading value from the register SCFG_SPARECR8
> > 	  to set register RCPM_IPPDEXPCR1)
> >
> > Impact:
> > 	- FlexTimer module will cannot wakeup system in
> Will not..
> Also it will be better to merge this with the issue description part abov=
e to
> prevent confusion.

OK

> > 	  deep sleep on SoC LS1021A
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> >  drivers/soc/fsl/rcpm.c | 42
> > +++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 41 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c index
> > a093dbe..e6354f5 100644
> > --- a/drivers/soc/fsl/rcpm.c
> > +++ b/drivers/soc/fsl/rcpm.c
> > @@ -2,7 +2,7 @@
> >  //
> >  // rcpm.c - Freescale QorIQ RCPM driver  // -// Copyright 2019 NXP
> > +// Copyright 2019-2020 NXP
> >  //
> >  // Author: Ran Wang <ran.wang_1@nxp.com>
> >
> > @@ -13,6 +13,9 @@
> >  #include <linux/slab.h>
> >  #include <linux/suspend.h>
> >  #include <linux/kernel.h>
> > +#include <linux/acpi.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/regmap.h>
> >
> >  #define RCPM_WAKEUP_CELL_MAX_SIZE	7
> >
> > @@ -37,6 +40,9 @@ static int rcpm_pm_prepare(struct device *dev)
> >  	struct device_node	*np =3D dev->of_node;
> >  	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
> >  	u32 setting[RCPM_WAKEUP_CELL_MAX_SIZE] =3D {0};
> > +	struct regmap *scfg_addr_regmap =3D NULL;
> > +	u32 reg_offset[2];
> > +	u32 reg_value =3D 0;
> >
> >  	rcpm =3D dev_get_drvdata(dev);
> >  	if (!rcpm)
> > @@ -90,6 +96,40 @@ static int rcpm_pm_prepare(struct device *dev)
> >  			tmp |=3D ioread32be(address);
> >  			iowrite32be(tmp, address);
> >  		}
> > +		/*
> > +		 * Workaround of errata A-008646 on SoC LS1021A:
> > +		 * There is a bug of register ippdexpcr1.
> > +		 * Reading configuration register RCPM_IPPDEXPCR1
> > +		 * always return zero. So save ippdexpcr1's value
> > +		 * to register SCFG_SPARECR8.And the value of
> > +		 * ippdexpcr1 will be read from SCFG_SPARECR8.
> > +		 */
> > +		if (device_property_present(dev, "fsl,ippdexpcr1-alt-addr"))
> > {
> > +			if (dev_of_node(dev)) {
> > +				scfg_addr_regmap =3D
> > syscon_regmap_lookup_by_phandle(np,
> > +
> > 	   "fsl,ippdexpcr1-alt-addr");
> > +			} else if (is_acpi_node(dev->fwnode)) {
> > +				continue;
> > +			}
> > +
> > +			if (scfg_addr_regmap && (i =3D=3D 1)) {
> > +				if (device_property_read_u32_array(dev,
> > +				    "fsl,ippdexpcr1-alt-addr",
> > +				    reg_offset,
> > +				    2)) {
>=20
> It is not necessary to read out the whole fsl,ippdexpcr1-alt-addr propert=
y if we
> only need the offset.  Also you can change to use the
> syscon_regmap_lookup_by_phandle_args() API above to simplify the code.

Got it, will update it in next version, thanks.

Regards,
Ran

> > +					scfg_addr_regmap =3D NULL;
> > +					continue;
> > +				}
> > +				/* Read value from register SCFG_SPARECR8
> > */
> > +				regmap_read(scfg_addr_regmap,
> > +					    reg_offset[1],
> > +					    &reg_value);
> > +				/* Write value to register SCFG_SPARECR8 */
> > +				regmap_write(scfg_addr_regmap,
> > +					     reg_offset[1],
> > +					     tmp | reg_value);
> > +			}
> > +		}
> >  	}
> >
> >  	return 0;
> > --
> > 2.7.4

