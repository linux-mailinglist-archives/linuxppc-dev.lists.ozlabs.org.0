Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191054B26DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 14:12:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwDYY4BF4z3c9h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 00:12:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61a;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwDY175Gmz3bZR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 00:12:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=io5OAU0qTZ35D4zYZ7Za93fisDYUt2fjtEScHlF307QFoY4/SL3OHsYOJNHNxprOduN9gDv0DQKWh6yWK9vnH+JBw1WSw/4ie1jOhcI+/htgq4D/Jwex1iGIk7YvplIYPz/b1aYkqIBnpsocNAQ5yBJDM1juPywoTBjCz+5kJLGrx2XR4ZVsiW2iJXrYpTjZhN4AwnSL4Cc4ofGFncNypQbMWfD2REeTr8O7Nbrzn3fmvBdA30P7gXE6lZ8wUelvuJqEp7aiPVUkbxp/boA8iZujZfbhImK05V/ogzC70TXXg0nZ87pgviDNN7u6eHGF87+qqYsluVsFw3aUHp7RXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YIiVC4CoP5L4XfNdoCqQI6F6ohk4DIFI9sffpl8SpM=;
 b=i/bNEhJLe204rHEJnC857WqM/sISiiwBHgs82SOd4z3T0xfQVEGqdVinM4d14Ew9NJIW0KvfE1yT5bEyzyQgQN0Gis2JCSATZ8aqNp/8AKTwgG/3HujoIVNTXEd7yqm7thElxRh4hLxJjA52nhASKJVAexYayVUZzVMvYdQR8yJJqchUDF0BRiUHL4Hhj39q/UoAHJSSoAJsF4luMlCVCpV1JHE4ic2s9HpiJiioPMUs3loe9nNGDlhvJ7u0Cta49DYUlmUNRx/BlHoeKSlPwVwXGAw2DXjhKamVq/kzeDqVt3zEIZ1n9rzCuIVAFb6CMAvGaqJhS+ZN9g0gRYjBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB4411.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:25e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 13:11:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%9]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 13:11:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Ash Logan <ash@heyquark.com>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>
Subject: Re: [RFC] Upstreaming Linux for Nintendo Wii U
Thread-Topic: [RFC] Upstreaming Linux for Nintendo Wii U
Thread-Index: AQHYHI9iFk2/ndVmzECtdmwNU9OGmayOPC0AgAAchYA=
Date: Fri, 11 Feb 2022 13:11:41 +0000
Message-ID: <41c696de-0e04-61e1-610c-73e9440c5c19@csgroup.eu>
References: <0020d47c-0e23-822c-33f5-ccb7ea4c1072@heyquark.com>
 <87ee49sktb.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ee49sktb.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 577930ad-6bae-4fc0-4e98-08d9ed600ba6
x-ms-traffictypediagnostic: PR0P264MB4411:EE_
x-microsoft-antispam-prvs: <PR0P264MB44119D12C3F64DBE1D649A17ED309@PR0P264MB4411.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WQmSjAQ62vY5Um3a0qfSzfxQA23KG0r3MZYJjtBnd1ULfx7Accjo3DAljMxaSqkkpMbC2RFfkllKDyU4zvhiHnDoS8GNmCFzffI590QqtaDTqpYAftqL/S8TRBaFqZij2SI72EQ1DxlHlY74i2puYp44wYnMmM57b0HMAwkk42XhxbrrkjXproIK2tLxeSSn3MY9H4NMK8Ow2rcsKMmGCIsNgNynMj0SgdlVHgPP9CPhzU86MFGBpwawMY/e+xFL0JkrizdkqXLc2h9enhUqvJy4mXef+AWFcK7WOt2PYEamF9d60JLRXJTjyCYcA73QC6uGfYQ6eRxSLbV2tYDi/26dCw5VEnZaGexn12SMRffgXdWStPoOek/gv0gsAhYQZp/UIDBZzPwk3e04VrzNUtSwhJFRkAsFSajVgHtM6FgCAld3Ym/ihUrsVisTdBs4SkfGEgdS7zH532d2WXj0/jSpA+Ap7ipAsLEmcjrgnlNfjeHCb1JWmAXpyf1t27ziUukOHY+Du6s6FdnjVBGuOw+Yw3tSmXrpjkfUkmulFxROiRgGEa7UhAbA8WKu0gMqZlXwfLEJ/dGeVyoCLDqxhwug/M8IzqDpJN40W7ELHaseCoUg4q+A98vdacgieuIPKYLGJTcqorZH/mXyiicKqVGELbw1d6lqo8G8q5D0FPzihu5s4L2jfqGsnpSkdzJdsh1Cf2hupOFzHzPhv4rKwCQf2nUX+owf2QuoCwgwSjLcNBkh0dmWH/CCMemS1IFPsv5d/z13DFdKYv1wSy+RYSYm9TgIgpHYZhU1N7trKvwAj5gI1JaUviP4ZDQ4p12HkjLg9iaiNSKkHubmMKAx8JwapowYDxROtMoL1PQGd0A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(8936002)(316002)(83380400001)(110136005)(54906003)(2906002)(71200400001)(38070700005)(6512007)(86362001)(91956017)(186003)(8676002)(31686004)(966005)(7416002)(6486002)(66476007)(64756008)(66556008)(66446008)(38100700002)(66946007)(122000001)(76116006)(26005)(36756003)(44832011)(508600001)(6506007)(31696002)(4326008)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHZFWEtRU2hXS2ZEc1Rra3pLWmdsakdRZGs3VHVUU3dXYnJudDNsckFHR3FS?=
 =?utf-8?B?N2M0VkpoWGZJKy9YUlBHZElaQVFJL1BvVGJDSGVRcE5VSFBRWG1udCthaXAw?=
 =?utf-8?B?amtxSGFhckJBcmdoVStYZVYvbFlUVkRQRUNIV0c3SlZXSWx6dXptdTk1L1Bh?=
 =?utf-8?B?RUluaDdZRUw0MkNYU1NtaWZCRGNBbUdJZDhaOUhsK2g4R2pVbUlqTjhXaTlG?=
 =?utf-8?B?TjhWUDBhanVxampjRFZCM29nSHNXODBOZVdHSXFIWUsvSVdwcFIrRCt6NDlT?=
 =?utf-8?B?VEdKRDZlZlVURG8wQklWWnluTStxZWJQT3VMZTBrWm9rVitKcjdtTTdIWkk4?=
 =?utf-8?B?TVFwMUNZMVY2RjYweXZLRVoxMlBzaVFFUzlKZG5FTEV4eVRwRWJpM1ZjWjEv?=
 =?utf-8?B?Q0RSSEh3YVpYZ0szRTRNYk9xc0oreUlPUy9KajU1eXRuVXFDdENYblFrZXpr?=
 =?utf-8?B?V0g4dnpPNTdHQUFtM0hldzlaMU9yRXZ0MTZUNFZnemhwaWc1TXVqL3hkNXp3?=
 =?utf-8?B?Z053SkhXUlFXQ3BVbEh6U0FXaEJTdjZXMkw5UVZySkoram1tK1dUdmVPN3Vk?=
 =?utf-8?B?UWw4TEZ3YTVNZFdwZ1N0aEc5RVlCR21YMC90K1BtYXBCa1FMUGdTZE0zWkg5?=
 =?utf-8?B?dXk1VGErR2NMNWhSYncyTk5NcUhZeUgxd0JsMGJicFdIM3pjRTlnV1J3dlp2?=
 =?utf-8?B?bDl5ZzJkYzBveURzS245ejB3aGlUNDRseklMU0g2SGRFYkdoMHExM0xvUlQv?=
 =?utf-8?B?L3k2ck8yQlpHdmYrS29SQjMxSFBzSUM5b2ZDd1FydVdQVnJ2Ni8xQ3prWFRx?=
 =?utf-8?B?SHY4LzUvamt0aEZzcURIVHBsRGJKdTl4ckloS2NiMC9iTzJOeU1Ba1FCQTJ1?=
 =?utf-8?B?VlNsWk00cTdseVoyRlpKc2xpRm9oVWI4VHdjc3VYVXVWanBSSmtwTUdNd0R5?=
 =?utf-8?B?Ykh3R2tCYUd6VzlaYjlyendoNXE5ZGFCNEtTcWZNMW5hN1V5OW5pM0pjOHRx?=
 =?utf-8?B?b3ZaK2w1ZFVlaXBBZGFydzVwTGR5Wk12dHcwL2RPZ2NMM3RrTTduUlpPeEtp?=
 =?utf-8?B?ZVZiSHVJN203cHJBSTV0SGgxT2hJdDJTSVZGdDk3eGt2andiUnBMVHF6ay9U?=
 =?utf-8?B?bGtUOFhQSVEzS080eVpVSmtyQ09tME9GYlBuS3Z3UkFiQzMrOUNNSFk3NTFP?=
 =?utf-8?B?ak04QXVBYURDOHJiUFJBUlJDZS9zU1dMVVR3dGJqZjR4d3Y5cjdvcmMyZGh3?=
 =?utf-8?B?V3FSSnVDL3B4cXVFb2p5VUd2MHNNQ0NZTm51QU1UUXplRno0cW14WnpzL213?=
 =?utf-8?B?cCt2TnZNZWxTMURFNFhod0EzSkkrQTZGbWhmWjJDdjVyRG4zK3ZCakZ1STFY?=
 =?utf-8?B?bElqeDF1Vkk0eW1HWU56eWtYSkJYSFNrQ0ljTkN6Q25HUnpmWEVYYTFmazVm?=
 =?utf-8?B?bko3SnBBemdPdERNNzE2QXI3OEJjVmVmTk5QMUg0dG9yZXV0SlZ1US93ZTBK?=
 =?utf-8?B?UWhnbXA3Q3oreXJ1Q2xONGk3TXFuV3lNSzliS2hlZDUrdWRNOXNRRFZyamxz?=
 =?utf-8?B?bG5LYkZ0WWFOZXpHN1djenFiMVJaRFhSUWQzUytWR0had3gxbEY1a3VJK0FR?=
 =?utf-8?B?NitMYTZZSE9QNWxoc2xSKzVwVzZUUDhmb2t6MXFjRUtqRUFSaHYycURaRlhl?=
 =?utf-8?B?MVk2b2o2K250dWxid1l3U0xoZ2tGZThrNDdha21GSHV4ZHZZY1VkeXJFWG92?=
 =?utf-8?B?SWF4eXE4MzNyLy91NXg0ZHBBV2lWT0lXYkdsMkxqYlFudkgyZFJsbjhjb0Zi?=
 =?utf-8?B?Z2FKZlBiT2V1R0JUQS9nMFlMR09id0xybG42RFhlQ04rL3llYk5pMnpNYkZC?=
 =?utf-8?B?dkN6RlNjbHhBVmFpN1dzMjMxUzAxY0YzRHFQK1ZFVTlPSFNZWjV2TXh4cU1Z?=
 =?utf-8?B?QThVZ1lFTFY1Z1puTlZuZkRaQWM3TVo4OGxHaWZya1FvOXZadFhoTmQ0bTNa?=
 =?utf-8?B?UGNGeFIvdCtsbThHdzNjcEpmWjFkN2lpSko4eWV6dC9Bb1hoL1FGUHZNSzZH?=
 =?utf-8?B?NTJjQzB6RzBJTDdjaG5sVWdZQTFFWTFuZFRlZ3Y1UC9XV3YwYmxMRGNOdVBt?=
 =?utf-8?B?c3FCOEhrdDZxZ1F1UGw4dUhXUWFpQmREeEdtbDZwUnlYRkE5bzVOd01WelJP?=
 =?utf-8?B?ZUMyMFU3dSswU1BsaVFNdEk2QUtyVDk5QlcrWlBsV3BJQUtwdXNGRU9RdlIw?=
 =?utf-8?Q?DAynTGWZZL5YxtWmEwcvAdAeTPRUaXnf9PM1i76rhQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED9996B5F6E6104AA33562563C178174@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 577930ad-6bae-4fc0-4e98-08d9ed600ba6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 13:11:41.7259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fsu6axXiLPpJZzJRNdDB5x+K1jF0IPx+JPyx7EkWK2nyfpQM0As1gfdCfeW4vVKVg7g1xfj0ikPSMoDO3bCnvSsqrSwUFInNwR15WlTua3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB4411
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
Cc: "linkmauve@linkmauve.fr" <linkmauve@linkmauve.fr>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "j.ne@posteo.net" <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgQXNoLA0KDQpMZSAxMS8wMi8yMDIyIMOgIDEyOjI5LCBNaWNoYWVsIEVsbGVybWFuIGEgw6lj
cml0wqA6DQo+IEFzaCBMb2dhbiA8YXNoQGhleXF1YXJrLmNvbT4gd3JpdGVzOg0KPj4gLSBMaWtl
IHRoZSBXaWkgYmVmb3JlIGl0LCB0aGUgV2lpIFUgaGFzIGEgc21hbGwgYW1vdW50IG9mIFJBTSBh
dCBhZGRyZXNzDQo+PiB6ZXJvLCBhIGdhcCwgdGhlbiBhIGxhcmdlIGFtb3VudCBvZiBSQU0gYXQg
YSBoaWdoZXIgYWRkcmVzcy4gSW5zdGVhZCBvZg0KPj4gdGhlICJtYXAgZXZlcnl0aGluZyBhbmQg
cmVzZXJ2ZSB0aGUgZ2FwIiBhcHByb2FjaCBvZiB0aGUgV2lpLCB3ZSBsb29wDQo+PiBvdmVyIGVh
Y2ggbWVtYmxvY2sgYW5kIG1hcCBvbmx5IHRydWUgUkFNWzldLiBUaGlzIHNlZW1zIHRvIHdvcmss
IGJ1dCBhcw0KPj4gZmFyIGFzIEkgY2FuIHRlbGwgaXMgdW5pcXVlIGFtb25nc3QgcG93ZXJwYzMy
IHBsYXRmb3Jtcywgc28gaXQncyB3b3J0aA0KPj4gcG9pbnRpbmcgb3V0LiAoTm90ZTogSSd2ZSBi
ZWVuIHRvbGQgdGhpcyBkb2Vzbid0IHdvcmsgYW55bW9yZSBhZnRlciBzb21lDQo+PiBLVUFQIGNo
YW5nZXNbMTBdLCBzbyB0aGlzIHBvaW50IG1pZ2h0IGJlIG1vb3Q7IGhhdmVuJ3QgaW52ZXN0aWdh
dGVkKQ0KPiANCj4gV2UnZCBuZWVkIG1vcmUgZGV0YWlsIG9uIHRoYXQgSSBndWVzcy4gQ3VycmVu
dGx5IGFsbCB0aGUgMzItYml0DQo+IHBsYXRmb3JtcyB1c2UgdGhlIGZsYXQgbWVtb3J5IG1vZGVs
LCB3aGljaCBhc3N1bWVzIFJBTSBpcyBhIHNpbmdsZQ0KPiBjb250aWd1b3VzIGJsb2NrLiBUaG91
Z2ggdGhhdCBkb2Vzbid0IG1lYW4gaXQgYWxsIGhhcyB0byBiZSB1c2VkIG9yDQo+IG1hcHBlZCwg
bGlrZSB0aGUgV2lpIGRvZXMuIFRvIHByb3Blcmx5IHN1cHBvcnQgeW91ciBsYXlvdXQgeW91IHNo
b3VsZCBiZQ0KPiB1c2luZyBzcGFyc2VtZW0sIGJ1dCBpdCdzIHBvc3NpYmxlIHRoYXQncyBtb3Jl
IHRyb3VibGUgdGhhbiBpdCdzIHdvcnRoLA0KPiBJJ20gbm90IHN1cmUuIEhvdyBmYXIgYXBhcnQg
YXJlIHRoZSBsb3cgYW5kIGhpZ2ggYmxvY2tzIG9mIFJBTSwgYW5kIHdoYXQNCj4gYXJlIHRoZWly
IHNpemVzPw0KDQpDYW4geW91IHByb3ZpZGUgZGV0YWlscyBvbiB3aGF0J3MgaGFwcGVuaW5nIHdp
dGggS1VBUCBjaGFuZ2VzID8NCg0KWW91IGFyZSBwb2ludGluZyB0byBzZXJpZXMgaHR0cHM6Ly9s
a21sLm9yZy9sa21sLzIwMjEvNi8zLzIwNA0KDQpEb2VzIGl0IHdvcmsgd2hlbiBDT05GSUdfUFBD
X0tVQVAgaXMgbm90IHNlbGVjdGVkIG9yIGRvZXNuJ3QgaXQgd29yayANCmVpdGhlciA/DQoNCkFy
ZSB5b3UgYWJsZSB0byBiaXNlY3Qgd2hpY2ggY29tbWl0IG9mIHRoYXQgc2VyaWVzIGlzIHRoZSBj
dWxwcml0ID8NCg0KVGhhbmtzDQpDaHJpc3RvcGhl
