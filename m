Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8837B477465
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 15:24:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFDsB3dqTz3cP8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 01:24:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFDrf5VPyz3051
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 01:24:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsYqbkwoU6SKcGaoVaFOy/23Qfm4wraLQnfjTtFojLGhZm1EQG8dqpHWvA9T8Ow/CClN80azLXEzcbtcLaeNwscU+3//rlZJjg0gVi4i7vWw5hOybFYLqPMtA0rVc2+grlZs8xuSPNwhe1+2rmEXfvY3IQ9qXRa/IjE96GxcrBhMZKeIZG5f86Kd7ZiTm/uz/feB0OYpXJnRlM/+cz4RQ85w8XzjZn2NaGNFnRQd/2iAqlGU6H0i5zK2NK9Ju+SrmBjIkum9M2uyowZYRQFTsT4LwdyAfFfKdimExqUMXbUNRgD8S5nbL7DCoXKE0maJgJVxuXxk88EGtURoklHL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gt7/8Kz/Rm5X83sKK6IFQswZij0jLVKaDt8LeckCL+Y=;
 b=A+6YGJ3Oy5ThgkqvdfsO8QZq8Wxb5vPyiZSB8JuUzs3F5Gx7SBjdKD/3lkEREnEOGMXV5GIe1vCekVAjhtAlJ7UEPuU8sufZIEGUb3Xw8N/CWsYbqC5P9HGgezUqz/UN9R6PVbjgGEbH/XqpA7HlbE5QRjRO+E14nz2+hXE/a8sCUBuaSyH+40B9JaqdV+qbT0i9FSo+JGF9oEDzeGB9D7gYfoiUB4L0Ct1WtQTjSBwy5M9gtER5UAWnLi8KPzjrsV0aWse2bLOsHVCWAXW+n0nF8wucLVdqZgIqFpA+t46Stz+JresjlG5dMhoc5uRf/lK3SP42WvOO77ICFP9hYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MRXP264MB0038.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:23::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Thu, 16 Dec 2021 14:23:53 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8%2]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 14:23:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kw@linux.com>
Subject: Re: [PATCH 1/2] sizes.h: Add SZ_1T macro
Thread-Topic: [PATCH 1/2] sizes.h: Add SZ_1T macro
Thread-Index: AQHX7EB14E671PmylUi/GGPQpSm/KawpGf2AgAwenIA=
Date: Thu, 16 Dec 2021 14:23:53 +0000
Message-ID: <b32bd540-ca84-8de4-00b8-500a8cfdaf79@csgroup.eu>
References: <b03f5cf556f1a89ccb4d7ae2f56414520cfd9209.1638973836.git.christophe.leroy@csgroup.eu>
 <YbEhUeUy7PlOk2iR@rocinante>
In-Reply-To: <YbEhUeUy7PlOk2iR@rocinante>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d39564f4-858c-4a8a-6f08-08d9c09fb042
x-ms-traffictypediagnostic: MRXP264MB0038:EE_
x-microsoft-antispam-prvs: <MRXP264MB0038B53A239C238C719DD913ED779@MRXP264MB0038.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j0OxsL7/5zC+l7Tq9QR+sfJrvaxqMpvXiERsiuVw6eIBwKEvLxanG4I7CiW6atIH4Lr++CF1eEIaYauh+/F5sm9amgoh5NZV9Cu+zKwsgOcCXdqp4Ykoj+HfOuZQWfn1ZWo11sMnXxMprea5w1emP0fpURVBu4qm/EAkSxSHk/0yN1kcwhJjGreT1irXh6C22IVcpeH297RaMYca3MZrJJ3BoKy4erkiyFHb4L5DnC1Ex7pSgrn52/HQmfqwfYRjYe+20EwTFIldqzcuUvcdoHHV6/Fvjgzpr8xUkVvTAJO/zkJZU4K0AGXVsyCWZPm6tcnK90GWqyhAG9BRld5gLUixM7qdfzHsL8eTRLLVjLEggRgmyqo2AZ/iMq/u+PjFuBAmvSzqT34xvAvpQGYOk2hUtBFbRHOQAvUg3gCPanhjB0DC0EeVZUJPzsgnNqr+N1tYqYX8Iw281Dnvt36QGOwPeEW/H7eEHF7CpxwITFmOvrkb/advevQgmX7LTW0szc5Wt5oE1af2RulhPtFlUoAPtsfqiOdQerxaxIYTZv5GsBS4aim6t6gZXmoeQfTMmXHANacli9SfK3alezzx2LdVvbd2w1N09OPSEVE0gxYogOZzAEXHLEp5GD8fD8eEDyU4CTPVnqa77QU7WHDqHkClogM2OjOHRN+CDyEAHcPw+5uCJI+18g03qD6tsgyxGm+T5zeIStuz6xI4MFTaRnb9RkyfWObu5KHtVXAtGBY1Baspafbkgl5mxyHRuTY8JK8HMf+8zIdLZx6kP6/Hp0QLoLOWrWI+A1Jqcaj4wFfaG5lK0l9V8Lmp79wgurIi+uFPfvALAcsg+/DmfFnoeK6S1ahmEeF6wU9sl9xcKxw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(64756008)(316002)(6512007)(966005)(6486002)(38100700002)(8936002)(54906003)(2906002)(26005)(2616005)(31696002)(76116006)(91956017)(66476007)(66556008)(6916009)(8676002)(86362001)(31686004)(66446008)(508600001)(122000001)(186003)(71200400001)(44832011)(5660300002)(36756003)(6506007)(4326008)(66946007)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cllvTnBSSFNwdUxkQ00zcWZoTE1Oa3pSd01ZRlVTSklSdWRSQ2tBR28rdXBr?=
 =?utf-8?B?czY1VFprUEZFSXd5bjJWbDlOczdHdXdGaXFEekt6K01zVFFmNk1kVDN2RHBi?=
 =?utf-8?B?a0FXWkRoaDVjU0x3YVpJTlN5dkpEdlFyR3RhM0VXOFVQR2VNdVdCdk1iTURq?=
 =?utf-8?B?T0xkRU1qZTRsU2pwV3VPRy9DVSs0WkxEWWdyZHNDMlRhRkErU3FiWUFvWHY2?=
 =?utf-8?B?NDgwcmFpdlhSQkltU0xOUW1KSXlzTW82blg0RXNCNWN6bloxU3hudGZvbjhr?=
 =?utf-8?B?QjFQNFkvZmtjWVFaYmhUQWRKQ3BFcnVVWFFtdnlnL21LUDhCalZ0bGk5aXFW?=
 =?utf-8?B?a0ZNazFqekVMR0xXUHZWOVhNQ0pnbkZ6Q1pVdjlKOUdTc0l1Q0w5WThiVE5v?=
 =?utf-8?B?bS9OdU01T0I1RVZxRHE3YXJSaUIycWw4SlFGNkhEUU1peFdrNm04Z3dTMmp0?=
 =?utf-8?B?SHhpTnB6QkVUZ2RYUGdDU2FZcmM0SlNBUGVhWTZFOWIvR2txUnlJQWh3bjhp?=
 =?utf-8?B?dHcwdXN6Uk8rVG9ZYmFhcEg3RzVXZW9wQ3JaWGdObU1mMmRvRjBkeUhDRjJl?=
 =?utf-8?B?aWI0U3ZPZkF3Ykw4bjNUMUd6amV2RzQwU1c2ZHVLRnp0RXJLbmF3K2w1ZUpq?=
 =?utf-8?B?U2ZmbzROZVcraXBjVnlSVzVaWFlONXhhOFFlb0RtaHFuRHRZYXB0R09zZ2VB?=
 =?utf-8?B?dTFrRVdCbE1BUldsUVB5T2FSdktrVVJvSlZHTzJhUTR0ZEkxSEM0cFh1ekhq?=
 =?utf-8?B?K3B4YVgwbXkzbmNlREtYc092NjdsYklpOGljSTZka2tFN2M0QUhONTlkRDA2?=
 =?utf-8?B?LzJmRThKZUVOMlZ6d1MvR3dnUWVEb2dvVDBwZ3FVWjVGTWNHTEpqQ285K1lI?=
 =?utf-8?B?NklDbzdmQ0NENUpaL3dwWGY1N3RSOHo5Z3V6TjhhVlc4MzZGMjU1cVJ6Rk5p?=
 =?utf-8?B?RmxQSmFTYWdEL1NmaXVsL2ZOaTBDTVRtdHEvc3BBUGk3TDlndEhmZitMb3hZ?=
 =?utf-8?B?c1dZQlZTclNldk9vUTR6dHkrd254bzZteThZNlJJQ00waHdzSXlTTEpHRlVu?=
 =?utf-8?B?QkFaQXBYSWlXT29aVTNLMmZNMnNzR1QzbDl6akJZeHhuLzgwcUNHZXNuZ2dH?=
 =?utf-8?B?VDdya1JycHFiRFJnRENlQXh2Rk0vUTdkM2hqYzhUeHNHS3QyMUhJRUU4NSs0?=
 =?utf-8?B?YnJVdlF3ZWZNdEtLOGI3TTVwN1BuQkhIT3M3K2xhdGlnWWk3WTVFV0J0WEJP?=
 =?utf-8?B?Zm55RkRobXRsUXcycFNqTGhiUnNwQjB0RFQ3L1BpWUVhQ1ROdEtuSXhQY2pY?=
 =?utf-8?B?S2pUVDNiNUxvaCtaQko4UFQzdEl3VjJBcUhVWEhOdmtXeGxTSmVCeXJFazJE?=
 =?utf-8?B?R3pWaDR3WWNzUTlEdkVrdzlzWmx6NHZwWjRka1RBZkZia29rVmZ0VDY4ZmlS?=
 =?utf-8?B?Tll1UlR2Wml4WDh3bEdYTnhpRTYyaFdLRGxCNDYyT202aG1FQnBtS1d3OUJL?=
 =?utf-8?B?SFJsQ2twb1VKRlFzdnRVV25JVG5UeTR6Rms5M2E2cXpMdE9KVkNrOVljUTRy?=
 =?utf-8?B?M2l3ZjBQckxvTDB2ZVRtZG1YRU9aUGlVd0V4UkF2aEdXSlBtZmRwNFl5Wnlu?=
 =?utf-8?B?dkw5UTdJRmUyZ0puOUM3eFVUODNKZkxnQkpGZCtuc2E5TTVLbHpiUUx4aFlH?=
 =?utf-8?B?eldwMzU5d2YzMENZNEJNZnRoNHhuNEtiK2NqOWxteDE0cW1CeTJoeGpsZ0Vm?=
 =?utf-8?B?RTlTeEtHdHQyV2c2YzN0aTFNY2haTXlXVi9WUDJNd01iT1RoRlJQeFBzUkJw?=
 =?utf-8?B?Rnp6KzIyUmVWSDU2UkFTK3JpdDRKem4xQ3hxSllmWHV4TVcvRU1sZjZxdkVx?=
 =?utf-8?B?a2VRWTdwL04yMjcvOVh3eVc3WEEweUd1ejIzNlNHb1d3dEVHeG5KcU9BM0JE?=
 =?utf-8?B?SWNGMDI3Nm9Yb3U2THZNc3pyUm1PT3VNOHg0UWU2L1VhTzYrTTcyR1pVT2x2?=
 =?utf-8?B?UFZkRSs5djRDT3JEc1Jka1RVSkZITW5WbHNkaTFKT0RtVmY3TlBBem1MSzNE?=
 =?utf-8?B?azBDRjhUL0hPT2kzMjlkQTNlMkNaSTd6Smc1NCsreitnSDgvYjNKR1ZaU0hz?=
 =?utf-8?B?UThYNHd0U01QTFlWOGJPUGI5NnZCOXFZZVg3dWZ5VDNoQVJld2NoY0hZT3Jn?=
 =?utf-8?B?SU1YbEZIMm9JUFFZQUlBb3JqME90c0EwSlc4eEFQWW9zdjRSZEpxRFc3Nklp?=
 =?utf-8?Q?xLoj2/TxmR75qN/udOK/3T5qUKKnDwwxqLiNl9br1Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <355C3C06615C43448986A1837CB0F7CF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d39564f4-858c-4a8a-6f08-08d9c09fb042
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 14:23:53.8465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zQQX2E34KmNLkM47vbmMA18fJGoC3iUoiRCDhMj1RRHpznOi6oXtDwdmm5wA3SZaFQFE4p+zjufcunv+Tt544P6QpYHGJPFQnlXlnMT4fPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0038
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
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Toan Le <toan@os.amperecomputing.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzEyLzIwMjEgw6AgMjI6MTksIEtyenlzenRvZiBXaWxjennFhHNraSBhIMOpY3Jp
dMKgOg0KPiBIZWxsbyBDaHJpc3RvcGhlLA0KPiANCj4+IFRvZGF5IGRyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvcGNpLXhnZW5lLmMgZGVmaW5lcyBTWl8xVA0KPj4NCj4+IE1vdmUgaXQgaW50byBsaW51
eC9zaXplcy5oIHNvIHRoYXQgaXQgY2FuIGJlIHJlLXVzZWQgZWxzZXdoZXJlLg0KPiANCj4gU291
bmRzIGxpa2UgYSBnb29kIGlkZWEhDQo+IA0KPiBCeSB0aGUgd2F5LCB0aGVyZSB3YXMgYW4gZWFy
bGllciB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2gsIGRpZCBzb21ldGhpbmcNCj4gaGFwcGVuZWQ/ICBJ
IHRoaW5rIHlvdSBzaW1wbHkgZXh0cmFjdGVkIHRoZXNlIGNoYW5nZXMgZnJvbSB0aGUgb3RoZXIN
Cj4gc2VyaWVzLCBjb3JyZWN0Pw0KDQoNClllcyBpdCB3YXMgcHJldmlvdXNseSBpbiBzZXJpZXMg
DQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2xpc3Qv
P3Nlcmllcz0yNzQyMjkmc3RhdGU9Kg0KDQpJIGRlY2lkZWQgdG8gcHV0IGl0IGFzaWRlIGluIGEg
bmV3IHNlcGFyYXRlIHNlcmllcyANCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVj
dC9saW51eHBwYy1kZXYvbGlzdC8/c2VyaWVzPTI3NTgyOSZzdGF0ZT0qIA0KYmVjYXVzZSB0aGUg
Y2hhbmdlIGluIHBhdGNoIDIgaXMgaW5kZXBlbmRhbnQuDQoNCj4gDQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2kteGdlbmUuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvcGNpLXhnZW5lLmMNCj4+IGluZGV4IDU2ZDBkNTAzMzhjOC4uNzE2ZGNhYjVjYTQ3IDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2kteGdlbmUuYw0KPj4gKysrIGIv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2kteGdlbmUuYw0KPj4gQEAgLTQ5LDcgKzQ5LDYgQEAN
Cj4+ICAgI2RlZmluZSBFTl9SRUcJCQkJMHgwMDAwMDAwMQ0KPj4gICAjZGVmaW5lIE9CX0xPX0lP
CQkJMHgwMDAwMDAwMg0KPj4gICAjZGVmaW5lIFhHRU5FX1BDSUVfREVWSUNFSUQJCTB4RTAwNA0K
Pj4gLSNkZWZpbmUgU1pfMVQJCQkJKFNaXzFHKjEwMjRVTEwpDQo+PiAgICNkZWZpbmUgUElQRV9Q
SFlfUkFURV9SRChzcmMpCQkoKDB4YzAwMCAmICh1MzIpKHNyYykpID4+IDB4ZSkNCj4+ICAgDQo+
PiAgICNkZWZpbmUgWEdFTkVfVjFfUENJX0VYUF9DQVAJCTB4NDANCj4+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3NpemVzLmggYi9pbmNsdWRlL2xpbnV4L3NpemVzLmgNCj4+IGluZGV4IDFh
Yzc5YmNlZTJiYi4uODRhYTQ0OGQ4YmIzIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9saW51eC9z
aXplcy5oDQo+PiArKysgYi9pbmNsdWRlL2xpbnV4L3NpemVzLmgNCj4+IEBAIC00Nyw2ICs0Nyw4
IEBADQo+PiAgICNkZWZpbmUgU1pfOEcJCQkJX0FDKDB4MjAwMDAwMDAwLCBVTEwpDQo+PiAgICNk
ZWZpbmUgU1pfMTZHCQkJCV9BQygweDQwMDAwMDAwMCwgVUxMKQ0KPj4gICAjZGVmaW5lIFNaXzMy
RwkJCQlfQUMoMHg4MDAwMDAwMDAsIFVMTCkNCj4+ICsNCj4+ICsjZGVmaW5lIFNaXzFUCQkJCV9B
QygweDEwMDAwMDAwMDAwLCBVTEwpDQo+PiAgICNkZWZpbmUgU1pfNjRUCQkJCV9BQygweDQwMDAw
MDAwMDAwMCwgVUxMKQ0KPj4gICANCj4+ICAgI2VuZGlmIC8qIF9fTElOVVhfU0laRVNfSF9fICov
DQo+IA0KPiBUaGFuayB5b3UhDQo+IA0KPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIFdpbGN6ecWE
c2tpIDxrd0BsaW51eC5jb20+DQoNClRoYW5rcw0KDQpDaHJpc3RvcGhl
