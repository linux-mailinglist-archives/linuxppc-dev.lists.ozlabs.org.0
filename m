Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9745700EFD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 20:40:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHyHt4Ndgz3fYS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 04:40:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=p0L8NX2l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::625; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=p0L8NX2l;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHyGy38DHz3fNy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 04:39:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfnGeh2JWyPoewlqWhC8XRs6p6avn/Mp9rkifgDvyOgZoKqTXkAx7HgYOx8HXsf6slki3ULtC0cKckaV/nAX5zLwFF5yBI4u1MhEQd7pZ5nms2iHcKOQFO9G/P/LQQ/FNdF/ZMOr6zMssJ788lI9UIhPUahGU8dTf1cKdLNQ+JC2uZfJG+Z62fsxyPDo6QryS4oOrvxaGnoCiYP5VTRkpsydOisIMPkUcsKq6VazICW7OEus5jZ7BKMJ7PYmfeKvF3f7WnyiPAervk+lxXaayQ0hQdGigtaSLKjCa/s8JFW9sB7MODEe6jb6QZGyqiOwqDT7gdGlBKuCE64UwKw8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qfv6XuLwp5nIaz97l48PzMBiT64UrWO8h+pnOdJ6fo=;
 b=Mqb2bT0rZl9UhvdfD7YlSqeLZ/B5r1Pe8g39ZBLNNOZ9SOOJZeb7tKtoAkc7smfrmfL+TtLGZpJmYm2RSE5DRLbTfHVY2b2YEE5Kao6PSWngrhqcj0Y4cWOluDhOxsnHe+oguGsHJrOQoIFHCSgDrvvps3abarTTXmNbtX9aQfrtbUjBZLmrFWvgDdDQEC5ksd7IPhkHqYz0hYgJFI0cPgkz/ukqVriSrmUwx3lLu3+ZVAjOu9et7MKj0z4YItyvLRFpbj1OVbzAQH9pZged03IWqbDG+1DgfC9Pimnm+fGv0eWzL60rpg/8AhCBw9K15vKmQo7E3GQGSSP2aW9YXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qfv6XuLwp5nIaz97l48PzMBiT64UrWO8h+pnOdJ6fo=;
 b=p0L8NX2lHJfduNUZMDVlX64L4uXymUSdvE1wFeHQM7tedehA3NP84kEPpCinKri2mNfdASn91t/Y09er7lrFjR+x6LjahZOEcWtld3XL/llIHBAMKHp1TTAXTqBoMm466IYxRyL9tH86xe6ELIF1gutptL7vYn2h5qFul8T9oTwVTXBXDgIYayssGL1kUlX20UzpPZsDtqnJY+NUTlf1jC0GJouF+xPbTMdxk/K+Z+RTcR+g3sTZ5jPvu/WVgzgu812dvzNv4e4MLEAM0KSPHkKAZe10kkzWUKHwceXlrSmrlIpBoT5se+dBEDJIs8g3vozwLdXPdtKgHDuy++Nuxw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3169.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.25; Fri, 12 May
 2023 18:39:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243%3]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 18:39:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Marco Elver <elver@google.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/3] kcsan: Don't expect 64 bits atomic builtins from 32
 bits architectures
Thread-Topic: [PATCH 1/3] kcsan: Don't expect 64 bits atomic builtins from 32
 bits architectures
Thread-Index: AQHZhObYG9e/mwHrHEeZ3NvtNork5K9WzokAgAAptYA=
Date: Fri, 12 May 2023 18:39:05 +0000
Message-ID: <662d074e-58cf-3bde-f454-e58d04803f34@csgroup.eu>
References: <cover.1683892665.git.christophe.leroy@csgroup.eu>
 <d9c6afc28d0855240171a4e0ad9ffcdb9d07fceb.1683892665.git.christophe.leroy@csgroup.eu>
 <CANpmjNMm-2Tdhp6rDzA7CYvotmmGmLUnZnA_35yLUvxHB=7s0g@mail.gmail.com>
In-Reply-To:  <CANpmjNMm-2Tdhp6rDzA7CYvotmmGmLUnZnA_35yLUvxHB=7s0g@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3169:EE_
x-ms-office365-filtering-correlation-id: 22ecdda8-31e2-4f21-d28d-08db531829ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qQt54OYzxLswlRwhkrLzUIa8OmQRg1bmmGLwRrnB+tGZTobhblHYCdukGwN0CZ8heRKcGu85+JQ6dmbw3le7XACT0s5c8A/F1EIK6M9HNfD6BbWFQVFo9RucUJ9rSspQCRu5ECtF+bTh20fR7OT3ILEPdT8mdvw0PEtsC5e67jtxF8r2xS5o8tAY8wTsjaD13c5I8EPqOK5WXZnMKHl4L2MT7cDiHdQ+NzakkKrXze9bo5NEUYcFjaEQe0fXKqyjvMjR1yEOYQ3+2X0XFink+mkIwF7zb9jniFH5ErqnHQN2CGVXjsepLplMcXtxwqcVOYaRjWuy7KIdYI56/XsoRzdZ0XzJemcEFEiA14OR4Day3xHYbqQ6tA98IR6i/6rMiaanjVujk6AIAyzkRkrQKETpQ0d8CDCRVH2FKEEXydMcIybqZ1yA2ZxbeAopZO6fcUmUp4NqUEjX4pI2C1jOVuYBA5pJ+rNXNXds8id6F1lV1DyMJSYRjAfdRQTiSfogWJ6N7etVKxfiUFoLi6/ql7M0viNpeRqJym1586JxikXn5e54zbpUElVNlYIzY7wgDjrhmjDzi++DWQVj2UZKtfdaHoAhXiIkz2Ig7yuQe/5jFQi+W5a3ZrS8AqdFEhMSTd59/jUCeaG5edKAcz3o9DGTdNhCrEipdE4FeFGJzNBi5uCvOTu4STd2FhIB0zEh
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199021)(54906003)(5660300002)(6486002)(91956017)(41300700001)(478600001)(110136005)(31686004)(71200400001)(44832011)(8676002)(7416002)(8936002)(186003)(2616005)(2906002)(66574015)(83380400001)(76116006)(66946007)(66556008)(66476007)(66446008)(316002)(4326008)(64756008)(38100700002)(122000001)(38070700005)(86362001)(6512007)(6506007)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?djdBT1VSWGtKUDhmRU9qd1RRQjVtbEVuMkpLZVR4cG4yczBIb3JVQVlkWGJU?=
 =?utf-8?B?UlBCZ2tWc2k4VlNOQnZ4NVA0T1Q5SW5tMmpXQlM2YUpqRVBkc3ZRWlJYbndT?=
 =?utf-8?B?K1lLS21BWDYwUExKNitkTHc0cXg0Z2tOR1czU3VYVGVGNEZvdkdGMWlUUHpi?=
 =?utf-8?B?WEd3NllUMExyV2g3NWlmdyt2c1p3VGZ2azZ1aTR1RTNnOGgxNlpvRmthSjdG?=
 =?utf-8?B?SDRuekRyb2dWczIwS3ZqT1ZlcFR5KzRXK2dBZ3U2ZmtSTDU2NEZNT21qalh2?=
 =?utf-8?B?WGdKaEEvOGc1UEdGMktrM2M1TkM1dDI2ZUgySnVvZkhsM3FmSlgvWXhrQ1k2?=
 =?utf-8?B?Vk9vVDIvZ2ppVlRmZTVkZVM0MHVYcmVrdFF0TUZFMjRuMGJPeVluazNwbHF2?=
 =?utf-8?B?aEhZRHVrZlI5SnBtQm12N2xreUs1NjRBNXdWcE5QNWlVYjhza3JEcjBiSG84?=
 =?utf-8?B?anByL2RIYlBGb0dDZ214UXFQbVRWem9yZ0VxNU05UXVCVjRDOXdWblE4VDlR?=
 =?utf-8?B?KzBuWDg4ZldFTXJXUEV2VG4zc1VtY05sZzgyZStlVjgrMlc2b1NMalJJVHBQ?=
 =?utf-8?B?VVZLTFYvTTVJcG1Bb3V3aEEwYlM3clpkTklwQnRsRFRsNk9yQVFNaVBTS29s?=
 =?utf-8?B?enM4T24yMnRQMjllY1IvTVBma0d0V1dtb09kUE5Qc2JGck0xUTdWSi9CRXJ6?=
 =?utf-8?B?aEM0bkN6SmNQTFVsaTRQRGlLZXZnM1I2SWIzRjlnQndQVkh4MUtOaWxVRmh1?=
 =?utf-8?B?Ni9KalRFK2VxbFhQL0lpMTh6ZU92aEpTelV1ZzBwUVNNeVNkV2s2YnlSd0c4?=
 =?utf-8?B?SlRyRlVOaVZ1dDRxbnlJeUFMOW0rUlVBRm1ZeEo4emNFU0IvYTcrbGg0d3lW?=
 =?utf-8?B?VkxKM1cwdi9hdEpEaDNTaWtVZFp2Z3pnZTg0SUdRRVozTU43ZTVwZS93MjR2?=
 =?utf-8?B?S0FVNEZra29xcW1uSWNsU1Y1TCthRFVSbTRRTHZUQXFmZDJPSXpuVVBWaGNZ?=
 =?utf-8?B?SkMzYTZIQldLTXhLVk9jMmZ4MHVxUHh5T1NaRmlISFBhSHM5QitNSWI0K1NJ?=
 =?utf-8?B?Wk11YWh5MXd6Q0RGV2QxZlN4bi9OMDFMbytTMFhvcTdnMVBvb3luZEZNZzAx?=
 =?utf-8?B?am8yTjN0NVZkWVUvUG1pTCtjVmsrVTFKQTQ4QUlTN3RmUGRjWksyb1BQcHVN?=
 =?utf-8?B?S2NlcjhxTGl3WVd5WlR1T0xGM0VtV3VFcnBqdnd4YlNEMDdXT1JBMnFJa3Vy?=
 =?utf-8?B?aXg5Sy9Na1pXSmtyaTcrUW1qWFBGMWhyUmlUUzJFUGtYVElTMXNhdW1LVHNp?=
 =?utf-8?B?RDNYMGVGTkFHREFIWThvb3A2cTE1U0Z6QSs4U256UURXcCtOeUR0MEJqSWJ6?=
 =?utf-8?B?a3JvRzk3R0EySG5OeGpMMjB0cG9ERTl5WGgrekJjOEppUi8vQ3g1TSszZllp?=
 =?utf-8?B?eGNxb0lmeEZoclgzTVdVbzRvbU8rY3hvbGY1aWtHSThBZGZtQ2Z6anZpTmxo?=
 =?utf-8?B?Um1JamdCMElLcWdXOThrRnEydTA1VG9BNHh6OHYrOVdVRTFnM2ExbXFmTkF3?=
 =?utf-8?B?bnZwOE5jMk9hVFQ5RU4yMURNdXV5bEZGUExac1AxOVVVSjlqaEdxV1lVREk4?=
 =?utf-8?B?QTVvV09rMS8zZVRLNGwrU3hCZ3NLb0l0UFNkc2wzY29lOGN1QmZwWTF2RFlN?=
 =?utf-8?B?RjFuTjM3VFZjQmlwS0JWT0lEWGpvVldMQUVobTVuMGp6R3pYZmx5a1pRS1VM?=
 =?utf-8?B?eE1VdFRSK2YydjJDdnYxM1U5bjUvMHVueFB6aGViQzE1UjJpTTBIRVBUU205?=
 =?utf-8?B?WkNDNTd1T0xueVo3dVZvVWVnNlVwbTYxeHhXSGdWTkpCRDBzNkhHT3d3OWxI?=
 =?utf-8?B?MW4zbFBZZUtQVktIK0ZiVWtsTm9xeFZBam1YcWlPdm9nellyZ1JNVjhaOS9n?=
 =?utf-8?B?ZW4zRmM1bFV1TmxEOXRlb2dnK0JlQVErZEpVeGwvTG42TUJjR3RVSUlpV3l6?=
 =?utf-8?B?VlJISTRjQ3VvcXA5ZmFRWUpnVmF2dlYyT3VRZUtCVUgrekpQank5d2pWa2Z0?=
 =?utf-8?B?K0pSbGZQcDZlUExKZWMzUkdoekUyL0FTU2MvSFBQdnJSK2NUSllXNVllMTBM?=
 =?utf-8?B?YTFLQkZtNmFjSmFPcVZDbFp1TlpDSHJUT2JQNEUzdGlhVTBaWXpMc2Q4OUsw?=
 =?utf-8?B?NjgyclJWNzhUV25UZ2JFK3VHZG1yd2VadlhndFZRUnZFTlIxL1lqTVExUTJt?=
 =?utf-8?B?L1o0U1J0ejI4SmE1NFF4eTA5QWVnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFD821636717334C9060DDD10CC0CED1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ecdda8-31e2-4f21-d28d-08db531829ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 18:39:05.0133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FzoLI5Mxw77jc80c0b2uWjGFN53Tua3WUJGHLYFZcUfPEr6olnRt5n2VW7J/AGcRB8bvKYwyOxbYuhU/WyRUdI7bTONnSaEnuSShZbgZgic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3169
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
Cc: Chris Zankel <chris@zankel.net>, "Paul E. McKenney" <paulmck@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA1LzIwMjMgw6AgMTg6MDksIE1hcmNvIEVsdmVyIGEgw6ljcml0wqA6DQo+IE9u
IEZyaSwgMTIgTWF5IDIwMjMgYXQgMTc6MzEsIENocmlzdG9waGUgTGVyb3kNCj4gPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6DQo+Pg0KPj4gQWN0aXZhdGluZyBLQ1NBTiBvbiBh
IDMyIGJpdHMgYXJjaGl0ZWN0dXJlIGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcNCj4+IGxpbmstdGlt
ZSBmYWlsdXJlOg0KPj4NCj4+ICAgICAgTEQgICAgICAudG1wX3ZtbGludXgua2FsbHN5bXMxDQo+
PiAgICBwb3dlcnBjNjQtbGludXgtbGQ6IGtlcm5lbC9rY3Nhbi9jb3JlLm86IGluIGZ1bmN0aW9u
IGBfX3RzYW5fYXRvbWljNjRfbG9hZCc6DQo+PiAgICBrZXJuZWwva2NzYW4vY29yZS5jOjEyNzM6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYXRvbWljX2xvYWRfOCcNCj4+ICAgIHBvd2VycGM2
NC1saW51eC1sZDoga2VybmVsL2tjc2FuL2NvcmUubzogaW4gZnVuY3Rpb24gYF9fdHNhbl9hdG9t
aWM2NF9zdG9yZSc6DQo+PiAgICBrZXJuZWwva2NzYW4vY29yZS5jOjEyNzM6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYF9fYXRvbWljX3N0b3JlXzgnDQo+PiAgICBwb3dlcnBjNjQtbGludXgtbGQ6
IGtlcm5lbC9rY3Nhbi9jb3JlLm86IGluIGZ1bmN0aW9uIGBfX3RzYW5fYXRvbWljNjRfZXhjaGFu
Z2UnOg0KPj4gICAga2VybmVsL2tjc2FuL2NvcmUuYzoxMjczOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBfX2F0b21pY19leGNoYW5nZV84Jw0KPj4gICAgcG93ZXJwYzY0LWxpbnV4LWxkOiBrZXJu
ZWwva2NzYW4vY29yZS5vOiBpbiBmdW5jdGlvbiBgX190c2FuX2F0b21pYzY0X2ZldGNoX2FkZCc6
DQo+PiAgICBrZXJuZWwva2NzYW4vY29yZS5jOjEyNzM6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YF9fYXRvbWljX2ZldGNoX2FkZF84Jw0KPj4gICAgcG93ZXJwYzY0LWxpbnV4LWxkOiBrZXJuZWwv
a2NzYW4vY29yZS5vOiBpbiBmdW5jdGlvbiBgX190c2FuX2F0b21pYzY0X2ZldGNoX3N1Yic6DQo+
PiAgICBrZXJuZWwva2NzYW4vY29yZS5jOjEyNzM6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9f
YXRvbWljX2ZldGNoX3N1Yl84Jw0KPj4gICAgcG93ZXJwYzY0LWxpbnV4LWxkOiBrZXJuZWwva2Nz
YW4vY29yZS5vOiBpbiBmdW5jdGlvbiBgX190c2FuX2F0b21pYzY0X2ZldGNoX2FuZCc6DQo+PiAg
ICBrZXJuZWwva2NzYW4vY29yZS5jOjEyNzM6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYXRv
bWljX2ZldGNoX2FuZF84Jw0KPj4gICAgcG93ZXJwYzY0LWxpbnV4LWxkOiBrZXJuZWwva2NzYW4v
Y29yZS5vOiBpbiBmdW5jdGlvbiBgX190c2FuX2F0b21pYzY0X2ZldGNoX29yJzoNCj4+ICAgIGtl
cm5lbC9rY3Nhbi9jb3JlLmM6MTI3MzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19hdG9taWNf
ZmV0Y2hfb3JfOCcNCj4+ICAgIHBvd2VycGM2NC1saW51eC1sZDoga2VybmVsL2tjc2FuL2NvcmUu
bzogaW4gZnVuY3Rpb24gYF9fdHNhbl9hdG9taWM2NF9mZXRjaF94b3InOg0KPj4gICAga2VybmVs
L2tjc2FuL2NvcmUuYzoxMjczOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2F0b21pY19mZXRj
aF94b3JfOCcNCj4+ICAgIHBvd2VycGM2NC1saW51eC1sZDoga2VybmVsL2tjc2FuL2NvcmUubzog
aW4gZnVuY3Rpb24gYF9fdHNhbl9hdG9taWM2NF9mZXRjaF9uYW5kJzoNCj4+ICAgIGtlcm5lbC9r
Y3Nhbi9jb3JlLmM6MTI3MzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19hdG9taWNfZmV0Y2hf
bmFuZF84Jw0KPj4gICAgcG93ZXJwYzY0LWxpbnV4LWxkOiBrZXJuZWwva2NzYW4vY29yZS5vOiBp
biBmdW5jdGlvbiBgX190c2FuX2F0b21pYzY0X2NvbXBhcmVfZXhjaGFuZ2Vfc3Ryb25nJzoNCj4+
ICAgIGtlcm5lbC9rY3Nhbi9jb3JlLmM6MTI3MzogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19h
dG9taWNfY29tcGFyZV9leGNoYW5nZV84Jw0KPj4gICAgcG93ZXJwYzY0LWxpbnV4LWxkOiBrZXJu
ZWwva2NzYW4vY29yZS5vOiBpbiBmdW5jdGlvbiBgX190c2FuX2F0b21pYzY0X2NvbXBhcmVfZXhj
aGFuZ2Vfd2Vhayc6DQo+PiAgICBrZXJuZWwva2NzYW4vY29yZS5jOjEyNzM6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYF9fYXRvbWljX2NvbXBhcmVfZXhjaGFuZ2VfOCcNCj4+ICAgIHBvd2VycGM2
NC1saW51eC1sZDoga2VybmVsL2tjc2FuL2NvcmUubzogaW4gZnVuY3Rpb24gYF9fdHNhbl9hdG9t
aWM2NF9jb21wYXJlX2V4Y2hhbmdlX3ZhbCc6DQo+PiAgICBrZXJuZWwva2NzYW4vY29yZS5jOjEy
NzM6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYXRvbWljX2NvbXBhcmVfZXhjaGFuZ2VfOCcN
Cj4+DQo+PiAzMiBiaXRzIGFyY2hpdGVjdHVyZXMgZG9uJ3QgaGF2ZSA2NCBiaXRzIGF0b21pYyBi
dWlsdGlucy4gT25seQ0KPj4gaW5jbHVkZSBERUZJTkVfVFNBTl9BVE9NSUNfT1BTKDY0KSBvbiA2
NCBiaXRzIGFyY2hpdGVjdHVyZXMuDQo+Pg0KPj4gRml4ZXM6IDBmOGFkNWYyZTkzNCAoImtjc2Fu
OiBBZGQgc3VwcG9ydCBmb3IgYXRvbWljIGJ1aWx0aW5zIikNCj4+IFN1Z2dlc3RlZC1ieTogTWFy
Y28gRWx2ZXIgPGVsdmVyQGdvb2dsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+IA0KPiBSZXZpZXdlZC1ieTog
TWFyY28gRWx2ZXIgPGVsdmVyQGdvb2dsZS5jb20+DQo+IA0KPiBEbyB5b3UgaGF2ZSB5b3VyIG93
biB0cmVlIHRvIHRha2UgdGhpcyB0aHJvdWdoIHdpdGggdGhlIG90aGVyIHBhdGNoZXM/DQoNCkkg
ZG9uJ3QgaGF2ZSBteSBvd24gdHJlZSBidXQgSSBndWVzcyB0aGF0IGl0IGNhbiBiZSB0YWtlbiBi
eSBNaWNoYWVsIGZvciANCjYuNSB2aWEgcG93ZXJwYyB0cmVlIHdpdGggYWNrcyBmcm9tIHlvdSBh
bmQgTWF4Lg0KDQpNaWNoYWVsIGlzIHRoYXQgb2sgZm9yIHlvdSA/DQoNCkNocmlzdG9waGUNCg==
