Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 587586178F5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:42:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2y1T1hzMz3cF6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:42:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=li4W8Qq+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.78; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=li4W8Qq+;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120078.outbound.protection.outlook.com [40.107.12.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2y0T19Spz2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 19:41:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geVOkLpSOGMm2upXj5uUaNAAQaBI+7GjJU8Dt23ROW3oCbylsVebPghbqzk20Rxee386ykIc3F3DNIjciZSuOMCF/fpm/VzP7iaO2FsfTklcN7YBTuv0NOpV8+GTTBbfvveuNbn8+jtcBm9VMRKLea2AYpXyAE8X3tEFS9YydVmHJ5ujBwDbFqwLnbnCiQjpcJ1lXo8HpZhbDpVbmjFcw2Y6Ue/dq36CBRH6JjLk+nuunPxfy8bBZ9TnNoJC6gd+vO33FTHksca85hNYbYsoMGLo8WboqfsY/ZHrVIaonlwyTuBD+wxT6nLjckOJHbpOgew0p5a8LbXRAJnoAerbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOVbWS+Rqf2RmHelQ49+BvF8c1hpNA2AC7hK5nCGmaI=;
 b=Cn/5CURevxmOyD+k88MJprr8DWSvlkRrpRMwcom0Ixom+r+CSigzrw6wQZGecGJoy8MpAJa2PiEHv5TP9ciZAO7NPCsauAed8cOytII5/ZMui96oeeNMQc5qayFB+CetYwWmkbRWn8FiefIIZJx/9GcH13IA3zw9sdG3d4CrHFTAGb4O8bdla7zqsJamxm/hSTMgav4yBxJOFcqWA9uzZROPYL8w1Y729pI3OVCiPfunvLc2OS+1WbzbWUj7W7FUBzGxSIk4IA0siF4n588VFKaT38Qo9o7jlFdCqeNKZvVRE6Z+GlcRkyV9ycHNrzHyEDg1A0G2F4mW6TRq5JK/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOVbWS+Rqf2RmHelQ49+BvF8c1hpNA2AC7hK5nCGmaI=;
 b=li4W8Qq+o8TWuhkrrsueyG/HTxSveeKZm/Jp4qTxjPL0dG585YhlQZdBeWr85B/zhoe8i5kq2kHqbjGVdh3WXk/JUBqS1Xl/zd6V4snK7yvr5+VWBg0TtPVVbqKABoX9DVqocja+81iN/uQmfx1nTjQBK3oogjj+F7yZmGUifFx3lJSlQbVTQmOe0G3FEuoA966hEPi/6Qap1UmXqPyGJW2I/RXigW1/vgMSHqZy8b4VKxZmg/m6ScHuOiPX2qL/ntCLB8ij2/cRgtYEb3vrn640zl3JGzPCG+PXHyvuMJOB7tlNWO4YlEjYcIMKiWfhlisp0As8A4OKUsBSRHlelQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2488.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 08:41:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 08:41:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page
 helpers
Thread-Topic: [PATCH v3 2/3] powerpc: mm: add p{te,md,ud}_user_accessible_page
 helpers
Thread-Index: AQHY50DabMWE5kp8GEGzy5e/CEe4lK4s8YIA
Date: Thu, 3 Nov 2022 08:41:07 +0000
Message-ID: <f782bcaf-8da4-4c75-f435-7a690cde8531@csgroup.eu>
References: <20221024003541.1347364-1-rmclure@linux.ibm.com>
 <20221024003541.1347364-2-rmclure@linux.ibm.com>
In-Reply-To: <20221024003541.1347364-2-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2488:EE_
x-ms-office365-filtering-correlation-id: a5327852-62f3-4408-7760-08dabd772700
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  w0qA0hYs6iiUHiogN4B0JywNmB5QHMshfu6UD25maj6ntz41lueeNc2lD0fepDEyOnhqlX/snFeEuo+VLcyu781MCXyPh901fYmxQHAUvaDrddLoh3hWsT+Exct7bsAYtOEpr+rdp7+nj339Wo/bdMfbU4S3yDIi35NM1wfu1aRUTYPcLPuRTPHrSuNSwbm3vauepmaNsQd0Y+yMMfXbWOTbzpuAq3nm/6s+Su0dF27s7MtEay7biPJ7vYk9/UjQ91K9fmYb/HUxtToxay/b1r6oFSXuEA211OWzfK//snzxpmcshZ2yBmu3OPpjaWzYCg8gIrwx+pJvVmhhOpZplN0xUWgwv1v8uV255GmQRFbj1q/VfefDsDBpizr7RBXrYc9c/kxVz/3MAPepF3EWetW9X2kJ+QrACdHDCOYio8H+WpsJmRa6hDe6+ofOmwOE7/wb7U6RyNuAPlxH6mjslWgA/QmViwyLJuXbnHhdINYjNU70TMci3GCvsQaekOqb8fpbuNNZzWdFGf0gaUtvUssCJbLCp9+7KX+gOnALwX/BtP49iJSxRfkpe6BRs7QC+PpjSTiaOpTTXwHW3YtXIYrrLyVy7YyHxpWy40cFwUuadFb1cqDIQhzfR9PojZmFkz5hZTbV8TDwYZzQUViF6qlDpcvSMIasajum0ARoVKFkbjj0Cfvh57VYutzj896FpSqAt6Jai20S7tgmCqBE1MgJm0YM9XErqt4qbymcnq1Hv8/tNVtFzQY4LrYYz0KscUY0B+V7xr1wY9hfMXhxbkneenWNbC1gRs7zrmgStkkABSDIK8eZbkCBg+Fx1PRa5LypQa5sobSLBhsXyVQtrA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(39850400004)(366004)(346002)(451199015)(316002)(110136005)(71200400001)(66446008)(6486002)(8676002)(91956017)(66556008)(76116006)(66946007)(478600001)(31686004)(66476007)(64756008)(6506007)(26005)(2616005)(44832011)(6512007)(8936002)(5660300002)(186003)(2906002)(66574015)(38070700005)(83380400001)(36756003)(86362001)(41300700001)(122000001)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ei96RWk5bzJjYzFxLzZsTWs4bjVPMEFOcGxCRGVqM1V3ckM0dWxPWXpvMjJS?=
 =?utf-8?B?bElpNGpoQ1JWQ2VqYTRnMlZ5c3NWZGFtb2pqTUtiRUNXVE1WUTdTUGt6Ykky?=
 =?utf-8?B?Mzhpb21lTmVvWlQwMEt5NDlRcnZkbWpFblA4c3QvNFlPdEhQYzNHbTZ2UHV1?=
 =?utf-8?B?OW1QbDgybjVxbzcrMWVEMTZXeTRFdW81bTk3U2xhNWRjRVc0MHFwWm41TmlS?=
 =?utf-8?B?SFE5WGxTRHFEdUs0Y2hrOGtWdk5GNFBRSFY4UnVWNDhLL3hDVWxGamdhMXA2?=
 =?utf-8?B?WHZmNTV3d2FaZkhKSGFKTy9EanJGd3FlRnF1UWdqN1QxN3lVc21jTUhBeU5l?=
 =?utf-8?B?R1FKSTV0QkNJb2ZOaUZkL25HUE1CcnZHWjlFQnU2T3ZYMnBzREtybllqeGs0?=
 =?utf-8?B?MDB3MjhFRU1tT1lvV3dtdHBydlhpRjdsbHhvZVhsaFNEK2JEMnI4ekVoR3NY?=
 =?utf-8?B?c2wxNklvd0FDdUsrR0FIcEQ2ZUlxMHNZYllkVGIrQzN6VDcvSDlRZ0pjRGI5?=
 =?utf-8?B?bjJNRi92T3JkNzZLREE1L1JUV1lUa2U1empJVDBPa1lKeWpTWThUMzBTWGtp?=
 =?utf-8?B?QW1EQ3ZEV09EN3dMazJwZ2hzUkFPQ1U2c2pWNlFGU21aa2pobTRjUVpmaWd0?=
 =?utf-8?B?RVpOQ1hqR3ZmQWNLbG5RanlEVFFxYXdLL3hJbS9rNENZRGxLekt1blpZTVA2?=
 =?utf-8?B?VE1NNk00YWVNMzZib21EVWEvOTljdUNXUzJHaVpvby8vdGNMbmVUMnVjbkpD?=
 =?utf-8?B?VUhXWEZkK3BDYm1YOExVcGd4UUszMjFHa1c3ZUN5SXV4bHJsZythczg2TUZT?=
 =?utf-8?B?K2dSeVplcXhmMkUxQzhaSG1uTkZScHlTa2xKT2tYODhTanY2TUNCM0lSQ3NQ?=
 =?utf-8?B?VW1LVnJOKzk3OUw5TkZaT2JKcTE2UVc4UWtKeldaYUd3cExlaEtyRFdHNGov?=
 =?utf-8?B?Vm9CMTFEZUVQajFVaEQwUytWUWlRM0wxYk5ka3B3VmtPcnQxYXc0eDRSOC92?=
 =?utf-8?B?M2l4THphalZrdUVUQW42cXN5UlBkanFVRVpxUFQvOVBmd3k0alFkMVFES3Vn?=
 =?utf-8?B?RFZUMnlKRUNoME5XMVRaeWV0ZHBUeHNxOWplbllUbCtqcTlpWFNWZzJPS0wv?=
 =?utf-8?B?VzVnek9HQnFLQnBOR0JpdzdxNDdKMDYyQk04L3llMWZjeDZSaFJzTm0yS0I5?=
 =?utf-8?B?eEw2T1hsdUkxR29rek5NN2VFRE16cFNib05yYzd4UE5zS3NpV0RFWFpJNy9x?=
 =?utf-8?B?UHorTU9Gc1p6VG01R2FTRkttYlBmYVllRkU1ZWVIbmJPNEYraTdLWTFCeUgr?=
 =?utf-8?B?b1VybGFuYjdMT2VkeThVTk85SlluWnVrcXY3TXJqWmNUa2RaVWY3eTh3eS9x?=
 =?utf-8?B?UXJCK05tZmhhYUpJd05sNXVEZ09KUDRYemdHa0F0QXlTc25ZUVFqN2RwRFA4?=
 =?utf-8?B?UTg4SENPaDZVT3phTkNTeHNGZUdkTHQ4Zjk3WVJ5ZzFZOU9POXNnck01VThI?=
 =?utf-8?B?Qk5SSUJrTWEvVUlaclBJOXB4T0MxTFI3WWtjY0phK3FRVkY4blk1TC9vajZh?=
 =?utf-8?B?OFlrVEZ4MUdOdFZyT2xxSWFhcGRZTFdub3Jwd3J0bnlLcUFmL2czWWw0c21N?=
 =?utf-8?B?R0RseWgxQXRHc0w3dDQ2VGNjY29wbC9KemVaMXgzTk1pcWR2WTNPbEdkOHBx?=
 =?utf-8?B?TWtGOVNJTmtwVlJrMWFPckkzRWdLVVVSQ3NBd2tMYlRMRllORWJNcHFvazdl?=
 =?utf-8?B?VGFab01XekNYNGJXKzdpT2YzYTlkM2tVMUVuekxwNlJ3VFZ1NExxT0l4WUVG?=
 =?utf-8?B?WHBsNVIvT252MVFGZGFBSzkzajk0ZGtJR0xpSkdBYzRZSGFnbFRuTXJTRGxF?=
 =?utf-8?B?bG1sRGJ4eFdRZ3hiWEpSVm9IM3NNNnlyODNaQTU2MURuWkJJb3h4VXB4bWJw?=
 =?utf-8?B?YkU4WnZqRUVJWlFmeXl4TERqWTU2Vk4vQ3VpRGMzZDQwM1Jua2ZWRzhTWWhP?=
 =?utf-8?B?UmtmV3JseE81dTNwKy8wVGNlaElnTVFERVlCdGd3eEoyVWQyaU1aN1BEejNO?=
 =?utf-8?B?QTZOWFM3VXN3TmtaU210TnFQQXVDeXBWc2tZV082dTVoR2ZKQ0xKUE9Uek16?=
 =?utf-8?B?TWc2RW1pa21aOFdiZFVydXZvSThqSTdSakJvY0ZVQTFuMUZBc1lHK3poK0hj?=
 =?utf-8?Q?q1Y0xcijytflLUbuJpnCzHU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DBD72F7BEAB2045BD01B486D39BF6FD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a5327852-62f3-4408-7760-08dabd772700
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 08:41:07.9290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+M4ozymKRt9IxhO5KzD6QCVw97YoEzbUsQc4aAO6HT/wsmk5GYodUyy8mQvZIuwJs9sfT2G2GekJPtHpW7/kg5CQ7ASGF4ihO+0ZoFFFLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2488
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

DQoNCkxlIDI0LzEwLzIwMjIgw6AgMDI6MzUsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBB
ZGQgdGhlIGZvbGxvd2luZyBoZWxwZXJzIGZvciBkZXRlY3Rpbmcgd2hldGhlciBhIHBhZ2UgdGFi
bGUgZW50cnkNCj4gaXMgYSBsZWFmIGFuZCBpcyBhY2Nlc3NpYmxlIHRvIHVzZXIgc3BhY2UuDQo+
IA0KPiAgICogcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlDQo+ICAgKiBwbWRfdXNlcl9hY2Nlc3Np
YmxlX3BhZ2UNCj4gICAqIHB1ZF91c2VyX2FjY2Vzc2libGVfcGFnZQ0KPiANCj4gQWxzbyBpbXBs
ZW1lbnQgbWlzc2luZyBwdWRfdXNlciBkZWZpbml0aW9ucyBmb3IgYm90aCBCb29rM1Mvbm9oYXNo
IDY0LWJpdA0KPiBzeXN0ZW1zLCBhbmQgcG1kX3VzZXIgZm9yIEJvb2szUy9ub2hhc2ggMzItYml0
IHN5c3RlbXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGlu
dXguaWJtLmNvbT4NCj4gLS0tDQo+IFYyOiBQcm92aWRlIG1pc3NpbmcgcHVkX3VzZXIgaW1wbGVt
ZW50YXRpb25zLCB1c2UgcHt1LG19ZF9pc19sZWFmLg0KPiBWMzogUHJvdmlkZSBtaXNzaW5nIHBt
ZF91c2VyIGltcGxlbWVudGF0aW9ucyBhcyBzdHVicyBpbiAzMi1iaXQuDQo+IC0tLQ0KPiAgIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oIHwgIDQgKysrKw0KPiAg
IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIHwgMTAgKysrKysr
KysrKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oIHwg
IDEgKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvNjQvcGd0YWJsZS5oIHwg
MTAgKysrKysrKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAg
ICAgICAgIHwgMTUgKysrKysrKysrKysrKysrDQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jv
b2szcy8zMi9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3Bn
dGFibGUuaA0KPiBpbmRleCA0MDA0MWFjNzEzZDkuLjhiZjFjNTM4ODM5YSAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmgNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmgNCj4gQEAgLTUzMSw2
ICs1MzEsMTAgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVfbW9kaWZ5KHB0ZV90IHB0ZSwgcGdw
cm90X3QgbmV3cHJvdCkNCj4gICAJcmV0dXJuIF9fcHRlKChwdGVfdmFsKHB0ZSkgJiBfUEFHRV9D
SEdfTUFTSykgfCBwZ3Byb3RfdmFsKG5ld3Byb3QpKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMg
aW5saW5lIGJvb2wgcG1kX3VzZXIocG1kX3QgcG1kKQ0KPiArew0KPiArCXJldHVybiAwOw0KPiAr
fQ0KPiAgIA0KPiAgIA0KPiAgIC8qIFRoaXMgbG93IGxldmVsIGZ1bmN0aW9uIHBlcmZvcm1zIHRo
ZSBhY3R1YWwgUFRFIGluc2VydGlvbg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9v
azNzLzY0L3BndGFibGUuaA0KPiBpbmRleCBmOWFlZmE0OTJkZjAuLjMwODMxMTFmOWQwYSAxMDA2
NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgN
Cj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmgNCj4g
QEAgLTYyMSw2ICs2MjEsMTYgQEAgc3RhdGljIGlubGluZSBib29sIHB0ZV91c2VyKHB0ZV90IHB0
ZSkNCj4gICAJcmV0dXJuICEocHRlX3JhdyhwdGUpICYgY3B1X3RvX2JlNjQoX1BBR0VfUFJJVklM
RUdFRCkpOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNlcihwbWRf
dCBwbWQpDQo+ICt7DQo+ICsJcmV0dXJuICEocG1kX3JhdyhwbWQpICYgY3B1X3RvX2JlNjQoX1BB
R0VfUFJJVklMRUdFRCkpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX3Vz
ZXIocHVkX3QgcHVkKQ0KPiArew0KPiArCXJldHVybiAhKHB1ZF9yYXcocHVkKSAmIGNwdV90b19i
ZTY0KF9QQUdFX1BSSVZJTEVHRUQpKTsNCj4gK30NCj4gKw0KPiAgICNkZWZpbmUgcHRlX2FjY2Vz
c19wZXJtaXR0ZWQgcHRlX2FjY2Vzc19wZXJtaXR0ZWQNCj4gICBzdGF0aWMgaW5saW5lIGJvb2wg
cHRlX2FjY2Vzc19wZXJtaXR0ZWQocHRlX3QgcHRlLCBib29sIHdyaXRlKQ0KPiAgIHsNCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oIGIv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC8zMi9wZ3RhYmxlLmgNCj4gaW5kZXggOTA5
MWU0OTA0YTZiLi5iOTIwNDRkOWQ3NzggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oDQo+IEBAIC0zNTQsNiArMzU0LDcgQEAgc3RhdGljIGlu
bGluZSBpbnQgcHRlX3lvdW5nKHB0ZV90IHB0ZSkNCj4gICAjZW5kaWYNCj4gICANCj4gICAjZGVm
aW5lIHBtZF9wYWdlKHBtZCkJCXBmbl90b19wYWdlKHBtZF9wZm4ocG1kKSkNCj4gKyNkZWZpbmUg
cG1kX3VzZXIocG1kKQkJMA0KDQpDYW4gaXQgYmUgYSBzdGF0aWMgaW5saW5lIGxpa2UgZm9yIGJv
b2szcy8zMiBpbnN0ZWFkID8NCg0KPiAgIC8qDQo+ICAgICogRW5jb2RlIGFuZCBkZWNvZGUgYSBz
d2FwIGVudHJ5Lg0KPiAgICAqIE5vdGUgdGhhdCB0aGUgYml0cyB3ZSB1c2UgaW4gYSBQVEUgZm9y
IHJlcHJlc2VudGluZyBhIHN3YXAgZW50cnkNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9ub2hhc2gvNjQvcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L25vaGFzaC82NC9wZ3RhYmxlLmgNCj4gaW5kZXggNTk5OTIxY2MyNTdlLi4yM2M1MTM1MTc4ZDEg
MTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvNjQvcGd0YWJs
ZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvNjQvcGd0YWJsZS5o
DQo+IEBAIC0xMjMsNiArMTIzLDExIEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcG1kX3B0ZShwbWRf
dCBwbWQpDQo+ICAgCXJldHVybiBfX3B0ZShwbWRfdmFsKHBtZCkpOw0KPiAgIH0NCj4gICANCj4g
K3N0YXRpYyBpbmxpbmUgYm9vbCBwbWRfdXNlcihwbWRfdCBwbWQpDQo+ICt7DQo+ICsJcmV0dXJu
IChwbWRfdmFsKHBtZCkgJiBfUEFHRV9VU0VSKSA9PSBfUEFHRV9VU0VSOw0KPiArfQ0KPiArDQo+
ICAgI2RlZmluZSBwbWRfbm9uZShwbWQpCQkoIXBtZF92YWwocG1kKSkNCj4gICAjZGVmaW5lCXBt
ZF9iYWQocG1kKQkJKCFpc19rZXJuZWxfYWRkcihwbWRfdmFsKHBtZCkpIFwNCj4gICAJCQkJIHx8
IChwbWRfdmFsKHBtZCkgJiBQTURfQkFEX0JJVFMpKQ0KPiBAQCAtMTU4LDYgKzE2MywxMSBAQCBz
dGF0aWMgaW5saW5lIHB0ZV90IHB1ZF9wdGUocHVkX3QgcHVkKQ0KPiAgIAlyZXR1cm4gX19wdGUo
cHVkX3ZhbChwdWQpKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX3Vz
ZXIocHVkX3QgcHVkKQ0KPiArew0KPiArCXJldHVybiAocHVkX3ZhbChwdWQpICYgX1BBR0VfVVNF
UikgPT0gX1BBR0VfVVNFUjsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbmxpbmUgcHVkX3QgcHRl
X3B1ZChwdGVfdCBwdGUpDQo+ICAgew0KPiAgIAlyZXR1cm4gX19wdWQocHRlX3ZhbChwdGUpKTsN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+IGluZGV4IDM2OTU2ZmI0NDBlMS4uM2Ni
NWRlOWYxYWE0IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gQEAgLTE3
Miw2ICsxNzIsMjEgQEAgc3RhdGljIGlubGluZSBpbnQgcHVkX3BmbihwdWRfdCBwdWQpDQo+ICAg
fQ0KPiAgICNlbmRpZg0KPiAgIA0KPiArc3RhdGljIGlubGluZSBib29sIHB0ZV91c2VyX2FjY2Vz
c2libGVfcGFnZShwdGVfdCBwdGUpDQo+ICt7DQo+ICsJcmV0dXJuIHB0ZV9wcmVzZW50KHB0ZSkg
JiYgcHRlX3VzZXIocHRlKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlubGluZSBib29sIHBtZF91
c2VyX2FjY2Vzc2libGVfcGFnZShwbWRfdCBwbWQpDQo+ICt7DQo+ICsJcmV0dXJuIHBtZF9pc19s
ZWFmKHBtZCkgJiYgcG1kX3ByZXNlbnQocG1kKSAmJiBwbWRfdXNlcihwbWQpOw0KPiArfQ0KPiAr
DQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB1ZF90IHB1
ZCkNCj4gK3sNCj4gKwlyZXR1cm4gcHVkX2lzX2xlYWYocHVkKSAmJiBwdWRfcHJlc2VudChwdWQp
ICYmIHB1ZF91c2VyKHB1ZCk7DQo+ICt9DQo+ICsNCj4gICAjZW5kaWYgLyogX19BU1NFTUJMWV9f
ICovDQo+ICAgDQo+ICAgI2VuZGlmIC8qIF9BU01fUE9XRVJQQ19QR1RBQkxFX0ggKi8=
