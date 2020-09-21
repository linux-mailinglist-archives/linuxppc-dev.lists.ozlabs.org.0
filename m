Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9632735A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 00:22:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwJpB4z2TzDqxf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 08:22:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.87; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=L/IATkV5; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150087.outbound.protection.outlook.com [40.107.15.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwJlv2Tp3zDqtp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 08:20:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ccx/k8VZ93QIY4lPXBI7vND4MymVVJLoltajNH96WYkSryYZ/5S8FCgXtibzGMSowu1xPLT8izgvVsr4R/fgblDO4pBorPNUhlu3PZffSPGMDxhRB5eE/7M77be8ROInmVcU01LQTTwtGCD9Jqp6V6FQVHD6n8TfuXksQekpW7FSL10+YkQU4ro9aqFu1bzsDozjYTOADrxQ3ayJgTswhVSEz1JIJTg9Pt99S4Desdx13ObImNWt87VbgGkfMd7GndK6nt5c6ENmlQGNSs/xfE5HGPshOO5+QzHpW2HC+XLEuADx9i+P//8dUaP8JkSbca8+Ei1VqEHksHGGJj5I4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vsRB3/qSKqX4q4pXlrwq8ZEQh96FZ9RtK+h/bIzed0=;
 b=bvFdquS9VpJcqJZx5H9Cf1UREh/sOwJfPw5jtkvLB3JgE5+sOykfD43EGiD+SXC3mQl5mz0sYlaMDWJSLNXRa90qkn4yS6q384cVTyOBN/SYe8iH+yTDZTRO0ckWMGeQRj926ULT+nq5awjWu9aPVZmHBme9JtwAu/uaNstztZtn6XEfRWyLWUa2k6LRu7acRibQqD2NymYtr4APhyTW8IN34clBVLGreYPzFKXTzaR0D8jvRAT8UCHux6RdBV5ePQwflZkZJb/HcY1j7rQlbA3UE6M4IFoJNh1L/p1bvuu4gYhJkHocpkFgh3iOCsf5Iw24Kxap9yP+F4JUffUSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vsRB3/qSKqX4q4pXlrwq8ZEQh96FZ9RtK+h/bIzed0=;
 b=L/IATkV5n545heE2gsSnKZ2GDpQxaeah3TuB22p8HwWyRvN0WNwDhHP7H9A5phGFWCLaifPDSLIXoi//W89xZdBDp3sd4HM3f3vACpNygSIK5dsRxYbDR3+1M7auQ1B4ROMvEL8jaIThhNfboSkhFc87K4kBJJwhXuJHzsoDTOg=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (2603:10a6:803:121::30)
 by VI1PR04MB4976.eurprd04.prod.outlook.com (2603:10a6:803:57::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Mon, 21 Sep
 2020 22:20:03 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d%3]) with mapi id 15.20.3391.023; Mon, 21 Sep 2020
 22:20:03 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Ran Wang <ran.wang_1@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>
Subject: RE: [PATCH 1/5] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Thread-Topic: [PATCH 1/5] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Thread-Index: AQHWjAMgLqk+44tRPE2+QRsXAFwruqlzsjoQ
Date: Mon, 21 Sep 2020 22:20:03 +0000
Message-ID: <VE1PR04MB6687A3E64431C16831D09C568F3A0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
In-Reply-To: <20200916081831.24747-1-ran.wang_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.234.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f22dc04c-0038-4db9-1d44-08d85e7c7cf7
x-ms-traffictypediagnostic: VI1PR04MB4976:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB497680B26D993AD4FFD8E9958F3A0@VI1PR04MB4976.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: naf4OFOtkKzKMhSysPoHZ2haYGMgJ/sAA2QFmAHXzMO7/uuR+3EMt/Lt/K6M6iTWexy3Lm3obtVol+1riXpY/hNo1LFv/Sqj08f3OrmSl5ElLP2FJ1ADsr3v1TsY1ssI0Gp9K2H+bjyty+pCoxb8fvIcXWUR6eMNlgbVj7d3WVncrWZTAKTeactcDImWAZx/WtQH87VNx1vMJUVpKazD0YrbvgrbWsu3JDTxVgq/UqdV3bcpMcmVNMucL+YMlbhaGeAvyqie0Xueu7jzxgXjmK5SkWsUWYvulHRQo3wFalKIbvpnww8cdYCcOKCOkwrNVbpJFdul9IOg1ec0JJMOn1MgX/0yGBHLqqbOnE1lyQ87G7LWWGuMt7GDTLGmNWpY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6687.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(366004)(396003)(376002)(346002)(52536014)(8936002)(53546011)(6506007)(71200400001)(66476007)(2906002)(55016002)(83380400001)(66556008)(9686003)(8676002)(7696005)(478600001)(64756008)(66446008)(66946007)(86362001)(5660300002)(76116006)(186003)(4326008)(26005)(54906003)(33656002)(316002)(110136005)(142933001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 4IlulXS0M4fWy/2Nc4sE0g0sPEvbQdInzFrtLIXb0j5vYKA9hb7tFUVB2eY2WjzC8w+Q90Nu1NRkiznSXE/KVPaDf2anyG1X1zPF1cxmDnAgPYtI014rx7C8pPIAv4V1zQHC/E1PJ56b9QAbuRjJflk6I/X5ELNKMgcIQ/3xFs7zbKlvTr8C8y9woHMU/DKa45b3AZGGf6kbk3LsWedMc4X91dIGa16ZehMCPxhOhb5uytcH9/AZU7KWUX/CQ67O0Ge57d8WElQfLBCEm7gYvB3xuKnp1BW0jlaBUDBh5fOijVDgNrh+GUt+25LyTCUod3XwNXCbuXT/bPK8Wna9vu1Jijs6fNOZNoeHaOYIznokskOH82UoX9VdF+OVVG6llccdct0nJlPguuTUpIqLjl3fppCUT5qtcC2MyKuUF42+qB04hDb6O78u7pDfAKdxHT8/gJ6SRANQfgT9c+DQ/3Y01MWNICN23nSwS7bQBk49RxSIJbmxA5EmjeUYpMFOF1nPVNpBet80U3WPNifhxnH8DwkCW9PZiTmUy5SWuH2BScnI+uluDqjjMSsKYmRqgJKGoW8kSZeFsYJJP31bxlsJ0E434E/SGvJb2TuFbjIZg3sdc44o8gCTMe+l5ou0ZcibvQui53ldRCwcfLiHfw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6687.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22dc04c-0038-4db9-1d44-08d85e7c7cf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 22:20:03.7251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DyO85aheuHYZpwd+EFBvEuq5KwAo1f6grX1kPU+e8gmUrO+/cai3lycJ7Wj5ND9NBniRnKmIo5mwKhvc/3j2IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4976
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
> Subject: [PATCH 1/5] Documentation: dt: binding: fsl: Add 'fsl,ippdexpcr1=
-alt-
> addr' property
>=20
> From: Biwen Li <biwen.li@nxp.com>
>=20
> The 'fsl,ippdexpcr1-alt-addr' property is used to handle an errata A-0086=
46 on
> LS1021A

It looks like the previous version of this patch has gotten the reviewed-by=
 from Rob.  It would be good to be added to the patch for new submission.

>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
>  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 19
> +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> index 5a33619..1be58a3 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> @@ -34,6 +34,11 @@ Chassis Version		Example Chips
>  Optional properties:
>   - little-endian : RCPM register block is Little Endian. Without it RCPM
>     will be Big Endian (default case).
> + - fsl,ippdexpcr1-alt-addr : The property is related to a hardware issue
> +   on SoC LS1021A and only needed on SoC LS1021A.
> +   Must include 2 entries:
> +   The first entry must be a link to the SCFG device node.
> +   The 2nd entry must be offset of register IPPDEXPCR1 in SCFG.
>=20
>  Example:
>  The RCPM node for T4240:
> @@ -43,6 +48,20 @@ The RCPM node for T4240:
>  		#fsl,rcpm-wakeup-cells =3D <2>;
>  	};
>=20
> +The RCPM node for LS1021A:
> +	rcpm: rcpm@1ee2140 {
> +		compatible =3D "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
> +		reg =3D <0x0 0x1ee2140 0x0 0x8>;
> +		#fsl,rcpm-wakeup-cells =3D <2>;
> +
> +		/*
> +		 * The second and third entry compose an alt offset
> +		 * address for IPPDEXPCR1(SCFG_SPARECR8)
> +		 */
> +		fsl,ippdexpcr1-alt-addr =3D <&scfg 0x51c>;
> +	};
> +
> +
>  * Freescale RCPM Wakeup Source Device Tree Bindings
>  -------------------------------------------
>  Required fsl,rcpm-wakeup property should be added to a device node if th=
e
> device
> --
> 2.7.4

