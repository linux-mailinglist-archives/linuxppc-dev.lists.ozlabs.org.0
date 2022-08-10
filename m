Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3358E8D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 10:33:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2jqg4GxFz3bmD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 18:32:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KJ+JzIh5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.45; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KJ+JzIh5;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90045.outbound.protection.outlook.com [40.107.9.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2jps2sh7z2xBF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 18:32:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WG5J8JOwS8f63avE6V5xmqhw8BYlIhMFH7Gb/S95z/LVuDLw0VRY+4IGoFETPj1CQHdqY0xFyzPYd/2wxFbFmxlA//kUI5Gpnz8aRJVpN4X5/lhCdChrtoTLIJhcNblgjL50pg3LFXrPmdX5mDaHDs3VpAOPIeeeljWOVKMBWKmTykzw2BJb4+NcWaQ9Ij/p+jXndpALvIrSk8iRmHrRgXs3YReYhetFIc2YspsRJ3q7J/smpMCEV1a+qLDVnxQJYjStpseCByP1OMQB0Qq4bdeweE50sRXYx86fGHWawbiJ1XEfPHc6BlhaSyKFs3VVl9nZBVp/2eLJAbVVF0eNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpti2XHImHLz2RAZjk/Mic55z8CbSYZWCpohy7Hwbcs=;
 b=XZ8T3UQw7YMJR8ot4NYWhWwApCjS2ZunOKaa2BDBGIv4cst4F06X8OhJAQ+bR2NN9fShbuyyGMuLj5MH0Zgiy+HnPPt7aI14UIy5J/n3UN/8LLkboLC2y8y3bBOMOtIpJOkJCWkb8GYJTHesIZrbwTdCHWbm20CbKgOPu/zKAqsLRuAVYCVC/su90+j8pmbNra4yqE9Qaa8gSAlYqpA6wk6I5k4Ndtddw12g+eQsI2JV3O3qQnCEjOBp6DKguQHIi3MDFUB6JdQTs3XrQ9ZPErvoqMt1CXLXCoMbN7nuTcTq+CWuKzFjq5cMGQ8WOeF8b1UVyBpNVEpceRVSdVNu3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpti2XHImHLz2RAZjk/Mic55z8CbSYZWCpohy7Hwbcs=;
 b=KJ+JzIh5rhM05xLD5uYegJ0NfZYNeka/vhVS2ElHTOMjv2t/tOvc5NBbb5CRWbC0eiF7PiAwVNPN/sM2BnLRSVmsksMDEu5skAAhrxWde3Z1zZbfp0y8u88k7L8M0XIDBQYZxvHMPe/9AG7etPVMPPk1cpnBh3799AEwzSmbGar/7zFbWFeOfb6c+ITXPio1CYS21ZeGzxCb9nEZy+L7jNQIeYzK+LPQ+DJTczsEeJqQqSVf2vRBC7f2Bcl5mROU6BKwiorZb+G1RaQJSRFT64glpac3mBIL57Ww4NDLdxuwUOqkK1YsvTD4l/45q7wozm3lKEkMeWeH/Ta1xP2OuQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB4014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:188::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 08:31:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.021; Wed, 10 Aug 2022
 08:31:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 02/16] powerpc: override __ALIGN() and __ALIGN_STR()
 macros
Thread-Topic: [PATCH 02/16] powerpc: override __ALIGN() and __ALIGN_STR()
 macros
Thread-Index: AQHYqxzwk4yeb3x530GBrIBDR86zva2n0QWA
Date: Wed, 10 Aug 2022 08:31:46 +0000
Message-ID: <0d2438e6-9aaa-a9c9-9613-b833771c9362@csgroup.eu>
References: <20220808114908.240813-1-sv@linux.ibm.com>
 <20220808114908.240813-3-sv@linux.ibm.com>
In-Reply-To: <20220808114908.240813-3-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efbca229-2ab6-4268-701c-08da7aaac326
x-ms-traffictypediagnostic: PAZP264MB4014:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  B3pKo9oVSkPdnjPTdRQHxqvnjWPQym4VTlj5enc7jpvg5qs2SSwNUbKqnprd6zjnQTzskSI9h9VzqF9NpUfSTTrUOd1+ArcT22e0I7mgtrqAdHssmCWBzTc5JFoDZx5e5hhd9G8QIcKHJE06cGmtpW1V4s8ayCpOJr9rG0B7kHke3sMYElB1q2t4j9pPFFQb464ScycsVcbA+zQDFWwt6V6bzdjDk2JANAIBk5s9aIRrfDJEWMuehutUyypABPHPlsw0CTxjc63RNcnRGAzLYAniEgGZAGSA1wVeFus2ltmBDZ/k7UTce3OAIYFuP/xvZvuJFipCokgqqe9k1vWnKkw5g41KNo+boBQNY4h4CehKj7J4XHGwkPyObFuZUIWjOZanYhO6WN6gvshFwLdZeR0ffAJDy2+16rBTWAVC/PUL6qw2kj488ywn1KLzMiIwX8y0oU//qaKcGgK/9lYSs0iLYopYjb94Og93E6/oZfNMJE4aKa/OTNVAMq2P89fgY/fsdmiOHwHsMgrpTMfEoujs1lNf3lU9aGS/VBLLlmUb6vA0xNrEQDuwrVGwmq62axXHx/uJOoO/dRP/M6tA1nGZEW4SOR/3VxuS703u7Pkak8Y4fPOgSlGKvdLuTrCC4slYZoKERKWbwXPcULKXIywYfwj3ejhCwgWY9jPpAj5J9Ke/D6OjniSzXmFdlx3V+yHaB6NwFiaAAr9rrNO0owhsdFPVexxSVZAC0peCtdfrbY6Ay+d+vZGNTtI+u1CHl//VZ7Kbs10p1xmvE+Mu/RlMKJ1aKuwOVZmZj++zQ/u7jwbfMdvgD/fuKxr30TonTPnz0QIpLVD8YHGI0CGBb4S3MJrlsTeAnk805wYSwc0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(396003)(136003)(376002)(39850400004)(2906002)(38070700005)(2616005)(6506007)(6512007)(478600001)(8936002)(26005)(6486002)(44832011)(41300700001)(4744005)(7416002)(122000001)(64756008)(86362001)(31696002)(186003)(38100700002)(83380400001)(5660300002)(66556008)(4326008)(66476007)(8676002)(66446008)(76116006)(110136005)(54906003)(91956017)(66946007)(71200400001)(31686004)(316002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SW43TDhpQVdWanp6OW03aGtSN0NBMDZRdlZyWUpWWTkvOFE2TFFzYWJVaVIz?=
 =?utf-8?B?Zk03b1E3VUNMeStYM3A2cVFoWkczb2JqVmNKNm1oSVdYMHNpK2NvVXJodWZ5?=
 =?utf-8?B?WWJsSjBVVHZHUUFHNVIvdmh1cklUMjdyaXZLZk80MXhrVGZxaUZRL29pM042?=
 =?utf-8?B?WVR3ZjNpVVdXbXF5bzJJYmNueTVwVFdBYjlKUlVHVVRWV3FuY1R0d1p3UFBv?=
 =?utf-8?B?RWkrbXpGajUzaC9jTEowcWgyUmhMNkxZcVRYOWg3eUd1OWtONzNDSzVjT1J3?=
 =?utf-8?B?SnVpR0xkbkZhVXR2THZLZU0zKzVFbDl3cytRc2Y4QlI2SVNmVnhuSzltVHM3?=
 =?utf-8?B?aXZ6T2ZrMlVwN2I3dGZLbzhVSGhyNXAvYndHaUd6NFVaY2c0R1Y2Z1pFNGU0?=
 =?utf-8?B?RGwzY3Z2NEtpb0Q4T05uYWFjQmFJZmpzWk85amFhdDJWdTVlS3JXL3ZpT0M5?=
 =?utf-8?B?UGYwaVFFSGx4c1cwcHc2cjJ0L0xDdUZBUUZSenFmNGZTUytvN3NaK3I2eVYv?=
 =?utf-8?B?d0Q0eVVzWStUajhvaWtJOFU3WXJNcThRQlo5bDdKREVXYjlxTk0rZUJmaTlY?=
 =?utf-8?B?aFFUSXVnaHM4MWpKWjJ2TWhCczJIYUF5QTFrNEMyUHhaWTluY01vZHVKclUy?=
 =?utf-8?B?U3loZDk4d0UrUG1JSTJ1QmFyTWluRTZzWm04NXhFcmtkajlnWm43c28xV3Qr?=
 =?utf-8?B?UUxyRm1IVmx1eHlDZzVpTTJFN3dRdXNncWc4bHJyK3QwUnFqRU1RWStwNlk0?=
 =?utf-8?B?K1IwWGpkdS85SkZ3VkppLy9QaUlOL1h5ZnpJR1dIbmFUeGg5NWNMdjJ1cFRQ?=
 =?utf-8?B?a3A2R3M0aHBzZUp2dG8xWkV0d20xSHF6SFNkZzEzZkZpVUNaQ0FqODBKazhj?=
 =?utf-8?B?cVcxZ3A3OG1ieENDRTBMM0xmOHNpcHMzQTBRazR4SEwwalYyTFlZQmhtcEIy?=
 =?utf-8?B?WGpXMzlsZlpkdWhtOUdsa2g2aHl4bkF2OVVwUnJnSmhBS3V3cGNsMmw1UFN3?=
 =?utf-8?B?bXNqbGhDcGFHdGVoS3JhcVgxM1NUbU5QK0VTbUhsVGhSRHJjdURXWml3aDdE?=
 =?utf-8?B?blZuK0tXMjUxNzUrL2w2RlZwRlZvTS9hRUFmM09FMCtrWG9nS21JMHArWGRw?=
 =?utf-8?B?UTBFWndmNHliTXJFNnFneEM1cUxoUUVLSTFkeThDZTFhTGxxcVM4UEhreDRG?=
 =?utf-8?B?aTFKODNuNDVnR2xrT3BQMHRBeVYwYzRNbHI1QlBCS2tMUEduaWpucDRkcllI?=
 =?utf-8?B?T3JqajlFT2t1MFR3Mjl5Q0Z0ejh2b2F2UE1NR01lb0VULytKQ1BYMmY1dWxm?=
 =?utf-8?B?K2l6d1k2SXlZWmhvYk9tWW9ZSUpkaG9Wb0szUjNpbmhya0lCUno5QW9CQUJI?=
 =?utf-8?B?Tnh4U0tpTHpCM25zZnFXK2VUNkxXem5lVEFhQ3BHL3FuaGlWcWZXODBuaWNm?=
 =?utf-8?B?WHdMZUQzb2tqaEVTdWR4c0Y4MUxhTFpKemVPSmlxMHY2TFdmLzArRW5ZUCtv?=
 =?utf-8?B?Z0hKQXlKOVFzRVhIRktPKy93Z3hIc0x2TVRhV2Zpbm5wWGpLSDNWU2hrb0dm?=
 =?utf-8?B?ekU4YUl1dWZpN0xWK0g4N0NIVVFjN09zYnlkS2VyRDZTb20rMlA2OGs0N0Yw?=
 =?utf-8?B?UnQzR0U0SS9uTnFydXgwd0lyOWJVQWpWRDVtYkd2a0YrU3VNMHVKU0l3T0xy?=
 =?utf-8?B?MGI3YVBBSnlsM00va3VHTElkczhXdnE4Uk8zd0NlRXFNME5hL2dSYUIyTlBE?=
 =?utf-8?B?WHlsRnBhY0d5TTBqUENJNnVTR2QxdTV5dGNFRlZqOVBYcW94enlNK1hZY3A4?=
 =?utf-8?B?YTViVFBEZzNKMzZaSnBxU1NPVWQ2UGN2Rk5FREtHOXFkdGdrcTBtS2tWanJR?=
 =?utf-8?B?bWJjMEF1N1d2ckhWZUFyMHdWUFduUHdoZlJMVTJiaENSSU4vTlFZUkFRZkQ0?=
 =?utf-8?B?Y21MZHBLTlR5S3NLS1dMWkFuRmtNanF2NzJ5eWhDTnAxeVRyOWlpK1NCdUl2?=
 =?utf-8?B?Wm9vOUVuOEFoU2xoM2dFazJyTmthdDg5MXBUcUk3T0ZhZnN5YU1UWjZWWk12?=
 =?utf-8?B?eElzMFV2Q1dIKzk0NDJMRVhBQXpvYTk5ak13QnZDYU1sZ2pYWm4zTHRzME8r?=
 =?utf-8?B?OCtVNkM1OXJ5Y0lMek9XSDJHR2lrQzMvaTkySElSbkE3RG5McmZkWEk2WGRq?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DBDA80BDCB21041BE55C1EBCAD29077@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: efbca229-2ab6-4268-701c-08da7aaac326
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 08:31:46.2983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4JUZ3JITvx0t0ZPwnH4/Los2QOqK76IHxVgNkME7GlWeF/4x+jvwyK1axex+QPkK12bbs3+RdX6syktaMQ6snk9Bj8vCp2MVIxJC+AqkYqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB4014
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzA4LzIwMjIgw6AgMTM6NDgsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBTaW5jZSB3ZSBuZWVkIGFuIGFsaWdubWVudCBvZiA0IGJ5dGVzLCBvdmVycmlkZQ0KPiBf
X0FMSUdOKCkgYW5kIF9fQUxJR05fU1RSKCkgYWNjb3JkaW5nbHkuDQoNCldoeS9XaGVuIGRvIHdl
IG5vdyBuZWVkIGFuIGFsaWdubWVudCBvZiA0IGJ5dGVzID8gUGxlYXNlIGV4cGxhaW4gdGhlIA0K
cmVhc29uIGluIHRoZSBjb21taXQgbWVzc2FnZS4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2F0
aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vbGlua2FnZS5oIHwgNCArKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9saW5rYWdlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbGlua2FnZS5oDQo+IGluZGV4
IGI3MWI5NTgyZTc1NC4uOGRmODhmZTYxNDM4IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vbGlua2FnZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9s
aW5rYWdlLmgNCj4gQEAgLTIsOCArMiwxMiBAQA0KPiAgICNpZm5kZWYgX0FTTV9QT1dFUlBDX0xJ
TktBR0VfSA0KPiAgICNkZWZpbmUgX0FTTV9QT1dFUlBDX0xJTktBR0VfSA0KPiAgIA0KPiArI2lu
Y2x1ZGUgPGxpbnV4L3N0cmluZ2lmeS5oPg0KPiAgICNpbmNsdWRlIDxhc20vdHlwZXMuaD4NCj4g
ICANCj4gKyNkZWZpbmUgX19BTElHTgkJCS5hbGlnbiAyDQo+ICsjZGVmaW5lIF9fQUxJR05fU1RS
CQlfX3N0cmluZ2lmeShfX0FMSUdOKQ0KDQpXaHkgZG8geW91IG5lZWQgdG8gdXNlIF9fc3RyaW5n
aWZ5ID8NCg0KQVJNNjQgZG9lczoNCg0KI2RlZmluZSBfX0FMSUdOCQkuYWxpZ24gMg0KI2RlZmlu
ZSBfX0FMSUdOX1NUUgkiLmFsaWduIDIiDQoNCg0KDQoNCj4gKw0KPiAgICNpZmRlZiBDT05GSUdf
UFBDNjRfRUxGX0FCSV9WMQ0KPiAgICNkZWZpbmUgY29uZF9zeXNjYWxsKHgpIFwNCj4gICAJYXNt
ICgiXHQud2VhayAiICN4ICJcblx0LnNldCAiICN4ICIsIHN5c19uaV9zeXNjYWxsXG4iCQlc
