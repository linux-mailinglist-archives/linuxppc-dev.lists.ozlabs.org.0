Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DD1273563
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 23:59:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwJHj3q2fzDqtp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 07:59:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.87; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=kjCOSaAz; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwJFv58vszDqsJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 07:57:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0z8N/6SRWCFrDOr7qNezmRtpGiJWX0BYFigvRwRg70nvdzKtGeFXZhomuyGJqa/I4uB+LUgN1AP3NDwkLAQTJZKJKPrZxD937JlUW21MMmdALKEyhcaZzc3HQRX1MinWmE8zfWBmvkDjjPRcf8RlHcK1MnGFsgSHjqmgN6sd8UXfUqg+n+Iag3sRGGkdkowmTQ+CNXSN4bZ94VTNuM3myYc5ow0KolaiRpl4iU24Oq50fiiVeHSCT69Y4F4azszaHV9BvZHW99JsAcYkgBF2/kcfbES36oOEBgXanDQpi4U5qG/W+Du5ww0CMjl0q0jIkJiFZ4xYlSAcodLy5yCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ20vA+CiomRWKrN0hAcQ5qW/x+xP4weEd/72EbmPog=;
 b=J89/HwC1WsFEO1BH3LMZnv93mIjpPNpZ75vdwNCOb2XhbLPulh1MsxGQn6bV2gcNflvzKWyq2vwMagqIovj1lFQDqKgKHjMQIH4pZTCTaUFQTm5shSSbov8MIZAVgmj7WK530SAtrPBU77uIk1rHcr0XHYZC7D5MU0oSNSpgx40LkPbHFN4s5jwUrZPhoolaKYdVyAZgBKMk76YqT2kOdzm0mJU9H6QbnIamN0QxYAx6y10Vk/zbkPxTuwZNDaP3EcvjQ9IzPaLNqPxf5BoX6shJTxmkIODbDn76vhir2z0/PjjOqQ6raEl51i7vg3VpAeqzZ5tlr5wsgvSNWFDj6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ20vA+CiomRWKrN0hAcQ5qW/x+xP4weEd/72EbmPog=;
 b=kjCOSaAzp7Mh/NC62T3eAJ5/A73MzAAgsiTf/3sz7yK7dBLO1BQkGV4uVbY42HB0+pr3sOfYeFGjPTmxmy78bUdyNCBuKU1IPah+n57znZbjOI6LlyCAXFL6bv+TEW8aYx2xH3cmvMefbSWUS+eop29a3XyQeS5/n9v556JYpMk=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (2603:10a6:803:121::30)
 by VI1PR0401MB2669.eurprd04.prod.outlook.com (2603:10a6:800:51::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.17; Mon, 21 Sep
 2020 21:57:32 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d%3]) with mapi id 15.20.3391.023; Mon, 21 Sep 2020
 21:57:31 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Ran Wang <ran.wang_1@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>
Subject: RE: [PATCH 5/5] arm: dts: ls1021a: fix rcpm failed to claim resource
Thread-Topic: [PATCH 5/5] arm: dts: ls1021a: fix rcpm failed to claim resource
Thread-Index: AQHWjAMizUXV2OSeWUSrl1GifobWbalzrFaw
Date: Mon, 21 Sep 2020 21:57:31 +0000
Message-ID: <VE1PR04MB66879DA9437534C3156384E98F3A0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
 <20200916081831.24747-5-ran.wang_1@nxp.com>
In-Reply-To: <20200916081831.24747-5-ran.wang_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.234.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6d3ed2af-c54c-47ad-3636-08d85e795733
x-ms-traffictypediagnostic: VI1PR0401MB2669:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0401MB2669C39C2CF6FAF6D495C9338F3A0@VI1PR0401MB2669.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:283;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9ddNPRRP7AZ2QSAO3QP6jrcDXykUKSPR4TEtoL0wuO0H9np5+XqM9KdzzzR2hd68sTlCSiE2iix3zA20S7Koh/JVa8g2wUJOwk6oFP6l899zl8v5A/DPK3MhexMn2UzzDSqjghymJixQdz7XsDXpRKzOhLAQFhe7iaJNpS2WT899v4hr+xmCSGicP4iEyQ1LygtLSKvo5GqyB+SrpP+swcz3LaDvanmGBP/ZDjqD7BZ2I+MMJvkjAPkHKoq+OrkoDKaGBFj/5qFBMDUY/IqolZFPwInRIIKzhl5emEUzinXkuota/FtlInTIcx1dKjUOC1iSv4MPQYFUPhzJBS7lZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6687.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(478600001)(83380400001)(8676002)(5660300002)(71200400001)(9686003)(55016002)(52536014)(8936002)(76116006)(66476007)(66946007)(66446008)(66556008)(64756008)(316002)(2906002)(53546011)(33656002)(86362001)(110136005)(26005)(54906003)(186003)(7696005)(6506007)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: iS6kCuawBj0OBrfBNA3wKfBz5DEF6eKfpp4MIakB/NgRyFTsz9uSKycUo0il8CEoUJOAwL6p+tQgEUHJANrwgdin/SyrmJohpFJ05CR9WL2RY7twfhGDLR0oVZq9xrf+2OmYRXc//vclI9BfJI+3XqZaETgZ/SHIekjBHA/XpkkQ+jvvJrQu+WafBtlc1yiXi237P1j0BVhgytmYcMwrQnDwkG826nUGpBgO3NF5BKWIEFiOU0qlesnLmuDhKb0U+Wk8CKAPzEN+deYIQ0Zmq687aB7WceAGlhYBbClpwSrYH7kGY+H9gR3JqKjJnnUeBNQUfrkmPYSpTOJedTdzknbqLHhzlf7UDFWmkw93BAWryStkr8iCTm0QFQdpGyrZIBLqdc+73Isx3WnlNkbxD59dBxS4YBqZSKC4ch6f24ZF4K5F3JPaCEWDccxlWOFqV/bMf8McNB/tcd1/9mJzzoKQBTT8frRprZ1IBZS+Sh0yMy4HZF+jNx6sOVvVCIIFxxmFZIRNCgMRf33n6Av69xpHndSiE+WoZoPgX7kMijMxJIsZCoPpUltPAN2lXr8YUB2zzLkALFltX/Dh7b7ntgIbCruQKt1A1ct2PsoxTgJKwgWwFsbDcp8bYfnHac9NqRQ4KYTu7NQFE2WpaeC+UQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6687.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3ed2af-c54c-47ad-3636-08d85e795733
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 21:57:31.8593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z1ntEwxdIAgJBf/E7eWF03Ax7Q9G2FhHIVBX6IvvdATc6Vf0fMGjARkHMla0HUriQHmYXwz6sNYguXuOk5H6fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2669
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
 Ran Wang <ran.wang_1@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Ran Wang <ran.wang_1@nxp.com>
> Sent: Wednesday, September 16, 2020 3:19 AM
> To: Leo Li <leoyang.li@nxp.com>; Rob Herring <robh+dt@kernel.org>;
> Shawn Guo <shawnguo@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Ran Wang
> <ran.wang_1@nxp.com>
> Subject: [PATCH 5/5] arm: dts: ls1021a: fix rcpm failed to claim resource
>=20
> The range of dcfg reg is wrong, which overlap with other device, such as =
rcpm.
> This issue causing rcpm driver failed to claim reg resource when calling
> devm_ioremap_resource().
>=20
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>

Acked-by: Li Yang <leoyang.li@nxp.com>

> ---
>  arch/arm/boot/dts/ls1021a.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.d=
tsi
> index e372630f..286c547 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -173,7 +173,7 @@
>=20
>  		dcfg: dcfg@1ee0000 {
>  			compatible =3D "fsl,ls1021a-dcfg", "syscon";
> -			reg =3D <0x0 0x1ee0000 0x0 0x10000>;
> +			reg =3D <0x0 0x1ee0000 0x0 0x1000>;
>  			big-endian;
>  		};
>=20
> --
> 2.7.4

