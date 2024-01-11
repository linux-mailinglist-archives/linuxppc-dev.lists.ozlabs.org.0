Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAFF82ACE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 12:08:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TNSx5SkR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9hjH2NBHz3bp1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 22:08:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TNSx5SkR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::600; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9hhR2RFvz2xTN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 22:07:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYYs/kRq/78aBpeaqpSGGa0yOT/KS5OzC1mVVUsUin92y0wLcIXL+jsPbXlZ9ds4z06ZGjpQ/1cNN8sAqMUuDH7J/B+ByZI4Wl/7SGxrOaxALkACoNk0xvhqQKbmIJFBHmCwsu5H9Wqf9cEXl57LHaNZUCw+q538w404xwUCYbLcULPWEHja6tFjuOhOg5VAVS0NSL7W/opADvhNh63+Y9+6ci4nYzu6mydtCLqRNgOj+TrLD6FPNVc9jQckITYbriHkKKgBtaDpVYG5B/5EtQMoKbF6yvTVAqWJ+IkjABq5g1TBQ0RvvvWSN65/naaiu83dsaZV1d1w1XrDAx9/Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvDwk5jkP15X0Pm8mhccDPi8aUwn9kLsb0+YMzgMDpI=;
 b=jv9mq6psmLbPTCNFVUXzS5ir7iVsNvE9ZKRFm1Iw5fHJoba5Gs4u3YzZUFPPBAk1snYN+7Tp6nZOMiJrob9KsVU7ZJlJ1r2AotMwELQoPiY5SWoS7BUTDlAbQYucP1kDHGO6uSOSV+S5yXySkfceK6L9jV+M74IGIuMQtZBPVnt96oh5W4yWpdsyC+SIqBKM0V1oqsTa9ymJrDmCNKIQRBZp0rMWV8P8dtSFXgaTjAQ57ftHwo5qsobaIcMElqqP8t16C5Q+88nzHlPX/UO08FiMnXUIKmyrkfrp5t3LYV57O204N3+cplkdwb/lNW8mgAjpaf32b6wu8CmaDD+Yrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvDwk5jkP15X0Pm8mhccDPi8aUwn9kLsb0+YMzgMDpI=;
 b=TNSx5SkRtxDNSoW9xt9KH/UBupwbnNTirLGP+KBs85Z1FfmoehLG7s5YlViz36SFeh54lRcMjH7N98vtN/ogJW7GZlkKNWmH15OnfwJMIS1QXMsZ2vPEL3tQ7c+iMh7ohSDn5mAVnLoc2B7WCFSpvNrpzesRRJ1tKImw/b9VAxc=
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by PAXPR04MB8426.eurprd04.prod.outlook.com (2603:10a6:102:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 11 Jan
 2024 11:06:55 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c%3]) with mapi id 15.20.7159.020; Thu, 11 Jan 2024
 11:06:55 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shengjiu.wang@gmail.com"
	<shengjiu.wang@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
	"festevam@gmail.com" <festevam@gmail.com>, "nicoleotsuka@gmail.com"
	<nicoleotsuka@gmail.com>, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com"
	<tiwai@suse.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: RE: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,sai: Add compatible string
 for i.MX95 platform
Thread-Topic: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,sai: Add compatible
 string for i.MX95 platform
Thread-Index: AQHaRH5JRPPqOQSwLESjzaZBO2/1og==
Date: Thu, 11 Jan 2024 11:06:55 +0000
Message-ID:  <DB9PR04MB9498C7C66BD45F2FBDD163D5E3682@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: <20240109075551.870001-1-chancel.liu@nxp.com>
 <20240109075551.870001-2-chancel.liu@nxp.com>
 <8ed559e8-1f97-45ee-acb9-c792752fd419@linaro.org>
In-Reply-To: <8ed559e8-1f97-45ee-acb9-c792752fd419@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9498:EE_|PAXPR04MB8426:EE_
x-ms-office365-filtering-correlation-id: bca4a025-7f43-46ff-672d-08dc12956c30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  M9dGGskF9xcaa4hK/CaVb4WpyvoayVAU2CivokzSRGIz4Xvg4dpS2Lz86Nx5G5BzHVWHGeLENJv4Lmx9sdNTUCt+OJjmEd3O7lqxwacw76Bqi3GGc35s1AR5iAPZDGFF3eVSd1ZTJ2xhX6UcU8oy1lsWt9F8Xuqw2qdsn/RSpKrX9SCcvGkbnla+JMmXYg/RJXmw5T3zFGQU7tUcCNRZb2n/kXbTMncphgx7iSCyojME49Q4q/NIuYz5+QOaBspVv5b/t3q/IcM7H2F65LrUIDNCyY9XHYrvm7lm51LRzxozzVNzxC9Is+D9xgFV89kzRGhbB2yqSAi53hCAwtGMTtsVhHGkhHem5Iuqh2r9lQXfSWB6c+PE7ui9SVv06ABJdIZdI5saJZDBBZxxpUrtt0kSIQuSga3N3bCQ/ZQO8dT4xE07awUvyr8dh/yc8hxg6o8Fq/w4tURFZnhWVqHj+wpYV2n31JW3RaE1ZVOJIBxc42YBMi3S5UIsheiCDfdCVxhHGB/Jh7i0lhT6OZsQ3GD7RA5Q2xmJ+f4m5VuOu7x9XlGciCy77/Fo+y0U2Vy8BCnfW6bbtKWqvH3DSmJ2YAnIDPI0PwuxalL0OGL0mOgxmftDflTea/IG0hsoUqzGwI6Sbfcm4Bs9ZgOvq4AYvA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(55016003)(83380400001)(921011)(41300700001)(76116006)(33656002)(86362001)(38070700009)(122000001)(38100700002)(26005)(6506007)(9686003)(7696005)(2906002)(66556008)(66476007)(66446008)(64756008)(110136005)(316002)(478600001)(66946007)(71200400001)(5660300002)(44832011)(8936002)(8676002)(7416002)(4744005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?REs1NkVhdmhlVUVKamNZQWwzRjZtZlRvcHFrVE5mL1dKS3ZLTHBZNFQwakVZ?=
 =?utf-8?B?RldkeXhRUVhNKzkxcm1wNzY1Qk04dHFDQlFDekdsK3pBTERqTWNGTTNPYjl5?=
 =?utf-8?B?NnZ0bEFIb1ZlQitjcWs0V1AzekwrK2lqUkdtVkFjNk9jbU41RnQ3aW1ldUZa?=
 =?utf-8?B?NGk5eWNkQVpGZStUeVJyNHdCYmcwT3loOGtlTTB4eEd5Q2VTakRoQWNYbUQ0?=
 =?utf-8?B?OU1ldHM3MUNkNVFVeUlpSjhzcjFxWFNkVXVEeXZ6ZzBveDRsaW9aYUFwM3Qy?=
 =?utf-8?B?RXZRNGo1dlRjRitTZ0svV21scFgvL1FPemF2WGtoRXlCTzJKQ3hjNWJHa2xx?=
 =?utf-8?B?MU5STERlZXhFWEhsZnh6Q1VlRGxqUGpBZkJlNGhJRW5RK1JRVG4zTDBMTTJI?=
 =?utf-8?B?V2ZDdkZQTE1tWXVwQ29Eb0hsKzV0b0xsUVRON2J0bzlYa1ZuWWIzZW1QMEV2?=
 =?utf-8?B?aDR2RDdTYWxRWDEyOG1GVkNDL0NBbmtGaFhGWlpOUjRmR3ZYN2RpdnE5SXo2?=
 =?utf-8?B?b3VOYndxRWpJU2xlSnNiQzU3WXJGcmRWT0o5bFl2RDVGY2s1RDc3Vm56MWRa?=
 =?utf-8?B?andndy95UGFJTlNoS090NS9jYjV5a2R5UStJS2lGbWZJNjlkQjhVNWhHcW9O?=
 =?utf-8?B?WXBaR2xBWXRHWGR3S1pFa2E3QmFoNTdmREtIT2IvelZUM29pQWcyYlcrWUx5?=
 =?utf-8?B?S3dZTzhWUVVJTERHOUluQXVjOVdYaTlJenc5OC9IWlovZUtmcDhCcFQvR1Qw?=
 =?utf-8?B?ZXltUzlDN2JGVDQ4WTdXNkMxd0V1YWdDeU5RWGJ5M21jN3RWL0RldW5BR0xT?=
 =?utf-8?B?dFhaeGxVODFsV29uaUI3OVBKNEM0bnlVUXJzbnRZLzZPMjNaUnpxaWZQWDRy?=
 =?utf-8?B?WmlmdUdaYWwvRDRWMHhKY0RHVkFXd1lCRjdlbFMybTZoamRsTXljVHB0eURR?=
 =?utf-8?B?R2QzSlpnUTVzQmYwTUVpNmJpanFVb2F3VzFvQ3RGVFpBYm1ESFd6SVVvaEhT?=
 =?utf-8?B?ZnlFSmZvNjFZVUFib25HS0dLK1lFaXRySlZWdllPWUszcTNyMm9Ud09KcENa?=
 =?utf-8?B?Z1pPdGV5V05RRmtwdUV0Wmhab0h0Sk8xNHFmbTF4WnZNSFhIWk13VitjZUtv?=
 =?utf-8?B?K08yd2FaU2V6bUwxanppOWl1dHg4RHB0M0FBRytoOFZBM2RGU1BGMGk2N0pI?=
 =?utf-8?B?YzlDeTlZSUpzNWltaUNyM1JhdFZ2WDUxNmcrWTBsWmRCK1ZucVVzZ1d2VU5N?=
 =?utf-8?B?T1pSKzRCZHRVand4ZDllZHc2K05MWEdzOVhrSFZJdXlKdUtUdGxLQjdGOXRB?=
 =?utf-8?B?RDQ3bXdoZkRqQXV5WStLYUZCMWVleE1uUmtiV3dHLzd1ck5Vcy85RGhOa3p1?=
 =?utf-8?B?OWNxQWlEWk9nV3E3VFQxMTMzK0JONUtPWkljTnpGdHNPMWpQa0E3Z1BoWW9i?=
 =?utf-8?B?SFRaTUNDR0hqb0k2ejRRYjJORDNmbHFjZEd3enRZdGJmVFpzV1NTSFIrMTQx?=
 =?utf-8?B?K0lRc0hETEZPNDZhemdsYlBYZVRRbElrV1NRTWR5N3piYnpVcis4S2t2K3RR?=
 =?utf-8?B?YVNIbWNEUFc0QmdZZEhrZStEYzBjR1ZCTWhMdnhSTldCZUNUd2RwRzJBcWNP?=
 =?utf-8?B?MHRBYkxqZkFkeUJNRllnUUlLVEhnWWtWOG8wcFVuMUhlejgzaVArYlhsNnZS?=
 =?utf-8?B?WVNTRnBZc0tmRnBuSVdhNXZoSnR3bEJkN0Z4ZDFCUFFCMXZ5aTVRYjZBRlBv?=
 =?utf-8?B?b2VBNldrc3RoY0tOR2Z2RE1UZE02OGRBY3FkbHZXQmlob2M3OUpnSW1sMWIy?=
 =?utf-8?B?b0tNNFZJNzdGMTk5Y1dSM2RsUVAvcjBhUkRRaEowKy85dGZham1WOEZkL2NS?=
 =?utf-8?B?cFc0VlAyckR6SlVJUjBjQnJ5Nm4wa3RNaXZCZkt5N0xBcSswNzNtd2RPR1Ro?=
 =?utf-8?B?MW02U0twYnVVaENXNURmV1d0RHNDdE0xdWZiY1pOVC9laG5zNHNzSGdVTUNj?=
 =?utf-8?B?V1dlZGNzSGpMeVV0N0diRW9HSW1zbmJaMnM2dWRuUC8zY1VLRzNLODBVWGV3?=
 =?utf-8?B?dU5nRWdWTGltSmVZd2hjVjMyRWxQZkhSTVRLNVJBZDNGWW8vZm4vL3FRZzdq?=
 =?utf-8?Q?l7Ak548xV1V2Rbmelvv5Cscjz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca4a025-7f43-46ff-672d-08dc12956c30
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 11:06:55.3813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LIWRTMjTkZxD9vblG2e7w4OLVKKBF8apbp3EAIlVsBCgWJAXvng4hQFZM5OCQ1kFuv4pbpPY7ESK8wnmheXPgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8426
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

PiA+IEFkZCBjb21wYXRpYmxlIHN0cmluZyAiZnNsLGlteDk1LXNhaSIgZm9yIGkuTVg5NSBwbGF0
Zm9ybS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoYW5jZWwgTGl1IDxjaGFuY2VsLmxpdUBu
eHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c291bmQvZnNsLHNhaS55YW1sIHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zb3VuZC9mc2wsc2FpLnlhbWwNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc291bmQvZnNsLHNhaS55YW1sDQo+ID4gaW5kZXggMDg4YzI2YjAwMWNjLi5mM2Q5MTBh
YTJkYzYgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NvdW5kL2ZzbCxzYWkueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb3VuZC9mc2wsc2FpLnlhbWwNCj4gPiBAQCAtNDAsNiArNDAsNyBAQCBwcm9wZXJ0
aWVzOg0KPiA+ICAgICAgICAgICAgICAgIC0gZnNsLGlteDh1bHAtc2FpDQo+ID4gICAgICAgICAg
ICAgICAgLSBmc2wsaW14OTMtc2FpDQo+ID4gICAgICAgICAgICAgICAgLSBmc2wsdmY2MTAtc2Fp
DQo+ID4gKyAgICAgICAgICAgICAgLSBmc2wsaW14OTUtc2FpDQo+IA0KPiBEb24ndCBicmVhayB0
aGUgb3JkZXIsIHBsZWFzZS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNClNv
cnJ5IGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCdzIHRoZSAib3JkZXIiIHJlZmVyIHRvLiBD
b3VsZCB5b3UgcGxlYXNlDQpleHBsYWluIGl0IHRvIG1lPw0KDQpSZWdhcmRzLCANCkNoYW5jZWwg
TGl1DQoNCg==
