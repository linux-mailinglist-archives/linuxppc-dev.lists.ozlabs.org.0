Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AB827361F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 01:00:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwKfQ4z8zzDqx9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 09:00:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.53; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=kClv+VW0; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70053.outbound.protection.outlook.com [40.107.7.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwKcW5YJyzDqwp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 08:58:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxEURG5ZHdV8zOk55w2clAmAycb7BBc+4Kh1sFFA23G0ZzFBxWBEGPZkVNXoqVLyWCRlh9Zm9ip7iFr/PtEndmxVGBvntmiRmXKV7uRaafTI6JJ+7jU+IBkuxS18EVlREKiLp9zlDgIgOnDdWxb4nbPuJdtm90YjyOs/4wYuadyWEOE5jLqPNlh9ymN9cvp5xer5ZsA3YQmKstguzGcsh5IHQZdZqo8JJayST8N17r8g1gB+BGcwmQrsI9C3tWAYPkGIS3XXVYjATgXpLr/b81jfJsWQuxejltbsJqMv5EhmSk0N1AoamXOGsUfHpfHb8UV8rH9uDm0YNjqznu0kFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wh1DsXP3apdyJJXEjSw8UFrpNPFjiwTvJQkKtxsjMGo=;
 b=TGjJCwBOqDdJjuKRV1Ug3l2MFQ5YWiWri3fjE4S+ypAX1zhNVfB5G1Rb7jXVxoRGkR2pWA+d2xqNCNkHaN2GctuD4qXXPtzPM41guCD6+fiv3udQSfVg9+woiDWhqxmKGFILX6fyxLnXh8mnDuSTVAL/7RKJEkGFJIAn/4nU8/b4wjWHjdzzTtkXJdpils1iwnaz3AfSw5DnbJOIl1+eSMcQ//flyKmxkE/5QJSq3KqQMzIz5PVW/qNC3FrR+nz45ZbBo5BGTG3x69V7iKcuWv11hxhfADlJHTvH1jF5ksfXAIJLTrkI6xL9c8gFYnJU2T+mc+snPB9KOCZGMwc/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wh1DsXP3apdyJJXEjSw8UFrpNPFjiwTvJQkKtxsjMGo=;
 b=kClv+VW0ZWxmUavWueMx69EJ03zS6MaxxP7OazvQNABTpkLiMJa+BqGZSOMH343WdtOV+Bw/oNxThrW8x9dd0UPnwUrXYCKn1864hBtG/ji4wm3cjpykCxLvHaMWSzXqI4Oc+jWmSJh5eh/VXoKywRuIpKvSZKngNi3E9KnyVqY=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (2603:10a6:803:121::30)
 by VE1PR04MB7390.eurprd04.prod.outlook.com (2603:10a6:800:1aa::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Mon, 21 Sep
 2020 22:58:44 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d%3]) with mapi id 15.20.3391.026; Mon, 21 Sep 2020
 22:58:44 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Ran Wang <ran.wang_1@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>
Subject: RE: [PATCH 3/5] arm: dts: ls1021a: fix that FlexTimer cannot wakeup
 system in deep sleep
Thread-Topic: [PATCH 3/5] arm: dts: ls1021a: fix that FlexTimer cannot wakeup
 system in deep sleep
Thread-Index: AQHWjAMhswxDT3/1E0edsFIyVPl04alzvQYw
Date: Mon, 21 Sep 2020 22:58:44 +0000
Message-ID: <VE1PR04MB6687F86E5F609DC77E050CEA8F3A0@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
 <20200916081831.24747-3-ran.wang_1@nxp.com>
In-Reply-To: <20200916081831.24747-3-ran.wang_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.234.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 97b09f14-c63b-4b34-4fa6-08d85e81e45d
x-ms-traffictypediagnostic: VE1PR04MB7390:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB7390D4AFF913AA010D08252E8F3A0@VE1PR04MB7390.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ueCwD9lzAG9m8IuqKYH9drIu9UPLrmUKUcRHD2122MoHrll0RjzOUmu84hJsEHp++TIfDMhAO1yci9iGF/nOHZsVHI2wFvqMOkvNdYh9Da01fJXDyKK2SFEhjN3kujJjIwxmfTN7ln9PkVU0ZDZSzgldJQmdRX/hbNa5TWFWJp3/J1OX97lkvdczeSp5sP9LScOR8JwMeYVU0qVXW/7sooUWoxjqf2B7EoAxyHvazUYgdUA3jd4SRaaDSyDHFRE8KpVEHMTRjUFx+J2kkn30sbakIS+RViPflxzLMxiRU03gtB8g+659/JXg5pKBWSGL+4C5PkxtusqXkDlS6vQi4fMtwF6HeVwDXTcPCuzG9J4Xja4Vx+hSt1oVnyXg4BwZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6687.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(64756008)(66556008)(66476007)(66946007)(66446008)(71200400001)(478600001)(76116006)(86362001)(52536014)(8676002)(2906002)(54906003)(6506007)(8936002)(316002)(26005)(110136005)(186003)(7696005)(53546011)(33656002)(9686003)(4326008)(5660300002)(55016002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Y982GyhMYcLEz8gAhrymH/I90F94rCbcLAN1ZRHg/J4oXXmBq6OYr0E5Ldp/Lpiu61XX4wPqChd9v8nCfGhZYhOL1XLEZNXpSLBNM+7ejI8HZfYb7M4z4RQNLafx4XYFqCJaPIEE5zFGpCy5l5tWCKhOkOvVjRKO2By1uj62EuYP5nYduXVwopQUbW/U2eK3IXDagCs59ayQ8cb2Fo/7vI1J3Z24PfY8lVEqLBZDAA1RkJDEwwV1hTKGJzLvDFakyjk8N4a7bKNc692BXLqIbsBDTEEB+hv1Em97QbCXE15tDiQ2fDqqRd37beO8IsnI8RPcMtFerMq+uM/7HU2YAWWakvsV8UJRkItBRl86V4wlq2HKNXK2NGzun0xWLN8qev0hBDCyBgql5voUQKEiH24ziTXeeqyQADYOvocRygpS0uucb9FtWriBVWka2igbVMu/ycyH6RIU2anIQsyp2NeIOiNoxKtp7DdD7OxJxs8FpiSj/xhsKY1+dYW1fLDBh9/zGDU6nxPEhBSO49WLskyISfS9+DLzdMhUwfth3m7KH02VdGA6vo5nZiEBoZ/K4NP8nHj3ohWKgjD9VDFCFNB7mt9HwlXKRbwwuO7ZCq/AcaNz6l6s2pHUkGgDUQmNhT77m/OQ2fUYZl5K3+uoTw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6687.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b09f14-c63b-4b34-4fa6-08d85e81e45d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 22:58:44.6118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l9IpCjZMgb+1ThYtOyz3KdjYiJcuK3gFiOcRR7ecX2SWR5ZHORMPiBcEBqfqEWjIIL7JJLFpT0RJs4+WiJmNYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7390
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
> Subject: [PATCH 3/5] arm: dts: ls1021a: fix that FlexTimer cannot wakeup
> system in deep sleep

A better description should be enabling the A-008646 workaround to be consi=
stent with other patches.

>=20
> From: Biwen Li <biwen.li@nxp.com>
>=20
> The patch fixes a bug that FlexTimer cannot wakeup system in deep sleep.
>=20
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
>  arch/arm/boot/dts/ls1021a.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.d=
tsi
> index 827373e..089fe86 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -1007,6 +1007,7 @@
>  			compatible =3D "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-
> 2.1+";
>  			reg =3D <0x0 0x1ee2140 0x0 0x8>;
>  			#fsl,rcpm-wakeup-cells =3D <2>;
> +			fsl,ippdexpcr1-alt-addr =3D <&scfg 0x51c>;
>  		};
>=20
>  		ftm_alarm0: timer0@29d0000 {
> --
> 2.7.4

