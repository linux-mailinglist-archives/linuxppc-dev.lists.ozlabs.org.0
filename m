Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5734ABEF25
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 12:00:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46f9QS2GCRzDqjg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 20:00:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.4.59; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=biwen.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="BPly+uU9"; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40059.outbound.protection.outlook.com [40.107.4.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46f9NX0Q5zzDqjg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 19:58:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAwviciHbdrz2B/nWgsQPUcK6xcK/v/YEqEsvIb4HuRo4SdgKNYb5k88e9WLyMbPMZfJuPU/UyFuSrWtg+5ca6NjHQBEhZYjfws4R0RRUxx2s5vtxitTNSXERGJtiOL7Bhj7GZOcScRXVI6CoiPBnG6m/ROjQ/JjItejUu9utxzwN78rLQd2fIWF+v7GDQAEt/bJzxdSOHwLXIC4dRGkTTveUaicmVq7KEcrC4J1XZjzFb9aKHXwJBFa1SQyei5AZ6Ykf+oTh6il5poJTHhRU1+X5PnapXUgSoaS2wRDDCorl98HNQcrsJUwP90XI+86ei67v587h7SdkcAvigqdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABe97go+nZCRTI2LKCBRF/WxA3lWz/ryjkHGSZWQAfQ=;
 b=lx9DlK0MSnLx8rDfxZmtoGEJl+MSnl79pKUL7wnGBT8xj8wqJuAQo4ssKkCov6AC0+F1/yMqa2sKVplG/voes1w1HONW2LWZ9A8+YB9moCNUUiViCqWc0PdM+mKT1Knf7q3Nd2Wt4OQG3Nq2SaseHKzZ224EHNgAHDZPPjqmrNZ3T8ESt+IclyjreiwFyMEjHpkNom5oJ8lf9By0ObWq13BjoKLROEmOtTKolL8lidl0T5Y64Pavf2AQ8h4SWZ8T7nS5HWqjPGy661FeFl5Dqu9s2M56oCeikA5Rq/XPCTrQSgpQSHDeSNU8P6U1A4oHr5lbEIgrLY1HCuy9FHBGoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABe97go+nZCRTI2LKCBRF/WxA3lWz/ryjkHGSZWQAfQ=;
 b=BPly+uU99jIVJeKeykRe0uOHnw+jLK348PRn716v9DMfewcudP81A0dmt+IasFYsJ0jy2SmTJXCwhBzl1elzXxvL9Wk7T3ZUDMZKRWatc4uOLetsfk6Nm/DAglB8BsPQP+RcOgOsdzs4DyPOX9UbxiQ19zvV+wo3IvXnHNkil9E=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5404.eurprd04.prod.outlook.com (20.178.107.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Thu, 26 Sep 2019 09:58:09 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 09:58:09 +0000
From: Biwen Li <biwen.li@nxp.com>
To: Biwen Li <biwen.li@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Ran Wang
 <ran.wang_1@nxp.com>
Subject: RE: [v4,1/3] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
Thread-Topic: [v4,1/3] soc: fsl: handle RCPM errata A-008646 on SoC LS1021A
Thread-Index: AQHVdBVe5geLyFI8uEOyK3tYbajH66c9uVxw
Date: Thu, 26 Sep 2019 09:58:09 +0000
Message-ID: <DB7PR04MB4490A0282C3D6173D900B7D98F860@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190926024118.15931-1-biwen.li@nxp.com>
In-Reply-To: <20190926024118.15931-1-biwen.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 305c31e6-d44d-44ba-91cb-08d74268097e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DB7PR04MB5404:|DB7PR04MB5404:
x-ms-exchange-purlcount: 8
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5404BD0757F44A0E42D5737D8F860@DB7PR04MB5404.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(53754006)(199004)(189003)(99286004)(8936002)(14454004)(3846002)(66946007)(6116002)(6636002)(256004)(86362001)(55016002)(9686003)(6306002)(6436002)(33656002)(229853002)(25786009)(52536014)(14444005)(66446008)(4326008)(74316002)(2906002)(76116006)(76176011)(305945005)(7736002)(2501003)(66476007)(66556008)(64756008)(110136005)(54906003)(316002)(7696005)(6246003)(5660300002)(66066001)(81156014)(26005)(186003)(476003)(44832011)(6506007)(11346002)(446003)(102836004)(486006)(966005)(8676002)(71200400001)(71190400001)(81166006)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB5404;
 H:DB7PR04MB4490.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CB9KgWpshHa9BiKeyjCZHGSsrD3ZrNArNPWjN+NW0DEaJoVmo9mjIQASptDAp4Z5mh7IrBMmULk9V6chnxg5OJ43vtAVMFDf75ATVPAvuj/A2tT5/eQFfbJQGK3LQQTk1Y/SLmq9JZ8IjN+BYE/LYjcRngqnHSzmtnM0ZmfjPgcrPBh30DJuoApE95Y/YF0HMaZsNUjLEgW2kEdJ15LLYYhi6xEsIMXAKjmcU41N3WzjtvIX3w0hjhi0xLP9TGdg0VstUMm0xRgZvGzRWJNR5fpR1LvwZqYzkMCD0dOh54dIihMR0pOMU503OxY5ppTVS165xfPp3rG8rU4pSxidRaZ9xFhwf/p6WB3GnfZ+rT0jxo7wc8Fer+3rZI75nDkkhfUBYrMzcyzY9uQ99I7ap0s8dsVlshgQq0O7iMdGIFs/kuF/u3oq6UzVnsMAtLmSQcZ5Ukgooy1A/ucD4Ne2SQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305c31e6-d44d-44ba-91cb-08d74268097e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 09:58:09.7767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZwBfh/a11Ylh4CqA7KaijNTAp8NlBjrZKfqrnlXbMvVjGzZjY0Zr0U4hUsKlN4ggbcWEAPNRF4Vyb89/EeY5JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5404
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
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,
the linux patch depended by RCPM driver,FlexTimer driver and FlexTimer dts,=
 need apply these patches as follows:

1. RCPM driver:

https://patchwork.kernel.org/series/162731/mbox/ (https://patchwork.kernel.=
org/patch/11105279/)

2. FlexTimer dts:

https://lore.kernel.org/patchwork/series/405653/mbox/ (https://lore.kernel.=
org/patchwork/patch/1112493/)

3. FlexTimer driver:

https://patchwork.ozlabs.org/series/124718/mbox/ (https://patchwork.ozlabs.=
org/patch/1145999/)

https://patchwork.ozlabs.org/series/126942/mbox/ (https://patchwork.ozlabs.=
org/patch/1152085/)

4. Adjust drivers/soc/fsl/Makefile:

   remove the line 'obj-y +=3D ftm_alarm.o' in drivers/soc/fsl/Makefile to =
resolve a compilation error

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
> 	  deep sleep on SoC LS1021A
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v4:
> 	- rename property name
> 	  fsl,ippdexpcr-alt-addr -> fsl,ippdexpcr1-alt-addr
>=20
> Change in v3:
> 	- update commit message
> 	- rename property name
> 	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
>=20
> Change in v2:
> 	- fix stype problems
>=20
>  drivers/soc/fsl/rcpm.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c index
> 82c0ad5e663e..9a29c482fc2e 100644
> --- a/drivers/soc/fsl/rcpm.c
> +++ b/drivers/soc/fsl/rcpm.c
> @@ -13,6 +13,8 @@
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
>  #include <linux/kernel.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
>=20
>  #define RCPM_WAKEUP_CELL_MAX_SIZE	7
>=20
> @@ -29,6 +31,9 @@ static int rcpm_pm_prepare(struct device *dev)
>  	struct rcpm		*rcpm;
>  	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1], tmp;
>  	int i, ret, idx;
> +	struct regmap *scfg_addr_regmap =3D NULL;
> +	u32 reg_offset[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
> +	u32 reg_value =3D 0;
>=20
>  	rcpm =3D dev_get_drvdata(dev);
>  	if (!rcpm)
> @@ -63,6 +68,34 @@ static int rcpm_pm_prepare(struct device *dev)
>  					tmp |=3D value[i + 1];
>  					iowrite32be(tmp, rcpm->ippdexpcr_base + i * 4);
>  				}
> +				/* Workaround of errata A-008646 on SoC LS1021A:
> +				 * There is a bug of register ippdexpcr1.
> +				 * Reading configuration register RCPM_IPPDEXPCR1
> +				 * always return zero. So save ippdexpcr1's value
> +				 * to register SCFG_SPARECR8.And the value of
> +				 * ippdexpcr1 will be read from SCFG_SPARECR8.
> +				 */
> +				scfg_addr_regmap =3D
> syscon_regmap_lookup_by_phandle(np,
> +
> "fsl,ippdexpcr1-alt-addr");
> +				if (scfg_addr_regmap && (1 =3D=3D i)) {
> +					if (of_property_read_u32_array(dev->of_node,
> +					    "fsl,ippdexpcr1-alt-addr",
> +					    reg_offset,
> +					    1 + sizeof(u64)/sizeof(u32))) {
> +						scfg_addr_regmap =3D NULL;
> +						continue;
> +					}
> +					/* Read value from register SCFG_SPARECR8 */
> +					regmap_read(scfg_addr_regmap,
> +						    (u32)(((u64)(reg_offset[1] << (sizeof(u32) *
> 8) |
> +						    reg_offset[2])) & 0xffffffff),
> +						    &reg_value);
> +					/* Write value to register SCFG_SPARECR8 */
> +					regmap_write(scfg_addr_regmap,
> +						     (u32)(((u64)(reg_offset[1] << (sizeof(u32) *
> 8) |
> +						     reg_offset[2])) & 0xffffffff),
> +						     tmp | reg_value);
> +				}
>  			}
>  		}
>  	} while (ws =3D wakeup_source_get_next(ws));
> --
> 2.17.1

