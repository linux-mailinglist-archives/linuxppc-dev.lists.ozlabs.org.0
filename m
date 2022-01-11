Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A9048B0D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 16:30:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYF5Q4rrWz3bZR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 02:30:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=dVTVQqL8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::621;
 helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=vladimir.oltean@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=dVTVQqL8; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYF4f2h58z2yPL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 02:30:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOtZzAkOuqUcl+a/HqE9y9A/6hyZe2Uu381pkhKR/Jz1kxlgBG/jEaI4sJZDfs5NHvXQUWEsxRDbsRzK31lmhl1HlkNSnTw0PAb8hpBymMylkrLj+zpuvDtPVGN6rqZ2/+0msJcHieH1PuYq7Ew/+wTM0w4zf32FhVWRosiFIHzXH9xnyf/xQgbC5nRUBnP8FGQVFqnbVH+sYMQKeTTw9bZ31QdVuNtXEIOPf+orptVdsj8lg8Mp23KGn43iMIS9j6yysZBA7/CGqh2+AuvArQGFwFg1tcfCrZrfndlQkIIOyh7vOhiyhH40QYrdInLL5QCgrX3sV0klMojHd4vGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY2LE4DpDTKTq5LT6LQx1P/3t4XcSPvUaKBV9aZ7cXU=;
 b=R/cNFl3VDBu4JZmE+tOHflpVXCJdY2fBe8i24twmHr7szm1cL0qy8D2k/bdUd1o6D2Gn+zgkwEYD3YeY7XLO/yMc7bljWr5t73pRF8OLFhKdP2bLIAKJHH5bRCOz7CuWdVMb5PrXgJZX6c7uoIp/aMiFigEvK1YhDSxpO89zN5V8jQskB1FjnYVWgdd6sqcErF2IC2QZr/Jt+ZDbT1hxjN9ECx6p0COzFcDEaLrwsvD4PY8AdHlKEkFLo5TwwMnVvjIGpGapzymlxY036XHeEgmZR/rnbFPIZUVk+Ww0yqNgUKLlzC+5qQjMrsuxdraUpPc75K/+MgHzJEtjIc0ZVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY2LE4DpDTKTq5LT6LQx1P/3t4XcSPvUaKBV9aZ7cXU=;
 b=dVTVQqL8dNGbZokxpcu9zjDEwVv6Rb0u+J164ghyJv0KB7zmG2bQ6VvQGSiV53yKA4X2DSCtQbtpDtgGpJJ/lq7Yvkr5tUpj/cJ2BH1ZQpiHRDhc2rzRUSblHYdG11fBd9c0+NvAujyqNW3w1gkO02uExuuS77B5qalHsEOjXbg=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR0401MB2512.eurprd04.prod.outlook.com (2603:10a6:800:4e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 15:29:48 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::c84:1f0b:cc79:9226]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::c84:1f0b:cc79:9226%3]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 15:29:48 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Subject: Re: [PATCH] powerpc: dts: add device tree for T1040RDB-REV-A
Thread-Topic: [PATCH] powerpc: dts: add device tree for T1040RDB-REV-A
Thread-Index: AQHYBv8LPgYCyvCS1UKB/8/tYVavPKxd8iOA
Date: Tue, 11 Jan 2022 15:29:47 +0000
Message-ID: <20220111152947.6zvt7j7366wsg6o2@skbuf>
References: <20220111131355.djuyn6bbirqtsama@skbuf>
 <20220111152204.3524442-1-bigunclemax@gmail.com>
In-Reply-To: <20220111152204.3524442-1-bigunclemax@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb93121a-d58b-481b-1bb3-08d9d51733dd
x-ms-traffictypediagnostic: VI1PR0401MB2512:EE_
x-microsoft-antispam-prvs: <VI1PR0401MB2512ECF51446485475805F0FE0519@VI1PR0401MB2512.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BEptss5pCd+wL2Mteq1xbGqBCCvqNv3piopmOL61HmguN3Oxn6cA9nWgM7IMV9SySshoeWTz4iGgKLk2soKCqbw/nffctPw8gECCUKSPmdDCQ/fS+fcX/+xI9xuoqRgOBzoSUQ82udR6i99t6+u5PitoGxgWlSGr3zlM1BHA4DcSQjy66iuXtRlMAJbCu8BPvRQlKgaKoir5033MmN+tUhIxUbcaxwbzcP+5rELMJcqy+AHt+DLsmlX+enfe/3ra5P0xMngBMfsiWTfj+anRotBH0xyU3EoR9fwpK9RnPieCL5yzH2+5P/C5BKX1BjTBOiu+KvWtTROtiiJJeotWPWyUGnBgsNuB5/kJ9Bl3LEqyef2V+joDN/+BtUnoA+lryPZDuS8nVH0vhT06F7jBAJ2dv1LwlHWeB1wX8umtS1BQyW0W5SYthzGs7zZa/Y3wcsrA0d+RpRytQ8+wGr1vn4cLQQ+ZeBeCRcipEqc8Ccm+Knbgzz/G4OdzJLGPBND1rfuJpC5KasoZ2qbX6XAVp+5DRNfKjKeVz+TPCKOx4HrhPiU1gjWAtH8sShaRDEGOW6jmSb3ZuqekfQcB3jQMYdZi/f6iPMygx90+cHodlPht9jWAemMKV6o7wV7WvYGBLTCpn21SVgpJrJdeIRhsTKHupTpfwNNnr355O0FsMu84R44e46z2TfUK8yWol+48UkuUrX12qZ0curgmAD0KxqIIF67fEjCR4gjRcvMyRMU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5136.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(54906003)(7416002)(6506007)(1076003)(5660300002)(6486002)(6916009)(44832011)(9686003)(38100700002)(122000001)(6512007)(76116006)(91956017)(66476007)(66446008)(66556008)(66946007)(64756008)(71200400001)(86362001)(38070700005)(8936002)(508600001)(83380400001)(186003)(26005)(316002)(8676002)(33716001)(4326008)(2906002)(2004002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ji0mnNzsho3CC2wcl7OxNTiYLWSnkFmIKX/Lc4+G2qMESnjuAKfDUkMTXJYe?=
 =?us-ascii?Q?pXmx/nJh8eRdtj7lSNeySc/HmLCdO8Cy0AvuGWBel4M8utfjYaRfxoTX24qs?=
 =?us-ascii?Q?ERM6UebxcLKOzdElmm9UWprW0ZlJUR1BFV5fwC/Hnroklkf2WFNRpweQ4L9C?=
 =?us-ascii?Q?GBXjKgXRw9b6uqugI0Vh10wr8oxl7+FM9YD3fLo53KmDfF5kibmYoy5tq56I?=
 =?us-ascii?Q?KDY0uwd+XtqqdiOVCDXKGdJakBRN5/ByCKGS4tCJWExCt04Wd9wbNCKTVJWA?=
 =?us-ascii?Q?Az4paffYm2kjVppHyX9nMo7iWw0wmYaBBpswUsHSbRUi8wgCAbKIajNXswIT?=
 =?us-ascii?Q?bPYXRGDkDaAiLtSKY7aXA2+HiesA6dRY2oNB9sq8XJ00p6b1UneoKZOM2cNW?=
 =?us-ascii?Q?GNPiiB5OFBazzg+FEhlcQiC6TJyF+MzW5zmllH8HxBvQs6msQQlr1iTkyREo?=
 =?us-ascii?Q?HGtpdEOU6rMfkc+owzcHxhIMmQqlA6x8STLUK09n4dBxmo3kKMS9KArp31re?=
 =?us-ascii?Q?41hJDlTtFZs6H7C3fZMY9C2nODbMviDs5Nlxdgi6MKszPaw7fcoxW4tXtEMc?=
 =?us-ascii?Q?AsqtMfg5VZpLJ10287nw85+gWJ1l4HBFQBF/NxbesOeZ9nzZzboBpGMu5iOA?=
 =?us-ascii?Q?9zEFTuTGAPZX2Y0imtZ1vp23J/16tUCSiQDLfoh8lsZZ+A8s6qU3ac3BA5Un?=
 =?us-ascii?Q?1HK/hVKZoN6vqbMYh8oEmXQVrYl0SdA9POQppeOSDngdP1hKsdU6MYVCF2AM?=
 =?us-ascii?Q?gKGqgawpJ8bD1owgTx3+x/xJlXo/BO8YSvML5ojgceq0/oKkL9qPXikXWMAU?=
 =?us-ascii?Q?Ollb5UmbQGKbiNVcCWaePXmANNShQxRzgk5GNBxOFnP9B9tlWFf3AQHhx36u?=
 =?us-ascii?Q?Ps5jffeFldh5J0EygxwE31zQTVKgMk6/JVjsnfpstiyCUc9sG9dHTFuMwu/w?=
 =?us-ascii?Q?aGvJG0G+NFT/wCp71kcQR2+41ZTzmGKGx/2n2/RQWLiPbN4EZG6vbEjmk8Qd?=
 =?us-ascii?Q?4RoBuHIMah7NfyQ/GdS0WYpFckiuGBlMQFfqZqVHTWCb1992PBauvxoA8jcR?=
 =?us-ascii?Q?VtBt0tnBCyIUVz8buPy3d//K0EYDxGjHf4NJUIsjkQec9fj9vpUGzaqX03ec?=
 =?us-ascii?Q?9jgWQIh4Wc2d94jvskYGop4o7Y4svx9MBgDRtJhNR3AvyCJU/S4t+hVZ0jl+?=
 =?us-ascii?Q?UjJ4xvkamf2h7q5nWfSyDhXnwHITNXkUGP7nVTp6Kc/kgAlTnAPXwLbzRXYt?=
 =?us-ascii?Q?hQKAQ2tHrEnp7kj8g0Rn3lOnJqc/67t1j/clJjIbfdyFqCTHAFbtulrVhziO?=
 =?us-ascii?Q?RG2ZoaVQazRn6iwHmDw8Vy4KqxdVrxZPLgUxBAsgenZu7jSoKxPV3xohRV9w?=
 =?us-ascii?Q?ti83R1BAHzPW4mVuifX2t1Vu1vMoQh7n2fVeUBfpKTNd1T0DMx91OArOrwrK?=
 =?us-ascii?Q?m6Es212U+kSP2NhME+pYagu+11lz6IUBG1iCBz1szylOAcSNlMWqBezrKLIL?=
 =?us-ascii?Q?YrxN6cjUM4Dlw3SMakgEopP7vi/yXNutXNtA8HfK6uTgN6+aLerW5qRNmn5M?=
 =?us-ascii?Q?7aYfihbAgKnlnbT7aJkovnU5YDmT+/y56MlKhuz4ykr62Tr9ptcvUB+Fhr0y?=
 =?us-ascii?Q?gX4S8Fj0/SQWlA0d/1vOsYs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A494E902CB82CA4E8304ED21413EC020@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb93121a-d58b-481b-1bb3-08d9d51733dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 15:29:47.9322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VLi46ibNpDbzYV8pc/xOyFkOUqmbIpaBEy4IuHx5NrhnqGX+O1kPzprusNstdCPWxVFI3wObV59ORX7sh/L2dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2512
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fido_max@inbox.ru" <fido_max@inbox.ru>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "paulus@samba.org" <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Maxim,

On Tue, Jan 11, 2022 at 06:22:04PM +0300, Maxim Kiselev wrote:
> On board rev A, the network interface labels for the switch ports
> written on the front panel are different than on rev B and later.
>=20
> This patch introduces a separate device tree for rev A.
> The main device tree is supposed to cover rev B and later.
>=20
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> ---
>  arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts | 185 +++++++++++++++++++
>  1 file changed, 185 insertions(+)
>  create mode 100644 arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts
>=20
> diff --git a/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts b/arch/powerpc/=
boot/dts/fsl/t1040rdb-rev-a.dts
> new file mode 100644
> index 0000000000000..f74486ba1d45f
> --- /dev/null
> +++ b/arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts
> @@ -0,0 +1,185 @@
> +/*
> + * T1040RDB Device Tree Source
> + *
> + * Copyright 2014 - 2015 Freescale Semiconductor Inc.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions ar=
e met:
> + *     * Redistributions of source code must retain the above copyright
> + *	 notice, this list of conditions and the following disclaimer.
> + *     * Redistributions in binary form must reproduce the above copyrig=
ht
> + *	 notice, this list of conditions and the following disclaimer in the
> + *	 documentation and/or other materials provided with the distribution.
> + *     * Neither the name of Freescale Semiconductor nor the
> + *	 names of its contributors may be used to endorse or promote products
> + *	 derived from this software without specific prior written permission=
.
> + *
> + *
> + * ALTERNATIVELY, this software may be distributed under the terms of th=
e
> + * GNU General Public License ("GPL") as published by the Free Software
> + * Foundation, either version 2 of that License or (at your option) any
> + * later version.
> + *
> + * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor "AS IS" AND ANY
> + * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMP=
LIED
> + * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE AR=
E
> + * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR A=
NY
> + * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DA=
MAGES
> + * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SE=
RVICES;
> + * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUS=
ED AND
> + * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR=
 TORT
> + * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE=
 OF THIS
> + * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + */
> +
> +/include/ "t104xsi-pre.dtsi"
> +/include/ "t104xrdb.dtsi"
> +
> +/ {
> +	model =3D "fsl,T1040RDB-REV-A";
> +	compatible =3D "fsl,T1040RDB-REV-A";
> +
> +	aliases {
> +		phy_sgmii_2 =3D &phy_sgmii_2;
> +	};
> +
> +	soc@ffe000000 {
> +		fman@400000 {
> +			ethernet@e0000 {
> +				fixed-link =3D <0 1 1000 0 0>;
> +				phy-connection-type =3D "sgmii";
> +			};
> +
> +			ethernet@e2000 {
> +				fixed-link =3D <1 1 1000 0 0>;
> +				phy-connection-type =3D "sgmii";
> +			};
> +
> +			ethernet@e4000 {
> +				phy-handle =3D <&phy_sgmii_2>;
> +				phy-connection-type =3D "sgmii";
> +			};
> +
> +			mdio@fc000 {
> +				phy_sgmii_2: ethernet-phy@3 {
> +					reg =3D <0x03>;
> +				};
> +
> +				/* VSC8514 QSGMII PHY */
> +				phy_qsgmii_0: ethernet-phy@4 {
> +					reg =3D <0x4>;
> +				};
> +
> +				phy_qsgmii_1: ethernet-phy@5 {
> +					reg =3D <0x5>;
> +				};
> +
> +				phy_qsgmii_2: ethernet-phy@6 {
> +					reg =3D <0x6>;
> +				};
> +
> +				phy_qsgmii_3: ethernet-phy@7 {
> +					reg =3D <0x7>;
> +				};
> +
> +				/* VSC8514 QSGMII PHY */
> +				phy_qsgmii_4: ethernet-phy@8 {
> +					reg =3D <0x8>;
> +				};
> +
> +				phy_qsgmii_5: ethernet-phy@9 {
> +					reg =3D <0x9>;
> +				};
> +
> +				phy_qsgmii_6: ethernet-phy@a {
> +					reg =3D <0xa>;
> +				};
> +
> +				phy_qsgmii_7: ethernet-phy@b {
> +					reg =3D <0xb>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ifc: localbus@ffe124000 {
> +		cpld@3,0 {
> +			compatible =3D "fsl,t1040rdb-cpld";
> +		};
> +	};
> +};
> +
> +#include "t1040si-post.dtsi"
> +
> +&seville_switch {
> +	status =3D "okay";
> +};
> +
> +&seville_port0 {
> +	managed =3D "in-band-status";
> +	phy-handle =3D <&phy_qsgmii_0>;
> +	phy-mode =3D "qsgmii";
> +	label =3D "ETH5";
> +	status =3D "okay";
> +};
> +
> +&seville_port1 {
> +	managed =3D "in-band-status";
> +	phy-handle =3D <&phy_qsgmii_1>;
> +	phy-mode =3D "qsgmii";
> +	label =3D "ETH4";
> +	status =3D "okay";
> +};
> +
> +&seville_port2 {
> +	managed =3D "in-band-status";
> +	phy-handle =3D <&phy_qsgmii_2>;
> +	phy-mode =3D "qsgmii";
> +	label =3D "ETH7";
> +	status =3D "okay";
> +};
> +
> +&seville_port3 {
> +	managed =3D "in-band-status";
> +	phy-handle =3D <&phy_qsgmii_3>;
> +	phy-mode =3D "qsgmii";
> +	label =3D "ETH6";
> +	status =3D "okay";
> +};
> +
> +&seville_port4 {
> +	managed =3D "in-band-status";
> +	phy-handle =3D <&phy_qsgmii_4>;
> +	phy-mode =3D "qsgmii";
> +	label =3D "ETH9";
> +	status =3D "okay";
> +};
> +
> +&seville_port5 {
> +	managed =3D "in-band-status";
> +	phy-handle =3D <&phy_qsgmii_5>;
> +	phy-mode =3D "qsgmii";
> +	label =3D "ETH8";
> +	status =3D "okay";
> +};
> +
> +&seville_port6 {
> +	managed =3D "in-band-status";
> +	phy-handle =3D <&phy_qsgmii_6>;
> +	phy-mode =3D "qsgmii";
> +	label =3D "ETH11";
> +	status =3D "okay";
> +};
> +
> +&seville_port7 {
> +	managed =3D "in-band-status";
> +	phy-handle =3D <&phy_qsgmii_7>;
> +	phy-mode =3D "qsgmii";
> +	label =3D "ETH10";
> +	status =3D "okay";
> +};
> +
> +&seville_port8 {
> +	ethernet =3D <&enet0>;
> +	status =3D "okay";
> +};
> --=20
> 2.32.0
>

This is pretty much not the patch I was expecting to see.
I was expecting to see arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dts
containing only this:

/include/ t1040rdb.dts

/ {
	model =3D "fsl,T1040RDB-REV-A";
	compatible =3D "fsl,T1040RDB-REV-A";
};

&seville_port0 {
	label =3D "ETH5";
};

&seville_port2 {
	label =3D "ETH7";
};

&seville_port4 {
	label =3D "ETH9";
};

&seville_port6 {
	label =3D "ETH11";
};

Also, I don't see the changes from your original patch applied to the
main t1040rdb.dts. Did you forget to include them?=
