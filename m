Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7968D741A5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 23:11:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ZPEOQikY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrvQH2q20z30Nn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 07:11:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ZPEOQikY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::61d; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=leoyang.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrvPK51qhz2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 07:10:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dBVJ/ZYEfG0bXPqkD/QzVI+uOoD20auom3Xzj4c2gctHGaShJOhqS6IgsB9l49MQtZWKjLaxnIbW3SDUyuyKv2YuEyGQ1npZs7mJg2ubFVr+CVyXDLXikUnSbvIDj2HXz6e7b0UgoVtBuUS+3CELwNqP2f9QXPuBRPpdvf7nBT70LlnG7sVKRi5Rodmv9j7s5rELDhJXZNmU+gspr+YvU64tY4V86fyxuesGq6htfPTnF6bJmZ5zKKEjV3AuJhEDb4o+ddCriCvR2qmlY8Bpyz+tzHm+/drb3+HrMpKr88SYEneZY4TiAOQEDaW0SGbLRoc42faKKCfanSBKMZxUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/mJShD8IBxUBtDIaIr0eHfsZx28V2yRA1R6tClfE0o=;
 b=RoceazeNp0wcrkc2WBbupAYObBeq5pLT5Kmjk0cQ9KLwlMsTrB/SbQE2AfYGhkEsWj75lwa8wCshAD0hYZQrk+4+rwQAP9lAHRMPSVnLYltuGQ8q0gktjJbGv3uHXA2KlkCZegrGsbD57bNsWWAPNkB/OTZLL8aXJioKE06EOdCmnzee1BsWbMoWhfyZF8L+x/EX/IwdWLbDn4wENdY99A+FGeto4S3GaU1m0FNNdrLmQ6GLy1VaWf9N+FINcpXnOfiIJpSjvc5EkNwr1V6kyv2CmDgU12hnYZGcG8ZD86jRyCJGd63nFzyQrHV5neLQtjKp5LbGGlFwTnW8A2SX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/mJShD8IBxUBtDIaIr0eHfsZx28V2yRA1R6tClfE0o=;
 b=ZPEOQikYJmXM9AMuhX8EksnCSVvjm0oWV9s1XPFItgq8FG9+hcSWlaNizb4hAVeyi/jPb9ECpkqslsuxzlegPHdrO+Hzrd9zt4cx1CuCUfQLIL8cCRDrC3xRjkdKNusiV1X4CfmxL7aR3KqBI/XM0qgbA9ZNIKhMyHwLO9AfzQs=
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23)
 by AS5PR04MB9923.eurprd04.prod.outlook.com (2603:10a6:20b:67f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 21:10:02 +0000
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::7aac:2f58:b7e3:2c24]) by AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::7aac:2f58:b7e3:2c24%7]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 21:10:02 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Ma Ke
	<make_ruc2021@163.com>
Subject: RE: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9
 udc
Thread-Topic: [PATCH] usb: gadget: fsl_qe_udc: validate endpoint index for ch9
 udc
Thread-Index: AQHZqZi9K7bLkqeFik2hEi3PRtnNM6+gcHbggAAtAQCAABgTIA==
Date: Wed, 28 Jun 2023 21:10:01 +0000
Message-ID:  <AM0PR04MB628929736762F5DF46C55D708F24A@AM0PR04MB6289.eurprd04.prod.outlook.com>
References: <20230628081511.186850-1-make_ruc2021@163.com>
 <AM0PR04MB62893E77D085030A6E2C37B28F24A@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <f321287d-8156-b805-26fd-58acfa26e324@csgroup.eu>
In-Reply-To: <f321287d-8156-b805-26fd-58acfa26e324@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6289:EE_|AS5PR04MB9923:EE_
x-ms-office365-filtering-correlation-id: 914a68b4-0bb0-4d31-9f45-08db781c09a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +MXzSn3wJeCsrxX+DY9/Aifj1JpcZSZcLXQ61gLWzlwMW2h1q0a+PJUylDa++/dADHmd0XCHsGc0Eyiv4AgJtzJl+wPivCWNfw0adzoZyGlm54cQxUu2YRsyNNSqqGe24LzzPpa7z0uKKLmVjo+QsaBSIleXCHdO9OhU8VzkVQYThYCMy6FVOl/Tw/MYinp86JmjQhsT0xsr1WphJcCStccSZcN1co/HRDKLqtg/P9YgW5vQlOwAm6ddku1+ecOblmVyu2kXwgB6CjCo8ODhWhf0oSjLb+1AKSXOggpig9b0rM5vVeL6kEd++G7AzyINMu+jMHE6ozGK6yKtMV6q3gWc9oUoxhhwGQ23HaQRfNi8IPiRym/C0PLoZ6lhBWB45HNnu9B4zEqWzOBLUUYKjnY9g9IsMcJVj6QM4pmiICr4G2gDQ/xXGBLPM5Yv7tFtlkiV3hZDfiuqZXleM+ZwlOwsxkSBFSh+lgXr4I9dY7kDGZFmYLITnD6LRkwiOhnjHe1G9enU756Ppqom4zr8Stbu+03lAdQS11tSM+YoqwElhV8mt7GgPay6G/lDknh6Jqn+Rk96jGyhvdgByoqaV8ANL/uxuPYjR+JHAXMv4Dhqm2ry8N2OK4I6rxd+XokI
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6289.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(66446008)(38070700005)(26005)(66556008)(66476007)(33656002)(122000001)(52536014)(66574015)(86362001)(8936002)(41300700001)(4326008)(316002)(8676002)(55016003)(66946007)(5660300002)(64756008)(38100700002)(76116006)(110136005)(6506007)(53546011)(55236004)(9686003)(186003)(2906002)(83380400001)(15650500001)(71200400001)(54906003)(7696005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WFhSMzhZQ1lodjRVU3ViMWhoUjlpdUE3UklKMHNZaTMxcjMvbW8wWE9xOE4v?=
 =?utf-8?B?VjFJdnpDOG5qL3VScGgvcTE0bFpFMXVUVE9tYnRNWXF3U0xUalhURmxLNEln?=
 =?utf-8?B?WHpCWXR3NTB3ejMvNVBpS1hpQ3Q3SGovenIvMWN6QUttSTNoWmtnbmZYMCt1?=
 =?utf-8?B?MHZtaUVzaVY0anRvK3JnSlB6SUhhNFBHdDZSM1hZSno2TUI4c3puYndra3d0?=
 =?utf-8?B?cEFOR1ZvQ2o1aVhqSG5Yd25LdEErVWs0bjJ4OXBOV1ZYMUIreDNTeEd0cHFE?=
 =?utf-8?B?b2hXYi9ydkdUUWEvQlphdzQ3K3dEQ1pFd25VWldvcWlVY0RJdGdUejdOTnZM?=
 =?utf-8?B?U0pRSXZPUVlFVmplTjByWndEelB0QVIxZm80QWRhdUsxVGJzUjRiUTN3VUYv?=
 =?utf-8?B?VXJjN0RJcnBlNFF6N3JVYk9NMkNmYi9NcFJ3eEtKSDNyRlJrUzRlNkJkaTNG?=
 =?utf-8?B?UFlnRE5YUGhreG1kZjlpZzR2dDA0SXc4M3BxRHhSNG1kUzdJWmpPNU5weWN0?=
 =?utf-8?B?aG9EYnV6Szh3Y0FVUTdUZitYSjAzRGI5eTBzWGQ1YmsvWElZbCtLU05ZRnFq?=
 =?utf-8?B?aDA4b1FnVEd3QlJmRmlRRFVkSm9kY1BjenFUQnNvV283NUV6ZkV5OTdhcSts?=
 =?utf-8?B?ZkFaK01TcThlV3JBaXdjc000YUI2cE00S042eUM2VHRBTTgwRjV0Rm5SRWlp?=
 =?utf-8?B?NHZkR2V5SHhmZUZXNUVsRjQ5cThBdjYwSVRyOXR5d2N3WFNiTFVaZkFWME9u?=
 =?utf-8?B?UzE3Wmw4d3lFNU10RGFyUnMzRUh4SmV3NFlRMURhL01xT1lGZm5IRmo1eEFM?=
 =?utf-8?B?Y0d4cE4wTWhCNVg5aXpXRXMyblpsTWFKc0hQYXU2ZDM3ejg4YTZOc09pUHJB?=
 =?utf-8?B?RldDSUt4WTVSWUlVQTBZY1F2MUNkS29RMlFWNFEvUGI5WHdzaHNmTFRoVjd1?=
 =?utf-8?B?RjlmME0xUTBuM0E2elhDSXFZSUxWYVpUZ2UzTXN5OUJNRjl0MS9VeFFsWUpr?=
 =?utf-8?B?K29qWGhVbXBIajFqVXpEZXlyU2RuMnFxclhkU3BqS2xNL3V5OGQ3ODlMSHVk?=
 =?utf-8?B?ZjU3aFhwQXo5VjRRbzlyN2JqejgrUDIzd1NiZUZkYmJTZUE3UHlBemp1aFZO?=
 =?utf-8?B?Tm8wVzZVQ1l1ZU9Idi9GbkRsZVp2RXBpRnR4eXpBQzVBblRSNVFHaXhybHhI?=
 =?utf-8?B?OU5oL3Vybk1tTVVWWk12cWQrYWMzb2NTaW4zenFVbHpKM0trY2JJdjNXRHB2?=
 =?utf-8?B?NmNlNHJrZGFFOVFJZTJmNmt2REZxNFBEVTBBN1FWR3U4UHY0OGN4MFZxTGZz?=
 =?utf-8?B?dFdNNDBtVDZNaVMzV3N1VDVUUkVtQXdzSkMzODVoSGJqQWJIMWNzVGFyZ280?=
 =?utf-8?B?cXpQUjNScEVpd2gzTHlpRFZsZzQ3bFgvZ1gzYWtGcXY4d2hHWjBHVGVFWE1Q?=
 =?utf-8?B?alVneU1jZTVkVm1uSE5PbWZUNlQrSXdDZjhnY0x0SXJsR3Z4M3k4dzduSU5D?=
 =?utf-8?B?L0NQdU5ncDJPVy93c2ZOazJ2UW43ZGM2NlhIbmk4a21CZkdUQmZBMGQrbWY2?=
 =?utf-8?B?WE1UT2ZkdTVHVktqbzNQV043dGdaQm51MVAzaUtZMDkwU1B4RmJYTW9KVTkr?=
 =?utf-8?B?aFdJcUNRZktyenZvMVZHOWtobnQ0OE9Rc3h4aXJTN1ZtbWdkOTRJdW9hclgx?=
 =?utf-8?B?cndvQi9uYjhVYitCRmU0VFFTUTdnS1BkM3c4NmVJU2Y3VGJLczQ4NDJvaExK?=
 =?utf-8?B?MStoY0pPQXp0K3NKcC9xSmt6QUJSa1BXM3dWK3JVdlowVDlUdjNuV1RNVWZ1?=
 =?utf-8?B?dFFHWVFmeEF2MnoyVjU1SkJzNFA3WFNYU1BYOHZ4ZldISnRzRFFSVHdacTVh?=
 =?utf-8?B?NytlWnJNTDMvQjZHYWdiTFV3MXBnRWJHNElmN2x5MmNaVTV6Z0tiOEQ1dXZq?=
 =?utf-8?B?L3pwL0ZjeG82UnU5eEtQQnRFZS9SeStJMUsrcjJ3YXZWM2E1Tzk2a25TWGcy?=
 =?utf-8?B?R3hiSm5DMjM1ejIvQm9LOWFaQTNXalM4TVNMZ2dhSjFlMXpJNGtxUDN3a0Vh?=
 =?utf-8?B?aEpnV0xUZE1IOHZFQTVya1ZFNW1oVFdoL1FTYktJUEZvRFdKdmE4amExUFJR?=
 =?utf-8?Q?H9TbVxhdV32ETBUcKx7euBjPt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6289.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914a68b4-0bb0-4d31-9f45-08db781c09a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 21:10:01.8755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Z9vL6BEkJZxgU7Va2j1bB1L3empmTE+gLIIJ43gC1CaaDmho6TpemwhGVqB2kwcljRJbVVuRE9mKZjmSWABVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9923
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0b3BoZSBMZXJv
eSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUg
MjgsIDIwMjMgMjo0MCBQTQ0KPiBUbzogTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBNYSBL
ZSA8bWFrZV9ydWMyMDIxQDE2My5jb20+DQo+IENjOiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
ZzsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgbGludXhwcGMtDQo+IGRldkBsaXN0cy5vemxh
YnMub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIHVzYjogZ2FkZ2V0OiBmc2xfcWVfdWRjOiB2YWxpZGF0ZSBlbmRwb2ludCBpbmRleCBmb3IN
Cj4gY2g5IHVkYw0KPiANCj4gDQo+IA0KPiBMZSAyOC8wNi8yMDIzIMOgIDE5OjA0LCBMZW8gTGkg
YSDDqWNyaXTCoDoNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+IEZyb206IE1hIEtlIDxtYWtlX3J1YzIwMjFAMTYzLmNvbT4NCj4gPj4gU2VudDogV2VkbmVz
ZGF5LCBKdW5lIDI4LCAyMDIzIDM6MTUgQU0NCj4gPj4gVG86IExlbyBMaSA8bGVveWFuZy5saUBu
eHAuY29tPg0KPiA+PiBDYzogZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGxpbnV4LXVzYkB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4cHBjLQ0KPiA+PiBkZXZAbGlzdHMub3psYWJzLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgTWEgS2UNCj4gPj4gPG1ha2VfcnVjMjAyMUAxNjMu
Y29tPg0KPiA+PiBTdWJqZWN0OiBbUEFUQ0hdIHVzYjogZ2FkZ2V0OiBmc2xfcWVfdWRjOiB2YWxp
ZGF0ZSBlbmRwb2ludCBpbmRleCBmb3INCj4gPj4gY2g5IHVkYw0KPiA+Pg0KPiA+PiBXZSBzaG91
bGQgdmVyaWZ5IHRoZSBib3VuZCBvZiB0aGUgYXJyYXkgdG8gYXNzdXJlIHRoYXQgaG9zdCBtYXkg
bm90DQo+ID4+IG1hbmlwdWxhdGUgdGhlIGluZGV4IHRvIHBvaW50IHBhc3QgZW5kcG9pbnQgYXJy
YXkuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IE1hIEtlIDxtYWtlX3J1YzIwMjFAMTYzLmNv
bT4NCj4gPj4gLS0tDQo+ID4+ICAgZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9mc2xfcWVfdWRjLmMg
fCAyICsrDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9mc2xfcWVfdWRjLmMNCj4gPj4g
Yi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2ZzbF9xZV91ZGMuYw0KPiA+PiBpbmRleCAzYjFjYzhm
YTMwYzguLmY0ZTVjYmQxOTNiNyAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0
L3VkYy9mc2xfcWVfdWRjLmMNCj4gPj4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9mc2xf
cWVfdWRjLmMNCj4gPj4gQEAgLTE5NTksNiArMTk1OSw4IEBAIHN0YXRpYyB2b2lkIGNoOWdldHN0
YXR1cyhzdHJ1Y3QgcWVfdWRjICp1ZGMsIHU4DQo+ID4+IHJlcXVlc3RfdHlwZSwgdTE2IHZhbHVl
LA0KPiA+PiAgIAl9IGVsc2UgaWYgKChyZXF1ZXN0X3R5cGUgJiBVU0JfUkVDSVBfTUFTSykgPT0N
Cj4gPj4gVVNCX1JFQ0lQX0VORFBPSU5UKSB7DQo+ID4+ICAgCQkvKiBHZXQgZW5kcG9pbnQgc3Rh
dHVzICovDQo+ID4+ICAgCQlpbnQgcGlwZSA9IGluZGV4ICYgVVNCX0VORFBPSU5UX05VTUJFUl9N
QVNLOw0KPiA+PiArCQlpZiAocGlwZSA+PSBVU0JfTUFYX0VORFBPSU5UUykNCj4gPj4gKwkJCWdv
dG8gc3RhbGw7DQo+ID4NCj4gPiBUaGFua3MuICBUaGlzIHNlZW1zIHRvIGJlIHRoZSByaWdodCB0
aGluZyB0byBkby4gIEJ1dCBub3JtYWxseSB3ZSBkb24ndCBtaXgNCj4gZGVjbGFyYXRpb25zIHdp
dGggY29kZSB3aXRoaW4gYSBjb2RlIGJsb2NrLiAgQ291bGQgd2UgcmUtYXJyYW5nZSB0aGUgY29k
ZSBhDQo+IGxpdHRsZSBiaXQgc28gZGVjbGFyYXRpb25zIHN0YXkgb24gdG9wPw0KPiANCj4gQnV0
IHdlIGFyZSBhdCB0aGUgc3RhcnQgb2YgYSBjb2RlIGJsb2NrIGFyZW4ndCB3ZSA/DQoNCkJ1dCB0
aGV5IHdlcmUgYXQgdGhlIGJlZ2lubmluZyBvZiBhIHsgfSBibG9jayB3aGljaCBpcyBjb21wbGlh
bnQgd2l0aCB0aGUgQzg5IHN0YW5kYXJkLiAgSSBrbm93IGdjYyBpcyBtb3JlIHJlbGF4ZWQgZnJv
bSB0aGlzLiAgQnV0IGl0IGlzIHByb2JhYmx5IHN0aWxsIGdvb2QgdG8gc3RpY2sgdG8gdGhlIHN0
YW5kYXJkPw0KDQo+IA0KPiBUaGUgb25seSBtaXNzaW5nIHRoaW5nIGlzIHRoZSBibGFuayBsaW5l
IGJldHdlZW4gdGhlIGRlY2xhcmF0aW9ucyBhbmQgdGhlDQo+IGNvZGUsIHNvIHRoYXQgd2UgY2xl
YXJseSBzZWUgd2hlcmUgZGVjbGFyYXRpb25zIGVuZCBhbmQgd2hlcmUgY29kZSBzdGFydC4NCj4g
DQo+ID4NCj4gPj4gICAJCXN0cnVjdCBxZV9lcCAqdGFyZ2V0X2VwID0gJnVkYy0+ZXBzW3BpcGVd
Ow0KPiA+PiAgIAkJdTE2IHVzZXA7DQo+ID4+DQo+ID4+IC0tDQo+ID4+IDIuMzcuMg0KPiA+DQo=
