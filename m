Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A557B8A6AAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 14:19:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=C3iayb6l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJjlt2T1sz3dW3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 22:19:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=C3iayb6l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJjl929JLz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 22:19:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfBj/n5RXh1mNoAWn7Ebl8iH0GB4PTNSgp3XJiR8Clok+jHL08Epv3Hl07rjuFH6IroNLCCM/ltHxQI4S7A4K7fXgeCzjWBobXEcR6/DIwx7BgIRr0W1TOUkKaPWpri36pHTsfAKtDi4C00X4asXUHldiDlbpQuzp+QtAknbyU45nzZEmbUJSwvtFZ8r1hAaQ95jYN7a8z/GOk25Ko6EMfGrTisQwphOk1ohTmRM42eY4oBNIN5yrC7VNO9LOo96+1u33/LAhlNv2pocNF9z9FY7VwZs3GL7EXrEcEXF+p3hSkv0FNz0fVqKfsKEXkoAmpq35Lco0D0E0klbRF79sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kgtPOXB2qQt2znF/2RRaQn62w4opu9HQPZ+eNpVqWcY=;
 b=DikA7rfUcdYlnfCWEwq9YRZYRlwrceGB27KwcswnDLDyjvnTX/WFQkRvas9B/p2JD44oTOB/BGhOR13IL4o++TVBkAtj1ShZe4xrdmIHTNfHNT4Zx1MmImkbkZw6lpB499tKppxA8jUzIbBs4fiUNsD+Hwp0EP7QUq8PXmx+lMs0XBjtJAzX/ow3jA/CNrWwSOx8kdtTVFIMYQanm5GyWNLfrirG8Kfkhd25adpJTk7uDohfiwk/kqywc8TYiTnSCFCKdM1NYsbDFwwgcLnmr5jjSkwv6taJLBW3R9kMr3sEpBwIMroxVCpaV4I4kg4ueYgSu55RshzlbxOG/QFVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kgtPOXB2qQt2znF/2RRaQn62w4opu9HQPZ+eNpVqWcY=;
 b=C3iayb6ldD3YJ8Gb45Ww61XJPRfUybhczJNVJ98Z1wwbphFwwT2jBcmbtq+UIg9TQeab5rb4rVHfZwIdzlSJ3LDuQ+b/hC2sUhtEjyVsVMbhndgjxvQBRbmJQ1wUkUfz0RUrIFnnXnUqfloGuAkz/7vrmxmShVyuwvHtbaKSbGmQaF7/6cb0qN6kt625hA1sXavkZYEFW4mdvwXtHUWO3Sa2ndvG8gEpz7q9BDIeo9zyz13wT7i6GKFpDPWJS16o8wU4KiVlD7EfsCjCxY43RlkM9aB1mooiMK7lfuQcGqIIevUakzmknjCkhfVqnQMLqEzc2vQA2cQ5uybW0D1d8A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2617.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 12:18:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 12:18:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Markus Elfring <Markus.Elfring@web.de>, Michael Ellerman
	<mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>, Aneesh Kumar K.V
	<aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [0/2] powerpc/powernv/vas: Adjustments for two function
 implementations
Thread-Topic: [0/2] powerpc/powernv/vas: Adjustments for two function
 implementations
Thread-Index: AQHajwiUZ49WFhSb3kyGC8qA5pa//LFqv4eAgAAGBwCAAAuhgIAAATcA
Date: Tue, 16 Apr 2024 12:18:49 +0000
Message-ID: <3711cad3-a627-4a6e-8769-ce916c1919ee@csgroup.eu>
References: <7be66990-de9e-488b-ad6d-fafd1c7bb34c@web.de>
 <ee6022b8-3aeb-4e6e-99f5-2668dd344e0a@web.de> <87plupbm0c.fsf@mail.lhotse>
 <795ca003-4231-45c0-8bb6-178597950fa5@csgroup.eu>
 <33a38d7e-26da-46e0-90d4-7137f9ec0c90@web.de>
In-Reply-To: <33a38d7e-26da-46e0-90d4-7137f9ec0c90@web.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2617:EE_
x-ms-office365-filtering-correlation-id: b5dfc68f-f52c-4380-96ec-08dc5e0f5f1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  rA/uONqvfBvay2XDc+3oxBBVhn+Y1SVHzbA6D75KMPdOywyjtWqWv28JzxOTERwNm0t+/pzR2xl/JeH1hSd2OvP9UvN8g8I+iEqbiL/n6bUY9xF2Ce6FncVYl0Z855iSGa5s+arKGf0+J5Qb5CVKP95diPJl0YHfaYZUROCoJ6K78KpQm5dP7B4OV8xLLzeI8PbOmrS/5Y+jlgO+EiJhJPZJRTE7STd5Xp2iS9sSHejfu2FZ6rcZ59QYI9kgfqpAYddbrBnRfBHDxqhWLg4bnWAzKzEJMfp2kgBW4Kr5svyBa55SVwObqyBx1NmYRPQnX7Isj4j7SsavTk0MwIalwHx9M9lhQYsDdpDrT6nKrjm/41W4VsxA/iVQwxZ7wcZiZ4YUjhSd2CvArkkBmcnJKTyN5k0uFit84AhsyuZ9P77mG22SMAkBVcTnPE41MEqm/8QaGwM37sPZrsxr6JHvkcs5U6yiKp9oW1fRdWBU+6uGOmezeEh4a8KMjO2Knwl2DqvwDTx9cyA/RDMeX3Y0UR0EWq5BYwWHxfTo1+yNsBswpHFSkHzWk4634HoAwY3Tr8CGrbYuvkrxDCUIOk+tgKAuKIFi+ZjUxxhJWYBXWcJs7s7QC8jjFVl4HD48/n6hmRyF8yjz+9i+z8zQ+DQX63rDgpGGh9ecQ6IdPdAPcKqLWMhkknu8UcPpsQhaoCxOXOf3JdRkJXWtez1tuQ3Ng3kRAIE+V2hsq6aPpPUEuDY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aGRreXVQSXRha3h0OGt1MmlyWUxEa3BvZHFiSGF3dERmVkpoU1kwQ2h6djg3?=
 =?utf-8?B?bEkzR3VIRXRtelBqblQrU2IzWUxVN0F5M09wTkU1eHRTMDZUTDdzcnlyVU9H?=
 =?utf-8?B?Z2plbkpmc3IxSUFOZkxWdWlJMHlYT1pJdjhZY0EyUWF6ZDVyNFZGTEFIRWNH?=
 =?utf-8?B?YzVOdGkzSDREaHErc2lOR2RGQ0FLblNmVDN6d3BVNVFrSE5lT1BrMzhReGQ0?=
 =?utf-8?B?V3huSnUwVVpnR1pUUkZZMDA5bE4yb2tGelk0SFlueFpWNTZTaHFmV1grYU5v?=
 =?utf-8?B?U2dFUWNhc3hkOTVQNWk5N2hyOEh1ZUs3M0ZKeld6dUFjQThESkdGMTltLzUy?=
 =?utf-8?B?eS9BK1pzNDFIb1JxVmhaTDlzaHdaQWcrNGNOdnpIbVRWY3pRREl4MWRjVU9B?=
 =?utf-8?B?MDNoN3JaMnJTb1h5b0xjVHdldEFvdFBrZjAzY1pGbm5SKzYyMmdaWmxpcjdv?=
 =?utf-8?B?S0ZRVmlCUjhhZ3RSK0RicE5ZZG85VWhZWjFNN29HbUIzZzA5bHJjYTZDcUpC?=
 =?utf-8?B?ay9EYkRDZkEyWWxJZFMxWnY4N2NnMDd6ZmtvakhKRWRVbXNRbUVNUUo2SlQv?=
 =?utf-8?B?Q3pVMy80dlI4TkptYXlNbVVaR2pxKytvZGx0ZWFqTzFZbXoxakw0SzhwcnNk?=
 =?utf-8?B?bW1PVjdSZURNMWErenZ3d1VMd3AyY25GZzU5UnBzNjlGcXYyV0pWZm1qRExm?=
 =?utf-8?B?dWxYeVpNajJZdlJ3QXZBQUNlNTdkcXVlZnc3dmkyeHd3OS9uVEsyVUIyckNz?=
 =?utf-8?B?U2hmb2hpN2pIYXRqUDR5Tnk2TEl5VkVsV0orSEdpak1EV2hMNnVYTGROeHhK?=
 =?utf-8?B?VWd5VTVtNWg1dWJtNHcybm8xenFMNnMxeVBaZjVkVitIdUFCbS9oZzdyakNH?=
 =?utf-8?B?dlU2RVkvRVhYZzJRMHJrRmtBRWJ5QWZHNDJpRnVuMnR5ZG5hdFVVYzFhSUVF?=
 =?utf-8?B?SzBjSnBvL05xQmdTRkRiaFlaOHNJdVIwN1pTaVErclZKV3pyN2ZFTnpiMVhR?=
 =?utf-8?B?WU12TXBaaWNYY25LTEtjTUtOUHk3MFRDbUVwZndVZjhVcmxWZURWbUZEWUx0?=
 =?utf-8?B?NUIrM2RoT0JXYTZlYWtDa2lDQWhjZUZQQlF1aUI2eENTYUU4b2dNYWdnTHZY?=
 =?utf-8?B?dDQ1M1lpTkhkZkpLL2lDQ2lGUmhCOXorUmpPdDVIUnhzM3JhYTlpOHIxcE5k?=
 =?utf-8?B?UldsditzbGE1WmVETG45NDNkYkEyOWlLM2wzUE8vRUhGbWJzdVdLUUdieDhk?=
 =?utf-8?B?QzhuSG5rNzdpYlpHWlFKdkQvRUNUcHN1Vjhwa1o5UnVXRzMzVHBoZjlEblJS?=
 =?utf-8?B?VXhZbGo5UHhNemgrYytOTXFQbzgvLytCbHhpNEJjMmZ0VmVBYVI2SVJ0UmtW?=
 =?utf-8?B?L1psRHBSRG9wS0NiNTFBY3ZzRCtrUXBRc1dXRlhEL0ZERU03ZkMxR3dGdjNl?=
 =?utf-8?B?QmtwanlIZFRKRUE1RzFVWWhJY2g1Y3AxTVlZRzdwdno3dnpHTnJZcENldkRa?=
 =?utf-8?B?ZjlrQUI4SFg1VElIelYxbjc5MmxON3hzRDJxNlppTzlRTnROeUpFMm9IaGt3?=
 =?utf-8?B?dkE3d2dzSHZiNUxzUHlpVjJUT0M2S0VlTlZQUkZpbUZnMndxL0FBQW9wemtK?=
 =?utf-8?B?Sy9sS0haMVdkV0JnT0h3Q2srV0xvckp3eTFwZFpmeHhSSUJ6Sm4vcHoyNXZh?=
 =?utf-8?B?ZzFtVXhpRUtvZzdQdkN2ZHhlSUhQWXB1N0NoM2w5Vi9KVzhQM3Z6dmRtb29X?=
 =?utf-8?B?QkhPT3Z5U3ZMcm9sWkFVaDFUamdzTHcxTEtTTmo0MmdsRVU4ZDhNSTFhaDdJ?=
 =?utf-8?B?M04zN3JNeE5EaGlMS2dlTjIrUmR3ME10NVpEbThxNTFzUFRKN2pxNmxkbkUw?=
 =?utf-8?B?YlVEMHQ4YmF2ZFhPOGdxb2EranVTRmlyVWRBWko5d0I4S3VPUXp0YW5qQTJU?=
 =?utf-8?B?YytsN0dSZXFxcEZKSjFHK2VYanFLUEl5eVJ3S1AvTDBiclZGdDdnZWkvWVpC?=
 =?utf-8?B?bzMzSGhFZnBncmtBZi9wMC9wWVRzNE9sQjA4LzlJa2dvOWNIR2NRSWQ3ZGJi?=
 =?utf-8?B?NjJMSHRHa2RWM0xydjQyUkFRYmJNWVNDdjlGcmxSQjJKUXFGT1EyWVpsdnNV?=
 =?utf-8?Q?kVoDAELm0UR2SYL7thzri3+1u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9D8A3C3A369B184FB72E6A16983EEC71@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b5dfc68f-f52c-4380-96ec-08dc5e0f5f1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 12:18:49.2642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65CcY13glDu/wDP0h/HrIYlEjVbiL8K977h1JyT36KVne9J7nCp3kQZSM6B72xbWvnqgK62Dil9cWUx8P/ZqTAbpEslTcT3rlimw3ghc7P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2617
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
Cc: LKML <linux-kernel@vger.kernel.org>, "cocci@inria.fr" <cocci@inria.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzA0LzIwMjQgw6AgMTQ6MTQsIE1hcmt1cyBFbGZyaW5nIGEgw6ljcml0wqA6DQo+
PiBUaGlzIGlzIGV4cGxpY2l0IGluIEtlcm5lbCBkb2N1bWVudGF0aW9uOg0KPj4NCj4+IC8qKg0K
Pj4gICAgKiBrZnJlZSAtIGZyZWUgcHJldmlvdXNseSBhbGxvY2F0ZWQgbWVtb3J5DQo+PiAgICAq
IEBvYmplY3Q6IHBvaW50ZXIgcmV0dXJuZWQgYnkga21hbGxvYygpIG9yIGttZW1fY2FjaGVfYWxs
b2MoKQ0KPj4gICAgKg0KPj4gICAgKiBJZiBAb2JqZWN0IGlzIE5VTEwsIG5vIG9wZXJhdGlvbiBp
cyBwZXJmb3JtZWQuDQo+PiAgICAqLw0KPj4NCj4+IFRoYXQncyBleGFjdGx5IHRoZSBzYW1lIGJl
aGF2aW91ciBhcyBmcmVlKCkgaW4gbGliYy4NCj4+DQo+PiBTbyBDb2NjaW5lbGxlIHNob3VsZCBi
ZSBmaXhlZCBpZiBpdCByZXBvcnRzIGFuIGVycm9yIGZvciB0aGF0Lg0KPiANCj4gUmVkdW5kYW50
IGZ1bmN0aW9uIGNhbGxzIGNhbiBvY2Nhc2lvbmFsbHkgYmUgYXZvaWRlZCBhY2NvcmRpbmdseSwN
Cj4gY2FuJ3QgdGhleT8NCg0KU3VyZSB0aGV5IGNhbiwgYnV0IGlzIHRoYXQgd29ydGggaXQgaGVy
ZSA/DQoNCkNocmlzdG9waGUNCg==
