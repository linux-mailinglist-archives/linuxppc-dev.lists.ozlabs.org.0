Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2923146B2A8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 06:55:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Tzg0SxMz3btR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 16:55:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60c;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::60c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7Tz90J1pz2x9p
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 16:55:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+4Tf7f1pUyr0Rbi7Qp7tUoLuumEXHO9UL5ToKrQBREYbSBox7WVUeHCg40Ul6otJTmx7lDu4piqupCtQ4NyOmwPA7aZc3GWLJ3JrFZ8BR7oUQDNOmihafDiMQRDBT7m8ZYkfFh4YZTLfR4rzkowNLKWGD50Y09SuYY+3424ysegRyMwikPPq8p+HPFPwrbT3CfUdJPvqjXV32HV7tgFmzZqoPfNnQWOanOIYeAfGNPjCcnXJ6RUhkjmJUddJeZY4N40YddJ0H1RVwyA/RykLNcgGMRh2VfgeEMxjUteV6OfFP6+hUI0e1Or+Xvc05iz0+/moacLvkqoUb2JT5o6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwXQpqqpLlrxkroRVeMvOJIEaTMeYOhVqGzeKS+t2Pc=;
 b=P64TLAbvvnb1v0uch52dG3W7/YAgvoQaSBtMt1un1P+AoLWWiFxV4IShH//C2PTuMDxkuKhHuIMS9SVjt6T+Coxx4vSzSRrSqbL91G0Y/1msqhPTvvB2FHHsl0yvR2sBYOykLKyudWIoZUrIQl2wV+fTCXb1kgOXstEvMMsMoDsGPvkH4LAbmyR2TX1zhgPlgzZwfaYTZzTIdAoVxkt3Fa1w8edGZyknW+nARhgJt4jcxs+2MTAwkgE/MXoLl7k4jsCHazDwCqxQpA66zY4ZItkMF78HQj/aWxsorPznhuXN3GA7QsICFuSHdi25Mw97RI54I9IWeD8Tnw8ZTfGbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3153.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Tue, 7 Dec
 2021 05:54:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 05:54:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Maxime Bizon <mbizon@freebox.fr>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Thread-Topic: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or
 nobats
Thread-Index: AQHX597pFZD8fwjYfUOPVLOQ2QefI6wguJIAgABjAYCAAQBigIAARbGAgAA7TICAAYFwgIACb7iA
Date: Tue, 7 Dec 2021 05:54:40 +0000
Message-ID: <a4e18c79-fff0-df8b-8d76-c2acf6e741bb@csgroup.eu>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
 <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
 <20211204141031.GA23757@sakura>
 <5f4d36a1-695d-38a7-9ff9-d5af97f1a7e0@csgroup.eu>
 <20211205164217.GA29658@sakura>
In-Reply-To: <20211205164217.GA29658@sakura>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5748d6c-b6ea-4839-019a-08d9b9460f42
x-ms-traffictypediagnostic: MR1P264MB3153:EE_
x-microsoft-antispam-prvs: <MR1P264MB31538D9BFBD66C84C52F524DED6E9@MR1P264MB3153.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:569;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8DzJq6DRhwbSjvaAbaZxou54oWY7gAbqnnBhQmXDfNhhHrOsCH7UDghleCo6Be3TpUDTWZYYAGIux72eCHKjl8qfJythHTeRJdTWJh0VtHmZwo6aLvTd6puDgwTUR9wjY0cjFXhY7mACqxB9X0uwOxLHvJS8HboBq4+BH8V65O/YlHhQtUDfcJ0qNSDJlj50GgM8kIzR2KKPzI9de6f0cEAxJbmGM++aaIFgMuFdzm21jx4KPN8Fv7wh48N9aBirFNQF68x2eGJIimXJP5mIOmbXjgUEf79okxkx3L6YGY8ZWA7dqCmZRXTfxb4AePRlnqIcRPmcN9frAgqOtNZcJ+1eSNJEea9xcJmatPg/TV+q7TdjNu+fL44nv1SMaa2j4TIVP2nJVbleSxagGcVCvWEPB/rqSlpmU37y2VkPZPjadWGyikeSS1O40nt4iy8L9R/gjcDQkjSU1CAXZvPjQZyKUCS4TYzcMn90FlbMZYWngvGafHtW3pdTrs79b0MQ8zcAqXu1+aDCfvnKmOC8ngWbQx7LAwyg6ojmSa0GyrWPr3SnXgAaqsRkCBPy4zfpSJQHaFpf7xmskKzRNqcrBVx7+D8/lcU0W8+hV7gza8EwVH1SCN+Mo/GWXoMhG5Vmnl1Hl3F7o06UqaJH9tljyTco78lRz50D8RAOND4jvMH+QoDuyY7usbFwoIXLK1RVpOLj6pMYTorDsjhDhPXVQk51Rl3rs/BDLBNnCVbgutdS0cEBnDSYarHcKDXHz3DEp9etrxbtODNo6SvGEASejg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(26005)(38070700005)(8936002)(6486002)(8676002)(4744005)(83380400001)(6512007)(508600001)(44832011)(6506007)(31696002)(122000001)(2906002)(31686004)(38100700002)(6916009)(5660300002)(91956017)(66946007)(71200400001)(66446008)(66476007)(66556008)(76116006)(86362001)(64756008)(186003)(36756003)(2616005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ck5nQVRuZXBXKzIrWVBuTDhGYk5ibVR6THVIVlFZaE9MK0RHTThPbTV6Y1FN?=
 =?utf-8?B?TkJ4SlI3dGVrdkJhQVNCNys2anVJK3M1S3ozYWJvSWw0aGtGTlVldklFU3RU?=
 =?utf-8?B?bzlVSGM0Vlpta3VBelFBTWZDN3FDa1FUT3pBYVVxdEJGcDNWRFpGamhEcVlK?=
 =?utf-8?B?c2lsRy9TRkxxcElmcm9WVWVTREJva2pMSi9vWWJ6eEIyQ1Y2QzZDTkdYUk40?=
 =?utf-8?B?WWJRaXJOdUh5c0dFQmQvMEw1SDI4bm1TTitTckE1N0FMUndVeGgyQjF5WHF1?=
 =?utf-8?B?a2RyVWlsdC9NWVV4bXVsZDhHRHE0NUZHQkpmMXFFcDVzYmZxNXdLaTViWG1Y?=
 =?utf-8?B?K215MFVwUzlSZkUwUE8zRE1sSUFUSi9rTFRvZGpxWmtybUxYWkozemNVYTJq?=
 =?utf-8?B?MWZOTDNwMUtNaGlwWm1icmZsUmV3ZzJRZlAxcG4wTzRKMnpKbXFQbkYzcmVq?=
 =?utf-8?B?MUJQL0tYZisvK2tSeWx0eUpnWGZYbWRnclJqUTFKVzQwclJSa0NrdnZMSnc3?=
 =?utf-8?B?ZE1jTlVEdlVUckF6SXE0WXpMYXE3amtxVm1IS0JHb1dvQlorSjZBbUNLNmdO?=
 =?utf-8?B?WEUyR2t4bkIrV3IzRFI0T1F2aW9VSU1wcVJKV1BqeFI5bGZPbTNYeVMzeUR6?=
 =?utf-8?B?MTgrdGFZdWdHZzhlL0dMaHdtMnJsdlQxSXlINWFGWXc2b0RPM2dSR3VMdU9l?=
 =?utf-8?B?eEtkQm5GNWRXTHhpY1ZYTmdBSUs4YkdMZEVzY3NPSzlPNVVjNWtBc2xCOTlX?=
 =?utf-8?B?VkIzYWtsMHBsYU9XUFBuZ01JVWVqOEZTdDBzWXlCTFFQTC92cnhaN0JTTDds?=
 =?utf-8?B?Tk5TcnB6Tm5kc3lpcFg4Z1ZPY2cwczFtRCtYRnRnWDRuRXVuU0hYMXYzbzRo?=
 =?utf-8?B?eGhNMVh5N0NPdy9mcTNKSTBaU2Q2MHZLTkNZT0lDdVpVeHh5UFdWcUtJb0xQ?=
 =?utf-8?B?dWpIY2Q5UzlHMjFXR1ZwZXNMbDVRbkVBMmZYNzFIbFd1L2NhWnhEMEhKcHI0?=
 =?utf-8?B?dGNxWGxhMWNYaENYY2h6R1dqRDhENURvQ1NZaGNpaTdhdFRNTElweTNUbUhq?=
 =?utf-8?B?NWVZWDdVbGJXMUpFd1BRRzZhN21icmlDMDZGL3ZnS2RDVjVjRUJoM3lWaFBO?=
 =?utf-8?B?eVNWMkVJRUNraHJzSVFuc3VuUEVtVU8xVzRJQi9QbjJsNm1tYWxhejR3MGpC?=
 =?utf-8?B?Tk9jT2kvbFVzRGdTS3dxVVdFUEFMSkUwb0VHWHBrd2FJQ29xU0t4MFhrY2Ir?=
 =?utf-8?B?VGpHREpJOUdjN1RGUytIc1JJMWpxV3pLQkNVeEVrT1BEeDNoa1JkazNESTlk?=
 =?utf-8?B?d0ZpRWl3L3dxd1ZkYnBhSHE4MUVBQnVYalZLbXRjL1hGUXRYNFpVMlBISjBv?=
 =?utf-8?B?eXc5V3Y4R1FyNVpuTTAvRitrMnNDYnFja3pXTHZhYmNaWHBmTElkS29tL00x?=
 =?utf-8?B?RWp0cFdnd3MwM3Jubm9kTjFMUGxIUTV5YXl3ZC9Rd3kySnBXK210TS9lYVU1?=
 =?utf-8?B?SDkrODd3RkMrUE5oMzBUNE5jTzlodUxQT21Qa3JqUC9ob3g2VCszaG9ld2U4?=
 =?utf-8?B?TXNZOVVkYWE0ak5xWXlCa3VIbFQ5UzBNbVVZSXZ1dzdrOWs5bjY5Y1BzVVoz?=
 =?utf-8?B?anlGTzdPYlp2MEdLQXZDYUlqR3grWVpjc1l0YlRDalgzT1JDOGFnK0JPcktY?=
 =?utf-8?B?NlJ0Zk9LZTJRTzdpQ0M1Z3lSMVBEM1BsYVoyYUliSXZ5MTU4dHN4cC9EVVdQ?=
 =?utf-8?B?WDJQTS9WNlJ3dm1ZVkd0Vm9OU3Q2RmNJOTh2cUQvQmYyV2kxWTg4U29pVmtw?=
 =?utf-8?B?eU5xZzJLSk4vZlN4NkZ1KzJ4a3FhenRETWQ0VGFEdGx2c1NXSGpHU25ISlpN?=
 =?utf-8?B?SHFzRnkydmcyZVRnU1ltanVGQ0owM2FFcCs1bk05Vi9xWHM5dE53VVRlNktl?=
 =?utf-8?B?ckdTSHUyQ2hKU0VEMVJQQ2ZEQkxFcmRKelROQkVIVS9iQ1BPa25Zb0pWKy8r?=
 =?utf-8?B?QWZjcVQxdWZIMEwxKzF5dlFtcnZhRDZJb1U2am1Ya2V5c0VWY3Y2a1l1WllW?=
 =?utf-8?B?YjU0Nzc1TWVjY0tEQnZ0RzYzOGRCOGNqa3B1ak1iL3UvcXYzRXpSL0JRWVY0?=
 =?utf-8?B?WjBZSElKeCszM3RzWXdxTUlCMjFidC9lK0VOQlZkZ3pES1V1cjJUc0VtVzgx?=
 =?utf-8?B?MmRoUVIwMjMwZ2lYb2o4MlJsbCtEUVMveFI4SHEzVEY4R0oxQXhxUTdENGhv?=
 =?utf-8?Q?b2+rINUfJ/KJiz1qboi28/58nXS7kGVshjkJuCD0f8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85F443679320734197A4BB60D242B1AE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a5748d6c-b6ea-4839-019a-08d9b9460f42
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 05:54:40.3583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A3wDZPPhqMvvQFeznbL8p9CaGuSkU4NY+ZRsohov1QpH2p6HAn3KVVYTYyYw2bnYLSYAfcUYdPnOc4ZEk+kuNYJ0QQVyV3o8PhhO5lEa61I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3153
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzEyLzIwMjEgw6AgMTc6NDIsIE1heGltZSBCaXpvbiBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIFNhdHVyZGF5IDA0IERlYyAyMDIxIMOgIDE3OjQyOjQ0ICgrMDAwMCksIENocmlz
dG9waGUgTGVyb3kgd3JvdGU6DQo+IA0KPiBBbHNvIHdoZW4gbWVtPTJHLCBJIGhhdmUgcGh5c2lj
YWwgbWVtb3J5IG1hcHBlZCB0d2ljZToNCj4gDQo+IENPTkZJR19QQUdFX09GRlNFVD0weDgwMDAw
MDAwDQo+IENPTkZJR19MT1dNRU1fU0laRT0weDYwMDAwMDAwDQo+IA0KPiAwOiAweDgwMDAwMDAw
LTB4OGZmZmZmZmYgMHgwMDAwMDAwMCAgICAgICAyNTZNIEtlcm5lbCBydyAgICAgIG0NCj4gMTog
MHg5MDAwMDAwMC0weDlmZmZmZmZmIDB4MTAwMDAwMDAgICAgICAgMjU2TSBLZXJuZWwgcncgICAg
ICBtDQo+IDI6IDB4YTAwMDAwMDAtMHhhZmZmZmZmZiAweDIwMDAwMDAwICAgICAgIDI1Nk0gS2Vy
bmVsIHJ3ICAgICAgbQ0KPiAzOiAweGIwMDAwMDAwLTB4YmZmZmZmZmYgMHgzMDAwMDAwMCAgICAg
ICAyNTZNIEtlcm5lbCBydyAgICAgIG0NCj4gNDogMHhjMDAwMDAwMC0weGNmZmZmZmZmIDB4NDAw
MDAwMDAgICAgICAgMjU2TSBLZXJuZWwgcncgICAgICBtDQo+IDU6IDB4ZDAwMDAwMDAtMHhkZmZm
ZmZmZiAweDUwMDAwMDAwICAgICAgIDI1Nk0gS2VybmVsIHJ3ICAgICAgbQ0KPiA2OiAweGYwMDAw
MDAwLTB4ZjdmZmZmZmYgMHg1MDAwMDAwMCAgICAgICAxMjhNIEtlcm5lbCBydyAgICAgIG0NCj4g
DQo+IEJBVDUgY29tZXMgZnJvbSBfX21tdV9tYXBpbl9yYW0oKSwgQkFUNiBmcm9tIGthc2FuIGlu
aXQNCj4gDQo+IElzIEJBVDUgbmVlZGVkIGhlcmUgPw0KDQpEaWQgeW91IGNoZWNrIHdpdGggbXkg
bGF0ZXN0IHBhdGNoICh2MikgPw0KDQpJdCBzaG91bGQgbm93IGFsbG9jYXRlIGEgYmxvY2sgb3V0
c2lkZSBsb3dtZW0sIG1vc3QgbGlrZWx5IDB4NzgwMDAwMDAuDQoNCkNocmlzdG9waGU=
