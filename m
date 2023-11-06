Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6697E1BB6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 09:12:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NGFqmDLu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP3xg1fD7z3cYw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 19:12:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=NGFqmDLu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::630; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP3wl3wPMz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 19:12:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obzm7o5Giq08KCFzGof9Oa5hMyiyTo9AVtmcqjgb7H9J4pEj0alrxGKyQ449AinTPpWqV+Fu8vc5os3CNxStlxfX93UHuWn5fv7TfoyWDA/Tm6a9VzH40dQSLKs80hAzy1p2A84eooxduU7M55HZJZCVr6hb2r+y2iUED70prGOM2yVEOQYBJJ9Md2+H4/p29u0eeRnRMQWk3sU8yf8EfKBqizvERWVdkyzD9HZHKkAoLEizFt0gDjrS1lnkGnAbou7oInZtO/egSVUmUHCk33OyfTZArNYY4DgkeEgQtG9jHZIsAljDAjMXZD6HwOiPzryr2pc+vtQV0iX6407/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0k3UIMx3QqXaKhUizNrWyHSCAXLScZ0bbG0ktCNscM4=;
 b=hcYN2FkOSjfFOWRcSio8657rUcL1eX1PFANuzSiqQvQGVcPA27es2o/3M+9zKHtMB/F1NejqIWc7gZL1/+dow91djVo5ogwoA+JmfnwJUCpmAku55IQYOIPE+30g37so+1g3zP1alnChYrPbNIkCNTMXCOZmkbWBrkL3i8Ow2GBGooA9pj8c27U05FJ5n8XztiU9lWYTQf3zCtgv/6/kDbyD8Ub4vppGIUzZZDj0UyX0v7m9u9V217nGtUW35eKDmRWCPLM9K6KgQRiDECrV5RaYRXQ/KF1rYkqP+sjSjpeDAPJbMBF+ZOwivum0b9qd/dn92BvmfN9zLqyYJiNKBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0k3UIMx3QqXaKhUizNrWyHSCAXLScZ0bbG0ktCNscM4=;
 b=NGFqmDLuCHFUyEeSkY/QtWbyN2BVNWe2zEC1AUHxTfhI2se/IHiaRbhgUG8cMYrz7Umadl8r0iB7moh1osjABpVakzkcV1IAhA4GeMn2TTHaaZLnWxGaDhO595bmtgGAboLkyQwdkck6qgfTVDseyCWK6MQrupHyorRz4PhfvQCD3N0PjajZ8TqrBRk4rKADy4I+9q9BE0/p1NhiGDGgXlhHbkqniaPcq4Ja7YAU1lCqLCodRF8O+TF9Wdo2/NOAqVdWonEsVlD7ohbSsp0TXGURkJEG4UKzrpOC8gRLtEC9WUt/tfQ9JPuCvJwVCEA1lL7VusT4n2LP7WS8h447Gw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1600.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16; Mon, 6 Nov
 2023 08:11:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.6977.016; Mon, 6 Nov 2023
 08:11:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"lee@kernel.org" <lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>
Subject: Re: [PATCH 0/8] devm_led_classdev_register() usage problem
Thread-Topic: [PATCH 0/8] devm_led_classdev_register() usage problem
Thread-Index: AQHaB0RD7uNdhWMTjkWH+hM4SKvM1LBtAzAA
Date: Mon, 6 Nov 2023 08:11:36 +0000
Message-ID: <a2ebca38-7fa8-6aa8-6195-70d8df1b9f45@csgroup.eu>
References: <20231025130737.2015468-1-gnstark@salutedevices.com>
In-Reply-To: <20231025130737.2015468-1-gnstark@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1600:EE_
x-ms-office365-filtering-correlation-id: 3ba052b9-ab4d-4775-b621-08dbde9fff6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CXM2My2e7qaRwxFHZoc/5IruUhl+gxRwbP9xZglUICTskp4Y2lZmhrPnfXKNPeh1Ibn0oSYSzI65taE1+FuKJCWZmywsHjj2apXe4VBUmAz04Ai46LABAT0xzM+ZDdsBt8QmDgx/Xu53swtB2EhedB0tBe7d/+ITiIhsu+zovTiaBpmHfUzuFTnqOKZSc7gBbyFJ5ECdRx9bmlXkt57YrqoMuPceqMDM9Qwj4NgqWiI5BxehKCc8YLVNCrW3tNw4sTmNO3VkPnw7ahH729OTlhrCk/li++QxMVQlP0XukNtoL1Va7QQJROCwlolpKoCkyMKjGEx9vl9AAvyZBc+q2+jLnpDCbOlXUEGkLsyXzHCzu5Gr+L8JfRbgAm6JKUSaQZ21/Rmn8/WrEZxZo2wt4t4w/il53gSQRf58m1KF6embXCe8zDFqGFWzKmBh76SedtkYNdRW8lKMEH8JlMeUf/0OHXv0jBzvBZyjEVEnA3nF0SZYJA0vq+daei47B6oIP7k8RDjmpRqewjDn6vqfl0TT12VPs5kX9uuIbscfkA78ZrOGhQKj4Cc3fg8lSCMyTPfeRu8KjyPPZv2xYm+JZIBveuD4W8laP8QT/J0EsbyCfMlC2ZgB9085l5OPIvgCFqC585PXCcgbU8rSQaKtX+gxuDH8Dk4XvhUuKFT2Qa3ZMwBuIZHjNFu3CcyeDfqedhADMH1Dm0IaNsW8AQ1G/ShR+Qhu+of8I9/yixiWCLE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(39850400004)(376002)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(1800799009)(186009)(31686004)(2616005)(6512007)(6506007)(71200400001)(478600001)(6486002)(38100700002)(36756003)(86362001)(122000001)(31696002)(66446008)(41300700001)(5660300002)(64756008)(66556008)(66476007)(7416002)(66946007)(44832011)(66574015)(83380400001)(76116006)(2906002)(26005)(91956017)(110136005)(316002)(8676002)(54906003)(38070700009)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MHdzVzArVGhhcnZ4eHJpVVZ4b2N2bEFkcjlLYjVLOFVvanQvVHdnY0JTSUdG?=
 =?utf-8?B?Q2JyaE1kWE5ZSG1hdXVSQUpxQzJrUVh6YStvMkhROHphV082c1M3OHRseWdR?=
 =?utf-8?B?TVoyTjFJMnRhb1I1MWxQMmRlUmlKSHZkYWx6dUJjRUhUUGZJZVViRGRpL2Rw?=
 =?utf-8?B?Q25YQUNBUjN5ZlR3eE90aUVqdTIxbGErc25yQ1h3V2M1OHhBY3pGOXNYN2tP?=
 =?utf-8?B?ZDJmL0p0ZXNGV013bk0wMVZYRkYxL2EyR3Yxbm1oUFI0dlUrU3JFU2lBRkZt?=
 =?utf-8?B?RWxKYWtacWtES0xJTk5kOW9oM210SGwxa2pYekhBc2VOZ1ZMY1ZrQ042ZGgw?=
 =?utf-8?B?UzNaTVQwbXhNZ2ZBeWJUd0d2Wm4wMTlLNmN3RWFpa0Y1VDNSV29hRFgwWFBQ?=
 =?utf-8?B?cnQ1b3VGRXg4ZmN3a1ZVN08wOGhrQmFDMlE0U1pKb0lFOEFIZGdMb3NqUTJP?=
 =?utf-8?B?ZG9idjBuNE0zZ1RaVDJOWTRHNzJqK3c2bm4xdlBCanJKUWZweEJ3V3F2YkVI?=
 =?utf-8?B?VjhUaXZCeUZtUExaNzFqTUZ6cFdNL0YvR2VSampyTFArMUZvWTlqenVrdmFV?=
 =?utf-8?B?MXpvMEttRlA1SFkxaHFJWG9LKy8rUGxJZzR5dU1Xd0dUY0NLU0crT0R6b2N0?=
 =?utf-8?B?NE1JdERJSUt6VXJmZE13K21IVlE0bWtkQXRmWjdUUWl3ZFVYQTJkSGIvTTd2?=
 =?utf-8?B?OE1EVzRKb1JpVFA1a3hleUdQdFlTa0NQNlRDbEVYRGJmOUx6RGY5TDhMUUlj?=
 =?utf-8?B?NVJDVmR5TVptSGV5a28rdlE3bHMvU09FbnltY0lLV2NoaU5YK0xaMzFqenRH?=
 =?utf-8?B?T0F6RWUyYlJ5NUh5NGtpUjMyZFpTNEE4Z0RoWTEyQ1ZrV1BjN3BYN2YxSDBC?=
 =?utf-8?B?TW1veElUSHhHV0FZL0J0bHBRVWh4Wi8vclYxa2I5UVRGM2lNZmlvVnJZbnYx?=
 =?utf-8?B?QmRsUGkvc0I4Sk9yTlhLQThjV3Y3SjJsVDg4bjB1R0QzUGV0QnV0OWlQV2xS?=
 =?utf-8?B?WXZhTCtzN1Nqa2dFSFZ5SmJEL0JFR2kzVjA1cFRqcTZCVzNmdXZrK0U2Q01k?=
 =?utf-8?B?ZkJJV1IvVThrZk1icnYvSWZQbk1VSDVORnhNWjdrdWMrNFVJbmprOUJZMjRi?=
 =?utf-8?B?R3V1NkU2K1ZISDIvakdHY0xxbndhTCt5czlPUndudURVeExId09jZ2xpZXo2?=
 =?utf-8?B?TGVneFhiZUFVdnRBSmxwRkJiY04wS1lwVDI4UEVlWGhSakt4THVRYlEvdG5x?=
 =?utf-8?B?YzB1N0JROUlEbWNLNlJ0endTQ3Nob2xnOHE4TU9XemtrNnRpYndocjJFS1oy?=
 =?utf-8?B?V01YbW5JYTRadXlsRkdlYytuWmc4NEpnaUFsenVLdEkvQzFHVGxsMUYva1ZP?=
 =?utf-8?B?TXBJUUczME1CQ2lGVWw4N3lqTFlyd3pOdFk3VVVQaEpVVGRJdWlXYWtpR2F4?=
 =?utf-8?B?Qi9LbUhrbkFJODdyOFZ6eHhPMUlqVFc0d3I4MmNPS0Q3c0E1dDRRam45ZytO?=
 =?utf-8?B?dEdHU05oRlloK3FJTlBJemh0Wk5DVUtDdnFZVHlzdnl3MVoyc0I4NkFFV1Bt?=
 =?utf-8?B?RnNDdGhZQng5Y3hJb0N1VEtQYTBTOFMxVDN2TWlsak1sNnZEdTczR3A4Wm1B?=
 =?utf-8?B?cmIybkUvZU00cmJvY1FPeVg2VEVUbklpcTN5WURZWEI2Q0hrV0NlWWRlM2NB?=
 =?utf-8?B?VCt2TG94R0Z1VUZHYXBrandPMkorVTRmZ1Vxak9jdk5rS0FJci9ENTg5MFQ1?=
 =?utf-8?B?YmN2Vkc0aWdGUkFvcFYyMGxlZjBXekpiYTY0dElSZFpQVUtaSFpsY3pDMk1W?=
 =?utf-8?B?YkMyQU9jR0VvUWg5RlRXUHRyc1RYdW9NT1dyT3hLbmpxWUZSTE5SQjVWdUQx?=
 =?utf-8?B?aUl4WVpJSjlzRTA3bXIyZHdqNUdjdC9pbXZHV2dWbDQzeTNObmRFWG1OaTFZ?=
 =?utf-8?B?cGhRTGJiMndvRFF1V3JVYjNUYlVzNHdnYnVNdVd1OERsUytyR2R2M2JhRVJh?=
 =?utf-8?B?VDlzQm0vUnlHODNObGJhK3l3OU5GZ3BDNE42Qjg5Q29lUjN3MnhtTHBKaW1W?=
 =?utf-8?B?OXdNT0QzU05ySVBHRjg1TXV3Ui8zSTdFaVhRWStzZVJpZkdZY2IyOFlHN3ZI?=
 =?utf-8?Q?gq1TDGrj5r3RYgiatWV0r2CsE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E333ED464ADEC4CB9D1D8AF5C8AB8E2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba052b9-ab4d-4775-b621-08dbde9fff6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 08:11:36.9409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G/47xGrwP9KZ5z/aH+4U0fA/wXnMs4f1Z72Drnexmy/CPND6x8l9Q093OPKD6KN77NbHHTwH2RhDtBQXhOs9dvLcIzbqNoxujbitArZ/4gQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1600
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
Cc: "kernel@sberdevices.ru" <kernel@sberdevices.ru>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzEwLzIwMjMgw6AgMTU6MDcsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBM
b3RzIG9mIGRyaXZlcnMgdXNlIGRldm1fbGVkX2NsYXNzZGV2X3JlZ2lzdGVyKCkgdG8gcmVnaXN0
ZXIgdGhlaXIgbGVkIG9iamVjdHMNCj4gYW5kIGxldCB0aGUga2VybmVsIGZyZWUgdGhvc2UgbGVk
cyBhdCB0aGUgZHJpdmVyJ3MgcmVtb3ZlIHN0YWdlLg0KPiBJdCBjYW4gbGVhZCB0byBhIHByb2Js
ZW0gZHVlIHRvIGxlZF9jbGFzc2Rldl91bnJlZ2lzdGVyKCkNCj4gaW1wbGVtZW50YXRpb24gY2Fs
bHMgbGVkX3NldF9icmlnaHRuZXNzKCkgdG8gdHVybiBvZmYgdGhlIGxlZC4NCj4gbGVkX3NldF9i
cmlnaHRuZXNzKCkgbWF5IGNhbGwgb25lIG9mIHRoZSBtb2R1bGUncyBicmlnaHRuZXNzX3NldCBj
YWxsYmFja3MuDQo+IElmIHRoYXQgY2FsbGJhY2sgdXNlcyBtb2R1bGUncyByZXNvdXJjZXMgYWxs
b2NhdGVkIHdpdGhvdXQgdXNpbmcgZGV2bSBmdW5jcygpDQo+IHRoZW4gdGhvc2UgcmVzb3VyY2Vz
IHdpbGwgYmUgYWxyZWFkeSBmcmVlZCBhdCBtb2R1bGUncyByZW1vdmUoKSBjYWxsYmFjayBhbmQN
Cj4gd2UgbWF5IGhhdmUgdXNlLWFmdGVyLWZyZWUgc2l0dWF0aW9uLg0KPiANCj4gSGVyZSBpcyBh
biBleGFtcGxlOg0KPiANCj4gbW9kdWxlX3Byb2JlKCkNCj4gew0KPiAgICAgIGRldm1fbGVkX2Ns
YXNzZGV2X3JlZ2lzdGVyKG1vZHVsZV9icmlnaHRuZXNzX3NldF9jYik7DQo+ICAgICAgbXV0ZXhf
aW5pdCgmbXV0ZXgpOw0KPiB9DQo+IA0KPiBtb2R1bGVfYnJpZ2h0bmVzc19zZXRfY2IoKQ0KPiB7
DQo+ICAgICAgbXV0ZXhfbG9jaygmbXV0ZXgpOw0KPiAgICAgIGRvX3NldF9icmlnaHRuZXNzKCk7
DQo+ICAgICAgbXV0ZXhfdW5sb2NrKCZtdXRleCk7DQo+IH0NCj4gDQo+IG1vZHVsZV9yZW1vdmUo
KQ0KPiB7DQo+ICAgICAgbXV0ZXhfZGVzdHJveSgmbXV0ZXgpOw0KPiB9DQo+IA0KPiBhdCBybW1v
ZDoNCj4gbW9kdWxlX3JlbW92ZSgpDQo+ICAgICAgLT5tdXRleF9kZXN0cm95KCZtdXRleCk7DQo+
IGRldnJlc19yZWxlYXNlX2FsbCgpDQo+ICAgICAgLT5sZWRfY2xhc3NkZXZfdW5yZWdpc3Rlcigp
Ow0KPiAgICAgICAgICAtPmxlZF9zZXRfYnJpZ2h0bmVzcygpOw0KPiAgICAgICAgICAgICAgLT5t
b2R1bGVfYnJpZ2h0bmVzc19zZXRfY2IoKTsNCj4gICAgICAgICAgICAgICAgICAgLT5tdXRleF9s
b2NrKCZtdXRleCk7ICAvKiB1c2UtYWZ0ZXItZnJlZSAqLw0KPiANCj4gSSB0aGluayBpdCdzIGFu
IGFyY2hpdGVjdHVyYWwgaXNzdWUgYW5kIHNob3VsZCBiZSBkaXNjdXNzZWQgdGhvcm91Z2hseS4N
Cj4gU29tZSB0aG91Z2h0cyBhYm91dCBmaXhpbmcgaXQgYXMgYSBzdGFydDoNCj4gMSkgZHJpdmVy
cyBjYW4gdXNlIGRldm1fbGVkX2NsYXNzZGV2X3VucmVnaXN0ZXIoKSB0byBleHBsaWNpdGx5IGZy
ZWUgbGVkcyBiZWZvcmUNCj4gZGVwZW5kZW5kIHJlc291cmNlcyBhcmUgZnJlZWQuIGRldm1fbGVk
X2NsYXNzZGV2X3JlZ2lzdGVyKCkgcmVtYWlucyBiZWluZyB1c2VmdWwNCj4gdG8gc2ltcGxpZnkg
cHJvYmUgaW1wbGVtZW50YXRpb24uDQo+IEFzIGEgcHJvb2Ygb2YgY29uY2VwdCBJIGV4YW1pbmVk
IGFsbCBkcml2ZXJzIGZyb20gZHJpdmVycy9sZWRzIGFuZCBwcmVwYXJlZA0KPiBwYXRjaGVzIHdo
ZXJlIGl0J3MgbmVlZGVkLiBTb21ldGltZXMgaXQgd2FzIG5vdCBhcyBjbGVhbiBhcyBqdXN0IGNh
bGxpbmcNCj4gZGV2bV9sZWRfY2xhc3NkZXZfdW5yZWdpc3RlcigpIGJlY2F1c2Ugc2V2ZXJhbCBk
cml2ZXJzIGRvIG5vdCB0cmFjaw0KPiB0aGVpciBsZWRzIG9iamVjdCBhdCBhbGwgLSB0aGV5IGNh
biBjYWxsIGRldm1fbGVkX2NsYXNzZGV2X3JlZ2lzdGVyKCkgYW5kIGRyb3AgdGhlDQo+IHJldHVy
bmVkIHBvaW50ZXIuIEluIHRoYXQgY2FzZSBJIHVzZWQgZGV2cmVzIGdyb3VwIEFQSS4NCg0KSSBz
ZWUgbm8gcG9pbnQgaW4gdXNpbmcgYSBkZXZpY2UgbWFuYWdlZCBmdW5jdGlvbiBpZiB5b3UgaGF2
ZSB0byBjYWxsIA0KdGhlIHVucmVnaXN0ZXIgZnVuY3Rpb24uIEFsbCB0aGUgcHVycG9zZSBvZiBk
ZXZpY2UgbWFuYWdlZCBmdW5jdGlvbnMgaXMgDQp0byBhdm9pZCBoYXZpbmcgdG8gY2FsbCBhbiB1
bnJlZ2lzdGVyIGZ1bmN0aW9uIGF0IHRoZSBlbmQuDQoNCj4gDQo+IERyaXZlcnMgb3V0c2lkZSBk
cml2ZXJzL2xlZHMgc2hvdWxkIGJlIGNoZWNrZWQgdG9vIGFmdGVyIGRpc2N1c3Npb24uDQo+IA0K
PiAyKSByZW1vdmUgbGVkX3NldF9icmlnaHRuZXNzIGZyb20gbGVkX2NsYXNzZGV2X3VucmVnaXN0
ZXIoKSBhbmQgZm9yY2UgdGhlIGRyaXZlcnMNCj4gdG8gdHVybiBsZWRzIG9mZiBhdCBzaHV0ZG93
bi4gTWF5IGJlIGFkZCBjaGVjayB0aGF0IGxlZCdzIGJyaWdodG5lc3MgaXMgMA0KPiBhdCBsZWRf
Y2xhc3NkZXZfdW5yZWdpc3RlcigpIGFuZCBwdXQgYSB3YXJuaW5nIHRvIGRtZXNnIGlmIGl0J3Mg
bm90Lg0KPiBBY3R1YWxseSBpbiBtYW55IGNhc2VzIGl0IGRvZXNuJ3QgcmVhbGx5IG5lZWQgdG8g
dHVybiBvZmYgdGhlIGxlZHMgbWFudWFsbHkgb25lLWJ5LW9uZQ0KPiBpZiBkcml2ZXIgc2h1dGRv
d25zIHdob2xlIGxlZCBjb250cm9sbGVyLiBGb3IgdGhlIGxhc3QgY2FzZSB0byBkaXNhYmxlIHRo
ZSB3YXJuaW5nDQo+IG5ldyBmbGFnIGNhbiBiZSBicm91Z2h0IGluIGUuZyBMRURfQVVUT19PRkZf
QVRfU0hVVERPV04gKHNpbWlsYXIgdG8gTEVEX1JFVEFJTl9BVF9TSFVURE9XTikuDQo+IA0KPiBH
ZW9yZ2UgU3RhcmsgKDgpOg0KPiAgICBsZWRzOiBwb3dlcm52OiBleHBsaWNpdGx5IHVucmVnaXN0
ZXIgTEVEcyBhdCBtb2R1bGUncyBzaHV0ZG93bg0KPiAgICBsZWRzOiBuaWM3OGJ4OiBleHBsaWNp
dGx5IHVucmVnaXN0ZXIgTEVEcyBhdCBtb2R1bGUncyBzaHV0ZG93bg0KPiAgICBsZWRzOiBhbjMw
MjU5YTogZXhwbGljaXRseSB1bnJlZ2lzdGVyIExFRHMgYXQgbW9kdWxlJ3Mgc2h1dGRvd24NCj4g
ICAgbGVkczogbWx4cmVnOiBleHBsaWNpdGx5IHVucmVnaXN0ZXIgTEVEcyBhdCBtb2R1bGUncyBz
aHV0ZG93bg0KPiAgICBsZWRzOiBhdzIwMHh4OiBleHBsaWNpdGx5IHVucmVnaXN0ZXIgTEVEcyBh
dCBtb2R1bGUncyBzaHV0ZG93bg0KPiAgICBsZWRzOiBhdzIwMTM6IGV4cGxpY2l0bHkgdW5yZWdp
c3RlciBMRURzIGF0IG1vZHVsZSdzIHNodXRkb3duDQo+ICAgIGxlZHM6IGxwMzk1MjogZXhwbGlj
aXRseSB1bnJlZ2lzdGVyIExFRHMgYXQgbW9kdWxlJ3Mgc2h1dGRvd24NCj4gICAgbGVkczogbG0z
NTMyOiBleHBsaWNpdGx5IHVucmVnaXN0ZXIgTEVEcyBhdCBtb2R1bGUncyBzaHV0ZG93bg0KPiAN
Cj4gICBkcml2ZXJzL2xlZHMvbGVkcy1hbjMwMjU5YS5jIHwgIDQgKysrKw0KPiAgIGRyaXZlcnMv
bGVkcy9sZWRzLWF3MjAweHguYyAgfCAgNCArKysrDQo+ICAgZHJpdmVycy9sZWRzL2xlZHMtYXcy
MDEzLmMgICB8ICA0ICsrKysNCj4gICBkcml2ZXJzL2xlZHMvbGVkcy1sbTM1MzIuYyAgIHwgIDYg
KysrKysrDQo+ICAgZHJpdmVycy9sZWRzL2xlZHMtbHAzOTUyLmMgICB8ICA1ICsrKysrDQo+ICAg
ZHJpdmVycy9sZWRzL2xlZHMtbWx4cmVnLmMgICB8IDEyICsrKysrKysrKysrLQ0KPiAgIGRyaXZl
cnMvbGVkcy9sZWRzLW5pYzc4YnguYyAgfCAgNCArKysrDQo+ICAgZHJpdmVycy9sZWRzL2xlZHMt
cG93ZXJudi5jICB8ICA3ICsrKysrKysNCj4gICA4IGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo=
