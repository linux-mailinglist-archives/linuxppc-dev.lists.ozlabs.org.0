Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447E4690B9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 08:19:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6vtY49lbz30RH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 18:19:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60a;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6vt26XRmz2xBD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 18:18:32 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWdG1Sfn/eVbiVWWoMxjQZBwn9H2N/ZEWsQg0306rIoWO+X+MnsjDU9ZYVeDcyYUVLc9xg3zKumMspFJRWjThBOcSvnfgZ5HPGWCkaBG+YaBYyPJeFlOd9nhBRk93E51SifAFbBB5+x3tYLZHUxUfbg80sRyAnxUW2UJPqRVyqzdLOEIxZAR1npM1PF1BrXT3Lzj14NTicEGp0oYzPC8l3SpjMB4TWL0ITBINnpHyhL1EW9gicbbG5u1LbYiGxtpKDFrgBv3luf0ZrulNuztd+s/jJAN2jkX68IfhCfwSwnmD8O5qrzhyjfcDTRZipwS5OcfEYyQAPfTC3VluPcveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN0QS1p9aatJrIawShMboINRNGW17Oev0us2IFY/fAc=;
 b=naAMyN3WmcEClPcUCeirZKPKNzcwKC/IbNa6dn5MqrXmFAh62nSAlJmpdOCO+GMETO5ErQl0UdJk4PiSCubRF3Cg8QEtAa+afypAOofPyY3nES5svF6J+kJyLbfz/xn/5OhLiehAga1YXxV+9d6+pU82hWOiMM0VHh25ANXQidrPtHd9tQlxfJ1zO8FITWNJagjRA/j4/kUbeqrixLTjfe6I0tzSPpn26tKrdbxrBbz+ZSuAfQaj3YFHmttL8tlLu+4MteJ0wW93OnElh4/Vy0JhyINMWsWj22d/OaMfoijAMCHdarM9wS6mtTOo5HP89NRr4FyzB+MiYH5UPfQCOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 6 Dec
 2021 07:03:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 07:03:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Maxime Bizon <mbizon@freebox.fr>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Thread-Topic: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or
 nobats
Thread-Index: AQHX597pFZD8fwjYfUOPVLOQ2QefI6wguJIAgABjAYCAAQBigIAARbGAgAA7TICAAYFwgIAAGRKAgAA7RACAAJxUgA==
Date: Mon, 6 Dec 2021 07:03:39 +0000
Message-ID: <cea77e1e-9972-33cf-3ef8-e0be5ff26b63@csgroup.eu>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
 <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
 <20211204141031.GA23757@sakura>
 <5f4d36a1-695d-38a7-9ff9-d5af97f1a7e0@csgroup.eu>
 <20211205164217.GA29658@sakura>
 <d39825e0-6b48-5ac1-662e-26186e730eaa@csgroup.eu>
 <20211205214408.GC29658@sakura>
In-Reply-To: <20211205214408.GC29658@sakura>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 654b892c-b9dc-490c-8517-08d9b8868823
x-ms-traffictypediagnostic: MR1P264MB1650:EE_
x-microsoft-antispam-prvs: <MR1P264MB1650731BBF3A7A36F83C3EB9ED6D9@MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2bZeEV83jpvCOAIchUU/M5WMnsTkmOcWAlmvbIIU8y9mljA2Vyjn2ancOMA5nLwZZdoPMX0s62TH69UaesKZ6UJkz+AJLzw1Sd73PitEICK1cZI3yQv50LVRtT4VfPlJH/ywFOHv/5QO89t8r375ra5zJjLqCKA+2C/v/JGlJQzRC5CtmxPZVsMOElDOAvaWFHBfYaD3EfpZQn+gKg3kXR2T0v3/N0DlJMHrMZjaYtYptfm76pmOdVJ/ZdQVBOjspJ2cv6o6RASTDE/OLqGUffpAweY+bXyhmsI83JxwVBFnkE32QaAUibwL4utqbqveT5QQbRpsQjava7S0s99qslkPEnifOUJHiM6UJFGJqaUFr+vmtZwz+bOurJyRZflS2HyQpSqmIR8yDIGiS0/SziVCIpPvdhPHOzkvaNIjLeQF+c0JxaUzS307R2mhuFyNqHxo6Ow12qHc+ZCmyN558Q8J67LBc+bfflYxSyjq2poCMlP1h+fRBir4VwrO1HP4Oe9pMu9duodY6yXwkO5wrfz4TVTmyXR4VpIvwk0+V1s7Iw/ldJvpyg6kI6E9LyE7l5+9hH/hAOHhO3GhH9nBTOHsYIAJOn/gaT8CK0uM1zgmOccqxgxK+cz00eO0ePybUAWWzocltkCn/lDIB1KuZdaEiLS3Te7BEVBNr6Ohqxh4zVlxyt4mWnJ6W0Axpuxb2K0uV4bv9eZnAyq7IgE97lGuhdHwJVE8JQ4FZXsYYuuSp8AgX0/f2UqJ/ofyrmBU1qKpyjnKhvNC6efH7YQKMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(2616005)(6486002)(38070700005)(122000001)(6506007)(31686004)(8676002)(38100700002)(2906002)(64756008)(31696002)(66446008)(316002)(91956017)(83380400001)(44832011)(76116006)(186003)(66946007)(5660300002)(6512007)(4326008)(86362001)(66574015)(8936002)(71200400001)(508600001)(26005)(6916009)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wmx4YUVyd0tneHJsaEw0RU4rYjM0aWJWckNxeG04clEraC90Y0JtaThhVDB5?=
 =?utf-8?B?ZEpFU2NSYTh0SnhoZVBxc2JseWZuQnpweEhmcjE4TjQrRkpIRENUa0hkTzZa?=
 =?utf-8?B?Vkk2R1FDY0NtWVhGOHJnc05wci9WcHlnc2Fza1hHM3dMZ1RrY2hQMmU0cGNZ?=
 =?utf-8?B?MG5KdzJjRjlIZWxQckVyR3V2S09JZXoydEFMeEptSXpDN2hsd3V3Y2dzNU5o?=
 =?utf-8?B?WWluLzRsZlRRdkkxbmpKMXpmd2ZyYjFRdkVhd3Q2eFZUN21tUnBSSHgrY0NJ?=
 =?utf-8?B?SmkwK2xpeDUzMzd2WEVRU3Bqdlk0ZEt2KzZUeVY2anhaTE8zZ3dGMTByRzhk?=
 =?utf-8?B?MVRGK2ZqZWNlRTAycUkxdEZGNjIvNVJiRWorZDAwcTQ1RmNMc0JqRHVzcnhN?=
 =?utf-8?B?VDdVZzZsUGRWRTFOb2JKYThPcE5CWHNxakQ4bU5JbGNyRUJkT3pxaFBzdWI4?=
 =?utf-8?B?YWhtN0YrYjBHaEFQM3g1alJPNDBUb3cwZTczMEo2NFhUZ3VVcGpXTkZwV3BO?=
 =?utf-8?B?aGtMamNzN2xkMlFqVnZXYjJuODd5bEYvK25tS0hvL2M2dWZSLy91NTRpL0t2?=
 =?utf-8?B?WGRGRlh4VU5oVmxVNEpSNy9STVpXbGRSK1B0dnZQYUVneWlDRnJYcFJ6YW44?=
 =?utf-8?B?SEZmTk5jMi9sdWxiVFhUMVlYZEUzcFdJa1RKcXlWeC9sRzJDVlM0WjZ1UWFW?=
 =?utf-8?B?aXlWSi80cnk1aEtFVUI3S2RjZFJzRWxzMXppVU9ycUE1TkRRY2VzMkp2eVRX?=
 =?utf-8?B?U1kxZzlNaWtiTDB3ZCt2bUdNR083bWxHWGdjSlhFQTkrb2V3OHEwa016OXhL?=
 =?utf-8?B?bUJMRzhzV2hGdUsrMFM2VUVkc0V1ODZLVUpvNlNzc3FidGl0Q3RUZHpnUi9D?=
 =?utf-8?B?ZWJ4MmhBUEZUcXM1VW9iRCttTlFZblFwVTBiR1hEeU1KQlN6ZDZsWUNHYlla?=
 =?utf-8?B?SlBkNDd4NU1PQ3NuVWU0UWNoOGxXclJWbGJ0WHcvRkRuMWVoKysyUktwQ3FI?=
 =?utf-8?B?TWVJVWVsNkZ5Wng5bjJ2U2l2eTNRMC9QUzlmWk9TRVBGNkFhMWhLN0U5WTFp?=
 =?utf-8?B?SnVpTG5yM3BWdEFGNlN1OTNsS0Fib2hJa0IwdllaWGJVK1lsdXErRDMveFRT?=
 =?utf-8?B?MmNuZVBKeTFHK3g4SUFNcDl3eHh3L2xDam1EdmxaTVdxWkQ5Nm1ZZjA3N3BV?=
 =?utf-8?B?Y010NFl5eGZZdGRSQzFXQTdzRVovd0FBejcxZEF3RzR6UE54VDhvLzF3TUJS?=
 =?utf-8?B?SEdDYm95SmJvNUl0TG5RcDA4dHFIZjJMdDAyRk5jbWR1T29PbmNHb2VjZ2lE?=
 =?utf-8?B?T29yN2NZb0daTzNtZTBZRW9Uc1hrTGo1RGlrY2MvRzBlQ2FheFNpdlVnOGlV?=
 =?utf-8?B?bU1wb1JrckxRVU9yK2FDb2pXUGFNOXppTy9hZ3lSQmZYem1XOEE0Q3JpcDJp?=
 =?utf-8?B?TjNabVpMV1hTRWpoOENQMDk5aTdRdEZYWGVabTJqM2grQWp1a2R0b3d0NUlX?=
 =?utf-8?B?SmFXcEF1RURjWHo1NGtxZjgzN1BGMno3MTdVY2xGZGFVUXNBY0JBTVBHQVJU?=
 =?utf-8?B?VDh3ZlpScWlmL2ZxRTNaSEtadUtBZ0l1NGZmcHBmYWxud0Juem1xK25FaEZL?=
 =?utf-8?B?ckdCN05JbHdmakNUMlAxMHFNNTlLdmd3Q0QyWDY1dytWbkNRc1FqSEdrbHRE?=
 =?utf-8?B?dDFyR2sxZ25wSTRFb2kxUzZFenUyemRDV25hNnlwOE9Kd0ZOajlrb1RDZkd6?=
 =?utf-8?B?NTF3dmFBZFBlMW0zRzJJN0xXWTMxMklkMWc2R2VYbFp3MXNLc090MXFrb3lH?=
 =?utf-8?B?engwS1BvdHNUUVhXVWRDUWdKU0w1cFhmZDVwOWtUVkhqNGF6TGVCL0VMdC9i?=
 =?utf-8?B?dnZEcENBUHp1Wm9TenBHSXI4SFN2NXhMd3JYejE0QXUwN3hIa0VZSjJid3pB?=
 =?utf-8?B?MlNlcmxHdkJVVDJOYWtkMk5yRUdFaUdnemJJRzVGS0lDTzB6M3Q4T2p6elI3?=
 =?utf-8?B?TUo1S1hDdkd0bHU1STh5cFpvdEYrWEVlcUJLaW8yZUJlT0s2QjhyWUQ0bkl5?=
 =?utf-8?B?bHcvcU9oeks2Q05Jb0pJN1RIYU0vMkdqbWdraEVlaUxVNzFBTWg4b20wUXFB?=
 =?utf-8?B?MHdaZ3BhZXhJR1lYNWI2SFU1YSttelFPb1NOQ0p1eUN0SUxxTVloT2N0cFkz?=
 =?utf-8?B?Zzd5V1k5YmxFeGZPVGJvdjNPckljbyt5NlJUek9aaXhDcGEraWxTZGkzWE1I?=
 =?utf-8?Q?kE1GQ2Keqpi6vaT2hH1IYfasLLwBtip3yYGURat4EM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EE2CE4CF747644986EC8DECA4EE9F1A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 654b892c-b9dc-490c-8517-08d9b8868823
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 07:03:39.7379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ox1aJa+TNZIcqQ8zRE5ANFwgc0aQsK+J765gZcIrwXx1H7bukAT2kuE/B2NkueKCELkjYZWawgQzzO02iPnqx2fpFC6yrGX/Zm0omfakfCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1650
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

DQoNCkxlIDA1LzEyLzIwMjEgw6AgMjI6NDQsIE1heGltZSBCaXpvbiBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIFN1bmRheSAwNSBEZWMgMjAyMSDDoCAxODoxMTo1OSAoKzAwMDApLCBDaHJpc3Rv
cGhlIExlcm95IHdyb3RlOg0KPiANCj4+PiBJcyBCQVQ1IG5lZWRlZCBoZXJlID8NCj4+DQo+PiBT
dXJlIGl0IGlzLCBiZWNhdXNlIHRoYXQncyB3ZXJlIGtlcm5lbCBleHBlY3RzIGxvd21lbSB0byBi
ZSBtYXBwZWQuDQo+PiBBbGx0aG91Z2ggdGhlIGtlcm5lbCB3aWxsIHVubGlrZWx5IGFjY2VzcyB0
aGUgMTI4TSByZXNlcnZlZCBmb3IgS0FTQU4NCj4+IGRpcmVjdGx5LCB0aGUgb3RoZXIgMTI4TSBh
cmUgc3RpbGwgbmVlZGVkLg0KPj4NCj4gDQo+IFllcyB0aGF0IHdhcyBteSBwb2ludA0KPiANCj4g
SSdtIHdvbmRlcmluZyBpZiBmb3Igc3BlY2lmaWMgUEFHRV9PRkZTRVQgdmFsdWVzLCBfX21tdV9t
YXBpbl9yYW0oKQ0KPiBlbmRzIHVzaW5nIGEgQkFUIHRvIG1hcCBleGFjdGx5IHRoZSBLQVNBTiBh
cmVhLCB0aHVzIHdhc3RpbmcgaXQNCj4gYmVjYXVzZSB0aGUga2VybmVsIHdvdWxkIG5ldmVyL3Jh
cmVseSBhY2Nlc3MgaXQuDQoNCklzIGl0IHdvcnRoIGl0ID8gSSBoYXZlIHRoZSBmZWVsaW5nIHRo
YXQncyBtb3JlIGEgY29ybmVyIGNhc2UuDQoNCg0KPiANCj4gT3Igd29yc2UsIGl0IGNvdWxkIGNv
bnN1bWUgdGhlIGxhdGVzdCBCQVQgYXZhaWxhYmxlLCBhbmQgdGhlcmUgd291bGQNCj4gYmUgbm9u
ZSBsZWZ0IGZvciB0aGUgYWN0dWFsIEtBU0FOIHZtIGFyZWENCg0KRXZlbiBtb3JlLg0KDQo+IA0K
PiBNYXliZSBtbXVfbWFwaW5fcmFtKCkgY291bGQgY2xhbXAgdG9wIHRvIEtBU0FOIHBoeXMgc3Rh
cnQuDQo+IA0KDQoNCkFuIGFsdGVybmF0aXZlIGNvdWxkIGJlIHRvIHRyeSBhbmQgdXNlIGZvciBL
QVNBTiBzb21lIG1lbW9yeSB3aGljaCBpcyANCm5vdCBhdmFpbGFibGUgaW4gdGhlIGxpbmVhciBt
YXBwaW5nLg0KRm9yIGluc3RhbmNlLCBpbiB5b3VyIGNhc2UsIHlvdSBoYXZlIG1vdmUgdGhhbiAy
RyBieXRlcyBtZW0gSSBndWVzcyBhbmQgDQp5b3UgYXJlIG1hcHBpbmcgMHgwMDAwMDAwMCB0byAw
eDVmZmZmZmZmLiBNYXliZSBjb3VsZCB1c2UgMHg2MDAwMDAwIHVwIA0KZm9yIEtBU0FOLg0KDQpC
dXQgSSBkb24ndCBrbm93IGhvdyB0byBwcm9jZWVkIHRvIGRvIGl0IHRoYXQgd2F5LiBUb2RheSB3
ZSB1c2UgDQptZW1ibG9ja19hbGxvYygpIHdoaWNoIGlzIHRoZSBvbmx5IG1lbW9yeSBhbGxvY2F0
b3IgYXZhaWxhYmxlIGF0IHRoZSANCnRpbWUgd2UgYWxsb2NhdGUgS0FTQU4gc2hhZG93IGFyZWEu
IEJ1dCBtZW1ibG9ja19hbGxvYygpIGFsbG9jYXRlcyANCm1lbW9yeSBmcm9tIHRoZSBkaXJlY3Rs
eSBhY2Nlc3NpYmxlIGFyZWEuDQoNCkNocmlzdG9waGU=
