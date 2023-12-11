Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F480C16A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 07:35:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QaSNbPnh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpX6k61L7z3w0D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 17:35:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QaSNbPnh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60c; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpX5t4f0sz3cVk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 17:34:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ142sPZWJ/LKFOE8Vn9La102RyEeqbw6yqkDgdSdMyvnGrBX2BFpz9kmxkAddddb72K29jY+Lamzbby18wYTt9XNE30YkCrcN77OfeDzceCAgCK7KnXoyE7Abo9aRZmWp/mOMLc0KxXHu0d7n0TEoFClLahjtXBVH0qrzDdZSrAInkm8MkUnHxp9x0gvkstlmYEc0MHLaNdWKgEQKHIJwFgGsK8+8ct85nVSDZfUkjGRjL9ltnJTRhBt/yqeEgnjysk1co215pJrtCF7MIDhorTWc4xH5L8U1pNqvH0len2DBuxYOsV4zq4l+GfjmrJ6+Z1jZJsNjAJH5KGX/EsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOrw8kINkYyMP7DMYlVkicryW9Bij429jJT5LCwLg6Y=;
 b=f0qel9eLShZC63VbO3tV6/DLsneyfAL15gI305f8zuRlXn5yWJBweRvIruJr6BpZfz/M8APn6WQWIZuc4YNGmM+DEuN8oCMlQWFMhAeLUVJh7Fo/IMoKnhT067nCI/GdmkKyG/3/YyvXYQlpKCRxepFzAn218IwRC3qLkx10glpv7/zZoC5TbzADB3P/l3dM7CjkojRg2q4SlJp04Bi9cQaXVit5NTFizYqAlwTU7mi5lcVa+mvesxN/rOXcnG21OuB0XByBJs+/ok4iO8PtLp/LENP6ctNIueu4qMsaasEeIfNcmNk5ZHD1xwlW5W5wyqhlctSzN2h/wtzqcMid3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOrw8kINkYyMP7DMYlVkicryW9Bij429jJT5LCwLg6Y=;
 b=QaSNbPnhk18QgvJ1koVNTRupBz/Hb1Y4s1o/01lYJg+E51pMx5WjY6wEcxiZQMcAVjxv+Ep0tzEoYZluC/zfjPCgByrk0picFzvuXHOWy8/HT9AgAWhVqyI69M85AVkmflfc7whsmNax/rwSyQPn+rC4qiUcqM/Kd8hKg+t2EHSmM7lE9L6Kapg5pVNwfvholTHq9cCGNayAUnfZN8RgQRdo9+vYaAaYCPCgPRxvdcfhPk3Aoo3yUs0VgMqaQ+Sh62VrmlrG5n8JvgvbouOO48g2GQHHhCyqmUq0R9/wVZNEPgxqz7az4Rky3+yq/wi4UYIqMTXPkMVvY/zhD4G+wg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1660.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 06:34:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%6]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 06:34:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Luming Yu <luming.yu@shingroup.cn>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH 1/1] powerpc/debug: implement HAVE_USER_RETURN_NOTIFIER
Thread-Topic: [PATCH 1/1] powerpc/debug: implement HAVE_USER_RETURN_NOTIFIER
Thread-Index: AQHaK9z4gCHAjpPmSk2g3ksWyP5ghrCjoFaA
Date: Mon, 11 Dec 2023 06:34:04 +0000
Message-ID: <894d6819-c8d8-4929-81c1-323724f62b80@csgroup.eu>
References: <475A60AEEAA99F6C+20231211025054.885-1-luming.yu@shingroup.cn>
In-Reply-To: <475A60AEEAA99F6C+20231211025054.885-1-luming.yu@shingroup.cn>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1660:EE_
x-ms-office365-filtering-correlation-id: b9090050-652b-422c-1b73-08dbfa132b4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Ct7lKgAo/IptsJn/1LS1zTL2tUgXoFZ8OzXYW7D+TYHiXTJTq1vltqQ5qH4AbrZkMIFKWTIfW8IpgmgSG51rJFspIIwkpWupy2An/MyCDQnc2xl28Og7ZKUhB5NqhsWeY8WU0xBKsBrC/bONEs5y4O1AaYKbLOxCW6uaRpUg3HhqXIeTXNLvyEsg5DjiqtByRpWU6JSQYHM6+FmEsCnoRh2Zg1xPImZnQ1FAtvNCdm7DewOPkchc+oznwAPhQoZNc+TkaMq50IVB3F4gdO3C5rWKwiyYPE5fC0sA5AahVnj/1EfAYEhrZhq+PSxXbsuipo46k+C8Ye3M6hcuT/+gqpmkb0kVfGf52sao52BMZdWN1pzyzrqMPeJpZi+L0+EaxXxvzPcrt66i3DTejAKZMfjXYtDrCpun6s8JrMG1in/++a3/ZD7aoQk/qgDPTnLe+LAyr/CjjFY2ksO6LbPahvTaTI60xD6D5TO9tnoifgIft6hzevSdxD0MsBM8UYhVNm2zEfUt6luMlh/B90GWMlmD05uciqwblw0XPRU6kbjcN302ogUJxhK687R0h+/Ho4gFG4bnbsWNhtk6Wd/ivY9SInuuWTBNTTfN/+BrfjBZlej6fLIM5E0nuOHIg/Ssfe5jKCQrbzXUuNWgrYyf+CTS3SSaQirfs349j5+IYRCgeIm7GkBzPWBQc3hxkV9N
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(136003)(376002)(346002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6512007)(26005)(6486002)(2616005)(478600001)(966005)(71200400001)(6506007)(83380400001)(66574015)(44832011)(5660300002)(41300700001)(2906002)(76116006)(91956017)(54906003)(66446008)(64756008)(66476007)(66946007)(110136005)(316002)(66556008)(8936002)(8676002)(4326008)(38070700009)(38100700002)(86362001)(31696002)(122000001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WFlTOWF1elR2SUF0UFVTeVFldUFDSmRCb1lSZWhwRUtnWG9vRWFubTFVZUxS?=
 =?utf-8?B?bnZPVDRSeFBXTnZzeVJQWUY2emZRV042UHVnQW9oUVBLUnZMVGRxUWsyU1lp?=
 =?utf-8?B?d21hUHJSVTZEaTVhamswVUNHZVVmdTFVbno3eGFUVHFFUmsvZnliQ0drM0F1?=
 =?utf-8?B?Zm5BWXhId0hiSDRmV3B3WHp5NEYxMllhR1NmMlErVFBOSHdMUU5QSFhkWTBF?=
 =?utf-8?B?c3pVKzRxUktIckIzYnFHQ1gvc0VSNmZYKzVDUC9zUDVjZEhkNVFvZGNTcFQv?=
 =?utf-8?B?RG9KVGVBVzZOaGJaRzBMMG91a0NaRGFXZERlSEh6UlR1N1NaUTFSYUZqSTFL?=
 =?utf-8?B?ZHBuc01nazc4cEJlV0NLT3NoUFh1OVVuanVhRXJBbzIyTGVJTys0WVBURGNO?=
 =?utf-8?B?RngxRkh4dllsT0QwTmpyazBHRWUrTUdxQ2dNbkxNZldUN0hRTFIxcU1CY2Zs?=
 =?utf-8?B?aDZad0VaYmZpY05ISnBNL3ZGalFScE55ZCtGMWZCeC9pbUlyZFI2YXpnS0JQ?=
 =?utf-8?B?MitiZC9GVWtrWk5IalNPR3NTdExCanhQWnhVSWdkY1dsT0xtRnhOVWIxaUFB?=
 =?utf-8?B?UmkrbmdkQis3V0ZUd2tDT3FuNHZwZHRBblJXRXgySFMveWR4TmlDYmxJQVMv?=
 =?utf-8?B?WlcyU2lWS0FsWmdOQ3IvaCtiNjUzMXVQSGUrbjBSUzVraDNkU3ZVMkNScUJa?=
 =?utf-8?B?RXlOeWpjSEVjTTEzVnZNUnZid3JaVFdFMmdWd2dGUVM1NXdPOSsxaVJQZlhT?=
 =?utf-8?B?Z0xsQ05PSVRGNEZ2Uit2SCtvS1Q1enlaNnRpY09MR3NaL3RBRmFJd05VNU5L?=
 =?utf-8?B?VW9ZNndrbVc4NzJFblo2MGNYS0ZrblNadVJvd09OMnRsWWpMV29FMzB0MEs3?=
 =?utf-8?B?SDZBSXVqOHU1ZW1rUEpjZE5ZNGthQ0s0K21aQXkxOFB4WE9LQmo4ZzZCY2RR?=
 =?utf-8?B?MjF5THdMZlp6Vnp6UUp5cjQ2SHo0Ui9VQ1htSEc0a3VwMUllamZrdkxvdk42?=
 =?utf-8?B?bk1GVnpuTW51Uk54TkF0d05VWGprTXMraWdNUFlQUkc3a1BmbmcvTG1nYTJZ?=
 =?utf-8?B?bzRqSkxNTFNPU3FKMW1BT2NZYmR1ODNLc3NsSEFCSm1UQzBUTlh2YlYvdGNr?=
 =?utf-8?B?TjR2c25GamZlc1hDY3d0QmsxcGE1NWYrTG5jNVJMRDNaWDNlNDhFNjlRYUM4?=
 =?utf-8?B?TCtRSmtvcFZpWUcyU040REtpK253ZnQ5T0ZCUWVnZjFNYWpqTEt3Mm1GS0pl?=
 =?utf-8?B?d3JDYU9EVEtXUmRDbXpWYUxYejNFL0UwMXBxb2tLYkN6N0FybWtjVkxLK0hJ?=
 =?utf-8?B?QVFzM285UWpIUXJkS2FGdnd5Nk5wMk90NGVYL2R0ZzU1cEdYRVFzZDlFVy9U?=
 =?utf-8?B?bnpzdTRtaUk2SWdKMVRJbHdidDFkbXU2SWV0ZG96cUtVTWUwdGlSNjFoQ3VX?=
 =?utf-8?B?NXYxZ0dScjR0UzVjS1dIa1dEL1BxTHg1SlhQMXBLLy8zMjJvSDMrSEoyc2x4?=
 =?utf-8?B?SWFpWVJ5LzMyekloVGpHa3grd2FWQVV0cGJweFRqNlllemNRaTlkRjRTazZw?=
 =?utf-8?B?NVdVNGNOUWhXbHl0ZCt1WGhROHB3OTRJdHpmZnhQd3krVW12QWdEbm0xeW9u?=
 =?utf-8?B?bDl6ZDlmOVFnOCs3V2NXWWg3OHlmUkhPU2h5ZGd1WnpxMEd1aFo1WmFkdTkz?=
 =?utf-8?B?Y1dyWm5vR3Z3dHNuQ2NYYXMydkhvQXh5YjZESDVWQmZNNkFTMmdZWGZ4b05R?=
 =?utf-8?B?dSt4c0xGaVJGL2NpY3UySHpLKzZxTEN4M0thZllQM2FGTmtEdmhIQWo3TGtB?=
 =?utf-8?B?cXBnNDZWcGNMOXJTZC8zbUZmbTlnenBTeEdoNCtXREhiQjZkdVRHcElHbkVL?=
 =?utf-8?B?V2FjUjl1NGxQcG1MbGRjdDZnS2ovOG9SSU1IRVlnc3Y5Nloxd3RZSHVZTUZV?=
 =?utf-8?B?VGRpNVEvR1V4QTZVaTdUMEhTN0lRdEpia3JMUDM0cnNqaXArb0l1UnhRUGUv?=
 =?utf-8?B?aGZMUlNjVzhPaU12UTg0SEpBZGNka2RMV1BvM1hqSS85cllBd3NpcmFraTFQ?=
 =?utf-8?B?Q1ZUN2NXZEUyYnBkWEVlVllOZ3dQcHh5RWJRVXVkQS81UHJxeDNxUUNxb3gr?=
 =?utf-8?Q?BMdhV7Py5Vf1xz+F7h7I26ttE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18CD83A3C7A8F849A03434BD306A590D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b9090050-652b-422c-1b73-08dbfa132b4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 06:34:04.0708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nU/e+/wWk4/Eqg/csfJAuRWNVJBH3f2jMetT2eHPXCqH69BZHuA2LBYFc6NmVB00YmYbHIuqKtLzVMBDsZ63uEtQPfGUChj98e+yJOaZiFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1660
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
Cc: "shenghui.qu@shingroup.cn" <shenghui.qu@shingroup.cn>, "dawei.li@shingroup.cn" <dawei.li@shingroup.cn>, "ke.zhao@shingroup.cn" <ke.zhao@shingroup.cn>, "luming.yu@gmail.com" <luming.yu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzEyLzIwMjMgw6AgMDM6NTAsIEx1bWluZyBZdSBhIMOpY3JpdMKgOg0KPiBbVm91
cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBsdW1pbmcueXVAc2hpbmdy
b3VwLmNuLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBodHRwczov
L2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gVGhlIHN1cHBv
cnQgZm9yIHVzZXIgcmV0dXJuIG5vdGlmaWVyIGluZnJhc3RydWN0dXJlDQo+IGlzIGhvb2tlZCBp
bnRvIHBvd2VycGMgYXJjaGl0ZWN0dXJlLg0KDQoiVGhlIHN1cHBvcnQgLi4uIGlzIGhvb2tlZCIu
IFNvIHdoYXQgPyBJdCdzIGxpa2Ugc2F5aW5nICJUaGUgc2t5IGlzIA0KYmx1ZSIuIE9rLCBhbmQg
dGhlbiA/IFdoYXQncyB0aGUgbGluayBiZXR3ZWVuIHRoYXQgc3RhdGVtZW50IGFuZCB0aGUgcGF0
Y2ggPw0KDQpJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbi4gUGxlYXNlIHByb3ZpZGUg
bW9yZSBkZXRhaWxzLCB0ZWxsIHdoYXQgDQp0aGlzIHBhdGNoIGRvZXMgYW5kIGhvdy4NCg0KQ2hy
aXN0b3BoZQ0KDQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgIHwgIDEgKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24u
aCB8IDE2ICsrKysrKysrKysrKysrKysNCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGhy
ZWFkX2luZm8uaCAgfCAgMiArKw0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY2Vzcy5jICAg
ICAgICAgICB8ICAyICsrDQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspDQo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9lbnRyeS1jb21t
b24uaA0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJjaC9wb3dl
cnBjL0tjb25maWcNCj4gaW5kZXggYzEwMjI5YzAyNDNjLi5iOTY4MDY4Y2MwNGEgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9LY29uZmln
DQo+IEBAIC0yNzcsNiArMjc3LDcgQEAgY29uZmlnIFBQQw0KPiAgICAgICAgICBzZWxlY3QgSEFW
RV9TVEFDS1BST1RFQ1RPUiAgICAgICAgICAgICAgaWYgUFBDNjQgJiYgJChjYy1vcHRpb24sLW1z
dGFjay1wcm90ZWN0b3ItZ3VhcmQ9dGxzIC1tc3RhY2stcHJvdGVjdG9yLWd1YXJkLXJlZz1yMTMp
DQo+ICAgICAgICAgIHNlbGVjdCBIQVZFX1NUQVRJQ19DQUxMICAgICAgICAgICAgICAgICBpZiBQ
UEMzMg0KPiAgICAgICAgICBzZWxlY3QgSEFWRV9TWVNDQUxMX1RSQUNFUE9JTlRTDQo+ICsgICAg
ICAgc2VsZWN0IEhBVkVfVVNFUl9SRVRVUk5fTk9USUZJRVINCj4gICAgICAgICAgc2VsZWN0IEhB
VkVfVklSVF9DUFVfQUNDT1VOVElORw0KPiAgICAgICAgICBzZWxlY3QgSEFWRV9WSVJUX0NQVV9B
Q0NPVU5USU5HX0dFTg0KPiAgICAgICAgICBzZWxlY3QgSE9UUExVR19TTVQgICAgICAgICAgICAg
ICAgICAgICAgaWYgSE9UUExVR19DUFUNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9lbnRyeS1jb21tb24uaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9lbnRyeS1j
b21tb24uaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjUx
ZjFlYjc2NzY5Ng0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9lbnRyeS1jb21tb24uaA0KPiBAQCAtMCwwICsxLDE2IEBADQo+ICsvKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KPiArI2lmbmRlZiBBUkNIX1BPV0VSUENfRU5UUllf
Q09NTU9OX0gNCj4gKyNkZWZpbmUgQVJDSF9QT1dFUlBDX0VOVFJZX0NPTU1PTl9IDQo+ICsNCj4g
KyNpbmNsdWRlIDxsaW51eC91c2VyLXJldHVybi1ub3RpZmllci5oPg0KPiArDQo+ICtzdGF0aWMg
aW5saW5lIHZvaWQgYXJjaF9leGl0X3RvX3VzZXJfbW9kZV9wcmVwYXJlKHN0cnVjdCBwdF9yZWdz
ICpyZWdzLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgdGlfd29yaykNCj4gK3sNCj4gKyAgICAgICBpZiAodGlfd29yayAm
IF9USUZfVVNFUl9SRVRVUk5fTk9USUZZKQ0KPiArICAgICAgICAgICAgICAgZmlyZV91c2VyX3Jl
dHVybl9ub3RpZmllcnMoKTsNCj4gK30NCj4gKw0KPiArI2RlZmluZSBhcmNoX2V4aXRfdG9fdXNl
cl9tb2RlX3ByZXBhcmUgYXJjaF9leGl0X3RvX3VzZXJfbW9kZV9wcmVwYXJlDQo+ICsNCj4gKyNl
bmRpZg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3RocmVhZF9pbmZv
LmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaA0KPiBpbmRleCBiZjVk
ZGUxYTQxMTQuLjQ3ZTIyNjAzMmY5YyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL3RocmVhZF9pbmZvLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Ro
cmVhZF9pbmZvLmgNCj4gQEAgLTExNyw2ICsxMTcsNyBAQCB2b2lkIGFyY2hfc2V0dXBfbmV3X2V4
ZWModm9pZCk7DQo+ICAgI2VuZGlmDQo+ICAgI2RlZmluZSBUSUZfUE9MTElOR19OUkZMQUcgICAg
IDE5ICAgICAgLyogdHJ1ZSBpZiBwb2xsX2lkbGUoKSBpcyBwb2xsaW5nIFRJRl9ORUVEX1JFU0NI
RUQgKi8NCj4gICAjZGVmaW5lIFRJRl8zMkJJVCAgICAgICAgICAgICAgMjAgICAgICAvKiAzMiBi
aXQgYmluYXJ5ICovDQo+ICsjZGVmaW5lIFRJRl9VU0VSX1JFVFVSTl9OT1RJRlkgMjEgICAgICAv
KiBub3RpZnkga2VybmVsIG9mIHVzZXJzcGFjZSByZXR1cm4gKi8NCj4gDQo+ICAgLyogYXMgYWJv
dmUsIGJ1dCBhcyBiaXQgdmFsdWVzICovDQo+ICAgI2RlZmluZSBfVElGX1NZU0NBTExfVFJBQ0Ug
ICAgICgxPDxUSUZfU1lTQ0FMTF9UUkFDRSkNCj4gQEAgLTEyNSw2ICsxMjYsNyBAQCB2b2lkIGFy
Y2hfc2V0dXBfbmV3X2V4ZWModm9pZCk7DQo+ICAgI2RlZmluZSBfVElGX05PVElGWV9TSUdOQUwg
ICAgICgxPDxUSUZfTk9USUZZX1NJR05BTCkNCj4gICAjZGVmaW5lIF9USUZfUE9MTElOR19OUkZM
QUcgICAgKDE8PFRJRl9QT0xMSU5HX05SRkxBRykNCj4gICAjZGVmaW5lIF9USUZfMzJCSVQgICAg
ICAgICAgICAgKDE8PFRJRl8zMkJJVCkNCj4gKyNkZWZpbmUgX1RJRl9VU0VSX1JFVFVSTl9OT1RJ
RlkgICAgICAgICgxPDxUSUZfVVNFUl9SRVRVUk5fTk9USUZZKQ0KPiAgICNkZWZpbmUgX1RJRl9S
RVNUT1JFX1RNICAgICAgICAgICAgICAgICgxPDxUSUZfUkVTVE9SRV9UTSkNCj4gICAjZGVmaW5l
IF9USUZfUEFUQ0hfUEVORElORyAgICAgKDE8PFRJRl9QQVRDSF9QRU5ESU5HKQ0KPiAgICNkZWZp
bmUgX1RJRl9TWVNDQUxMX0FVRElUICAgICAoMTw8VElGX1NZU0NBTExfQVVESVQpDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvcG93ZXJwYy9rZXJu
ZWwvcHJvY2Vzcy5jDQo+IGluZGV4IDM5MjQwNDY4OGNlYy4uNzBhOWVhOTQ5Nzk4IDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYw0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMva2VybmVsL3Byb2Nlc3MuYw0KPiBAQCAtMzgsNiArMzgsNyBAQA0KPiAgICNpbmNsdWRlIDxs
aW51eC91YWNjZXNzLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3BrZXlzLmg+DQo+ICAgI2luY2x1
ZGUgPGxpbnV4L3NlcV9idWYuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC91c2VyLXJldHVybi1ub3Rp
Zmllci5oPg0KPiANCj4gICAjaW5jbHVkZSA8YXNtL2ludGVycnVwdC5oPg0KPiAgICNpbmNsdWRl
IDxhc20vaW8uaD4NCj4gQEAgLTEzODYsNiArMTM4Nyw3IEBAIHN0cnVjdCB0YXNrX3N0cnVjdCAq
X19zd2l0Y2hfdG8oc3RydWN0IHRhc2tfc3RydWN0ICpwcmV2LA0KPiAgICAgICAgICBpZiAoY3Vy
cmVudC0+dGhyZWFkLnJlZ3MpDQo+ICAgICAgICAgICAgICAgICAgcmVzdG9yZV9tYXRoKGN1cnJl
bnQtPnRocmVhZC5yZWdzKTsNCj4gICAjZW5kaWYgLyogQ09ORklHX1BQQ19CT09LM1NfNjQgKi8N
Cj4gKyAgICAgICBwcm9wYWdhdGVfdXNlcl9yZXR1cm5fbm90aWZ5KHByZXYsIG5ldyk7DQo+IA0K
PiAgICAgICAgICByZXR1cm4gbGFzdDsNCj4gICB9DQo+IC0tDQo+IDIuNDIuMC53aW5kb3dzLjIN
Cj4gDQo=
