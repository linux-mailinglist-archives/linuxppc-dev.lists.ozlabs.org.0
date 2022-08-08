Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FBE58C4FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 10:40:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1V5m5wpKz3brF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 18:40:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=sllxSSve;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.54; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=sllxSSve;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120054.outbound.protection.outlook.com [40.107.12.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1V4z4Jdjz2xrR
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 18:40:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRc4o98dVh3IOIiSWxoZ753Ein3ZS83A+4EjD2rxsfr4Zngn4jkpay5D29fFb5iZLfsxAeTIP2fWOsEcjSFnNk0YFcZ17hIrypRwMpwORzEdMLMjC7Q81cXf7uzhKPeOdCeEoZiks7TYDaPEUhir4V3lpCoMGQ9NenJ51CzCgVUIviMkARWpCB9cejLxO/r/bthMHV9T5jGVhfExQzUsXj8G00F5QkJele57mqAX2Ie6kY4sn/YFgUaqOL1AI7zyzKonhg51XQJdd5rlZ8lPJkNXsgvSTS2YazHPcC4B8w4pTEInOSQSJZWaxlZYklML/0htShucILF3179KpLGs4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMz/2YQZfdl7mLeKh6T8+hCVZhsPmAPUuG+P1N5vcI4=;
 b=J9PsZ8aTYJ+UOnZRsw5KBcKgqQf5A1Se3H0NYzzohrpxKUS/y96/B5hlPI70fgLkC9DmOxETcWovHBPEliYqXfrdNJJF6S/i8ipBmli0Izq2D8EKc4mQ2LBDcIYh2jizeJbbkTkBt78xaDYrJRAzaNxtm49dhXzp1NFvyF4fFbFiHe2BYVu8N8fLLVNquVasroCulOiRO6RnRltVW9OqqxVw7DCIzkGcS2wHnPT5QqzboZgcseaOS83lpdpudN47PANZroyIGtYVxb1uoNnp33I9FgBSocyxct04jIRbaJj+aJnRRVQ3GOd0GPFBPkCSDJy4doQMF+OjQPEFkgAeyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMz/2YQZfdl7mLeKh6T8+hCVZhsPmAPUuG+P1N5vcI4=;
 b=sllxSSveeivRzDU0OyVDn7p2WPm6kC6ArAx9BYSdlbSC+vWUk3xUWfGDa3fM/pI5s4Ap2iGTTdoTmqXSAM0WBCFojwfu8bKRidrrzKOfwlYL1SvP0n5Cgjo4kFTxci9sqc0xlfuZBkjizAcI5UeqdkA3pjBD+rYBXRU9hqkZOhTO8vwoF8Y7GJJan41hk8ipmON51HMn0K/cbyQg+pdkuwwChBhqm/XD+AXErJntS3hCHJhxTZOSddueUyJdEZeWuOOkCGcd9KzBwGwghFVMJOhfUmGJiGGyctlg2W/acSrirFfUOQ9ViDLGm2omXJCQMpk8F77UujdLS8H2MNLkbg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2467.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:34::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 08:39:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 08:39:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 10/14] powerpc: Provide syscall wrapper
Thread-Topic: [PATCH v2 10/14] powerpc: Provide syscall wrapper
Thread-Index: AQHYn/APyXaDVXTURECDqBicRepAk62kxOuA
Date: Mon, 8 Aug 2022 08:39:39 +0000
Message-ID: <fcf6cf1f-8d3a-47ee-3052-bf8e44fb53eb@csgroup.eu>
References: <20220725063024.120674-1-rmclure@linux.ibm.com>
In-Reply-To: <20220725063024.120674-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53fffba9-4a74-40e7-a6e9-08da79198856
x-ms-traffictypediagnostic: MR1P264MB2467:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  DkJoiGAFeWouto3qj1qn1UPVgnzkK40LiN/ZnF400xq9tCm1qOxlqfWYEPR5HBmrl9aDnx98QRbhbjiQ27apLWZ/i6Oo6rhRck31g9VY2HTWquz0ujSeFOjopObSsGFNJrYXOaMAgfDjXDG2ZFrUWBKKDV8ZbvYP42mCEOmfo/0RODtJxliivPVAdU/FkmSLLGeROXuZmNdrxuSQNh/31tKjZddRvuAqQaWXEJ+qYeem4k6729bpN6P+qD3+7tA1Jxmc23RYRe9OFDL1J3n7TgLfy35k76M129QGlAJlTpTQdm+GziawM1S1MpzcY2sfkY9MBzd4izrTaNYm+rY+/a3KhB5FPUVEegtRLDiKfMhNyhjyMp+nJpRPw/rDeZjSZt3xZDgvGjfzgMp0l5hQZkUFuCvtwP2tir7WTIJat8htP7DXcOxB5gntxiZf3j69iKkFGPjpu+stwmiwlEqmeLmCufiZBLmLtX1cVt0SMR7KLLxjK76FqEQpxPiC52yabeVB6bA8H1lV9eomA3JLYSc2aY/4bX1AMrYjfyi4dACtrSNYYv+9cre0OvDJNChWQWdYjw+reI1nSH74syfSiKnnqfYCf+6dZ/CvdWdAy80uq5Mi3/Jy2b2obKLJOqlY2ko9HaQsEN17PtUH5hISFm+5FYIOZcng1xE6nCctNiqJkYBlcHqzrVlde6FAUzJhjVg5UxsIiWROHBK8MmfN9qfPda3ZSNgAsQX1O6+cGGpzBe21M62vpxlMnkEl/9Riuo1y1l16uzAznw9eAUJZ6Wb94NZ8EckjeoM7EMuhQPeqIK+2FG2osxJurgj4ZOuYKqOpis4SjzKzxvBl26lBhm4oqaH3SJcu1tvO9mH+J9VWDJ6UuF8v0+CTH4DQsaxv
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(39850400004)(376002)(136003)(66574015)(41300700001)(6506007)(2906002)(2616005)(26005)(6512007)(31696002)(38100700002)(86362001)(38070700005)(83380400001)(8936002)(122000001)(5660300002)(186003)(64756008)(66446008)(66476007)(66556008)(8676002)(6486002)(66946007)(4326008)(31686004)(54906003)(76116006)(71200400001)(36756003)(91956017)(110136005)(478600001)(44832011)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UTVKaGpRNnlSTjZScVZwYUFxbk14OWp1d1ppYVZUaTNJa2owZXdkMStSWmQy?=
 =?utf-8?B?T1Y4d2R6S0dCTzE2RUxER0pBcmxBWGhmbFB2bEJIaFZOWHhtcTRadE9ud3VB?=
 =?utf-8?B?N0x0c1kyajdvOEdyclFHbzE4bEpDT0ZrcktmWXpPeGxYU0VVd3N5dUdsZjdo?=
 =?utf-8?B?YzdaUkR2dnZXeGg5OWROZ0lOekQ1M1NHMmNJZ050SVJDcGZoSTlxUjNkQllz?=
 =?utf-8?B?MEFIU2plOUIzQnlWOFkrbmY5V1d3a0JTbXg1VXA5RStnTEQwMUdiWTZtb1kz?=
 =?utf-8?B?K1FhTFR5UlNLZVJsVllCWlRzb2JrZWNnQkFwUzArckZkSTlKMm1ublJuWmda?=
 =?utf-8?B?Zk9hRmtMeGlEY3BDWXZIdHlCamxwQWNGMWxFRS9EbExRekQ5UFpheFZBWVg0?=
 =?utf-8?B?Q1Y2V1QyVi9WazE5SGtNeDg2eUovV2Z6SStRb0xKejZpMnpJVkR4aGk5QjJr?=
 =?utf-8?B?b09pVlE2NC9JYU5hdFUxbS9ZOEkxallpZVp5Q3BHdDFFcXVzc1FMRHNvSSt5?=
 =?utf-8?B?T0tDM1liWFV3TFI3M3c1d3R2SjFPV3cyZ1lnSHBUcDVhaHh2clU0d3ZSL3BI?=
 =?utf-8?B?RmN3cHg2a28ralErNE44Z3JhWXFGWjB5QnJtdkpqbjZrN3N5ODBxN01Ma09l?=
 =?utf-8?B?SDAzSUNFVFhUNVpIOGVidHh1d1hrRTNLdTgvbEFUaU9oWmRQQndhYW44ZDJk?=
 =?utf-8?B?aFIwd3VJQzBBQ05uanppMG9LYi9NS3lWd2ZUK1Q5MlhOcmZIMWRnd1hCVlZw?=
 =?utf-8?B?TDh4aVplUUwwMEU2MDB4T0xrdWliakxmSXZVVmN6UkFDYURvQmdJRzlVU1ha?=
 =?utf-8?B?eFFqL0N0eWFxWFJiTEViOFRrZGxuRjhjQUpqWklVRnBtcUtLYmpiSGZmN1Jt?=
 =?utf-8?B?b2gxL3lVZHNONm1qVktMZHo3d1pWSEx0ZEZqZWNBaWpsVWx6MTREaUcveHJ2?=
 =?utf-8?B?OExJU2JWdUVQWllKMnFqTnRiSmc5OFN0YzFoTm9iNzB2TzM4T3NGVlJYeGlh?=
 =?utf-8?B?UUNrMzA0QndTa2lTK1VaNmhnMnczNXRubWhyZEErV3M5VkJjTkZSZkIya1hX?=
 =?utf-8?B?NThMaVJUZnF4Yld1Q2RNWHpvNk1qMStjblFYTTQ0UXk0TWtKTWozUXFSVHMr?=
 =?utf-8?B?RHQ2NTEyZ0w3TGJrVEMzS0sydXY4emZNOGZiRjdzaEdRVmFJVnh6OTVkR0Ji?=
 =?utf-8?B?ajZtc3pzZDFYWmtEM2pnd3pvaGlUd1hzOVd2NEkxaU5hTWpNVXgrQnZWTmJ5?=
 =?utf-8?B?amZMRnNzdXZCNHZvdjA1WnpsdUhNNXIvWWJVZjhPNmJQTEV2MmoyT3dIaWJB?=
 =?utf-8?B?UUFQWVByaEVyMUJ1L1ZETXkvZEZPL2s2czlYV25odTcrd0Fja1pPY2V0YTFK?=
 =?utf-8?B?dktvenJFRmVBN1RnV0w1YWdKNVYrNkZyWnhmMnlTRnc2TGJTaEhyWkRuWjh0?=
 =?utf-8?B?Y3RGdVlRY256V0I4N3ZZVzRqZEtCMHNvVHhKaGl0RDFXME5Da2NlSWdMaklH?=
 =?utf-8?B?eG5Md2JKQXd6aXU2ZjZ4akNpblZYZWdWSVdBZ3k3Q3oyRVhXNDhHRGFreits?=
 =?utf-8?B?ZysrZGZHYUh2OHVrTjhWcThNV0FDSWpDVUhHbjdZcmRiVGFzNlFFZVpkai96?=
 =?utf-8?B?c2U2OUNCamdxTEpSNkNBbjdzZXhLS3dxVFV1VnFVanZPRjB0NmFjNXo5NVVE?=
 =?utf-8?B?djkwYU1ob2hrV2NXWE5QanFFcHlodFZLNFBNaVpCYjN6V0hmdUJoY3A0eGM0?=
 =?utf-8?B?MUJHdGFaa3AxeGZyQ3dtTE1hQUVMY2FUaFNITVp3WXZBY2tuS3U3dENKb1N1?=
 =?utf-8?B?UFYybmJTaURIbStYcTh5TEJjRWVmTUxDeTZRNllZMHBSTFNwd1UzbklGdmhu?=
 =?utf-8?B?U1pzN2F3bTdYa2NWNVFXeVpIZ2xVbjNoZkMxR3dsbExSL1RZZ2U5MGRsT0R1?=
 =?utf-8?B?aDM0TStEbUhDc25BeC9xN2NlMXEyYnRxLzk0N3hCRVEyeUFLRDl3NnFlZE9w?=
 =?utf-8?B?SThkZG5IcXByeHZHNkgya011Z2lxWVdia3YyTGNmT2pCU1B5Mlp4ZFBsaUVG?=
 =?utf-8?B?dmRoZE9wenBLMjVFVEVtWWE2QjhvUC92YzhuNi9hWjVaWDYxQXJ4ZG4wUENw?=
 =?utf-8?B?dmFDWTNhRVFjUURqQk9SbGJRM1V3SzZ6U3EzeXI1Rml2b1R5WUdKZUZ3Zk94?=
 =?utf-8?Q?E9xLFRU6mqEEStCkqA1ENgE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81BF1D0C58CDAB458FDB95574FA3F3AD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fffba9-4a74-40e7-a6e9-08da79198856
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 08:39:39.4401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xZyFP0u6zWBcEJnpP9uLCfNJyzY/4nPLNrb2JEb3c5p1iRiBPiATz62QdhKYKEnulbb119b7EvJBFSq2t5ut9Cl07rmQMMOcwJe9XiqYHvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2467
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA3LzIwMjIgw6AgMDg6MzAsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBJ
bXBsZW1lbnQgc3lzY2FsbCB3cmFwcGVyIGFzIHBlciBzMzkwLCB4ODYsIGFybTY0LiBXaGVuIGVu
YWJsZWQNCj4gY2F1c2UgaGFuZGxlcnMgdG8gYWNjZXB0IHBhcmFtZXRlcnMgZnJvbSBhIHN0YWNr
IGZyYW1lIHJhdGhlciB0aGFuDQo+IGZyb20gdXNlciBzY3JhdGNoIHJlZ2lzdGVyIHN0YXRlLiBU
aGlzIGFsbG93cyBmb3IgdXNlciByZWdpc3RlcnMgdG8gYmUNCj4gc2FmZWx5IGNsZWFyZWQgaW4g
b3JkZXIgdG8gcmVkdWNlIGNhbGxlciBpbmZsdWVuY2Ugb24gc3BlY3VsYXRpb24NCj4gd2l0aGlu
IHN5c2NhbGwgcm91dGluZS4gVGhlIHdyYXBwZXIgaXMgYSBtYWNybyB0aGF0IGVtaXRzIHN5c2Nh
bGwNCj4gaGFuZGxlciBzeW1ib2xzIHRoYXQgY2FsbCBpbnRvIHRoZSB0YXJnZXQgaGFuZGxlciwg
b2J0YWluaW5nIGl0cw0KPiBwYXJhbWV0ZXJzIGZyb20gYSBzdHJ1Y3QgcHRfcmVncyBvbiB0aGUg
c3RhY2suDQo+IA0KPiBBcyByZWdpc3RlcnMgYXJlIGFscmVhZHkgc2F2ZWQgdG8gdGhlIHN0YWNr
IHByaW9yIHRvIGNhbGxpbmcNCj4gc3lzdGVtX2NhbGxfZXhjZXB0aW9uLCBpdCBhcHBlYXJzIHRo
YXQgdGhpcyBmdW5jdGlvbiBpcyBleGVjdXRlZCBtb3JlDQo+IGVmZmljaWVudGx5IHdpdGggdGhl
IG5ldyBzdGFjay1wb2ludGVyIGNvbnZlbnRpb24gdGhhbiB3aXRoIHBhcmFtZXRlcnMNCj4gcGFz
c2VkIGJ5IHJlZ2lzdGVycywgYXZvaWRpbmcgdGhlIGFsbG9jYXRpb24gb2YgYSBzdGFjayBmcmFt
ZSBmb3IgdGhpcw0KPiBtZXRob2QuIE9uIGEgMzItYml0IHN5c3RlbSwgd2Ugc2VlID4yMCUgcGVy
Zm9ybWFuY2UgaW5jcmVhc2VzIG9uIHRoZQ0KPiBudWxsX3N5c2NhbGwgbWljcm9iZW5jaG1hcmss
IGFuZCBvbiBhIFBvd2VyIDggdGhlIHBlcmZvcm1hbmNlIGdhaW5zDQo+IGFtb3J0aXNlIHRoZSBj
b3N0IG9mIGNsZWFyaW5nIGFuZCByZXN0b3JpbmcgcmVnaXN0ZXJzIHdoaWNoIGlzDQo+IGltcGxl
bWVudGVkIGF0IHRoZSBlbmQgb2YgdGhpcyBzZXJpZXMsIHNlZWluZyBmaW5hbCByZXN1bHQgb2Yg
fjUuNiUNCj4gcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgb24gbnVsbF9zeXNjYWxsLg0KPiANCj4g
U3lzY2FsbHMgYXJlIHdyYXBwZWQgaW4gdGhpcyBmYXNoaW9uIG9uIGFsbCBwbGF0Zm9ybXMgZXhj
ZXB0IGZvciB0aGUNCj4gQ2VsbCBwcm9jZXNzb3IgYXMgdGhpcyBjb21taXQgZG9lcyBub3QgcHJv
dmlkZSBTUFUgc3VwcG9ydC4gVGhpcyBjYW4gYmUNCj4gcXVpY2tseSBmaXhlZCBpbiBhIHN1Y2Nl
c3NpdmUgcGF0Y2gsIGJ1dCByZXF1aXJlcyBzcHVfc3lzX2NhbGxiYWNrIHRvDQo+IGFsbG9jYXRl
IGEgcHRfcmVncyBzdHJ1Y3R1cmUgdG8gc2F0aXNmeSB0aGUgd3JhcHBlZCBjYWxsaW5nIGNvbnZl
bnRpb24uDQo+IA0KPiBDby1kZXZlbG9wZWQtYnk6IEFuZHJldyBEb25uZWxsYW4gPGFqZEBsaW51
eC5pYm0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgRG9ubmVsbGFuIDxhamRAbGludXgu
aWJtLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxpbnV4Lmli
bS5jb20+DQo+IC0tLQ0KPiBWMSAtPiBWMjogR2VuZXJhdGUgcHJvdG90eXBlcyBmb3Igc3ltYm9s
cyBwcm9kdWNlZCBieSB0aGUgd3JhcHBlci4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9pbnRlcnJ1cHQuaCAgICAgICB8ICAzICstDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL3N5c2NhbGwuaCAgICAgICAgIHwgIDQgKw0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9zeXNjYWxsX3dyYXBwZXIuaCB8IDk0ICsrKysrKysrKysrKysrKysrKysrDQo+ICAgYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL3N5c2NhbGxzLmggICAgICAgIHwgMjUgKysrKystDQo+ICAgYXJj
aC9wb3dlcnBjL2tlcm5lbC9lbnRyeV8zMi5TICAgICAgICAgICAgIHwgIDYgKy0NCj4gICBhcmNo
L3Bvd2VycGMva2VybmVsL2ludGVycnVwdC5jICAgICAgICAgICAgfCAzMSArKystLS0tDQo+ICAg
YXJjaC9wb3dlcnBjL2tlcm5lbC9pbnRlcnJ1cHRfNjQuUyAgICAgICAgIHwgMzAgKysrLS0tLQ0K
PiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvc3lzdGJsLmMgICAgICAgICAgICAgICB8ICAyICsNCj4g
ICBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28uYyAgICAgICAgICAgICAgICAgfCAgMiArDQo+ICAg
MTAgZmlsZXMgY2hhbmdlZCwgMTU2IGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQ0KPiAN
Cg0KVGhpcyBwYXRjaCBkb2Vzbid0IGFwcGx5IG9uIHBvd2VycGMgdHJlZSwgY29uZmxpY3RzIHdp
dGggMTU0N2RiN2QxZjQ0IA0KKCJwb3dlcnBjOiBNb3ZlIHN5c3RlbV9jYWxsX2V4Y2VwdGlvbigp
IHRvIHN5c2NhbGwuYyIpDQoNCkNocmlzdG9waGU=
