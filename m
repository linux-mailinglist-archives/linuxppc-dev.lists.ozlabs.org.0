Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3103848F656
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 11:16:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbYwn0KYPz30NW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 21:16:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61c;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbYwG2Sdgz2y7J
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 21:15:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcmPCUUjQne6kmW5XW5aO1sgRjH04BOXW5D5Hqsof9XERJp7Xz16usAw+L4GcuTPmLu7s0mppM8zZVFQZcNtjnKFha1W7LcGJ/yrKUmj3brpjZOmBHSrKCK6DPN6mOanPsVHWOLfU8U1TXqaXFaSePZ9DvhruKidNCUuga/LY8AumlzSKf3mRkKE0utYwNiQBG+6zcsqsPg7F9aU2HvoXXhW+CZt0+CaX0m3yz9slcgV7TDA1ZqTAoWZqx8k1mQ4JRVBY8htHprl1cRqUTMf4gG5tvcMRQgfiUzdhJybJNYv21NoULG4fQCmTs/lhjCojhCjEess/Oaz6BAVfb8bXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dMWBJD+VqpDxlegoNPwFrxsK8eRZhdC1IH3C2PihIo=;
 b=UR3unDr6Ns3NOPqiPkV4GS+z1DmBgfMONd2i5arnd06rz2TNgCnIyI+vTUlo1gwfCcgp3JDDExS5eLSTKyXbeoeuG0wzpjbNwo7MWy+8FF5bRwBzDJbdynlQ3FL0SxW/zvUdOmnFMP0B3UZ0kkEK0lFeRiyEzpLvN3VASne5q9W2Mg9SM5pc3x6EnktAh0NuyMNiklqX1clK+BjG9ffGTJfrvBARN/AyV4WzVcnGLtFrKNwgcAMrli+p10+cQyRFBt9pz8/opORpcgysIVbh7dRRLCWO6IjcgyoTRqTzDBtG4I1wOcI7hpHI6dUPsFdDwh67VNakpYXgzBi2YAnyGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2568.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Sat, 15 Jan
 2022 10:15:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4888.013; Sat, 15 Jan 2022
 10:15:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Dave Hansen <dave.hansen@intel.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "x86@kernel.org" <x86@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 3/3] x86: Support huge vmalloc mappings
Thread-Topic: [PATCH v2 3/3] x86: Support huge vmalloc mappings
Thread-Index: AQHX+zD/hWUWAcg7A0O0lNZsb1MJ4KxGfioAgAGXoTCAG+V6AA==
Date: Sat, 15 Jan 2022 10:15:34 +0000
Message-ID: <0ffb59f0-3ce9-99f3-8184-44dc2d56d57f@csgroup.eu>
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-4-wangkefeng.wang@huawei.com>
 <70ff58bc-3a92-55c2-2da8-c5877af72e44@intel.com>
 <3858de1f-cdbc-ff52-2890-4254d0f48b0a@huawei.com>
 <31a75f95-6e6e-b640-2d95-08a95ea8cf51@intel.com>
In-Reply-To: <31a75f95-6e6e-b640-2d95-08a95ea8cf51@intel.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8fd36e4b-282f-4e02-77d3-08d9d80ff7f3
x-ms-traffictypediagnostic: PR0P264MB2568:EE_
x-microsoft-antispam-prvs: <PR0P264MB2568E609190B0955EA86CCECED559@PR0P264MB2568.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1CMyK7MyvBXqTh/yxDMThrBKkqJnEUXErGNgzeZcu0Scx2qRUe9BpenS3ptFq6Lb5664MB75sKoz2a/jChtxTptZ0qWvHeeWHh4HwvkAo28xYkkIBiGHbM8Or/i71EPu20csVQQzPOxC9O9cjGIKpHiulY0bnU3dFQZcf4oaf7XKWlOnyhwmnZS0xVhKRGfYnuoCfK5GPDpQ4yvBm5iwckYE02nDU6/OgGu9CUhtui1S/7+dhHexfjI/1QVhQE0lu6/fgosgwk390FNrmHJBU5IYXL+cTL5PgFsl5RWWgQ9iBqE5hSMZn9NgGTnKfZMHGy4FNLJziY+UhsfAl5y2E0eKuwJCSHKgY6kNgvyYNL306Ek7OQhb8Leg9UcNyYHmdQwsMBw+8f20alVV6WeItX9TWgb9pXQA2G7eZGUMQ8Q2XsmL2wXYifOAvYLGpxv8dps8rkTXIHstY6+4eg5XK6f5FMG1UXmx6XZPsyGPdo8gag9JES9+H7uJHbISc6VQ7oX5Svt1Q4OPUVycUUwhmRxAPbLdTsVPYgpygOc6ZjvYFYqVJXbbVzSGZGikdft5dZKAc5p+h0STOYXIImwr27/pWCuISncfBppE5hEVitqW0VzciNwFM6RHYjsGNWMNE2Snw9Z+9ieXUjbRrvSfNe5ZHvcBTUIMgSFi+h031ueDnyrSYDDA8dUlhyiflmJsv9IcWFqupFNLGa+yRPck3igB+IEGXtZK4j5JUdrwsYqp7KqJHOk2temOt3eBQyocgKtZbyzLXS+320IB0tzFlUr/W0WeFP+40ZhzrMpAX3IKMH528OANyzEkHulc+Xkj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(71200400001)(38070700005)(5660300002)(54906003)(122000001)(91956017)(76116006)(8936002)(83380400001)(26005)(6486002)(31696002)(186003)(6506007)(38100700002)(6512007)(66946007)(64756008)(66446008)(66556008)(66476007)(110136005)(31686004)(86362001)(44832011)(2616005)(4326008)(66574015)(921005)(36756003)(2906002)(53546011)(8676002)(508600001)(7416002)(14583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azZzVXFoU2xRbGpCNFVTWllpUDBnUEZyL2hkSm1jTWthaHZUQnRBUDZCdHJP?=
 =?utf-8?B?T1dhUUZrZVJKb3lIWWh6dWpNME5GeE5KZ3ZCeWo2MHgvQVhWSk4rVG5aZlBa?=
 =?utf-8?B?Qk5xVjc1WGpLc29YNVBKR24xOHNCNUU2VjVkSFBOSEFzQWV4SHZsdDNydnEr?=
 =?utf-8?B?SlVJWWtBeEl1Njg4SExMK2JsOGtCQWNvaXZlMXJiT1FQNW5RTUpBZUJab3Nu?=
 =?utf-8?B?bkRSZThicVpRSlpIalNPRmxCOE9YMyttaTZWanIrNVFjc3hUdTZyd0NCZkNV?=
 =?utf-8?B?OUplOFpJQjdVNkRRZGJBYjhXQjRYZ29VQWNHUHRmNjY0WVQzM1VHNHlXMlRD?=
 =?utf-8?B?OEY5WXU4Y1RBVjRCNWhyQ3NzUmVwRFVWamJadE1VdEZhTlhLdUloQXhIQjN2?=
 =?utf-8?B?ZmV1VDBucmI4bmI0WGtxeDZBdGJrSU9yd1JuRm1SL091ZzRGUW9adGZmT3NE?=
 =?utf-8?B?ZDBibkFaNFdodmowYWdQelVyN2lWSnFzZFZnZE9FMjIxL25ZVC9wbHVEK3R1?=
 =?utf-8?B?azR2NXVERTBYcHgwa2FpTWJGVldPWmV3V1BTbXNFbVNzd2syMDBDaVkyK0R6?=
 =?utf-8?B?Sm9lcTV0dWROc3dMVld6Y0VKRStieW52MG85KzF6K2VTcENnMWQwVWFRL3pD?=
 =?utf-8?B?amhUbkRxb1l2WXFZQ1dHN0JHbUJkZUJ0MkFTVzAvN0l2R2lBc2J6WWRNNDd4?=
 =?utf-8?B?c3BGY0RaR1BvUjFNVy8zSkc5VW1jbTNwODdITU8xaHVKQWtOZEs0UlJHcnli?=
 =?utf-8?B?eHFBMUJQRGhYWXJQOUJxUldLVG1hMUFlZ3ZoN1QyUE9IczQ1QlBOdHBnaEZQ?=
 =?utf-8?B?RkJiVnNvanVKU2g2QUMxRVFHdTU1OE91OHJIQ1paemg3Q2JMNUJnTTdOVGRr?=
 =?utf-8?B?emdGNXJKd1NJVm1HNXEwNDlLYTIzNmxoQW9kRk1NOEhFZ2Nnak84NTVCVSta?=
 =?utf-8?B?Q1dZTlNwRDZmL0RES2l4WDdkWXVKalA3Y1l3QVZxTXJ2NGpFUktEVFVDR0N0?=
 =?utf-8?B?dGRFQ0ladFVQNUt0Rk1qRWJyYXVmbVYyR2dPVlRuQk13dmVQOExZSDduQ3Zl?=
 =?utf-8?B?SnBJV2hTY1ZvMXFCRnF6K2QvWEhiRjByajN0VkY3UkJQU1cyY1ExcmlKS1dE?=
 =?utf-8?B?UzhPL2tyRW1ueTBnRmlJNUdJN1p3RlRQeER6SUM1T2NHK1dKNjdaVXRCTnlE?=
 =?utf-8?B?UUdGK0JjNnVQTG9KNWVHTWVBTWdzU0dNK2d3TnRBclFMZzlvZmpyZDZST1Y4?=
 =?utf-8?B?V2xtZTF3OGwrTE1HQzFLSGxrVnpSR2xIVHArZVBkUE40c1NrMERhV1MyZjIx?=
 =?utf-8?B?VUQvZFo5VEtYMjlnNituVHlWVU9tM2ZGd2FDWDJEcGQzemptbWtmdktGbEt0?=
 =?utf-8?B?dlN6MVVxaGwwM2Q2S3hrMnlqU3o2amt1SUhrWGhXZENMNHdwalNqcWxhRVli?=
 =?utf-8?B?R2JmcER0MFVuU3FnbGFWeFMrNkNGK2FFWmROUndiKys5UDNtSitDQUozcXgz?=
 =?utf-8?B?MHVzaTlrKzNKeVVPTXhuVHNwQmpzOFJVK2V2MGZrSVl5dGgxbGtkbElBQ3Mx?=
 =?utf-8?B?b2RlYyt5U0VCL2N3WGx6emlwd1RVNXN6VFp6cklZdjlZUWN1SVJ3aC9uRnpw?=
 =?utf-8?B?NDdNUVlnZTB0RFd5NjhRSFQzcHpwMzlxc2dLN3RXL3grQXdJUjFkR1c3UG5N?=
 =?utf-8?B?LzZRVDl2TGdZZEhhaDlTOHdUcnlQN0h1UzlYRUNhUEJuR0FseWErcTA3bnlT?=
 =?utf-8?B?eUMxR0VSU1JuYmxNcDJQY25uV3VjTnMvZmxPWm85VDYwdVhjL0xtbW84b3lT?=
 =?utf-8?B?Z2FaM1Y1cDZBUk1BakZDQTBHRG5oRXZwTDYrZlU2SmZ3NFlMVGZWTWpCRHJt?=
 =?utf-8?B?WUVjcFBBYWRtaTBSdEMwUkhTdHYrWGFrRkdVM3BHSXZ5b2RrMUFESjYra29U?=
 =?utf-8?B?Z1doV2ZXdTUxeEVZUHBMOVVxUlpZRmZPeTZWRVZud1Q0Z1BlMlhzeUx3NGJD?=
 =?utf-8?B?a3VFWmJOaWh4eW9qd3NmK3JZNFZQbTR3NnhLQTdqWVZVUWk3WWdYWElNcXlR?=
 =?utf-8?B?d3BMWXN0TEVMNlc2VzQwRTJWQy9ESWthSnI5dWx3K1JZbHVOUzhIK0x5Z2V6?=
 =?utf-8?B?aTlIaEc5bUsxRXQ2cG1BLzh6SFBCN2NxV0dSMXUzd2pNN1B1RG5EL1RzKzNn?=
 =?utf-8?B?UitLa1RQUGpwc3gxSm5xNldjb1BpRC81ZUUyV0xtODZ3cVlaamVSQXRRWEVj?=
 =?utf-8?Q?9zN4l56Cuce8rN9YadpwzQ0o3Fz8bi4kM7gW4oPNcE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D30C3B1A64DEF54EBE8CC9DCF7A1815B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd36e4b-282f-4e02-77d3-08d9d80ff7f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2022 10:15:34.4267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCc7Ui6qUJMVZujbfxfYbERm/omTHqEBOm9XeaaySdm4kQ6I8aEIy6ZNiviWrHun0ENGMv+vfoqPBRkQyE+xX+wQmRNnHPLAUcgQ8kryag8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2568
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzEyLzIwMjEgw6AgMTc6MTQsIERhdmUgSGFuc2VuIGEgw6ljcml0wqA6DQo+IE9u
IDEyLzI4LzIxIDI6MjYgQU0sIEtlZmVuZyBXYW5nIHdyb3RlOg0KPj4+PiBUaGVyZSBhcmUgc29t
ZSBkaXNhZHZhbnRhZ2VzIGFib3V0IHRoaXMgZmVhdHVyZVsyXSwgb25lIG9mIHRoZSBtYWluDQo+
Pj4+IGNvbmNlcm5zIGlzIHRoZSBwb3NzaWJsZSBtZW1vcnkgZnJhZ21lbnRhdGlvbi93YXN0ZSBp
biBzb21lIHNjZW5hcmlvcywNCj4+Pj4gYWxzbyBhcmNocyBtdXN0IGVuc3VyZSB0aGF0IGFueSBh
cmNoIHNwZWNpZmljIHZtYWxsb2MgYWxsb2NhdGlvbnMgdGhhdA0KPj4+PiByZXF1aXJlIFBBR0Vf
U0laRSBtYXBwaW5ncyhlZywgbW9kdWxlIGFsbG9jIHdpdGggU1RSSUNUX01PRFVMRV9SV1gpDQo+
Pj4+IHVzZSB0aGUgVk1fTk9fSFVHRV9WTUFQIGZsYWcgdG8gaW5oaWJpdCBsYXJnZXIgbWFwcGlu
Z3MuDQo+Pj4gVGhhdCBqdXN0IHNheXMgdGhhdCB4ODYgKm5lZWRzKiBQQUdFX1NJWkUgYWxsb2Nh
dGlvbnMuwqAgQnV0LCB3aGF0DQo+Pj4gaGFwcGVucyBpZiBWTV9OT19IVUdFX1ZNQVAgaXMgbm90
IHBhc3NlZCAobGlrZSBpdCB3YXMgaW4gdjEpP8KgIFdpbGwgdGhlDQo+Pj4gc3Vic2VxdWVudCBw
ZXJtaXNzaW9uIGNoYW5nZXMganVzdCBmcmFnbWVudCB0aGUgMk0gbWFwcGluZz8NCj4+DQo+PiBZ
ZXMsIHdpdGhvdXQgVk1fTk9fSFVHRV9WTUFQLCBpdCBjb3VsZCBmcmFnbWVudCB0aGUgMk0gbWFw
cGluZy4NCj4+DQo+PiBXaGVuIG1vZHVsZSBhbGxvYyB3aXRoIFNUUklDVF9NT0RVTEVfUldYIG9u
IHg4NiwgaXQgY2FsbHMNCj4+IF9fY2hhbmdlX3BhZ2VfYXR0cigpDQo+Pg0KPj4gZnJvbSBzZXRf
bWVtb3J5X3JvL3J3L254IHdoaWNoIHdpbGwgc3BsaXQgbGFyZ2UgcGFnZSwgc28gdGhlcmUgaXMg
bm8NCj4+IG5lZWQgdG8gbWFrZQ0KPj4NCj4+IG1vZHVsZSBhbGxvYyB3aXRoIEhVR0VfVk1BTExP
Qy4NCj4gDQo+IFRoaXMgYWxsIHNvdW5kcyB2ZXJ5IGZyYWdpbGUgdG8gbWUuICBFdmVyeSB0aW1l
IGEgbmV3IGFyY2hpdGVjdHVyZSB3b3VsZA0KPiBnZXQgYWRkZWQgZm9yIGh1Z2Ugdm1hbGxvYygp
IHN1cHBvcnQsIHRoZSBkZXZlbG9wZXIgbmVlZHMgdG8ga25vdyB0byBnbw0KPiBmaW5kIHRoYXQg
YXJjaGl0ZWN0dXJlJ3MgbW9kdWxlX2FsbG9jKCkgYW5kIGFkZCB0aGlzIGZsYWcuICBUaGV5IG5l
eHQNCj4gZ3V5IGlzIGdvaW5nIHRvIGZvcmdldCwganVzdCBsaWtlIHlvdSBkaWQuDQoNClRoYXQn
cyBub3QgY29ycmVjdCBmcm9tIG15IHBvaW50IG9mIHZpZXcuDQoNCldoZW4gcG93ZXJwYyBhZGRl
ZCB0aGF0LCBhIGNsZWFyIGNvbW1lbnQgZXhwbGFpbnMgd2h5Og0KDQoNCisJLyoNCisJICogRG9u
J3QgZG8gaHVnZSBwYWdlIGFsbG9jYXRpb25zIGZvciBtb2R1bGVzIHlldCB1bnRpbCBtb3JlIHRl
c3RpbmcNCisJICogaXMgZG9uZS4gU1RSSUNUX01PRFVMRV9SV1ggbWF5IHJlcXVpcmUgZXh0cmEg
d29yayB0byBzdXBwb3J0IHRoaXMNCisJICogdG9vLg0KKwkgKi8NCg0KU28gYXMgeW91IGNhbiBz
ZWUsIHRoaXMgaXMgc29tZXRoaW5nIHNwZWNpZmljIHRvIHBvd2VycGMgYW5kIHRlbXBvcmFyeS4N
Cg0KPiANCj4gQ29uc2lkZXJpbmcgdGhhdCB0aGlzIGlzIG5vdCBhIGhvdCBwYXRoLCBhIHdlYWsg
ZnVuY3Rpb24gd291bGQgYmUgYSBuaWNlDQo+IGNob2ljZToNCj4gDQo+IC8qIHZtYWxsb2MoKSBm
bGFncyB1c2VkIGZvciBhbGwgbW9kdWxlIGFsbG9jYXRpb25zLiAqLw0KPiB1bnNpZ25lZCBsb25n
IF9fd2VhayBhcmNoX21vZHVsZV92bV9mbGFncygpDQo+IHsNCj4gCS8qDQo+IAkgKiBNb2R1bGVz
IHVzZSBhIHNpbmdsZSwgbGFyZ2Ugdm1hbGxvYygpLiAgRGlmZmVyZW50DQo+IAkgKiBwZXJtaXNz
aW9ucyBhcmUgYXBwbGllZCBsYXRlciBhbmQgd2lsbCBmcmFnbWVudA0KPiAJICogaHVnZSBtYXBw
aW5ncy4gIEF2b2lkIHVzaW5nIGh1Z2UgcGFnZXMgZm9yIG1vZHVsZXMuDQo+IAkgKi8NCg0KV2h5
ID8gTm90IGV2ZXJ5Ym9keSB1c2UgU1RSSUNUX01PRFVMRVNfUldYLg0KRXZlbiBpZiB5b3UgZG8g
c28sIHlvdSBjYW4gc3RpbGwgYmVuZWZpdCBmcm9tIGh1Z2UgcGFnZXMgZm9yIG1vZHVsZXMuDQoN
CldoeSBtYWtlIHdoYXQgd2FzIGluaXRpYWxseSBhIHRlbXBvcmFyeSBwcmVjYXV0aW9uIGZvciBw
b3dlcnBjIGJlY29tZSBhIA0KZGVmaW5pdGl2ZSBkZWZhdWx0IGxpbWl0YXRpb24gZm9yIGFsbCA/
DQoNCj4gCXJldHVybiBWTV9OT19IVUdFX1ZNQVA7DQo+IH0NCj4gDQo+IFN0aWNrIHRoYXQgaW4g
c29tZSB0aGUgY29tbW9uIG1vZHVsZSBjb2RlLCBuZXh0IHRvOg0KPiANCj4+IHZvaWQgKiBfX3dl
YWsgbW9kdWxlX2FsbG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSkNCj4+IHsNCj4+ICAgICAgICAgIHJl
dHVybiBfX3ZtYWxsb2Nfbm9kZV9yYW5nZShzaXplLCAxLCBWTUFMTE9DX1NUQVJULCBWTUFMTE9D
X0VORCwNCj4gLi4uDQo+IA0KPiBUaGVuLCBwdXQgYXJjaF9tb2R1bGVfdm1fZmxhZ3MoKSBpbiAq
YWxsKiBvZiB0aGUgbW9kdWxlX2FsbG9jKCkNCj4gaW1wbGVtZW50YXRpb25zLCBpbmNsdWRpbmcg
dGhlIGdlbmVyaWMgb25lLiAgVGhhdCB3YXkgKGV2ZW4gd2l0aCBhIG5ldw0KPiBhcmNoaXRlY3R1
cmUpIHdob2V2ZXIgY29waWVzLWFuZC1wYXN0ZXMgdGhlaXIgbW9kdWxlX2FsbG9jKCkNCj4gaW1w
bGVtZW50YXRpb24gaXMgbGlrZWx5IHRvIGdldCBpdCByaWdodC4gIFRoZSBuZXh0IGd1eSB3aG8g
anVzdCBkb2VzIGENCj4gInNlbGVjdCBIQVZFX0FSQ0hfSFVHRV9WTUFMTE9DIiB3aWxsIGhvcGVm
dWxseSBqdXN0IHdvcmsuDQo+IA0KPiBWTV9GTFVTSF9SRVNFVF9QRVJNUyBjb3VsZCBwcm9iYWJs
eSBiZSBkZWFsdCB3aXRoIGluIHRoZSBzYW1lIHdheS4=
