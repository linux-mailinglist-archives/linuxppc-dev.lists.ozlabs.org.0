Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F3557CC86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 15:49:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpYpG0wQnz3cjL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 23:49:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=jE3aKPSp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.21.63; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=camelia.groza@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=jE3aKPSp;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpYnR3hWyz2xKw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 23:48:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EP//+axeTVBnu3MMpJ78+EGQIr9iwN66LY1b5hm/Z+Xc+ZruIBg4x8IWlEQB721jJUoJRw04MtND1vdrt2bjP5NMR5DKOZ57is6uM5ZDCnQDHFJM1J3OrqoYpWc74MG6UbWecm3a1l4gnj1N6ueXRfmPSwpSWyIX5KE3ZlBScuw/ONgUrJ4qtTuEU+fr8Z7jldF787pA4McQ+7HoK2YBHWmKxbg3w5y27ZG08yYPNro+m+6XIYRrXhoZlKxi0OvjSM4sjD86ddt4oybbNVWHDJEAncDUE8IrMskumEbYelLeSFRvPerbDekC+NJOYs0z6HmqmOYd/a20ZvJ/BQxxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhIoul3ysWLkl5KGJvqJ9knxNafQWa6uF6Mb7hUtUY8=;
 b=fQu4CYg4bvzBMdBZst8e8YArCtgu4d3WIla4SvPsJzs8BJ22nCJ9NWqeQHZSbOt0wk8DnzgkVheFoLX1MOiGSfn3pNMGNXsbUaKIXoLeHUlztthAi8G5Dbmf4O6rVu2UO6dTx04wOAa3A/+NqGnbV332KdsqdVsuPdHb0W2EXL6iOsIuwrCX/FIvxMoTZjF/q3k2gwWskXNGK6Rm+9fNfG2ZlVWRrqfvTK3uu8ZMqQ6o+vrewuVpNevM3jBNUWRlg+RsklhYX7YUFY4TD56pUT1pK76OHOxKHZ8aZblgyKbh2hT9wkytfksK+px8ZDtb6w/eI8h3zsEgId76e+/ARg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhIoul3ysWLkl5KGJvqJ9knxNafQWa6uF6Mb7hUtUY8=;
 b=jE3aKPSp61jvbqn7MnFcILcqyjTu4OqwF0jsUxj/SzwsjPxhdwR2tjFFPefhOKh7DRampkf46IiiDZ3o7VK1DQ2yY8TWxGiZSFBw6XijPPFE33CgF9w2EEgZNqVtPKJxXjQAG25RHEjGbkjlr1p012XdoJ+bDWZFWsrGm48QAVM=
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PAXPR04MB8783.eurprd04.prod.outlook.com (2603:10a6:102:20e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 13:48:21 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::1df3:3463:6004:6e27]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::1df3:3463:6004:6e27%4]) with mapi id 15.20.5458.018; Thu, 21 Jul 2022
 13:48:21 +0000
Content-Type: multipart/mixed;
	boundary="_000_VI1PR04MB58079B0A71B13CC3B6D1D289F2919VI1PR04MB5807eurp_"
From: Camelia Alexandra Groza <camelia.groza@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>, "David S . Miller"
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Madalin Bucur
	<madalin.bucur@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH net-next v3 42/47] powerpc: dts: qoriq: Add nodes for
 QSGMII PCSs
Thread-Topic: [PATCH net-next v3 42/47] powerpc: dts: qoriq: Add nodes for
 QSGMII PCSs
Thread-Index: AQHYmJbdnjAOsVscb0m35C49TyMPEa2I3ITg
Date: Thu, 21 Jul 2022 13:48:21 +0000
Message-ID:  <VI1PR04MB58079B0A71B13CC3B6D1D289F2919@VI1PR04MB5807.eurprd04.prod.outlook.com>
References: <20220715215954.1449214-1-sean.anderson@seco.com>
 <20220715215954.1449214-43-sean.anderson@seco.com>
In-Reply-To: <20220715215954.1449214-43-sean.anderson@seco.com>
Accept-Language: en-GB, ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator:  <VI1PR04MB58079B0A71B13CC3B6D1D289F2919@VI1PR04MB5807.eurprd04.prod.outlook.com>
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b2042d4-cfea-4d08-3136-08da6b1face0
x-ms-traffictypediagnostic: PAXPR04MB8783:EE_
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  8CxuiyX/andufj6oIrmm4Cf/AEI7emTfZTakhfS4bwBtMDZCCTIyCIGks6x3VSRtF/+d7UQGEa2ZC5I8zLMtIPawcrnxW6mQ2jD71ymrfjbVFaCoxaHLHbBRfUEVYYz3tuc2ZpOiZe6sXNm3vjcP5sKZYBTcrtcNQHRaOka80k6nOXnpB9ppwSwp3nsIFfcyTO3PtJSBFwtV7Mhazam2zfprgBvssDgID89VHjzRut8xIxYw0zlYjDoZ2HZ0odzGdShQZrktUJVvrO4IaexcuD5ZLqTdosMabfJPireNB59cfzO8DXVxUS2ICG7BvcEXJrf+kiYAfS1SshiJupx9GKAQRxXt7HOs5RdaNH98OgsIzeUbbW2pT0fUf6xuV5evsupExCpWk7tjGaZy4iI/aPWiXdj8WezvsXdcS/ECggOxjat8Zs0lCLIE2HYC1dKeECruLxut8ExXdzGA787/VaZFT0IzwTZEMb89gFNaTUPd+LAyTP80KTXL5z3dlEhrOYy6Uii3BsUbXCleDgbQm9lRpnVcxeEZgkTIcIB0vtdvjvirXbqhk0lhP+7gEp8AS/wGVQMULEQid/qAt8Frqqw+SKRfjOsWX2qeggTSUqt3t00dkosZ5hSG97nbb4GPjvJxxzzOjjeWE60BM8NkcXNT0vrfees+zcQqicOCFtG6lS+Yiw0AUkrhhCOBBP24pwa5y7Lmk+H7KRgRUvCOR1uNJZlRUmIcShr10pwnac/xsKsiNi6nOOgGAHTU9M1HW406IeEmsN3d25OrBSH0DmafB8VXTsmXevg/juOQyxE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(86362001)(66946007)(38100700002)(83380400001)(38070700005)(66476007)(122000001)(8676002)(64756008)(66556008)(66446008)(55016003)(316002)(4326008)(54906003)(71200400001)(7696005)(52536014)(30864003)(8936002)(53546011)(5660300002)(9686003)(7416002)(26005)(6506007)(2906002)(55236004)(110136005)(41300700001)(186003)(76116006)(478600001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?VogEwCJJFiX4ESkhESRwgrKYVE8qyOaL6kO7Sjt8aCisXvr4KNHshC5bHYxa?=
 =?us-ascii?Q?fDx4txyvA7m1AF9nUKcnFCLGiAv0Ro4b63WTvqa/Ng0TvvAaeawh1bKAcUOl?=
 =?us-ascii?Q?DIu/kjBzyP5fm4eFT4B7UvRkYOs5ley7yx1SKPigB1FjEW9AUbjX2TuV7ZL+?=
 =?us-ascii?Q?VYhK3BySQtZ9Taf+vBuqioiDcGQ1OTkmU3MPlB1b7StrIUQyHInXPwMc3ICy?=
 =?us-ascii?Q?xveDnQTSwahlfjSPgbKWu/rAs4zI5wLIFXwtBx+Km4L5Y76NQcEV8a/SrW+C?=
 =?us-ascii?Q?50marV7fInekIvc4Tqo4OpUi9E3RctyIYI3VhJGGo8o1aiWByo2ZAyA2NeCA?=
 =?us-ascii?Q?cyT59cSWaUaWTQLlSa0x62C/LhyTUorqVXYC+qsJJR7rYDI2rYzPAqECCQzx?=
 =?us-ascii?Q?FS2bigrKQyUrPtpRlpp9hWocLjC3g0ZRtwA/GsMhXlBRKzJwvpFjER7zMe5B?=
 =?us-ascii?Q?TdjBS3PB5fTaGkar8xnj8GU3Wfx2D71B1Vpl2a0hja4iUHWqqg8/HD0Ah2+x?=
 =?us-ascii?Q?QdrN5Um3nKag0zJXyR05VrhLlX/KVqDG62C1rQXCLFDGRmW8ixpSZyb1ryRG?=
 =?us-ascii?Q?GbNYrFYCESpI8WNOSnkl6e86W+C9E5a248jGL0/DSmBnhNkUkeJ1cEMI2RWr?=
 =?us-ascii?Q?6Mg/gHV7LT8DSrAowQkU1FqHtKQNvNVQXC/mQbnYDGdvIFlxUG0YKc65hqnb?=
 =?us-ascii?Q?vkqcOTYpULP3DVWv7FrJ8rLm5MI33+QIdS690VwopCTk0qCIW26XTutmfrdw?=
 =?us-ascii?Q?7GJROmsbRoRWhJhYmt1mP1x4iRYuMWlBEhp/yqW3RqUAOloUzpQnU/0U3QPO?=
 =?us-ascii?Q?VJmYBlv44Hycx8wNLRzFck1hXqEfIQI6loi+rpPg8KLQkocJLLhfq2TdIPy5?=
 =?us-ascii?Q?qf8kzpIDlnMoEiJDmga1GzPMQ/eUcn7ZnjHAKq5nWbCoIr8E+nnXsKV85Big?=
 =?us-ascii?Q?dhw9BY+tTliDawx7lNkF82Su3Y5E4YYj7vJBHP1YssCZCAbPkIg0CU4KEjlA?=
 =?us-ascii?Q?rL43kDG0IrpxH1Ik8jEud22Um3oAouhyVwvp5duLk1ECHmTzr6BinmppCwCW?=
 =?us-ascii?Q?LKXf3Fu5Ovpud26Cp3kFLgKOPTBzPQvMALR3LCYtLBK6lsArci5y71lHqM/g?=
 =?us-ascii?Q?hVyD3WESKKW64U1kDmwnN8lWcEeveZA9EC2+g9Mwb7JSTEB3kDsSjj4Gn+bM?=
 =?us-ascii?Q?lhg95SdMZgpOJED2KdxmcN174TNsIE3JdPrmj/0z9BbcNODbqKc5lPXVDEdK?=
 =?us-ascii?Q?iQwWsmIveCD9bPPnnGb1d1slU5WjL3v1jVuNeSLKHCgH6/PH4zTOasymDpq1?=
 =?us-ascii?Q?Gs9R3J10sapVi2S5IEbGTD3j6fkR92dGdeC/xcT3pbqazycopvrmhr7bgN84?=
 =?us-ascii?Q?LHycT4FncDs/YzOftIzCuBklLo/l18R4XKEPvec/w5b0p/+Yoptb9FnKq4CH?=
 =?us-ascii?Q?E3SC52KDUMPomF0ZYdSRcW6UTwSeDjdUt8kw2QEhdJSjRELEuBlF4ofMEMYN?=
 =?us-ascii?Q?i+c4rq4SyzlJRtghGBrf4DlWTly/Nfoh/iugQvT0S3F4CUl7qsZBLCyJ0Qkr?=
 =?us-ascii?Q?F5dSMBqDjCI6wZiJCanKzFMRWgCiIhFwHq/MHByg?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2042d4-cfea-4d08-3136-08da6b1face0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 13:48:21.4566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z4H6HQdunhrfHhT5Do//7yMYN2U9yCWluf6ZxjsPkPXyTHcvfxYqe0KcfBdXfUof3kSTeE+7DycycyWR8oJf+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8783
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Leo Li <leoyang.li@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_VI1PR04MB58079B0A71B13CC3B6D1D289F2919VI1PR04MB5807eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Linuxppc-dev <linuxppc-dev-
> bounces+camelia.groza=3Dnxp.com@lists.ozlabs.org> On Behalf Of Sean
> Anderson
> Sent: Saturday, July 16, 2022 1:00
> To: David S . Miller <davem@davemloft.net>; Jakub Kicinski
> <kuba@kernel.org>; Madalin Bucur <madalin.bucur@nxp.com>;
> netdev@vger.kernel.org
> Cc: devicetree@vger.kernel.org; Leo Li <leoyang.li@nxp.com>; Sean
> Anderson <sean.anderson@seco.com>; linuxppc-dev@lists.ozlabs.org;
> Russell King <linux@armlinux.org.uk>; linux-kernel@vger.kernel.org; Eric
> Dumazet <edumazet@google.com>; Rob Herring <robh+dt@kernel.org>;
> Paul Mackerras <paulus@samba.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Paolo Abeni <pabeni@redhat.com>;
> Shawn Guo <shawnguo@kernel.org>; linux-arm-kernel@lists.infradead.org
> Subject: [PATCH net-next v3 42/47] powerpc: dts: qoriq: Add nodes for
> QSGMII PCSs
>=20
> Now that we actually read registers from QSGMII PCSs, it's important
> that we have the correct address (instead of hoping that we're the MAC
> with all the QSGMII PCSs on its bus). This adds nodes for the QSGMII
> PCSs. They have the same addresses on all SoCs (e.g. if QSGMIIA is
> present it's used for MACs 1 through 4).
>=20
> Since the first QSGMII PCSs share an address with the SGMII and XFI
> PCSs, we only add new nodes for PCSs 2-4. This avoids address conflicts
> on the bus.
>=20
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>

MAC1 and MAC2 can be XFI on T2080. This needs to be reflected in qoriq-fman=
3-0-1g-0.dtsi
and qoriq-fman3-0-1g-1.dtsi

The two associated netdevs fail to probe on a T2080RDB without "xfi" added =
to the pcs-names:
fsl_dpaa_mac ffe4e0000.ethernet (unnamed net_device) (uninitialized): faile=
d to validate link configuration for in-band status
fsl_dpaa_mac ffe4e0000.ethernet: error -EINVAL: Could not create phylink
fsl_dpa: probe of dpaa-ethernet.0 failed with error -22

> ---
>=20
> Changes in v3:
> - Add compatibles for QSGMII PCSs
> - Split arm and powerpcs dts updates
>=20
> Changes in v2:
> - New
>=20
>  .../boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi  |  3 ++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi     | 10 +++++++++-
>  .../boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi  | 10 +++++++++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi     | 10 +++++++++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi      |  3 ++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi      | 10 +++++++++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi      | 10 +++++++++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi      | 10 +++++++++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi      |  3 ++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi      | 10 +++++++++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi     | 10 +++++++++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi     | 10 +++++++++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi      |  3 ++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi      | 10 +++++++++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi      | 10 +++++++++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi      | 10 +++++++++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi      |  3 ++-
>  arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi      | 10 +++++++++-
>  18 files changed, 127 insertions(+), 18 deletions(-)
>=20
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dt=
si
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi
> index baa0c503e741..db169d630db3 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0-best-effort.dtsi
> @@ -55,7 +55,8 @@ ethernet@e0000 {
>  		reg =3D <0xe0000 0x1000>;
>  		fsl,fman-ports =3D <&fman0_rx_0x08 &fman0_tx_0x28>;
>  		ptp-timer =3D <&ptp_timer0>;
> -		pcsphy-handle =3D <&pcsphy0>;
> +		pcsphy-handle =3D <&pcsphy0>, <&pcsphy0>;
> +		pcs-names =3D "sgmii", "qsgmii";
>  	};
>=20
>  	mdio@e1000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
> index 93095600e808..e80ad8675be8 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-0.dtsi
> @@ -52,7 +52,15 @@ ethernet@f0000 {
>  		compatible =3D "fsl,fman-memac";
>  		reg =3D <0xf0000 0x1000>;
>  		fsl,fman-ports =3D <&fman0_rx_0x10 &fman0_tx_0x30>;
> -		pcsphy-handle =3D <&pcsphy6>;
> +		pcsphy-handle =3D <&pcsphy6>, <&qsgmiib_pcs2>,
> <&pcsphy6>;
> +		pcs-names =3D "sgmii", "qsgmii", "xfi";
> +	};
> +
> +	mdio@e9000 {
> +		qsgmiib_pcs2: ethernet-pcs@2 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <2>;
> +		};
>  	};
>=20
>  	mdio@f1000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dt=
si
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
> index ff4bd38f0645..6a6f51842ad5 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1-best-effort.dtsi
> @@ -55,7 +55,15 @@ ethernet@e2000 {
>  		reg =3D <0xe2000 0x1000>;
>  		fsl,fman-ports =3D <&fman0_rx_0x09 &fman0_tx_0x29>;
>  		ptp-timer =3D <&ptp_timer0>;
> -		pcsphy-handle =3D <&pcsphy1>;
> +		pcsphy-handle =3D <&pcsphy1>, <&qsgmiia_pcs1>;
> +		pcs-names =3D "sgmii", "qsgmii";
> +	};
> +
> +	mdio@e1000 {
> +		qsgmiia_pcs1: ethernet-pcs@1 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <1>;
> +		};
>  	};
>=20
>  	mdio@e3000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
> index 1fa38ed6f59e..543da5493e40 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-10g-1.dtsi
> @@ -52,7 +52,15 @@ ethernet@f2000 {
>  		compatible =3D "fsl,fman-memac";
>  		reg =3D <0xf2000 0x1000>;
>  		fsl,fman-ports =3D <&fman0_rx_0x11 &fman0_tx_0x31>;
> -		pcsphy-handle =3D <&pcsphy7>;
> +		pcsphy-handle =3D <&pcsphy7>, <&qsgmiib_pcs3>,
> <&pcsphy7>;
> +		pcs-names =3D "sgmii", "qsgmii", "xfi";
> +	};
> +
> +	mdio@e9000 {
> +		qsgmiib_pcs3: ethernet-pcs@3 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <3>;
> +		};
>  	};
>=20
>  	mdio@f3000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
> index a8cc9780c0c4..ce76725e6eb2 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-0.dtsi
> @@ -51,7 +51,8 @@ ethernet@e0000 {
>  		reg =3D <0xe0000 0x1000>;
>  		fsl,fman-ports =3D <&fman0_rx_0x08 &fman0_tx_0x28>;
>  		ptp-timer =3D <&ptp_timer0>;
> -		pcsphy-handle =3D <&pcsphy0>;
> +		pcsphy-handle =3D <&pcsphy0>, <&pcsphy0>;
> +		pcs-names =3D "sgmii", "qsgmii";
>  	};
>=20
>  	mdio@e1000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
> index 8b8bd70c9382..f3af67df4767 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-1.dtsi
> @@ -51,7 +51,15 @@ ethernet@e2000 {
>  		reg =3D <0xe2000 0x1000>;
>  		fsl,fman-ports =3D <&fman0_rx_0x09 &fman0_tx_0x29>;
>  		ptp-timer =3D <&ptp_timer0>;
> -		pcsphy-handle =3D <&pcsphy1>;
> +		pcsphy-handle =3D <&pcsphy1>, <&qsgmiia_pcs1>;
> +		pcs-names =3D "sgmii", "qsgmii";
> +	};
> +
> +	mdio@e1000 {
> +		qsgmiia_pcs1: ethernet-pcs@1 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <1>;
> +		};
>  	};
>=20
>  	mdio@e3000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
> index 619c880b54d8..f6d74de84bfe 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-2.dtsi
> @@ -51,7 +51,15 @@ ethernet@e4000 {
>  		reg =3D <0xe4000 0x1000>;
>  		fsl,fman-ports =3D <&fman0_rx_0x0a &fman0_tx_0x2a>;
>  		ptp-timer =3D <&ptp_timer0>;
> -		pcsphy-handle =3D <&pcsphy2>;
> +		pcsphy-handle =3D <&pcsphy2>, <&qsgmiia_pcs2>;
> +		pcs-names =3D "sgmii", "qsgmii";
> +	};
> +
> +	mdio@e1000 {
> +		qsgmiia_pcs2: ethernet-pcs@2 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <2>;
> +		};
>  	};
>=20
>  	mdio@e5000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
> index d7ebb73a400d..6e091d8ae9e2 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-3.dtsi
> @@ -51,7 +51,15 @@ ethernet@e6000 {
>  		reg =3D <0xe6000 0x1000>;
>  		fsl,fman-ports =3D <&fman0_rx_0x0b &fman0_tx_0x2b>;
>  		ptp-timer =3D <&ptp_timer0>;
> -		pcsphy-handle =3D <&pcsphy3>;
> +		pcsphy-handle =3D <&pcsphy3>, <&qsgmiia_pcs3>;
> +		pcs-names =3D "sgmii", "qsgmii";
> +	};
> +
> +	mdio@e1000 {
> +		qsgmiia_pcs3: ethernet-pcs@3 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <3>;
> +		};
>  	};
>=20
>  	mdio@e7000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
> index b151d696a069..e2174c0fc841 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-4.dtsi
> @@ -51,7 +51,8 @@ ethernet@e8000 {
>  		reg =3D <0xe8000 0x1000>;
>  		fsl,fman-ports =3D <&fman0_rx_0x0c &fman0_tx_0x2c>;
>  		ptp-timer =3D <&ptp_timer0>;
> -		pcsphy-handle =3D <&pcsphy4>;
> +		pcsphy-handle =3D <&pcsphy4>, <&pcsphy4>;
> +		pcs-names =3D "sgmii", "qsgmii";
>  	};
>=20
>  	mdio@e9000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
> index adc0ae0013a3..9106815bd63e 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-0-1g-5.dtsi
> @@ -51,7 +51,15 @@ ethernet@ea000 {
>  		reg =3D <0xea000 0x1000>;
>  		fsl,fman-ports =3D <&fman0_rx_0x0d &fman0_tx_0x2d>;
>  		ptp-timer =3D <&ptp_timer0>;
> -		pcsphy-handle =3D <&pcsphy5>;
> +		pcsphy-handle =3D <&pcsphy5>, <&qsgmiib_pcs1>;
> +		pcs-names =3D "sgmii", "qsgmii";
> +	};
> +
> +	mdio@e9000 {
> +		qsgmiib_pcs1: ethernet-pcs@1 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <1>;
> +		};
>  	};
>=20
>  	mdio@eb000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
> index 435047e0e250..a3c1538dfda1 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-0.dtsi
> @@ -52,7 +52,15 @@ ethernet@f0000 {
>  		compatible =3D "fsl,fman-memac";
>  		reg =3D <0xf0000 0x1000>;
>  		fsl,fman-ports =3D <&fman1_rx_0x10 &fman1_tx_0x30>;
> -		pcsphy-handle =3D <&pcsphy14>;
> +		pcsphy-handle =3D <&pcsphy14>, <&qsgmiid_pcs2>,
> <&pcsphy14>;
> +		pcs-names =3D "sgmii", "qsgmii", "xfi";
> +	};
> +
> +	mdio@e9000 {
> +		qsgmiid_pcs2: ethernet-pcs@2 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <2>;
> +		};
>  	};
>=20
>  	mdio@f1000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
> index c098657cca0a..c024517e70d6 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-10g-1.dtsi
> @@ -52,7 +52,15 @@ ethernet@f2000 {
>  		compatible =3D "fsl,fman-memac";
>  		reg =3D <0xf2000 0x1000>;
>  		fsl,fman-ports =3D <&fman1_rx_0x11 &fman1_tx_0x31>;
> -		pcsphy-handle =3D <&pcsphy15>;
> +		pcsphy-handle =3D <&pcsphy15>, <&qsgmiid_pcs3>,
> <&pcsphy15>;
> +		pcs-names =3D "sgmii", "qsgmii", "xfi";
> +	};
> +
> +	mdio@e9000 {
> +		qsgmiid_pcs3: ethernet-pcs@3 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <3>;
> +		};
>  	};
>=20
>  	mdio@f3000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
> index 9d06824815f3..16fb299f615a 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-0.dtsi
> @@ -51,7 +51,8 @@ ethernet@e0000 {
>  		reg =3D <0xe0000 0x1000>;
>  		fsl,fman-ports =3D <&fman1_rx_0x08 &fman1_tx_0x28>;
>  		ptp-timer =3D <&ptp_timer1>;
> -		pcsphy-handle =3D <&pcsphy8>;
> +		pcsphy-handle =3D <&pcsphy8>, <&pcsphy8>;
> +		pcs-names =3D "sgmii", "qsgmii";
>  	};
>=20
>  	mdio@e1000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
> index 70e947730c4b..75cecbef8469 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-1.dtsi
> @@ -51,7 +51,15 @@ ethernet@e2000 {
>  		reg =3D <0xe2000 0x1000>;
>  		fsl,fman-ports =3D <&fman1_rx_0x09 &fman1_tx_0x29>;
>  		ptp-timer =3D <&ptp_timer1>;
> -		pcsphy-handle =3D <&pcsphy9>;
> +		pcsphy-handle =3D <&pcsphy9>, <&qsgmiic_pcs1>;
> +		pcs-names =3D "sgmii", "qsgmii";
> +	};
> +
> +	mdio@e1000 {
> +		qsgmiic_pcs1: ethernet-pcs@1 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <1>;
> +		};
>  	};
>=20
>  	mdio@e3000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
> index ad96e6529595..98c1d27f17e7 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-2.dtsi
> @@ -51,7 +51,15 @@ ethernet@e4000 {
>  		reg =3D <0xe4000 0x1000>;
>  		fsl,fman-ports =3D <&fman1_rx_0x0a &fman1_tx_0x2a>;
>  		ptp-timer =3D <&ptp_timer1>;
> -		pcsphy-handle =3D <&pcsphy10>;
> +		pcsphy-handle =3D <&pcsphy10>, <&qsgmiic_pcs2>;
> +		pcs-names =3D "sgmii", "qsgmii";
> +	};
> +
> +	mdio@e1000 {
> +		qsgmiic_pcs2: ethernet-pcs@2 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <2>;
> +		};
>  	};
>=20
>  	mdio@e5000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
> index 034bc4b71f7a..203a00036f17 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-3.dtsi
> @@ -51,7 +51,15 @@ ethernet@e6000 {
>  		reg =3D <0xe6000 0x1000>;
>  		fsl,fman-ports =3D <&fman1_rx_0x0b &fman1_tx_0x2b>;
>  		ptp-timer =3D <&ptp_timer1>;
> -		pcsphy-handle =3D <&pcsphy11>;
> +		pcsphy-handle =3D <&pcsphy11>, <&qsgmiic_pcs3>;
> +		pcs-names =3D "sgmii", "qsgmii";
> +	};
> +
> +	mdio@e1000 {
> +		qsgmiic_pcs3: ethernet-pcs@3 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <3>;
> +		};
>  	};
>=20
>  	mdio@e7000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
> index 93ca23d82b39..9366935ebc02 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-4.dtsi
> @@ -51,7 +51,8 @@ ethernet@e8000 {
>  		reg =3D <0xe8000 0x1000>;
>  		fsl,fman-ports =3D <&fman1_rx_0x0c &fman1_tx_0x2c>;
>  		ptp-timer =3D <&ptp_timer1>;
> -		pcsphy-handle =3D <&pcsphy12>;
> +		pcsphy-handle =3D <&pcsphy12>, <&pcsphy12>;
> +		pcs-names =3D "sgmii", "qsgmii";
>  	};
>=20
>  	mdio@e9000 {
> diff --git a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
> b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
> index 23b3117a2fd2..39f7c6133017 100644
> --- a/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/qoriq-fman3-1-1g-5.dtsi
> @@ -51,7 +51,15 @@ ethernet@ea000 {
>  		reg =3D <0xea000 0x1000>;
>  		fsl,fman-ports =3D <&fman1_rx_0x0d &fman1_tx_0x2d>;
>  		ptp-timer =3D <&ptp_timer1>;
> -		pcsphy-handle =3D <&pcsphy13>;
> +		pcsphy-handle =3D <&pcsphy13>, <&qsgmiid_pcs1>;
> +		pcs-names =3D "sgmii", "qsgmii";
> +	};
> +
> +	mdio@e9000 {
> +		qsgmiid_pcs1: ethernet-pcs@1 {
> +			compatible =3D "fsl,lynx-pcs";
> +			reg =3D <1>;
> +		};
>  	};
>=20
>  	mdio@eb000 {
> --
> 2.35.1.1320.gc452695387.dirty


--_000_VI1PR04MB58079B0A71B13CC3B6D1D289F2919VI1PR04MB5807eurp_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

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
AHoAYQBAAG4AeABwAC4AYwBvAG0AAAAfAGQAAQAAAAoAAABTAE0AVABQAAAAAAACAUEAAQAAAH4A
AAAAAAAAgSsfpL6jEBmdbgDdAQ9UAgAAAIBDAGEAbQBlAGwAaQBhACAAQQBsAGUAeABhAG4AZABy
AGEAIABHAHIAbwB6AGEAAABTAE0AVABQAAAAYwBhAG0AZQBsAGkAYQAuAGcAcgBvAHoAYQBAAG4A
eABwAC4AYwBvAG0AAAAAAB8AAl0BAAAALAAAAGMAYQBtAGUAbABpAGEALgBnAHIAbwB6AGEAQABu
AHgAcAAuAGMAbwBtAAAAHwDlXwEAAAA0AAAAcwBpAHAAOgBjAGEAbQBlAGwAaQBhAC4AZwByAG8A
egBhAEAAbgB4AHAALgBjAG8AbQAAAB8AGgwBAAAAMAAAAEMAYQBtAGUAbABpAGEAIABBAGwAZQB4
AGEAbgBkAHIAYQAgAEcAcgBvAHoAYQAAAB8AHwwBAAAALAAAAGMAYQBtAGUAbABpAGEALgBnAHIA
bwB6AGEAQABuAHgAcAAuAGMAbwBtAAAAHwAeDAEAAAAKAAAAUwBNAFQAUAAAAAAAAgEZDAEAAAB+
AAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAACAQwBhAG0AZQBsAGkAYQAgAEEAbABlAHgAYQBuAGQA
cgBhACAARwByAG8AegBhAAAAUwBNAFQAUAAAAGMAYQBtAGUAbABpAGEALgBnAHIAbwB6AGEAQABu
AHgAcAAuAGMAbwBtAAAAAAAfAAFdAQAAACwAAABjAGEAbQBlAGwAaQBhAC4AZwByAG8AegBhAEAA
bgB4AHAALgBjAG8AbQAAAAsAQDoBAAAAHwAaAAEAAAASAAAASQBQAE0ALgBOAG8AdABlAAAAAAAD
APE/CQQAAAsAQDoBAAAAAwD9P+QEAAACAQswAQAAABAAAACGbXo+Hfk3QamSld8AGjuKAwAXAAEA
AABAADkAgMAeigid2AFAAAgwBKhfigid2AEfADcAAQAAAJoAAABSAEUAOgAgAFsAUABBAFQAQwBI
ACAAbgBlAHQALQBuAGUAeAB0ACAAdgAzACAANAAyAC8ANAA3AF0AIABwAG8AdwBlAHIAcABjADoA
IABkAHQAcwA6ACAAcQBvAHIAaQBxADoAIABBAGQAZAAgAG4AbwBkAGUAcwAgAGYAbwByACAAUQBT
AEcATQBJAEkAIABQAEMAUwBzAAAAAAAfAD0AAQAAAAoAAABSAEUAOgAgAAAAAAADAN4/n04AAAsA
AgABAAAACwAjAAAAAAADACYAAAAAAAsAKQAAAAAACwArAAAAAAADAC4AAAAAAAMANgAAAAAAHwBw
AAEAAACSAAAAWwBQAEEAVABDAEgAIABuAGUAdAAtAG4AZQB4AHQAIAB2ADMAIAA0ADIALwA0ADcA
XQAgAHAAbwB3AGUAcgBwAGMAOgAgAGQAdABzADoAIABxAG8AcgBpAHEAOgAgAEEAZABkACAAbgBv
AGQAZQBzACAAZgBvAHIAIABRAFMARwBNAEkASQAgAFAAQwBTAHMAAAAAAAIBcQABAAAAGwAAAAEB
2JiW3Z4wDrFbHG9Jt+QuPU8jDxGtiNyE4AALAAYMAAAAAB8ANRABAAAAogAAADwAVgBJADEAUABS
ADAANABNAEIANQA4ADAANwA5AEIAMABBADcAMQBCADEAMwBDAEMAMwBCADYARAAxAEQAMgA4ADkA
RgAyADkAMQA5AEAAVgBJADEAUABSADAANABNAEIANQA4ADAANwAuAGUAdQByAHAAcgBkADAANAAu
AHAAcgBvAGQALgBvAHUAdABsAG8AbwBrAC4AYwBvAG0APgAAAAAAHwA5EAEAAADKAAAAPAAyADAA
MgAyADAANwAxADUAMgAxADUAOQA1ADQALgAxADQANAA5ADIAMQA0AC0AMQAtAHMAZQBhAG4ALgBh
AG4AZABlAHIAcwBvAG4AQABzAGUAYwBvAC4AYwBvAG0APgAgADwAMgAwADIAMgAwADcAMQA1ADIA
MQA1ADkANQA0AC4AMQA0ADQAOQAyADEANAAtADQAMwAtAHMAZQBhAG4ALgBhAG4AZABlAHIAcwBv
AG4AQABzAGUAYwBvAC4AYwBvAG0APgAAAAAAHwBCEAEAAABmAAAAPAAyADAAMgAyADAANwAxADUA
MgAxADUAOQA1ADQALgAxADQANAA5ADIAMQA0AC0ANAAzAC0AcwBlAGEAbgAuAGEAbgBkAGUAcgBz
AG8AbgBAAHMAZQBjAG8ALgBjAG8AbQA+AAAAAAADAIAQ/////wMAExIAAAAAQAAHMMitAooIndgB
AgEQMAEAAABGAAAAAAAAAPY66zzbkzVDgXtug5J5riwHAFQ39weDMRVIjfYkd89Ug0AAAAAAAQsA
AFQ39weDMRVIjfYkd89Ug0AABRftn5IAAAAAAgETMAEAAAAQAAAAnjAOsVscb0m35C49TyMPEQIB
FDABAAAADAAAAOADAADTyI/lPgAAAAMAWzMBAAAAAwBaNgAAAAADAGg2DQAAAAsA+jYBAAAAHwDZ
PwEAAAAAAgAAPgAgAC0ALQAtAC0ALQBPAHIAaQBnAGkAbgBhAGwAIABNAGUAcwBzAGEAZwBlAC0A
LQAtAC0ALQANAAoAPgAgAEYAcgBvAG0AOgAgAEwAaQBuAHUAeABwAHAAYwAtAGQAZQB2ACAAPABs
AGkAbgB1AHgAcABwAGMALQBkAGUAdgAtAA0ACgA+ACAAYgBvAHUAbgBjAGUAcwArAGMAYQBtAGUA
bABpAGEALgBnAHIAbwB6AGEAPQBuAHgAcAAuAGMAbwBtAEAAbABpAHMAdABzAC4AbwB6AGwAYQBi
AHMALgBvAHIAZwA+ACAATwBuACAAQgBlAGgAYQBsAGYAIABPAGYAIABTAGUAYQBuAA0ACgA+ACAA
QQBuAGQAZQByAHMAbwBuAA0ACgA+ACAAUwBlAG4AdAA6ACAAUwBhAHQAdQByAGQAYQB5ACwAIABK
AHUAbAB5ACAAMQA2ACwAIAAyADAAMgAyACAAMQA6ADAAMAANAAoAPgAgAFQAbwA6ACAARABhAHYA
aQBkACAAUwAgAC4AIABNAGkAbABsAGUAcgAgADwAZABhAHYAZQBtAEAAZABhAHYAZQBtAGwAbwBm
AHQALgBuAGUAdAA+ADsAIABKAGEAawB1AGIAIABLAGkAYwBpAG4AcwBrAGkADQAKAD4AIAA8AGsA
dQBiAGEAAAAfAPg/AQAAADAAAABDAGEAbQBlAGwAaQBhACAAQQBsAGUAeABhAG4AZAByAGEAIABH
AHIAbwB6AGEAAAAfAPo/AQAAADAAAABDAGEAbQBlAGwAaQBhACAAQQBsAGUAeABhAG4AZAByAGEA
IABHAHIAbwB6AGEAAAAfACJAAQAAAAYAAABFAFgAAAAAAB8AI0ABAAAA/AAAAC8ATwA9AEUAWABD
AEgAQQBOAEcARQBMAEEAQgBTAC8ATwBVAD0ARQBYAEMASABBAE4ARwBFACAAQQBEAE0ASQBOAEkA
UwBUAFIAQQBUAEkAVgBFACAARwBSAE8AVQBQACAAKABGAFkARABJAEIATwBIAEYAMgAzAFMAUABE
AEwAVAApAC8AQwBOAD0AUgBFAEMASQBQAEkARQBOAFQAUwAvAEMATgA9ADgAMAAzADcAMAAyADkA
QwA0ADgAQgAwADQAMwA0ADgAQgBEAEQAMQBEAEIAQwBFADgAQgAwADAANwBDADIANQAtAE4AWABB
ADAANwA0ADcANQAAAB8AJEABAAAABgAAAEUAWAAAAAAAHwAlQAEAAAD8AAAALwBPAD0ARQBYAEMA
SABBAE4ARwBFAEwAQQBCAFMALwBPAFUAPQBFAFgAQwBIAEEATgBHAEUAIABBAEQATQBJAE4ASQBT
AFQAUgBBAFQASQBWAEUAIABHAFIATwBVAFAAIAAoAEYAWQBEAEkAQgBPAEgARgAyADMAUwBQAEQA
TABUACkALwBDAE4APQBSAEUAQwBJAFAASQBFAE4AVABTAC8AQwBOAD0AOAAwADMANwAwADIAOQBD
ADQAOABCADAANAAzADQAOABCAEQARAAxAEQAQgBDAEUAOABCADAAMAA3AEMAMgA1AC0ATgBYAEEA
MAA3ADQANwA1AAAAHwAwQAEAAAAwAAAAQwBhAG0AZQBsAGkAYQAgAEEAbABlAHgAYQBuAGQAcgBh
ACAARwByAG8AegBhAAAAHwAxQAEAAAAwAAAAQwBhAG0AZQBsAGkAYQAgAEEAbABlAHgAYQBuAGQA
cgBhACAARwByAG8AegBhAAAAHwA4QAEAAAAwAAAAQwBhAG0AZQBsAGkAYQAgAEEAbABlAHgAYQBu
AGQAcgBhACAARwByAG8AegBhAAAAHwA5QAEAAAAwAAAAQwBhAG0AZQBsAGkAYQAgAEEAbABlAHgA
YQBuAGQAcgBhACAARwByAG8AegBhAAAAAwBZQAAAAAADAFpAAAAAAAMAN1ABAAAAAwAJWQEAAAAf
AApdAQAAACwAAABjAGEAbQBlAGwAaQBhAC4AZwByAG8AegBhAEAAbgB4AHAALgBjAG8AbQAAAB8A
C10BAAAALAAAAGMAYQBtAGUAbABpAGEALgBnAHIAbwB6AGEAQABuAHgAcAAuAGMAbwBtAAAAAgEV
XQEAAAAQAAAA06FuaCu8b0ypLNmcXDAWNQIBFl0BAAAAEAAAANOhbmgrvG9MqSzZnFwwFjULAACA
CCAGAAAAAADAAAAAAAAARgAAAAAUhQAAAAAAAAMAAIAIIAYAAAAAAMAAAAAAAABGAAAAABCFAAAA
AAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAA4UAAAAAAAADAACACCAGAAAAAADAAAAAAAAARgAA
AAABhQAAAAAAAAsAAIAIIAYAAAAAAMAAAAAAAABGAAAAAAaFAAAAAAAAAwAAgAggBgAAAAAAwAAA
AAAAAEYBAAAAMgAAAEUAeABjAGgAYQBuAGcAZQBBAHAAcABsAGkAYwBhAHQAaQBvAG4ARgBsAGEA
ZwBzAAAAAAAgAAAAHwAAgBOP8kH0gxRBpYTu21prC/8BAAAAFgAAAEMAbABpAGUAbgB0AEkAbgBm
AG8AAAAAAAEAAAAqAAAAQwBsAGkAZQBuAHQAPQBNAFMARQB4AGMAaABhAG4AZwBlAFIAUABDAAAA
AAAfAACAH6TrM6h6LkK+e3nhqY5UswEAAAA4AAAAQwBvAG4AdgBlAHIAcwBhAHQAaQBvAG4ASQBu
AGQAZQB4AFQAcgBhAGMAawBpAG4AZwBFAHgAAAABAAAAEAIAAEkASQA9AFsAQwBJAEQAPQBiADEA
MABlADMAMAA5AGUALQAxAGMANQBiAC0ANAA5ADYAZgAtAGIANwBlADQALQAyAGUAMwBkADQAZgAy
ADMAMABmADEAMQA7AEkARABYAEgARQBBAEQAPQAwADEARAA4ADkAOAA5ADYARABEADsASQBEAFgA
QwBPAFUATgBUAD0AMgBdADsAUwBCAE0ASQBEAD0AMQA4ADsAUwAxAD0APAAyADAAMgAyADAANwAx
ADUAMgAxADUAOQA1ADQALgAxADQANAA5ADIAMQA0AC0ANAAzAC0AcwBlAGEAbgAuAGEAbgBkAGUA
cgBzAG8AbgBAAHMAZQBjAG8ALgBjAG8AbQA+ADsAUgBUAFAAPQBEAGkAcgBlAGMAdABDAGgAaQBs
AGQAOwBUAEQATgA9AE0AaQBzAG0AYQB0AGMAaAA7AFQAUAA9AFIAZQBtAG8AdgBlAGQAOwBUAEYA
UgA9AFAAYQByAHQAaQBjAGkAcABhAG4AdABDAGgAYQBuAGcAZQBkADsAVgBlAHIAcwBpAG8AbgA9
AFYAZQByAHMAaQBvAG4AIAAxADUALgAyADAAIAAoAEIAdQBpAGwAZAAgADUANAA1ADgALgAwACkA
LAAgAFMAdABhAGcAZQA9AEgAMQAsACAAVABDADsAVQBQAD0ANQAwADsARABQAD0AMQAAAAsAAIAI
IAYAAAAAAMAAAAAAAABGAAAAAA6FAAAAAAAAQAAAgAggBgAAAAAAwAAAAAAAAEYAAAAAv4UAAFCU
5RAIndgBAwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAGIUAAAAAAAALAACACCAGAAAAAADAAAAAAAAA
RgAAAACChQAAAAAAAB8AAIAIIAYAAAAAAMAAAAAAAABGAAAAANiFAAABAAAAEgAAAEkAUABNAC4A
TgBvAHQAZQAAAAAAAwAAgFDjYwvMnNARvNsAgF/MzgQBAAAAJAAAAEkAbgBkAGUAeABpAG4AZwBF
AHIAcgBvAHIAQwBvAGQAZQAAABsAAAACAQCAE4/yQfSDFEGlhO7bWmsL/wEAAAAuAAAASABlAGEA
ZABlAHIAQgBvAGQAeQBGAHIAYQBnAG0AZQBuAHQATABpAHMAdAAAAAAAAQAAACIAAAABAAoAAAAE
AAAAAAAAABQAAAAAAAAAAAAAAP////8AAAAAAAAfAACAUONjC8yc0BG82wCAX8zOBAEAAAAqAAAA
SQBuAGQAZQB4AGkAbgBnAEUAcgByAG8AcgBNAGUAcwBzAGEAZwBlAAAAAAABAAAAcAAAAEkAbgBk
AGUAeABpAG4AZwAgAFAAZQBuAGQAaQBuAGcAIAB3AGgAaQBsAGUAIABCAGkAZwBGAHUAbgBuAGUA
bABQAE8ASQBJAHMAVQBwAFQAbwBEAGEAdABlACAAaQBzACAAZgBhAGwAcwBlAC4AAAALAACAUONj
C8yc0BG82wCAX8zOBAEAAAAmAAAASQBzAFAAZQByAG0AYQBuAGUAbgB0AEYAYQBpAGwAdQByAGUA
AAAAAAAAAAALAACAE4/yQfSDFEGlhO7bWmsL/wEAAAAoAAAASQBzAFEAdQBvAHQAZQBkAFQAZQB4
AHQAQwBoAGEAbgBnAGUAZAAAAAEAAAACAQCAE4/yQfSDFEGlhO7bWmsL/wEAAABAAAAAQwBvAG4A
dgBlAHIAcwBhAHQAaQBvAG4AVAByAGUAZQBQAGEAcgBlAG4AdABSAGUAYwBvAHIAZABLAGUAeQAA
AAEAAAAuAAAAAAAAAPY66zzbkzVDgXtug5J5riwBAFQ39weDMRVIjfYkd89Ug0AABjz3/x8AAAAA
AgEAgAggBgAAAAAAwAAAAAAAAEYBAAAANgAAAEkAbgBUAHIAYQBuAHMAaQB0AE0AZQBzAHMAYQBn
AGUAQwBvAHIAcgBlAGwAYQB0AG8AcgAAAAAAAQAAABAAAADmpJmREKMqTKjX8Fn3g17FCwAAgBOP
8kH0gxRBpYTu21prC/8BAAAAHAAAAEgAYQBzAFEAdQBvAHQAZQBkAFQAZQB4AHQAAAAAAAAAAwAN
NP0/AAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAuAAAAYQB1AHQAaABlAG4AdABpAGMAYQB0AGkA
bwBuAC0AcgBlAHMAdQBsAHQAcwAAAAAAAQAAALIAAABkAGsAaQBtAD0AbgBvAG4AZQAgACgAbQBl
AHMAcwBhAGcAZQAgAG4AbwB0ACAAcwBpAGcAbgBlAGQAKQAgAGgAZQBhAGQAZQByAC4AZAA9AG4A
bwBuAGUAOwBkAG0AYQByAGMAPQBuAG8AbgBlACAAYQBjAHQAaQBvAG4APQBuAG8AbgBlACAAaABl
AGEAZABlAHIALgBmAHIAbwBtAD0AbgB4AHAALgBjAG8AbQA7AAAAAAAfAACAhgMCAAAAAADAAAAA
AAAARgEAAAAeAAAAYQBjAGMAZQBwAHQAbABhAG4AZwB1AGEAZwBlAAAAAAABAAAAKAAAAGUAbgAt
AEcAQgAsACAAcgBvAC0AUgBPACwAIABlAG4ALQBVAFMAAAAfAACAhgMCAAAAAADAAAAAAAAARgEA
AAAgAAAAeAAtAG0AcwAtAGgAYQBzAC0AYQB0AHQAYQBjAGgAAAABAAAAAgAAAAAAAABIAACACCAG
AAAAAADAAAAAAAAARgEAAAAiAAAATgBlAHQAdwBvAHIAawBNAGUAcwBzAGEAZwBlAEkAZAAAAAAA
1EIge+rPCE0xNgjaax+s4B8AAICGAwIAAAAAAMAAAAAAAABGAQAAAC4AAAB4AC0AbQBzAC0AcAB1
AGIAbABpAGMAdAByAGEAZgBmAGkAYwB0AHkAcABlAAAAAAABAAAADAAAAEUAbQBhAGkAbAAAAB8A
AICGAwIAAAAAAMAAAAAAAABGAQAAAFAAAAB4AC0AbQBzAC0AbwBmAGYAaQBjAGUAMwA2ADUALQBm
AGkAbAB0AGUAcgBpAG4AZwAtAGMAbwByAHIAZQBsAGEAdABpAG8AbgAtAGkAZAAAAAEAAABKAAAA
NwBiADIAMAA0ADIAZAA0AC0AYwBmAGUAYQAtADQAZAAwADgALQAzADEAMwA2AC0AMAA4AGQAYQA2
AGIAMQBmAGEAYwBlADAAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADYAAAB4AC0AbQBzAC0A
dAByAGEAZgBmAGkAYwB0AHkAcABlAGQAaQBhAGcAbgBvAHMAdABpAGMAAAAAAAEAAAAkAAAAUABB
AFgAUABSADAANABNAEIAOAA3ADgAMwA6AEUARQBfAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAA
HgAAAHgALQBsAGQALQBwAHIAbwBjAGUAcwBzAGUAZAAAAAAAAQAAAFoAAAA2ADgANgBlAGEAMQBk
ADMALQBiAGMAMgBiAC0ANABjADYAZgAtAGEAOQAyAGMALQBkADkAOQBjADUAYwAzADAAMQA2ADMA
NQAsAEUAeAB0AEEAZABkAHIAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADgAAAB4AC0AbQBz
AC0AZQB4AGMAaABhAG4AZwBlAC0AcwBlAG4AZABlAHIAYQBkAGMAaABlAGMAawAAAAEAAAAEAAAA
MQAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADoAAAB4AC0AbQBzAC0AZQB4AGMAaABhAG4AZwBl
AC0AYQBuAHQAaQBzAHAAYQBtAC0AcgBlAGwAYQB5AAAAAAABAAAABAAAADAAAAAfAACAhgMCAAAA
AADAAAAAAAAARgEAAAAqAAAAeAAtAG0AaQBjAHIAbwBzAG8AZgB0AC0AYQBuAHQAaQBzAHAAYQBt
AAAAAAABAAAADgAAAEIAQwBMADoAMAA7AAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAABEAAAA
eAAtAG0AaQBjAHIAbwBzAG8AZgB0AC0AYQBuAHQAaQBzAHAAYQBtAC0AbQBlAHMAcwBhAGcAZQAt
AGkAbgBmAG8AAAABAAAAWgYAADgAQwB4AHUAaQB5AFgALwBhAG4AZAB1AGYAagA2AG8ASQByAG0A
bQA0AEMAZgAvAEEARQBJADcAZQBtAFQAZgBaAFQAYQBrAGgAZgBTADQAYgB3AEIAdABNAEQAWgBD
AEMAVABJAHkAQwBJAEcAawBzADYAeAAzAFYAUwBSAHQARgAvACsAZAA3AFUAUQBHAEUAYQAyAFoA
QwA1AEkAOAB6AEwATQB0AEkAUABhAHcAYwByAG4AeABXADYAbQBRADIAagBEADcAMQB5AG0AcgBm
AGoAYgBWAEYAYQBDAG8AeABhAEgATABIAGIAQgBSAGYAVQBFAFYAWQBZAHoAMwB0AHUAYwAyAFoA
cABPAGkAWgBlADYAcwBYAE4AbQAzAHYAagBjAFAANQBzAEsAWgBZAEIAVABjAHIAdABjAE4AUQBI
AFIAYQBPAGsAYQA4ADAAawA2AG4ATwBYAG4AcABCADkAcABwAHcAUwB3AHAAMwBuAHMASQBGAGYA
YwB5AFQATwAzAFAAdABKAFMAQgBGAHcAdABWADcATQBoAGEAegBhAG0AMgB6AGYAcAByAGcAQgB2
AHMAcwBEAGcASQBEADgAOQBWAEgAagB6AFIAdQB0ADgAeABJAHgAWQB3ADAAegBsAFkAagBEAG8A
WgAyAEgAWgAwAG8AZAB6AEcAZABTAGgAUQBaAHIAawB0AFUASgBWAHYAcgBPADQASQBhAGUAeABj
AHUARAA1AFoATABxAFQAZABvAHMATQBhAGIAZgBKAFAAaQByAGUATgBCADUAOQBjAGYAegBPADgA
RABYAFYAeABVAFMAMgBJAEMARwA3AEIAdgBjAEUAWABKAHIAZgArAGsAaQBZAEEAZgBTADEAUwBz
AGgAaQBKAHUAcAB4ADkARwBLAEEAUQBSAHgAWAB0ADcASABPAHMANQBSAGQAYQBOAEgAOQA4AE8A
ZwBzAEkAegBlAFUAYgBiAFcAMgBwAFQAMABmAFUAZgA2AHgAdQBWADUAZQB2AHMAdQBwAEUAeABD
AHAAVwBrADcAdABqAEcAYQBaAHkANABpAEkALwBhAFAAVwBpAFgAZABqADgAVwBlAHoAdgBzAFgA
ZABjAFMALwBFAEMAZwBnAE8AeABqAGEAdAA4AFoAcwAwAGwAQwBMAEkARQAyAEgAWQBDADEAZABL
AGUARQBDAHIAdQBMAHgAdQB0ADgARQB4AFgAZAB6AEcAQQA3ADgANwAvAFYAYQBaAEYAVAAwAEkA
egB3AFQAWgBFAE0AYgA4ADkAZwBGAE4AYQBUAFUAUABkACsATABBAHkAVABQADgAMABLAFQAWABM
ADUAegAzAGQAbABFAGgAcgBPAFkAeQA2AFUAaQBpADMAQgBzAFUAYgBYAEMAbABlAEQAZwBiAFEA
bQA5AGwAUgBwAG4AVgBjAHgAZQBFAFoAZwBrAFQASQBjAEkAQgAwAHYAdABkAHYAagB2AGkAcgBY
AGIAcQBoAGsAMABsAGgAUAArADcAZwBFAHAAOABBAFMALwB3AEcAVgBRAE0AVQBMAEUAUQBpAGQA
LwBxAEEAdAA4AEYAcgBxAHEAdwArAFMASwBSAGYAagBPAHMAVwBYADIAcQBlAGcAZwBUAFMAVQBx
AHQAMwB0ADAAMABkAGsAbwBzAFoANQBoAFMARwA5ADcAbgBiAGIANABHAFAAagB2AEoAeAB4AHoA
egBPAGoAagBlAFcARQA2ADAAQgBNADgATgBrAGMAWABOAFQAMAB2AHIAZgBlAGUAcwArAHoAYwBR
AHEAaQBjAE8AQwBGAHQARwA2AGwAUwArAFkAaQB3ADAAQQBVAGsAcgBoAGgAQwBPAEIAQgBQADIA
NABwAHcAYQA1AHkANwBMAG0AawArAEgANwBLAFIAZwBSAFUAdgBDAE8AUgAxAHUATgBKAFoAbABS
AFUAbQBJAGMAUwBoAHIAMQAwAHAAdwBuAGEAYwAvAHgAcwBLAHMAaQBOAGkANgBuAE8ATwBnAEcA
QQBIAFQAVQA5AE0AMQBIAFcANAAwADYASQBlAEUAbQBzAE4AMwBkADIANQBPAHIAQgBTAEgAMABE
AG0AYQBmAEIAOABWAFgAVABzAG0AWABlAHYAZwAvAGoAdQBPAFEAeQB4AEUAPQAAAAAAHwAAgIYD
AgAAAAAAwAAAAAAAAEYBAAAAOAAAAHgALQBmAG8AcgBlAGYAcgBvAG4AdAAtAGEAbgB0AGkAcwBw
AGEAbQAtAHIAZQBwAG8AcgB0AAAAAQAAAFwEAABDAEkAUAA6ADIANQA1AC4AMgA1ADUALgAyADUA
NQAuADIANQA1ADsAQwBUAFIAWQA6ADsATABBAE4ARwA6AGUAbgA7AFMAQwBMADoAMQA7AFMAUgBW
ADoAOwBJAFAAVgA6AE4ATABJADsAUwBGAFYAOgBOAFMAUABNADsASAA6AFYASQAxAFAAUgAwADQA
TQBCADUAOAAwADcALgBlAHUAcgBwAHIAZAAwADQALgBwAHIAbwBkAC4AbwB1AHQAbABvAG8AawAu
AGMAbwBtADsAUABUAFIAOgA7AEMAQQBUADoATgBPAE4ARQA7AFMARgBTADoAKAAxADMAMgAzADAA
MAAxADYAKQAoADQANgAzADYAMAAwADkAKQAoADMAOQA4ADYAMAA0ADAAMAAwADAAMgApACgAMwA3
ADYAMAAwADIAKQAoADMAOQA2ADAAMAAzACkAKAAxADMANgAwADAAMwApACgAMwA0ADYAMAAwADIA
KQAoADMANgA2ADAAMAA0ACkAKAA4ADYAMwA2ADIAMAAwADEAKQAoADYANgA5ADQANgAwADAANwAp
ACgAMwA4ADEAMAAwADcAMAAwADAAMAAyACkAKAA4ADMAMwA4ADAANAAwADAAMAAwADEAKQAoADMA
OAAwADcAMAA3ADAAMAAwADAANQApACgANgA2ADQANwA2ADAAMAA3ACkAKAAxADIAMgAwADAAMAAw
ADAAMQApACgAOAA2ADcANgAwADAAMgApACgANgA0ADcANQA2ADAAMAA4ACkAKAA2ADYANQA1ADYA
MAAwADgAKQAoADYANgA0ADQANgAwADAAOAApACgANQA1ADAAMQA2ADAAMAAzACkAKAAzADEANgAw
ADAAMgApACgANAAzADIANgAwADAAOAApACgANQA0ADkAMAA2ADAAMAAzACkAKAA3ADEAMgAwADAA
NAAwADAAMAAwADEAKQAoADcANgA5ADYAMAAwADUAKQAoADUAMgA1ADMANgAwADEANAApACgAMwAw
ADgANgA0ADAAMAAzACkAKAA4ADkAMwA2ADAAMAAyACkAKAA1ADMANQA0ADYAMAAxADEAKQAoADUA
NgA2ADAAMwAwADAAMAAwADIAKQAoADkANgA4ADYAMAAwADMAKQAoADcANAAxADYAMAAwADIAKQAo
ADIANgAwADAANQApACgANgA1ADAANgAwADAANwApACgAMgA5ADAANgAwADAAMgApACgANQA1ADIA
MwA2ADAAMAA0ACkAKAAxADEAMAAxADMANgAwADAANQApACgANAAxADMAMAAwADcAMAAwADAAMAAx
ACkAKAAxADgANgAwADAAMwApACgANwA2ADEAMQA2ADAAMAA2ACkAKAA0ADcAOAA2ADAAMAAwADAA
MQApACgAMwAzADYANQA2ADAAMAAyACkAOwBEAEkAUgA6AE8AVQBUADsAUwBGAFAAOgAxADEAMAAx
ADsAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAABcAAAAeAAtAG0AcwAtAGUAeABjAGgAYQBuAGcA
ZQAtAGEAbgB0AGkAcwBwAGEAbQAtAG0AZQBzAHMAYQBnAGUAZABhAHQAYQAtAGMAaAB1AG4AawBj
AG8AdQBuAHQAAAABAAAABAAAADEAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAABKAAAAeAAtAG0A
cwAtAGUAeABjAGgAYQBuAGcAZQAtAGEAbgB0AGkAcwBwAGEAbQAtAG0AZQBzAHMAYQBnAGUAZABh
AHQAYQAtADAAAAAAAAEAAACCDAAAVgBvAGcARQB3AEMASgBKAEYAaQBYADQARQBTAGsAaABFAFMA
UgB3AGcAcgBLAFkAVgBFADgAcQB5AE8AYQBMADYAawBPADcAUwBqAHQAOABhAEMAaQBzAFgAdgBy
ADQASwBOAEgAcwBoAEMANQBiAEgAWQB4AGEAZgBEAHgANAB0AHgAeQB2AEEANwBtADEAQQBGADkA
bgBVAEsAYwBuAEYAQwBMAEcAaQBBAHYAMABSAG8ANABiADYAMwBXAFQAdgBxAGEALwBOAGcAMABU
AHYAdgBBAGEAZQBhAHcAaAAxAGIASwBBAGMAVQBPAGwARABJAHUALwBrAGoAQgB6AHkAUAA1AGYA
bQA0AGUARgBUADQAQgA3AFUAdgBSAGsAWQBPAHMANQBsAGUAeQA3AHkAeAAxAFMASwBQAGkAZwBC
ADEARgBqAEUAVwA5AEEAVQBiAGoAWAAyAFQAdQBWADcAWgBMACsAVgBZAGgASwAzAEIAeQBTAFEA
dABaADkAVABhAGYAKwB2AEIAdQBxAGkAbwBpAEQAYwBHAFEAMQBPAFQAawBtAFUAMwBNAFAAbABC
ADEAYgA3AFMAdAByAEkAVQBRAHkASABJAG4AWABQAHcATQBjADMASQBDAHkAeAB2AGUARABuAFEA
VABTAHcAYQBoAGwAZgBqAFMAUABnAGIASwBXAHUALwByAEEAcwA0AHoASQA1AHcATABJAEYAWAB3
AHQAQgB4ACsASwBtADQATAA1AFkANwA2AE4AUQBjAEUAVgA4AGEALwBTAHIAVwArAEMANQAwAG0A
YQByAFYANwBmAEkAbgBlAGsASQB2AGMANABUAHEAbwA0AE8AcABVAGkAOQBFADMAUgBjAHQAeQBJ
AFkASQAzAFYAaABKAEcARwBvADgAbwAxAGEAaQBXAEIAeQBvADIAWgBBAHkAQQAyAE4AZQBDAEEA
YwB5AFQANQA5AGMAUwBXAGEAVQBhAFcAVABRAEwAbABTAGEAMAB4ADYAMgBDAC8ATABoAHkAVABV
AG8AcgBxAFYAWABZAEMAKwBxAHMASgBKAFIANwByAFkARABJADIAcgBZAHoAUABBAHEARQBDAEMA
UQB6AHgARgBTADIAYgBpAGcAcgBLAFEAeQBVAHIAUAB0AHAAUgBsAHAAcAA5AGgAVwBvAGMATABq
AEMAMwBnADAAWgBSAHQAdwBBAC8ARwBzAE0AaABYAGwAQgBSAEsAegBKAHcAdgBwAEYAagBFAFIA
NwB6AE0AZQA1AEIAVABkAGoAQgBTADMAUABCADUAZgBUAGEARwBrAGEAcgA4AHgAbgBqADgARwBV
ADMAVwBmAHgAMgBEADcAMQBCADEAVgBwAGwAMgBhADAAaABqAGEANABpAFUASABXAHEAcQBnADgA
LwBIAEQAMABBAGgAMgArAHgAUQBkAHIATgA1AFUAbQAzAG4ASwBhAGcAMAB6AEoAWAB5AFIAMAA1
AFYAcgBoAEwAbABYAC8ASwBWAHEARABHADYAMgBDADEAcgBRAFgAQwBMAEYARABHAFIAbQBXADgA
aQB4AHAAUwBaAHkAYgAxAHIAeQBSAEcARwBiAE4AWQByAEYAWQBDAEUAUwBwAEkAOABXAE4ATwBT
AG4AawBsADYAZQA4ADYAVwArAEMAOQBFADUAYQAyADQAOABqAEcATAAwAC8ARABTAG0AQgBuAGgA
TgBrAFUAawBlAEoAMQBjAEUATQBJADIAUgBXAHIANgBNAGcALwBnAEgAVgA3AEwAVAA4AEQAUwBy
AEEAbwB3AFEAawBVADEARgBxAEgAdABLAFEATgB2AE4AVgBRAFgAQwAvAG0AUQBiAG4AWQBEAEcA
ZAB2AEkARgBsAHgAVQBHADAAWQBLAGMANgA1AGgAcQBuAGIAdgBrAHEAYwBPAFQAWQBwAFUATABQ
ADMARABWAFcAdgA3AEYAcgBKADgAcgBMAG0ANQBNAEkAMwAzACsAUQBJAGQAUwA2ADkAMABWAHcA
bwBwAEMAVABrADAAcQBDAEkAVwAyADYAWABUAHUAdABtAGYAcgBkAHcANwBHAEoAUgBPAG0AcwBi
AFIAbwBSAFcAaABKAGgAWQBtAHQAMQBtAFAAMQB4ADQAaQBSAFkAdQBNAFcAbABCAEUAaABwAC8A
eQBxAFcAMwBSAHEAVQBBAE8AbABvAFUAegBwAFEAbgBVAC8AMABVADMAUQBQAE8AVgBKAG0AWQBC
AGwAdgA0ADQASAB5AGMAeAA4AHcATgBMAFIAegBGAGMAawAxAGgAWABxAEUAZgBJAFEASQA2AGwA
bwBpACsAcgBwAFAAZwA4AEsATABRAGsAbwBjAEoATABMAGgAZgBxADIAVABkAEkAUAB5ADUAcQBm
ADgAawB6AHAASQBEAGwAbgBNAG8ARQBpAEoARABtAGcAYQAxAEcAegBQAE0AUQAvAGUAVQBjAG4A
NwBaAG4AagBIAEEASwBxADUAbgBXAGIAQwBvAEkAcgA4AEUAKwBuAG4AWABzAEsAVgA4ADUAQgBp
AGcAZABoAHcAOQBCAFkAKwB0AFQAbABpAEQAYQB3AHgANwBsAE4AawBGADgAMgBTAHUAMwBZADUA
RQA0AFkAWQBqADcAdgBKAEIASABQADEAWQBzAHMAQwBaAEMAQQBiAFAAawBJAGcAMABDAFUANABL
AEUAagBsAEEAcgBMADQAMwBrAEQARwAwAEkAcgBwAHgASAAxAEkAawA4AGoARQB1AGQAMgAyAFUA
bQAzAG8AQQBvAHUAaAB5AFYAdwB2AHAANQBkAHUATABrADEARQBDAEgAbQBUAHoAcgA2AEIAaQBu
AG0AcABwAEMAdwBDAFcATABLAFgAZgAzAEYAdQA1AE8AdgBwAHUAZAAyADYAQwBwADMAawBGAEwA
ZwBLAE8AUABUAEIAegBQAFEAdgBNAEEATABSADMATABDAFkAdABMAEIASwA2AGwAcwBBAHIAYwBp
ADUAeQA3ADEAbABIAHEATQAvAGcAaABWAHkARAAzAFcARQBTAEsASwBXADYANABVADEAawBEAG0A
dwBuAE4AOABsAFcAYwBFAGUAdgBlAFoAQQA5AEUAQwAyACsAZwA5AE0AdwBiADcASgBTAFQARQBC
ADMAawBEAHMAUwBqAGoANABHAG4AKwBiAE0AbABoAGcAOQA1AFMAZABNAFoAZwBwAE8ASgBFAEQA
MgBLAGQAeABtAGMATgAxADcANABUAE4AcwBJAEUAMwBKAGQAUAByAG0AagAvADAAegA5AEIAYgBj
AE4ATwBEAGIAcQBLAGMANQBsAFAAWABWAEQARQBkAEsAaQBRAHcAVwBzAG0ASQB2AGUAQwBEADkA
YgBQAFAAbgBuAEcAYgAxAGQAMQBzAGwAVQA1AFcAagBMADMAdgAxAGoAVgB1AE4AZQBTAEwASwBI
AEMAZwBIADYALwBQAEgANAB6AFQATwBhAHMAeQBtAEQAcABxADEARwBzADkAUgAzAEoAMQAwAHMA
YQBwAFYAaQAyAFMANQBJAEUAYgBHAFQARAAzAGoANgBmAGsAUgA5ADIAZABHAGQAZQBDAC8AeABj
AFQAMwBwAGIAcQBhAHoAeQBjAG8AcAB2AHIAbQBoAHIANwBiAGcATgA4ADQATABIAHkAYwBUADQA
RgBuAGMARABzAC8AWQB6AE8AZgB0AEkAegBDAHUAQgBrAGwATABvAC8AbAAxADgAUgA0AFgASwBF
AFAAdgBlAGMALwB3ADUAYgAwAHAALwArAFkAbwBwAHQAYgA5AEYAbgBLAHEANABDAEgARQAzAFMA
QwA1ADIASwBEAFUATQBQAG8AbQBGADAAWgBZAGQAUwBSAGMAVwA2AFUAVAB3AFMAZQBEAGoAZABV
AHQAOABrAHcAMgBRAEUAaABkAEoAUwBqAFIARQBMAEUAdQBCAGwARgA0AG8AZgBNAEUATQBZAE4A
aQArAGMANAByAHEANABTAHkAegBsAEoAUgB0AGcAaABHAEIAcgBmADQARABsAFcAVABsAHkALwBO
AGYAbwBoAC8AaQB1AGcAUQB2AFQAMABTADMARgA0AEMAVQBsADcAcQBzAFoAQgBMAEMAeQBKADAA
UQBrAHIARgA1AGQAUwBNAEIAcQBEAGoAQwBJADYAdwBaAGkASgBDAGEAbgBLAHoARgBNAFIAVwBn
AEMAaQBJAGgARgB3AEgAcQAvAE0ASABCAHkAZwAAAAAAUeE=

--_000_VI1PR04MB58079B0A71B13CC3B6D1D289F2919VI1PR04MB5807eurp_--
