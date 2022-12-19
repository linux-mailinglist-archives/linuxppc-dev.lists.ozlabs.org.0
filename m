Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 852FB651044
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 17:24:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NbQ5M2MB0z3c6P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 03:24:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=G0/Lj5DX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.15.80; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=camelia.groza@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=G0/Lj5DX;
	dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2080.outbound.protection.outlook.com [40.107.15.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NbQ4M6GjDz3bXL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Dec 2022 03:23:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcGz8uvuiAOk2fsYCMPOnUW5EhTZ736xvxDdffMpzdifnxMTNDF/FTp0yKr5Bxwz3EmQP7agr3CUs2nqPI3euFdhPnpF1tQ2ReGQJ2IHqRVBh4ZWt4bRv+70/aO/d/9Gcd7r+U5qEQF+jv+QprdQXywfPcVFGEQ5d06RFgnrCHU94YSYStxvBjO50Gz0eYASAvhJ5SBm8kCGOd8KiI9z9eOlAgHs3YccFs8guEet3MNGWbcpfdEWXzJR7k/vqIqa7SaMvmrPV3Lz3pbBC9UMA4Ew5hEEDibynqFVDxh60AUY/9xKUop4UPqVCYeNBiJ8vayiA8jmghxyZ1/AFVg7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmwFLLjge3MUFNaC8kfp2B7iaXIKTpBOxnKzOmLX8E4=;
 b=evesG8lsKdY9z7p3klele1+kLEvSK/CGqLuLooxbSaboTFHUVHBYI49XZSzth/fMXpWpzZ2abzhU2qXVn4nyoehLJTTnmBjPUJmRcZPFCFYju/e+bzGkRQumOVqUW/VXoDaCXSPK4v09aEnftq2D04StWusv3j8QXF7OwFyAJV88api1VhansopJmVWX1JONCG6APkb/CtkJRtbj6PWFojJgvLHcTFxbvuZas8chiRlKwzSjdPeQsjPV94lZ/RV0PJMZU33jT1bu+wN/4A9NPpsAiJwCdLQ1lLVc2O3+9rsvjJQ2WCp4o2dXfO2JruVnUCY0kZV5I/kIwK1wumEqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmwFLLjge3MUFNaC8kfp2B7iaXIKTpBOxnKzOmLX8E4=;
 b=G0/Lj5DXEQpqBejVBjCYWG0UwSKlU17xE2zdoQ0TI0toAKtw0W1ZJU/kNDEWqmxN8dZtZm6q5aWM1U/Fh270Po66i3n/WhzYFj6APzdTsvnBAL5SoaHtbICafH5OIuUKerq+xzYsXYHcVL0gUkrm//4gLJOS97tbxe9MIc7zHcI=
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by DB9PR04MB9628.eurprd04.prod.outlook.com (2603:10a6:10:30b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 16:23:09 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::75ca:4956:79f9:6d69]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::75ca:4956:79f9:6d69%7]) with mapi id 15.20.5924.016; Mon, 19 Dec 2022
 16:23:09 +0000
From: Camelia Alexandra Groza <camelia.groza@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>, "David S . Miller"
	<davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH net v2] powerpc: dts: t208x: Disable 10G on MAC1 and MAC2
Thread-Topic: [PATCH net v2] powerpc: dts: t208x: Disable 10G on MAC1 and MAC2
Thread-Index: AQHZEXQBPotIqLiZVkqXNZXBHISHtK51Z8xA
Date: Mon, 19 Dec 2022 16:23:09 +0000
Message-ID:  <VI1PR04MB5807014739D89583FF87D43EF2E59@VI1PR04MB5807.eurprd04.prod.outlook.com>
References: <20221216172937.2960054-1-sean.anderson@seco.com>
In-Reply-To: <20221216172937.2960054-1-sean.anderson@seco.com>
Accept-Language: en-GB, ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5807:EE_|DB9PR04MB9628:EE_
x-ms-office365-filtering-correlation-id: 3d9b69bc-f3e2-4c07-9eb5-08dae1dd5133
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  m1IwH/xP2FoczxUGxquYWKQ8O67KTSHg/8ducCtCIIoXnC+IgeiM+G14j3RzMr+/7FrrXr5JKIPSISOJ62rQuSCwUU17BuQI9Zar3amRecqAx4owaZheCctRxEmpt1IuWARiLh/eEHZT7RlsHeCG78RWMm1ooKFXdjE4eChEeCqelNhePmbGho4AaBU3qO7J019Je6Eqyo+Hs5l4DQYBv4rp1lYR4FeEZ6+mDzcrNSV2EsZQkKT3wkn9xUdPesFwXA74SOK6Lf/QJwYo76AQiTKF1mw4xyzbYwh9OOfW27Z3jb1BJ49ajw4XfcJRuB3g9gw2pciIAsPhMjoDN3VPOfFc9iDyS3w1Swrv21p3mkyZi4UEuJduXTqRZm6UVmlvY+03Vdb9j4TVPDOAIoRPQzL21MYsDoP9V5gZ7CmmrccuNJBSlypa3HiD6jyHT53mDBLaUYDCgFmISP/BVK4cOWoydGH7hv6tZujdD2+t9j2KleMQL2Z27v6vCJgwslGTWb4hnrxPhrmkPYWcb0uUzq1XqvvVEt4PGCqzTV63yuJGE6QDmiF0mBpn408jPGkCoEr5p+fD8552cRRghwze1kAaZtS7l8lYzp79OuLFH1l6BpPZLK1qBSRZqSnS526/TKMSwh4+c1eGVOXUQ79Ejk8cWo5Q/GSk/j5wOiB9Ky8KCZu8VxJXyCfFSHOkLe5GLT7RGns5lL8CHcrLTbBYFA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199015)(8676002)(7416002)(4326008)(5660300002)(110136005)(54906003)(52536014)(76116006)(66556008)(66946007)(66446008)(2906002)(66476007)(64756008)(71200400001)(478600001)(6506007)(9686003)(186003)(26005)(41300700001)(7696005)(53546011)(55236004)(86362001)(55016003)(83380400001)(38070700005)(8936002)(38100700002)(316002)(33656002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?32RBhJ1PbppLjxNqnMl+0o2gXo9bRyhpTvZ3RKN72UeYGUeqSvC0ZQ38rG5d?=
 =?us-ascii?Q?kcURpNBi4Ufp/YY1T+yrpibRd3j6Wa9ecL8Jsmu6eq73juf20aew8kT/jLOj?=
 =?us-ascii?Q?Do/rh4ePU3tO51sgrFvLJmJPsu6wup8nS0gbklkT2tOOlw6Ur4faZSgQHT41?=
 =?us-ascii?Q?5vWDnSwVLl9ztK7UM8llwCAfxD/dqQnZIRVnn217KV9OfuFukZevE9grVu5b?=
 =?us-ascii?Q?j4YDhjgpCdPTODrSdqFj26HRSftrx9lTEKwXKxoQ6oyYeNHKHwSWLvVKS4kg?=
 =?us-ascii?Q?CvuxviMMi33KWUaiTtXa1zFJIauyRS/3nz/K6UuyyJJ/+g+RwBgxpePWZU33?=
 =?us-ascii?Q?XbPFwLTib+X1b1LZTl9wAk9G29Fp7YCxDboCxQLa3yOpp2MRaShnyWHLgsD1?=
 =?us-ascii?Q?2BE5ihjSHMFYiW6HITWsSm8CrJVZQPWkvZizLsR6iYwHFRAWURFyfFMgs2Ph?=
 =?us-ascii?Q?fCsxpAlSOVxl6k8dlFf3iQt8Et4KAKtBzgpi2lcB31CnW3XspT2fFtwR6Mj8?=
 =?us-ascii?Q?SSaI+pGxV3rVK/kriMvdwUv74k2p5dSeQPaOw+IzAOi8O2oDQMkj3NG5W7nn?=
 =?us-ascii?Q?GJOGiWscrdsiRPAA43oHMPGjjs8XGMdRTpO3eZgEB+P8ida8h/ebrrdet6Mg?=
 =?us-ascii?Q?16dh73D1ONx0o61JGyCYD10Y5xFFSRzEpCEAUcp4leVmCV/q4sK97pIWNSoC?=
 =?us-ascii?Q?h180t3LifcD5jI16FjtIHa+uMWKYN6Bhy9YYYrD6eT55/xRahT5YEYnT8UQy?=
 =?us-ascii?Q?ZwfWD8BiSs6JdktqeI0JkfOWKd3uBY6DRzu0u0vlezrbMXq4womLrGS9OMuz?=
 =?us-ascii?Q?y2RRo7fr10KFOYgUmgE4hvnYt5x/eoncJ/Gwh/mL6GK9gmmmaIEs8vsc9hdC?=
 =?us-ascii?Q?EAc9bsBCrM+tuCMPD2iRk7cxzgJccXrGO18LhjVzMnTCAqOgP+VZSI2s5HG+?=
 =?us-ascii?Q?f1n9Pu6abKegnPPrr1Tc5OF/5nN4dzu1VewlYIMhqcZFKYfwRN/HA9Mysjn3?=
 =?us-ascii?Q?LnEkfJai/aADShdlhI0nFKGgBu1XcKrxAijQBsVeAfv6Y30gbXAuuCQMj3DK?=
 =?us-ascii?Q?BCGKNmIvSwYEBxENfDKwZ11M/Ta/s7jxm8K45LZ219qARg6y7HzsFp4ksIJX?=
 =?us-ascii?Q?dOaMewAgGssLsJrC6sUYUJVRMkn9g+jGJjMFWHJH6rYG+Df5S9lTfKEFyYH2?=
 =?us-ascii?Q?IdCD5opTmt87wMlhudToQa0N0Eg/MdT+R01JaLKmTvE6fIuh6VzNHF7Vi6W5?=
 =?us-ascii?Q?q+h6sUeaB89OWkICi9OgppeWaf1SLob5vbKk+mZPNIPQmW51WjVLrxqeFo+6?=
 =?us-ascii?Q?GZUgYHRENT44M7OFwe6GhR7iCRCu9tEnvPAb6NU1tMpINqEp8csaoee/SWS2?=
 =?us-ascii?Q?cvqzmGAxzOEiJ7VvuoTq8yy8StuuMojZZRsBh4nV0DZLDvQDu6US55ThX6xR?=
 =?us-ascii?Q?juvIeCQw0ouivZhnjAigs+IX0rZF1nTJJIiFE6XypdmffHITB/qdxlhUUzc5?=
 =?us-ascii?Q?3/4gQn4G6kUI2rJm+0XvO4qYXwPz1sZtSc+0pldWLaBYKEQOT1sK32VwTvlk?=
 =?us-ascii?Q?kHszc8FsSjO92w32CaazGzc7+2pxbAAc1U7IMLfU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9b69bc-f3e2-4c07-9eb5-08dae1dd5133
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2022 16:23:09.2237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eRpfO/HeHZ8+WfZqQ3a1khcxGv2pRCeuDjhVKXpHDQvD+vkLBT2XA1RD5sV14pJM9HGNcvR7IcgBUufAFo5wPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9628
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sean Anderson <sean.anderson@seco.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Sean Anderson <sean.anderson@seco.com>
> Sent: Friday, December 16, 2022 19:30
> To: David S . Miller <davem@davemloft.net>; netdev@vger.kernel.org
> Cc: devicetree@vger.kernel.org; Rob Herring <robh+dt@kernel.org>;
> Christophe Leroy <christophe.leroy@csgroup.eu>; Nicholas Piggin
> <npiggin@gmail.com>; Michael Ellerman <mpe@ellerman.id.au>; linuxppc-
> dev@lists.ozlabs.org; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; linux-kernel@vger.kernel.org; Cameli=
a
> Alexandra Groza <camelia.groza@nxp.com>; Sean Anderson
> <sean.anderson@seco.com>
> Subject: [PATCH net v2] powerpc: dts: t208x: Disable 10G on MAC1 and
> MAC2
>=20
> There aren't enough resources to run these ports at 10G speeds. Disable
> 10G for these ports, reverting to the previous speed.
>=20
> Fixes: 36926a7d70c2 ("powerpc: dts: t208x: Mark MAC1 and MAC2 as 10G")
> Reported-by: Camelia Alexandra Groza <camelia.groza@nxp.com>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---

Thank you.

Reviewed-by: Camelia Groza <camelia.groza@nxp.com>
Tested-by: Camelia Groza <camelia.groza@nxp.com>

> Changes in v2:
> - Remove the 10g properties, instead of removing the MAC dtsis.
>=20
>  arch/powerpc/boot/dts/fsl/t2081si-post.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
> b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
> index 74e17e134387..27714dc2f04a 100644
> --- a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi
> @@ -659,3 +659,19 @@ L2_1: l2-cache-controller@c20000 {
>  		interrupts =3D <16 2 1 9>;
>  	};
>  };
> +
> +&fman0_rx_0x08 {
> +	/delete-property/ fsl,fman-10g-port;
> +};
> +
> +&fman0_tx_0x28 {
> +	/delete-property/ fsl,fman-10g-port;
> +};
> +
> +&fman0_rx_0x09 {
> +	/delete-property/ fsl,fman-10g-port;
> +};
> +
> +&fman0_tx_0x29 {
> +	/delete-property/ fsl,fman-10g-port;
> +};
> --
> 2.35.1.1320.gc452695387.dirty

