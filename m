Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4853791A1F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Sep 2023 16:56:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=P4PDiSUr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfWtG4J3dz3c53
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 00:56:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=P4PDiSUr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::616; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfWsP2BV9z2xYt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 00:55:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AopILkgHKGA7Jx6eUa2kYOVIY+5DNae6gnNuI4Nuc8QtMoZxcy8U5sSHd/4JArvJDXjuhRDSMAMPTUpZ0X6W2lZCgwxMRH9F6i6x9DkQe/Jh4q3b+5Fv7Hn32wqM7BXlEPXVriSYxwZR6mDeppBi3XrCK/qhUPgMybl0SL7TN3aW+lYu2tw4vVyxotqLz/9yRqKt6Lpxm1sFtr6ba7U3G+P77GeV/cYDo6N+xhJzdwqr7gxMHj57HBjGxTZnrRTGK13GOslotpZ4ZD0JaEu28exYLQ6HUHdJBfQYC+YboLaXGUPVyugAKJcjcYn6otrJmRTgPBtaTdS+wtxznhDFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pET5kidlE2QNp2U8N2IhrDV5xW+EPxnjTsnx8OlZo6U=;
 b=J2vIex3cEBWfihvFm3HlgR00ZqtQm2o3AilcLB+slxizwMBm0osJXfMQAYYbt86QcJiePkNW6T6ysO1lpNlGgxkFx3vcjJ7aHQ5Lz3FHhHpnbQajxCmPIn7WTpfLUnJbEHZ78Sn2vsLUtr3ZE1hTNrS/t8uggqR7CBx+89q2J/7JG30c0Tjp/NyJytL6weGVr4SHkbB8rCNAntWOG50PzbFLhSp2kHHIQqEdkWqeLS/C/0n1lxE7ZFskJVVDSKs7P4eT1MsvhC8kV6cBf8UJcS/hDpYZkzz8qin5UaJrwva0ncvJKQPe19jDGNBTmwVtBON1mO9Y4/WT9HbtKcmdhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pET5kidlE2QNp2U8N2IhrDV5xW+EPxnjTsnx8OlZo6U=;
 b=P4PDiSUrtr16QFSGtr776lB+eNS6xK38bqme8jjiIzF1dFqBjbppf+LZqCMbWFJykikjKQTSEjPwB3SBNWahvDwvR+wrC1pPp+PYLxzbDM7tDVmvsL5uF4tOlJN8JGaVfRsUDDun1yF9nnSJ8o5kPXJegsU+vCi0GebKwjdAYF/6+FnvApWpu/io9cWFIs2ADuC5zFwMFh8hxKDcz5qtqUfT9X/F1F9Y2EqAuKopf6HFRcLFPTVOuPOGYNUpviJkZPfaACp93kbuKtFEYXkGtyv9AryOwQLu2U6TWwvhe/POZIBo711SptkPxk0q1mst1NKHmMLgCLx88L+5ojTvCQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2897.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:36::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Mon, 4 Sep
 2023 14:55:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 14:55:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index:  AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAIAAgoIAgAGRmwCAACvKAIABTb0AgAG9zgCAAE6agIAAqJKAgABtOACAAAn3AIAFtNyAgAKmeoCAAMKDAIAFewAAgAUftACAASA2gIAAlqsAgAQFCICAASjBgIAAAdaA
Date: Mon, 4 Sep 2023 14:55:17 +0000
Message-ID: <c0891617-43b9-5b56-2c51-69eec81e3b48@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
 <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
 <20230813213855.794b3c8f@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
 <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
 <20230815220156.5c234b52@yea>
 <0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
 <20230817203202.2b4c273c@yea> <87y1i9clf2.fsf@mail.lhotse>
 <20230818111641.7f680ce7@yea>
 <fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
 <20230818182316.79303545@yea>
 <5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
 <20230824020015.78733931@yea> <87jztkvfid.fsf@mail.lhotse>
 <20230828011758.3b7b9daf@yea>
 <1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
 <20230901004417.631dc019@yea>
 <b9671cd2-9cad-c5d9-dd94-8b39f67e29b4@csgroup.eu>
 <20230903230635.5751b620@yea>
 <438d8790-8a55-2f36-4ef0-2fddcb39edae@csgroup.eu>
In-Reply-To: <438d8790-8a55-2f36-4ef0-2fddcb39edae@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2897:EE_
x-ms-office365-filtering-correlation-id: daf476e6-8b81-43cd-0d88-08dbad56f41b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  R5cuwr3aXQZWHwXA9YEne+yGEE4dMIhSec38PnTcMHOrMpMbY9y0hKXQE0dlYP2fpgz7ObG8n3dSJu0anPAQVgJW1ScLtuH3bRf91+EyCJrHgOGr3YofA6Jx2aT0m173BQ0QTV1+kPiXOFPNNxHoAM0dVmd9l2fdr6TxUs+D+q+2Gq6sAqq67yeuQ6LtEHKb2gN5fymX1ihTDhaudFOKHfqaERrK76itjJbdNRfgENNVwsozZdstD4U0S4uidy/DpErpDYQ97Ed7pigrWziiZTbi7lRXCna3eIJbB3cM7Y4VvUSaxnx/Clj6pZYB233LbeOdT/NHfzvLROVE0CFuuWutTNsfzTgThwAINAfD92TolAs7L55KQyekK1twqdbTF5Yuoy9FRGddO0XSC9jBLd90XK6YJirJFdZJpkv925YAiSnqfUB5lJNrxzYcKC5pFyeetHf0lR1yguCLqnAOl2u9CyAsboglKAY7OZ1BpKmlBznD1vFALIHtEusTaeKlYYWzuUO68G6Q1g6/nOiX8H/KCup01UOz2f0LkmhxQsMQQhOLyx9PhpcaM81mZs11eht2ruVVYYShVLslJckCXO2x+xxXlkdaeCxKA+xcP6wUJy9l6pAmzL6dSLKziAToeOIdYcnR/N8mxds0AS0Q0p1e4GQkMJNsveKaO2V/u1WqYefyX1hCMUD1X0GY/NUB
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(366004)(376002)(346002)(396003)(451199024)(186009)(1800799009)(31686004)(6916009)(66556008)(2906002)(66446008)(66476007)(316002)(36756003)(76116006)(86362001)(31696002)(64756008)(91956017)(54906003)(66946007)(8936002)(5660300002)(44832011)(8676002)(4326008)(41300700001)(6512007)(2616005)(38100700002)(38070700005)(83380400001)(26005)(478600001)(122000001)(6506007)(6486002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NC9zVTZnbWc3SW1nSU5ydUdHZEo5QndlTERCTCt3NHltRFp3WklVTmpGSVZU?=
 =?utf-8?B?R1lqL2J1NUJDclh4ZVZ1Rm1hWjVJZUlyK2Q2aytUb1JnMzRYbDk1Sk5ld1gy?=
 =?utf-8?B?YkJFejB5QTNWcTAxOFRxTzNtb3c5TkYycU1LK053SVdxYlhNdmRhRjdVMTNV?=
 =?utf-8?B?UjF5Vk1UbFpQWUNYdWdrWGs0Zk1rNTk0YnZUK2IxMXlyNjlCaEtNNDMzTWE2?=
 =?utf-8?B?bVExWEV2STNQMnRhQlZzS1NFeUVUL3ZqTnFIZGgzbEhaMmozTW9uREFkb1No?=
 =?utf-8?B?UnRYdVd5NFZnbHg0eDc5UXJRRzM5S2dpZ1NoQWJ6N1hDNFRSZHVEOHZOT3Fm?=
 =?utf-8?B?bGVnNkFLNGx6RlFSWjhyVjhpQkhwNFVCNDVWYXRwY3lMaEE4aHhIdUhmMDZG?=
 =?utf-8?B?NW9pWjZjaFhzeExONFU0LytZblI5TkhTM0ZjSUV3MWpHWUpLb0ZJdWR3THly?=
 =?utf-8?B?ZTF0MFFieWZHZ3ZQaU9JbVlJNVR6TjNYVHo4eU1yUThHdDMxME1LeVNSQllp?=
 =?utf-8?B?MGZJTnUvejhEVDNOZGlCYXVZakx3YnNiOTBHK1h5c2N4SU9USFBIQkV1RUQv?=
 =?utf-8?B?RzFpRHAwTHBZTnN6bzJzZ0Q0ckkvSjM4empjTzNsS0FLaktxWWJoYkdJcTRK?=
 =?utf-8?B?V25sMytrZ1ArbUZubkhqYXEwVlhKbllqN0ZuMUNBYm5xRGs5MmN3THQ2NkZH?=
 =?utf-8?B?NGYrYVBCNlBoWFcvaWI5RGxpYzk1cjU1Qk1Eem41a1gxNGJMQzJ2QmoxdW1j?=
 =?utf-8?B?RElYOVlaQUc4ZzluNTlXNzFXV2FOcWswemFOSFFnY3pJb0VMM3dIdzVnaDdy?=
 =?utf-8?B?dU1yNVRXYldVZjIvSXhscnRVeXI5VnVwOHpGMDYvQXVFQXZ3RHZpM3VIdjky?=
 =?utf-8?B?UkhkOWVIcDN3Z3hZa3ZNTTliTlBEWGgwWS82TXM1alN4aE5TQ25UKzRBSmlo?=
 =?utf-8?B?TDhnbW9NVUVnUmpjcnpkQTlwWTNWNFJqdDZhQXRuWVpENFY1QThPL1NCSlVF?=
 =?utf-8?B?WCtMWmhob0ptK2tXVFZkaW9TUGcwOFA0THc5RDkyVTJMY2t3Z2hGZVEyUGtD?=
 =?utf-8?B?ZHlIREE1SFd3UU9Tejh5OEx6anh2enNUVWUrOUE4KzhEWk4rTjVpN2UwcE5Y?=
 =?utf-8?B?YkdqQVhQU0xCZ0Z2THMwQ3pBWlE1dUZmK3lhMmQ0WFA4VmVJcTZEWmxQOVFZ?=
 =?utf-8?B?alVjTHFIV3RkTUVycjVFdlZ4WjROaFNWQzBKVmpQazE3Ni9xSzQ4WTNmQ2pp?=
 =?utf-8?B?UlR3NDZYMnUyWTFIS1cxYjQyVnV1K05NRVV4dUxNanVuYlhzSHN2Qk5qcUdt?=
 =?utf-8?B?R1BHWlFLZWY3VFV1TWVDajYrL3RiZHhtT2pVQlVFNFVIdGUyZHI3QURiSmRa?=
 =?utf-8?B?S3lIa2pvM3dCUTNKWWx2OGJIWjVXeStWLzRkZ2lCWjl0V01EL0xwY1NselpN?=
 =?utf-8?B?VXJ4UXVEa05aNkIzUEJjYWlac25qbUtEakIzZk5DMWhwcVorZ2NFQVJpanVI?=
 =?utf-8?B?U1FIWDRNK0VkQjFXVUQ1eng3VFdkZEFCVWt3REpnTWVxMkl5ZkVWaUZldFRh?=
 =?utf-8?B?RzlvUkpRSTNGdy8rTGFVditJK1lHR1dVMm8zTHJqSnk0WlFmVFlMaU1UemFx?=
 =?utf-8?B?WVpJOGk5YzdNenkwYUFCbGJ5VEtVemgraVpVN3dFZW5TaHRwOXNwdFRKK3Rh?=
 =?utf-8?B?VDU0M2l1OVNIM2daR1RIS1VqM2o2NGJ5OVpFclNmYkZEcUM2ZU9pOFNuVjhq?=
 =?utf-8?B?bk56OHFtRjZiRHRDQzF0eW1DYkhqQmt1bHNaeDhqUVJQRWZaN2xIUFVGRDV0?=
 =?utf-8?B?WnNiQTR5MFBROW1YWE5rWjFvMFFTbTlLaytRMjdaOWlzY3o0S2xhbVUrN1hu?=
 =?utf-8?B?TkJtZ3VmNHZRUHUwY2RIazVpSnJhUzNQU2F6c3BKWmloc2FCV2hLUUxMWlRw?=
 =?utf-8?B?d3RLMS9vbGkwUGxNaGpwQW82Tk9UYk9LWllRNXgzM3pWYVZHcGtJWUVrcDlt?=
 =?utf-8?B?WFNySjM0T0xHT01jYWRXcXlYY0FuY3k1d2RydERMYkx5dzZjSHU4Q2RvRmtU?=
 =?utf-8?B?S0hnTitQOThQL0NQQllBZWRoak1uSU1ESzkwbHNMQmlqNTFCQXhFTkY0YXRK?=
 =?utf-8?Q?V01UAfff2IiDZP1cMll8LSONA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <108997C4E0AA8B4A9C45FC1F3A1DE0F5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: daf476e6-8b81-43cd-0d88-08dbad56f41b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2023 14:55:17.6969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r+I980j6b2TiqHSj/N8xlFc7e3Mg8KMnaflAztbcU4T6KHZIk3RO/LzJoU8j8ppNkVOcktyd80P6r3zJ4l77aR6bIfxFz/woDkECnAjUJIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2897
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzA5LzIwMjMgw6AgMTY6NDgsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAwMy8wOS8yMDIzIMOgIDIzOjA2LCBFcmhhcmQgRnVydG5lciBhIMOpY3Jp
dMKgOg0KPj4gT24gRnJpLCAxIFNlcCAyMDIzIDA3OjQzOjM0ICswMDAwDQo+PiBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPj4NCj4+Pj4+IENh
biB5b3UgdHJ5IHdoYXQgaGFwcGVucyB3aGVuIHlvdSByZW1vdmUgdGhlIGNhbGwgdG8ga2FzYW5f
aW5pdCgpIA0KPj4+Pj4gYXQgdGhlDQo+Pj4+PiBzdGFydCBvZiBzZXR1cF9hcmNoKCkgaW4gYXJj
aC9wb3dlcnBjL2tlcm5lbC9zZXR1cC1jb21tb24uYw0KPj4+Pg0KPj4+PiBPaywgc28gSSBsZWZ0
IHRoZSBvdGhlciBwYXRjaGVzIGluIHBsYWNlICsgYnRleHRfbWFwKCkgaW5zdGVhZCBvZiANCj4+
Pj4gYnRleHRfdW5tYXAoKSBhdCB0aGUgZW5kIG9mIE1NVV9pbml0KCkgKyBNaWNoYWVscyBwYXRj
aCBhbmQgDQo+Pj4+IGFkZGl0aW9uYWxseSBjb21tZW50ZWQtb3V0IGthc2FuX2luaXQoKSBhcyBz
dGF0ZWQgYWJvdmUuIFRoZSBvdXRjb21lIA0KPj4+PiBpcyByYXRoZXIgaW50ZXJlc3RpbmchIE5v
dyBJIGRldGVybWluaXN0aWNhbGx5IGdldCB0aGlzIG91dHB1dCBhdCANCj4+Pj4gYm9vdCBPRiBj
b25zb2xlLCByZWdhcmRsZXNzIHdoZXRlciBpdCdzIGEgY29sZCBib290IG9yIHdhcm0gYm9vdDoN
Cj4+Pg0KPj4+IEFoLCBteSBiYWQuIFlvdSBhbHNvIG5lZWQgdG8gcmVtb3ZlIHRoZSBjYWxsIHRv
IGthc2FuX2xhdGVfaW5pdCgpIGluDQo+Pj4gbWVtX2luaXQoKSBpbiBhcmNoL3Bvd2VycGMvbW0v
bWVtLmMNCj4+DQo+PiBOb3QgdHJhZ2ljLiBNZWFud2hpbGUgSSBjb21tZW50ZWQtb3V0IGthc2Fu
X2xhdGVfaW5pdCgpIGFuZCB1cGRhdGVkIHRvIA0KPj4ga2VybmVsIHY2LjUuMS4NCj4+DQo+PiBk
bWVzZyBkaWQgbm90IGNoYW5nZSBob3dldmVyLCBnZXR0aW5nIHRoZSBzYW1lICJCVUc6IEtBU0FO
OiANCj4+IHN0YWNrLW91dC1vZi1ib3VuZHMgaW4gX19rZXJuZWxfcG9pc29uX3BhZ2VzKzB4NmMv
MHhkMCIgYXMgbGFzdCB0aW1lIA0KPj4gb25seSBvbiB2Ni41LjEuDQo+Pg0KPiANCj4gDQo+IE9r
LCBzbyBsZXRzIGNvbWUgYmFjayB0byBub3JtYWwgc2l0dWF0aW9uLiBDYW4geW91IGFkZCBiYWNr
IGthc2FuX2luaXQoKSANCj4gYW5kIGthc2FuX2xhdGVfaW5pdCgpLCB3aGlsZSBrZWVwaW5nIHRo
ZSBidGV4dCBjaGFuZ2VzIGFuZCBNaWNoYWVsJ3MgcGF0Y2guDQo+IA0KPiBUaGVuIHNlZSB3aGF0
IHJlc3VsdCB5b3UgZ2V0IHdpdGggQ09ORklHX0tBU0FOIGJ1dCB3aXRob3V0IA0KPiBDT05GSUdf
S0FTQU5fVk1BTExPQw0KPiANCj4gSXQgd291bGQgaGVscCBuYXJyb3cgdGhlIHByb2JsZW0gYXJl
YSBiZWNhdXNlIGthc2FuX2luaXQoKSBkb2VzIHNldmVyYWwgDQo+IHRoaW5ncyBiYXNlZCBvbiBD
T05GSUdfS0FTQU5fVk1BTExPQy4NCj4gDQoNCg0KDQpBbm90aGVyIHRoaW5nIHRoYXQgY291bGQg
YmUgaW50ZXJlc3RpbmcgdG8gdGVzdCBpcyB0byByZW1vdmUgKG9yIGNvbW1lbnQgDQpvdXQpIHRo
ZSBmb2xsb3dpbmcgbGluZSBpbiBhcmNoL3Bvd2VycGMvbW0va2FzYW4vTWFrZWZpbGUgOg0KDQog
ICBvYmotJChDT05GSUdfUFBDX0JPT0szU18zMikJKz0gYm9vazNzXzMyLm8NCg0KVGhhdCB3YXks
IHRoZSB3ZWFrIHZlcnNpb24gb2Yga2FzYW5faW5pdF9yZWdpb24oKSB3aWxsIGJlIHVzZWQgaW5z
dGVhZCANCm9mIHRoZSBvbmUgaW4gYm9vazNzXzMyLmMNCg==
