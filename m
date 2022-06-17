Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB654F106
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 08:30:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPTfz2yNhz3c97
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 16:30:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=y61WfCdL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62c; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=y61WfCdL;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPTf852wnz3bmX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 16:29:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Di3llBxHG0T9aqE/jaqnJ7+giXc3wUSDK7fy4tG8UcH7HEN7A9Cgzw0nTY548TeuTbG/FQI8hmJ/FVdThELEL/FwAWo7X+gAh70TAM83NwVBi0dn9+sOdnn5CZc+j4OZbWtmM//EsvDxLZvTaIvlBmnTevgOVzhH/b+bjkeDRoL+FB7O/kl3K+aKquI1TSP3C1R7XmntP3SGdUf15mwv5pZfRspCmqBkateW/lXaKdoSdqtyXXZb3daUx40dPrkKdW+unGUKHdJmX5wERBK8XGvmX1nm6dfsK3++rYdJ0P6B/Blh/KY69szu1KFqTS7CQD/An2zEJD8knUz7pjDUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRLRjiXwfS/S3kUi12N4vrYmYv9SqDmlhC/F0qQqqD8=;
 b=OWsbbS91c0yd42UVTqU+UEG9KqcWnKQg3u7lOYe/UYZpq1JYOsDSyTpPjXRzqH+U+VVDVNAjBQHSTJGWMs9EoncDUBmHMW3kQDGFB0HAKNPJ7JIQ68Rc2Ki/MQl6mtIUlMdhH5xdasgVZFfYAF9n3EB/58PdO4s67vzUrGcvmCxePuefp5coJzwceZgKut1sli/VZyBm+uFmpknaPRDRn2V+wrIKsNucaMDaOD6kVBoIdy7R6Q5mB91mAjKQaO3BrK0WfST3LP4L0Rkc7oVO8tcZRBEPFl8ykhoI7Agt7XE5bb6rgKsPZkKvFhNuirXnDNxKFrLXZ+7lXvQvrpmO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRLRjiXwfS/S3kUi12N4vrYmYv9SqDmlhC/F0qQqqD8=;
 b=y61WfCdL8u1SUFw7XxF77J9/UtM4FdH49hI0uolYlPIIWRqsRMExYAiQaXCBBWIFDPytJhpqLRclPFuz3hFwGYt1CCik8f1fm+a1L1y0QR5edjxUWhGXJnEbtKPmpIfFUIvG3CR06LRr719pNfRJA+XYisn0Zpg7GgDeKaJZoZeLv2+V31T1GQfOXqmHwjY0hg0NyrVBbrhy79pb3yMIfSNJ16Mj7CZ+Z9a3OWDrwfmHIS9M0r+kyywW4N+a+GIco7ZF6JGs1cIfmcmb5mxhegL9iikOv5AdUVmlKlxg96Vry+GmdJW0eaafZxKJ30ahT3Gcoc9YxjjlAhPLQXhecw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2541.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.13; Fri, 17 Jun
 2022 06:28:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 06:28:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Liang He <windhl@126.com>, "oss@buserror.net" <oss@buserror.net>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "paulus@samba.org" <paulus@samba.org>
Subject: Re: [PATCH v4] powerpc:85xx: Add missing of_node_put() in sgy_cst1000
Thread-Topic: [PATCH v4] powerpc:85xx: Add missing of_node_put() in
 sgy_cst1000
Thread-Index: AQHYghDOP24Nvh9u1kCVcZ2VbzP84a1TIukA
Date: Fri, 17 Jun 2022 06:28:56 +0000
Message-ID: <eb72976a-9ca3-b894-b2d5-8283a4cf486d@csgroup.eu>
References: <20220617060827.4004795-1-windhl@126.com>
In-Reply-To: <20220617060827.4004795-1-windhl@126.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a55e22d4-7eff-4a34-7746-08da502aa82c
x-ms-traffictypediagnostic: PAZP264MB2541:EE_
x-microsoft-antispam-prvs:  <PAZP264MB2541803A8484AE95B67A27E4EDAF9@PAZP264MB2541.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  oM4SmWkKd/5K1JrlOv5SRAAvvGridQP7zITg7+I4VQGOPpRmguJGgPOirxH1Su19yJm2gtFhycWsN7H8OHB5rjDkRJ03NBshOeHPpzh/A2tp/3UHY/lx0JL2bBN0JWVmsdm+9k4KSMFqtXesvpoZFhD89EA/Frs7TmvT7Hk9G9GrE3FfKMhUI6C/TfIlFV9hfW8FqNz47CtQGSEyZXLy5nyb9anxxMQHgoHpQjyVmDda6axcxqAra3R89yQrlZNw1KxYZhjk1o2DHRFDZuDElnUB+vPIXEBIocL8/ZFmrMR3N9lfu9pSWbs0L1QRXwAJNqfQdCloxxoLQYdNe9zRwXyzOLUrb8bO3XTXtQrkEmRf2k4HCqOJt8vrxN4O0A+DEF3VmuLleDwoDGNhzZ6sxKa9EnH6e6d4du+o0AGmIrw+HPwrSrpJpFLJZj2J9Gs+e/h8XZKxf4N6z77GJflQiIMdPlYln6LdQprBtFXsKIuRKsIbRIH1x2YjuBdy9h8CJcRw+6d0kEaH9zvNC+O6Iv26R2lWVmRnXHKfzkxIK3oIq8+QeFpNtv33QwqN7cyfc70vK1SgTGB2cmj023X5BE8rOdTkYYv4BmAXkQ/c06Z83fri4wHX9qUxY+9EPvxzF+GuVQG62V/kgTFpuf7zQDwLnkIXNFPWkQtDpiyGkfXk++R3UwA3PDXSbDQuimTlak1+3yK1GUdk36lnNf2QW+kw41L0gIKxxovrdgAKzhbK6ud+WkpcaeCbkSnkeKllirFeY6Hw9tWzdU5RcYJmzQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(110136005)(8676002)(86362001)(31696002)(4326008)(71200400001)(38070700005)(508600001)(64756008)(66556008)(6486002)(5660300002)(66476007)(66446008)(66946007)(76116006)(54906003)(122000001)(66574015)(83380400001)(186003)(26005)(6512007)(38100700002)(316002)(2616005)(36756003)(44832011)(8936002)(2906002)(31686004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UklGM1grODJ1VEtDeWE0MWJ0UDBKN1NqS0piUUtCamtKeHczT1ZEZ09qd3dK?=
 =?utf-8?B?NGpWQklWckRtOHFRMEJoMjJ6YjZzb0VabEFnbmVHM0V5MHp3V2ZFbTRmZERx?=
 =?utf-8?B?WlZmUDhwRFUwS0dSb1hUdjhYU2ljek5saFdCSktVZGlCd25hN28rdUhqRTNx?=
 =?utf-8?B?NkRsYWRFUWZQWTZvNkVNVC90dCtyUVF4eTNvOTNaSG5UbkxLUWZSSzA4dzRv?=
 =?utf-8?B?QkpLZVZjOFYvcUsxTGFoTjYzcUdjRTI5Y1FYcUYvR0RwcjNEcTRsNTU0dFJp?=
 =?utf-8?B?VFAySmYvRDg0bGZEbHpaUkwvNEp4N3FRZk1NSEJMK0M3ZWhwNm5mVFkrUzdz?=
 =?utf-8?B?dHd0TjlUd1lVM2poU2Q2SHR1ZVp1OUtiMTA3c1VtTm90VTMyNXF5VE55UTIv?=
 =?utf-8?B?dnNGWnVlOCtIazlDVmJHaDR4Z0FKVHlKMjI5NndiUlZGeFBUZG5PMlQ1c2lz?=
 =?utf-8?B?WkV3UkYxM2FTOHZNUDd0ejNkS3puTFkxT2l0NzBqb0kreWNaNi9wRVl4STIr?=
 =?utf-8?B?ZGlNenVYa0pKS3Zqa0RLYitEUXc1K21ZVWlLQ1NPL3VYZnNDYmdCdHZ1ZHV3?=
 =?utf-8?B?VEZvSEgrQmlITHB6aWxybzBjaVlLZTBLeUVLZEduNHlYWUN0NlRmblRGbEFG?=
 =?utf-8?B?aG0zSDUzbk55SGtHV3B6eXNaL252U0lqMFg1SGJRK3EwNTZBbjBMUUhiVURi?=
 =?utf-8?B?eHA3RTRSb210K09pQ2hkWm9DSjdYcnJQbVRuZEljb3FyeWtFRFN1OGFORmI0?=
 =?utf-8?B?SHVlUjl0RXd2NERnRjlVOTVQYTJlQW1jdHA3TjdTQThIR1ZYV3FRN1A0bDNT?=
 =?utf-8?B?ZUhCUFpJNmNiVU5rdk0xOGZUWmh6WEdmS2g5YkdZZ1ZKNWtuNFc1djVJcGNq?=
 =?utf-8?B?bWovVVprN2xpRFAzbVFEczcyRTlmZ0twVk5HaHRMbzE4VkswL0F1cnJvRUpi?=
 =?utf-8?B?YXI4NGV3bGdWeE5ES1Zhc0drTEpPdS9WNmluVVJSWllaZm9DeGJGdTVqQXha?=
 =?utf-8?B?cnRYODRkTU9RTStoRTVTeFBBdFd4eFBNd211ekN1VEl2dzN6cUxLWGlZVVUx?=
 =?utf-8?B?U2VkM3k3UGp3YllYdE54U1lPSnRjWm9PV0kvOWhIUXZSQmZObll1eDdSMWtP?=
 =?utf-8?B?NGpKcDQvWk14REIzeXhoTE5MbDBHbjMzLzY1WjJHejBJWWxLY295dWlrN3Fu?=
 =?utf-8?B?cDB5RjB1QWQ2SmlJK3BHK1hONEduVW5LWWpBU2k3TDJ4aDRhemRIOTNPK29X?=
 =?utf-8?B?K0lYb0JKd1dnUStsTnp5Vm9VaDc2cjdyWEFLTkJyeFNRL1pwaWEvY1d5bkVS?=
 =?utf-8?B?ZVhpNmwxSllBTWRJQUF1d0xheEZSQjRRTXNNMHlQM0xDZ2Vkck9qb01RaXJh?=
 =?utf-8?B?eEFvbnVPQWpBanZ5S0tJeXhjRGxIOGkrbUZDaUlKZHhxeE9mL0Y1T1grV3RT?=
 =?utf-8?B?a1J0VHgrM2ZCQU5ZeWdCYThHcHUvaWozUW81YkRRWENDQnlCelV4bzQ4ZlBF?=
 =?utf-8?B?VzM3NkhveFROcXQ4bVgzK1RxNWtaV2hKRE9EL0p2cm9HdXZROWJSRkZHT2Ra?=
 =?utf-8?B?SWphZG1oTEZmOUwyNmR0Y3duNldUSlRmQ3E3MWpnSDlBdTdoYStNRzAyRmlh?=
 =?utf-8?B?UFNMNnpuOUl1dEI0UXZ3bGFSQTJjWCsrSnBya1RaNGEzRVFvTmFIVGNGY0tr?=
 =?utf-8?B?dWRsUkw0dEl1L2hGZktsdDZOYVlqSkQranU3b0k1dVg2WWJmQ1hidTNoamNk?=
 =?utf-8?B?UzNuRUYzQ2lEVUlaa1U1Z296S3VvR1ljNCthVERVTWFtRUtUVDRHY01UdjJR?=
 =?utf-8?B?ZlR4QlVINEJ0UHVDSndyUmpPNzhiRHZhTVpFNXFkby9LMVRrTVhGb2lTSlRY?=
 =?utf-8?B?MnR3eFV3QUEyR1RmRW9JL2J1b2hZb3NrYy9DTDBGdFFYa3VQRXQxalloVGlw?=
 =?utf-8?B?RC9Lc1hEL0RpRExZdGlBQmxtblludm85VVVTTDlqN3RLQXBhckIyR1ZVNWQ2?=
 =?utf-8?B?My9PU0hOekFBa3R1Z2doK3R1Z1lmRHlVZnh2ZW5VR01zUFZKcURBT05wY3Ru?=
 =?utf-8?B?a3JLTzNUSXdLYlFJdE9OUGhOY0l1SmprSEVqejJhVkhEVUtDbjE4NGlRdXRl?=
 =?utf-8?B?TVBNd3RoVUpsUnhoZFgvTEt4akZ0ekQ1dERZcTlCRHE5bW9DS291Sjh4Mktx?=
 =?utf-8?B?bnI5WVJDVFdiMTFZSHRyZzhxSGRaU3JzNXZGRHZzNlIzcFJISHZzV0I3NS9T?=
 =?utf-8?B?SHNJcEh1L0pybGZVSW5JWUpBa1RZVTRiQXdQOTFMVzI5cm80Um1xWnpPRFd6?=
 =?utf-8?B?Rm9FNllZeGd6RTVkYXNxMUFTUytQMG80b2RkN3A5YjBIaWptZUhWM00xcnlN?=
 =?utf-8?Q?jzLcK3fWOMAijbRzCNVbS2lPDbljOIdP6P+Ad?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07B6A58372BCEC4EAE7154F8B7C40E8A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a55e22d4-7eff-4a34-7746-08da502aa82c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2022 06:28:56.6368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QiDw/Md3GPoAPpojB/3l9aXgGQaYv7QrCsylfD1lAlwFZS42yTUj9m7HzAtwltFDBnxjSxFVpXVBSEvHkkSzciBWcNj9H0rDNKJFb4pJmY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2541
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzA2LzIwMjIgw6AgMDg6MDgsIExpYW5nIEhlIGEgw6ljcml0wqA6DQo+IEluIGdw
aW9faGFsdF9wcm9iZSgpLCBvZl9maW5kX21hdGNoaW5nX25vZGUoKSB3aWxsIHJldHVybiBhIG5v
ZGUNCj4gcG9pbnRlciB3aXRoIHJlZmNvdW50IGluY3JlbWVudGVkLiBXZSBzaG91bGQgdXNlIG9m
X25vZGVfcHV0KCkgaW4NCj4gZmFpbCBwYXRoIG9yIHdoZW4gaXQgaXMgbm90IHVzZWQgYW55bW9y
ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExpYW5nIEhlIDx3aW5kaGxAMTI2LmNvbT4NCj4gLS0t
DQo+ICAgY2hhbmdlbG9nOg0KPiAgIHY0OiByZXVzZSBleGlzdCAnZXJyJyBhbmQgdXNlIGEgc2lt
cGxlIGNvZGUgc3R5bGUsIGFkdmlzZWQgYnkgQ0oNCj4gICB2MzogdXNlIGxvY2FsICdjaGlsZF9u
b2RlJyBhZHZpc2VkIGJ5IE1pY2hhZWwuDQo+ICAgdjI6IHVzZSBnb3RvLWxhYmVsIHBhdGNoIHN0
eWxlIGFkdmlzZWQgYnkgQ2hyaXN0b3BoZSBMZXJveS4NCj4gICB2MTogYWRkIG9mX25vZGVfcHV0
KCkgYmVmb3JlIGVhY2ggZXhpdC4NCj4gDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4
L3NneV9jdHMxMDAwLmMgfCAzNSArKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYyBiL2FyY2gvcG93
ZXJwYy9wbGF0Zm9ybXMvODV4eC9zZ3lfY3RzMTAwMC5jDQo+IGluZGV4IDk4YWU2NDA3NTE5My4u
ZTQ1ODg5NDNmZTdlIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgv
c2d5X2N0czEwMDAuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0
czEwMDAuYw0KPiBAQCAtNzEsNiArNzEsNyBAQCBzdGF0aWMgaW50IGdwaW9faGFsdF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgIHsNCj4gICAJZW51bSBvZl9ncGlvX2Zs
YWdzIGZsYWdzOw0KPiAgIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBwZGV2LT5kZXYub2Zf
bm9kZTsNCj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkX25vZGU7DQo+ICAgCWludCBncGlv
LCBlcnIsIGlycTsNCj4gICAJaW50IHRyaWdnZXI7DQo+ICAgDQo+IEBAIC03OCwyNiArNzksMjkg
QEAgc3RhdGljIGludCBncGlvX2hhbHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gICAJCXJldHVybiAtRU5PREVWOw0KPiAgIA0KPiAgIAkvKiBJZiB0aGVyZSdzIG5vIG1h
dGNoaW5nIGNoaWxkLCB0aGlzIGlzbid0IHJlYWxseSBhbiBlcnJvciAqLw0KPiAtCWhhbHRfbm9k
ZSA9IG9mX2ZpbmRfbWF0Y2hpbmdfbm9kZShub2RlLCBjaGlsZF9tYXRjaCk7DQo+IC0JaWYgKCFo
YWx0X25vZGUpDQo+ICsJY2hpbGRfbm9kZSA9IG9mX2ZpbmRfbWF0Y2hpbmdfbm9kZShub2RlLCBj
aGlsZF9tYXRjaCk7DQo+ICsJaWYgKCFjaGlsZF9ub2RlKQ0KPiAgIAkJcmV0dXJuIDA7DQo+ICAg
DQo+ICAgCS8qIFRlY2huaWNhbGx5IHdlIGNvdWxkIGp1c3QgcmVhZCB0aGUgZmlyc3Qgb25lLCBi
dXQgcHVuaXNoDQo+ICAgCSAqIERUIHdyaXRlcnMgZm9yIGludmFsaWQgZm9ybS4gKi8NCj4gLQlp
ZiAob2ZfZ3Bpb19jb3VudChoYWx0X25vZGUpICE9IDEpDQo+IC0JCXJldHVybiAtRUlOVkFMOw0K
PiArCWlmIChvZl9ncGlvX2NvdW50KGNoaWxkX25vZGUpICE9IDEpIHsNCj4gKwkJZXJyID0gLUVJ
TlZBTDsNCj4gKwkJZ290byBlcnJfcHV0Ow0KPiArCX0NCj4gICANCj4gICAJLyogR2V0IHRoZSBn
cGlvIG51bWJlciByZWxhdGl2ZSB0byB0aGUgZHluYW1pYyBiYXNlLiAqLw0KPiAtCWdwaW8gPSBv
Zl9nZXRfZ3Bpb19mbGFncyhoYWx0X25vZGUsIDAsICZmbGFncyk7DQo+IC0JaWYgKCFncGlvX2lz
X3ZhbGlkKGdwaW8pKQ0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwlncGlvID0gb2ZfZ2V0X2dw
aW9fZmxhZ3MoY2hpbGRfbm9kZSwgMCwgJmZsYWdzKTsNCj4gKwlpZiAoIWdwaW9faXNfdmFsaWQo
Z3BpbykpIHsNCj4gKwkJZXJyID0gLUVJTlZBTDsNCj4gKwkJZ290b3QgZXJyX3B1dDsNCg0KRGlk
IHlvdSB0ZXN0IHRoZSBidWlsZCA/DQoNCj4gKwl9DQo+ICAgDQo+ICAgCWVyciA9IGdwaW9fcmVx
dWVzdChncGlvLCAiZ3Bpby1oYWx0Iik7DQo+ICAgCWlmIChlcnIpIHsNCj4gICAJCXByaW50ayhL
RVJOX0VSUiAiZ3Bpby1oYWx0OiBlcnJvciByZXF1ZXN0aW5nIEdQSU8gJWQuXG4iLA0KPiAgIAkJ
ICAgICAgIGdwaW8pOw0KPiAtCQloYWx0X25vZGUgPSBOVUxMOw0KPiAtCQlyZXR1cm4gZXJyOw0K
PiArCQlnb3RvIGVycl9wdXQ7DQo+ICAgCX0NCj4gICANCj4gICAJdHJpZ2dlciA9IChmbGFncyA9
PSBPRl9HUElPX0FDVElWRV9MT1cpOw0KPiBAQCAtMTA1LDE1ICsxMDksMTQgQEAgc3RhdGljIGlu
dCBncGlvX2hhbHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAJZ3Bp
b19kaXJlY3Rpb25fb3V0cHV0KGdwaW8sICF0cmlnZ2VyKTsNCj4gICANCj4gICAJLyogTm93IGdl
dCB0aGUgSVJRIHdoaWNoIHRlbGxzIHVzIHdoZW4gdGhlIHBvd2VyIGJ1dHRvbiBpcyBoaXQgKi8N
Cj4gLQlpcnEgPSBpcnFfb2ZfcGFyc2VfYW5kX21hcChoYWx0X25vZGUsIDApOw0KPiArCWlycSA9
IGlycV9vZl9wYXJzZV9hbmRfbWFwKGNoaWxkX25vZGUsIDApOw0KPiAgIAllcnIgPSByZXF1ZXN0
X2lycShpcnEsIGdwaW9faGFsdF9pcnEsIElSUUZfVFJJR0dFUl9SSVNJTkcgfA0KPiAtCQkJICBJ
UlFGX1RSSUdHRVJfRkFMTElORywgImdwaW8taGFsdCIsIGhhbHRfbm9kZSk7DQo+ICsJCQkgIElS
UUZfVFJJR0dFUl9GQUxMSU5HLCAiZ3Bpby1oYWx0IiwgY2hpbGRfbm9kZSk7DQo+ICAgCWlmIChl
cnIpIHsNCj4gICAJCXByaW50ayhLRVJOX0VSUiAiZ3Bpby1oYWx0OiBlcnJvciByZXF1ZXN0aW5n
IElSUSAlZCBmb3IgIg0KPiAgIAkJICAgICAgICJHUElPICVkLlxuIiwgaXJxLCBncGlvKTsNCj4g
ICAJCWdwaW9fZnJlZShncGlvKTsNCj4gLQkJaGFsdF9ub2RlID0gTlVMTDsNCj4gLQkJcmV0dXJu
IGVycjsNCj4gKwkJZ290byBlcnJfcHV0Ow0KPiAgIAl9DQo+ICAgDQo+ICAgCS8qIFJlZ2lzdGVy
IG91ciBoYWx0IGZ1bmN0aW9uICovDQo+IEBAIC0xMjMsNyArMTI2LDEyIEBAIHN0YXRpYyBpbnQg
Z3Bpb19oYWx0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgCXByaW50
ayhLRVJOX0lORk8gImdwaW8taGFsdDogcmVnaXN0ZXJlZCBHUElPICVkICglZCB0cmlnZ2VyLCAl
ZCINCj4gICAJICAgICAgICIgaXJxKS5cbiIsIGdwaW8sIHRyaWdnZXIsIGlycSk7DQo+ICAgDQo+
ICsJaGFsdF9ub2RlID0gY2hpbGRfbm9kZTsNCj4gICAJcmV0dXJuIDA7DQo+ICsNCj4gK2Vycl9w
dXQ6DQo+ICsJb2Zfbm9kZV9wdXQoY2hpbGRfbm9kZSk7DQo+ICsJcmV0dXJuIGVycjsNCj4gICB9
DQo+ICAgDQo+ICAgc3RhdGljIGludCBncGlvX2hhbHRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+IEBAIC0xMzksNiArMTQ3LDcgQEAgc3RhdGljIGludCBncGlvX2hhbHRf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgDQo+ICAgCQlncGlvX2Zy
ZWUoZ3Bpbyk7DQo+ICAgDQo+ICsJCW9mX25vZGVfcHV0KGhhbHRfbm9kZSk7DQo+ICAgCQloYWx0
X25vZGUgPSBOVUxMOw0KPiAgIAl9DQo+ICAg
