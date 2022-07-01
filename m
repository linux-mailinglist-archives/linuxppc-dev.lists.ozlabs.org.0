Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAECB562C8B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 09:25:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ6Dn4Xsyz3dt5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 17:25:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=dSIzlJXd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.48; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=dSIzlJXd;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120048.outbound.protection.outlook.com [40.107.12.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ6D01dBXz3bsy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 17:25:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZyKwhBJpq/4MDClXI7BlFb0ce0Wh4lUWGk1ARSXWLARpBM/sQtbVffKvIOv7ceuwNbzGJQAngp5yZI9iYWLOelyh/mw1gMqhQS20EAe6SHaR6BjcjfuELSmYNXrH1svRhJNXjMA6V/alnrWChSAzLlSkcHNzB8jC4utn04dLkUpvnEs6bd+e6fHBVJsBtRGHinM5HNK/WaRS+iz8nCKATvRnnWDUt2zcGV046LRNgl/Ie7Wazls4IrXj4kzh2wM7kixHvydfelXMZ0eQe5/06TM/E36JH9ZdhyTHXpNGnJW46lu2ITy6k/lkCMcPU0gxXzizvBgiVJYzxW9VJOH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWBCqjpNqpcRQrBN4LbEntfLDTBU/QQgpiSG0XqzzZ0=;
 b=fTkGuEqc7Oy6a8v6664OdyCzrZmjcDps60CK6B4zXIlLuf9H6XjS75GOL4j59nL3CagjBnduccobbirWv1RCdsYS+AphFURkNqDHUaQX02KNWSUZBmDlOYFkvLA7W9sSdMOjn83bOj2c+5cSX3Qir5gn33mXzSh9e9hPOAx6wefUciO2coURa9jo7j+XnIvTENG4xNiaBfC2mEYFu0ziBHu4uRrTrB3GItA5cFnEQ/vEQf5MFy0ZQ85rICh5ZecbM8bRqJ0MKTsyG40NAWsmBPS29mEwacgLcpDrr5zrdE2p296v8NpSm/lvzIu8VgqlOtg6rRHz+125MqVdJf6S0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWBCqjpNqpcRQrBN4LbEntfLDTBU/QQgpiSG0XqzzZ0=;
 b=dSIzlJXdQHEtSfO6LaM83uc/jG8qGYrIt2p1HcgfJ1JB0fAfGBHYkWrIBgO2vtpoVUigheojV99UACCaGUaWSCKHmKXNDCrCZNw/uz8qne+UbLUCRBmx992JGykD+exqciXwonjgL7jnoissEnEvMGMczcgXameQOZSb7dpYVrg6WnArAl1M73NMzEgButPp/25p6aQ/HVZ9dbQjgdBmg2jiVyG0IfL5hgFXAtXxRqUit82R7IdA7Tf0moUEukH4GLCGzo1GNaCo4xW/TKOde529qCz16Y+QenMMS3JYwzJ+q4Wy7NuLZ1EMqkSm5xRzCEptgPIlLKn6VIW7V8Om4g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3278.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 07:24:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 07:24:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Sachin Sant
	<sachinp@linux.ibm.com>
Subject: Re: [PATCH v3 0/2] powerpc rng cleanups
Thread-Topic: [PATCH v3 0/2] powerpc rng cleanups
Thread-Index: AQHYjIoFfil+OTpZrEuO73b9AmLYSa1oHyyAgAAJkICAAPVyAA==
Date: Fri, 1 Jul 2022 07:24:42 +0000
Message-ID: <c075b458-a348-40b2-9f9f-c7daacba98ac@csgroup.eu>
References: <20220630140108.129434-1-Jason@zx2c4.com>
 <DFCB9812-6138-400F-9AF8-DE18B61C3667@linux.ibm.com>
 <CAHmME9oJuFzoQ7ARuMQd8AKpofUWEnFauRCxJbvymrp8cWj6fg@mail.gmail.com>
In-Reply-To:  <CAHmME9oJuFzoQ7ARuMQd8AKpofUWEnFauRCxJbvymrp8cWj6fg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 877e5a15-c6f9-4bff-c540-08da5b32c41f
x-ms-traffictypediagnostic: PR1P264MB3278:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Ub5FudjhPR3DKmz/Aj9htPlF4Kj+piurSl/hsxdGQouHODXgd2oK50s91YHKbcnfP6QEheLi22FenqXh1b8hws5bXydgXvPLzV4w7kixPeE7Z0nH5DPhkyFv1jMe6zo13dcWxFO5PHJtN8+gDm1rKS8rRGP+SjfYtkY5TRB5UCAmKQ7RKgNfTEQfjRHKjydgGvZ2LiqzJh0PSwhuSCZXSwkbPIJIx8yI3BCAIMc1dsUGi1G6kWVGFhcMMwmYjYg3SzgOzQBEE/s+FFdBXs7d1cl1VmW9rzDaNTDIRXAh8NnifX9hfqoxuZCePsQ3vmNiKMog7ANoyfkt1feQ8oTE2xKBkvpq8R2fnzCW0DsOP9ACKV9fa86t8yfYpthEpplB0MS7eIFOFEWp1cgdtZrzMN6nz1f6RsiRNzr/UPyh1e9QB5wSAqTp14zKXxWXYClVgFON21kIq3JrxXoX5BVxRrEpND3oKqRb4MjI5Wm2ZBYItMdK+fP0JosduqGOVmHHDJad3GhVBrGscu1l/tJm8c4tDWlrai+PicbeW01V+SSun+iuv963HbyduUuNk1E9RrW4C+2plq9rr4qgAeKkXGymJ91xRY4svabv+T7ft1537w5vTbpgcJ7ZY1j1TvTxAVAqfBlJcTkpJjxPYBjbJ+eA7BRGzn9i8/cgYDta//sW1DEDXwwXeV0YSanWpFlmJhkHdtlMVDGez0kC2faFN6d1CULFdfknvjkRe1U15oeQ/UF9QawWAUJRDkg/2KbPUiejBWLcH5bfdVF84ztn78vhKKssBeEeVsnmcih8LE60V5LN/RlOSbhVcbqtat/dZrCMD99g9j8YF1nTnapm9C0GaZx53JRe78nBUgtceHYJUjNxEgByv0eQAFkrDeS0m+H8WYyn95mjKvEUr1+BWrWMjeI10YdLXPmh73Dq+2E=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(366004)(346002)(39850400004)(376002)(110136005)(316002)(38070700005)(66574015)(31686004)(5660300002)(44832011)(45080400002)(38100700002)(186003)(53546011)(41300700001)(31696002)(83380400001)(478600001)(8936002)(2906002)(966005)(6486002)(6512007)(66556008)(66446008)(64756008)(66946007)(76116006)(91956017)(6506007)(4326008)(8676002)(66476007)(2616005)(86362001)(122000001)(36756003)(71200400001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dk1KbDBJcTNrNEh2V2luZC9BdmhFYkFVU1VqbGxiS05GekFYTFdkdExxRHVN?=
 =?utf-8?B?T2Y3aEFHNlV5V1h3UUJ2TWVLMjVNTFVWMzZueFFOUVArdkdROTlpam8yeWtn?=
 =?utf-8?B?U1lCUit3OUF6OEZDc1Bwem1HbHAxOWFpZXpXSTZuK1loUGVkbkdabllQVUFN?=
 =?utf-8?B?V3l4R1ZvSmxaTTdPVzlNSEZTaXd2QzBkQ1h2cVd2MTFwclpTNTE1NFB5Mklt?=
 =?utf-8?B?VFdyUkxBS1NHMTdlNVMrc1RNU0tldTdoTGlBKy9XazZMNkltazJsNUx0MldT?=
 =?utf-8?B?d3JGdEVxTWdUbUJrT1dwdFN4cFpMM3ZIRG5USDNMbWVBMEkxQjE1czZ1QnEy?=
 =?utf-8?B?RDFEWnVvL2RZQlpLTGs2Z1VZbDZjbUlWYkZ1ekpFYTkvakJxWGphM2xHMGps?=
 =?utf-8?B?eTR4WUJkazZ0ejBpL0NZc05HWTBFd1Zlb1J3aTJudzY2L0l1SHdjazRvblNW?=
 =?utf-8?B?UiswWW5BVFVBTlJ6N1o3VktyZExjOURxOU5TV3J3YWVBNTVhclRTcllaWGRH?=
 =?utf-8?B?KzJOT3MycU9BOEVMRjBhRUhHa0V3bm5JbzBpUTlQK2dOOENBVUZkQ0Z0U3Jn?=
 =?utf-8?B?RE5YZGJQTUgvYzRFOWFwUnQwanV4NUR3Wmc2Q2M3WjQ2M3g3SWdhVG5YSURE?=
 =?utf-8?B?eUlmY0w3dVBnZ0UyWlJOT2gvaksxN0p2V240UWhjSTdRTWtLZlhmWHc3SFpI?=
 =?utf-8?B?OEtSKzd1aTF4OEUrSWNwaENUWFdIWTQrMDljQ2p1RWtBczdzMUZUWmRqdTJa?=
 =?utf-8?B?b2Nrb2RpSFhvYjdsRlg3cUJBVGFKM3NFTjhaK24zYmo0cU4xRi9aOEl6dEkr?=
 =?utf-8?B?bU9hc2hyNUIvaFRwYThyNENmVVQrZW1vd0x1Vm9sL2o4T2JGVU1oUGlIQmkz?=
 =?utf-8?B?RWNIay9VV203RzdPREZZUmw2emRKZ3dhMzRoMHdBcWRnc1RBNHllMjM2andP?=
 =?utf-8?B?a1hlTkp5QlBVY1p1K1ppWURMMWpkYTJRUStXOVZ4ME00enNOVm12eHo0S2Jn?=
 =?utf-8?B?NzIrTjNaZGczQ0FyN21Ld3RpNHl6WkpaNy9jMElDd05PVnVvZnBiN3Evdkdy?=
 =?utf-8?B?NmNiZ05qMm9tNStXdnMwUDNnUURXd1FZQ3pmYzJUQkNOUHlyZmkvS0V3REhl?=
 =?utf-8?B?WDdaSFRvSFRrOG1odDRpZWNpZkFhRmNFQlA3U1lUcDRUY29HNnpMdFFON1d5?=
 =?utf-8?B?b3BrTWZrVFNibzd5bHhkM2tZWXgwMldBemZIZTQ1dmVaOEhzVWR3Tk9qOUNx?=
 =?utf-8?B?amUxMjZLOVNmR2FoSFJtc3VjT3kyamJBUThNaHZ1elpxbVZ1Vmo3ZVZRa1lY?=
 =?utf-8?B?cmwrQXNFZFloL0xUdE4xUGtiTE9vNTZOa3E2cG54Mlh3UG03OHBuVjZVR0Ir?=
 =?utf-8?B?bitVeW5TYzVTTjhpUW5meUtjY1VmN281TnFkOTJhaWxmSWYyYmk4Z2F0SWh5?=
 =?utf-8?B?S2paYnlBRTM2dXlHQ0RnU2IxcjNIc3hndElWL0xYYUZVQUp5WVpJVDI1bzlk?=
 =?utf-8?B?b2FSa1ZnSElFVEZSMVB2M3RWdzNrdVAwamg2ZVJSOGwxT1JuODRsOTZjUklQ?=
 =?utf-8?B?SklTenRUamJiR3diNTlQRXprUHZzNjVSYnc5MGxFT3pBUHFhTGJJTndnV01Q?=
 =?utf-8?B?ZEZkMEZWNHR5cjBiZ2sxdm9BNDluQ1dQYmpVQXZlN2Z2TUY2ZG1SQTVxanpW?=
 =?utf-8?B?R0U0RFp4UXNBcHZKZGM5RG5QY1I4cmMrbUh1YU1DUXd4VC9ybGZ5VUZzZkU2?=
 =?utf-8?B?Y0VyaWJqRDNlem9Pa2R5dm1mQjNtS1ZUOTloamsxTm1CaWxMRVBFc3RURHlk?=
 =?utf-8?B?VFZhVzd4WWtEMVAvK01ENzdOcjlob0p3aWdCUzNFS2N0OS9sNjJhbVJreGpK?=
 =?utf-8?B?L3JGV0hhWHc0cGxDSTBFY2hNZnpIYjNOUjdRS0p0QThJU09LNTJOZEhwUUlo?=
 =?utf-8?B?T0VFMUZCUHB2WHRxY2pxdjZQY0NHNkJ2RWVqVW8vdzZhcTNvZmhzNnhzQng2?=
 =?utf-8?B?c21FbDRKMUIzQ25RV2YwR0o0b2pEWVlsZXVRQS83UDB4M2J0cFFkdUFHZFRL?=
 =?utf-8?B?T3JNT0licktQR0hyN0FHV3p0Znd4NnJKTDFoNVRPOVZvcDgraWVuaGpYNHVR?=
 =?utf-8?B?ZW95d0RCbjZIWUZBVjllSGNrYU0rRElzNGRuYXh1alVCUVNraTcvZTZBaUox?=
 =?utf-8?Q?NFx/eNtN1IZVX91dvzdMcMc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F56C7B508692A41A9779939301DC258@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 877e5a15-c6f9-4bff-c540-08da5b32c41f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 07:24:42.3099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Sa7yMz6+iPOEsluDINF/gmfnBkIkY3xDUY5fTiDWccVIyLRrucsqluU1QlPC2a67AvC9YAK/Zw1fJCJ5R5kOSh0K7AZcQqRcXtAtzB0WIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3278
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMwLzA2LzIwMjIgw6AgMTg6NDYsIEphc29uIEEuIERvbmVuZmVsZCBhIMOpY3JpdMKg
Og0KPiBIaSBTYWNoaW4sIE1pY2hhZWwsDQo+IA0KPiBPbiBUaHUsIEp1biAzMCwgMjAyMiBhdCA2
OjEyIFBNIFNhY2hpbiBTYW50IDxzYWNoaW5wQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPj4+IE9u
IDMwLUp1bi0yMDIyLCBhdCA3OjMxIFBNLCBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0
LmNvbT4gd3JvdGU6DQo+Pj4NCj4+PiBUaGVzZSBhcmUgdHdvIHNtYWxsIGNsZWFudXBzIGZvciAt
bmV4dC4NCj4+Pg0KPj4+IEknbSBzZW5kaW5nIHRoaXMgdjMgYmVjYXVzZSB2ZXJ5IGxpa2VseQ0K
Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDYzMDEyMTY1NC4xOTM5MTgxLTEt
SmFzb25AengyYzQuY29tLw0KPj4+IHdpbGwgbGFuZCBmaXJzdCwgaW4gd2hpY2ggY2FzZSB0aGlz
IG5lZWRzIGEgc21hbGwgYWRqdXN0bWVudC4NCj4+Pg0KPj4+IEphc29uIEEuIERvbmVuZmVsZCAo
Mik6DQo+Pj4gICBwb3dlcnBjL3Bvd2VybnY6IHJlbmFtZSByZW1haW5pbmcgcm5nIHBvd2VybnZf
IGZ1bmN0aW9ucyB0byBwbnZfDQo+Pj4gICBwb3dlcnBjL2t2bTogZG9uJ3QgY3Jhc2ggb24gbWlz
c2luZyBybmcsIGFuZCB1c2UgZGFybg0KPj4+DQo+Pj4gYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L2FyY2hyYW5kb20uaCB8ICA3ICstLQ0KPj4+IGFyY2gvcG93ZXJwYy9rdm0vYm9vazNzX2h2X2J1
aWx0aW4uYyAgfCAgNyArLS0NCj4+PiBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvcm5n
LmMgIHwgNjUgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4gZHJpdmVycy9jaGFyL2h3
X3JhbmRvbS9wb3dlcm52LXJuZy5jICB8ICAyICstDQo+Pj4gNCBmaWxlcyBjaGFuZ2VkLCAzMCBp
bnNlcnRpb25zKCspLCA1MSBkZWxldGlvbnMoLSkNCj4+Pg0KPj4NCj4+IEkgdHJpZWQgdGhlc2Ug
MiBwYXRjaGVzICsgcHJldmlvdXMgb25lICh0byBmaXgga29iamVjdCB3YXJuaW5nKSBvbg0KPj4g
dG9wIG9mIDUuMTkuMC1yYzQtbmV4dC0yMDIyMDYzMCBuZXh0IG9uIGEgUG93ZXI4IHNlcnZlci4N
Cj4+DQo+PiA1LjE5LjAtcmM0LW5leHQtMjAyMjA2MzAgKw0KPj4gcG93ZXJwYy9wb3dlcm52OiBk
ZWxheSBybmcgb2Ygbm9kZSBjcmVhdGlvbiB1bnRpbCBsYXRlciBpbiBib290ICsNCj4+IHBvd2Vy
cGMvcG93ZXJudjogcmVuYW1lIHJlbWFpbmluZyBybmcgcG93ZXJudl8gZnVuY3Rpb25zIHRvIHBu
dl8gKw0KPj4gcG93ZXJwYy9rdm06IGRvbid0IGNyYXNoIG9uIG1pc3Npbmcgcm5nLCBhbmQgdXNl
IGRhcm4NCj4+DQo+PiBVbmZvcnR1bmF0ZWx5IGl0IGZhaWxzIHRvIGJvb3Qgd2l0aCBmb2xsb3dp
bmcgY3Jhc2gNCj4+DQo+PiBbICAgIDAuMDAwMDAwXSBmdHJhY2U6IGFsbG9jYXRlZCAxMyBwYWdl
cyB3aXRoIDMgZ3JvdXBzDQo+PiBbICAgIDAuMDAwMDAwXSB0cmFjZSBldmVudCBzdHJpbmcgdmVy
aWZpZXIgZGlzYWJsZWQNCj4+IFsgICAgMC4wMDAwMDBdIHJjdTogSGllcmFyY2hpY2FsIFJDVSBp
bXBsZW1lbnRhdGlvbi4NCj4+IFsgICAgMC4wMDAwMDBdIHJjdTogICAgIFJDVSByZXN0cmljdGlu
ZyBDUFVzIGZyb20gTlJfQ1BVUz0yMDQ4IHRvIG5yX2NwdV9pZHM9ODAuDQo+PiBbICAgIDAuMDAw
MDAwXSAgUnVkZSB2YXJpYW50IG9mIFRhc2tzIFJDVSBlbmFibGVkLg0KPj4gWyAgICAwLjAwMDAw
MF0gcmN1OiBSQ1UgY2FsY3VsYXRlZCB2YWx1ZSBvZiBzY2hlZHVsZXItZW5saXN0bWVudCBkZWxh
eSBpcyAxMCBqaWZmaWVzLg0KPj4gWyAgICAwLjAwMDAwMF0gcmN1OiBBZGp1c3RpbmcgZ2VvbWV0
cnkgZm9yIHJjdV9mYW5vdXRfbGVhZj0xNiwgbnJfY3B1X2lkcz04MA0KPj4gWyAgICAwLjAwMDAw
MF0gTlJfSVJRUzogNTEyLCBucl9pcnFzOiA1MTIsIHByZWFsbG9jYXRlZCBpcnFzOiAxNg0KPj4g
WyAgICAwLjAwMDAwMF0gSUNTIE9QQUwgYmFja2VuZCByZWdpc3RlcmVkDQo+PiBbICAgIDAuMDAw
MDAwXSByY3U6IHNyY3VfaW5pdDogU2V0dGluZyBzcmN1X3N0cnVjdCBzaXplcyBiYXNlZCBvbiBj
b250ZW50aW9uLg0KPj4gWyAgICAwLjAwMDAwMV0gY2xvY2tzb3VyY2U6IHRpbWViYXNlOiBtYXNr
OiAweGZmZmZmZmZmZmZmZmZmZmYgbWF4X2N5Y2xlczogMHg3NjE1MzdkMDA3LCBtYXhfaWRsZV9u
czogNDQwNzk1MjAyMTI2IG5zDQo+PiBbICAgIDAuMDAwMTgyXSBjbG9ja3NvdXJjZTogdGltZWJh
c2UgbXVsdFsxZjQwMDAwXSBzaGlmdFsyNF0gcmVnaXN0ZXJlZA0KPj4gWyAgICAwLjAwMTkwNV0g
QlVHOiBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBkYXRhIGFjY2VzcyBvbiByZWFkIGF0IDB4M2Zm
ZmY0MDAwMDAwMA0KPj4gWyAgICAwLjAwMjAzMl0gRmF1bHRpbmcgaW5zdHJ1Y3Rpb24gYWRkcmVz
czogMHhjMDAwMDAwMDAwMGQ3OTkwDQo+PiBbICAgIDAuMDAyMTMyXSBPb3BzOiBLZXJuZWwgYWNj
ZXNzIG9mIGJhZCBhcmVhLCBzaWc6IDcgWyMxXQ0KPj4gWyAgICAwLjAwMjIyNl0gTEUgUEFHRV9T
SVpFPTY0SyBNTVU9SGFzaCBTTVAgTlJfQ1BVUz0yMDQ4IE5VTUEgUG93ZXJOVg0KPj4gWyAgICAw
LjAwMjMzOF0gTW9kdWxlcyBsaW5rZWQgaW46DQo+PiBbICAgIDAuMDAyMzk2XSBDUFU6IDAgUElE
OiAwIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA1LjE5LjAtcmM0LW5leHQtMjAyMjA2MzAt
ZGlydHkgIzIwDQo+PiBbICAgIDAuMDAyNTM5XSBOSVA6ICBjMDAwMDAwMDAwMGQ3OTkwIExSOiBj
MDAwMDAwMDAyMDFmYTc0IENUUjogYzAwMDAwMDAwMDBkNzk2MA0KPj4gWyAgICAwLjAwMjY2M10g
UkVHUzogYzAwMDAwMDAwMmEwZmE2MCBUUkFQOiAwMzAwICAgTm90IHRhaW50ZWQgICg1LjE5LjAt
cmM0LW5leHQtMjAyMjA2MzAtZGlydHkpDQo+PiBbICAgIDAuMDAyODEyXSBNU1I6ICA5MDAwMDAw
MDAyMDAxMDMzIDxTRixIVixWRUMsTUUsSVIsRFIsUkksTEU+ICBDUjogNDQwMDAyMjggIFhFUjog
MjAwMDAwMDANCj4+IFsgICAgMC4wMDI5NzldIENGQVI6IGMwMDAwMDAwMDIwMWZhNzAgREFSOiAw
MDAzZmZmZjQwMDAwMDAwIERTSVNSOiAwMDAwMDAwMiBJUlFNQVNLOiAxDQo+PiBbICAgIDAuMDAy
OTc5XSBHUFIwMDogYzAwMDAwMDAwMjAxZmE3NCBjMDAwMDAwMDAyYTBmZDAwIGMwMDAwMDAwMDJh
MTIwMDAgYzAwMDAwMDAwMmEwZmU5MA0KPj4gWyAgICAwLjAwMjk3OV0gR1BSMDQ6IDAwMDAwMDAw
MDAwMDAwMDEgMDAwMDAwMDAwMDAwMDAwMCBjMDAwMDAwMDAwZGViNTc4IDAwMDAwMDAwMDAwMDAw
NmYNCj4+IFsgICAgMC4wMDI5NzldIEdQUjA4OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDNmZmZmNDAw
MDAwMDAgYzAwMDAwMDAwNzA0MDA4MCAwMDAwMDAwMDAwMDAwMDAwDQo+PiBbICAgIDAuMDAyOTc5
XSBHUFIxMjogYzAwMDAwMDAwMDBkNzk2MCBjMDAwMDAwMDAyZDAwMDAwIDAwMDAwMDAwMDAwMDAw
MDMgMDAwMDAwMDAwMDAwMDAwMA0KPj4gWyAgICAwLjAwMjk3OV0gR1BSMTY6IDAwMDAwMDAwMDAw
MDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMjc4IGMwMDAwMDAwMDJhNGRmZTAN
Cj4+IFsgICAgMC4wMDI5NzldIEdQUjIwOiBjMDAwMDAwMDAyYTUyMjM4IGMwMDAwMDAwMDJhNTI4
MjAgYzAwMDAwMDAwMDBkNzk2MCBjMDAwMDAwMDAwZmU2YzUwDQo+PiBbICAgIDAuMDAyOTc5XSBH
UFIyNDogMDAwMDAwMDAwMDAwMDAwMSBjMDAwMDAwMDAyYTBmZTkwIGMwMDAwMDAwMDBmZTZjNDAg
YzAwMDAwMDAwMjE0MWZmOA0KPj4gWyAgICAwLjAwMjk3OV0gR1BSMjg6IDAwMDAwMDAwMDAwMDA4
MDAgYzAwMDAwMDAwNzA0MDBhMCBjMDAwMDAwMDAyYWIwMTUwIDAwMDAwMDAwMDAwMDAwMDANCj4+
IFsgICAgMC4wMDQyNzldIE5JUCBbYzAwMDAwMDAwMDBkNzk5MF0gcG52X2dldF9yYW5kb21fbG9u
ZysweDMwLzB4ZDANCj4+IFsgICAgMC4wMDQzOTBdIExSIFtjMDAwMDAwMDAyMDFmYTc0XSBwbnZf
Z2V0X3JhbmRvbV9sb25nX2Vhcmx5KzB4MjY4LzB4MmQwDQo+PiBbICAgIDAuMDA0NTA5XSBDYWxs
IFRyYWNlOg0KPj4gWyAgICAwLjAwNDU1M10gW2MwMDAwMDAwMDJhMGZkMDBdIFtjMDAwMDAwMDAy
MDFmYTRjXSBwbnZfZ2V0X3JhbmRvbV9sb25nX2Vhcmx5KzB4MjQwLzB4MmQwICh1bnJlbGlhYmxl
KQ0KPj4gWyAgICAwLjAwNDcxOF0gW2MwMDAwMDAwMDJhMGZlMjBdIFtjMDAwMDAwMDAyMDYwZDVj
XSByYW5kb21faW5pdCsweGMwLzB4MjE0DQo+PiBbICAgIDAuMDA0ODQ0XSBbYzAwMDAwMDAwMmEw
ZmVjMF0gW2MwMDAwMDAwMDIwMDQ4YzBdIHN0YXJ0X2tlcm5lbCsweDk5MC8weGJmOA0KPj4gWyAg
ICAwLjAwNDk3Ml0gW2MwMDAwMDAwMDJhMGZmOTBdIFtjMDAwMDAwMDAwMDBkODc4XSBzdGFydF9o
ZXJlX2NvbW1vbisweDFjLzB4MjQNCj4+IFsgICAgMC4wMDUxMDJdIEluc3RydWN0aW9uIGR1bXA6
DQo+PiBbICAgIDAuMDA1MTU2XSAzYzRjMDI5NCAzODQyYTZhMCA3YzA4MDJhNiA2MDAwMDAwMCA3
ZDIwMDBhNiA3MTI5MDAxMCA0MTgyMDA0OCBlOTRkMDAzMA0KPj4gWyAgICAwLjAwNTMwOV0gM2Qy
MmZmNzMgMzkyOWZmZjggN2Q0YTQ4MmEgZTkyYTAwMDggPDdkMjA0ZWVhPiBlOGVhMDAxMCA3ZDI4
MDNmNCA3Y2U5NGE3OA0KPj4gWyAgICAwLjAwNTQ2NV0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAw
MDAwMDAwMCBdLS0tDQo+PiBbICAgIDAuMDA1NTQ1XQ0KPj4gWyAgICAxLjAwNTU3NF0gS2VybmVs
IHBhbmljIC0gbm90IHN5bmNpbmc6IEZhdGFsIGV4Y2VwdGlvbg0KPj4gWyAgICAxLjAwNTY3MV0g
UmVib290aW5nIGluIDEwIHNlY29uZHMuLg0KPj4NCj4+IFJldmVydGluZyBwb3dlcnBjL2t2bTog
ZG9uJ3QgY3Jhc2ggb24gbWlzc2luZyBybmcsIGFuZCB1c2UgZGFybiBoZWxwcyB0byBib290DQo+
PiB0aGUgc2VydmVyIHN1Y2Nlc3NmdWxseS4NCj4gDQo+IEh1aCEgVGhhbmtzIGZvciB0ZXN0aW5n
IHRoYXQgc28gZmFzdC4NCj4gDQo+IFRoYXQgY29tbWl0IGhhcyB0aGlzIGJsb2NrIGluIGl0Og0K
PiANCj4gKyAgICAgICBpZiAobWZtc3IoKSAmIE1TUl9EUikgew0KPiArICAgICAgICAgICAgICAg
cm5nID0gcmF3X2NwdV9yZWFkKHBudl9ybmcpOw0KPiArICAgICAgICAgICAgICAgKnYgPSBybmdf
d2hpdGVuKHJuZywgX19yYXdfcm1fcmVhZHEocm5nLT5yZWdzX3JlYWwpKTsNCj4gDQo+IFRoZSBp
ZGVhIHdhcyB0aGF0IGBtZm1zcigpICYgTVNSX0RSYCB3b3VsZCBiZSB0cnVlIGlmIHdlJ3JlIGlu
IHJlYWwNCj4gbW9kZS4gQnV0IEkgZG9uJ3QgYWN0dWFsbHkga25vdyB3aGF0IHRoYXQncyBkb2lu
ZzsgbXBlIHN1Z2dlc3RlZCBpdCB0bw0KPiBtZS4gSXMgaXQgcG9zc2libGUgdGhlIGNvbmRpdGlv
biBpcyBpbnZlcnRlZCBhbmQgSSBzaG91bGQgaGF2ZSBkb25lDQo+IGAhKG1mbXNyKCkgJiBNU1Jf
RFIpYD8gT3IgbWF5YmUgdGhlcmUncyBhIGJldHRlciBmbGFnIHRvIGNoZWNrIHRoYW4NCj4gdGhl
IERSIG9uZT8NCg0KV2hlbiBEUiBpcyBzZXQgeW91IGFyZSBpbiB2aXJ0dWFsIG1vZGUNCldoZW4g
RFIgaXMgdW5zZXQgeW91IGFyZSBpbiByZWFsIG1vZGUNCg0KRXh0cmFjdCBmcm9tIGRvY3VtZW50
YXRpb246DQoNCkRSIERhdGEgYWRkcmVzcyB0cmFuc2xhdGlvbg0KMCBEYXRhIGFkZHJlc3MgdHJh
bnNsYXRpb24gaXMgZGlzYWJsZWQuDQoxIERhdGEgYWRkcmVzcyB0cmFuc2xhdGlvbiBpcyBlbmFi
bGVkLg0KDQoNCkNocmlzdG9waGU=
