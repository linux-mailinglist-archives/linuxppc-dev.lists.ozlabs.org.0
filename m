Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D49805176C7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 20:46:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsX9y5b6Rz3bqg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 04:46:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::605;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::605])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsX9R4wyrz2xKW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 04:46:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYzbCbtA88Sg+EfC9+Ff0zj+wzwJZKbKys1y9Gm08NLNSuufx4LQ4J3fo/Y+L61ZgztpwE7hOOwLXd0SnVVAvJ8wPSkaRQnUxUnROXlcoB3rr1izMD4B4lSA/BZrCkgwjR1XFbmnuyvq6JKixkTFT+CPx3A+zw5+wecjIki0H6UNpDRQWswDl07JDXFyZHSdod2+7TWSHZ/3BVCa9j9m89pf/tz9VH7P6AHPR7c1vC1G5KXJ2w085wene9JSS8cUO6xcv/xtkQZ3ki/jr8EKkPF49RvA8eX5jbwOQLlvlC4b9onR6IsFNDYxMX/Xikjb18+Q9pRyeztOElD7gmxk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQf4KcRGg6lYupsa0uzaIg9y8YOdJ4FzrEFU5tN7M28=;
 b=IhX/M/6rSNGQ9Jwvz99UK44rD8yVwxK5W6Xc8o7Nwz7m+Y7wt4jjQJ1y4f/BFwPWbUu++Maf3+e+Wphg0JlYOAAjqhuXcsa6MyAYMt8RNS3bkU/iJmsgoNiHObEiDy3wtGQCzVkURA/2/+bkZYY50pdcfUTZm7e9RIxuIL8pqeFhTEXzVhAiRUkiYNlXCuJ0EwTXqhiVIImgS9tTezEl+ecBoxy9VPii57MLv4YFR+IoaQm5XcAn8gPdfOl+wuNleV81RKz6TVxdJW0MOUREip3CgXN6kV0TSBclPGdGCdeeRkJ0lEjgz1o4UNk3PMTivbhsEmqeZEY7nvhumWS7OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB4045.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:188::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Mon, 2 May
 2022 18:45:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 18:45:37 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, Michael Ellerman
 <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] POWERPC: idle: fix return value of __setup handler
Thread-Topic: [PATCH] POWERPC: idle: fix return value of __setup handler
Thread-Index: AQHYNqfnzi556PRgtk6xxz82n6AXA60L4RYAgAAqR4CAADDxgA==
Date: Mon, 2 May 2022 18:45:37 +0000
Message-ID: <dfe0a791-025b-421f-8cab-9919a50afeb9@csgroup.eu>
References: <20220313065848.2150-1-rdunlap@infradead.org>
 <87r15c8439.fsf@mpe.ellerman.id.au>
 <a3cb014d-96e0-c681-7347-a5c1d185d9fc@infradead.org>
In-Reply-To: <a3cb014d-96e0-c681-7347-a5c1d185d9fc@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3afef1e4-4742-436b-29a7-08da2c6bf32a
x-ms-traffictypediagnostic: PAZP264MB4045:EE_
x-microsoft-antispam-prvs: <PAZP264MB40453BE316CE563EC543958DEDC19@PAZP264MB4045.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M0jnFlzu32HDJhHNUDV4Me3dOpscCwgFhu2dsaV8xQjVYz6JrGa2MB5W9/6390Ls4z6AMILRE6DIL32sbkYaYOLfsNjHX77fleCNAcR6S/y/J84VSCL+YMqwbAss+8XUxlMYZnJedEmYB45GyZyMEWt+Bx76jaJBlXGHbdL3PEKflIRnaHk7YxZ0vp+u889d9E6WgsexSruj/DNdv4DOhSLf+Ux3w+CsGccOxK59aFmUGrREBV9Ac7dl1n67Gt/q4/LFxVy3U4kfhQckshsc1PqbDvjPmFVOJce7GuMiQ9sAPyoTO5DZrh+wtwvpOZc+lhjxHhv7B4y2Rsh3czWpZLYQzdkjkg6Lkrre6NTVp1ovaV7xJrKiCRb3S/3Bta0jrBMiZmiLZ3lKZxzrtTwbVf9R9sFFFsBukpnd3w8b8M4yWVWWVOkCtb3Bj8DoYcYnrLYfpmzFBRhPj4jFELHmRLuqO+OeKuBIcmbfcGP65etZoXlTCw8uNj/HUn89lnMPPNTUj71pbBIvHle6d2XdfA3fgNtQ8VPeEl4w3tb1vN5bH71g7cxTvKDsvzWA/9Iq0CHA8ksbclF2+rN/I25LdMsu5BiHMrZGneAXTw+rJUM8ClgHhszbWzhMQoUqdlwX//iPR1ZIsUgGympoV8Qpz4YW0xLShLPswrbApFwf6t6KYX5Vl1XYdbLdOxPRKUoXXqKXAN4XMBoAJl3fvSCFoky6U5OqOqvYRa2D8Rc7uLf+7GaULreP2VXNaMhNpBvbleId+XqiL6cxginu/M8t6uZHdtObx7BIIJ6LmnDY2ir3r2Y6vjXq84HmjmIsgB3VXRLk4fgBtUY5zvGpy0IvozIursbN03/UiNqu84K1OH8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(6506007)(122000001)(8676002)(84970400001)(53546011)(110136005)(44832011)(316002)(38100700002)(4326008)(8936002)(71200400001)(38070700005)(508600001)(66946007)(91956017)(76116006)(5660300002)(86362001)(966005)(6486002)(66476007)(2906002)(66446008)(66556008)(64756008)(31686004)(31696002)(26005)(6512007)(66574015)(186003)(36756003)(83380400001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1Y5bERLTkpOZEpUREM4aVZQY0FuWnFUOGNzZDVuTHJWaHUvQW1jZjk5WjJD?=
 =?utf-8?B?Rko2OXZacHpua3dFU2dEYXMwMit0NUpKWHdycWxBY1dpMllmRS9PakhoektY?=
 =?utf-8?B?TEFia0M1Z0tQZnovUlBBalEzbVQ4VnlsYXR3QVRHRlN5c1dzUlMwbkxuVVA4?=
 =?utf-8?B?NnEvU2FKbE5zZzNYWkpzR213OWVVTC82NWx6b21SdEJrTmcwVElmcEtXa2pn?=
 =?utf-8?B?d1h5c3ROUzB6bWZGUzhiSW10cmdSZUtyWUFKUTJ5MUR3ZStPc3l6NnBmKzRM?=
 =?utf-8?B?eWNrTW5lcTMrb3pRWisyV0Rzci9Pcm9lUWQzN2RZY0VKdGhoR1pWd0hVMGFW?=
 =?utf-8?B?dDFYZkFhaTlHRXZWRG4zWFZndjNZWFJyd1diWnFiZ0dlZUVyVTI5OGlWUU1V?=
 =?utf-8?B?S3pCR2hTMGFXeEpweGl6TUZLMTNLTkplWk9HVWNwN3F1aHUxMzIyODViQU1O?=
 =?utf-8?B?dU13MWU2K25CR3FyQmsxck1ya29WTjZzUUkvUk8vdFpRTzdrSTYxeFQzTnp0?=
 =?utf-8?B?Y2lndy9tSUFxVTBhSkE1L0R3TkNhd2R1TXdpVzlGSmxiYVQ3Y3BpR3FlT0Mw?=
 =?utf-8?B?TkVEbGhSbmRKYkx6bC9EOUdrYkhlOW5GOElGNzdtZFMrZ2hURm11aE05L1Mr?=
 =?utf-8?B?Rlp3R0E1MitqbHd1NzVwTE1KMCtVNjlZV3MybDAyQ2Jrb2dCSERnOVNxczRy?=
 =?utf-8?B?eUp1VFFwYllKYnFJUSsyRHRrWnNqVk9Yc29kNUJvYXlNVjVmdk5GSE45TlNV?=
 =?utf-8?B?bHpvRVptOWFMVWVCd2VFMW1HTkRoUVBxa0d1UVlZSjZFRytvdUhaOHRHVTh6?=
 =?utf-8?B?SERCOXZYN1NvTnRnVWcvdkIvTWdieGFSWnBoR3g5NnFDeUYwQXg0c2tiUHJI?=
 =?utf-8?B?M2plNklmb0UrZ3k3Vjg1a2E4V1RCeCtWR1VlN2J5c0FsZG9acUluQ00wRlNC?=
 =?utf-8?B?MlFodWpFNFRFNHJ4NllPZU5xdm4yT2xjam95dFBKNUN5RGYxcGVzU2tDaGZS?=
 =?utf-8?B?eVc4R2pabGdoNnRjLzdBazRiWmIyQU9rZ3NqNHVEeENDMzg1NE1JNmVYdkNt?=
 =?utf-8?B?b0swL2pSSkVNUlJOblZGdkZQaU5WZE1veWM1TzRzYzIybk9rMTJ3QXJXTmZw?=
 =?utf-8?B?U2NVVUpBTFJ4aWd5ZTBITHRIRENnanlBQnN3ang4Mk5ibWhoLy9qWFdYYzh3?=
 =?utf-8?B?bjNtNnRMdlJEVUc4UzREV3hqUzJLeUw5VFVEcTdNR1dzUUdIR1VYMzExUXhi?=
 =?utf-8?B?M092Y1JsdmN2Y1VlT29qaHhhMlhlTXdhcGQ1QWtJaTEyazVlNmFiM1EzWFBL?=
 =?utf-8?B?NTcvbkdwbXdzZmNFQmtkTWJOZ1o5RURxalEwUmJsMW5nQ0IyZHZVcDBUTDM2?=
 =?utf-8?B?UkpEeHNIRUpveFg2TmJSNkEyV0lLTFlZZE5uOVdxNU5NUzJLb1BjWkY1c25v?=
 =?utf-8?B?dzhlQjRYa3VLYVpJVlAyNHV6RTR4Znhsb3MrSnVNT2hiV1hEWjhPUHhtNlJy?=
 =?utf-8?B?RG9EaGtUcVV3K0t4b2F5QVJ4cm1sV003L2VnMnIrWElDdGcvTjE0NjNVTjZ1?=
 =?utf-8?B?bXZYa0hTWmtENWxTQzlIYXkzNXo5TXU5NStJcTVZNmtKTGFKa0hoU0RyTzds?=
 =?utf-8?B?MTBSNGxWWkswMUQzTEhvYVhaS294bzM4di9xelEvcFQvMSs2L0FLTW5GVjV3?=
 =?utf-8?B?YkIybi9SOG5lWHF4Vms1T1N4ZXkrc3VxakFpdFZQd0dVWWxGSXZ0OW9Da2Fi?=
 =?utf-8?B?ajg0MndYS2duK3BMV05CdE1qSTM4QzNzQytRMlJZWkhiQkVnbmovakxkQXFR?=
 =?utf-8?B?eWFLbms3SW1NUURDSWJZeHdmWjVxQ0t5ZzJ4TzBTTElzV25iZGVuRERPbk9T?=
 =?utf-8?B?N2lzNC9hcmdoRkNUOGFFZGNIcVZERlc4OXVXRmlsWDdod1FkZkRWZkFwMHRp?=
 =?utf-8?B?MnRybGVJT0JNd3dkWVJwZDFVczA2a0RKRjcwOGJQWVY2MFozZjhWRzhJZWJv?=
 =?utf-8?B?alVDUUNRN29LUUlNOXRrQVRaV09XZWVNaFRDbUU5R2hseVdXMmhaOGdkSlFJ?=
 =?utf-8?B?ejQ0a29ITlhuUnovVklKMkU5aC9WakFpb1grZHZ0NTRJSlJPQnZDVnRxMEEx?=
 =?utf-8?B?dGtmUVdBZUJ0bHFLMUFWNFhyamN3ZWVKa3VVSi9IMVlSbUd4dDFoRWhEL00w?=
 =?utf-8?B?ODJFKzRQemdpVTBaQnVnM2Jjc2JpYktjeWdDVklkeUVESHViOGovMmZkTStm?=
 =?utf-8?B?VVczMjBncFFVTks1bW1HcUNpVDdEU2xuc0pOK0xNczRERkNQVWtTZ1pnZGlN?=
 =?utf-8?B?QTZ2SlhMeDFSNTdsS3VnT0hSWHUwc3pTMTdvVUxFOWFUbzRMSlhwTitJVzQ4?=
 =?utf-8?Q?onSCsSiCBmeNU74DzpUU2yp716EA1QUNAvJgE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F694A6A1D20E84F840F2F8E30DF7223@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afef1e4-4742-436b-29a7-08da2c6bf32a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 18:45:37.8771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b+kbzXl6W4WjPCJXJFMSpVFm09284JNSgAy0tz6wVrXEyI3n0okR7sG4908IorLJ801/ciDRm/sj/Z0xP0aaKdDdmt+0Q3UE3+Ukigb5+xM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB4045
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
Cc: Paul Mackerras <paulus@samba.org>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzA1LzIwMjIgw6AgMTc6NTAsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIDUvMi8yMiAwNjoxOSwgTWljaGFlbCBFbGxlcm1hbiB3cm90ZToNCj4+IFJhbmR5
IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cml0ZXM6DQo+Pj4gX19zZXR1cCgpIGhh
bmRsZXJzIHNob3VsZCByZXR1cm4gMSB0byBvYnNvbGV0ZV9jaGVja3NldHVwKCkgaW4NCj4+PiBp
bml0L21haW4uYyB0byBpbmRpY2F0ZSB0aGF0IHRoZSBib290IG9wdGlvbiBoYXMgYmVlbiBoYW5k
bGVkLg0KPj4+IEEgcmV0dXJuIG9mIDAgY2F1c2VzIHRoZSBib290IG9wdGlvbi92YWx1ZSB0byBi
ZSBsaXN0ZWQgYXMgYW4gVW5rbm93bg0KPj4+IGtlcm5lbCBwYXJhbWV0ZXIgYW5kIGFkZGVkIHRv
IGluaXQncyAobGltaXRlZCkgYXJndW1lbnQgb3IgZW52aXJvbm1lbnQNCj4+PiBzdHJpbmdzLiBB
bHNvLCBlcnJvciByZXR1cm4gY29kZXMgZG9uJ3QgbWVhbiBhbnl0aGluZyB0bw0KPj4+IG9ic29s
ZXRlX2NoZWNrc2V0dXAoKSAtLSBvbmx5IG5vbi16ZXJvICh1c3VhbGx5IDEpIG9yIHplcm8uDQo+
Pj4gU28gcmV0dXJuIDEgZnJvbSBwb3dlcnNhdmVfb2ZmKCkuDQo+Pj4NCj4+PiBGaXhlczogMzAy
ZWNhMTg0ZmI4ICgiW1BPV0VSUENdIGNlbGw6IHVzZSBwcGNfbWQtPnBvd2VyX3NhdmUgaW5zdGVh
ZCBvZiBjYmVfaWRsZV9sb29wIikNCj4+PiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJk
dW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4+PiBGcm9tOiBJZ29yIFpoYmFub3YgPGkuemhiYW5vdkBv
bXBydXNzaWEucnU+DQo+Pg0KPj4gV2hhdCBoYXBwZW5lZCBoZXJlPyBJcyB0aGUgcGF0Y2ggYWN0
dWFsbHkgZnJvbSBJZ29yPyBJZiBzbyBoZSBzaG91bGQgYmUNCj4+IHRoZSBhdXRob3IsIGFuZCBp
dCBzaG91bGQgaW5jbHVkZSBoaXMgU29CIHNob3VsZG4ndCBpdD8NCj4gDQo+IEkgZG9uJ3Qga25v
dyB3aGF0IGhhcHBlbmVkLiBJIGRpZCB0aGUgcGF0Y2hlcy4NCj4gSSdsbCByZXNlbmQgdGhlbS4N
Cj4gDQoNClNvbWUgZXJyb25lb3VzIGNvcHkvcGFzdGUgZnJvbSANCmh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAyMjAzMDgwMjQyMjguMjA0
NzctMS1yZHVubGFwQGluZnJhZGVhZC5vcmcvIA0KPw0KDQoNCj4gVGhhbmtzLg0KPiANCj4+IFNh
bWUgY29tbWVudCBmb3IgIltQQVRDSF0gcG93ZXJwYy80eHg6IGNwbTogZml4IHJldHVybiB2YWx1
ZSBvZiBfX3NldHVwIGhhbmRsZXIiLg0KPj4NCj4+IGNoZWVycw0KPj4NCj4+PiBMaW5rOiBsb3Jl
Lmtlcm5lbC5vcmcvci82NDY0NGEyZi00YTIwLWJhYjMtMWUxNS0zYjJjZGQwZGVmZTNAb21wcnVz
c2lhLnJ1DQo+Pj4gQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+Pj4gQ2M6IFBh
dWwgTWFja2VycmFzIDxwYXVsdXNAc2FtYmEub3JnPg0KPj4+IENjOiBNaWNoYWVsIEVsbGVybWFu
IDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+Pj4gQ2M6IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJl
bmhAa2VybmVsLmNyYXNoaW5nLm9yZz4NCj4+PiAtLS0NCj4+PiAgIGFyY2gvcG93ZXJwYy9rZXJu
ZWwvaWRsZS5jIHwgICAgMiArLQ0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+PiAtLS0gbGludXgtbmV4dC0yMDIyMDMxMC5vcmlnL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvaWRsZS5jDQo+Pj4gKysrIGxpbnV4LW5leHQtMjAyMjAzMTAvYXJj
aC9wb3dlcnBjL2tlcm5lbC9pZGxlLmMNCj4+PiBAQCAtMzcsNyArMzcsNyBAQCBzdGF0aWMgaW50
IF9faW5pdCBwb3dlcnNhdmVfb2ZmKGNoYXIgKmFyDQo+Pj4gICB7DQo+Pj4gICAJcHBjX21kLnBv
d2VyX3NhdmUgPSBOVUxMOw0KPj4+ICAgCWNwdWlkbGVfZGlzYWJsZSA9IElETEVfUE9XRVJTQVZF
X09GRjsNCj4+PiAtCXJldHVybiAwOw0KPj4+ICsJcmV0dXJuIDE7DQo+Pj4gICB9DQo+Pj4gICBf
X3NldHVwKCJwb3dlcnNhdmU9b2ZmIiwgcG93ZXJzYXZlX29mZik7DQo+Pj4gICANCj4g
