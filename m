Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9A3B38A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 12:54:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46X3676Kj0zF3gx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 20:54:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.71; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=biwen.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="nOh+TcjY"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20071.outbound.protection.outlook.com [40.107.2.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46X2zW5hDXzF3MW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 20:48:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5m8LBpY4xRNkZMPrkyHecDZrbasgaB16y+CjD9B5sDTwM+bU0hyS+inE5GnoPTHYK43AKyK3hZnF3uByZSGJdzZ6bVSC7O9bKqGuDvzRecAjrtb/SzgRCMcnl1fnkB56Tq1bCJTHrzn5T90j/S1osOeGp5gy9D97njVCLuFcJhGBK1m8q20CiBXGr4XXUDi7iHrQmwkNN/C5MgvBc6UAk8wHWo/GEat/JE3vUlH35x9LqHGpwZ8by7wdkuX5WeynZXuaU5dDiRVKnuhRmGF+NDmVL/nHkocnuo5eBG5YRP7inOltcJDaIzU+JJPNw/mCMdpicIohaHAHm6hDiMw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz5nCwYIolfmVGzHtBdeUgCCA5oglkLlgU3uELn8X7c=;
 b=BQMjUJLEOH1FG6eMX80/NLNbTe3gWsAqgaTdNDKSDMm2Yz7GZVQx2JpZ6SmjL0AmtYKgZrQ7a1nGCYGdlnCgZ/QvcUb+1aqPtYjmgaS18vLGEV24psLVajr6aiHrYCQ6KZkPYdYC28HmpIF4iFKnK8AwZUasyMrOkRZCx1EYLljmrDRZk3VDYQBY8ZubI8VxqJB6TKHruo+X31buNKTq2/lIH9WKZ5/cdL2T8c7eK/Vm9GIymLdj+ucIS1wafQ5ICB9WBXQA5Oa59SlL9qo4NTp6R5J3UBymYaUF2V93b6uvZfOZWbhi+XpatIJhI5zzCJoqiaStXcs0EREkYmaSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lz5nCwYIolfmVGzHtBdeUgCCA5oglkLlgU3uELn8X7c=;
 b=nOh+TcjY+AkyB2Htwc4AP6pjxuTeZiQt9yiwEh5AJEC6HRa035XgdNpZdnuXD64oYsb6K6CXeAvgLtENainJrxVTP1SOr41cX/Be3kDCv258s7IN00rIW2KMQwWe0olqpNj6CKlPwf280GTSL4P1grcyC98/ueY+hxfrFAS36TQ=
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com (52.135.138.150) by
 DB7PR04MB5099.eurprd04.prod.outlook.com (20.176.234.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Mon, 16 Sep 2019 10:48:45 +0000
Received: from DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa]) by DB7PR04MB4490.eurprd04.prod.outlook.com
 ([fe80::4427:96f2:f651:6dfa%5]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 10:48:45 +0000
From: Biwen Li <biwen.li@nxp.com>
To: Biwen Li <biwen.li@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Subject: RE: [1/3] soc: fsl: fix that flextimer cannot wakeup system in deep
 sleep on LS1021A
Thread-Topic: [1/3] soc: fsl: fix that flextimer cannot wakeup system in deep
 sleep on LS1021A
Thread-Index: AQHVbHqVUU3LCVOxq0WT1q6VQGzjvKcuHyAQ
Date: Mon, 16 Sep 2019 10:48:44 +0000
Message-ID: <DB7PR04MB4490BF979AE65793A9C34E728F8C0@DB7PR04MB4490.eurprd04.prod.outlook.com>
References: <20190916102556.16655-1-biwen.li@nxp.com>
In-Reply-To: <20190916102556.16655-1-biwen.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biwen.li@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fb400e2-4b43-459c-eca0-08d73a9372cf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB7PR04MB5099; 
x-ms-traffictypediagnostic: DB7PR04MB5099:|DB7PR04MB5099:
x-ms-exchange-purlcount: 8
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5099E05FD7FDA47A5A886F598F8C0@DB7PR04MB5099.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(199004)(53754006)(71200400001)(76176011)(110136005)(54906003)(446003)(66066001)(74316002)(11346002)(6246003)(66946007)(76116006)(229853002)(6436002)(486006)(64756008)(66556008)(66476007)(186003)(53936002)(55016002)(9686003)(6306002)(99286004)(8676002)(81156014)(81166006)(44832011)(8936002)(26005)(7696005)(102836004)(6506007)(71190400001)(33656002)(2501003)(5660300002)(52536014)(25786009)(966005)(7736002)(305945005)(476003)(66446008)(14454004)(478600001)(6116002)(3846002)(316002)(256004)(86362001)(4326008)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB5099;
 H:DB7PR04MB4490.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vaa1uh49Z48gP7WhIBR0fDz53M0rrWG2rZhbDluXF81XHM9BTUSIrZDnsGmOkeTVZK+agm1lwvfy/Adx41ZW/m62XYMElV3hozROBvGgmc09L4HGEnNNJGiEtnb/TbchDyHFNzqLeGsFRu9yg64iecBaDL06onTOHnrEIxsHBmsxjL1aOOfz0iDBRZHcNCoil3V46XDIraNvOeZfwsvIKvxf8MfPY/ofsLLsXC258JCbrr4nx9zjeeow6nQ5E25LDtopmHLkh99c8YaNgAmr+iyjT6fT9szt8GTK1caM3zIbz4auxzcZ2r/q4cwQKC12RpXi5xGgG6rOC61LcB47S9T3sYIxTaMFfPCN6erf9a1UfNPM7eK0hEi/iCxYsmdHfcLZhxcvip6ytnSFDCFtiHoyoV3/lebDU6O/4et1jlc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb400e2-4b43-459c-eca0-08d73a9372cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 10:48:45.4078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jBSEPREJh3pjwwkeSxGIYgO6Jc4X/b5WTkQdb7Nt7mC9SusXF0SzRtWlWK+LHw/NOpFDkao1xQjLYG6QYt2Ieg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5099
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
	the linux patch depended by RCPM driver,FlexTimer driver and FlexTimer dts=
, need apply these patches as follows:

	1. RCPM driver:

	https://patchwork.kernel.org/series/162731/mbox/ (https://patchwork.kernel=
.org/patch/11105279/)

	2. FlexTimer dts:

	https://lore.kernel.org/patchwork/series/405653/mbox/ (https://lore.kernel=
.org/patchwork/patch/1112493/)

	3. FlexTimer driver:

	https://patchwork.ozlabs.org/series/124718/mbox/ (https://patchwork.ozlabs=
.org/patch/1145999/)

	https://patchwork.ozlabs.org/series/126942/mbox/ (https://patchwork.ozlabs=
.org/patch/1152085/)

	4. Adjust drivers/soc/fsl/Makefile:

remove the line 'obj-y +=3D ftm_alarm.o' in drivers/soc/fsl/Makefile to res=
olve a compilation error=20
> Why:
>     - Cannot write register RCPM_IPPDEXPCR1 on LS1021A,
>       Register RCPM_IPPDEXPCR1's default value is zero.
>       So the register value that reading from register
>       RCPM_IPPDEXPCR1 is always zero.
>=20
> How:
>     - Save register RCPM_IPPDEXPCR1's value to
>       register SCFG_SPARECR8.(uboot's psci also
>       need reading value from the register SCFG_SPARECR8
>       to set register RCPM_IPPDEXPCR1)
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/soc/fsl/rcpm.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c index
> 82c0ad5e663e..2bf37d38efe5 100644
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
> @@ -63,6 +65,33 @@ static int rcpm_pm_prepare(struct device *dev)
>  					tmp |=3D value[i + 1];
>  					iowrite32be(tmp, rcpm->ippdexpcr_base + i * 4);
>  				}
> +				#ifdef CONFIG_SOC_LS1021A
> +				/* Workaround: There is a bug of register ippdexpcr1,
> +				 * cannot write it but can read it.Tt's default value is zero,
> +				 * then read it will always returns zero.
> +				 * So save ippdexpcr1's value to register SCFG_SPARECR8.
> +				 * And the value of ippdexpcr1 will be read from
> SCFG_SPARECR8.
> +				 */
> +				{
> +					struct regmap * rcpm_scfg_regmap =3D NULL;
> +					u32 reg_offset[RCPM_WAKEUP_CELL_MAX_SIZE + 1];
> +					u32 reg_value =3D 0;
> +
> +					rcpm_scfg_regmap =3D
> syscon_regmap_lookup_by_phandle(np, "fsl,rcpm-scfg");
> +					if (rcpm_scfg_regmap) {
> +						if (of_property_read_u32_array(dev->of_node,
> +						    "fsl,rcpm-scfg", reg_offset,
> rcpm->wakeup_cells + 1)) {
> +							rcpm_scfg_regmap =3D NULL;
> +							continue;
> +						}
> +						regmap_read(rcpm_scfg_regmap, reg_offset[i + 1],
> &reg_value);
> +						/* Write value to register SCFG_SPARECR8 */
> +						regmap_write(rcpm_scfg_regmap, reg_offset[i +
> 1], tmp | reg_value);
> +					}
> +				}
> +				#endif
> +
> +
>  			}
>  		}
>  	} while (ws =3D wakeup_source_get_next(ws));
> --
> 2.17.1

