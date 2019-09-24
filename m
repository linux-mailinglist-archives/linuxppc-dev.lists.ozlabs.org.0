Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C5BCBFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 18:00:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d5W128wlzDqPf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 02:00:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.71; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="JtBkjlTD"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20071.outbound.protection.outlook.com [40.107.2.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d5T343yBzDqPf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 01:58:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ4JfewuqTvIgu7w4gwdqg3ib/k7aUOGA4YEMvxjUgx/3sVPYggK2hardhKuHoHGXJ6QGgYxsvQSYWTutGoVgObPLRegwrhRnW891wrDqerK9FrbImvYEw+QjBROanRH3jrnL3em2xafsIkLtkM386DkWAYx7CxX63Y9j+zLGcsUZVoSwizX9iF/ENhmY+5bX+BAWvjPaCFaT35Xn+aHK6n8EVn49/WtRoVend19Z1HVRxgtQn1oU1HzlKuNfYGdERezEGzoodjNZtDnxGFMmQx1FdKqNYX0gcOjPLM6ngD1+f8WNTuzKTUCwCV5KSHYNoV/OJdgmW5gpVWGecydAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdNR+dOuvKKacJRvcxKNBK1AoGIZGuXr0h8aSamrKzo=;
 b=Md1Vbzi3xPv/3qlfCftiOmjLVsCMopicbTkB82/AYr8XIrMcOHqvB5otuHCzh/TZAa5mF7W05bcUNlLMZuBqeVPV7rQUHaNtUk8Ts4uPw8CxpGjEnbYPvHlPlwWjHlF3mHx4WA8nlRnMCPxmOkPZUBV5ax595xzAmNVl2xlB/Uh9M7OdK8hp4V4eonlt68CQg8kd6QENNis9e9QgSkrJhqc8bkSJlV6NkuR0ac0qezprBUf5KBsVAKhoDMel/lr6NHkTwtAwRO8KVl4vwpPMTYiEe1OgZvkfCaTdNAlDg9z+xMAU+P/qp3xZnkiEsyIIwJZrk6hZ5E8Ce7PcO7TF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdNR+dOuvKKacJRvcxKNBK1AoGIZGuXr0h8aSamrKzo=;
 b=JtBkjlTDoN4TiK157SDU0ouhGSM/h65fa0nyQlkVqhfaZqunRZXTrDvvziK2d3E/H8m6HamQZPN/i+33rqYA22ZTem2WTv6wcj7336MVFw8Ma70VkvKu5XOXmT/TtTMciBQtCSNkNdryGssznQQK8+Tvz+FfwIA2yuKfO149WQE=
Received: from AM0PR04MB6676.eurprd04.prod.outlook.com (20.179.255.161) by
 AM0PR04MB5602.eurprd04.prod.outlook.com (20.178.118.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 15:58:21 +0000
Received: from AM0PR04MB6676.eurprd04.prod.outlook.com
 ([fe80::5c26:3c5f:17e0:8038]) by AM0PR04MB6676.eurprd04.prod.outlook.com
 ([fe80::5c26:3c5f:17e0:8038%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 15:58:21 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Biwen Li <biwen.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [v3,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr-alt-addr' property
Thread-Topic: [v3,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr-alt-addr' property
Thread-Index: AQHVcoOnKERg3NBKWEeinvrVMNtD66c6+UIw
Date: Tue, 24 Sep 2019 15:58:21 +0000
Message-ID: <AM0PR04MB667690EE76D327D0FC09F7818F840@AM0PR04MB6676.eurprd04.prod.outlook.com>
References: <20190924024548.4356-1-biwen.li@nxp.com>
 <20190924024548.4356-3-biwen.li@nxp.com>
In-Reply-To: <20190924024548.4356-3-biwen.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7783c7de-e7a0-43d2-16c1-08d74108065b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB5602; 
x-ms-traffictypediagnostic: AM0PR04MB5602:|AM0PR04MB5602:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB5602934205EE1BCD76BA43838F840@AM0PR04MB5602.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(199004)(189003)(13464003)(8676002)(2906002)(52536014)(2501003)(3846002)(99286004)(81166006)(71200400001)(71190400001)(7696005)(14454004)(66066001)(74316002)(33656002)(4326008)(229853002)(6246003)(55016002)(6636002)(478600001)(5660300002)(6116002)(54906003)(6506007)(53546011)(66446008)(102836004)(66556008)(66476007)(186003)(81156014)(76116006)(76176011)(66946007)(64756008)(9686003)(6436002)(26005)(86362001)(25786009)(14444005)(305945005)(7736002)(256004)(446003)(11346002)(8936002)(476003)(110136005)(486006)(316002)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5602;
 H:AM0PR04MB6676.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0dczoCsZ62W8zLCdTd3LMlHpB7mTXoKjujRzuXcb7Al7+G/sJluDH6Sln8T0Dw+QWgoNbQPOgoEBKed5AP6yTgSVTeXmXiFJQwSI5g1xshgI6FSYUvIcJXWmAW7gUwC+ih7o7FhjyK53EyDWMevBwcSAZjRkHi0h1fSBKM7rWxF27n1OXg6bv01tFCQ+67MWQiKm/hMa77NYmUTgQ9sZVTZuEXkljZvhov5B2FhJ0B33By8mAwyA3LCC+V2O76Z7Y5CnWq+vhmOLrf99m8w1eabCoWM0u+y7l7lZ0zjZ8Fvqw6T4/2DUgJ244VF7vpVulWJCDZ1AYJC9DMW38bASy/veOZ48S3MGPlZZG1yUEhu+pkNU/lpoySmP7jxcgocoVsGzKqwLO3VbUxe67cb2GPgmwOTp0LHUYiatmCG1EZg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7783c7de-e7a0-43d2-16c1-08d74108065b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 15:58:21.7621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VwlBb0n5LXv/Eu24Va0FshGFl3ssvrRmM+sUAJIdhUFKPWCi2CFG8UIOyflug7muzzNkouhYArBkIh2i9PwPhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5602
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



> -----Original Message-----
> From: Biwen Li <biwen.li@nxp.com>
> Sent: Monday, September 23, 2019 9:46 PM
> To: Leo Li <leoyang.li@nxp.com>; shawnguo@kernel.org;
> robh+dt@kernel.org; mark.rutland@arm.com; Ran Wang
> <ran.wang_1@nxp.com>
> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; Biwen Li
> <biwen.li@nxp.com>
> Subject: [v3,3/3] Documentation: dt: binding: fsl: Add 'fsl,ippdexpcr-alt=
-addr'
> property
>=20
> The 'fsl,ippdexpcr-alt-addr' property is used to handle an errata A-00864=
6 on
> LS1021A
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v3:
> 	- rename property name
> 	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
>=20
> Change in v2:
> 	- update desc of the property 'fsl,rcpm-scfg'
>=20
>  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 14
> ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> index 5a33619d881d..157dcf6da17c 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> @@ -34,6 +34,11 @@ Chassis Version		Example Chips
>  Optional properties:
>   - little-endian : RCPM register block is Little Endian. Without it RCPM
>     will be Big Endian (default case).
> + - fsl,ippdexpcr-alt-addr : Must add the property for SoC LS1021A,

You probably should mention this is related to a hardware issue on LS1021a =
and only needed on LS1021a.

> +   Must include n + 1 entries (n =3D #fsl,rcpm-wakeup-cells, such as:
> +   #fsl,rcpm-wakeup-cells equal to 2, then must include 2 + 1 entries).

#fsl,rcpm-wakeup-cells is the number of IPPDEXPCR registers on an SoC.  How=
ever you are defining an offset to scfg registers here.  Why these two are =
related?  The length here should actually be related to the #address-cells =
of the soc/.  But since this is only needed for LS1021, you can just make i=
t 3.

> +   The first entry must be a link to the SCFG device node.
> +   The non-first entry must be offset of registers of SCFG.
>=20
>  Example:
>  The RCPM node for T4240:
> @@ -43,6 +48,15 @@ The RCPM node for T4240:
>  		#fsl,rcpm-wakeup-cells =3D <2>;
>  	};
>=20
> +The RCPM node for LS1021A:
> +	rcpm: rcpm@1ee2140 {
> +		compatible =3D "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
> +		reg =3D <0x0 0x1ee2140 0x0 0x8>;
> +		#fsl,rcpm-wakeup-cells =3D <2>;
> +		fsl,ippdexpcr-alt-addr =3D <&scfg 0x0 0x51c>; /*
> SCFG_SPARECR8 */
> +	};
> +
> +
>  * Freescale RCPM Wakeup Source Device Tree Bindings
>  -------------------------------------------
>  Required fsl,rcpm-wakeup property should be added to a device node if th=
e
> device
> --
> 2.17.1

