Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895E55B2656
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 20:57:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNpJT2h2rz3c3Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 04:56:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=qkhsMhmc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.52; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=qkhsMhmc;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90052.outbound.protection.outlook.com [40.107.9.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNpHh2w63z2yxF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 04:56:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBIq1J5sgP9FdGcxTVKgYnxsfb7CJ46AI/2C8NxVfUorSMtOLZvsph6HZx9JwH0IP8RhW4xh6QIaGbnqn348RJJbDpE3Nn+vVIYOdg6nUpTZCduvS/7eoMIoXCe9SiEa5czt7fEH8usSsPxNmUL+/D1Gon+RO3zxJmnLn3XaiBw8SBrrawIGTGCS0gXihBpk+BPZpTwboTczXk/TVJNLAwsJ9r/ZRTvsuCR0mHtDvcEhs9b1GWb+ukBMFI27whYm8+mlxlroLCh52JYDMT+LFWLAgMrQxCpdnepeOEs+8eDjlbAfRlmFf1t84Dy4KdjN/dcez7f+lmSgB9ZTySvvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwAYlFITmF0AzvEx4uxsXiVTLG4s1GEWBofg67TMU14=;
 b=Fan7ZduerCWd+dTOTj35g3UAFR7qFDHX0Fkbu06sXa1/6XvztnT1IZpg2ObeCJ7/YrVZuhRBc0vUL52Xj5rVrKX0y0Nl5MgIX6M0jpYScVs2iWhj1r6C4H/9LY0DFHF+mJe8B19L+XTX68yq7d5K7FaHfEH03Owm+1shkx2YE8fl3/xvKmxaA3IxF+ACYPPW0/6yxXhEeCP6ttWFK8N0PaC7h3axMfpbKhpc4IVmfxMD/yT8tg8YyI8b6AkE8isI6j1PZvYEcZrjlOBgK5J62yPYYns7xblFicXYvmiB+itSzGZY/ZVYWeNeiKBd68SXbSvlz7u1SOngZz6he41Xsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwAYlFITmF0AzvEx4uxsXiVTLG4s1GEWBofg67TMU14=;
 b=qkhsMhmcRzSWs5pksu6l1LFJbLkGqpgEbF+RojLKDuaFw8hn69w5+x4fxXxf6TVnZ1PjR8eeY7xjHm9khtYwv2HN5CFkL3SFvrKP+gcOURHv5Pi75cGNSMg5UkVLu1/Jb4o3ucYybdMBAzylT7NiPszJA7YzuzwXHFMAT3+itcGlJ9P915ODZIijiMJbVZG+upkMoyvpKmq40igPrjXR+tCutGlbkYgX6rqhfXy9hOmpr8CFbbaBF6MOXsVjvdmmwviZh1qR0aXGzzvNXbfpXSLbVRVl8GDw9SEIrtkFdC1gCl8yU49hYeuf9E00o4bxD6q7/BcROgtGjg9dxoWW2w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1662.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 18:55:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 18:55:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mm: Fix UBSAN warning reported on hugetlb
Thread-Topic: [PATCH] powerpc/mm: Fix UBSAN warning reported on hugetlb
Thread-Index: AQHYw1Qi0Yy8A+JN3USltCONScznhq3V4pSA
Date: Thu, 8 Sep 2022 18:55:53 +0000
Message-ID: <640e5283-ba37-2934-4a4a-f57042e23efd@csgroup.eu>
References: <20220908072440.258301-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20220908072440.258301-1-aneesh.kumar@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c75b4927-e179-4400-7626-08da91cbc194
x-ms-traffictypediagnostic: PR1P264MB1662:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  01PzL8e0nZ3CfWGiY7FxjZQKH6lA/3qE0Z+OhS2tUFvqjJkFlyY0kvDO/wGxlcbSXPTJXE11kY3P+caMI+xdeZ1af2zcmprUnIM6/Ow8rvJG2c+fvoUs1trJHfy2Jiq+t+6yLIr+qbocZ2cquP+3nV7zq7wPl7wpmq1itNBlQ37BCE+D1KO2T62A5LN1GT3fqTovb1qoSZlWZ4ln7KE1d154OzFn+6xDzw8rLtB2YQ8WBaE2EqNbdr0/vY2zGwYpVRvuaumAa9Y1pM0UZp7TllXwHopHvmdOtjDv6BIU1Ze+lSKoALCnnLV+muAMlcTqkd/i8dZy4y/ei/jzV3+REX6GyNzCPP4t65LuPZcgeI2iOiVpJqvVKxIyeSCGwKBW1ebYKAtqo6VZvjrrHxZfPQkY819XrtlKViGRQfObQhhgWX2W2HwouK5pBRLXbYA2m87TCfPulRpepJ5JnnounDrmnNpRIJ16DAIUIlOJJhnr5bxN5KPb4S6gkB/VqR+iOYjRxuWI0cAXoWnac9E+OwymWeNByjCH6Li/zHkgTMch76h43IFjXEH3/dTzly4O3WCmhrjQ08dXp8QUi8OJuatR8zX8aG5lYFa51sKQAPqGnWd/MVDYkuz4GjqWfJYrYxzTtiv2dxV89GECogW34dXZ/AJkO+EDLdQSNDv57hhhT0nRWBJf7R5jkaHr1T5yfb07CFVuLHS5aPiXcujXOwRS1DQqdVRcniEJ2DGsDeJrvqMnPPQOJpf6VgANYhZdnkM5OwMfVyEi6YPeL72RQPVyCS5jVP3EnxwBbAsN31Iw75nnA77GhCTCjlAH+gC+ZyOml+fkTPF52tCe5y2ZGQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(66574015)(122000001)(38070700005)(186003)(6486002)(66446008)(66476007)(36756003)(66946007)(31686004)(91956017)(71200400001)(76116006)(66556008)(110136005)(64756008)(316002)(478600001)(8676002)(83380400001)(54906003)(2906002)(6512007)(26005)(5660300002)(4326008)(41300700001)(8936002)(2616005)(86362001)(31696002)(38100700002)(6506007)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RW53RjF1OGVtbGR4aFMzcnFmV2lWMTJEV0k2ZXhOdWcrUUk5VFJGOFF1elox?=
 =?utf-8?B?RHFTd1pUREd0R3pxSkJ3cWVrNHFkcjVlU25QTjhyaCtCNmJiUzhnRUtXOFEy?=
 =?utf-8?B?eFJqY0hIZnI1YnZWRkIwdklJczNyKzlxT2hwMkJhVlErbytRUkxGOVVkWEdL?=
 =?utf-8?B?VytXUm80ckI4UjAwV241UWFaMEV6d0x3RlpVUFlEWlgzazlVZUhNTmZlOEdV?=
 =?utf-8?B?UzRpRWxTTmNERm16UmhIRVc3L1pGa2NZd0ozY2R2OVdVTDBJSm8vakVYTllG?=
 =?utf-8?B?L0tzZ0tPbWd3bDVvQ3g1ZFROT2NrRk8zMnBIcStRbnA1MTlSTkRkK2pFQVpo?=
 =?utf-8?B?aGVXd0ladWNROEE5Mit4RVZuby9QWStrTDNsOVNHVFVkdmNhT09tNU1lZ01L?=
 =?utf-8?B?Nytya3B4R250b1pDUFhxa3FpQnhvMlRQNzFETEZSQ0R6dXR6L0p3WVN6WkNj?=
 =?utf-8?B?ZWVFQ0JFVkNBWmR5RXl4SmVKaFpqTER3T3l4Z1dsdnpQUFIzSzR4OHlxZ091?=
 =?utf-8?B?V2xqTktSU0dOR0VpYU9PNnQyTEluT29LM1ZIVXBlelFwY3FKUlByUGdVd1V6?=
 =?utf-8?B?bmVaWTAwenExYXUrc0h4MXRXSGR1cDBkYlZvL2Y4QzRQQU9GY3E3cnFuVlF0?=
 =?utf-8?B?UjNxclNNa1U5U1VqNFlFNmdqZ3IzMjVPekl5RnEzakUwNUxhNnVLYXdBSkwv?=
 =?utf-8?B?L0Qzc3hBZDdkMjVOMnJQZFp3MHUrbVQwM05DSjRIdmtiM0xYRXZxVEJIcytT?=
 =?utf-8?B?TWRDVFd1U2UxRlZBTkJVdXNxM3JRY1V3WE8yN1pMV1drdXA0OGhadDBsd013?=
 =?utf-8?B?T1YyRHA5TXhjdDBnUTRvL240K3VSNjV6WEFlQU5uR09Jc3J6QzRTZkNsSHhm?=
 =?utf-8?B?b1Vnbmwza1NrOGFQak91SlZyUWQrank3cklRT2NScFFvVHF4V1VBbHNFeE1x?=
 =?utf-8?B?VDlhWXUvRGhSa3UxZm1SbVV0QmFiRTBkQW1RRkE0WEYzckZyRElyRDZzbE9F?=
 =?utf-8?B?RVc3ekR6N0tKZTQvWU10cnpNaE5BWUc1MHFmRmpNV0ltQnd5ODB4YjhxclA1?=
 =?utf-8?B?M1k2S3VJa0NlbnJkajBKTmNOUDZ4ODc3RFRJU1A4Q3R6aFBmVXh4N2ltbnRm?=
 =?utf-8?B?ejdLUHVmcmRDMkNaVXhyanNqaVdPOFhyNnBYMGt3ZGVkNXFzcEJBN25uckN6?=
 =?utf-8?B?UTB0bDZ3Z2x4SzdkdEIzT1dXR241MUdBTmZDbHhVRTYrYW1NdlZON0IvQ2hV?=
 =?utf-8?B?dS9ldlFoell4K0RIK3ZpbEIrVGpXUlFIeTJWY2w4REJsRmZWdGxsdDc1aG1M?=
 =?utf-8?B?eWEzZC9sa2dOVUJpeVFVTVlraGhHVjRzRXZvTExBb3NFbDhXWmhiSUMyTkNB?=
 =?utf-8?B?YklJc0RVdUtGeGd0NnhubTEwLzkxUXlJcnJkdVVlbXNQRHlEWkZRVU55WDFJ?=
 =?utf-8?B?TkRNWGgycFl6SndtbFE4UHJZTFhtZ1dKeWZNM0ZPNlJrdFVQUnpRTHZjSGU3?=
 =?utf-8?B?bWRERUpJc2ROdWlacFFWZVJ2SldkQWpScVlwYmZpVmhEZFl2TFpSallyV0J2?=
 =?utf-8?B?UWRWT1Y5K3Ywc2ZCdWF6SzFXOFp2TE5sN0dBZGN0VHQ3ZzY1am1QaC9Lci81?=
 =?utf-8?B?RGl1SVUwK0hFRWw0c0xETnFVTXEySTNZZ3FQOU8wT3RkZnVCS1lqZk1BRkdP?=
 =?utf-8?B?MjdUK2VRenhoQ2ZHQ2NRczlTMWJVTG53bWVVRFVwTHBQSjVOSzZ2REs0eFpl?=
 =?utf-8?B?U1ZPN2RSOGNLaDhPRkJscjJaWitRR0p3Q3FsNjltYll2eUNYUkt0T1hwOExI?=
 =?utf-8?B?a1lMUkZEQWRXVVNEVjhPR2NvT2diR25kZVZUbmdTVit1ckxBd2wvTGpiVUlR?=
 =?utf-8?B?UEU5TEhlWHRYakcyWXh2aWRMaEUycGtKNEpRcGZWT3dTOU1GNU1Za3NpK0tK?=
 =?utf-8?B?MGUzYzQ0aENpaUdrRTFlOUdRRGdJN1NhWHpNOXljK0tzN0hRWWIrbnBkT1p2?=
 =?utf-8?B?UlVpYm82UEVtNk9xeGJVU2YrRDFqQUdxQTkyS2pwVTgrSk9kZHM2RkJmU2wx?=
 =?utf-8?B?YW5pYWo5cFN2UkFTYzVsYVRGblRhUHpTcThxcDh4SkJGWmFWNko4dWJKcDZX?=
 =?utf-8?B?Ti9tYnhvQms2Q25QMnNlR29DMFRCam5BWWdNZjgyZ3NBODQrd2o5RkVkSTRW?=
 =?utf-8?Q?m+r5qNIUJugb6rqlYqVYq6A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A58C6C04CE65DA478B965545123860DB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c75b4927-e179-4400-7626-08da91cbc194
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 18:55:53.7323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N3g/Re6F4AI9JVFWPjTcLp7kS/YROOYyKuUSFkSx19/MRMPB4VqvJA/lTLbsbhFQRlvUlqs35B2Lc2tc3el+3AUb14j0QZlrrNACCX0k9uY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1662
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzA5LzIwMjIgw6AgMDk6MjQsIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gUG93ZXJwYyBhcmNoaXRlY3R1cmUgc3VwcG9ydHMgMTZHQiBodWdldGxiIHBhZ2VzIHdpdGgg
aGFzaCB0cmFuc2xhdGlvbi4gRm9yIDRLDQo+IHBhZ2Ugc2l6ZSwgdGhpcyBpcyBpbXBsZW1lbnRl
ZCBhcyBhIGh1Z2VwYWdlIGRpcmVjdG9yeSBlbnRyeSBhdCBQR0QgbGV2ZWwgYW5kDQo+IGZvciA2
NEsgaXQgaXMgaW1wbGVtZW50ZWQgYXMgYSBodWdlIHBhZ2UgcHRlIGF0IFBVRCBsZXZlbA0KPiAN
Cj4gV2l0aCAxNkdCIGh1Z2V0bGIgc2l6ZSwgb2Zmc2V0IHdpdGhpbiBhIHBhZ2UgaXMgZ3JlYXRl
ciB0aGFuIDMyIGJpdHMuIEhlbmNlDQo+IHN3aXRjaCB0byB1c2UgdW5zaWduZWQgbG9uZyB0eXBl
IHdoZW4gdXNpbmcgaHVnZXBkX3NoaWZ0Lg0KPiANCj4gSW5vcmRlciB0byBrZWVwIHRoaW5ncyBz
aW1wbGVyLCB3ZSBtYWtlIHN1cmUgd2UgYWx3YXlzIHVzZSB1bnNpZ25lZCBsb25nIHR5cGUNCj4g
d2hlbiB1c2luZyBodWdlcGRfc2hpZnQoKSBldmVuIHRob3VnaCBhbGwgdGhlIGh1Z2V0bGIgcGFn
ZSBzaXplIHdvbid0IHJlcXVpcmUNCj4gdGhhdC4NCj4gDQo+IFRoZSB3YWxrX2h1Z2VwZF9yYW5n
ZSBjaGFuZ2Ugd29uJ3QgaGF2ZSBhbnkgaW1wYWN0IGJlY2F1c2Ugd2UgZG9uJ3QgdXNlIHRoYXQg
Zm9yDQo+IHRoZSBodWdldGxiIHdhbGsuIFRoYXQgY29kZSBpcyBuZWVkZWQgdG8gc3VwcG9ydCBo
dWdlcGQgb24gaW5pdF9tbSB3aXRoIFBQQ184WFgNCj4gYW5kIDhNIHBhZ2UuIEV2ZW4gdGhvdWdo
IDhNIHBhZ2Ugc2l6ZSB3b24ndCByZXN1bHQgaW4gYW55IHJlYWwgaXNzdWUsIHdlIHVwZGF0ZQ0K
PiB0aGF0IHRvIGtlZXAgaXQgc2ltcGxlci4NCj4gDQo+IFRoZSBodWdldGxiX2ZyZWVfcCpkX3Jh
bmdlIGNoYW5nZXMgYXJlIGFsbCByZWxhdGVkIHRvIG5vaGFzaCB1c2FnZSB3aGVyZSB3ZSBjYW4N
Cj4gaGF2ZSBtdWx0aXBsZSBwZ2QgZW50cmllcyBwb2ludGluZyB0byB0aGUgc2FtZSBodWdlcGQg
ZW50cmllcy4gSGVuY2Ugb24gYm9vazNzNjQNCj4gd2hlcmUgd2UgY2FuIGhhdmUgPiA0R0IgaHVn
ZXRsYiBwYWdlIHNpemUgd2Ugd2lsbCBhbHdheXMgZmluZCBtb3JlIDwgbmV4dCBldmVuDQo+IGlm
IHdlIGNvbXB1dGUgdGhlIHZhbHVlIG9mIG1vcmUgY29ycmVjdGx5Lg0KPiANCj4gSGVuY2UgdGhl
cmUgaXMgbm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW4gdGhpcyBwYXRjaCBleGNlcHQgdGhhdCBpdCBm
aXhlcyB0aGUgYmVsb3cNCj4gd2FybmluZy4NCj4gDQo+ICAgVUJTQU46IHNoaWZ0LW91dC1vZi1i
b3VuZHMgaW4gYXJjaC9wb3dlcnBjL21tL2h1Z2V0bGJwYWdlLmM6NDk5OjIxDQo+ICAgc2hpZnQg
ZXhwb25lbnQgMzQgaXMgdG9vIGxhcmdlIGZvciAzMi1iaXQgdHlwZSAnaW50Jw0KPiAgIENQVTog
MzkgUElEOiAxNjczIENvbW06IGEub3V0IE5vdCB0YWludGVkIDYuMC4wLXJjMi0wMDMyNy1nZWU4
OGE1NmU4NTE3LWRpcnR5ICMxDQo+ICAgQ2FsbCBUcmFjZToNCj4gICBbYzAwMDAwMDAyY2NiMzcy
MF0gW2MwMDAwMDAwMDBjYjIxZTRdIGR1bXBfc3RhY2tfbHZsKzB4OTgvMHhlMCAodW5yZWxpYWJs
ZSkNCj4gICBbYzAwMDAwMDAyY2NiMzc2MF0gW2MwMDAwMDAwMDBjYWNmNjBdIHVic2FuX2VwaWxv
Z3VlKzB4MTgvMHg3MA0KPiAgIFtjMDAwMDAwMDJjY2IzN2MwXSBbYzAwMDAwMDAwMGNhYzQ0Y10g
X191YnNhbl9oYW5kbGVfc2hpZnRfb3V0X29mX2JvdW5kcysweDFiYy8weDM5MA0KPiAgIFtjMDAw
MDAwMDJjY2IzOGMwXSBbYzAwMDAwMDAwMDBkNmY3OF0gaHVnZXRsYl9mcmVlX3BnZF9yYW5nZSsw
eDVkOC8weDYwMA0KPiAgIFtjMDAwMDAwMDJjY2IzOWYwXSBbYzAwMDAwMDAwMDU1MGU5NF0gZnJl
ZV9wZ3RhYmxlcysweDExNC8weDI5MA0KPiAgIFtjMDAwMDAwMDJjY2IzYWMwXSBbYzAwMDAwMDAw
MDU2Y2JlMF0gZXhpdF9tbWFwKzB4MTUwLzB4NTUwDQo+ICAgW2MwMDAwMDAwMmNjYjNiZTBdIFtj
MDAwMDAwMDAwMTdiZjBjXSBtbXB1dCsweGNjLzB4MjEwDQo+ICAgW2MwMDAwMDAwMmNjYjNjMjBd
IFtjMDAwMDAwMDAwMThmMTgwXSBkb19leGl0KzB4NDIwLzB4ZGQwDQo+ICAgW2MwMDAwMDAwMmNj
YjNjZjBdIFtjMDAwMDAwMDAwMThmY2RjXSBkb19ncm91cF9leGl0KzB4NGMvMHhkMA0KPiAgIFtj
MDAwMDAwMDJjY2IzZDMwXSBbYzAwMDAwMDAwMDE4ZmQ4NF0gc3lzX2V4aXRfZ3JvdXArMHgyNC8w
eDMwDQo+ICAgW2MwMDAwMDAwMmNjYjNkNTBdIFtjMDAwMDAwMDAwMDNjZGUwXSBzeXN0ZW1fY2Fs
bF9leGNlcHRpb24rMHgyNTAvMHg2MDANCj4gICBbYzAwMDAwMDAyY2NiM2UxMF0gW2MwMDAwMDAw
MDAwMGMzYmNdIHN5c3RlbV9jYWxsX2NvbW1vbisweGVjLzB4MjUwDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBBbmVlc2ggS3VtYXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4NCj4gLS0t
DQo+ICAgYXJjaC9wb3dlcnBjL21tL2h1Z2V0bGJwYWdlLmMgfCA2ICsrKy0tLQ0KPiAgIG1tL3Bh
Z2V3YWxrLmMgICAgICAgICAgICAgICAgIHwgMiArLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21tL3BhZ2V3
YWxrLmMgYi9tbS9wYWdld2Fsay5jDQo+IGluZGV4IGZhN2EzZDIxYTc1MS4uZTIxMGI3Mzc2NThj
IDEwMDY0NA0KPiAtLS0gYS9tbS9wYWdld2Fsay5jDQo+ICsrKyBiL21tL3BhZ2V3YWxrLmMNCj4g
QEAgLTY1LDcgKzY1LDcgQEAgc3RhdGljIGludCB3YWxrX2h1Z2VwZF9yYW5nZShodWdlcGRfdCAq
cGhwZCwgdW5zaWduZWQgbG9uZyBhZGRyLA0KPiAgIAlpbnQgZXJyID0gMDsNCj4gICAJY29uc3Qg
c3RydWN0IG1tX3dhbGtfb3BzICpvcHMgPSB3YWxrLT5vcHM7DQo+ICAgCWludCBzaGlmdCA9IGh1
Z2VwZF9zaGlmdCgqcGhwZCk7DQo+IC0JaW50IHBhZ2Vfc2l6ZSA9IDEgPDwgc2hpZnQ7DQo+ICsJ
bG9uZyBwYWdlX3NpemUgPSAxVUwgPDwgc2hpZnQ7DQoNCjFVTCBtZWFucyBfdW5zaWduZWRfIGxv
bmcuIFNob3VsZCBwYWdlX3NpemUgYmUgdW5zaWduZWQgPw0KDQo+ICAgDQo+ICAgCWlmICghb3Bz
LT5wdGVfZW50cnkpDQo+ICAgCQlyZXR1cm4gMDs=
