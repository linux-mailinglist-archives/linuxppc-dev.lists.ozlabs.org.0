Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1624E6E80
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 08:07:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPtT55zkMz30F2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 18:07:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61d;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPtSZ6drlz2ywV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 18:07:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GM/MKCIzEign3GsgCegr5AUNdp8h8m6bV0k6mLUJ0yJDckwgQQpa03YKJiY9YdftsCXKpQzm7+OcgSNOrLjACIWhWYrb5C/tqLzdes+0uXlO9Au7D3v7bgmI39aGZZimeTTO1xUvpZ/HkzhpBj4gU3YlVKmmpyN+DzQvIVf0KoDPqGsoxQdV2HsYvhUQ6DgOhg/zxsNNPwYxaxekY42MH3U5TSRx/9O3PSe4OdDqviHXBoNzqYddMPTxP3mljIUtyD50hVWkn+RmXTMduQAwsL6BtVbAfC7vhgwq72dobP4J7tCz3qpuPAVjvgsBLRCj3X6sqSNhvEtczHGCQwvu8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPq+wQj+fnDtlEKFtE01A9hb5C6AmfvdW57cAI0WQbk=;
 b=aEVjQyimtaueCFGe9QKsf+PTTz7Luzc1aoC9KMa1NtkgIewnqYgCyCl6KIiFT5Dy30Y7lzPwa0ke33TqeT23EfjDQHnWx7jhCEJlPPcewwSOnKjRvhgm9fubXFz2aM7IzixKaq3Ddgc/+SltlDhcBrpuFpuWg1z4th+XDAkydHGyHsH031xYnFZj8FoXcv4QqOo8XJrsv642XVgHN1CUBCAGS/yM26jcmfV0d+/35/Oq6GVuqWYObO63+uSFBidHtZP7wPEXaHOal1YiEj9sPibuBU3XwvBKus0JJI7ox06kBc9Xw+pZK+uRki6cKLkahDOvhV2nIDMjqFLa92NyiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB4200.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:257::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 07:06:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 07:06:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1] ftrace: Make ftrace_graph_is_dead() static inline
Thread-Topic: [PATCH v1] ftrace: Make ftrace_graph_is_dead() static inline
Thread-Index: AQHYP2Y3Bo2Kk3gAc0qX9wyOl+znDKzPH4cAgACPcQA=
Date: Fri, 25 Mar 2022 07:06:45 +0000
Message-ID: <eb94fd9c-39f4-cdfb-c04d-abe9ad26a15e@csgroup.eu>
References: <529ece004e0901ca04ea0e07d6bf8476612e2294.1648116004.git.christophe.leroy@csgroup.eu>
 <20220324183320.000d7088@gandalf.local.home>
In-Reply-To: <20220324183320.000d7088@gandalf.local.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ebd3df8-8791-48ec-c448-08da0e2e05a9
x-ms-traffictypediagnostic: PR1P264MB4200:EE_
x-microsoft-antispam-prvs: <PR1P264MB4200093D88B0C05DB3051E54ED1A9@PR1P264MB4200.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yeomQbrP5x1lCNAzV8u3DLrLQl00Rll2ZnCrZIJ1wVdVSJaKLEuPGYPzVOzWpUzywEGk0UER6KvyTCCc4UWk0BfdO0DzB8gS92zULfHpiUcyCcBI1+0X3zLmpLFig6YwCBQe8UT1gEDUSJI6eaLiJdonZY54MyNKEuK8IHs1gV8nJ7o7FO8YqAGas9+ZLeX9D+nFSz+op5tbJDaSXe8zsPnJE+07U6555FV8ovVTcU9vvvsuAXVVAAWnpeEz+sKE/1CWRbSPV99vTdUFA+rpR+RxYKIOE0Bn6tNfw6KhaN3NkHyDbOd++LbsJAyNJL3+YrPb4djtc/LxaQcEKIQ4DI8N66p9ss+WGrsN2IzhJjyUgXTLFN69imz5l8GbRY98t4TlaeAss5Qd1d7CqNmm0zja6e0ZUVCuLFiNi/ffUbjHZFNuj4h1pyBryuucVq6u6eUDfrbHIO29N2K2UJjMFzDKtDDMlF2m4O9/TFfdVYaid5tonbJZZV8CGm+lSsydjeCdG9u9wjt4HWhWLZ/A+aFqpSXDDKhVJ9rjT2ofbbJqFa2U0Whupm53Hc5xW7kbSQGJguTe5K6f8jvEBT2B6zegLgfSwmQOSoeaTGea3s/Wv4D6qPqIeQkMjTmEP/Yon9+d28Ze8NAV/aG5SyVCGQBQ+A9gnpBosyUoO7nh5V+E53LM1IJkd8sNhZfYLjGRVPsWI/JtEd7pNHA0pzlD4aYOqm/sE/C05GMpsLHN+6w3I7xQzl5P0kQBYm5jBgNwAKOvAliy94Cw/pY7oJYPVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(36756003)(31686004)(54906003)(2906002)(6916009)(6486002)(66946007)(86362001)(31696002)(6512007)(2616005)(316002)(122000001)(6506007)(5660300002)(26005)(186003)(91956017)(8676002)(66446008)(4326008)(66556008)(66476007)(64756008)(508600001)(71200400001)(44832011)(38070700005)(76116006)(83380400001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2NjaWdQY0V4aHpuQkdIWURPa1VyRUFReXo4Um5BVEVxUE1wUUlZRkRUM21C?=
 =?utf-8?B?bmxxVXh3OXZzRU9mQ0Z5SFFodHZlTzMvOVc4dDg1a2J5UWd1SGtya21QbHli?=
 =?utf-8?B?eWZCZlFSSG9FSWtmcllnVEVWZTVOWlh6MTkvMXlJK2M4dVdIRUtESzVOaG5h?=
 =?utf-8?B?cWR5OHBUTkJuNk5GcW1PaGdHeExQZlZkTTU1WEoxakorbk40TjhiamJYVTlT?=
 =?utf-8?B?YmVJdU5XR1FheXVtMTFMSVFvWkNteTJzM3BrWnNHNjlxem0xWVkrQk1HUUJy?=
 =?utf-8?B?SGwrZVZORjZvczNOVmIycUJzQllaTTVTMFBDSWYvVTYrQW40bVlTME0rdkFZ?=
 =?utf-8?B?S0FyUTdlR3BnRGJqaVhhMkgvL0I0eFl4RUY1c1RjK3pPM2lQUnVLQUllRmx0?=
 =?utf-8?B?bTRLRFYybkQ1WGRQK0dTUEFYU1FqYkNOVGtpcTZSMG8wWTBIN2paZXJPQVZP?=
 =?utf-8?B?VDFKLzQvZHpGdFdBMWVOMmVkTUhzQVhKU05Qc2ZrU3RHSCtaeGRKc1prbjh5?=
 =?utf-8?B?UFJpOXl6TDB4N0tYOHU2dy9qUkxta2tnNXZpQk5FNWNycEZRWDlkak5sOUVi?=
 =?utf-8?B?Vms0a3NUdXJ5WjhLRkVuY2sxbHBRbE5rWlNFSWVUVWJCcjhBaUNsOXVhTnNT?=
 =?utf-8?B?NUhnTGxEY0FDNTZvenhtQXFaQmtvN2xUc20zWHdEYnBNNDE4SDJ5RnVPN1dz?=
 =?utf-8?B?RVVlRXdQNGIwUTdXdGNzc0VkTENDQjVnbktiN25NSjlvbzV3Vlk4YmsxeC9I?=
 =?utf-8?B?aGxCWHdXS3I3cGVwb1IzbGhZSmQyT1lFOTllR2VGbnZDTnJQeTExRlJWQnFR?=
 =?utf-8?B?WDIwWWY5MDZQc1FPazNnY01aOWRlTGVBTEFzRnlUbGp5c1RJQjhxOWVnS2pR?=
 =?utf-8?B?YWxqS0locHU1dDRmbUNmM2l2emNqTEpJbVpDRllDL0lmMHF5anlLOXp0dlBi?=
 =?utf-8?B?b0ZvSURkSmNHRnNhMElRSXhVa2RIRzVMTFZWK0g1MW5ocTE1bzdTYnhMV214?=
 =?utf-8?B?R3habTg3TnBRV0laWStZMmdINFNHSUlzcmx1YmRyQkd5ZnZTWGZLallaMlcy?=
 =?utf-8?B?dDRnVXdRVGREV2NkalBTNXpZalBzVTJNNEhWckxzR29yN2FJRWM0elRFRU5Y?=
 =?utf-8?B?SGJhd0ZNb1h5ZTljSkRFVEw1WFczOXFoSFUzMElQRVJzNWFKK2JLM1FyRXQ5?=
 =?utf-8?B?bXNNSGRCdHl0b2NrbmZYOTdCWnRmTnp0ZjFQVHlDM3lDYUdqaUJRS0RKTmFw?=
 =?utf-8?B?dldISmlXbmFuOGFQaUVtaDRmd01LMFNZU2hMeE1pcUV2UFVqV2liWnZoUHBF?=
 =?utf-8?B?Wk5TSW1OQkpmTmJsbUk3VlhiNkh0TWVkL0FjQUpxRk9BZGFub0p2cjhJSUIx?=
 =?utf-8?B?aTRNNE4yUmFJQVpRNmVrWldXSW9Jay8yM0pYZFMxSnlGNHhXRUJ3eG5DNldQ?=
 =?utf-8?B?QUZzZTNSdklTcFh2U3RGdEN5LzAyMnRkOGs0NmRISVdrMU9xNVVvNEJsVGcx?=
 =?utf-8?B?VUlsTXo4TnFrVUQ2dExXd3ovMjgxbGJvdUhObXl2ODNLcG5YYTlOUHVENmtQ?=
 =?utf-8?B?T0UweVFrMGdXQzdoWGVvTitIR3VScGdHSDNNd3pwdUxqdFNNbjJKa1ZLQnI4?=
 =?utf-8?B?OWNjMjB0aXl4WGFpOFJwcVJSVDAwSWlOSmR4Znd0cVhuYytZclEvUWlmaUw5?=
 =?utf-8?B?eGRtTENqekFyamY2TSt3L0Q4bjVlNmhOSG4xNklMUjJRaitwNGNpajdLRVRj?=
 =?utf-8?B?QUNlTGNCME85aGF2WW43eGJXYjlkTmZBZTFlNC9hd0ZGd1ZMN0I3VGJONTIw?=
 =?utf-8?B?a3VzU3kxV3VQZUVzSjROWVJlcllZL3JyVHF2VW83QjE3dzNwZjFyMXVOZHVZ?=
 =?utf-8?B?N0FhY3BEQlY3S05QbHE3b3BkbVVuVjBVZUpwRnIyOWozMFpFR0dyWFZrQ2VU?=
 =?utf-8?B?WnN0a21uREN1MGZEQ0pkS2JMbG1iRVVpaVcralIxLytmRHlYZE1PajRWeUha?=
 =?utf-8?B?aUtoUXhsZHQra1JVWWhYNUhqQ1MzZDYycStmQ0JZVFlvNUI5QWQ1bUVNdXJt?=
 =?utf-8?B?azNvY0wvc2Zab201UndBS1BuK2IxUXV5K0NqaWFLS2NBcEVQRlhmNlBTVEN0?=
 =?utf-8?B?WHN6dlBoODRBZTl0eFNXWHFKOHlCM2xlUE0rOHRPenhNdzg0ZkxQV2J5cVlS?=
 =?utf-8?B?aitHdjk5VU1MNGY3TE1UWnd2bWh6OXpKdkpjb1VzNjgzVlAxZmo3bTg3QUtG?=
 =?utf-8?B?c2pJSFY1b1A2c0d0Q0RJUkl5d3RCb010L0dsYzFJT0kyVWszWEFxTnljTG01?=
 =?utf-8?B?cjV6cFo4b1lHZ0hJRkoxT0ZDZksxUjdzUEtrNkNJNmE1S0I3SzM5SHNCcFp6?=
 =?utf-8?Q?0gew6/Ooq0G9H0oOrRukSf0e2acbBEW656DVz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C867E57C31AA34CA3CC6C2DB19B620B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebd3df8-8791-48ec-c448-08da0e2e05a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 07:06:45.1705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nU9fmM0HhzpwzGQH9iOY2dBcsOE2OG5IiotaQlFqVsfdbJZ3uKy+e/VcIzPlbTXaM7W1+WC7VqN3umPsoDgcRV9iKbXJ+cxsmunTLiEXhSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB4200
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
Cc: Ingo Molnar <mingo@redhat.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzAzLzIwMjIgw6AgMjM6MzMsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIFRodSwgMjQgTWFyIDIwMjIgMTE6MDE6NDUgKzAxMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+PiBAQCAtMTAwNiw3ICsx
MDA2LDIwIEBAIHVuc2lnbmVkIGxvbmcgZnRyYWNlX2dyYXBoX3JldF9hZGRyKHN0cnVjdCB0YXNr
X3N0cnVjdCAqdGFzaywgaW50ICppZHgsDQo+PiAgIGV4dGVybiBpbnQgcmVnaXN0ZXJfZnRyYWNl
X2dyYXBoKHN0cnVjdCBmZ3JhcGhfb3BzICpvcHMpOw0KPj4gICBleHRlcm4gdm9pZCB1bnJlZ2lz
dGVyX2Z0cmFjZV9ncmFwaChzdHJ1Y3QgZmdyYXBoX29wcyAqb3BzKTsNCj4+ICAgDQo+PiAtZXh0
ZXJuIGJvb2wgZnRyYWNlX2dyYXBoX2lzX2RlYWQodm9pZCk7DQo+PiArLyoqDQo+PiArICogZnRy
YWNlX2dyYXBoX2lzX2RlYWQgLSByZXR1cm5zIHRydWUgaWYgZnRyYWNlX2dyYXBoX3N0b3AoKSB3
YXMgY2FsbGVkDQo+PiArICoNCj4+ICsgKiBmdHJhY2VfZ3JhcGhfc3RvcCgpIGlzIGNhbGxlZCB3
aGVuIGEgc2V2ZXJlIGVycm9yIGlzIGRldGVjdGVkIGluDQo+PiArICogdGhlIGZ1bmN0aW9uIGdy
YXBoIHRyYWNpbmcuIFRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIGJ5IHRoZSBjcml0aWNhbA0KPj4g
KyAqIHBhdGhzIG9mIGZ1bmN0aW9uIGdyYXBoIHRvIGtlZXAgdGhvc2UgcGF0aHMgZnJvbSBkb2lu
ZyBhbnkgbW9yZSBoYXJtLg0KPj4gKyAqLw0KPj4gK2V4dGVybiBib29sIGtpbGxfZnRyYWNlX2dy
YXBoOw0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBmdHJhY2VfZ3JhcGhfaXNfZGVhZCh2
b2lkKQ0KPj4gK3sNCj4+ICsJcmV0dXJuIGtpbGxfZnRyYWNlX2dyYXBoOw0KPj4gK30NCj4+ICsN
Cj4+ICAgZXh0ZXJuIHZvaWQgZnRyYWNlX2dyYXBoX3N0b3Aodm9pZCk7DQo+IA0KPiBUaGUgcmVh
c29uIEkgZGlkIG5vdCBleHBvc2UgdGhhdCB2YXJpYWJsZSwgaXMgYmVjYXVzZSBJIGRpZG4ndCB3
YW50IGl0IHRvDQo+IGJlIHRvdWNoZWQgb3V0c2lkZSBvZiB0aGUga2VybmVsL3RyYWNlIGRpcmVj
dG9yeS4gT3IgdGhlIGZ0cmFjZS5jIGZpbGUgZm9yDQo+IHRoYXQgbWF0dGVyIChhbHRob3VnaCwg
SSBjb3VsZCBwdXQgaXQgaW4gZmdyYXBoLmMgOi0vKQ0KPiANCj4gV2hhdCB3b3VsZCBiZSBiZXR0
ZXIsIGlzIHRvIG1ha2UgaXQgYSBzdGF0aWMgYnJhbmNoLg0KPiANCj4gZXh0ZXJuIHN0cnVjdCBz
dGF0aWNfa2V5IGZncmFwaF9kZWFkOw0KPiANCj4gc3RhdGljIGlubGluZSBib29sIGZ0cmFjZV9n
cmFwaF9pc19kZWFkKHZvaWQpDQo+IHsNCj4gCWlmIChzdGF0aWNfa2V5X2ZhbHNlKCZmZ3JhcGhf
ZGVhZCkpDQo+IAkJcmV0dXJuIHRydWU7DQo+IAlyZXR1cm4gZmFsc2U7DQo+IH0NCj4gDQo+IFRo
YXQgd2F5IHdlIGV2ZW4gZ2V0IHJpZCBvZiB0aGUgY29uZGl0aW9uYWwgYnJhbmNoLg0KPiANCj4g
WWVhaCwgdGhlIGZncmFwaF9kZWFkIGlzIHN0aWxsIGV4cG9zZWQgZm9yIGFueW9uZSB0byB0b3Vj
aCwgYnV0IGl0IHN0aWxsDQo+IHJlcXVpcmVzIGEgZnVuY3Rpb24gdG8gbW9kaWZ5IGl0LCBzbyBJ
J20gbm90IGFzIHdvcnJpZWQgaXQgd2lsbCBiZSB0b3VjaGVkDQo+IGFzIGVhc2lseS4NCj4gDQoN
CklmIHlvdXIgY29uY2VybiBpcyBhYm91dCBraWxsX2Z0cmFjZV9ncmFwaCBiZWluZyB2aXNpYmxl
IGluIGZ0cmFjZS5oLCB3ZSANCmNvdWxkIGhhdmUgaGlkZGVuIGl0IHdpdGg6DQoNCnN0YXRpYyBp
bmxpbmUgYm9vbCBmdHJhY2VfZ3JhcGhfaXNfZGVhZCh2b2lkKQ0Kew0KCWV4dGVybiBib29sIGtp
bGxfZnRyYWNlX2dyYXBoOw0KDQoJcmV0dXJuIGtpbGxfZnRyYWNlX2dyYXBoOw0KfQ0KDQoNCkJ1
dCB1c2luZyBhIHN0YXRpYyBicmFuY2ggaXMgZXZlbiBiZXR0ZXIsIEknbGwgZG8gdGhhdC4NCg0K
QnkgdGhlIHdheSwgSSB3YXMgd29uZGVyaW5nIGlmIHRoYXQgY2FsbCBpcyBzdGlsbCBuZWNlc3Nh
cnkuDQoNCkluIDIwMTQsIGluIGNvbW1pdCA1NDVkNDdiOGYzNTkgKCJmdHJhY2UtZ3JhcGg6IFJl
bW92ZSB1c2FnZSBvZiANCmZ0cmFjZV9zdG9wKCkgaW4gZnRyYWNlX2dyYXBoX3N0b3AoKSIpIHlv
dSB3cm90ZTogIkFsbCBhcmNocyBub3cgdXNlIA0KZnRyYWNlX2dyYXBoX2lzX2RlYWQoKSB0byBz
dG9wIGZ1bmN0aW9uIGdyYXBoIHRyYWNpbmciLg0KDQpCdXQgd2hlbiBJIGdyZXAgaXQgbm93YWRh
eXMsIGl0IHNlZW1zIG5vdCBhbGwgYXJjaGl0ZWN0dXJlIGFyZSB1c2luZyBpdDoNCg0KJCBnaXQg
Z3JlcCAicHJlcGFyZV9mdHJhY2VfcmV0dXJuKCIgYXJjaC8qZnRyYWNlLmMNCg0KYXJjaC9hcm0v
a2VybmVsL2Z0cmFjZS5jOnZvaWQgcHJlcGFyZV9mdHJhY2VfcmV0dXJuKHVuc2lnbmVkIGxvbmcg
DQoqcGFyZW50LCB1bnNpZ25lZCBsb25nIHNlbGZfYWRkciwNCmFyY2gvYXJtNjQva2VybmVsL2Z0
cmFjZS5jOnZvaWQgcHJlcGFyZV9mdHJhY2VfcmV0dXJuKHVuc2lnbmVkIGxvbmcgDQpzZWxmX2Fk
ZHIsIHVuc2lnbmVkIGxvbmcgKnBhcmVudCwNCmFyY2gvY3NreS9rZXJuZWwvZnRyYWNlLmM6dm9p
ZCBwcmVwYXJlX2Z0cmFjZV9yZXR1cm4odW5zaWduZWQgbG9uZyANCipwYXJlbnQsIHVuc2lnbmVk
IGxvbmcgc2VsZl9hZGRyLA0KYXJjaC9taWNyb2JsYXplL2tlcm5lbC9mdHJhY2UuYzp2b2lkIHBy
ZXBhcmVfZnRyYWNlX3JldHVybih1bnNpZ25lZCBsb25nIA0KKnBhcmVudCwgdW5zaWduZWQgbG9u
ZyBzZWxmX2FkZHIpDQphcmNoL21pcHMva2VybmVsL2Z0cmFjZS5jOnZvaWQgcHJlcGFyZV9mdHJh
Y2VfcmV0dXJuKHVuc2lnbmVkIGxvbmcgDQoqcGFyZW50X3JhX2FkZHIsIHVuc2lnbmVkIGxvbmcg
c2VsZl9yYSwNCmFyY2gvbmRzMzIva2VybmVsL2Z0cmFjZS5jOnZvaWQgcHJlcGFyZV9mdHJhY2Vf
cmV0dXJuKHVuc2lnbmVkIGxvbmcgDQoqcGFyZW50LCB1bnNpZ25lZCBsb25nIHNlbGZfYWRkciwN
CmFyY2gvbmRzMzIva2VybmVsL2Z0cmFjZS5jOglwcmVwYXJlX2Z0cmFjZV9yZXR1cm4ocGFyZW50
X2lwLCBzZWxmcGMsIA0KZnJhbWVfcG9pbnRlcik7DQphcmNoL3BhcmlzYy9rZXJuZWwvZnRyYWNl
LmM6c3RhdGljIHZvaWQgX19ob3QgDQpwcmVwYXJlX2Z0cmFjZV9yZXR1cm4odW5zaWduZWQgbG9u
ZyAqcGFyZW50LA0KYXJjaC9wYXJpc2Mva2VybmVsL2Z0cmFjZS5jOgkJcHJlcGFyZV9mdHJhY2Vf
cmV0dXJuKHBhcmVudF9ycCwgc2VsZl9hZGRyKTsNCmFyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2Uv
ZnRyYWNlLmM6dW5zaWduZWQgbG9uZyANCnByZXBhcmVfZnRyYWNlX3JldHVybih1bnNpZ25lZCBs
b25nIHBhcmVudCwgdW5zaWduZWQgbG9uZyBpcCwNCmFyY2gvcG93ZXJwYy9rZXJuZWwvdHJhY2Uv
ZnRyYWNlLmM6CWZyZWdzLT5yZWdzLmxpbmsgPSANCnByZXBhcmVfZnRyYWNlX3JldHVybihwYXJl
bnRfaXAsIGlwLCBmcmVncy0+cmVncy5ncHJbMV0pOw0KYXJjaC9yaXNjdi9rZXJuZWwvZnRyYWNl
LmM6dm9pZCBwcmVwYXJlX2Z0cmFjZV9yZXR1cm4odW5zaWduZWQgbG9uZyANCipwYXJlbnQsIHVu
c2lnbmVkIGxvbmcgc2VsZl9hZGRyLA0KYXJjaC9zMzkwL2tlcm5lbC9mdHJhY2UuYzp1bnNpZ25l
ZCBsb25nIHByZXBhcmVfZnRyYWNlX3JldHVybih1bnNpZ25lZCANCmxvbmcgcmEsIHVuc2lnbmVk
IGxvbmcgc3AsDQphcmNoL3NoL2tlcm5lbC9mdHJhY2UuYzp2b2lkIHByZXBhcmVfZnRyYWNlX3Jl
dHVybih1bnNpZ25lZCBsb25nIA0KKnBhcmVudCwgdW5zaWduZWQgbG9uZyBzZWxmX2FkZHIpDQph
cmNoL3NwYXJjL2tlcm5lbC9mdHJhY2UuYzp1bnNpZ25lZCBsb25nIHByZXBhcmVfZnRyYWNlX3Jl
dHVybih1bnNpZ25lZCANCmxvbmcgcGFyZW50LA0KYXJjaC94ODYva2VybmVsL2Z0cmFjZS5jOnZv
aWQgcHJlcGFyZV9mdHJhY2VfcmV0dXJuKHVuc2lnbmVkIGxvbmcgaXAsIA0KdW5zaWduZWQgbG9u
ZyAqcGFyZW50LA0KYXJjaC94ODYva2VybmVsL2Z0cmFjZS5jOnZvaWQgcHJlcGFyZV9mdHJhY2Vf
cmV0dXJuKHVuc2lnbmVkIGxvbmcgaXAsIA0KdW5zaWduZWQgbG9uZyAqcGFyZW50LA0KYXJjaC94
ODYva2VybmVsL2Z0cmFjZS5jOglwcmVwYXJlX2Z0cmFjZV9yZXR1cm4oaXAsICh1bnNpZ25lZCBs
b25nIA0KKilzdGFjaywgMCk7DQoNCiQgZ2l0IGdyZXAgImZ0cmFjZV9ncmFwaF9pc19kZWFkKCki
IGFyY2gvKmZ0cmFjZS5jDQoNCmFyY2gvbWljcm9ibGF6ZS9rZXJuZWwvZnRyYWNlLmM6CWlmICh1
bmxpa2VseShmdHJhY2VfZ3JhcGhfaXNfZGVhZCgpKSkNCmFyY2gvbWlwcy9rZXJuZWwvZnRyYWNl
LmM6CWlmICh1bmxpa2VseShmdHJhY2VfZ3JhcGhfaXNfZGVhZCgpKSkNCmFyY2gvcGFyaXNjL2tl
cm5lbC9mdHJhY2UuYzoJaWYgKHVubGlrZWx5KGZ0cmFjZV9ncmFwaF9pc19kZWFkKCkpKQ0KYXJj
aC9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYzoJaWYgKHVubGlrZWx5KGZ0cmFjZV9ncmFw
aF9pc19kZWFkKCkpKQ0KYXJjaC9zMzkwL2tlcm5lbC9mdHJhY2UuYzoJaWYgKHVubGlrZWx5KGZ0
cmFjZV9ncmFwaF9pc19kZWFkKCkpKQ0KYXJjaC9zaC9rZXJuZWwvZnRyYWNlLmM6CWlmICh1bmxp
a2VseShmdHJhY2VfZ3JhcGhfaXNfZGVhZCgpKSkNCmFyY2gveDg2L2tlcm5lbC9mdHJhY2UuYzoJ
aWYgKHVubGlrZWx5KGZ0cmFjZV9ncmFwaF9pc19kZWFkKCkpKQ0KDQpCdXQgYmFjayBpbiBjb21t
aXQgNTQ1ZDQ3YjhmMzU5LCB0aGVyZSB3YXMgYWxyZWFkeSBhcmNoaXRlY3R1cmVzIA0KaW1wbGVt
ZW50aW5nIHByZXBhcmVfZnRyYWNlX3JldHVybigpIHdpdGhvdXQgY2FsbGluZyANCmZ0cmFjZV9n
cmFwaF9pc19kZWFkKCksIGZvciBpbnN0YW5jZSBzMzkwLiBTbyBJIG11c3QgYmUgbWlzc2luZyAN
CnNvbWV0aGluZyBJIGd1ZXNzID8NCg0KVGhhbmtzDQpDaHJpc3RvcGhl
