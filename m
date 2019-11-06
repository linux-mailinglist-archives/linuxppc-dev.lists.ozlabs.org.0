Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E272F1462
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 11:52:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477Nf03Xp8zF5rj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 21:52:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::603;
 helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="TmPGAP/3"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::603])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477Nc60h5SzF5qd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 21:50:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1THa4ENgGt5zeS5PUnngWUk6tvLAIe+Bh8K5psJ516yNjkQj6cC10ZFnatU6nX5idUSole5ClT3dD4iHe4iQ1/85/zq1PN011XyHoYmVrcEG3oguvVPdhyK2JBsoZZGdSxncj6UIFQ9LaOvXdikQ3zYhgEqXGFTxxnxqbZ5Ftc6ovpLikMR1DMBf8vFqDiPFx9J0xDrk3+A4qOfk/d6We8V5+1utmEX+MIqU6Jwy+c+bkWdFiBZWSJ+BCyPOmLK5voyvwVn8ilexYTQeKcdQcWqAoQc7WGtNaUIQNmKh21iZ8XJbLRMmRuO4dfDD30bGNkHqJr5GncoMNG7zWTvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0QX3C80PD91klugzd+I0gq7rm8l0f4Q8ArIqfdx/C8=;
 b=kGT7XzeT7fL/ufeic2MJ7xEJMrpeHFPLQzcDzkzMZYpxbFgBK6SP14LFOQ7DPJxmOLsmzaqG70CyhwMKZHYyyr2k16KDGT5NUJUHe4DUbhBFUzyRVInej6NTLRu2k9+J7/F6SNEIxSPx1sisBmBwlgZ0OMLuNsnLlB0MewZHOlc78NYWt9k6s34JZ0/vmH0Pnv4a+kBqt6YhVdvi1ezFC1o7aXV+wBtyIph2romHwxNBFNxOgN1Fw4NEXU83GBve2j0d54UGtoWtv8EtnlrAU32FBzMjOyeHCmvCnB8Klem6AuRb4fOe6ekSBqpHBYR7EHNH6GMsmyNdC16mvmtPbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0QX3C80PD91klugzd+I0gq7rm8l0f4Q8ArIqfdx/C8=;
 b=TmPGAP/3idjE4UU+VwcUc5yRgY2BZEqQX+GbvY7zNAnQ6oIHjhJjkjNZenlRbAsxANTwnv3cKnhNsA43PakTCJiLNVdEH7kIZVF9mFn4kLxrUt2kyCdu3XY5evxYfw8lQWeed36UQaoo4eGBtvsfLJqxbJNGjChuds6xNHi+67c=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6383.eurprd04.prod.outlook.com (20.179.232.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Wed, 6 Nov 2019 10:50:35 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::9c38:e113:f0b4:f9]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::9c38:e113:f0b4:f9%7]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 10:50:35 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/2] ASoC: dt-bindings: fsl_asrc: add compatible string
 for imx8qm
Thread-Topic: [PATCH V2 1/2] ASoC: dt-bindings: fsl_asrc: add compatible
 string for imx8qm
Thread-Index: AdWUjzC3wwj9eI6oTXKcjGy6eTmZpg==
Date: Wed, 6 Nov 2019 10:50:34 +0000
Message-ID: <VE1PR04MB6479DD8BDA0A8B6981F61532E3790@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e20ddbff-caba-4f8f-18ba-08d762a72715
x-ms-traffictypediagnostic: VE1PR04MB6383:|VE1PR04MB6383:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6383608AF7B0E2FA06EF075DE3790@VE1PR04MB6383.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(189003)(199004)(478600001)(229853002)(14454004)(99286004)(8936002)(26005)(186003)(3846002)(6116002)(4326008)(25786009)(66066001)(316002)(110136005)(256004)(2906002)(14444005)(7416002)(54906003)(71190400001)(305945005)(7696005)(74316002)(81156014)(7736002)(66476007)(66946007)(66556008)(6506007)(52536014)(66446008)(64756008)(33656002)(6436002)(102836004)(76116006)(5660300002)(9686003)(55016002)(6246003)(486006)(8676002)(476003)(86362001)(71200400001)(81166006)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6383;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s59rthG3RgI8klH72jKE9UQW2witPfrZ5abu8SsjwMNQziZtZpINIpL93pU30kCJH3hhvmtRSB/TLzmI1OMJTLUgw/GTmupj6ae0qJ30LXe+A1de6aigo/2Urc89Q8y/eOmvveTHCN9YWcW0oifDqB0b12brr5LYpTpiKvv0twbt8q39ZYk2JpAKVkQDvJAo7+jDB4tQTDnOa+76u45LNoPMcnO+Onf+EOs5SVQlvRfNtqJdZ8qHij9kr54WOVNUwpMLSJYvBNKw+QvQfvjggbCe67VJz1SnhqqgS0dlt8MfilFTXYk113R/2MHrTUZQikozZR4NvcYey7GsmK31xOWwsqHfZcgPk2IPpovqHos+Vcsk5w0isloUbSL5V2oB8M6CALL3VBj00t8u5YW+b5PcJMjtx/UxKj+ObDYJhPxXihDdgdbSju81fpqLkQmX
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e20ddbff-caba-4f8f-18ba-08d762a72715
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 10:50:35.0239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wpRZHb+9dP0mkVSdFJZYBzmev3k+MOBzUVELZF9clE5pEyJUUi9WcYMjj79mAFqBheAQslvwwMeZ7n2Blkcixg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6383
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob
>=20
> Hi
> >
> > On Wed, Oct 30, 2019 at 07:41:26PM +0800, Shengjiu Wang wrote:
> > > In order to support the two asrc modules in imx8qm, we need to add
> > > compatible string "fsl,imx8qm-asrc0" and "fsl,imx8qm-asrc1"
> >
> > Are the blocks different in some way?
> >
> > If not, why do you need to distinguish them?
> >
> The internal clock mapping is different for each module.
>=20

Or we can use one compatible string, but need add another property
"fsl,asrc-clk-map" to distinguish the different clock map.

The change is in below.

Which one do you think is better?=20

Required properties:

-  - compatible         : Contains "fsl,imx35-asrc" or "fsl,imx53-asrc".
+  - compatible         : Contains "fsl,imx35-asrc", "fsl,imx53-asrc",
+                         "fsl,imx8qm-asrc".

   - reg                        : Offset and length of the register set for=
 the device.

@@ -35,6 +36,11 @@ Required properties:

    - fsl,asrc-width    : Defines a mutual sample width used by DPCM Back E=
nds.

+   - fsl,asrc-clk-map   : Defines clock map used in driver. which is requi=
red
+                         by imx8qm
+                         <0> - select the map for asrc0
+                         <1> - select the map for asrc1
+
 Optional properties:


Best regards
Wang shengjiu
