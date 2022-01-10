Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 012DE489517
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 10:21:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXSxJ73CHz3bP1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 20:21:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::624;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::624])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXSwm4GtWz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 20:20:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYBPQurxCJiFLUf2G6Pe80ryaYzoeXGWNuuwe+7hP6Aesb6hseY8/MYyvtWLeZVJRHyt88FS4P86ZeHLIW+GmAcfQn+ybdFKScxUrZOg7TdLxgJg+gedKv+RfkvxvfUQD0kDCpu5+A4jfcqZYFhzqRNBvwGEduEuKjS8cm/7OaNIvuOfhXdI8RQ/O/9iMAqJP+B+gkpCR0uOsGM+Uzbuag/KhBJvUYiyBWNsQr6CzM+RvBO/nDkyEONZ94aFx7E914duq/+lss72ysE4JEWPRqdMfhOCaVX02bLPsm1vH3IRU2HD/smrY/PSsGCgk+kfDQhSN8jlO3AsAUNt5qa84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5tOH18UGQCggdtwumjOZiL6uNclTd6aogGEEVl2xns=;
 b=fVAHQb30TFfn/QuqdCNJkGfYUG5umey7hfnO3YSEfLxxAgem5QXzh3RzKfmXAyFf4s5PR6GLHSukxDVJVRSFGb1SMyyzJwkkKgn57l6JqGnh/wsvRLH/uKySipQCxjX2zg5kCabXGJvfDxaCRM/QOt5+zk2mlGlmyvlNPMthOuRmNn2mEmHpUOM5q/Za7XLr6NH99CKeNkeKGAOzOMvKA3F6bdAXiAd5OF3vYCx5O1NGNBpDlMxk2lne7Yt1zVuo5KLrVvsr622rQ7CBN4qnv2MLS1vhavx8wuO/5xOyp26wqOOg4dLf/Ad0g68LbUI2j4BH8+pR6gdiwhKiGYpORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0419.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 09:20:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%4]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 09:20:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Daniel Borkmann <daniel@iogearbox.net>, Alexei
 Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH 11/13] powerpc64/bpf elfv2: Setup kernel TOC in r2 on entry
Thread-Topic: [PATCH 11/13] powerpc64/bpf elfv2: Setup kernel TOC in r2 on
 entry
Thread-Index: AQHYAvMR1BciS8LxQE2RqZouE9+3wKxcAKyA
Date: Mon, 10 Jan 2022 09:20:20 +0000
Message-ID: <d0e28f07-c24c-200d-de04-5d27c651a5e6@csgroup.eu>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <4501050f6080f12bd3ba1b5d9d7bef8d3aa57d23.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <4501050f6080f12bd3ba1b5d9d7bef8d3aa57d23.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e688593-1f02-4d8b-31bf-08d9d41a6c62
x-ms-traffictypediagnostic: MR2P264MB0419:EE_
x-microsoft-antispam-prvs: <MR2P264MB0419EC264A0D249B173D4560ED509@MR2P264MB0419.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fhJUIoetcjKi8bynamctdnBNv+76gxJj24MHuTNDWufiK44+ulY0aac223GiUeX6wQiL3QOwAVpt53+YLmCRebvBVJVC+NfY4BGHGH80CLQD97uBs/S/ID/y9TQaVmtcyp4DDkYLpzu2YJL/Wka1iv6kwFTudLgCQdBE0/ZST8w91d1dYTSRUfN5nSrPpsfTUyiKv01okOjSLy+Ga/9nsYU7RQanRfDLP1w+vLONrk1dMQTfd5FC8FANMEJUDJLKxZZs2y0v7skrwUcj75k9oAtZ+Rf50QxFjzWyv86FT8CuHzJSD3iXwo9fY5VlRiK+RM8OYspDQCcNGSDwpq7BP19gchA+WTPlFoz38DVSuZBUBZebcP9+jNK2YHuLz31NY7p0i8MPvoWvc4Jlicu7e04FACXF7Fn9iEsQ2NdASRXj9/OkButDgNbIGsebukJ15vzhxtl0zg7NKnp8STAz7SRwUF8trtZtBVTtmi1ERFY/LsZZO0Hlawhi6mK1klGKpuXSjYAzpos92Nt89ZSCIk9ZOxWQQssBIf/ABfOXWoiz25zFcblShiIibx7mzDmJbwOP+L6Fm3AGFGYQs0uRMi3KAdiXvFWU8aaS4ouY3NszhIi7Xj0r2I+dt2/cD8ubRP115nrxGJVBROfG6xXd+epMYnIM+HLrNccsfyQW4Ls46fuDoRjVDNnY9pciu8mN5cvT9pmVI2rraMiSqr/4EqfOY7PBlNnvPI+n+D2OyIB8xUmZO7WYV1Pvh7NaxcLtnO3dUs/bRvkEGJejsnpwlQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66446008)(66946007)(66476007)(66556008)(64756008)(66574015)(83380400001)(38100700002)(316002)(44832011)(5660300002)(122000001)(508600001)(76116006)(91956017)(7416002)(4326008)(8676002)(54906003)(8936002)(110136005)(2906002)(31686004)(31696002)(86362001)(6506007)(71200400001)(6486002)(2616005)(36756003)(26005)(186003)(38070700005)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1RGR1hQaTlMWEQ3TlRXOHFIM3BiNng2UGlYdmtVNWpFc2xuQkdGeTY3NFVk?=
 =?utf-8?B?SnZlTXNIY1NvYU0zSmJ4cnhya0VueXRHQ0pJT3FrYXZSTVNlMStkVng4TGRv?=
 =?utf-8?B?SnlvVXc5L1BoVk1iSEtwK3gxUUpZVm42THM1RmVHWlV6UE5QODl4MC9FQTdG?=
 =?utf-8?B?d05LT0RiMnBROEF5U3psTXlBc0lTVE5YVTNWRjd1ajV4OVJ5eSt5UFQwVUNH?=
 =?utf-8?B?WVpWdUM3RU1ISTNLbHNPd1ZMVVlBREo1d1BHcWlyNE9FUEZhT3BnWXFWT252?=
 =?utf-8?B?LytUOUp4Rk5rY3FYQTZyOWVSMWNGZFdxWmhkL2J5SWttZTZmOXBjVXZybXhC?=
 =?utf-8?B?TUFvaStrNlJVUFpsMGdQR2hhQWpnTFd1VjAyT2crcjV4ZkFMZDR1QzhIRERN?=
 =?utf-8?B?WGNrMFIyVERuZUFuZm1uK0JNNm84dS9mU1lzYWdCVk0xTDlKNmxaQWRGcC94?=
 =?utf-8?B?MzNqWXYzK2JWdTd1UDhveGZUMXVoTW5vU2ozczZkRGJ6R1Zjc215L0NVNDZM?=
 =?utf-8?B?LzNhRjgrdlh6dzJSdlN4c0FUODdZL1RkLzNYVm45RW12OWx1Qk9WaVp0MzlM?=
 =?utf-8?B?K2lCY0h1OE5hRGZQQ1dMUUdBb3I5cVVRYnY3ZlJDVDhlOThZRHlwMmRMc0Q4?=
 =?utf-8?B?VXRRMmhnUStTTW85dkwzVjFHdGNlRjdtNm9GSG9HZjBFbDU3Smp4Y01mRTVK?=
 =?utf-8?B?bjVSM01IdzFwNDhSVlhNZXY0ZVdkdWptMDd6VG4xQi8zanIyclp2M3IzdDc3?=
 =?utf-8?B?enJZRlhQSUdmQTlPa1JwNG94TVh4NEFYU0o0WWYyT05JTlYvamgwKzVqSXdI?=
 =?utf-8?B?c3FMMDBkbjF4K00ydUU1Q2R6em1hdzFhd2dQRWk2WUEyTXZYMzRqMHJ1cklm?=
 =?utf-8?B?WmE4Qk5xMklwZXE2MWE2cDBZM2UrcHhGM1J1OHpzcCtYdGZrdmJqdFc1cWdV?=
 =?utf-8?B?Y29sODBUa3Fmcm8wb05xNXVQdyt5c0JqUk1NOWJ0eTd5QVV5M1AyWVVyYjNa?=
 =?utf-8?B?YlZrOWNGamY2dlB3MVg1VmJFSFgxMmZWb1dCZXc2V1Uzd3RpL3NreEFmYmJH?=
 =?utf-8?B?UzBTYnNtQXFaT1d4bU5MdWt3V1h1VzhlSlN6V01EYmhVNjJpbDFuMVl3Qmpl?=
 =?utf-8?B?UUlMV3kxMWtqc0lXT051OGs1K2wzZ1d0YUJ2RHhKUkJXWklDRDFFQlVXdW1E?=
 =?utf-8?B?bzBnWkl2MDNwU3N2a3dCejN1N3ZDYW5FekVZTDlVclJ0alVrcGJBMDZha3RH?=
 =?utf-8?B?NlU4aGFDeTIxRU5PZ2o5QmdxekkwaUtLUkFDQVZ5VGRTNEVKeXRhUS8rN01n?=
 =?utf-8?B?QjhmRkRlcDlZWlJlSjdndW5LWU9SN1pzOVpndjRJSHMyU3FVQzBsSS9GK2Mx?=
 =?utf-8?B?VVBtelpxN0NIWm8yYnluZ3NaYjZTUmxoejhHbHdXQmpTVU04REdYTG9pRHNa?=
 =?utf-8?B?bFB0YVh3SFRRaVlBODVaTGRxRlE1MjUvbDAvMjR2cFJSeFZUS2NlQWJxZi9Z?=
 =?utf-8?B?TXNMSFRBSzFSblhLamxaRmRmU3VpNUZUeXlYakRGTkh6eHpBeTkvNmV6THhi?=
 =?utf-8?B?R3cwdDBnTW9kbkhUOUFUMnZHakNPN0RVL1o3TWxtclgrMitleXA2VisvZ1Zx?=
 =?utf-8?B?M0pQNExiNlV1MUJoY3orUUUrQ2Y4ZC9CS2ZBSmZMUG94K0h4ZUtNTmpvNWtv?=
 =?utf-8?B?SWZjWlRUQkFWc3ZQNzU3T2dxS3RDVU9IanM5SnBCNUFWdi9kRTE1K0pFNWxT?=
 =?utf-8?B?TThJZ0hyNk4xL3BPWDdYTTF2UkdKNmEvT3JRNWdJSGl1N2crdHp5VnczYXhu?=
 =?utf-8?B?dVdmNnMweW9pRkZQa1BwVnZEbTV0MndWMitRaWs2UjVscExMZUJDc0FFbFNM?=
 =?utf-8?B?UGkxcTRUU09xdHFGTG1XdzlBWGhhbHl0T2dSd2hkbG5ycjVOcVBhQU1Gbk9Q?=
 =?utf-8?B?RVRlL2ZiUXA2L2FFaUg4a3dBSkt1RkVSRGtGVm1zMHUwQktOeEI3UDdaWC96?=
 =?utf-8?B?MlE2akhEbUN5NGNITXEycE8yd2pGSUpWdEx2a2hITUlBbStaVlJRVit2MVVx?=
 =?utf-8?B?aXoxTnRJMm5QTzJVUXd2U21kZXo1TjlKbEZSOE16Z0gzcndxWjdmYVBNK3h4?=
 =?utf-8?B?dkVVZHVuWVgrdzdsUVNrVHp2b1hpSXZva2JHd0E3OFpKZlFzN1RJM25EREdz?=
 =?utf-8?B?SnYzdFRVT0NwVWJMRE8rZEFCVEZFZEpVVmRjUjJ0VmcxeDMzRUFOSlM1eGVK?=
 =?utf-8?Q?wlnrUl3h6AmEu4Y3SGPK83tw7qEzQMAHzv4VpDvOVM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFF48C2E043C704593A69AFB3DF3FFCE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e688593-1f02-4d8b-31bf-08d9d41a6c62
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 09:20:20.1311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LjntpbkFf2og5UE35oAQk8ge2Bg0foXn6JuuuSNPprhpqS1tKMVhY4Cis82sIYEFfrofxN8AwTyKmuBponDdaqxN7yIyE1WC/8EdNjsjPxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0419
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
Cc: "ykaliuta@redhat.com" <ykaliuta@redhat.com>,
 "johan.almbladh@anyfinetworks.com" <johan.almbladh@anyfinetworks.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "song@kernel.org" <song@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzAxLzIwMjIgw6AgMTI6NDUsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
SW4gcHJlcGFyYXRpb24gZm9yIHVzaW5nIGtlcm5lbCBUT0MsIGxvYWQgdGhlIHNhbWUgaW4gcjIg
b24gZW50cnkuIFdpdGgNCj4gZWxmdjEsIHRoZSBrZXJuZWwgVE9DIGlzIGFscmVhZHkgc2V0dXAg
Ynkgb3VyIGNhbGxlciBzbyB3ZSBqdXN0IGVtaXQgYQ0KPiBub3AuIFdlIGFkanVzdCB0aGUgbnVt
YmVyIG9mIGluc3RydWN0aW9ucyB0byBza2lwIG9uIGEgdGFpbCBjYWxsDQo+IGFjY29yZGluZ2x5
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmF2ZWVuIE4uIFJhbyA8bmF2ZWVuLm4ucmFvQGxpbnV4
LnZuZXQuaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXA2
NC5jIHwgOCArKysrKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRf
Y29tcDY0LmMgYi9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcDY0LmMNCj4gaW5kZXggY2U0
ZmM1OWJiZDZhOTIuLmUwNWI1NzdkOTViZjExIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMv
bmV0L2JwZl9qaXRfY29tcDY0LmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2Nv
bXA2NC5jDQo+IEBAIC03Myw2ICs3MywxMiBAQCB2b2lkIGJwZl9qaXRfYnVpbGRfcHJvbG9ndWUo
dTMyICppbWFnZSwgc3RydWN0IGNvZGVnZW5fY29udGV4dCAqY3R4KQ0KPiAgIHsNCj4gICAJaW50
IGk7DQo+ICAgDQo+ICsjaWZkZWYgUFBDNjRfRUxGX0FCSV92Mg0KPiArCVBQQ19CUEZfTEwoX1Iy
LCBfUjEzLCBvZmZzZXRvZihzdHJ1Y3QgcGFjYV9zdHJ1Y3QsIGtlcm5lbF90b2MpKTsNCj4gKyNl
bHNlDQo+ICsJRU1JVChQUENfUkFXX05PUCgpKTsNCj4gKyNlbmRpZg0KDQpDYW4gd2UgYXZvaWQg
dGhlICNpZmRlZiwgdXNpbmcNCg0KCWlmIChfX2lzX2RlZmluZWQoUFBDNjRfRUxGX0FCSV92Mikp
DQoJCVBQQ19CUEZfTEwoX1IyLCBfUjEzLCBvZmZzZXRvZihzdHJ1Y3QgcGFjYV9zdHJ1Y3QsIGtl
cm5lbF90b2MpKTsNCgllbHNlDQoJCUVNSVQoUFBDX1JBV19OT1AoKSk7DQoNCj4gKw0KPiAgIAkv
Kg0KPiAgIAkgKiBJbml0aWFsaXplIHRhaWxfY2FsbF9jbnQgaWYgd2UgZG8gdGFpbCBjYWxscy4N
Cj4gICAJICogT3RoZXJ3aXNlLCBwdXQgaW4gTk9QcyBzbyB0aGF0IGl0IGNhbiBiZSBza2lwcGVk
IHdoZW4gd2UgYXJlDQo+IEBAIC04Nyw3ICs5Myw3IEBAIHZvaWQgYnBmX2ppdF9idWlsZF9wcm9s
b2d1ZSh1MzIgKmltYWdlLCBzdHJ1Y3QgY29kZWdlbl9jb250ZXh0ICpjdHgpDQo+ICAgCQlFTUlU
KFBQQ19SQVdfTk9QKCkpOw0KPiAgIAl9DQo+ICAgDQo+IC0jZGVmaW5lIEJQRl9UQUlMQ0FMTF9Q
Uk9MT0dVRV9TSVpFCTgNCj4gKyNkZWZpbmUgQlBGX1RBSUxDQUxMX1BST0xPR1VFX1NJWkUJMTIN
Cg0KV2h5IG5vdCBjaGFuZ2UgdGhhdCBmb3IgdjIgQUJJIG9ubHkgaW5zdGVhZCBvZiBhZGRpbmcg
YSBOT1AgPyBBQkkgd29uJ3QgDQpjaGFuZ2UgZHVyaW5nIHJ1bnRpbWUgQUZBSVUNCg0KPiAgIA0K
PiAgIAlpZiAoYnBmX2hhc19zdGFja19mcmFtZShjdHgpKSB7DQo+ICAgCQkvKg==
