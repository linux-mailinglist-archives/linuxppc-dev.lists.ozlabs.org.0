Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A39964686B9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 18:43:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5xr83Zv7z2yNr
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Dec 2021 04:43:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5xqg0f3Sz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Dec 2021 04:43:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGio9Je7SxQOJCX6fObouV+gQUffer2tk0ljoPldlpJ7A+ZqO4eN4PEA8y4LVdbCz3kFMn//2xx4QSM8ZbrOTlmu/YDt8NCf3+Ypj2eSwNvcp7pWUsJncEVw669m1OWix06F5VdTQmjAOUt1z8ecRjCJ00xgs154hMb8m9VzEaeYAANFas28JlMXw2ZKLB09EQBxSKE2t2uf8I4o6zTQewMwuSObZPjrG4rWXFa/YI9qEINFkrs6X45sEJMwXBWhEWhfsLWMkZ6fLWeV7BQTg29pCyjgB1e9a0GPlg5SXciqTru4n4BseFmJ4waxybcUGsWXuxTAbU0hFsErBitbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcaCThUiZSArbj3S9ePCmPl8HQknt/fypvKZe7Eahwo=;
 b=W8KPOHKV6ln8nCe2ZlTaLVy8bGh6REexgjtCwzRRvyWnpsZZheyzQka3oDcAWAZ0nFolI0fWm0HcJNa/45R/536i9r0C5zLyg5tlh55QCaahiw9Wk5h06AvEERVd3IjKuzP0++Gzk+McvvxI4WHgWtj8tcL597mEDdmlYuyiTs4drR+diHsJffuyTtkocnHsEev1RrTXz9MstDEgBnfU8AIaHymqcgMgTf1Hy8qAZm6EtskKx+MDNXy89SC2WebWmF8RdOScjoEGyGN+0O7AGIOR3PmRkzGCg85xYd5N77j7JQIne46z7m4j4tpbG18lqBThVAtUi+rSFIptAUPaYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2307.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:34::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Sat, 4 Dec
 2021 17:42:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.016; Sat, 4 Dec 2021
 17:42:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Maxime Bizon <mbizon@freebox.fr>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Thread-Topic: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or
 nobats
Thread-Index: AQHX597pFZD8fwjYfUOPVLOQ2QefI6wguJIAgABjAYCAAQBigIAARbGAgAA7TIA=
Date: Sat, 4 Dec 2021 17:42:44 +0000
Message-ID: <5f4d36a1-695d-38a7-9ff9-d5af97f1a7e0@csgroup.eu>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
 <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
 <20211204141031.GA23757@sakura>
In-Reply-To: <20211204141031.GA23757@sakura>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdaa7ee6-7ca3-4217-835d-08d9b74d7a59
x-ms-traffictypediagnostic: MR1P264MB2307:
x-microsoft-antispam-prvs: <MR1P264MB230715B4BC088402621FD5F6ED6B9@MR1P264MB2307.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uHX7uikurWv0MJdBLs2vBu2reBt3KygBhUsN/tvgUUla2TROqArYe3+F0aCy8NGsczUf843jyfG9U3yn4Sey3tvXv/QrHw+z4puvRiFZRPJAiiwMGP9pha5w10I8jPlsuMvaosNvZwJmlXJDxsGIOnFCcuXSWSky48h9hMoQJ0RQDhieqYFjh3iccBP65BJLZsyFDm13e0nDXC2TepxDKaiD2ZKOv+KfM/VICL9XVI8wXXBXyVYBRqX1mq43thOEc1XdO4eomQ3EtCERx+TpZANOsqoPtL6bUx9nUHsCceJsafpJ+hGStwKBD6t6qlyiU3D5IhZwga2Lyf+0568tdZpALYA47kmpxjjMACBKHKE0KbxkNMKxTK7j/DtoevNYqcH+stmMt43gs0hIBRRcpNNTjNiHUV3X0O+7x9vIm4jbYuLmie4ppMjgapkJElJLDst97AvTwtBkmaWl+hdWDsnw5tgxuy0cSt6+Iok7n0CCNJsVpfDSbCUKF7+iZBZqAIQNadmDJX8jntnIWiNktXH/cAPe1d+PT4QGfdGrQpaIetxEr9YAPPune28ZIUlegxLuQPoLSnkGcSh8x9r1D+npk2FgtH1tNFOQRJQzJ2wtXibdKGt9XzcsP3kHPjisvgQsHBr9C7UWRsXpVoxMisG3PuJnGmaXGrRFF++R2+stNdGnrT6AxQFL3h5yASyxWq0SEzK/UpMF53BYQa7to/hmxuhyeJPeIeMkCRlsdx1eJTkQrfUxbTe6/H9AESur+sRbRu8Y786w/iNo0T6lCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(122000001)(26005)(186003)(508600001)(6916009)(2906002)(6486002)(86362001)(6506007)(8676002)(31696002)(71200400001)(31686004)(66446008)(44832011)(36756003)(76116006)(5660300002)(38070700005)(91956017)(2616005)(316002)(83380400001)(66476007)(4326008)(66556008)(66946007)(8936002)(64756008)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3luRnVTbFl4M0lJaVZWNnF1M2hYQW83c1ZBODNqa0RMdTVCVkptMDZxWjRS?=
 =?utf-8?B?ay95bnZWaGUwZ3F2bWcvMm1EU0UxdElTSFhHc282S3YwQjd3SktYaHpmd2g5?=
 =?utf-8?B?cmszYXQ4dS9hcytienFqOWYzZzh3LzU0NHlOOERWRmtMNVZIajYvY2phSjFC?=
 =?utf-8?B?aVZ1clJES3c1dVBHcHMrZ3I2dWhnbmt0cTliejd4YkhFSkVkcGMwbnRFeGUz?=
 =?utf-8?B?bEwxbm9CNjYrbGU1YTh3S21VR2tscm5jYzR6TmdRL2lOV2oxSXdhSHBzeWpW?=
 =?utf-8?B?NjlueEZocXU5WVprYm5EVkdNN0JUNktDdDNGOXZHR1BjUmh1R01tT25rNFIw?=
 =?utf-8?B?S1FrZFo1ZmdnbmRITkFlZ3R1RmZRY3llTjViZU5uL1RCQ25ZMGRlNCtVTEhS?=
 =?utf-8?B?SEpxOHN1aHppb1JFV3l1TXZXSFN6MG80ZFpUdHFkQ244OWFMUEJKTVNCTVBp?=
 =?utf-8?B?azMwWUV0QUtmL0NoM3JVRkZlN3djV1h6cHF5SnFPSTVpZy9vaXVnU2RVSFh4?=
 =?utf-8?B?NjVWRGZLa04rRDl3dU9QY2RzN3lwcXFLWk5EZ1B5NUJOd1lkVkpaYVhRMVYy?=
 =?utf-8?B?UmFsOGJqK0ZHMFphWDN6YjdKb1k4UlloZnhIbDBqbHFtRjlJNTNTR1JvcEVH?=
 =?utf-8?B?aVJXRDJzQ3ZVbk5wY1VCekw2blBYQWZwODdQYk9xY3hEdklwTU9xUGpXMk91?=
 =?utf-8?B?ZjlJWTlsNmNWUkM2ZFNmQ3l6eHdvb1NPUklhS0Z2MHd4SThSU3VnUTdJcDNo?=
 =?utf-8?B?eXpLQk1paXpFRlhuZzlIQXZpTDY5OUVPT0tFVS9RcVhzL3hiT2dYRVZrUmVV?=
 =?utf-8?B?WnZtWk15TFp4dHRlUm9LOEZ3REpXaXdUUkxtd3JVN0tYQmIxc3NXb2FGM2gy?=
 =?utf-8?B?ckdXMExQWGk5emxzSlZoZ0ZPVHpROTJoNitUOEJNMDhEUHFWdXUzNHdlVldq?=
 =?utf-8?B?SmhKQmRsZmtEQS92dHhGbmZsSnE4dXdRZHVtTmpGZmlhOXZCYzVwK3VpTW5w?=
 =?utf-8?B?SGt0NG1GL0M4NU5VSHQxRWduTGFseExHL0xVeVY4ZXJFT2xnNXUrVkg4S0dn?=
 =?utf-8?B?NHRuUWFmL1BUNU5pNVEreDlGb050NDNXRHg5cFVhUHVSazlkbkV2MlhTekxW?=
 =?utf-8?B?M1hRa3ZzejNLQUU4OXA1UXkvc0JDeWpBYk9FZk0rdGdpczJBa2FQOHNLRUho?=
 =?utf-8?B?dW13Rm5sS0dCVkl5SGphT0V0WENYUURjZVRrdDgwUXE0VkhMdHRQcGk0U0ZX?=
 =?utf-8?B?TkxlRlRJTGY3aHZmR3M4V2pWdUEwS0wyUHV5WnI4UHJrZllTRWpaUUYyM1Jt?=
 =?utf-8?B?ZTFPdHpUYmYxWGliWmdCMGJvL3A4UnZ6S3ZHV2R2dWtqR2o2UDI4ZTRlOGFn?=
 =?utf-8?B?UktGWHFqc2J1ZHRCZEtpZGZwVHdoanp2cGl4V29sd2drcFU1RGVEOGtkOUM0?=
 =?utf-8?B?bkxEY1lzYmxPQm5EMW9YYklPMVZJblpHcFlEU0tqTmFWYWRYYTJ5UTQ0bHNW?=
 =?utf-8?B?bSs1ZFZVTU5hQ1JZcTJwckxLNVY1a2lpWnlNeVYzQ1FhYzRXZytZbEQwVEYr?=
 =?utf-8?B?MzYvcTlTVnBvZlZUcFVGa3NBQmF3dytFSmRjb3AzdUxvbUtGZlovT3A2d2p4?=
 =?utf-8?B?ZHZhYnlGdDdPTXRMZ2l1NXc2WmRsQk9Peko2WXpxZnZlMVRhZ3VnOGZRV0du?=
 =?utf-8?B?MG1zOEk5cWFpaFpGVUt6bkpUNitqV3dTQUV4a2lDTGxTR3ZYQlRhV0RjRUIx?=
 =?utf-8?B?NjFzSXB5T2RXdE5RQy9CQVQ5UVhCcVgwM2ZaK0pJUFJYcmROUnQ1UzJFaG1M?=
 =?utf-8?B?UTZhQ0FlTCs1QStlaFFmSGd4STAvUFhmSyszS0JpUEpGSG5ydVZMc0k5a0hG?=
 =?utf-8?B?NVAydlF3dGtJRmJtR2JjYm5Pdjh0a0d1VFdsbFpHZjI5KzdFVExUWkFOalJ5?=
 =?utf-8?B?Y3hBMnNzSTUxSWY5SWtUYTBLd090UUVJZ2RVdjZYMXEzN3VyZlJxS2dRbkg2?=
 =?utf-8?B?eS9JTzN4VG0zTDVCaDR6Y0pQallHOHZON0pWMzFUOTFpM1RTZUtXcjNzK1Zq?=
 =?utf-8?B?VmlVaUwxd1YvbHkrWE02c3A2QUNScURpVzI0LzlJeVJJUklqMGNDOEhlOWdP?=
 =?utf-8?B?WjJvQ0tDMzV1enM1bVRILzZsV3ZtaTBqM2JCaHRQVXBYdVhvYWl5NldkcEUz?=
 =?utf-8?B?VWJ4QkF6Z0tGRzlYcW1xNS9Cbko5WlFFN0FNdGJqeUZsODhXRWhHbXgrMFJK?=
 =?utf-8?Q?d2XsQe/94qi3JOuyq/wyEpjOixtFAR6RDm06vofSv4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D747DD389379804E86E3F23517A67826@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cdaa7ee6-7ca3-4217-835d-08d9b74d7a59
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2021 17:42:44.2169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xmJgGgzTX64vCisZ+GJSo7DyQ6aOGvk9bsiygMdm4yS8qOUNQsqIbKLNgsBSO57XlecNTIiaAHbKOKudmf87EI2ReNKapdfwG6PJ53eIgNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2307
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

DQoNCkxlIDA0LzEyLzIwMjEgw6AgMTU6MTAsIE1heGltZSBCaXpvbiBhIMOpY3JpdMKgOg0KPiAN
Cj4gT24gU2F0dXJkYXkgMDQgRGVjIDIwMjEgw6AgMTA6MDE6MDcgKCswMDAwKSwgQ2hyaXN0b3Bo
ZSBMZXJveSB3cm90ZToNCj4gDQo+PiBJbiBmYWN0IEJBVDQgaXMgd3JvbmcuIEJvdGggdmlydHVh
bCBhbmQgcGh5c2ljYWwgYWRkcmVzcyBvZiBhIDY0TSBCQVQNCj4+IG11c3QgYmUgNjRNIGFsaWdu
ZWQuIEkgdGhpbmsgdGhlIGRpc3BsYXkgaXMgd3JvbmcgYXMgd2VsbCAoWW91IHRvb2sgaXQNCj4g
DQo+IG9oIHNvIGhhcmR3YXJlIGRvZXMgc2ltcGxlIGJpdG1hc2sgYWZ0ZXIgYWxsDQo+IA0KPiBJ
IGdvdCBmb29sZWQgYnkgdGhlIGxhY2sgb2YgZ3VhcmQgaW4gdGhlIGJhdCBzZXR1cCBjb2RlLCBz
byBJIGFzc3VtZWQNCj4gbWFnaWNhbCBoYXJkd2FyZQ0KDQpJIGd1ZXNzIGFsbCB0aGUgZ3VhcmQg
aXMgaW4gdGhlIGNvbW1lbnQgLi4uDQoNCi8qDQogICogU2V0IHVwIG9uZSBvZiB0aGUgSS9EIEJB
VCAoYmxvY2sgYWRkcmVzcyB0cmFuc2xhdGlvbikgcmVnaXN0ZXIgcGFpcnMuDQogICogVGhlIHBh
cmFtZXRlcnMgYXJlIG5vdCBjaGVja2VkOyBpbiBwYXJ0aWN1bGFyIHNpemUgbXVzdCBiZSBhIHBv
d2VyDQogICogb2YgMiBiZXR3ZWVuIDEyOGsgYW5kIDI1Nk0uDQogICovDQp2b2lkIF9faW5pdCBz
ZXRiYXQoaW50IGluZGV4LCB1bnNpZ25lZCBsb25nIHZpcnQsIHBoeXNfYWRkcl90IHBoeXMsDQoJ
CSAgIHVuc2lnbmVkIGludCBzaXplLCBwZ3Byb3RfdCBwcm90KQ0KDQoNCj4gDQo+PiBmcm9tIHB0
ZHVtcCA/KSwgQkVQSSBhbmQgQlJQTiBtdXN0IGJlIGFuZGVkIHdpdGggY29tcGxlbWVudCBvZiBC
TC4NCj4gDQo+IHllcyB0aGF0IHdhcyBwdGR1bXAgY29kZSB3aXRoIHNlcV9wcmludGYgcmVwbGFj
ZWQgYnkgcHJpbnRrDQo+IA0KPiBwdGR1bXAgY29kZSBpcyBjb3JyZWN0IGJ1dCBpaWYgdGhlIGJh
dCBhZGRyZXNzZXMgYXJlIGNvcnJlY3RseQ0KPiBhbGlnbmVkLCBtYXliZSBhZGQgYSBzYWZlZ3Vh
cmQgbGlrZSB0aGlzID8NCj4gDQo+IGluZGV4IDg1MDYyY2UyZDg0OS4uZjdjNWNmNjJlZjQxIDEw
MDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzMzIvbW11LmMNCj4gKysrIGIvYXJj
aC9wb3dlcnBjL21tL2Jvb2szczMyL21tdS5jDQo+IEBAIC0yNzUsNiArMjc5LDEwIEBAIHZvaWQg
X19pbml0IHNldGJhdChpbnQgaW5kZXgsIHVuc2lnbmVkIGxvbmcgdmlydCwgcGh5c19hZGRyX3Qg
cGh5cywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcgbG9uZylwaHlz
KTsNCj4gICAgICAgICAgICAgICAgICByZXR1cm47DQo+ICAgICAgICAgIH0NCj4gKw0KPiArICAg
ICAgIFdBUk5fT04oIWlzX3Bvd2VyX29mXzIoc2l6ZSkpOw0KPiArICAgICAgIFdBUk5fT04oKHBo
eXMgJiAoc2l6ZSAtIDEpKSk7DQo+ICsgICAgICAgV0FSTl9PTigodmlydCAmIChzaXplIC0gMSkp
KTsNCj4gICAgICAgICAgYmF0ID0gQkFUU1tpbmRleF07DQo+IA0KDQpZZXMgd2UgY291bGQgYWRk
IHNvbWUgY2hlY2sgYWxsdGhvdWdoIEknZCBnbyBmb3IgYSAncHJfZXJyKCknIGxpa2Ugd2hlbiAN
Cm5vIEJBVCBpcyBhdmFpbGFibGUuDQoNCj4gDQo+PiBTbyBoZXJlIHlvdXIgNjRNIEJBVCBtYXBz
IDB4ZjgwMDAwMDAtMHhmYmZmZmZmZiwgdGhlcmVmb3JlIHRoZSBhZGRyZXNzDQo+PiAweGZkM2Zj
ZTAwIGlzIG5vdCBtYXBwZWQgYnkgYW55IEJBVCBoZW5jZSB0aGUgT09QUy4NCj4gDQo+IG9rIEkg
dGhpbmsgSSBmb3VuZCB0aGUgaXNzdWU6DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L21tL2thc2FuL2Jvb2szc18zMi5jIGIvYXJjaC9wb3dlcnBjL21tL2thc2FuL2Jvb2szc18zMi5j
DQo+IGluZGV4IDM1YjI4N2IwYThkYS4uZmNiYjlhMTM2YzFhIDEwMDY0NA0KPiAtLS0gYS9hcmNo
L3Bvd2VycGMvbW0va2FzYW4vYm9vazNzXzMyLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL2th
c2FuL2Jvb2szc18zMi5jDQo+IEBAIC0xMiwxNCArMTIsMTQgQEAgaW50IF9faW5pdCBrYXNhbl9p
bml0X3JlZ2lvbih2b2lkICpzdGFydCwgc2l6ZV90IHNpemUpDQo+ICAgICAgICAgIHVuc2lnbmVk
IGxvbmcga19lbmQgPSAodW5zaWduZWQgbG9uZylrYXNhbl9tZW1fdG9fc2hhZG93KHN0YXJ0ICsg
c2l6ZSk7DQo+ICAgICAgICAgIHVuc2lnbmVkIGxvbmcga19jdXIgPSBrX3N0YXJ0Ow0KPiAgICAg
ICAgICBpbnQga19zaXplID0ga19lbmQgLSBrX3N0YXJ0Ow0KPiAtICAgICAgIGludCBrX3NpemVf
YmFzZSA9IDEgPDwgKGZmcyhrX3NpemUpIC0gMSk7DQo+ICsgICAgICAgaW50IGtfc2l6ZV9iYXNl
ID0gMSA8PCAoZmxzKGtfc2l6ZSkgLSAxKTsNCj4gICAgICAgICAgaW50IHJldDsNCj4gICAgICAg
ICAgdm9pZCAqYmxvY2s7DQo+ICAgDQo+ICAgICAgICAgIGJsb2NrID0gbWVtYmxvY2tfYWxsb2Mo
a19zaXplLCBrX3NpemVfYmFzZSk7DQo+ICAgDQo+ICAgICAgICAgIGlmIChibG9jayAmJiBrX3Np
emVfYmFzZSA+PSBTWl8xMjhLICYmIGtfc3RhcnQgPT0gQUxJR04oa19zdGFydCwga19zaXplX2Jh
c2UpKSB7DQo+IC0gICAgICAgICAgICAgICBpbnQgc2hpZnQgPSBmZnMoa19zaXplIC0ga19zaXpl
X2Jhc2UpOw0KPiArICAgICAgICAgICAgICAgaW50IHNoaWZ0ID0gZmxzKGtfc2l6ZSAtIGtfc2l6
ZV9iYXNlKTsNCj4gICAgICAgICAgICAgICAgICBpbnQga19zaXplX21vcmUgPSBzaGlmdCA/IDEg
PDwgKHNoaWZ0IC0gMSkgOiAwOw0KPiAgIA0KPiAgICAgICAgICAgICAgICAgIHNldGJhdCgtMSwg
a19zdGFydCwgX19wYShibG9jayksIGtfc2l6ZV9iYXNlLCBQQUdFX0tFUk5FTCk7DQo+IA0KPiAN
Cj4gDQoNCk5vdCBzdXJlIGl0IGlzIHRoYXQgc2ltcGxlLg0KDQpJJ20gY29va2luZyBhIHBhdGNo
IHJldXNpbmcgdGhlIGJsb2NrX3NpemUoKSBmdW5jdGlvbiBpbiBtbS9ib29rM3MzMi9tbXUuYw0K
DQpDaHJpc3RvcGhl
