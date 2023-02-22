Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5520C69F033
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 09:29:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM8TW12ZPz3cDc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 19:29:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=mKXp6OBQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::625; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=mKXp6OBQ;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM8SV5qtRz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 19:28:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyqK7wNhPxlgtahVDJRkdRVSv7oMe+9l/jKnvyCAoSdbD9+DdcknU0Z/MzjtMK11h5tKNoJl/Jn2QFfteq5aaSSCzVlUQfnQdiEOrey2+OOAMCIVYYVDwAFPu7saAGIsLrSJhPAs8tCaZ6++6mPXGCTUKECVGc0nPwV/1i8G5yun0BAyd8PfECvGWGVDE79rza+43LzX27aefMUdXnuv1p/xcHFYjxZfMf5RMVsxcg2tJp3I/YUIfE3TBi1ezBOYt4E5VOYpQ9+Nmn25UfTtEPAPtAxGwYQXpKINmNX3pGLd8vtIleOgy94kkHwuUDSFKC74joVoq8CKCgueVF8qYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wJZ+VzLQ4AK9+TDpAOg8J0HCjZrw0Pu/ysRdKMWwJk=;
 b=Q6e8olHbgu+S935+gYl5H9G+zyiN9Yjv1EFRmnv6gKas8uYosx5JbpO+jcsh+6IWlyMBYW1OC8HxRCLjZz/jO15syvb2BJbvxiLBI769Mn08dYVxYTJ7zfZdb72dp0Xi+iHwQvMRw5xPFWwwYnrJFUWGgO0E3Iay5pIrWXdTfEROCiUsCvUy6G5r67opOJ6DjpUEMw8fpd55HfdTLVmgYv6M646YtMx5bEL9Sp8G7/mFaaJ3MJyiRKNAAskJMKhKepovOll9veNIpAoCFx7Y2GFYfjKGHjwFTn54op7zA1+B19N4mhleXlD1A5iX8FFsekz8p9EUhJER1M6oH9j7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wJZ+VzLQ4AK9+TDpAOg8J0HCjZrw0Pu/ysRdKMWwJk=;
 b=mKXp6OBQLhtT4M1KilZuZzXYDCpfFKuQ7ZnoYG8anozvOWwa0/H0ssjUsMk4PeDYcyCA0Ey4jrzwsz4KaotpmKzIhD8lC2CzKbXaJkb8i79OdwQ3WiEnzKgWwz7IDCnmfhA5o7DXbxZDZB/knpW3J17CEmTEl80sBMqHZhPtWigjMt7BrAntXLSqItKEeOxzt8YEAqEYDaBxIj0f/LJoybEXFjZ/Yz6e9cqpLMIDkqyAQedGKonFw/KPIb00GIL3Idc0kkPv7DatyIe3hD6rWUgP0GqCCcxnCik5wLkepYXPr8o269qTIkEesVRNWRUN2fH5+mwBnJn4XRWOfS9u6w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3277.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 08:28:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 08:28:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Subject: Re: [PATCH] arch/powerpc/include/asm/barrier.h: redefine rmb and wmb
 to lwsync
Thread-Topic: [PATCH] arch/powerpc/include/asm/barrier.h: redefine rmb and wmb
 to lwsync
Thread-Index: AQHZRoMefDxjCpO3tU+isLH8cV0K1a7aikAAgAAUsgCAAAFEAIAAAf4A
Date: Wed, 22 Feb 2023 08:28:19 +0000
Message-ID: <65a0303b-f4cc-f20c-d66a-c5037bad6791@csgroup.eu>
References: <20230222060107.70565-1-kconsul@linux.vnet.ibm.com>
 <896436d1-04e4-8019-0f89-f4d4938f9697@csgroup.eu>
 <Y/XPZl8V4/0Bjegy@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <Y/XQdmeZ86Ivcy5x@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
In-Reply-To:  <Y/XQdmeZ86Ivcy5x@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3277:EE_
x-ms-office365-filtering-correlation-id: 973712b6-353e-4890-0f3c-08db14aec0ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WpZ9i/05fu4WMoUJLGbt0i0t5mYN5c3EVryr2JzGwFkazf5b/GZzSSXugF5lSnNSbEhjeeUzuKwUzckF20j9WrDCgBS7AjljY0tjvChaIn/6GgwIm4ffDZof7C9LWMPNvNV6hwyjhkE8m+hhf1qOBLCmh6wh6GSvkqLoPomeBGJPNiryIonJL7lHxTLwIHyDLPYsu47Pw83n9ACk8+b35m7/hWdrVmo07oaGJDmIAiZXwhXYurx/68qpqRuoBZkeqtTcJVYe1CnVNT7Xun3aAZXeNoXAsuE+lFPCfwt85QjQ/65e16uhNvIpdYZ7MhzI1Oh+D0D9uFYGx6ipODU3u2X1nHGcPR+He0C6PcS58QNmovMjFzbend/Jvzrxxdu4pCbd291mTR3EsGKNmXjFRcPPFEdbqaaXBPpOiMBejXRfZy95iJ9dvbLILbRF7DSjkzBhCwMOjCswz3meHp6Gi5c5UCa9uFo5p64SYrsCJgXBLiyZoc8wVSDl9CE45MW3laEMatdBsA+J9e5k43unAby99yIW5kPQTEb2tEK6pqX5ZgUCIyPPCwdhaAf04aC9QLfcJ2EtXFZv6Y+tO63MPJNiZCnHyDMqPmKhhk/ALm0SIHobZMUcr8taaEcyWwDEG6aawVd4Lv3QtY3XjdukdjqfSqQrhCNXLt6oXZfHlL9viFDRcj0QtIecrH8/aibGoPfWaC4k57AtqtNHIfEHniNEMvNpPv6e1xzYp9bqhGKAvJdDpVU3RAPGsCqxWakl
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(346002)(396003)(376002)(39850400004)(451199018)(71200400001)(186003)(26005)(31686004)(5660300002)(2616005)(6486002)(966005)(6512007)(6506007)(54906003)(478600001)(316002)(83380400001)(38070700005)(8676002)(6916009)(4326008)(66446008)(8936002)(41300700001)(91956017)(64756008)(66556008)(66476007)(76116006)(66946007)(4744005)(36756003)(44832011)(122000001)(38100700002)(86362001)(31696002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dWhEY1BVNEUxdU9lU3VGMWpxNFhHZ0YwYjJsVlZFTXNadkZseUpUMkNEUzNa?=
 =?utf-8?B?N1ErKzNoZ1RGMXVXSmVOZ3haMk9GVWgwUnhWMDJZb0xlbTF2OHhLcEdRTXFH?=
 =?utf-8?B?OWdPNWs4VnQxZGFPbWpPcDk4UXZXNk1IR0l2dWd1VURVcXNiSEdnbi9oS3NX?=
 =?utf-8?B?WnJuWWx3emcrQWJCeHU3b3VEWW5EZzN4M3J0cFhnR3I2RkFXMmhlOHVhRmhQ?=
 =?utf-8?B?aXpqTFJLem1zVGRpazMrRDR0WWwrWGZMUDdNdTUvOWtuYlQ5N0I0bkNhRnFV?=
 =?utf-8?B?SkJ4RFM0dlhwOWU5TlZXVGZsYm1QVm9mY0t3c0Fvd0oyUXBlbmJUQloxbHVG?=
 =?utf-8?B?SlFsdDV5clg0ZDVHakVYZ1Z0VkpXQmI1RlcxYTZMNkg2R3kyZktEdEpPclk1?=
 =?utf-8?B?VlAzUG9uNlF0c21XbmNXUXlsVHNzcEtwWGRHMHZhVGY4dlNicXdZQXJwS0tQ?=
 =?utf-8?B?OGZ5bElobmV3UkcyU0pUMFpJYjJxbVp4bmZQY01rSEJwZUxpQUlGRVA0eEhF?=
 =?utf-8?B?akRZWVJBRkFndGZQcE5yN2R0anpYclV6Rm1KTFg3eXRSUnovRGNXUG4rMDJl?=
 =?utf-8?B?dE1kSHh0SVZVL1BiTmdZUThvVFdlbHBaY0dHSUFYL2lQSjAyS1V0V2JNdDZV?=
 =?utf-8?B?UEZ0R0FqbkI0NGlGUVdsa2hIM3U0L0dyNUVPaVJsZnFDRHl2dmV2TjljcjFC?=
 =?utf-8?B?NEp5aVhsa3htOTNXNEd4SWdzZWNORVpNV3h4TmpaWlltQWdOTUNoNTh0V0tO?=
 =?utf-8?B?d21UTFNGSERZZ3VTdk1wa3RPZ2c3Y0gwL2llV0w2ZVRnQmVBdlZxMG03NmNV?=
 =?utf-8?B?T3QwTEVqTXIxQ3QwblRYWkx2bk5RbHBweEJUNFlFWi9vd2dLOFF2M2o2SCt0?=
 =?utf-8?B?Vk5rdjNLMXBtNjBlNnB0Nm5OQ1ozNFJ1dCs0d1I3eVRHaWdybmZ6TjZKdTc4?=
 =?utf-8?B?N2pOWjhzMVJZQWEwaHIxT3Q5QW1CNHRWeVhmZHNBazFML2ROb3BkeW5YdFd2?=
 =?utf-8?B?WEFoc2N6bnVhUUhCM2h6dWJ1VkMzbWc1WlRGaGlRYmZDa2lBT1VhRlgyV0hE?=
 =?utf-8?B?VE9CTmNqVkJBbFpyNThtaDI4UjRSZmp1SmdhNDJwS2kwbnlGUXdjQzdFMTd0?=
 =?utf-8?B?Z3BrR0dvV09ySHoyQk9aL0x0czB0MWdrMUhmOC9WMnA5WEpyLzRBdkJIdExQ?=
 =?utf-8?B?ZFY5L095SmdvSUJCbXVJTmNJczFHTzIyZkljU0w3U3YrNVNFYWJST2FhVEhl?=
 =?utf-8?B?Z3ZWS3pnQk1Db3doaTlKN3ZPK2t5U0RveEU3ZVZwWUM2K09abnZuK3djUFhT?=
 =?utf-8?B?U1BJV0FVNmJDcWlRUTZHZTBNZFZCR1NxSlJUNEwrZFNZazNsLzRLYXRscjAr?=
 =?utf-8?B?K21IbDcyc3lpdHRNYWtUemozaDBaWnVyNEMrNDBPelVFa1FPR3R0ZFNvMEF3?=
 =?utf-8?B?aGo0bHNyMWNvTmxUamFTYXZKWm5UVHUySlVLT1kxZVF2THpWbFo3ZDBLTWlj?=
 =?utf-8?B?Y1NzN2lXbE00R2pRZmFjTGsxMWZIUEdaT0hQYXBHK1ZoQVljUnp4eHJYTnZ4?=
 =?utf-8?B?S0RTc2tNWlAzUWFBL1J5UU9LTDNwaGlBZ0VDZmxHRkVVdTBMQzNpaDN2WDFJ?=
 =?utf-8?B?RVlubk9LbkVxRmx0amNiK2NmWlJ2d3h4K2NrUWJKSWR1Z3BCUjF1ZkRsVy8y?=
 =?utf-8?B?aTBYSFpkNjg4c2l1TVRqUUJWZEtHTnppenBIMEF3NUh3eTJrR0VjeER2MlVy?=
 =?utf-8?B?SG82N1ZCTHRKNEozQ0hxT29nSlRiZEpoZy9Fb0dISytJdi9XeGlEdnJkQmYx?=
 =?utf-8?B?c3hyNHZ2cStObVR2SWNjK0VoTzh3cnErN0hnazRFaGNRVVY1N0pHOHl3Sk92?=
 =?utf-8?B?alNySHB2cGxOdjJDVEQxbStTTUw1Q3FuYUowYUVsUG03eG5lVjVnMHJHdGhU?=
 =?utf-8?B?TkNsZ1FWYnhGTmQ0YlVqZVF5M213amZNYjVzV2NMdDlKSmE4eGk5L1lBRlJC?=
 =?utf-8?B?dll5dFd4Yy9OTXhFY2pRWXp0Ty9zdThsYXNUNVk4TlUxYXRkYndWbk0zN0cy?=
 =?utf-8?B?RkdxZ3ZFdW9TcnZ6M0hwWmhjOXhIOE9INWh1TjByaDNYMlRjNFdzdGlFUVpY?=
 =?utf-8?B?NmVNL3hiRHhLZ3dtak9DTkhVS25VdWJxOURuN0xUYVpMN2FJb1l3NFFzWVY1?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF8B175FB7D5074E8EF603455C5D1D79@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 973712b6-353e-4890-0f3c-08db14aec0ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 08:28:19.2716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eX+E6wDSzHkn1fjVG8QyJ4kSOMTa4jBn+ZBRax7uBrtKJ8s98meCLTC5/r8vAISVl2bJRYttHGxWS0/crr+jD/YoMilHDF787rkZD7EAzZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3277
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzAyLzIwMjMgw6AgMDk6MjEsIEthdXR1ayBDb25zdWwgYSDDqWNyaXTCoDoNCj4+
IE9uIFdlZCwgRmViIDIyLCAyMDIzIGF0IDA3OjAyOjM0QU0gKzAwMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+Pj4+ICsvKiBSZWRlZmluZSBybWIoKSB0byBsd3N5bmMuICovDQo+Pj4NCj4+
PiBXSGF0J3MgdGhlIGFkZGVkIHZhbHVlIG9mIHRoaXMgY29tbWVudCA/IElzbid0IGl0IG9idmlv
dXMgaW4gdGhlIGxpbmUNCj4+PiBiZWxvdyB0aGF0IHJtYigpIGlzIGJlaW5nIGRlZmluZWQgdG8g
bHdzeW5jID8gUGxlYXNlIGF2b2lkIHVzZWxlc3MgY29tbWVudHMuDQo+PiBTdXJlLg0KPiBTb3Jy
eSwgZm9yZ290IHRvIGFkZCB0aGF0IEkgd2Fzbid0IGFkZGluZyB0aGlzIHVzZWxlc3MgY29tbWVu
dC4NCj4gSXRzIGp1c3QgdGhhdCBjaGVja3BhdGNoLnBsIGNvbXBsYWlucyB0aGF0IHRoZSBtZW1v
cnkgYmFycmllciAjZGVmaW5lDQo+IGRvZXNuJ3QgaGF2ZSBhIGNvbW1lbnQgZm9yIGl0Lg0KPj4+
DQoNClNlZSBodHRwczovL2RvY3Mua2VybmVsLm9yZy9kZXYtdG9vbHMvY2hlY2twYXRjaC5odG1s
LCBpdCBzYXlzOg0KDQpDaGVja3BhdGNoIGlzIG5vdCBhbHdheXMgcmlnaHQuIFlvdXIganVkZ2Vt
ZW50IHRha2VzIHByZWNlZGVuY2Ugb3ZlciANCmNoZWNrcGF0Y2ggbWVzc2FnZXMuIElmIHlvdXIg
Y29kZSBsb29rcyBiZXR0ZXIgd2l0aCB0aGUgdmlvbGF0aW9ucywgdGhlbiANCml0cyBwcm9iYWJs
eSBiZXN0IGxlZnQgYWxvbmUuDQoNCmNoZWNrcGF0Y2ggd2FudHMgYSBjb21tZW50IGZvciB1c2Vz
IG9mIG1lbW9yeSBiYXJyaWVycy4gSGVyZSBJIHRoaW5rIGl0IA0KaXMgYSBmYWxzZSBwb3NpdGl2
ZS4NCg==
