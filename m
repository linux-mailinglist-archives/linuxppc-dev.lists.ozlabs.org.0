Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6425123AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 22:10:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpVGj300lz3blK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 06:10:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=MlDH8nrb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::61a;
 helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=MlDH8nrb; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::61a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpVFt1PwCz2yMP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 06:09:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVOwz5vod4jxVqw749qE/7Z/f1f8HlVUNZrsBE1POt1A+TxmBAx+GpQalkK/acfoDPiKcir89L9kH0XwJRbxU3AGnezmYXxnrSdRTpax7OIqF3DfqeCDv0u/itcn0C1XpMNKeB44nQds1vLAL8h3Xg1uxmmbDFp++0ILCxqU2o075xLXYKbWb/uJeYSG95L11aiu9e0V/G3uOyPmX/7b4YJN/E0vyyhxnIYmQAag1iAVVP3xith3lYNTjwLOpKZ09kFSU98oE0BHFBpGCBNqHcX9ona9WTe5axKzltZzbfDpWs3UMViubAu208uHfVprO62Ho8p5x4ImXYGzoWNaFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYW7DSBK13QbKY+g51JEtyjjDXuh4XlkIvcfRfdk0JE=;
 b=dpL9bgm9saO2nqkxfeKuoh+3l5oleLEqoP5IDACu0ZGPB7rlJZQtZBA+96OagMnZL1rDxXjuMv3c42SWxPFbpRSF9kvzUz+tACPHlaVCKs3X297LeOVyDIe2seGOgPzkRPhk2X+ubjhULjWofHhHtuXEiYvYqAk65t4ju4J9SihHcMG4QF6eQS3H1frWCseUWCJpd5jKskiC7d67kvXrHaJ3isP5hzYnqu9U9Fai5VFIqipeS9ZtG8+r22RXZZPUczDmLwrx5OQaU9cL27OjCNr2aws0fLq+3qjmBy5zHQU7eqwYm4XU4ICprMEbF5mc0U5/pA0C475RzcfkURaDeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYW7DSBK13QbKY+g51JEtyjjDXuh4XlkIvcfRfdk0JE=;
 b=MlDH8nrbkeXlChSL+trqsjTwyx7GavUjPE7p946idiVvQXINnAdJZ+W738VOhMVr/AHC9lofGqhgI3DZM3mSnNNtBMXKKxyms03uqjVHOZ4OaonE5tUhg/5B9JqEjwzGcr9VvdvhkmfFHBVeeaY8NlHFyr6INC2xyNSp4LEJzdU=
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com (2603:10a6:20b:42d::18)
 by DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 20:08:51 +0000
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::8859:691:cefc:9a17]) by AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::8859:691:cefc:9a17%7]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 20:08:51 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: RE: [PATCH v3 3/4] dt-bindings: interrupt-controller: fsl, ls-extirq:
 convert to YAML
Thread-Topic: [PATCH v3 3/4] dt-bindings: interrupt-controller: fsl, ls-extirq:
 convert to YAML
Thread-Index: AQHYWgvu/3id1S7+XUqAoUUdRpoi4K0ELChw
Date: Wed, 27 Apr 2022 20:08:51 +0000
Message-ID: <AS8PR04MB89464877E53B7F7B14A814178FFA9@AS8PR04MB8946.eurprd04.prod.outlook.com>
References: <20220427075338.1156449-1-michael@walle.cc>
 <20220427075338.1156449-4-michael@walle.cc>
In-Reply-To: <20220427075338.1156449-4-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd7964aa-50db-4e8d-50ed-08da2889bf94
x-ms-traffictypediagnostic: DBBPR04MB7979:EE_
x-microsoft-antispam-prvs: <DBBPR04MB7979E59DA3BD95D75A83E2FB8FFA9@DBBPR04MB7979.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +uP37YyG5A9CyiVB6NlUOo5kwmqeqlxLXfL+Ojyh42FeAEAtFMXZEU9llKkPHg3PkKU0w3Z7IR+6nfKQh7RbubWsIjozy0OUbSYwnTxeYlGrkg5LQcyHyTt8224sMgoPPnIhJWafc0m5uv/EqhFPJB1P2TeTNKCiLleF0mWZJ7tHigundRgOe+Jha6g7XbclkWgISiKqMfZ7wDVyG+GrR85R1CO6h15YhkOTnVRuFwnAziSTqIid1PLLn1PYbhzb/sukMJpLqfC9N3in1oQbI+PplwUye+MzrwbgIV/v+gBoq6ZoGB4fQV6H2ryZQlMGaP3tkreRUrx5pbGaqvGT8m4r1qx4qiImWUXkd6GbspkmjqIDRG9AF5xBjPkG+gPA9Dh99Pq/br7hY4j8LwXVI9K5BG241y5lWjLmXg6T2TFaydl19mdkFWDmI0qP4+XjIhuWhka633J1if9Q57mkUQUY3I71BeeVhMqMoLSg2N2Fgx5C/90dl2o2i7Nhf2Jx29FYkvCIw0Z08qmIudd3RuQr7EZ66aZxiM8cWZ8NLuBuhVRCImoolVPw1IvpaH2rfQwpM2elGI5Zx/CFXS835hrZoVd+MgIHLqRJYg57syaM3dd+7RiBdE3XpuoGPjBoIh947Sxz6q+AlOinCeVfniooKcarjHOygwp6tF+5OjBW1cpuKLpIP6weyFLIfH9MopYwk+/+vY7A/Kv79RcdzQNCMgJzwItJLKXHO5AT2f7Dpw90ZVUSym/GuXv799bUIV5uw63oECJEC1nxXJMYckHwp/J94H2RAHBJsjflGck=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8946.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(38070700005)(122000001)(508600001)(7416002)(38100700002)(76116006)(66946007)(8676002)(66556008)(4326008)(66446008)(64756008)(86362001)(66476007)(71200400001)(55016003)(54906003)(110136005)(52536014)(8936002)(5660300002)(316002)(9686003)(26005)(83380400001)(6506007)(53546011)(186003)(7696005)(45080400002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N9EkQPmGEZOnkdtcv/YjpY25Jl6OVgRuSYDbF0sNYCN23elOg343GDvgtOMd?=
 =?us-ascii?Q?omDMjTqB2IdG/JOgHryWccxoC5F/78XBhIM55jO5nVHFKaa0nXT3nyPr+U1k?=
 =?us-ascii?Q?yhbt+aKjL+XZ44Ks/8HQHgPf0GT7y7ne4QT6xZTJF0iNKpaKqBbVsB0nepY0?=
 =?us-ascii?Q?NXBRQaKmSWMvFzGC076kEQnjz1PsUDL37sSlYNPv6vNFZak3dz43IgTl77PX?=
 =?us-ascii?Q?Uw6OVBa1vNXxu5pZnrEPl3VGjoIc95Q6amftieNhcRevozwSa6kq3zjTsu45?=
 =?us-ascii?Q?SeKa1bJk+4YiKJg2QvxtA4SEbpvLXIpWP/cBSlWscExHmUDIGzfAggPDmbCD?=
 =?us-ascii?Q?Ep/lX/Xb/SY4a7ASdyza7h4sB5t+QVXaREXV/a2RYJn8XCNxZR9hvqGpSuyl?=
 =?us-ascii?Q?mPk7oLnU3Jz614HAl3XYbTkSaufhDvGJJefbrG7Ba3fjh/pMzgLgYk//3/Pz?=
 =?us-ascii?Q?DVTH2n0UE04YIwHi0GDwbSejmTnY5tdwuh/ZfvLJVeD9Dd8/Oq9sf7+dsdXU?=
 =?us-ascii?Q?JODbbkwbopUj0MmFMz0wfcW5i/qPtj4dA8/jszpD8RM6imTE4AvuHEjnx8ZR?=
 =?us-ascii?Q?8nSl1z1+Hj3PuK+wX+/lSWA886UmZtDA8QX/1WFFsRN0l7Bg57n5miN8px+t?=
 =?us-ascii?Q?9Xf+kbbA/QeXt1Vlozbo1NqNoEUrvj5dP2J/ddY4cWBz3+a84m/NWZAZbqHG?=
 =?us-ascii?Q?oSRzs2mnay30sEHb2XWQcK1elVJ/OiXYrmjtc95EjpMhi8bgPgg4ee+BVwx6?=
 =?us-ascii?Q?CiaAsEOV+YeDOA0zYfAi9KszbHIokd5sLgsMtr4E4BTTz6lbQnY1G72edQGl?=
 =?us-ascii?Q?EbCeNbFoJdrfKIeeUpmGvarXk0zDNpHeETzyEBq/moFeR6kMbWSSQmg1xvoy?=
 =?us-ascii?Q?khCFDSEQiLcSgkhQo6oQR5G0OGuFwzrpwZzvPy10MEwCR8pjd8N3v3dTyJCZ?=
 =?us-ascii?Q?g6HbncJT+HA/gJqWrTl9btu5zqrDX6DAA3Q1LAYbKlPbCDOSbksrsZRSosII?=
 =?us-ascii?Q?kRwVNvwAw2TChWhtIOwh4H8dONnEyFHTZly6dHFNbsZhkm0YBpX5VQnThIVK?=
 =?us-ascii?Q?OI+7wlcHl9uCGkw3b5a/v7bAm5HWwBPIHi5pcySI5I8VvmMUcdIE6cGefr/p?=
 =?us-ascii?Q?rmYHnm+jxVk8ucUIlkl9ZISML4Xa0Fjh9JPdlru1aSgAOylNZP4N0onsVl5j?=
 =?us-ascii?Q?yYjblSBdqI+bXHzWiKbFBfj9rEBmtHCDFpz1kT/vzABejD7ENfGD6K377/NY?=
 =?us-ascii?Q?5OQEyEZ0FK7G4Vm1qJfKr7TVEx6eSaMAPjTV6v68YDtxEzpLTl2ymH5+DSWS?=
 =?us-ascii?Q?8lW42wBuD3QIFt4fKIXAsWo8JkH4V50IX0SQ0O3Pk6pEXCsFluewtpxeUm/s?=
 =?us-ascii?Q?5EW2qhraxe4vlJVxTVufz18AYpeFHOUvtpKimoCS/uxv72Ap6lPqPgI45mE7?=
 =?us-ascii?Q?Nx6fsh1CAyY87R+8I5I/vSL0lSbkyOyXf2KH+MY3aUlk9CZcY0SVnzEYfm84?=
 =?us-ascii?Q?12vVBoBW4hkyEDItxNM8EpulmJ/tWkgi0DpN6Jcf29xZxkEa8Hs27GMEPw/r?=
 =?us-ascii?Q?5jkikHQVQsbBPYFTXvRhfWAUOKRc6P6HqyYfiL14n4qdy5tsYwfScwNMstnd?=
 =?us-ascii?Q?3QrjyudfAL1mI8tmyoqhERW6/7AXbtYrDPg3XbueCVcUnJo6OR3GheILbieH?=
 =?us-ascii?Q?47wNdGHdDiZFLKdnEWBfbkatM8Sja2T2v+99IFOtN2LrcWCM/3A4ASodQG2v?=
 =?us-ascii?Q?1qsJolo3uQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8946.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7964aa-50db-4e8d-50ed-08da2889bf94
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 20:08:51.5676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TWZCfxY2e56p38aKb/eIIdEQb2PfLlKrZZg7W+bJlcl1Ob1DuQ/6ey5oX9plMTAm3FA10LK8vrLFX1ZrDOf4HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7979
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
 Marc Zyngier <maz@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Michael Walle <michael@walle.cc>
> Sent: Wednesday, April 27, 2022 2:54 AM
> To: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: Leo Li <leoyang.li@nxp.com>; Michael Walle <michael@walle.cc>; Shawn
> Guo <shawnguo@kernel.org>; Thomas Gleixner <tglx@linutronix.de>; Marc
> Zyngier <maz@kernel.org>; linuxppc-dev@lists.ozlabs.org; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH v3 3/4] dt-bindings: interrupt-controller: fsl,ls-extirq:
> convert to YAML
>=20
> Convert the fsl,ls-extirq binding to the new YAML format.
>=20
> In contrast to the original binding documentation, there are three
> compatibles which are used in their corresponding device trees which have=
 a
> specific compatible and the (already documented) fallback
> compatible:
>  - "fsl,ls1046a-extirq", "fsl,ls1043a-extirq"
>  - "fsl,ls2080a-extirq", "fsl,ls1088a-extirq"
>  - "fsl,lx2160a-extirq", "fsl,ls1088a-extirq"
>=20
> Depending on the number of the number of the external IRQs which is
> usually 12 except for the LS1021A where there are only 6, the interrupt-m=
ap-
> mask was reduced from 0xffffffff to 0xf and 0x7 respectively and the numb=
er
> of interrupt-map entries have to match.

I assume this change won't prevent driver to be compatible with older devic=
e trees using the 0xffffffff?  The original 0xffffffff should work for both=
 6/12 interrupts or whatever reasonable number of interrupts that maybe use=
d in future SoCs.  So the purpose of this change is to make the binding mor=
e specific to catch more errors in device tree?

>=20
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> changes since v2:
>  - drop $ref to interrupt-controller.yaml
>  - use a more strict interrupt-map-mask and make it conditional on SoC
>=20
> changes since v1:
>  - new patch
>=20
>  .../interrupt-controller/fsl,ls-extirq.txt    |  53 --------
>  .../interrupt-controller/fsl,ls-extirq.yaml   | 118 ++++++++++++++++++
>  2 files changed, 118 insertions(+), 53 deletions(-)  delete mode 100644
> Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-
> controller/fsl,ls-extirq.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,l=
s-
> extirq.txt b/Documentation/devicetree/bindings/interrupt-controller/fsl,l=
s-
> extirq.txt
> deleted file mode 100644
> index 4d47df1a5c91..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-
> extirq.txt
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -* Freescale Layerscape external IRQs
> -
> -Some Layerscape SOCs (LS1021A, LS1043A, LS1046A -LS1088A, LS208xA,
> LX216xA) support inverting -the polarity of certain external interrupt li=
nes.
> -
> -The device node must be a child of the node representing the -
> Supplemental Configuration Unit (SCFG).
> -
> -Required properties:
> -- compatible: should be "fsl,<soc-name>-extirq", e.g. "fsl,ls1021a-extir=
q".
> -  "fsl,ls1043a-extirq": for LS1043A, LS1046A.
> -  "fsl,ls1088a-extirq": for LS1088A, LS208xA, LX216xA.
> -- #interrupt-cells: Must be 2. The first element is the index of the
> -  external interrupt line. The second element is the trigger type.
> -- #address-cells: Must be 0.
> -- interrupt-controller: Identifies the node as an interrupt controller
> -- reg: Specifies the Interrupt Polarity Control Register (INTPCR) in
> -  the SCFG or the External Interrupt Control Register (IRQCR) in
> -  the ISC.
> -- interrupt-map: Specifies the mapping from external interrupts to GIC
> -  interrupts.
> -- interrupt-map-mask: Must be <0xffffffff 0>.
> -
> -Example:
> -	scfg: scfg@1570000 {
> -		compatible =3D "fsl,ls1021a-scfg", "syscon";
> -		reg =3D <0x0 0x1570000 0x0 0x10000>;
> -		big-endian;
> -		#address-cells =3D <1>;
> -		#size-cells =3D <1>;
> -		ranges =3D <0x0 0x0 0x1570000 0x10000>;
> -
> -		extirq: interrupt-controller@1ac {
> -			compatible =3D "fsl,ls1021a-extirq";
> -			#interrupt-cells =3D <2>;
> -			#address-cells =3D <0>;
> -			interrupt-controller;
> -			reg =3D <0x1ac 4>;
> -			interrupt-map =3D
> -				<0 0 &gic GIC_SPI 163
> IRQ_TYPE_LEVEL_HIGH>,
> -				<1 0 &gic GIC_SPI 164
> IRQ_TYPE_LEVEL_HIGH>,
> -				<2 0 &gic GIC_SPI 165
> IRQ_TYPE_LEVEL_HIGH>,
> -				<3 0 &gic GIC_SPI 167
> IRQ_TYPE_LEVEL_HIGH>,
> -				<4 0 &gic GIC_SPI 168
> IRQ_TYPE_LEVEL_HIGH>,
> -				<5 0 &gic GIC_SPI 169
> IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-map-mask =3D <0xffffffff 0x0>;
> -		};
> -	};
> -
> -
> -	interrupts-extended =3D <&gic GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
> -			      <&extirq 1 IRQ_TYPE_LEVEL_LOW>;
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,l=
s-
> extirq.yaml b/Documentation/devicetree/bindings/interrupt-
> controller/fsl,ls-extirq.yaml
> new file mode 100644
> index 000000000000..887e565b9573
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-exti
> +++ rq.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id:
> +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevic
> e
> +tree.org%2Fschemas%2Finterrupt-controller%2Ffsl%2Cls-
> extirq.yaml%23&amp
> +;data=3D05%7C01%7Cleoyang.li%40nxp.com%7Cdda04b02c8fb455d29a608da2
> 8230f9a
> +%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C63786642829380089
> 0%7CUnkn
> +own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6I
> k1haWwiL
> +CJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DFVelhP%2B5CgDLZ8IUc
> 1%2B7b5MOP6n
> +TspGvJyT%2BLtbon70%3D&amp;reserved=3D0
> +$schema:
> +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevic
> e
> +tree.org%2Fmeta-
> schemas%2Fcore.yaml%23&amp;data=3D05%7C01%7Cleoyang.li%40
> +nxp.com%7Cdda04b02c8fb455d29a608da28230f9a%7C686ea1d3bc2b4c6fa9
> 2cd99c5c
> +301635%7C0%7C1%7C637866428293800890%7CUnknown%7CTWFpbGZsb3d
> 8eyJWIjoiMC4
> +wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%
> 7C%7C%7C
> +&amp;sdata=3DqwIgHY4ZOMNHm7nYBXrqqahH652mZwxGgQ9t1HJzMRQ%3D
> &amp;reserved=3D
> +0
> +
> +title: Freescale Layerscape External Interrupt Controller
> +
> +maintainers:
> +  - Shawn Guo <shawnguo@kernel.org>
> +  - Li Yang <leoyang.li@nxp.com>
> +
> +description: |
> +  Some Layerscape SOCs (LS1021A, LS1043A, LS1046A LS1088A, LS208xA,
> +  LX216xA) support inverting the polarity of certain external interrupt
> +  lines.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,ls1021a-extirq
> +          - fsl,ls1043a-extirq
> +          - fsl,ls1088a-extirq
> +      - items:
> +          - enum:
> +              - fsl,ls1046a-extirq
> +          - const: fsl,ls1043a-extirq
> +      - items:
> +          - enum:
> +              - fsl,ls2080a-extirq
> +              - fsl,lx2160a-extirq
> +          - const: fsl,ls1088a-extirq
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  '#address-cells':
> +    const: 0
> +
> +  interrupt-controller: true
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Specifies the Interrupt Polarity Control Register (INTPCR) in the
> +      SCFG or the External Interrupt Control Register (IRQCR) in the ISC=
.
> +
> +  interrupt-map:
> +    description: Specifies the mapping from external interrupts to GIC
> interrupts.
> +
> +  interrupt-map-mask: true
> +
> +required:
> +  - compatible
> +  - '#interrupt-cells'
> +  - '#address-cells'
> +  - interrupt-controller
> +  - reg
> +  - interrupt-map
> +  - interrupt-map-mask
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,ls1021a-extirq
> +    then:
> +      properties:
> +        interrupt-map:
> +          minItems: 6
> +          maxItems: 6
> +        interrupt-map-mask:
> +          items:
> +            - const: 0x7
> +            - const: 0
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,ls1043a-extirq
> +              - fsl,ls1046a-extirq
> +              - fsl,ls1088a-extirq
> +              - fsl,ls2080a-extirq
> +              - fsl,lx2160a-extirq
> +    then:
> +      properties:
> +        interrupt-map:
> +          minItems: 12
> +          maxItems: 12
> +        interrupt-map-mask:
> +          items:
> +            - const: 0xf
> +            - const: 0
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    interrupt-controller@1ac {
> +            compatible =3D "fsl,ls1021a-extirq";
> +            #interrupt-cells =3D <2>;
> +            #address-cells =3D <0>;
> +            interrupt-controller;
> +            reg =3D <0x1ac 4>;
> +            interrupt-map =3D
> +                    <0 0 &gic GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +                    <1 0 &gic GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> +                    <2 0 &gic GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
> +                    <3 0 &gic GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
> +                    <4 0 &gic GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +                    <5 0 &gic GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-map-mask =3D <0x7 0x0>;
> +    };
> --
> 2.30.2

