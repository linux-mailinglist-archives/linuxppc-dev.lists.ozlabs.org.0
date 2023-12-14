Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAEB812B94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 10:26:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=UsGmsXSd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrRnL5jWgz3w3q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 20:26:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=UsGmsXSd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::604; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrRmY1jPcz3vtX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 20:26:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQSh8nQABCK8b9tmUQddQfkKwWPsOTDpaMygcX8zMTz9Hu6GhhMs1GIm2Roq6M8wLvPZP0VT3h1jI+LOyXBNtcd6yzHAuDdukVjYIE1q1TLJum2FlPyGtAQADByW1Ld/HOpM0RYnLjbUFdXw6jgnl5C+xusPx9jBkC9uL0WPXx/gCbFtYLDqdw2EPfLDsnUzFb+wc5s2ENFuMF/ZO/Oo457LAOrJIOoa5wzrXLGAlQnoISQ+aOg1Zj9cdhyFtqLCUMw18INM8fKELKDWBtbSuWt/O80OtFbK9C+D0Aq3u1NcwnDxNXQ4UWXkSYc/6iKj8F6xa/C8xOSChzjb9r9KVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+gsJ/8AQtYkTRB1aLs7FPjM3Zb3btcBLD+D1Kuh8+4=;
 b=fLJ5+WzmQ3jo6ipZn4V+a+bj6uM4B9ibC5PCD2eAOzNMOA9Qux/YqQy2ZMBkcDX4o2Qz8bX9F1W/9h/kGeItgJx/N3xbJBH9SajiX7KQCLkOrSVbu5f18WE8jVCZ01TJYWRb1SRwB60GqR1jtA7Le9EXUykXY1yFlttV/cGsPpdsaSzZBrC73Mn3f9RBGe8u93g9kOvnr+3Sx7jqUta6bC79kGfLYdNTwqjxlcAihh/Iw3sFKKzRt2NvEbrSyqtC82l2s4GrKxjHUyw75jc1j7lKMhHNgmm8qh48hINFkbdTxZjR9ZQGv6wmGfUuT+nUnj8zj1fOq75COcqm30dmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+gsJ/8AQtYkTRB1aLs7FPjM3Zb3btcBLD+D1Kuh8+4=;
 b=UsGmsXSdF7KNVmk+8F1o0yjS0p/1bcQdY/rkx/ZkoNxHa2Z/M0fxrUDhnTt7nQIAUBe57X3Hhtkz/5eoU9txg/bT4tjoHtx5EbtG0cT0Vc3H9cuEHDrzJASHHf6Av56CLkAAbrlA+WgAWp2y8pSVrf2veB3xR1eTj8yOiEb5v627dlvRp8Q2mW/8+nawgCIY4JqqGvwP53E6+wQbbk9n2XYobbyXTJCppnKqUFUU/NR+TQjJT8xThG/Jq0a2eavl1S7fCLW8ewX+bQ+tX3cdynhNqMTd1sdWUx9WQi9v4SqOuQo6vGi5iWa3dijeXpllwXHqdjw4YrgH94w+lmykIQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2883.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 09:25:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 09:25:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, "glider@google.com"
	<glider@google.com>, "elver@google.com" <elver@google.com>,
	"dvyukov@google.com" <dvyukov@google.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH 12/13] powerpc/string: Add KMSAN support
Thread-Topic: [PATCH 12/13] powerpc/string: Add KMSAN support
Thread-Index: AQHaLlJMXQiYw0la3UuI69TOhUcnGLCogl8A
Date: Thu, 14 Dec 2023 09:25:44 +0000
Message-ID: <2f35548a-bdbd-4c37-8f60-cebeb381a7af@csgroup.eu>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
 <20231214055539.9420-13-nicholas@linux.ibm.com>
In-Reply-To: <20231214055539.9420-13-nicholas@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2883:EE_
x-ms-office365-filtering-correlation-id: 45f7172d-b4a8-4bd8-bacd-08dbfc86a5e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZPz5W+Wg8XDAjZqT4gqRh4zSK+EZIigHDHZqaRSKKMTc+Wc0qXDJLWxVcncKb0/jEcSkhr+F/NC4K5hjGXABwrytSmqaUA6IN9A6N95SXr6ZigFcyFGdwG2Uec5SNz79GF7wR0rimIFseKK+saVRqFXoxL/CL/tJtzh+PIfzQ+TnaWsyqCCL8hckX+nAR94MTS4navwR9aPYuYm+hKuIDfLPV33DJbQQIFr5I8mPt8hkMOr0cDYZC6SY2P7XlbXIaq+ROSp+dIM/woh2jgaXcjcd8PJKvM9GS08u/hCHLFcZE/p5a2BbH0JOGXX9EAwyP6OUt7lyjyGnnRhC/zXjh2Nn/xSbSc8A2q/tciaKdQ5LsBtO1NlwdlRMrvTgTBi6yEGQMEXi4jXcadHCwrYaFfXytby6zeXbjDyeYF1LIASzJ7MmzHfLw9+aL0HcWxR70xKjjd9huqlOH2+6OIsqqlCitJ+7+ZTqOD3a86RACKPxBPriaWWprWI61Znf2JmeP5FPSQB/LVdENUmUwZcbWN4EIu3Sc7l9hU7JO/9ucUwQjCGlW99VmtMeU40nmnw+EZz15TEreYWCcOEDkSJnk0fK1iQ1jFhyLMYyLqsBsExKI0+3tEEqZhtMtZ6mkDpVmFQ8D8gHXrRXgoG60X/LfyUgvRc0BB65Ib5U3FZX4TJ3ntS7waBln8y9QNDgCMGT
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39850400004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2906002)(7416002)(31696002)(6486002)(478600001)(41300700001)(38070700009)(31686004)(122000001)(86362001)(5660300002)(44832011)(4326008)(91956017)(110136005)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(54906003)(316002)(83380400001)(2616005)(26005)(71200400001)(8936002)(6506007)(6512007)(8676002)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WVQrRDl2Q1pwZGoxaW1Ud0NISFY2THppR2M5WldGeU03cTJxQThURDgxQ3hv?=
 =?utf-8?B?NDZFRG1jS3JoZ1RUcG1mOENhVTg3ZGsrSzAzNkdCeng3dXE2THJzNEhCY0NR?=
 =?utf-8?B?Z0F4NTRYMmM5eXlUK1lwQlhVYS9kR1gzbVpzUGFHcmhHSTdncHZrbzRxb1Rz?=
 =?utf-8?B?UHV4NXgrTGorWnRYWHRyeGJJMlN0cFhiQklQYnZVTzdiYjlMTFJzZTF0cWFr?=
 =?utf-8?B?N3VKQzlSZHNrb09ucHh4R2pEVGtoV2dLbmZHZmVadWgreXp1bGZ6dUMrSU4x?=
 =?utf-8?B?WGRSU0xmL3N3TjZGVVM0TkxjeGIyZVhBUHF6Wk1Ud3JwNC9KSjNXV25MMjZ5?=
 =?utf-8?B?bVFNTHVmZkJlOHZSV2VWbHIxOXZoVmxZc3RiQ3F2QVBkYStoWEoycGRHaEdJ?=
 =?utf-8?B?ckYybXdSL3d6VW5hbnQ5ekVyTU9kaTlaaHdhWkNzK0NEa2d6Q1lNNWZNNGp3?=
 =?utf-8?B?RGFGcDdxTEdPVEp2Zm54eU1oZ3JuaUtIZHlPOVk2WDkyeWZzMmhTdkdCb1ZD?=
 =?utf-8?B?NmRYM0lOcXptajhodFVvdDhWQmxaMnZzREJHR0VRZkxIWjlBTnRNdmltT0Zx?=
 =?utf-8?B?L0VhaERIMEp1N09OM2w2N1dhdHFRRmFpRFhDMmg3ZkwrYkI3QmtzS3VuSWZQ?=
 =?utf-8?B?a0tNTjBJazBqcEtScFRhL2wwMTJ1SktZdDcxa2hOMXgyT1ZaUG1EQmVQUHpV?=
 =?utf-8?B?eUt1NnVWaDhKSWhHUFVieXZGejh3ak0xRjRJUEZqTWoyS1hZOW1OZVdMTVNo?=
 =?utf-8?B?NmRJWjhDczh6eEhUU1Nic0xYKzRPb0dRNHp0bytsQlZvcm5hd2l5TUhiR2l5?=
 =?utf-8?B?dVpaRnRpSG1KVllhNWVIZTRGcmZRbHRvNHNpcFRraEJyMVg2dEsra0t1aXJK?=
 =?utf-8?B?S1A3Vk9sTGpQc0NyWVArME1Xc1ZzNXR1N3hlTjNqc2dnOTVDb3BVemZLTHZH?=
 =?utf-8?B?cjcyZmlONDlydkV5djlFRmxKc2lINlpiSTE2eGl1aEk3TFlNN29kVHNjaEJn?=
 =?utf-8?B?anIzSnRiZS9iQzZQNTkyL041aDgxa05vQkZEcHdqSG1NN0hyUjJ5QnpxMHBq?=
 =?utf-8?B?YU1rbmVRanVVZERQUlIxU3ZGazBPNkVzS1VOK2YxNWFFNm5ldUVjZ3dZNHk4?=
 =?utf-8?B?ZEswUC9wb2RkSE5OUU52L0ZCbHE5dHFwSUp3cElobmFsQ3c4Ry9DZU5IaGFu?=
 =?utf-8?B?cVpHdTJLbzVTL2tCNmttMk1meXRhbExsM1FvSE4wY2piMXFhNFMyK2o3ZWE1?=
 =?utf-8?B?VDhRU0dralBXeEpzQzVTRkU1Q0hhb0N0aFByaWY2azFRb09ydDRBQmxyb1E3?=
 =?utf-8?B?ME90dXRNb0tRN05GUHRLbTZvZExRa1lkSnFQT0d5VTVPdEFhQ2ZjeWo3SXNj?=
 =?utf-8?B?ZnMvUzZWRzc5bEpEcUViYjlIOGJtT29uVTBpY3BHREFVdXZzTFVCYjZrSDRC?=
 =?utf-8?B?WFczR1RHQXBnVDlKKzZCWVZoZXJnZHlOMXdoUEh2NExtWW0zb1lYRkU2cDlV?=
 =?utf-8?B?Q1lYQldoMzgxZEJJTjdubFhWditXc1QycHlib3lTZkdPZkErSUkvbXR1Slg1?=
 =?utf-8?B?d2dMYUFHbU5acW9lQ2RGeUNSRmZZcEhHQ09KREo2NXl2OTc4N1phdHNsNE9W?=
 =?utf-8?B?SHhKT1ZucENTaVNVcU54N1I3eHJHQ0IrQUxMaFQwZzhUSDZ3NkJEUTRTQ2hE?=
 =?utf-8?B?Ui9KWGZLUHB4L0ZQRHArRGNYcngxNHZBUUptWU1kaTB1aU83amtjNkhBbnR6?=
 =?utf-8?B?R0RlWXVUYTR6ZHdlMEV1ZHVSa2hEbzJNZlRFZmtPZ3c3MUtINmZFZjZ3Rk10?=
 =?utf-8?B?cExSeWtKTnZ6K3dBT2lMaVl1VUlwYVU0bURmUUxmSE1ub1plbDFEY3FlRmNk?=
 =?utf-8?B?Vm1BTHRMV2tERHpyUGNZblVVMDNvbm1JMUI0ZnNxQ2srVWdoOUVUK25DZzlG?=
 =?utf-8?B?dEJPUTVHaUpBQkI5UUs1RTNQcmdSZHQ4VzlOcUEveVczL3NCWHV5T1VNWEJP?=
 =?utf-8?B?SmVkcEdWU2dNVGRxd05vbk5JVDJpU0MwbU0wSzNBaVk1T3VnOENUa0QxOGJj?=
 =?utf-8?B?eHlnMlp5eFkzTHRyTDQrRDY4aXhtTmhvVnBuYWZEcjJta0QyL0JtWlZMVFVJ?=
 =?utf-8?Q?NJwN7WFJ74W6vn7zMAuT63htC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0730C0C4D0B03A4BA2046162E794992C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f7172d-b4a8-4bd8-bacd-08dbfc86a5e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 09:25:44.1557
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FeNrZKKdFTrPa51ADkiK/FX6XuH13bjP5yzaUj6sk+20SX58uWu0MLrddRiLy8LAPsVT4fAcJLHrxN+TbveXtOuJFcaVydxdhzK21Ks0Cuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2883
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "iii@linux.ibm.com" <iii@linux.ibm.com>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjMgw6AgMDY6NTUsIE5pY2hvbGFzIE1pZWhsYnJhZHQgYSDDqWNyaXTC
oDoNCj4gS01TQU4gZXhwZWN0cyBmdW5jdGlvbnMgX19tZW17c2V0LGNweSxtb3ZlfSBzbyBhZGQg
YWxpYXNlcyBwb2ludGluZyB0bw0KPiB0aGUgcmVzcGVjdGl2ZSBmdW5jdGlvbnMuDQo+IA0KPiBE
aXNhYmxlIHVzZSBvZiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgbWVtc2V0ezE2LDMyLDY0fSB0byBl
bnN1cmUgdGhhdA0KPiBtZXRhZGF0YSBpcyBjb3JyZWN0bHkgdXBkYXRlZCBhbmQgc3RybntjcHks
Y21wfSBhbmQgbWVte2NocixjbXB9IHdoaWNoDQo+IGFyZSBpbXBsZW1lbnRlZCBpbiBhc3NlbWJs
eSBhbmQgdGhlcmVmb3JlIGNhbm5vdCBiZSBpbnN0cnVtZW50ZWQgdG8NCj4gcHJvcGFnYXRlL2No
ZWNrIG1ldGFkYXRhLg0KPiANCj4gQWxpYXMgY2FsbHMgdG8gbWVte3NldCxjcHksbW92ZX0gdG8g
X19tc2FuX21lbXtzZXQsY3B5LG1vdmV9IGluDQo+IGluc3RydW1lbnRlZCBjb2RlIHRvIGNvcnJl
Y3RseSBwcm9wYWdhdGUgbWV0YWRhdGEuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBN
aWVobGJyYWR0IDxuaWNob2xhc0BsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20va21zYW4uaCAgICAgICAgICAgICAgIHwgIDcgKysrKysrKw0KPiAgIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9zdHJpbmcuaCAgICAgICAgICAgICAgfCAxOCArKysrKysr
KysrKysrKysrLS0NCj4gICBhcmNoL3Bvd2VycGMvbGliL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKysNCj4gICBhcmNoL3Bvd2VycGMvbGliL21lbV82NC5TICAgICAgICAgICAg
ICAgICAgICAgIHwgIDUgKysrKy0NCj4gICBhcmNoL3Bvd2VycGMvbGliL21lbWNweV82NC5TICAg
ICAgICAgICAgICAgICAgIHwgIDIgKysNCj4gICAuLi4vc2VsZnRlc3RzL3Bvd2VycGMvY29weWxv
b3BzL2FzbS9rbXNhbi5oICAgIHwgIDANCj4gICAuLi4vc2VsZnRlc3RzL3Bvd2VycGMvY29weWxv
b3BzL2xpbnV4L2V4cG9ydC5oIHwgIDEgKw0KPiAgIDcgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvcG93ZXJwYy9jb3B5bG9vcHMvYXNtL2ttc2FuLmgNCj4gDQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va21zYW4uaCBiL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9rbXNhbi5oDQo+IGluZGV4IGJjODRmNmZmMmVlOS4uZmM1OWRjMjRlMTcwIDEw
MDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va21zYW4uaA0KPiArKysgYi9h
cmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va21zYW4uaA0KPiBAQCAtNyw2ICs3LDEzIEBADQo+ICAg
I2lmbmRlZiBfQVNNX1BPV0VSUENfS01TQU5fSA0KPiAgICNkZWZpbmUgX0FTTV9QT1dFUlBDX0tN
U0FOX0gNCj4gICANCj4gKyNpZmRlZiBDT05GSUdfS01TQU4NCj4gKyNkZWZpbmUgRVhQT1JUX1NZ
TUJPTF9LTVNBTihmbikgU1lNX0ZVTkNfQUxJQVMoX18jI2ZuLCBmbikgXA0KPiArCQkJCUVYUE9S
VF9TWU1CT0woX18jI2ZuKQ0KPiArI2Vsc2UNCj4gKyNkZWZpbmUgRVhQT1JUX1NZTUJPTF9LTVNB
TihmbikNCj4gKyNlbmRpZg0KPiArDQo+ICAgI2lmbmRlZiBfX0FTU0VNQkxZX18NCj4gICAjaWZu
ZGVmIE1PRFVMRQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L3N0cmluZy5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3N0cmluZy5oDQo+IGluZGV4IDYw
YmEyMjc3MGY1MS4uNDEyNjI2Y2U2MTliIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vc3RyaW5nLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3N0cmlu
Zy5oDQo+IEBAIC00LDcgKzQsNyBAQA0KPiAgIA0KPiAgICNpZmRlZiBfX0tFUk5FTF9fDQo+ICAg
DQo+IC0jaWZuZGVmIENPTkZJR19LQVNBTg0KPiArI2lmICFkZWZpbmVkKENPTkZJR19LQVNBTikg
JiYgIWRlZmluZWQoQ09ORklHX0tNU0FOKQ0KPiAgICNkZWZpbmUgX19IQVZFX0FSQ0hfU1RSTkNQ
WQ0KPiAgICNkZWZpbmUgX19IQVZFX0FSQ0hfU1RSTkNNUA0KPiAgICNkZWZpbmUgX19IQVZFX0FS
Q0hfTUVNQ0hSDQo+IEBAIC01Niw4ICs1NiwyMiBAQCB2b2lkICpfX21lbW1vdmUodm9pZCAqdG8s
IGNvbnN0IHZvaWQgKmZyb20sIF9fa2VybmVsX3NpemVfdCBuKTsNCj4gICAjZW5kaWYgLyogQ09O
RklHX0NDX0hBU19LQVNBTl9NRU1JTlRSSU5TSUNfUFJFRklYICovDQo+ICAgI2VuZGlmIC8qIENP
TkZJR19LQVNBTiAqLw0KPiAgIA0KPiArI2lmZGVmIENPTkZJR19LTVNBTg0KPiArDQo+ICt2b2lk
ICpfX21lbXNldCh2b2lkICpzLCBpbnQgYywgX19rZXJuZWxfc2l6ZV90IGNvdW50KTsNCj4gK3Zv
aWQgKl9fbWVtY3B5KHZvaWQgKnRvLCBjb25zdCB2b2lkICpmcm9tLCBfX2tlcm5lbF9zaXplX3Qg
bik7DQo+ICt2b2lkICpfX21lbW1vdmUodm9pZCAqdG8sIGNvbnN0IHZvaWQgKmZyb20sIF9fa2Vy
bmVsX3NpemVfdCBuKTsNCj4gKw0KDQpUaGUgc2FtZSBpcyBkb25lIGZvciBLQVNBTiwgY2FuJ3Qg
eW91IHJldXNlIGl0ID8NCg0KPiArI2lmZGVmIF9fU0FOSVRJWkVfTUVNT1JZX18NCj4gKyNpbmNs
dWRlIDxsaW51eC9rbXNhbl9zdHJpbmcuaD4NCj4gKyNkZWZpbmUgbWVtc2V0IF9fbXNhbl9tZW1z
ZXQNCj4gKyNkZWZpbmUgbWVtY3B5IF9fbXNhbl9tZW1jcHkNCj4gKyNkZWZpbmUgbWVtbW92ZSBf
X21zYW5fbWVtbW92ZQ0KPiArI2VuZGlmDQoNCldpbGwgdGhhdCB3b3JrIGFzIHlvdSB3aXNoID8N
CldoYXQgYWJvdXQgdGhlIGNhbGxzIHRvIG1lbXNldCgpIG9yIG1lbWNweSgpIGVtaXRlZCBkaXJl
Y3RseSBieSBHQ0MgPw0KDQo+ICsjZW5kaWYgLyogQ09ORklHX0tNU0FOICovDQo+ICsNCj4gICAj
aWZkZWYgQ09ORklHX1BQQzY0DQo+IC0jaWZuZGVmIENPTkZJR19LQVNBTg0KPiArI2lmICFkZWZp
bmVkKENPTkZJR19LQVNBTikgJiYgIWRlZmluZWQoQ09ORklHX0tNU0FOKQ0KPiAgICNkZWZpbmUg
X19IQVZFX0FSQ0hfTUVNU0VUMzINCj4gICAjZGVmaW5lIF9fSEFWRV9BUkNIX01FTVNFVDY0DQo+
ICAgDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbGliL01ha2VmaWxlIGIvYXJjaC9wb3dl
cnBjL2xpYi9NYWtlZmlsZQ0KPiBpbmRleCA1MWFkMDM5N2MxN2EuLmZjM2VhM2VlYmJkNiAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2xpYi9NYWtlZmlsZQ0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMvbGliL01ha2VmaWxlDQo+IEBAIC0zMiw5ICszMiwxMSBAQCBvYmoteSArPSBjb2RlLXBhdGNo
aW5nLm8gZmVhdHVyZS1maXh1cHMubyBwbWVtLm8NCj4gICBvYmotJChDT05GSUdfQ09ERV9QQVRD
SElOR19TRUxGVEVTVCkgKz0gdGVzdC1jb2RlLXBhdGNoaW5nLm8NCj4gICANCj4gICBpZm5kZWYg
Q09ORklHX0tBU0FODQo+ICtpZm5kZWYgQ09ORklHX0tNU0FODQo+ICAgb2JqLXkJKz0Jc3RyaW5n
Lm8gbWVtY21wXyQoQklUUykubw0KPiAgIG9iai0kKENPTkZJR19QUEMzMikJKz0gc3RybGVuXzMy
Lm8NCj4gICBlbmRpZg0KPiArZW5kaWYNCj4gICANCj4gICBvYmotJChDT05GSUdfUFBDMzIpCSs9
IGRpdjY0Lm8gY29weV8zMi5vIGNydHNhdnJlcy5vDQo+ICAgDQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMvbGliL21lbV82NC5TIGIvYXJjaC9wb3dlcnBjL2xpYi9tZW1fNjQuUw0KPiBpbmRl
eCA2ZmQwNmNkMjBmYWEuLmE1NWYyZmFjNDliMyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBj
L2xpYi9tZW1fNjQuUw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbGliL21lbV82NC5TDQo+IEBAIC05
LDggKzksOSBAQA0KPiAgICNpbmNsdWRlIDxhc20vZXJybm8uaD4NCj4gICAjaW5jbHVkZSA8YXNt
L3BwY19hc20uaD4NCj4gICAjaW5jbHVkZSA8YXNtL2thc2FuLmg+DQo+ICsjaW5jbHVkZSA8YXNt
L2ttc2FuLmg+DQo+ICAgDQo+IC0jaWZuZGVmIENPTkZJR19LQVNBTg0KPiArI2lmICFkZWZpbmVk
KENPTkZJR19LQVNBTikgJiYgIWRlZmluZWQoQ09ORklHX0tNU0FOKQ0KPiAgIF9HTE9CQUwoX19t
ZW1zZXQxNikNCj4gICAJcmx3aW1pCXI0LHI0LDE2LDAsMTUNCj4gICAJLyogZmFsbCB0aHJvdWdo
ICovDQo+IEBAIC05Niw2ICs5Nyw3IEBAIF9HTE9CQUxfS0FTQU4obWVtc2V0KQ0KPiAgIAlibHIN
Cj4gICBFWFBPUlRfU1lNQk9MKG1lbXNldCkNCj4gICBFWFBPUlRfU1lNQk9MX0tBU0FOKG1lbXNl
dCkNCj4gK0VYUE9SVF9TWU1CT0xfS01TQU4obWVtc2V0KQ0KPiAgIA0KPiAgIF9HTE9CQUxfVE9D
X0tBU0FOKG1lbW1vdmUpDQo+ICAgCWNtcGx3CTAscjMscjQNCj4gQEAgLTE0MCwzICsxNDIsNCBA
QCBfR0xPQkFMKGJhY2t3YXJkc19tZW1jcHkpDQo+ICAgCWIJMWINCj4gICBFWFBPUlRfU1lNQk9M
KG1lbW1vdmUpDQo+ICAgRVhQT1JUX1NZTUJPTF9LQVNBTihtZW1tb3ZlKQ0KPiArRVhQT1JUX1NZ
TUJPTF9LTVNBTihtZW1tb3ZlKQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2xpYi9tZW1j
cHlfNjQuUyBiL2FyY2gvcG93ZXJwYy9saWIvbWVtY3B5XzY0LlMNCj4gaW5kZXggYjVhNjdlMjAx
NDNmLi4xNjU3ODYxNjE4Y2MgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9saWIvbWVtY3B5
XzY0LlMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2xpYi9tZW1jcHlfNjQuUw0KPiBAQCAtOCw2ICs4
LDcgQEANCj4gICAjaW5jbHVkZSA8YXNtL2FzbS1jb21wYXQuaD4NCj4gICAjaW5jbHVkZSA8YXNt
L2ZlYXR1cmUtZml4dXBzLmg+DQo+ICAgI2luY2x1ZGUgPGFzbS9rYXNhbi5oPg0KPiArI2luY2x1
ZGUgPGFzbS9rbXNhbi5oPg0KPiAgIA0KPiAgICNpZm5kZWYgU0VMRlRFU1RfQ0FTRQ0KPiAgIC8q
IEZvciBiaWctZW5kaWFuLCAwID09IG1vc3QgQ1BVcywgMSA9PSBQT1dFUjYsIDIgPT0gQ2VsbCAq
Lw0KPiBAQCAtMjI4LDMgKzIyOSw0IEBAIEVORF9GVFJfU0VDVElPTl9JRkNMUihDUFVfRlRSX1VO
QUxJR05FRF9MRF9TVEQpDQo+ICAgI2VuZGlmDQo+ICAgRVhQT1JUX1NZTUJPTChtZW1jcHkpDQo+
ICAgRVhQT1JUX1NZTUJPTF9LQVNBTihtZW1jcHkpDQo+ICtFWFBPUlRfU1lNQk9MX0tNU0FOKG1l
bWNweSkNCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Bvd2VycGMvY29w
eWxvb3BzL2FzbS9rbXNhbi5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcG93ZXJwYy9jb3B5
bG9vcHMvYXNtL2ttc2FuLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAw
MDAwMDAwLi5lNjlkZTI5YmIyZDENCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL3Bvd2VycGMvY29weWxvb3BzL2xpbnV4L2V4cG9ydC5oIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvcG93ZXJwYy9jb3B5bG9vcHMvbGludXgvZXhwb3J0LmgNCj4gaW5kZXggZTZiODBkNWZi
ZDE0Li42Mzc5NjI0YmJmOWIgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3Bvd2VycGMvY29weWxvb3BzL2xpbnV4L2V4cG9ydC5oDQo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3Bvd2VycGMvY29weWxvb3BzL2xpbnV4L2V4cG9ydC5oDQo+IEBAIC0yLDMgKzIs
NCBAQA0KPiAgICNkZWZpbmUgRVhQT1JUX1NZTUJPTCh4KQ0KPiAgICNkZWZpbmUgRVhQT1JUX1NZ
TUJPTF9HUEwoeCkNCj4gICAjZGVmaW5lIEVYUE9SVF9TWU1CT0xfS0FTQU4oeCkNCj4gKyNkZWZp
bmUgRVhQT1JUX1NZTUJPTF9LTVNBTih4KQ0K
