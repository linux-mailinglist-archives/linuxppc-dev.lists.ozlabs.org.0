Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B53407AD33A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 10:21:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=pBbqG4wH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvG6y3jhvz3ck0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 18:21:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=pBbqG4wH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0c::612; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0612.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvG641YbNz2yVg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 18:20:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+OcDYGkq1fqU7sSruc3gEgNX+ic9HEQ4UPI2QBWv6bmnzn6Q0zkD4zwmKBI7VP6zcDpqPMDiUPfVg4YMNH26dv2lKCGzz443bNI3hvWFPzV/oErpL1lSrkFd2L9drj4e9sBL2pDtrVNCashDlmlbFOlT6XC8uvbfzOYKdh+SwLLxMmlqXmaw/oP6eKEAzxt6Ft8ozOGAzVnjMWsuveFeegdCYj1FZlRAS0unRSXGcrqJFTbD+ZZUMZTadqDqntgup9Rgm2oflFbMDOfr2fCuwxaxJaa+lp7y7rgmaQQDAWXrtwsjesIWjtks5vVZFd9QzzOJFR1Jb3DDpfbOAGyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsbTZwhmBhknzQpsIhAztasVbWWX2D+1wzuucc1cchw=;
 b=MPzM3faGhEWLDpYO8fL+oghpSb0LQJkyQZ4TvtPI7N2mKJ+mwvRc9+2YtkWyTK+JgiGVmMBx4Mx/DpB9fNMFy86va7UDE6+T16K30rgOdlPFwgYOeSB9W7Kl6k90wSFHMRMdh0O0cBEzacz+XLziLbl91jwp0kWUVhIwzo3FOG0mqB2gaLcPITQFCKaY3zcd6n22/cuOE3KaWAkJAnjQXgxZ5iLpIHdokQlVHUCK8qUmXr1Xfqw/BDADjqW+nYHtohzjLWoPhHqCyTvs6Umb4AhtfpINE1nAzxq1vlwI/inJh1s0bXhuqUf9XBcKWeZbHQ17MZTRXPqygIgyuAuZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsbTZwhmBhknzQpsIhAztasVbWWX2D+1wzuucc1cchw=;
 b=pBbqG4wHy2ypfgabv+QAD2HTo3J2DjJDsnqlIk/ptWpfX+NbPDuZZnWsX5jon7y5WyY8a+MNF+DJ9CfVK+i4A/4adWCcxVbTCZW651zwUTeF6wlQET8MQwubhRkbmgUKDDq+nqaBRVa8TMGY50XSkhBks2xFu13QnnRO1Cdai3E=
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AS4PR04MB9265.eurprd04.prod.outlook.com (2603:10a6:20b:4e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 08:20:22 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::51f9:b8d2:7ddd:c74f%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 08:20:22 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shengjiu.wang@gmail.com"
	<shengjiu.wang@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
	"festevam@gmail.com" <festevam@gmail.com>, "nicoleotsuka@gmail.com"
	<nicoleotsuka@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: Re: [PATCH 1/2] ASoC: dt-bindings: fsl_rpmsg: List DAPM endpoints
 ignoring suspend
Thread-Topic: Re: [PATCH 1/2] ASoC: dt-bindings: fsl_rpmsg: List DAPM
 endpoints ignoring suspend
Thread-Index: AQHZ74kg+W63O6UsJkOYi1GFBVoScQ==
Date: Mon, 25 Sep 2023 08:20:22 +0000
Message-ID:  <DB9PR04MB9498338014461E28A9988538E3FCA@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: <20230925024847.2971421-1-chancel.liu@nxp.com>
 <c3e682dd-7bb7-4662-b97d-872df1ff879d@linaro.org>
In-Reply-To: <c3e682dd-7bb7-4662-b97d-872df1ff879d@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9498:EE_|AS4PR04MB9265:EE_
x-ms-office365-filtering-correlation-id: 3715e79d-92a7-41d7-c4b5-08dbbda04371
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  94BjIEOUxiJCs0lcvOkU7wKnvS1YeaJ88V6+jDIgqsElg/EiVrj5GUWOVz1tg7ffLUx2E7VDdUInSeoh8Wwd7gc+VDu2UhBv1CpluNYOV8Uvfn4YnNSFbEITpSMKy+Ow9NtpUmVS1xDaeXjZ/qZVxj8gndzP4NdvCyZYkPcipJKQFWOxX6Mzlct2c0Pm/OmxVDvljIh77J/TuVUrktxN09ETGAMU0/SgkJy+wlqF68BE+l2fmrKgL1hxzUpj01dlv4FahwsrWmSX5OVGmByIS8CTb+ufKXQsz7u5q3D7Zq4K/WIzv5CPTwXCFpP7c1ncc374o6Bvfih8GniV+9OBxbgVxqzNfcxr73bVEZmZ8d9l/c6AgPMkFfTdzT9N2vxId9kkLD1yCM0ThEgjQhd80AvhPlz3l4+XBT+0vzmpNrnIQ2hM32Z11o2NsJ/21kW5r+1n2/Y26WtTBmB746QG9ViLaG1bHFQTCQ4sS9Ld0lnkeqUvbXY86TU9+nQQGrgWmMyVrPiCFJ9jOfaHQEVwzGJdrz4QIyXkykbkrqLD3E3dKHKQTpgQMYIRiArT0Kph31irF9oNNDCekrwpf8Z6OM+ZD9VdMMiuZtsTF4BkDgVdfBQgVpdc1xrt+coKYEPQIs4Ud3vgF9nwsNUvuyqfUg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799009)(451199024)(186009)(26005)(71200400001)(478600001)(83380400001)(86362001)(122000001)(921005)(38100700002)(38070700005)(33656002)(5660300002)(55016003)(7696005)(6506007)(9686003)(2906002)(8936002)(8676002)(41300700001)(316002)(110136005)(64756008)(66946007)(66446008)(66476007)(66556008)(76116006)(7416002)(15650500001)(44832011)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WDN3K085N0xLbVR2dVN0TFUzcm1Lc2xGV3Z1WWkrenhIQTVpMTAvcUxvNDdC?=
 =?utf-8?B?SHJVejZNT0FnYVlVcXlZTktvTG9ySjBnUXhIaWxEWktqOWU2ejBtdnJ5V2py?=
 =?utf-8?B?dUdJeVRKd0xWUDZ5YVlhMndnd1MrcUVkdSsvVnJNZWVXS2xZOWxWZFBNY2Js?=
 =?utf-8?B?V1F4V2hhWTVjOHhCWVNWK0FqZjY0NUIweXFGeDQyK1FUOXRLdzh0K1Zsa1dv?=
 =?utf-8?B?NW9CWHdRc0RUKzlpVnBxVDVEeVN3Q29lZ0RBRmRnQlM0UU5XVGtzYWhxdnRJ?=
 =?utf-8?B?RS9XQzhIOEltRUkyVUQyOERMMHpaRTBHVHFCRmpSS1VFWkg1bURCVE5kSFpX?=
 =?utf-8?B?NUVtckFSeGRNblJINnhJSVNTb051L2NHTGNUVnNDRUVSbDIxSnlZU3NiRkZX?=
 =?utf-8?B?WFBvdWFhNzY2blBmZWwzcGljQ3pHZGl4VkZTdkJkc095WFhpNkwvdFVQREJq?=
 =?utf-8?B?QWhNZm9OLy85Yk5wQ2t4L0IxbXBvQ3I1UjM2TFBJN0FtRU96MzA5UjVhNjBs?=
 =?utf-8?B?TDlUTWtHdTRlTnYra1RtUUM0c0l5SlhNMnhuU3dtQXB3SWhyc05MTXFLTnhC?=
 =?utf-8?B?b2xZbHR4endWcmYrOWV1K1BxN0NhclpmNzZBd0YzaTN2eG9INFd5QmJ3Yk81?=
 =?utf-8?B?VTFVNHUyRXUzTGdsaUZTVmJXc0UyTE9rT2hhOVFHNHNodndETENiV050WVhH?=
 =?utf-8?B?QmdMV0NvOEVhU1dBb2RkbFJ2Mld2eWdOTzI4MXE1cEVYN3lnR2F5SkRIZVdv?=
 =?utf-8?B?bUlTQkx4V203cmM1Ny83ak9YYlQzTnpGblZqUDFTdkhIdWpYVDU0VlNnWHFz?=
 =?utf-8?B?SndGanZ4TFJMekVsQ3lLemh6dExadkFLUVNqUmErekM2YjUrRzl0YjhFbWtC?=
 =?utf-8?B?NE1PT0ZGV0RJTUluR2lFS0RGNVJsSDZkdEdQRTdCbkZoT1hERkVnbHYzVEtu?=
 =?utf-8?B?YWF3dHA3aDczNHBPNHBTT2o0V0xxMm9JZm1ESkZhMGhSNUdTTzE3VEo2OXU5?=
 =?utf-8?B?TG0rc0JYMGdkUDVjUnVYSVBUUkhPUzVmNHdsWEg3VVZwL0NPUC91ZHREL3A5?=
 =?utf-8?B?dktiNlJpN2FSR3FkSjg0eE9TbTRGVEdxWDZYK2tqWHZOeXNkc1dBc2NjQW91?=
 =?utf-8?B?bThPYmNpdHY4ellLaFRiL0Z5L1EyYlVkdzY3MmpBdUJyZXNYZTJTSEhOQTVt?=
 =?utf-8?B?ZHdMSThNZHZPb2V5eFhRUTNtTUV1TFB6eHJObW1zNlAvcDRRdXR4QkJPdlg1?=
 =?utf-8?B?cXVzUmlIVjJQWlc2T0NaSmVidmdHUW1DeStnV251a1dVOG4yMjVMZHpKVWdO?=
 =?utf-8?B?dGFHNzMyWTlQejBtY0trT05BZThTTVdNRFhtallJcCtkeFJScmNEMVh1djk3?=
 =?utf-8?B?dnBaV094cFk1UUg2OGdPRWNHcXBHRHhCVnRxdW84MU0wMlBWNFh6T3JJazRr?=
 =?utf-8?B?ay9GRUU3T0pnNmFtSmJmM1VnRTc1eTRjcEF0cHg0cnJONWIzTndFY3NVNDhS?=
 =?utf-8?B?ZXU1aUIwN3FlY2w0eUNuWEdDaXpmU0NXUEVTK2NMYVZ2V2RxUHR6T0E2S1pn?=
 =?utf-8?B?cXNydHlZVVE3d25CMlNhdnM0Ky9FdmVVbTVvTFk2OWxsNkpQcjY3ZkprVTN1?=
 =?utf-8?B?eDdwcjU3ZlFpbWtTOTFmTndOM3E1WEJBNjdFaXQ3TVJzUTdoNlBuMjY3amp2?=
 =?utf-8?B?c0lkeGd6dE5IdW0zOXI3bWxHQXFsL1pFeGc0ZGR2Rm1BREtCeHpNYW5wK2RO?=
 =?utf-8?B?aGpYODQ0RytwaWxGVXNJQXh0SDdZdENYK0dHSmhCdHc4Z21BNnh5VjluZDIr?=
 =?utf-8?B?L01ESTNoRzZlRTd6dWc2Z0hvUDlPeTFqSVN5ZzlOWkFwbEtyeHNqZG1FYmU1?=
 =?utf-8?B?Vjl5czhUSFBtR2tRUnNpemxqSGdJQXlVSUx1ZVRPZHJ1akxUU3FCQ0ErSkVa?=
 =?utf-8?B?QUFValgrQXdwc2Y4aWlYekdrRGJ1MFhnMzhMeHhUY2xsNmNCNGwyZXNNVW8v?=
 =?utf-8?B?U1FkTjFxRXpoV2pEaGIvRkh6akxXRDZGZmRKaVd1NWNkUGsrN0hraFpkWGRF?=
 =?utf-8?B?M0pOZFlEWUV5QndpcElrd0dyQmlxdGtpempLZExFZ0EyeGhzS1ZrZzNlMVB3?=
 =?utf-8?Q?3dbs7a3N2UVG25J9IMXv3Vc8l?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3715e79d-92a7-41d7-c4b5-08dbbda04371
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 08:20:22.6821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8vLQeLsOVveX7AfhVAkIYPAw4koYkfJY6IfXhJ193NO66mOhbReRDFP6HEG8pMrNRgdUs5EJdMoLK0FcRtTeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9265
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiA+IEFkZCBhIHByb3BlcnR5IHRvIGxpc3QgREFQTSBlbmRwb2ludHMgd2hpY2ggbWFyayBwYXRo
cyBiZXR3ZWVuIHRoZXNlDQo+ID4gZW5kcG9pbnRzIGlnbm9yaW5nIHN1c3BlbmQuIFRoZXNlIERB
UE0gcGF0aHMgY2FuIHN0aWxsIGJlIHBvd2VyIG9uDQo+ID4gd2hlbiBzeXN0ZW0gZW50ZXJzIGlu
dG8gc3VzcGVuZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoYW5jZWwgTGl1IDxjaGFuY2Vs
LmxpdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc291bmQvZnNsLHJwbXNnLnlhbWwgfCA2ICsrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2ZzbCxycG1zZy55YW1sDQo+ID4gYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLHJwbXNnLnlhbWwNCj4gPiBpbmRleCAx
ODhmMzhiYWRkZWMuLmVjNmUwOWVhYjQyNyAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLHJwbXNnLnlhbWwNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLHJwbXNnLnlhbWwNCj4gPiBA
QCAtOTEsNiArOTEsMTIgQEAgcHJvcGVydGllczoNCj4gPiAgICAgICAgLSBycG1zZy1hdWRpby1j
aGFubmVsDQo+ID4gICAgICAgIC0gcnBtc2ctbWljZmlsLWNoYW5uZWwNCj4gPg0KPiA+ICsgIGZz
bCxscGEtd2lkZ2V0czoNCj4gDQo+IFdoYXQgaXMgTFBBPyBJdCdzIG5vdCBleHBsYWluZWQgaW4g
cHJvcGVydHkgZGVzY3JpcHRpb24uDQo+IA0KDQpPbiBhc3ltbWV0cmljIG11bHRpcHJvY2Vzc29y
LCB0aGVyZSBhcmUgQ29ydGV4LUEgY29yZSBhbmQgQ29ydGV4LU0gY29yZSwgTGludXgNCmlzIHJ1
bm5pbmcgb24gQ29ydGV4LUEgY29yZSwgUlRPUyBvciBvdGhlciBPUyBpcyBydW5uaW5nIG9uIENv
cnRleC1NIGNvcmUuIFRoZQ0KYXVkaW8gaGFyZHdhcmUgZGV2aWNlcyBjYW4gYmUgY29udHJvbGxl
ZCBieSBDb3J0ZXgtTS4gTFBBIG1lYW5zIGxvdyBwb3dlciBhdWRpbw0KY2FzZS4gVGhlIG1lY2hh
bmlzbSBjYW4gYmUgZXhwbGFpbmVkIHRoYXQgQ29ydGV4LUEgYWxsb2NhdGVzIGEgbGFyZ2UgYnVm
ZmVyIGFuZA0KZmlsbCBhdWRpbyBkYXRhLCB0aGVuIENvcnRleC1BIGNhbiBlbnRlciBpbnRvIHN1
c3BlbmQgZm9yIHRoZSBwdXJwb3NlIG9mIHBvd2VyDQpzYXZpbmcuIENvcnRleC1NIGNvbnRpbnVl
cyB0byBwbGF5IHRoZSBzb3VuZCBkdXJpbmcgc3VzcGVuZCBwaGFzZSBvZiBDb3J0ZXgtQS4NCldo
ZW4gdGhlIGRhdGEgaW4gYnVmZmVyIGlzIGNvbnN1bWVkLCBDb3J0ZXgtTSB3aWxsIHRyaWdnZXIg
dGhlIENvcnRleC1BIHRvDQp3YWtldXAgdG8gZmlsbCBkYXRhLg0KDQpJIGNhbiBhZGQgYWJvdmUg
ZXhwbGFuYXRpb24gdG8gTFBBIGluIHBhdGNoIHYyLg0KDQo+ID4gKyAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9ub24tdW5pcXVlLXN0cmluZy1hcnJheQ0KPiA+ICsg
ICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgQSBsaXN0IG9mIERBUE0gZW5kcG9pbnRzIHdo
aWNoIG1hcmsgcGF0aHMgYmV0d2VlbiB0aGVzZSBlbmRwb2ludHMNCj4gPiArICAgICAgaWdub3Jp
bmcgc3VzcGVuZC4NCj4gDQo+IEFuZCBob3cgZG9lcyBpdCBkaWZmZXIgZnJvbSBhdWRpby1yb3V0
aW5nPyBBbHNvLCB5b3UgbmVlZCB0byBleHBsYWluIHdoYXQgaXMNCj4gInN1c3BlbmQiIGluIHRo
aXMgY29udGV4dC4gQmluZGluZ3MgYXJlIGluZGVwZW5kZW50IG9mIExpbnV4Lg0KPiANCg0KTm9y
bWFsbHkgYXVkaW8gcGF0aHMgd2lsbCBiZSBkaXNhYmxlZCBieSBBU29DIGR5bmFtaWMgYXVkaW8g
cG93ZXIgbWFuYWdlbWVudCBpZg0KTGludXggZW50ZXJzIGludG8gc3VzcGVuZC4gTFBBIHJlcXVp
cmVzIHNvbWUgYXVkaW8gcGF0aHMgZW5hYmxlZCB3aGVuIENvcnRleC1BDQplbnRlcnMgaW50byBz
dXNwZW5kLiBXZSBjYW4gcmVhZCBEQVBNIGVuZHBvaW50cyBmcm9tIHRoZSAiZnNsLGxwYS13aWRn
ZXRzIg0KcHJvcGVydHkgYW5kIGtlZXAgdGhlIHBhdGhzIGJldHdlZW4gdGhlc2UgZW5kcG9pbnRz
IGVuYWJsZWQgZHVyaW5nIHN1c3BlbmQNCnBoYXNlIG9mIENvcnRleC1BLiBQcm9wZXJ0eSAiYXVk
aW8tcm91dGluZyIganVzdCBkZWNsYXJlcyB0aGUgY29ubmVjdGlvbg0KYmV0d2VlbiB3aWRnZXRz
IGFuZCBkb2Vzbid0IGhhdmUgc3VjaCBmZWF0dXJlLg0KDQpJIHdpbGwgbW9kaWZ5IHRoZSBkZXNj
cmlwdGlvbiBhcyBmb2xsb3dpbmc6DQoiQSBsaXN0IG9mIERBUE0gZW5kcG9pbnRzIHdoaWNoIG1h
cmsgcGF0aHMgYmV0d2VlbiB0aGVzZSBlbmRwb2ludHMgc3RpbGwgZW5hYmxlZA0Kd2hlbiBzeXN0
ZW0gZW50ZXJzIGludG8gc3VzcGVuZC4iDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg0KUmVnYXJkcywgDQpDaGFuY2VsIExpdQ0KDQo=
