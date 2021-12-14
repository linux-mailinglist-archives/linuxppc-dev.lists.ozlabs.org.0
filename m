Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F2473D01
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 07:10:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCp094dzkz3cPp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 17:10:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60d;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCnzd4YyCz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 17:10:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRupdwl94fyjRKDFNZadb2JZKhN1K84HGC2X3jA8bVrBhzjmm8a9ktlNM8RppWG64yUCjNVK4J5ZPOTm8Zql2Hita7EZ+z04S42brb7DlpJ0Cb2xCiZ5TV1l4LoX4UR7WtG2FXbsfz08+m42Ha1EwfDC/YYz4/o1hydD6wZKvwyHdiysgX+x353DdtCXy7Ue+Gapql3K+Qc6QS1xvHPuEGEgKjydbN/vBqhQftJ15D57gU3RnIkbkCNcTbsMNkjoUXZ5tDcpgJtkoSE6clcQ3Ah1LbVECCE+131vjLxyWXjBpkSxoZh78nZQqixaDSPB61fyyCzw/b2CbRvCXJQ/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Js61Dq4bYtQSuX0iCX8NZ6AEapsKwphPvHWUEjg77Hs=;
 b=ODV2yX1nQ+ity5ls4Ct7cc5xa+bw/wASaAnpnUY13XES3AVV7bOPj7hnWNTnvW75RfLvsGMQ9mET2wM+TZR50zg5cojhXe1y7FpBH5PIGTSsqjMerDr9LiPxjp+dNUW1uVur1WKKB+wdEBlUNy9dA3P2c7rOgV3B3eDDW7uTPih/9zo2Vrjhvwro5+I5EfzrnhfPwWT/Qh3ojED8G2ILwbM+Y7YJZvdE5qazCLLQsebkZi0OLwdENz5L+0fwDccFLXK3SjXAD1Hc4Mt6bzDyh5RX9eizjNcHg3rEFlZw8fnccsSRXUJ7K0IS6cNOtZUpzjOcv4vZgyw4E8km+SxodQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2237.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 06:09:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 06:09:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1 0/5] Implement livepatch on PPC32
Thread-Topic: [PATCH v1 0/5] Implement livepatch on PPC32
Thread-Index: AQHXy/a61L5ufkyTwk+E9T1IN+85JqvoaYCAgEhc+YCAACuvAIAABD6AgAAAzACAAATPgIAAEbEAgAALEoCAAANtgIAArk+A
Date: Tue, 14 Dec 2021 06:09:55 +0000
Message-ID: <76ce2dd7-691e-df73-727c-110713c07cda@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
 <20211028093547.48c69dfe@gandalf.local.home>
 <6209682d-0caa-b779-8763-376a984d8ed8@csgroup.eu>
 <20211213121536.25e5488d@gandalf.local.home>
 <5511f43c-192a-622b-7c72-52e07f0032c2@csgroup.eu>
 <20211213123338.65eda5a0@gandalf.local.home>
 <fc3099b8-9f12-3e47-08a0-05abc37a0482@csgroup.eu>
 <20211213135410.12642d8f@gandalf.local.home>
 <8df90f94-9939-0178-b92b-6ae6ea81784c@csgroup.eu>
 <20211213144603.47d7c908@gandalf.local.home>
In-Reply-To: <20211213144603.47d7c908@gandalf.local.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac4de434-bb26-4302-a13b-08d9bec8597e
x-ms-traffictypediagnostic: MRZP264MB2237:EE_
x-microsoft-antispam-prvs: <MRZP264MB223744896BA2C93AA3CC7D9FED759@MRZP264MB2237.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qiOHU2dDRnYroG0xbZiHVBiapngnEZEHESRIYyUXot9U7tkBnAcBvTUUklfvR8LofsHsLFBPcIOj7ikTlknnVKmWTN0WZGyb5yeYYLyTC/qYDAhQncMO+hRReNpETomkhlqk0L3c1o3wDRRYQTH1rdfbp2qWaduhE6AMXfekREVsYTjnkh/Bs1vePhGY0mmmmGMqasF7uXGhZkq/dHH3P2r6Ssi3amFzS3kdOd6vB4tvM+TwJA1KiGvEqCL556xMjZ2cjTTQmQr+8ApB3gopZYlQ1fhNwOoyxIUApzq5fc1M+L/6/A/Oz1wZg5ixBRKEceYNtOJi04D4c9ruO4kHWGu2uV1K3WVKrmqAVp9iennDRXEMke7CfJpV8RwsGoRmGHa9tVm1Hs6jHsbzw9JseJtWJpM/l3xBP2QGQIi7i3H2dBgrlYjFWi1gknLXq5AWBAeGN64CRW5aHUfd1EqbsYKgg1nNWaQ9b3/cndhTkg9Noq5kfDHhThyOxzgWIG9xVOQh1hOWVsUHwzFA2PkrfdCiqWza5CsYYcu2rS6+vg4ZrXCUMDxGYvTuA1CazYtqXRu2b5jVUwoi08xNRiGDb4aFKMz4Ts5mjAcelAwvcPYYbFp6TrlY//zVBabhRFrTUwMaV4yUnYJrciFOrKoF9fzLLr/OXrI+o35xlQsgS6bPqQicfnt7etxwEDV+z3z2TO0ViN6kzOsX6ojZpCdT3czOu7FtAolq6zhjnb6J6FONFkCK4WpEBu5FkyJSGppdGCkUj7z4K8G4CPjv/5ecTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(86362001)(6512007)(31696002)(7416002)(4326008)(4744005)(26005)(5660300002)(316002)(44832011)(8936002)(38070700005)(76116006)(122000001)(66946007)(64756008)(66476007)(66556008)(66446008)(83380400001)(31686004)(54906003)(186003)(6916009)(71200400001)(36756003)(2616005)(8676002)(508600001)(6506007)(38100700002)(6486002)(66574015)(91956017)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2FOa1dSeHh3dGJUejFZeUZuLytVQlNVYUJGTm94d1JCN1crUEg3YlIvbmdX?=
 =?utf-8?B?OHVzNnB4TGJ1WmJkeDNNLyt0eG83Q3RqRUpoNFVYWjVvM3Flck1sRTRQa0kz?=
 =?utf-8?B?MUhVQWdIemorN25HM1loRXZQbUplTVA5VkxiTVdQbVJEN0ViMXY2RFd6a0Zx?=
 =?utf-8?B?TkY2QlN3QzRUM3hVTEhxRVIycGQ3L1ppcExmWGRacFlrK1lYSDI5MHJNcUlG?=
 =?utf-8?B?L3dkWFg0SVYxb2pVNjJ0MmlZQWhaR3VWdHRGSTcvdllFY09USUdiYlRNRE9l?=
 =?utf-8?B?dmFUcVpFT1dLaWRLb0J3UDBEcGJxaHpjSnE1MzZBcVZjaWdsV3Q3dWxPOWVj?=
 =?utf-8?B?a1U0ZUtINWhUa0RMTGxQdUVETnhSeVdRNUxGMzdrczFDaXUvd2hvUWJzcVBt?=
 =?utf-8?B?TXRkOU9HbGViaWV5a1pQMzliNUxFdFdZSHJRNVJRV1JPalVVUVFhb0JQWmZV?=
 =?utf-8?B?ZFdQcWV3U2x5QmcwdVB0Znh4VkRaaVd5UTdJS2lpenhqem40N1ZueUNZRnBP?=
 =?utf-8?B?WjdoeE03Z0hBTFRJcXVDSTlQektiZnpJMlUvVEtSYi8rYjV3aTBpS3ViQVZl?=
 =?utf-8?B?RFNrWVgxYzdrS1VtZGZqV3VFdkk1elBBckkvQlRTYmh0VHBDSEJodGVnVCty?=
 =?utf-8?B?bGNCRVptL0RhNmo1WTZHaUZVUnVMQXNVbm14YjZodEV3ZW42aHpvbHYrZjVu?=
 =?utf-8?B?SGl0RkU5WGp2U1E2TG9QRUF3dXZ5aDdqY3F2TFljWUs1OGVCTXJqdlI5bjBk?=
 =?utf-8?B?SlBZZmRQUUY3dFVINlhqZDMwdXB0SEhRTitkTEExMjFwU3hEUjVqcndkWWZ4?=
 =?utf-8?B?Kzl2WGsya3pRWmRDa3d2VzVSMTJkVXFzdm1LTnVqUk9ZRVJOMi82UExzYzBk?=
 =?utf-8?B?U1hycEtGWHh3cVNkVVRhb25MUWlScnp3SE44N2FXbXFQcWs4N084VkVVWXAr?=
 =?utf-8?B?MVBjOFRxbGQralROck1KeUp1a3hUMk4vNmNHeFgvVnljbTlGWTR1a3MrWEFj?=
 =?utf-8?B?WUQzMER0aEU3a1Q3VjhHenlZZy9aTHE5WWNUVGtEbVdmQ2NBMHdQeGpJcWJK?=
 =?utf-8?B?ejhwYUFjQ09KTmRSUDh4cFVoaVJ4SzRIR01KMDQ1ajBLZTg4ak5yU3E5eVlt?=
 =?utf-8?B?R1pCdjRJVi9MUXpiaVU5ZkRYdWJ5UFNXNURHbFkxWVpSRExsWk5IN2I0dXE1?=
 =?utf-8?B?aXg2TVdyamtUdzAyUjIzTmcvSC8zN1RRbGk1VXVRMVRwSUhiQUs1U05wUlZq?=
 =?utf-8?B?YWNSWW1mTkdxWWoybE5kT2ZEQkJUdXRVS0pWOUZaK2lTTlJtd2tjQ2laN21j?=
 =?utf-8?B?Z0NTODM4L2NuM0FMY1l2d2N4MlQwU29WL2V0TVZ5Y1ppS1Rqem5mTlVzZlBs?=
 =?utf-8?B?bXEraElLajFUNUlmMTkyZFNKT09OTVZ1ejdiakltZmhuRGNDZHNLSnpoTGRT?=
 =?utf-8?B?SG5qWGNOTWRqWGo5dHlqblVCUGI2MUtXWjMyNndlRFk2ekFIYzJYWS9TaGF3?=
 =?utf-8?B?TE9nRGQvQTBoUFIyYndFN2hsdkdEWmYwTXYyekpRU0pJYXJrN0VISWkrS3BJ?=
 =?utf-8?B?elBUMjVhRUxkWXJyVzJVc2NlVEwyRXp2dEN5d0ZkejA4MHFBNG1CK3dEUnJy?=
 =?utf-8?B?VjhDaGRBVldGTzIwSy8wYjdXdG5ET2dhd214cEdGcUl0OHZOQ015Vm9MVmg2?=
 =?utf-8?B?c1ZONGgxQzJmOERSZ0dZMiswNzdhMFVNQW1yZWU3QlV4c3hvUm5tWWlHYzBs?=
 =?utf-8?B?THhRQnQvUFlZQVlMck4wZkpGTFpNdFFvOHRXT2F1U0ExYVFJZEdaOU0wSk5W?=
 =?utf-8?B?UEw5bGlxbW5tQmxnNjBON1UweUk2cU1mZk8yRzRRQ2hsQ0RQay8wZFlFVHAv?=
 =?utf-8?B?T0ptVFcveXdoZ0Q4RFNDQ1lJSTZndjhqbllldEtxWDRhYnQwTkZjd0M5MDlZ?=
 =?utf-8?B?cUoxa2JFMldINGR4SWNxZlBveXFYZGF6TUlzdFh1cWVmTlBZQkxjVjNPN0dr?=
 =?utf-8?B?bUtsbXBicmdQV2s3UXlRa2o1aGR6RWUvV3RnejJMbStGUjBjaWlsZkhtSFda?=
 =?utf-8?B?aDRqVHBjYnJEZzdxaWtWVzVXYVg1TURWVkIzaWVuL1YxdTBLQlRwY0s2SXhI?=
 =?utf-8?B?K25Fc3IvbWY4WTJBTDRFUmVkWTJFc3hBK3MzSnhFdVQveXl3OWdESEVxUHl4?=
 =?utf-8?B?alhzYTgvRmUzUUo1am9TbWZ3RnhpT0xMRnNHN3ZteG84c3pocVJUeE14clUy?=
 =?utf-8?Q?2hvOGTxoD862x/sLZK2I2WbcqeLUJajaAvV6h0tygc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B11F45A2E510E4A8FE8ABD5A2016F66@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4de434-bb26-4302-a13b-08d9bec8597e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 06:09:55.3106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xJkQaIyW5rSEO2WpQF7vkZEas639udVJh0wqSjL6xRi9FgNIqEPNnyj76NtyaTI5H9qge3QYo9b58bXSLNeHy+vKNoxVHBartSQQ/6T65bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2237
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzEyLzIwMjEgw6AgMjA6NDYsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgMTMgRGVjIDIwMjEgMTk6MzM6NDcgKzAwMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+PiBTVGlsbCB0aGUgc2Ft
ZSBPb3BzLCBiZWxvdw0KPiANCj4gVW5mb3J0dW5hdGVseSwgSSBkb24ndCBoYXZlIGEgUFBDIG1h
Y2hpbmUgKDMyIG5vciA2NCBiaXQpIHRvIGhlbHAgZGVidWcNCj4gdGhpcy4NCj4gDQo+IA0KPj4g
SSB3aWxsIGxvb2sgbW9yZSBjbG9zZWx5IHRvbW9ycm93Lg0KPiANCj4gT0ssIHRoYW5rcy4NCj4g
DQoNClRoZSBPb3BzIHdhcyBkdWUgdG8gZnRyYWNlX2NhbGxlcigpIHNldHRpbmcgdGhlIHJlZ3Mg
YXJndW1lbnQgdG8gTlVMTC4NCg0KQWZ0ZXIgZml4aW5nIHRoYXQsIEknbSBiYWNrIGludG8gYSBz
aXR1YXRpb24gd2hlcmUgSSBnZXQgIlRlc3RpbmcgdHJhY2VyIA0KZnVuY3Rpb25fZ3JhcGg6IEZB
SUxFRCEiDQoNCldpbGwgY29udGludWUgaW52ZXN0aWdhdGluZy4NCg0KQ2hyaXN0b3BoZQ==
