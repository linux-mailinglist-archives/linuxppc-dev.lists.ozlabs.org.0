Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B38288D0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 16:16:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=J/i1B35l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8ZK94SNzz3bPV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 02:16:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=J/i1B35l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::601; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8ZJG4kgrz30NY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 02:15:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OCzTw7j5Jd3lJgUQFsRfbUGIW8mC9acN5WRDz8VcN11Ra0+x+k7HTEPJ2PRvelg02O443RU4Ye4ktA7++j+fB1/bcUR9yXrbMKtYELjPxxItZLhAriC0BVT9qzjSwH8A64J9VcJsSB1rKpq7LAUiLKBrYHsHTle4aXYICv8RTedNhN/H008uw4WKabpjw4H5BquZfZteLyOJc2g7C8/yEZPBI1ZUNY0zjCKSmnyiKpB3VpFjZL8+MzmEaH40m51O67pvBKVFn9XrcBGvPpQ1pElsOKIS4Mv6rYd0r9kgu5NupkeImtXJq0Sy6CvWXIUQqRNPuO7Xr3oX1hohLD29EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wvrdxrm4huzGYqtS3Qlr0wyi64P1V7fF7peU08UOoc=;
 b=g1TnV3cSpNXs0H6wou3OlNZdWu2ikhdZaWHNetjH+VNxrOI4kM4zatGAFR/PQYfRk0ibCiM0alqazBqPThEHGK8mW4VlHlzEIMGaVQY/RrXmtVh+EFBGLyOeG34VWxPfY8HsqaCO4UexkB+vVj43nUum/3l1dV5/41YF3YzHKAvL+TiFXaxnQBpc9/j5OZtL0xoUAt8pECZvoyW4aWBQtatb/P5NWZ0I6M81Ug69NCNwyDRwbxx/XMeWw7Lm5wyVS1K5kI718mkAOy5ea01P5WT53tFiEBradyX5H/Rlk/BL+04aGTXmvG295DbkS5WscHdwQpBZrPdaHVL7t5V8GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wvrdxrm4huzGYqtS3Qlr0wyi64P1V7fF7peU08UOoc=;
 b=J/i1B35lIHynWlNiJJfA2d1m9ddro6rr/Qfw4L3j16bFt3ybbfVa6BBujk8Hed+2D3Vre258iLNCome0j4Nv9T5eWpYwbagUC14k/qmHb1K6z/DES/IMrdyQZZch3h1zFZroJ3dO+bhYTIhd7bOPgJMzqZRgwP0XtVAlQD3aaYOep5A7LnjA79EqkKKcuedaLk6ks1YfDlWgrZTID5TKUQEQRSiBr784VLipUG7HlhSBMHp6/oBCA4mZJmUdcG+9KBKc4GvWj1urOEgXqkh9iZ1VFobERTUn7ClUHauB1inuLGCu+aOvlIXcYpWhP5dwMQYfsdEOcgWnHLT5jBmTKw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2900.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:39::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Tue, 9 Jan
 2024 15:15:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 15:15:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/Makefile: Remove bits related to the previous use
 of -mcmodel=large
Thread-Topic: [PATCH] powerpc/Makefile: Remove bits related to the previous
 use of -mcmodel=large
Thread-Index: AQHaQwDfgOVByp+uR0yb3SFXZTENubDRl2GA
Date: Tue, 9 Jan 2024 15:15:35 +0000
Message-ID: <47691590-3698-4dea-b093-6619796fa9ea@csgroup.eu>
References: <20240109133420.3048719-1-naveen@kernel.org>
In-Reply-To: <20240109133420.3048719-1-naveen@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2900:EE_
x-ms-office365-filtering-correlation-id: 2c834e1d-6aa9-4e05-8b6a-08dc1125d487
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ixKarEg7N1dw/9SBRfuJqkQdpNk9dWSJjnaUmHIfSVcyZeK+ESqCvooNexcsxV4D+Hq4nvKGjFVT3nxUESr42G1w1ojB/kCnNj5v48exaASbRHQHBnmSEx1eWX9pzZ97r2h2XPIXRjwC/azciEBgjt9MqDdgApeWIWgLVYmWdBRKcFKONxmLa6bweVrtM0tCpE8IaW9oagqDbNf6ybYvo6YEjdSWNmf6f+K5EpDwylGJFkaKpqerGeVt+pK6RuuR3nRUtyhnzQ/MyMi9CkIGNaniVbdRF9BJ70zK+tO5fFFL4/kDNT1q7DpZCqWyf6o55PhcrTaEDgAeRtdFUfKFFz/ZvMahlh1ie8SsTeUq2S0G1ocj5NhHjwct1STNoqFedLcLE1/+LSfkn4ATRKIzJsQHbcab3pZGgfdhgXWefsRtgXrVr+YmiUNNi3e8LKFYqGH+il/EiXQtlFVuKydBZ9pMpi/rHpM36KDMHVl4OOab0Np9EVJ2parzRgx49Arpviu9CCbUphWBtQTrfMeas+3vv6gFIGVhQGvuCdlJzKnzxGQvyUgboEk3R01bspXqjZdOtQ2srbEqPc5Prcm7/2f3oWctFR17GD+MqV5tYb2BOi6FJbCr9lOiW58BesTIDvmGZY3HQPwIdboaAXnTBtlNFX3TJDbJC/MKa9jLK5Lih6XRnWcKJ61Om9APUvgE
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(366004)(346002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(8676002)(8936002)(36756003)(6512007)(478600001)(6506007)(71200400001)(26005)(2616005)(66446008)(76116006)(66946007)(66476007)(66556008)(64756008)(91956017)(6486002)(122000001)(38100700002)(31696002)(83380400001)(86362001)(316002)(38070700009)(110136005)(5660300002)(2906002)(41300700001)(31686004)(66899024)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R0tQWG9EZFNNaE1WV0pGN2hzRjJVbEs0aDB5U09oSGFYd09mMlUyVjR5L2Vh?=
 =?utf-8?B?WHhCS2Q4b2lzWklvaXVYNEpnL3ByOEdRL3UralFWb3daMU5YN0Y4ckx4Qit0?=
 =?utf-8?B?UWVHdHdzZWJmQXlTRHJOc3ZaNWE5Ni9TWll1Z1RlQ2d3cUt1Wmt6OGJSeDF4?=
 =?utf-8?B?YmU2a3NvbDRCQjg5a2xxZmUwWEdXWEhrM0dEdjdrdGUzV2FuTGZtQmo3OFVu?=
 =?utf-8?B?N3ZuVmlPR3hIWk1Vd2szbEVUYWVNeEhIL0pRSWVKWlp3T0x5VHRaSnZjZjVi?=
 =?utf-8?B?L1RRajlUMmlJSXJQVzRnMm9JekZwU1pBcWZST3J0YzIrR0k4Q1VwaHBPTC9V?=
 =?utf-8?B?amRNWlJ1WUxQczhSbmFQYjN6ZnpWUDBTVmdLSXArK3NoMnFZQ1FYRkJaNDQ2?=
 =?utf-8?B?eFR5NU9DaHJVdGN6NlZnbGg5UFNtOWtxV0FiSUZSZzlJVDhlanFZNkcwQmxj?=
 =?utf-8?B?VEhZNUlaMmU5SXVteUNzRUJ0bXhEblF6N0djZ1pYOHFJb1RkNkhDSHc5Zngr?=
 =?utf-8?B?ZGdRSEhicG15c3JvRStOamVtQTRmOHVSZ1JFOUoxTGQrNmFZNlAxUlI5VExQ?=
 =?utf-8?B?aVVQbWpuV3ZNSDlkUDRmbUhkZGNvVXRNeDZiTmFvY1hJb3NpLzdkKzJ6Unhm?=
 =?utf-8?B?cGtoOFMvVzFQeHJEd1drdjlnNDNBc2dKU2dLRExtWStLUFFzSjVtZm53Rk5t?=
 =?utf-8?B?UDBKeUw4WnpJYzljQlRNOXRCVjBSN2xabVN2QVJoeDVGSkFBVG5DKzJnVEVG?=
 =?utf-8?B?S2hKUnBZY3hnTll2cWI4M0poZzAybk93a0R3Sk5RbG9sY2pZNlpkTjRnVFgz?=
 =?utf-8?B?YnowMGp2Tk94R08raFhucXIrbGNHRHNKaENSaGdJWjh6ME9YM2JKeGhtWFVZ?=
 =?utf-8?B?S25ZQno3NWs2UWZ0L0lqR2dvNHBleU5UNUwxQ1NSUGZYb0F3RDU5bFgwUkFP?=
 =?utf-8?B?RHdGbEQ2K1JGdkFZWXRmd2RSZFdQbVJacnJxV1pKa0JpOXJHR201NVE2dnU0?=
 =?utf-8?B?VUNVN0lBSUt3VytlMlJRNmpIRndvTXUveitpUmxuQlQzTUNUc0hIQmFlM012?=
 =?utf-8?B?Y3BSeGhpbkJKQWw5SmU1ZEFDQWlhby8vNXRHYS9KTjk0WjZPd1ppSytiZWFQ?=
 =?utf-8?B?UExKSGFXMkdWSGM5Rm0rZ3k3dGI5VTB2YUt0MmxNZCs5WUUyNmN6RVNwNERD?=
 =?utf-8?B?azAzcWhPZFl0TTM1ZTFhK2tXK3piazJsOVVhcS9ZUlhnTGE3d1dQN1prZi91?=
 =?utf-8?B?Q2N3RllncnNWanJTN0hrT3JHek5iYnBvN0l2VkQyVGIxd0xmcFpGTUdUNERx?=
 =?utf-8?B?SzhlaHBGRmpBWEllSHJoUE9kWmsrcXpYYVJIY0RaOHk2dHVSdGg2TFNzL0Zo?=
 =?utf-8?B?WnA0Vk54ZWRabkRCdHo2dXdEN3pOY2cwcDdWT0ZQWnlRZEM1Z1JDWTlFekhZ?=
 =?utf-8?B?cFFjZ0lpRkhkTm82cG5VcFR1VnNnWVZWN3NrVm54ZnpmUGluQnNENXl1aEdN?=
 =?utf-8?B?V29hbjhnZFYwV2tJZm5ZbmR3VVpaakVjMWMvSS9oZXhkRHB5ZFJSMzFReEds?=
 =?utf-8?B?azdlUDIydGs5RDllTFJzZlNGNlk4KzIzZmpkSjVYWENrN0QzVDBQQ09MdGVk?=
 =?utf-8?B?SUNTZU1IUk9qaUtYRU1vdzhacHMvT0dWVzMzWmEweGZtODBHMUQ5akxqb3hF?=
 =?utf-8?B?M2RVWElmWlN2c0ZmQ2puV2h6NUNSeG9tcEJkbVhOYXNXNFo5c1ZZdkFrSXpx?=
 =?utf-8?B?L1YyNmRvVmRUc3BQOHpGWTZwMEJUdzM1SFNLb3Z6NHArSnFISjJFZ1pXVkcy?=
 =?utf-8?B?dnV5K3Mzd3RldFh1NE5iTFRncWo1NWljRjBIclVJWGo5cGYzcEYxZEVPYzJr?=
 =?utf-8?B?R0hnV2EwNU52SlNJeUplcHE3djdkb3E1aEpheHhHQ2xRU2p1aEtlVURwa0ww?=
 =?utf-8?B?SUNPalV5Y3h3WG04NHliY29lMGZOK1ByK0hzazMyM2RkdU1QV1JYUGRLckly?=
 =?utf-8?B?RXNsa1ptOC9tUWRHdHhrZlJoWURjWmhSeEc4ODhwSDhSZjc4Z0NycGpjTnlY?=
 =?utf-8?B?UU1aUjk3NEZnVlJad3Z0MnBvbjIrTGdmOXQyQXhHNmdGNHQ1MnNWUUdxWE51?=
 =?utf-8?Q?wtlh9J+F9Ggd9ebcWAEKLLzy9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <72228A695107AD44A9E6136B19AF0415@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c834e1d-6aa9-4e05-8b6a-08dc1125d487
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 15:15:35.6563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zC4LDKXxeMPSqGfo9HcGzcWHka5fMSRUz3SLWyd4SFeWS9sXOy724dyXPmJAeTIQAiEDtwAjsoYeU77cOLd8uKwyLb0Jr9fhJZ4X8qGH3M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2900
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

DQoNCkxlIDA5LzAxLzIwMjQgw6AgMTQ6MzQsIE5hdmVlbiBOIFJhbyBhIMOpY3JpdMKgOg0KPiBB
bGwgc3VwcG9ydGVkIGNvbXBpbGVycyB0b2RheSAoZ2NjIHY1LjErIGFuZCBjbGFuZyB2MTErKSBo
YXZlIHN1cHBvcnQgZm9yDQo+IC1tY21vZGVsPW1lZGl1bS4gQXMgc3VjaCwgTk9fTUlOSU1BTF9U
T0MgaXMgbm8gbG9uZ2VyIGJlaW5nIHNldC4gUmVtb3ZlDQo+IE5PX01JTklNQUxfVE9DIGFzIHdl
bGwgYXMgdGhlIGZhbGxiYWNrIHRvIC1tbWluaW1hbC10b2MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBOYXZlZW4gTiBSYW8gPG5hdmVlbkBrZXJuZWwub3JnPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0
b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQpTbWFsbCBjb21tZW50
IGJlbG93LA0KDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICB8IDYgKy0tLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZSAgICAgICAg
ICAgIHwgMyAtLS0NCj4gICBhcmNoL3Bvd2VycGMvbGliL01ha2VmaWxlICAgICAgICAgICAgICAg
fCAyIC0tDQo+ICAgYXJjaC9wb3dlcnBjL21tL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgMiAt
LQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9NYWtlZmlsZSAgICAgICB8IDIgLS0NCj4g
ICBhcmNoL3Bvd2VycGMvbW0vbm9oYXNoL01ha2VmaWxlICAgICAgICAgfCAyIC0tDQo+ICAgYXJj
aC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL01ha2VmaWxlIHwgMSAtDQo+ICAgYXJjaC9wb3dl
cnBjL3N5c2Rldi9NYWtlZmlsZSAgICAgICAgICAgIHwgMiAtLQ0KPiAgIGFyY2gvcG93ZXJwYy94
bW9uL01ha2VmaWxlICAgICAgICAgICAgICB8IDIgLS0NCj4gICA5IGZpbGVzIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAyMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvTWFrZWZpbGUgYi9hcmNoL3Bvd2VycGMvTWFrZWZpbGUNCj4gaW5kZXggMDUxMjQ3MDI3
ZGEwLi5hMGViMGZiMWFiYTggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9NYWtlZmlsZQ0K
PiArKysgYi9hcmNoL3Bvd2VycGMvTWFrZWZpbGUNCj4gQEAgLTExNCw3ICsxMTQsNiBAQCBMREZM
QUdTX3ZtbGludXgJOj0gJChMREZMQUdTX3ZtbGludXgteSkNCj4gICANCj4gICBpZmRlZiBDT05G
SUdfUFBDNjQNCj4gICBpZm5kZWYgQ09ORklHX1BQQ19LRVJORUxfUENSRUwNCj4gLWlmZXEgKCQo
Y2FsbCBjYy1vcHRpb24teW4sLW1jbW9kZWw9bWVkaXVtKSx5KQ0KPiAgIAkjIC1tY21vZGVsPW1l
ZGl1bSBicmVha3MgbW9kdWxlcyBiZWNhdXNlIGl0IHVzZXMgMzJiaXQgb2Zmc2V0cyBmcm9tDQo+
ICAgCSMgdGhlIFRPQyBwb2ludGVyIHRvIGNyZWF0ZSBwb2ludGVycyB3aGVyZSBwb3NzaWJsZS4g
UG9pbnRlcnMgaW50byB0aGUNCj4gICAJIyBwZXJjcHUgZGF0YSBhcmVhIGFyZSBjcmVhdGVkIGJ5
IHRoaXMgbWV0aG9kLg0KPiBAQCAtMTI0LDkgKzEyMyw2IEBAIGlmZXEgKCQoY2FsbCBjYy1vcHRp
b24teW4sLW1jbW9kZWw9bWVkaXVtKSx5KQ0KPiAgIAkjIGtlcm5lbCBwZXJjcHUgZGF0YSBzcGFj
ZSAoc3RhcnRpbmcgd2l0aCAweGMuLi4pLiBXZSBuZWVkIGEgZnVsbA0KPiAgIAkjIDY0Yml0IHJl
bG9jYXRpb24gZm9yIHRoaXMgdG8gd29yaywgaGVuY2UgLW1jbW9kZWw9bGFyZ2UuDQo+ICAgCUtC
VUlMRF9DRkxBR1NfTU9EVUxFICs9IC1tY21vZGVsPWxhcmdlDQo+IC1lbHNlDQo+IC0JZXhwb3J0
IE5PX01JTklNQUxfVE9DIDo9IC1tbm8tbWluaW1hbC10b2MNCj4gLWVuZGlmDQo+ICAgZW5kaWYN
Cj4gICBlbmRpZg0KPiAgIA0KPiBAQCAtMTM5LDcgKzEzNSw3IEBAIENGTEFHUy0kKENPTkZJR19Q
UEM2NCkJKz0gJChjYWxsIGNjLW9wdGlvbiwtbWFiaT1lbGZ2MSkNCj4gICBDRkxBR1MtJChDT05G
SUdfUFBDNjQpCSs9ICQoY2FsbCBjYy1vcHRpb24sLW1jYWxsLWFpeGRlc2MpDQo+ICAgZW5kaWYN
Cj4gICBlbmRpZg0KPiAtQ0ZMQUdTLSQoQ09ORklHX1BQQzY0KQkrPSAkKGNhbGwgY2Mtb3B0aW9u
LC1tY21vZGVsPW1lZGl1bSwkKGNhbGwgY2Mtb3B0aW9uLC1tbWluaW1hbC10b2MpKQ0KPiArQ0ZM
QUdTLSQoQ09ORklHX1BQQzY0KQkrPSAkKGNhbGwgY2Mtb3B0aW9uLC1tY21vZGVsPW1lZGl1bSkN
Cg0KU2hvdWxkIHdlIHN0aWxsIHVzZSAkKGNhbGwgY2Mtb3B0aW9uICBoZXJlID8NCkFzIHdlIG9u
bHkgZGVhbCB3aXRoIG1lZGl1bSBtb2RlbCBub3csIHNob3VsZG4ndCB3ZSBtYWtlIGl0IHN1Y2gg
dGhhdCBpdCANCmZhaWxzIGluIGNhc2UgdGhlIGNvbXBpbGVyIGRvZXNuJ3Qgc3VwcG9ydCAtbWNt
b2RlbD1tZWRpdW0gPw0KDQo+ICAgQ0ZMQUdTLSQoQ09ORklHX1BQQzY0KQkrPSAkKGNhbGwgY2Mt
b3B0aW9uLC1tbm8tcG9pbnRlcnMtdG8tbmVzdGVkLWZ1bmN0aW9ucykNCj4gICBDRkxBR1MtJChD
T05GSUdfUFBDNjQpCSs9ICQoY2FsbCBjYy1vcHRpb24sLW1sb25nLWRvdWJsZS0xMjgpDQo+ICAg
DQo=
