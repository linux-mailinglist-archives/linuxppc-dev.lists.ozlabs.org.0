Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A644D6271
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 14:34:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFRkB5vDgz30Dv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 00:34:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFRjk1Kftz2yn9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 00:34:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAcpItox412N0zYn5lbgU7HPZdpnU4J2/R+rmp04FqnvKyBt9UrxBoR258rs7jwBCWVeZeh4hQDgDlLEG27syTKQAQcuZeUNJz4ePSFz9jtS7vf6msOxovI0JwV8Qr5bZOOUKqDEiVSIlBYYnwHmWmw5hxyHyZMcjbaBx/woR21uUebD0DfmjoPMnDI6XG51AYhwKkbqpJteFbNyrbuMkO1GZiKj+ONnaF1MwKOykRw6IHf/fxmUUHg6BWEG+nbd1CdkfhBg4lFlkzEUjcgAr2HJrrvO0E/GWPmNFZZ/iAmlREMPOfWKZympSoVQH1WX3+LE8zvvKhb3A3u52BTl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dX0+3nsdUivkASMfoMbtVJZz6rX2bsl/3vZ1NGCAYeY=;
 b=gPtn9CftFtg31H+gWqLlHb0H8psl6NPK2tH/zHvOds3zCYw8y/sjZNdkUaQLsRnnrXYOUZVET9PiPKekJEDPmBDNjiNLn/aHpnN9Y2yfVaoKx1/0yr8m8WmjZoc/XvA2qk7XTRjJ770KM5ls3YkxRmKnx8gOdw828k6LUJ/o3Zowf/TnyjExOb5spoUbiqttFknf/k5M7zgZBAHjgE2KWDba8zjzftMxGQ/3P5BgPskTQSSyCUoUqMfYJA6HOanSeTzsbQQI3FeQDjxkZ6BgqsLAUk75+kfV4fCuTtzj+0AOTrKo2X0pHbVBBsZalJxytJ0dzdF0tOzT7yTxiioGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3145.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 13:33:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%5]) with mapi id 15.20.5061.024; Fri, 11 Mar 2022
 13:33:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: YueHaibing <yuehaibing@huawei.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "paulus@samba.org" <paulus@samba.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "dja@axtens.net" <dja@axtens.net>
Subject: Re: [PATCH -next] powerpc/smp: Remove unused inline functions
Thread-Topic: [PATCH -next] powerpc/smp: Remove unused inline functions
Thread-Index: AQHYNUbS0zqMT8BARUmTa0TLfcskr6y6LsWA
Date: Fri, 11 Mar 2022 13:33:57 +0000
Message-ID: <7ba59091-f547-4463-2e0f-df7b330a14ae@csgroup.eu>
References: <20220311125106.27812-1-yuehaibing@huawei.com>
In-Reply-To: <20220311125106.27812-1-yuehaibing@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6706c68a-ce78-485a-6d79-08da0363cb62
x-ms-traffictypediagnostic: MRZP264MB3145:EE_
x-microsoft-antispam-prvs: <MRZP264MB3145A20F35AE88086E838C9FED0C9@MRZP264MB3145.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S2l4KTbLhdyRzW0Z5wmQ1zTJWLloy0mGAuZDOWYJBw6Xk3v9aFASQ//Wp7GpZxEjWv6GyyA894fgea4347q/0IwQ+OxjGTjHIP+AGFD0epfETLsNBDaydnpmcraAdktxiks55kiH7et67Kk2kShfcf5hwF/MjadCC1M0QG2+ZcqoOHJEpTE7iLeFzovCw9GtdOZ6JC2pDsYaJb/U6APx/XchpPz3djBpePntFUJS+BU/ohBQrTXN8yP3OSGKXIKyC4r5Lx+D8wwWs0vC1cnE90COO7TEcV6kR3cK3cIdfhJAATuE98EKmNl0fZuE4QBJEMWhdOyvRmdBT6iNmHbaAuBR/8iZuW5fgskbmJM/0mUOLGj+ufs/gsRczJ6NDvyLAaNzqQFBEpQSQ+ektmkc6pAGzg9KR/dd4C00JsES0xx1evbWW9p67QN+anQC4xOTf+hXP4OdM61oLUFejl12Niev0BsTnZmArEu26qUNa1soLRgPgnyrRnyPKSuyBQjBAHgDlG0AA5NgCAS6x2AL5KLC3jVal7KGeKCIDnjTvtC+sGaOWlXUDcq0mD//wTG4CtgOCxmGx/veG/t+deVUUsBdKoL58ncjEv1NWpwDXhWd6NkwGp9hwsHHHi8MV6YzR/f9VxomMqWGV45RZW0yVp5jzAlDZFs/hWIJtC19VKXbhjzbXZLPqRGReDpLuOhREsbg7KlNbrMVuG74HfyF79+MK9iGRHwcgHa/pTEpc6XeI6ssGLPPlKYg1832f84pFDw0u9ecBCAjDuliqrRwLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(31686004)(31696002)(122000001)(91956017)(38100700002)(66556008)(5660300002)(110136005)(86362001)(6512007)(71200400001)(4326008)(54906003)(8676002)(26005)(66476007)(64756008)(66446008)(76116006)(2906002)(186003)(66946007)(83380400001)(6486002)(38070700005)(2616005)(36756003)(6506007)(8936002)(316002)(4744005)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akFDRll5WnZWeXAvMTY2YXdsN2tJM1lmdFM0KzBvcFA0VFVsS3FmbTRhSG9B?=
 =?utf-8?B?WnMwKzBLVng2c0EzaWZzd1ZKRVo4eUZrWXJPN0huSzJHS09reWYzUmhrR0tU?=
 =?utf-8?B?K1dieHM4eXJQakVHQjEvSzRpWExGTU91RlpNT1BWU1p3ZHNEWlFSSkZrRzZC?=
 =?utf-8?B?c280ZjliSm1hWjRRcXM3RHJ0K1ZudFFwemlENFZJWEJzRk9yMXZVdVV6OVlj?=
 =?utf-8?B?a3pGbTZXc0x0NlZMK3dCNU9MWlVlTU0vYSt6emZmUTVpNTFiTG9HZHJMTml1?=
 =?utf-8?B?SW9nWnhEdGpiRnIzekFQRUdudk1mMHJGOWxKZ3dreWFYbFB2RmRZcWlPcjZG?=
 =?utf-8?B?RUZiODVnM1RJRWFKYkpyWkt0VlRXMDM5L1REUktFZVZVMnNhN042OWR1cFMw?=
 =?utf-8?B?a2dBY1cvbStVeERJclJ2MS9tL21Rb2JJelVjQ1VFVlJ4Ynluc2NMdDV3RTR6?=
 =?utf-8?B?RDBoT2ErYThxTmxxcDF0WUVpa2hzVWUrdVhTQ1NkUHZDSEJmcE1VbXZTZml5?=
 =?utf-8?B?UUtpWFVtcnFhQ1k0UUZya3F6TWRGSFZxU0dPZFd6eU14aURTMFRhczExL0xz?=
 =?utf-8?B?bmF4dDVBcGt4TnpENTZsdTlEc2ZkNU51anVMZDlieFk5bjBmSGtJNVAyRldY?=
 =?utf-8?B?SUN1SUhmNWJBNURhUDhWYnJNMllSbkEwTWd6KzI4RlNBNGpkZVBOaER5OWtZ?=
 =?utf-8?B?UWVRQTJTRG90dFBGZEVwdWhFR2gzbVExcFlXUWpYL2VlSTZrckNkZnA4S0pY?=
 =?utf-8?B?SjBPTFh2bVBXY1diK2RkVkNaODdzMTlJa1BqMEFWOTBUNjdYYTFxSEhCMnN3?=
 =?utf-8?B?QXlhNHp0YnlzeDZqR3dtNHJMWWNoYlV3YlM5ZU1MNmRuWjdIZkp1c0ZKNHF0?=
 =?utf-8?B?YjJOZ3lLT1FES1dvSzBkVjU1VXMwTkprMVI2UEU0YURLSGlRNkt5bGp5WGU4?=
 =?utf-8?B?ZVhjeTNRbkc2aVRxVi9mT0pRZi9QWXJURVU2c0I2dGprVmF3WjZ5N1dZOGZI?=
 =?utf-8?B?a2g3UFVSa0JWYlk4Tm1hbmVKYVg1NXVydHVJWW9nK2o0UlR1MHJyUk9zenFp?=
 =?utf-8?B?YTMvSnE5YlFWcnNxYXc0UGhLVTNnc1pWYktLa1k3a2pMUytVVFQ4YjgvQ0R6?=
 =?utf-8?B?dy93aHR1QXJWcWpiSlNyVlRMRXowV3B4WVRVTVFVU1lVQ1Y3UXZ0MUdOcTlD?=
 =?utf-8?B?YjdGYW45a3JXWnBmVmFoZG9PUjVrZXMvd01kY25wMXBYbU8ycVh4M29zOEo4?=
 =?utf-8?B?ZUpSNUliM2gra25BQXhYRENoczE1em9ueXk2a3N5ak4yVjgraEJsTHl3QmRS?=
 =?utf-8?B?d05jRnpNaFphbGJmalFzeU9jRStHMVVaaUNtYmZzdVpqMGQvb1BiYkIzYlZm?=
 =?utf-8?B?NnFidlpqZldlU0Jta3E0cE9jNzRKMDNnN3d1aDMzMlBUbkpNc0NrM0xOMnpO?=
 =?utf-8?B?Rm5IbDk2WGEzNUhMVm84Z2Z2SDN5c3lZOE9Yclc2MmY4Wm5zS2U5VVM2c0Jz?=
 =?utf-8?B?bkU2M0hoam1lV2ZzOStRQnNsSVFkR29LK2xMZzVvVGNNYit3enVIY3A4MUFa?=
 =?utf-8?B?Ym5GQlhIdGFvN29rWTJXWnI5amt6NG1WMEtoSTlPM2MvbDJlbWYwSHJXVDZI?=
 =?utf-8?B?SEVlL0tmam1jcWsveFdBY2d6ajV6ZjFPeFNmMVNqUlloN1dKNk5SVnkvZ3BO?=
 =?utf-8?B?UUx6SDdqblpuZE1PRWxWZ1Vvamh5TGJHMC8wTjlzaFpoWUowdHVuUlZvN2NI?=
 =?utf-8?B?NEVlb3p1bXlBQjRKckN6U0R4ZmJpQ041cjN0dTZWNUNFUnQvT3lGREd5VXd0?=
 =?utf-8?B?bDlsOWxsUW82L1RYSzgrK216QUtNRHpjbDhXQVNTcTJFSmlLdURXa21COUJw?=
 =?utf-8?B?Q3dBRWRvcnl2RloxenU2bjNTNmhFV1FDSXBPdEtSNjFNZXJMWmZHNXpWUWdL?=
 =?utf-8?B?R0xpaG5BWG5LSFIxQVlIZHVBWFZsSVhsYW44WHprZUdSeUw2TXhvY3V2UHpO?=
 =?utf-8?Q?FJIEFzAWswiw7yHwl3NAFpFVUOQ3XA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4397614F07DE5E47BE0238A56718F73C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6706c68a-ce78-485a-6d79-08da0363cb62
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2022 13:33:57.4436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mw+2W6LmslEi/KsceAcUXQ57UZLq3Bw+0BWtOfG/OtdhMrD0O+Uj7eE39z/0xU/hkkjY7VCbkJ/Cgd0KdIpDLJqHx/CEfkD2U+boZPsZjoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3145
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzAzLzIwMjIgw6AgMTM6NTEsIFl1ZUhhaWJpbmcgYSDDqWNyaXTCoDoNCj4gY29t
bWl0IDQ0MWMxOWM4YTI5MCAoInBvd2VycGMva3ZtL2Jvb2szc19odjogUmV3b3JrIHRoZSBzZWNv
bmRhcnkgaW5oaWJpdCBjb2RlIikNCj4gbGVmdCBiZWhpbmQgdGhpcywgc28gY2FuIHJlbW92ZSBp
dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNv
bT4NCj4gUmV2aWV3ZWQtYnk6IERhbmllbCBBeHRlbnMgPGRqYUBheHRlbnMubmV0Pg0KDQpSZXZp
ZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0K
DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9zbXAuaCB8IDIgLS0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vc21wLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc21wLmgN
Cj4gaW5kZXggNjBhYjczOWE1ZTNiLi5mNjM1MDVkNzQ5MzIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9zbXAuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vc21wLmgNCj4gQEAgLTE4OSw4ICsxODksNiBAQCBleHRlcm4gdm9pZCBfX2NwdV9kaWUodW5z
aWduZWQgaW50IGNwdSk7DQo+ICAgI2RlZmluZSBzbXBfc2V0dXBfY3B1X21hcHMoKQ0KPiAgICNk
ZWZpbmUgdGhyZWFkX2dyb3VwX3NoYXJlc19sMiAgMA0KPiAgICNkZWZpbmUgdGhyZWFkX2dyb3Vw
X3NoYXJlc19sMwkwDQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgaW5oaWJpdF9zZWNvbmRhcnlfb25s
aW5pbmcodm9pZCkge30NCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCB1bmluaGliaXRfc2Vjb25kYXJ5
X29ubGluaW5nKHZvaWQpIHt9DQo+ICAgc3RhdGljIGlubGluZSBjb25zdCBzdHJ1Y3QgY3B1bWFz
ayAqY3B1X3NpYmxpbmdfbWFzayhpbnQgY3B1KQ0KPiAgIHsNCj4gICAJcmV0dXJuIGNwdW1hc2tf
b2YoY3B1KTs=
