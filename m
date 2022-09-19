Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 660975BC2C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 08:18:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWDxr0CVpz3bmc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:18:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=mFsPCcoY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.88; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=mFsPCcoY;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90088.outbound.protection.outlook.com [40.107.9.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWDx12RDRz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 16:17:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKq430qzbkqS2o2cNmIPFEYmUhHB3lQtFti6ujSwOdFH2eolj5ZgWzG1hmCBKSqVijwUgvLdbr1NQWiPs1K5zJ+ViYrQzCD3Dc1C+3sEaBt4BsqzkDeivCaQi8VW/9EOKkW3GAV9yQdhIelgeVjNI1SebHaInBRYtgFX9Oa66HPAibsihwjzpwjWiezm5bM6J36rzjsj0rg3xnwLurdX37ZV/erzPqbMuW+/JGFfV69NPnKx95LJ2Sb/nvJDWRcqstHNumumabNm4siKktqehgP4f0X/ndhL1uRte5BCFkWH5GFGuExmhnxQLNY4pysp1zfXC8z+7nUfckBi8JtESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTjSU62jJBaBfx3zKA68yxMXujRBU7rTbR/GfEO9CEQ=;
 b=eoh0e/PNcTXRIPrA2QPoUOfp1z6w/SoklfJit/4SOQd9NUUTFN9jH6Z6VnUr43uCQaeZyC03H2Xtf8cjeJQi4dE6jZcSbH2NUnLyF3BhGN4rN8HkjhbbadlT09vPDa7/Ters73zm6pfYKFbMvgYHN61eRcR48SnF6csaVCJi+2Q/eACCDNBufJvNa90o+o8j4GHp+Q0fJZTtMaPy8ghaEorm05vKoW8Aoe1t5QLtQapgkz88oTkrvbGygCnHn+DCxuBCxnKEmfs0bOpWNeC7aGWCjSJJMDmext+97YBJkqZQPiy7Waoy9E/ff3CL+BI+NU68WxPEdetkPkpIO2RswQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTjSU62jJBaBfx3zKA68yxMXujRBU7rTbR/GfEO9CEQ=;
 b=mFsPCcoYcDhX20dDFvVFLs96H5LKApjFMbsKZPAiD0GzB0LSfLa6XMkP7ndJpPYQzD+D6dFKmZNh9X5Zk+ypPWf/GQBwFAmkQR00RZFayIcQ3uajOUMTnPqhC1K2jjneG4ufWDzYjX5eTUoIA6pUiXECU19elz/bYoeLqJ0dzxO8lQoh8ilNQmm5m43z8H1lb19FiTldkT6Ycr/vqhMa5g+YKCatn3glSAZ6Lc98i4O7porenmZgDPh/Umjo3zNVcbcHyHpfA8XfpUCdL9xhVJgSzBV0UhiEnrNSI36ZCmhonxg2DPT467LfZRQr2l0ljQW2V2mQoggqv1pa1q8QNg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1574.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Mon, 19 Sep
 2022 06:17:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 06:17:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/4] powerpc/64s: Add DEBUG_PAGEALLOC for radix
Thread-Topic: [PATCH 1/4] powerpc/64s: Add DEBUG_PAGEALLOC for radix
Thread-Index: AQHYy8nlJhklTd/R3EqJQuCxsQBgTK3mR0yA
Date: Mon, 19 Sep 2022 06:17:04 +0000
Message-ID: <6bc1c54a-1831-2ccc-3183-ed146baeddaf@csgroup.eu>
References: <20220919014437.608167-1-nicholas@linux.ibm.com>
In-Reply-To: <20220919014437.608167-1-nicholas@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1574:EE_
x-ms-office365-filtering-correlation-id: 251a71d8-872a-4ea9-4db2-08da9a0692a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Td3xhwcM1ke5MQdma6SsuQ268ktwtwoDs7fNPLuoiUjBh6hq0d6i+OnCrSzy4TT/9iYLBAB31bhU8SzswmmTkPz42W4n/7I163SOdI5uj5Z5g/AqED2xbuy2rqRkZQZSrPctP54hgPjvG7jQENUBcZOiGU+lj+7u3eL+frYK7j38TcpWNZHBCjLX2twPxlt2+HyEyyyOTMNFyFtx0fpnuuj6B9WGFkah5b5ZXm6P48EqmVg7sdxTQLddvDXhHDOPxw7puh5zco01KTC39Y6344HbB5oOnXGF4pA9RnRq97z985kuNy0OkpFMCdf43M3Be4Gmz0Y8s4bQmZFs6J1Fe4vOydn9AMsPIuNU702B8yQxEYR7zztgc7mdr6hEDgp5GGN8ufPqsw9zanFAmwHA2pPS9YikPUG5ilmIdh4U4Tip9IAUkisLXBXRFiRxIjU8Cu13myv/D8zNejtzbe373BOExVHrUNxSw/3zSFCAU7j+fjW81HIe6sU70FGRsYJHTxyxIWqE/XpZHZVQLwlsBmZKFxxDkNA8Cx2qQ03uyShbP82cj0OcodZbI8w94fI6w6zJnfjeXILvp/QSYyk80J13qa1vGyBzdO7bQiBqI77sUeXjXYJVtmCU/8XYXdX4UOWp5y/L/S2QBA7kX3D5cBRkqX+/vaNfba0pYE1bcfu+rOON5Ng4+IAT06a0GSvWBcU7SUsydyxYW+xma0JXRPiLuAqiOJuyAEERyTtmSqIgPMcBRPm5ezl+z+4TN0SiBHuCU7Av2JBZkmYDhR1lUjpfVWiPReXTdtmG4JonfdTqxZtMFbNwS08FoQ/FYZJZIhkdy5FhWC2/gkt4oaRNEQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39850400004)(366004)(451199015)(31686004)(6512007)(38100700002)(26005)(122000001)(6506007)(91956017)(8676002)(76116006)(64756008)(2906002)(2616005)(966005)(44832011)(41300700001)(38070700005)(5660300002)(86362001)(31696002)(186003)(71200400001)(66446008)(36756003)(8936002)(478600001)(110136005)(316002)(66946007)(66556008)(66476007)(83380400001)(66574015)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aWlwREFxOGxyY01MdHI0YU5ySzMzb2JSTWJBV2lRcFI4M0FycmEyc2ZGV0NK?=
 =?utf-8?B?cWZiZklobnl0OW5OQ25hbGhmangwbkZrOFVhUTZYcmwrcnhIdVdHc3FkQ0ty?=
 =?utf-8?B?N05va0tkdkpvREhUYmt5b2VvVlZjdWxyL045TnZ1MEUwMmY3cVFYU2hvMUZy?=
 =?utf-8?B?TUdYM0dIaEhpcENGMThkdDFwZzZIR2FjdlR5SEFXNmRaSTJSN2x4bEx4Nnhw?=
 =?utf-8?B?TTJSS2g1OXk0TDlraW5MaGg3b3JKZXpLRkJla0tFZ2I2d04vK25UaVN6bWdF?=
 =?utf-8?B?TjB0dWNGRm85czV6VC9zVkEyYU5hTk1RLzdlTzMrbjl3MFFVdjRQbEZjeWMw?=
 =?utf-8?B?RlZDMDhDcFVjcXpDTEhNbHFhSWs2Y0NXRE1mc09yQW9jQWhvM0laYUFMYkQ0?=
 =?utf-8?B?TVdjckV5a0FsaUNpTGpaS2V3dnBISklqSHh1NzFTdkhUQUM2VlRNU1NscG5G?=
 =?utf-8?B?eHFZV3E5RkVWc3hrZElVZnhtZVM3VEk5c1FDSnNNYk9iZVhsOGFrS0VTRHVS?=
 =?utf-8?B?bDhqUEdHWlhURitlQTlrZ0Z0NUFyb0laT1RNRkF3a0s5ZFJPaW5qYnBUVHlC?=
 =?utf-8?B?UFlEQWlMQ3FRK1NxMnBxSW40cDFXVkhSYmZGNXUxOGVPSVJVbXRNcmVuckZl?=
 =?utf-8?B?b01GSFN0aHByZHBSMUlPTDlsZ3FxZjM5NkJaQUJXZFlFbjF3NytQYTJHTWJV?=
 =?utf-8?B?azdSV0pNZHdSUGQ2Rm4wckk5bEpSTlVoOU0xdzFEWWxmTG9zLzVUb1hLR0wy?=
 =?utf-8?B?RjEwYlVkYVk5VEpnc0wvUEhKSFJEekVxK3BoTWdJVmJYV2hIeTRGUE1uZUFi?=
 =?utf-8?B?Yi9tSXlYcXJxRjNtazNLdlJVT3pHcmxzUm11Skp5YVVsSzkrNmVaSDFXWXkr?=
 =?utf-8?B?Y0xyU01COUpScXdid0pNMmJUU3huNjRuNUh4NEZkZTdxTjFYaVZtUW9XTkdm?=
 =?utf-8?B?TG1CT2JxeVYxUGVvbGtkV2tQZHNMR1BoVzN4VGFjREVKdEtGTUFXRitydXRQ?=
 =?utf-8?B?dEswQU4wL1hVOENKVWU3eU9TWkpJa1htd0FrK3hwbjFBcFk2TkNqVzJDeHdk?=
 =?utf-8?B?TjVZazlOMnhsTVdUVTZxOWN2cnpnMWlYRkplZUcxc0g4SW9kVTZVOGJBcEYv?=
 =?utf-8?B?K1MrSDVCRmpCQy9pMUE5TGRCM3FSa3J0bDVpdGNHdHp5dEhVQnNFOVcrSUFX?=
 =?utf-8?B?Mi9zZmRWemd5VmpDSytNT1ltQ1ZSckt2MUFoSnRuRG9EZUVIU29MVUVOWDE0?=
 =?utf-8?B?MldSc001UHJVTzc4UnAxTElXWlBTTEIxTjVHRDh4dHpSUDNPU094R0NPeW4w?=
 =?utf-8?B?bDMxOHBOSWk2ajhKUGpUZzI3ajBtWU01U200eXRhNSs4QTBiZFJoWEtPRXpm?=
 =?utf-8?B?TjZ5dlYxOUd2R0VZWDN0NG9KS2xpR2lLMG8vMThwakdOaGlxVkcxc3dzOUFO?=
 =?utf-8?B?WTJOVUdDLy9JODRqLzIzWFk5U3QwUkUySXlnZndMZjAvakplcW5sU3FscWNu?=
 =?utf-8?B?OFYzR3JIeGlKOFUvMHNENW5VcUhkcUVKMVJ3WWlxUTdpelh6TzJNaTkyMm5y?=
 =?utf-8?B?Ui96eTRGQ0xpWkNicHUzazEyTm5rb3BObEtZYWIwcllabVA4aGc3MzU4bWRk?=
 =?utf-8?B?T1hMRkdvT0xQd21SNmVIT29lK2ZzRHlxUWlVbFc0bm10SGRmeWJBMkxDbVBr?=
 =?utf-8?B?d1Q5Y0NaMU9hMWlpUHVWaThNT08vclZXVmNTQ2RsRTkzbE1HVkFRRmdoV0lJ?=
 =?utf-8?B?dTlYVSthMExiSXkyMCt4bndZd3AyM2pGL2l5WVZJcE9iUkJMOXBRdzJqTnl5?=
 =?utf-8?B?cHRJQ3VPQk9nQ2RZWnF5WUhoRVlmckMwNHBxTThHVXJlK2JvSGtBOGs0YkVU?=
 =?utf-8?B?M3A4UVRIeXQyVDYyZzJKckJicTgzMndHbmE1TjR2ODd6VUZlRVgrbzZYNnRN?=
 =?utf-8?B?L3VmUDduYXJCdjA3UXhYWkNpK3lCMDhQRDU3TWJ3TkNaL3FlZzNGTWgyRWJS?=
 =?utf-8?B?cUlBMVlXOW80dnljOTY5QlNON1FWL01qM09zYklCNUdmL2lqekkvSlhxTVRY?=
 =?utf-8?B?aDd2djl4c3BQYmx5bWt2YmVzbFFEYlVnSCtKN0RUNG96aVZYT3pCWkxQWm5E?=
 =?utf-8?B?Z3RCUUlqYzJlb2UzRkpkdUJYdUdTQlBZL1B1emxYcEtuQlpIYWdMV2NlYnkw?=
 =?utf-8?Q?qwxuH39H7zUXTOxKOnIRcXU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA8CB22FF64FEC4EBF7C8AA639DB24F4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 251a71d8-872a-4ea9-4db2-08da9a0692a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 06:17:04.6862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2fju6cRR5vE2e1iqXcgGUn/nsrT7dryUoafD0yw8u9pDu7Najqaoc1hLUT4KJPmxiHj86WDkT+YyBWQj9cHJUZGp6GwcylPrOneWSFE9EqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1574
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA5LzIwMjIgw6AgMDM6NDQsIE5pY2hvbGFzIE1pZWhsYnJhZHQgYSDDqWNyaXTC
oDoNCj4gW1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgbmljaG9s
YXNAbGludXguaWJtLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQg
w6AgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+
IFRoZXJlIGlzIHN1cHBvcnQgZm9yIERFQlVHX1BBR0VBTExPQyBvbiBoYXNoIGJ1dCBub3Qgb24g
cmFkaXguDQo+IEFkZCBzdXBwb3J0IG9uIHJhZGl4Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlj
aG9sYXMgTWllaGxicmFkdCA8bmljaG9sYXNAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJj
aC9wb3dlcnBjL21tL2Jvb2szczY0L3JhZGl4X3BndGFibGUuYyB8IDE2ICsrKysrKysrKysrKysr
Ky0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9wZ3RhYmxl
LmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfcGd0YWJsZS5jDQo+IGluZGV4IGRi
MmYzZDE5MzQ0OC4uNDgzYzk5YmZiZGU1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0v
Ym9vazNzNjQvcmFkaXhfcGd0YWJsZS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2
NC9yYWRpeF9wZ3RhYmxlLmMNCj4gQEAgLTMwLDYgKzMwLDcgQEANCj4gICAjaW5jbHVkZSA8YXNt
L3RyYWNlLmg+DQo+ICAgI2luY2x1ZGUgPGFzbS91YWNjZXNzLmg+DQo+ICAgI2luY2x1ZGUgPGFz
bS91bHRyYXZpc29yLmg+DQo+ICsjaW5jbHVkZSA8YXNtL3NldF9tZW1vcnkuaD4NCj4gDQo+ICAg
I2luY2x1ZGUgPHRyYWNlL2V2ZW50cy90aHAuaD4NCj4gDQo+IEBAIC01MDMsNiArNTA0LDkgQEAg
c3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0IHJhZGl4X21lbW9yeV9ibG9ja19zaXplKHZvaWQp
DQo+ICAgew0KPiAgICAgICAgICB1bnNpZ25lZCBsb25nIG1lbV9ibG9ja19zaXplID0gTUlOX01F
TU9SWV9CTE9DS19TSVpFOw0KPiANCj4gKyAgICAgICBpZiAoZGVidWdfcGFnZWFsbG9jX2VuYWJs
ZWQoKSkNCj4gKyAgICAgICAgICAgICAgIHJldHVybiBQQUdFX1NJWkU7DQo+ICsNCj4gICAgICAg
ICAgLyoNCj4gICAgICAgICAgICogT1BBTCBmaXJtd2FyZSBmZWF0dXJlIGlzIHNldCBieSBub3cu
IEhlbmNlIHdlIGFyZSBvaw0KPiAgICAgICAgICAgKiB0byB0ZXN0IE9QQUwgZmVhdHVyZS4NCj4g
QEAgLTUxOSw2ICs1MjMsOSBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBfX2luaXQgcmFkaXhfbWVt
b3J5X2Jsb2NrX3NpemUodm9pZCkNCj4gDQo+ICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0
IHJhZGl4X21lbW9yeV9ibG9ja19zaXplKHZvaWQpDQo+ICAgew0KPiArICAgICAgIGlmIChkZWJ1
Z19wYWdlYWxsb2NfZW5hYmxlZCgpKQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIFBBR0VfU0la
RTsNCj4gKw0KPiAgICAgICAgICByZXR1cm4gMVVMICogMTAyNCAqIDEwMjQgKiAxMDI0Ow0KDQpX
aGlsZSBhdCBpdCwgbWF5YmUgeW91IGNhbiByZXBsYWNlIHRoZSBhYm92ZSBieSBTWl8xRw0KDQo+
ICAgfQ0KPiANCj4gQEAgLTg5OSw3ICs5MDYsMTQgQEAgdm9pZCBfX21lbWluaXQgcmFkaXhfX3Zt
ZW1tYXBfcmVtb3ZlX21hcHBpbmcodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZw0K
PiAgICNpZmRlZiBDT05GSUdfREVCVUdfUEFHRUFMTE9DDQo+ICAgdm9pZCByYWRpeF9fa2VybmVs
X21hcF9wYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgaW50IG51bXBhZ2VzLCBpbnQgZW5hYmxlKQ0K
PiAgIHsNCj4gLSAgICAgICBwcl93YXJuX29uY2UoIkRFQlVHX1BBR0VBTExPQyBub3Qgc3VwcG9y
dGVkIGluIHJhZGl4IG1vZGVcbiIpOw0KPiArICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcjsNCj4g
Kw0KPiArICAgICAgIGFkZHIgPSAodW5zaWduZWQgbG9uZylwYWdlX2FkZHJlc3MocGFnZSk7DQo+
ICsNCj4gKyAgICAgICBpZiAoZW5hYmxlKQ0KPiArICAgICAgICAgICAgICAgc2V0X21lbW9yeV9w
KGFkZHIsIG51bXBhZ2VzKTsNCj4gKyAgICAgICBlbHNlDQo+ICsgICAgICAgICAgICAgICBzZXRf
bWVtb3J5X25wKGFkZHIsIG51bXBhZ2VzKTsNCj4gICB9DQo+ICAgI2VuZGlmDQo+IA0KPiAtLQ0K
PiAyLjM0LjENCj4g
