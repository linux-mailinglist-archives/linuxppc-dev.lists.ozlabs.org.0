Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9D28295EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 10:11:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=UsBaKBIZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T928f103Bz3cVg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 20:10:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=UsBaKBIZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::61c; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T927n6DyFz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 20:10:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+pn3BDKqaRJn+4gXY7wufp8JnK/Nr/5RYcNAnwAnUd7Vf4JCSCP7Syu4BeowFFfgMV0DvcNZtComO7uBtuEL/9t81whFxIv6jgG3bfilnNcOm2/NAlHV1xRHnX1x0byS+Hjk0IleTaG9XLOpE0swV/ICJ3niln+5k0GbPezi2T4v7q5INNnb9EKo6uhEiEpASQZwy6oX319v0eCdm+YyVcdSF3PcIIEMJYL2gSEycF4iwhiBsKFgNeP+5L53npR4g3sVudwLthUEXM5QEsDNq9qD/XRInepoFsgT03WJHRZ2eBg5iqhcibmlAG//fJYfpXbLZ9v9+W1P9mgJ1zndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BF5kvmLCQbMENl8HgNfq7GFDTgNcQ48QVG4RooLZ0l0=;
 b=X3Jj5qC80Gl0UMn0ZTR4TQO614lz+DxdsIkFgsYkJE2GJvHlWft4TgOhs70sH/1NHCqplq5eIEQ5ACi5HjmSKlR2rhWTreR1tEDnAKi07HfMAHwKifpS2SKBA9UYVyBGJD2EGnWbbnOJ7NMglUN8bi2ACPgEwt7HQWp6NPTlpieVF/RzAK8mVlEm/SKlbCLd5qrvi935TuIU6O0m94Jbshohz75MDAs/DuJDKmLp+f6Cff5YTK+Z3XjAr+ZQWmFiwbz4qyxt8Wr97roJoR+FWT5FlOHUmm/njcMA887SDfVV6sP1A8itKsDkxTLRlZDnDHGvKwBANxa7nogrcZ/cfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BF5kvmLCQbMENl8HgNfq7GFDTgNcQ48QVG4RooLZ0l0=;
 b=UsBaKBIZQfB23SPSRPkMjHp+iAiE5GqAVvcZaxrpG5XlvxaaCJ5VBkrRO0mD4AkmoyycRuMszfJP8UxPQ5wDTHS0EyFRgV7z1d4ZP6Hvty8g+OFrtdd3k/iah5Rl7XCSsoDIsz9gsskG5svLQ+okqtDqHzNlY1dDGCExa1oKsJs=
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB9992.eurprd04.prod.outlook.com (2603:10a6:10:4c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 09:09:45 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c%3]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 09:09:45 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: RE: Re: [PATCH 3/3] ASoC: dt-bindings: fsl,micfil: Add compatible
 string for i.MX95 platform
Thread-Topic: Re: [PATCH 3/3] ASoC: dt-bindings: fsl,micfil: Add compatible
 string for i.MX95 platform
Thread-Index: AQHaQ6TBFyjZYiWDNU6wGtith3GzYw==
Date: Wed, 10 Jan 2024 09:09:45 +0000
Message-ID:  <DB9PR04MB9498CE3DD725B05EEAFE617FE3692@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: <20240109075551.870001-1-chancel.liu@nxp.com>
 <20240109075551.870001-4-chancel.liu@nxp.com>
 <CAEnQRZAgwmNZ8ruV6rPJ_OTzjLHL0jgPLFNbBeW1fXYG+QjAbw@mail.gmail.com>
In-Reply-To:  <CAEnQRZAgwmNZ8ruV6rPJ_OTzjLHL0jgPLFNbBeW1fXYG+QjAbw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9498:EE_|DB9PR04MB9992:EE_
x-ms-office365-filtering-correlation-id: a89c82ac-1c67-4f76-691f-08dc11bbe3b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hwW2nrPN+iSGPSDwjcYtTXEq5Yh4rGZYA4RS1X7gYu2jO5f6zPIHNTbOO7Y4QzvWFtcjyJ/g+uSgET0k3CvmH962ETwUcKc0G6YXS0+decnqd9wXNrqnooELrl5HjNKse17pO2p5AE5oa5GzSIB+9sDVc2Qpo6hd46UouzIg3s2CfhQM3ZJ41exFllkQJwvsylI02UA8yyKBraijfsPNtpKCIWSQlmHJ+PYyle2oal+VG9gJbhOuBnGA6HRNyrSzEF6ZXqHHUuz/IjIiKp3j6ruIP1Sj7wpmeT1AdgrwhAsTsl+MoxA3x5uh2SmvTWn61JvnkGYvyUbMIeq7AWlfuUHS9FJOCg4ceE/vXWPI/F0sPf1l0DJxahjOkQWSCrfsZhFj1H25xAb4ZimvZz7fFmnE9H5AA9tlqYgJ0+GVeDqbxwcMDL9v5FBfAVG6f/P60tcm4FqTcujZwAW3WNnwvdZ9UiBXRgExWKgJi3olizNFiGZVUOqzU2ebiC37NNY+ND5nLJaUe/2VXpkgH+U22l5LugY9HfeZAWUTTBN2OYVJp+WMEolgW7fkb/TYGuVxRVQ862p4yfwzb+MAuG8nhmm/4Oy7pz71yU1QLR4WMNzflmgIED6m6YQDCXiF+wGn
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(39860400002)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(7416002)(66556008)(6916009)(53546011)(6506007)(66946007)(76116006)(478600001)(66446008)(66476007)(7696005)(64756008)(71200400001)(9686003)(122000001)(4326008)(5660300002)(44832011)(52536014)(55016003)(8936002)(316002)(54906003)(8676002)(38070700009)(33656002)(41300700001)(38100700002)(83380400001)(26005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bE5CV29WZU1BME9OWDlHcXprZmRNaXJOVDQxMjNYem43ZHJFVVl1QksyV1pj?=
 =?utf-8?B?c0Qwd3d1Lzk0TjV0cDFuSjNjc3lqMlBHZUNRMzNGRW9MTUpSTFpMQlQ4OUh6?=
 =?utf-8?B?WDZOb1FINmYxTW5HcHdrYUpDZmRra0oxQ052RS9DelV6V016SUh5REUvNDBN?=
 =?utf-8?B?ZWQzSEFOVVFZSzFjdGNYUC9ycU9KN1NjNTBqa25SVUhFQ0lPdlFqUUFLK1Nk?=
 =?utf-8?B?VXdvT0hNcGxmUGh0THd1Z01aeExBZkRZV2prR3lRdGx1enNWdzNQeWhIclZy?=
 =?utf-8?B?VmN2d1AxR0N1MVJlUGxzRnVGdnVqUUVObXJBcmlIN1ZqZlNlUWRnTDBCSXZq?=
 =?utf-8?B?VWZHTDRkSlNWVXh3QzBlTkM2d09UOUtaZ240cFY4aThLOHBoZC9VQUNGOENk?=
 =?utf-8?B?STdQZEQ1c1FSemJvbC9aRUh3SGE2elRPbFdOdWM1OHQ5RTlWelowdmtEdWVS?=
 =?utf-8?B?Z0lndXJDUlltRzNjeHE1bzRhKzlIZ29CbDhhcE9tVUJBYW9Jc1ZZNm04T3g2?=
 =?utf-8?B?YXYrMnc3bjNkT3NVTHFQT3c2amtkc1lVSHBYajR6S2c0QWN3Wmk5cjl4NTdG?=
 =?utf-8?B?MTUwRC8wZm50U00rVngwS3JFZUxxTzFqNTlYRDY0dVBIREhEK1NwU1I3WmxO?=
 =?utf-8?B?blFsY0Q2aVp3OHFnc2tkR1BzOVhSVWFKSDFyTHppNGp2N1p4UjZlNWFZL25J?=
 =?utf-8?B?WDBxWkRlanhORktCOGtoTGZqdHYxZVA0K0xzN3VaTVdOdGFEemM0V1ltSmZh?=
 =?utf-8?B?T210NnNTNFFoNDhScG9sNFFuWUM0OHA4U3lwZDRycytzaEROQ203b3J3Q0Zk?=
 =?utf-8?B?NnJDdnAzZ2cyd3BNOXg0Q1orOHY5YzR5aysvdVdpcU9vV2M0cmUyRko0bndP?=
 =?utf-8?B?L0xMcldDMHZFRmZmQkdEVVlqQVkvdkFxV2MzU3cxQUtxckNudUwvdVAyTzE3?=
 =?utf-8?B?Sy8wMUZzTXUxek1hUktiVmlNRC8wVjNxT0NMN3JTbUNQRFJpckgrUkdlcWJX?=
 =?utf-8?B?T0E3N3EzbndzTFVtQUovWE5ORzNsdG9QRXRXcjRQMUdUaERxTUhpb3lILzhv?=
 =?utf-8?B?ckg1UTRqTVJmaUlKZytsR2dnTmd6azE5NXhteDQyRGJsRXBzcEdIZk1scGxX?=
 =?utf-8?B?VWplSCtDWWVIVkxTbFFOQ0YrZTladWNsTlMwMENDY1VtNTdkUEsyUzF2WlM4?=
 =?utf-8?B?UlIxQ3didDNKZE1jQWZ3Zm5zcGVUSk0vZWYyQ210MlR2UmFMeFpGOGtJR2Ra?=
 =?utf-8?B?QjB6M3FSWjlKWGNkbjFnNnBEWjhQeThINTFTajBwc1hZc2FLTnl4dm1JS2ZE?=
 =?utf-8?B?TUE2Tmh6ODdvcklTcndieXpKSDRzWFAvS3dCYWRjMXE2WGg3YlhUb0h2cUR3?=
 =?utf-8?B?b3pydmZoYzQ4NmUyd01lNXV5TGhkZjk3QWJocE1wQmxYcG40aWNxOVFySGxs?=
 =?utf-8?B?OHhWcHZBcW1DdkhNM2w1eEJaZTNrcDBGd3BPYTVVNkdFQm1qKzFuSXo3RUNs?=
 =?utf-8?B?R2g0OTE5YklvRlFNdDJ1eDlMaUFkZWVrOGorK0NNSUFEYUNnZDFOWnh1K3hJ?=
 =?utf-8?B?bWxVL1BMWTM2VE45S2ZTNUlsNzdSZjhKZFd6Q2lwZW9LeGJsMm1DcWpiM0Vj?=
 =?utf-8?B?SHllckVGNUgvd05NRTdaVVdXV2h6dTBOZnpxSSsyMWRuRXpVeDg3cUJleTJ5?=
 =?utf-8?B?Q2szUFVHMnVsei9zWE42SkowTFlFNkJEWlFhVXhta2VXUUIvbkFQVkFTbSs5?=
 =?utf-8?B?bEY0aEtmWlQ5NUVZSWVFTjFsS2NuWGlxSGtvSXlhQWlpaWt4eitTUXJaMGNz?=
 =?utf-8?B?dzdOa280TFRTK0R4ei96Nk83TFUwUTB0SG04UUMxOENEOEZZRjBGczVmT3p4?=
 =?utf-8?B?L0RzOWY5R2J4QVpVQWVPY0xkakkxRzUwMmc4a2NRMmFLYWdvd1V5NndyRXNF?=
 =?utf-8?B?K01FOVh0cGgra3Jib05NUGdZY3lPcnpwU3A4enB5RWp2SG03WmtNV2tkTGU4?=
 =?utf-8?B?OHM0SVRhUk50dU5MbWV3eTFpd0xPVGZzNUxHbGVvdElxZi9sUS92clRBbzJI?=
 =?utf-8?B?N3RwMFFySWo5MlNjd3I1Z0xubFNlSWU3VnhNRmVxSjJ2SG5aZW03V2tWY0Q4?=
 =?utf-8?Q?fHzlw4cy7GBkR0ozVHWhw2CM1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89c82ac-1c67-4f76-691f-08dc11bbe3b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2024 09:09:45.6541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wrhHDEI/0HfiYan2xmJ8QPFwWOrzwTcv4H+adc8MAEdUsl1HESOD+3dGe3HRB01OcSx32nL3B446yysmVCym9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9992
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "perex@perex.cz" <perex@perex.cz>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBPbiBUdWUsIEphbiA5LCAyMDI0IGF0IDk6NTjigK9BTSBDaGFuY2VsIExpdSA8Y2hhbmNlbC5s
aXVAbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBBZGQgY29tcGF0aWJsZSBzdHJpbmcgImZzbCxp
bXg5NS1taWNmaWwiIGZvciBpLk1YOTUgcGxhdGZvcm0uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBDaGFuY2VsIExpdSA8Y2hhbmNlbC5saXVAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLG1pY2ZpbC55YW1sICAgICB8IDE1ICsrKysrKysr
KysrLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc291bmQvZnNsLG1pY2ZpbC55YW1sDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvdW5kL2ZzbCxtaWNmaWwueWFtbA0KPiA+IGluZGV4IGI3ZTYwNTgzNTYzOS4u
ZjBkM2QxMWQwN2QyIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb3VuZC9mc2wsbWljZmlsLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLG1pY2ZpbC55YW1sDQo+ID4gQEAgLTE1LDEwICsx
NSwxNyBAQCBkZXNjcmlwdGlvbjogfA0KPiA+DQo+ID4gIHByb3BlcnRpZXM6DQo+ID4gICAgY29t
cGF0aWJsZToNCj4gPiAtICAgIGVudW06DQo+ID4gLSAgICAgIC0gZnNsLGlteDhtbS1taWNmaWwN
Cj4gPiAtICAgICAgLSBmc2wsaW14OG1wLW1pY2ZpbA0KPiA+IC0gICAgICAtIGZzbCxpbXg5My1t
aWNmaWwNCj4gPiArICAgIG9uZU9mOg0KPiA+ICsgICAgICAtIGl0ZW1zOg0KPiA+ICsgICAgICAg
ICAgLSBlbnVtOg0KPiA+ICsgICAgICAgICAgICAgIC0gZnNsLGlteDk1LW1pY2ZpbA0KPiA+ICsg
ICAgICAgICAgLSBjb25zdDogZnNsLGlteDkzLW1pY2ZpbA0KPiA+ICsNCj4gPiArICAgICAgLSBp
dGVtczoNCj4gPiArICAgICAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgICAgICAtIGZzbCxp
bXg4bW0tbWljZmlsDQo+ID4gKyAgICAgICAgICAgICAgLSBmc2wsaW14OG1wLW1pY2ZpbA0KPiA+
ICsgICAgICAgICAgICAgIC0gZnNsLGlteDkzLW1pY2ZpbA0KPiANCj4gTXkgeWFtbCBrbm93bGVk
Z2UgaXMgdmVyeSBsaW1pdGVkLiBDYW4geW91IGRlc2NyaWJlIGluIG5hdHVyYWwNCj4gbGFuZ3Vh
Z2UgaW4gdGhlIGNvbW1pdCB3aGF0IGV4YWN0bHkgd2UgYXJlIGRvaW5nIGhlcmUuDQo+IA0KPiBX
aHkgc29tZXRoaW5nIGxpa2UgdGhpczoNCj4gDQo+IA0KPiA+ICAgIGNvbXBhdGlibGU6DQo+ID4g
ICAgIGVudW06DQo+ID4gICAgICAgLSBmc2wsaW14OG1tLW1pY2ZpbA0KPiA+ICAgICAgIC0gZnNs
LGlteDhtcC1taWNmaWwNCj4gPiAgICAgICAtIGZzbCxpbXg5My1taWNmaWwNCj4gKyAgICAgICAg
LSBmc2wsaW14OTUtbWljZmlsDQo+IA0KPiBJc24ndCBlbm91Z2g/DQoNCk5vLiBUaGlzIHNob3dz
IE1JQ0ZJTCBvbiBpLk1YOTUgaXMgZGlmZmVyZW50IGZyb20gaXQgb24gSS5NWDkzLg0KDQpIb3dl
dmVyIGkuTVg5NSBNSUNGSUwgaXMgY29tcGF0aWJsZSB3aXRoIGkuTVg5MyBNSUNGSUwuDQpUaGUg
RFQgbm9kZSBvZiBNSUNGSUwgb24gaS5NWDk1IGxvb2tzIGxpa2U6DQptaWNmaWw6IG1pY2ZpbEA0
NDUyMDAwMCB7DQoJY29tcGF0aWJsZSA9ICJmc2wsaW14OTUtbWljZmlsIiwgImZzbCxpbXg5My1t
aWNmaWwiOw0KCS4uLg0KfTsNCg0KUmVnYXJkcywgDQpDaGFuY2VsIExpdQ0K
