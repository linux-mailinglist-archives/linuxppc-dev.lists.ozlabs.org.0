Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A385FACF2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 08:38:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmmMS3srgz3c4N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 17:38:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=T2brbbS9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.71; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=T2brbbS9;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90071.outbound.protection.outlook.com [40.107.9.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmmLS1l9Jz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 17:37:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxZGZRP0W5fSlP4SyP7TCUNK9SrYqRyRx/hmOwmCvVLZ/ryYbtGOhKrLoyRaO8632lVUBFgBbyhpWWLERSYGwTTtBS1REGEg8I34HVmJWWsslLArDcCFNFaIbAcnxV4FNLhqK7RzCCrSXlYug0BBt3I867NeoHsIq5eKfgKlBdtpKFUptQVXobc9Xjmaxbu/bEb3IMgM4t6s0P+rBGJWv2wBd+CulbViXxmsicJzUdUBilYz4VW28G9zXtOTPfhdAWTp4fpuZNgDv8m87SimFVLSv8UuGlyHR1hbw1fzWc/TsbvmhNxBNeij+6bqnWjuD9Qk0lk5IPcPY1B53bXtHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSeQMmHu1/4nTfZELWPuEar0/zIfM/UvICfQbnpgC5U=;
 b=muM7fklw5zEsJUpEzP7Oy8CHSdJLZSH24jV/n1OQVLpKOzyOBUNe9tgKlZfEtW6wpCfQK+7wslGFzeuWg+H5d4b/2K2+g8DtPyr3/mk7XpiHizo6N3/9plNvyM651KxQaMZlc6Ot6F8TxZpjkyhrj/elVYH4DQC97a+14qaIDA42/ZxBGVp3diWhBzd2Mv3k+LoBtD3llRC8F4FKuph35CWVxejLg0DaS0I+gQmYnPc7b3m0fflJqACw0kXubSHTmzU+sMaJS3Zt2YEph9iI1WoO+mbMxUqNBqslAUfGOEXAfO6uWiAr143H9mX+yJ6XYLZnL9aFY4Z55xlpZqmjiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSeQMmHu1/4nTfZELWPuEar0/zIfM/UvICfQbnpgC5U=;
 b=T2brbbS9iQdT/NIy7+blv1lS3APt1v6AEgP45ye62wQREBixAVpi1xJSIw90r95egVq3szvfxSRQ3GA2+YaL24nin0xg9vvZmtW2u6nZylOA5NgPJL/ndBVh4GmWQl/3/u27XyOpUxcRbzDdpWfmVF4BASHjc9hSVzagt9cBq8B8RcgwWvrwbdwnZD9uTLIYnY7JJ31W6DyNZERqdwR7Auv/vq2CCiMDmtmmWRf9N2TUcgWuOQCv0U9eyqHUsE8wfVz8+XXpmdzANsE+CPX4BWvhm0UVqQlr6kiOQ6gb2VB50PNr+d+7GUEufRBs2Iiu7T3GF1ZeUMwZcs5vYLUDYA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3265.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:29::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Tue, 11 Oct
 2022 06:37:30 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%7]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 06:37:30 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, "qiang.zhao@nxp.com"
	<qiang.zhao@nxp.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Subject: Re: [PATCH v2] soc: fsl: qe: Add check for ioremap
Thread-Topic: [PATCH v2] soc: fsl: qe: Add check for ioremap
Thread-Index: AQHY3Ts93JiyPBUEEUSsVNIbj0Piiq4IvWEA
Date: Tue, 11 Oct 2022 06:37:30 +0000
Message-ID: <7bcfb033-e03e-dc31-fcb7-442da3c10d7d@csgroup.eu>
References: <20221011063222.43572-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20221011063222.43572-1-jiasheng@iscas.ac.cn>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3265:EE_
x-ms-office365-filtering-correlation-id: d6e729ea-b0a0-45f2-ea84-08daab53121e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CgaiI50GWEDljNfuawHzufsZ0NIqtfqi8mzWE+oGyCPtgOoeDoiJ6GQN5OzU51/CWl6QUykSuKk9d+wKirtF7RZLyzzuG+WtCYGxOvA14WSXgCjQrMBgcuWKfLgpJaa42BOa7aXEORek1x0SG9rtkvClVCERcsZCITx+1V6tLCtEvU7rMkaDraAFMtje+IdJpcVeCo7xLPpXBdTnNEfyhB8hYkTufDwFWG4RSyn58YM3Qiss9HChD4SI1Ihv5Oy8ks6fcM2QY7X+7nwaRpbkg+TNLqs6Yl7h5Kmf59YB+ZSA4dgyJ2SOXoLxUqHZL6jAJnNFTWGVnF5smWT7ILYUmYQHssUgdCfh8B15RiQIQ/tzwmvNdS+x+BBnIVXxlJdZyLwLGGKVL1vRB63AzvJ4MSPZOzFXT/vrY6N9p4I+kwy0mSLAerVbJT1TNSNco7DKH/AnGAHtl43PdzRMl6L0wi5KRxTAeF82ZJ5tZbNQ4LOEGiTTWGFFWIagDZcZApkO2qyUw5hdJynFRx6mWSm4FHYS3fqOlI7vv5DfeLSHLOGuaZ+GqlOR6rppg1mXEiJw10uZ6Dk0tvT7Lp/4v8pqEnzYIKk1stOm60B93uRFQYVDA05ObZk9wUFd/qAznk7eghH921XElbK6EHqgdAo0Qe+xR0tiSEuC28K2IvQFy3Uw6g0++HlOjCICyKWYz46q25h/ndo1DS9xwATSKKxBMaObJ0gsFx0D9Qb4cWPTSl7X3VY3pE4PUOy2ZaK4XNOaYDvTwmQLfzhJw1gzsWEROR/V/DK0jSfUYZCMmhR7OTlwd7jsDuMth/QPGznYjTNnGnJ9/DqqYwIvhLFdRJ7yjg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199015)(31686004)(36756003)(86362001)(31696002)(38070700005)(71200400001)(6486002)(2906002)(478600001)(44832011)(5660300002)(38100700002)(8936002)(41300700001)(8676002)(64756008)(66446008)(66476007)(66556008)(76116006)(122000001)(66946007)(91956017)(4326008)(316002)(66574015)(83380400001)(54906003)(186003)(2616005)(26005)(6512007)(110136005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SFRPTEJRa1loQ2x6NnY1UmJvWStPZUZMd0h4c3FtcjgrRVVFZkxSRVJ0Mjlo?=
 =?utf-8?B?TzRUOHgvYXFZQm4xaUNnZktiRUxCV0o4YTdXV25WVXdzY3YyVTF1RjZtMWZW?=
 =?utf-8?B?ZnFHcDBDNVdEUWtReG1jVVRCNElrRnJISjdzTnYzd1V3RXlNbmZPZk5Nbjd6?=
 =?utf-8?B?ZUtLVE4vdTlmSlFIeEU5UTdvSm9KaEoyazlvcWN0MkNwbHFlVWlranorUW1C?=
 =?utf-8?B?VndNQmxzajN3cFpwb3FSZFQ5VmkzT2l0V3lYRExmSUpnQVY0OXFCOFdEZ1pw?=
 =?utf-8?B?aDdNS1NuM3V1U0M4S2pIVndGa0VFRmpYblgwSUNydVB4QTRKZFN0UDN1aVVk?=
 =?utf-8?B?WUc4ekIvSS94ZlBDeE15MlNLVTRBdTI3QjZoNHpLcDZOVGFQSk5QSDc1V1N2?=
 =?utf-8?B?S24rblU1Wnhza25JL0k1bk5OOXhVR3BGTUtBK29UOFpuVTFaNUJKYUlhTWh2?=
 =?utf-8?B?TFdDbjg1SnVDVGhaczFRQlU4a2FwamZHaWFzUEFOdzd1dEhpNlJCZ1NuR3Jj?=
 =?utf-8?B?ZlVhZDdPb3dwVGlwRXU2MlRRb2NFSWJNUEtyRVU2RHRzZzhIbFBzNTdjMTNu?=
 =?utf-8?B?QjZWME0wcnN2UERaYUhWaTdFaFNaclI2OGVMMGRhV2pSNytkTERpMHR1c01q?=
 =?utf-8?B?cGJBTTV3SmlnaGdYOHBMS0lpVVoyWjFTM0RkRW9ZL0xLbXFCd3oyT1o3R0dR?=
 =?utf-8?B?UGVnZ2dQT0xjM21UQUtYTnM1SC9XQ2U2cmJ5L3JTZDlzQTh0U2RaQnVuQTlC?=
 =?utf-8?B?UHNjdjNuVmR5R2E1UHFUVWJpZTRoZm83ajVETytldDFKaEY4Y25LMk12MDRW?=
 =?utf-8?B?dFh4M1RPSjFVaEI0emNpQ2FVK1BndkF3QVQxZmtxSHJCOThlVm5EOVFJeXd0?=
 =?utf-8?B?K2Z6bzViRU5IR2FvbHduOFZqbW9RTk95SGR4Zi9jRExWNDE2aGh5RzVNV01a?=
 =?utf-8?B?KzdpOGxuVFk5ZVpIYnF3dnVqWTZla1M1cW9Cb3Z3RUhSemxYcmRVR3ptUnh5?=
 =?utf-8?B?amp6ai8ra2JzeThieUkrZ1FjekdDV0cvU2d0bS9pMW96SlMrL1BWTUZEdE9I?=
 =?utf-8?B?YldqdzY4dWdabTNaNXFRcktIRHdDNlowMkJtc1R4UTRRU0ZXcDZsb2ZIT1oy?=
 =?utf-8?B?K1o0WFkrWkFGckp2bGxMMXZvWlZyS3d6U01nVC93dG5oU1d1a0Evd1hEb3BN?=
 =?utf-8?B?dTEzeFNOWG9iNkVhcXE5MlJGeEQwVlJWOGMyVjlBb1hwMnVvRHlZYldkMXVO?=
 =?utf-8?B?R2p2V2pOWklqekNzMU9tc3M3OVVRalZvQzBhV2p2OU5ETWFVWlRqNHhuZnB1?=
 =?utf-8?B?UUhBaXFIdEppRlNmSmRkbVRTV3k1Z2c2QTBjekJ2R2xxVVg4akxjc3prTmk2?=
 =?utf-8?B?YWMvTDJ6M25mMmtiREFKRzVNZ1lMSm1lcUFGQnA3TS9PeWxESDNMYkR0VG13?=
 =?utf-8?B?V1pZQ1M3Y0ZBMitzTk8xTC9PN2kxQXNVNWZQNE0yMWRxSXBDdGxPUTZtODdm?=
 =?utf-8?B?d2k0RStYQm1FZUVtMWU2dVBGQm5Zb3pPSWhuT2tKNUxpWVVXaWo2U1krSE50?=
 =?utf-8?B?OWw5SDNISWp1eDNhcVZLd0EzMWRjdTk0SDlXVlJnaUlqVnc4Wm43NnB5VkFq?=
 =?utf-8?B?R1JpeG5EeklmblJXa0FMVnNEK2VpL3E1bzBWUkNFaUEwNUNNeDhET2FacE5k?=
 =?utf-8?B?VC9rTGpTTUIrME5HaUtKd2pRcVk0aVVGUFlpRkZVZkt2SzNaTnNxRWRheXB5?=
 =?utf-8?B?cjFRblAvd210b0NneHUvUDBMWENiYlVNdEdmTnVsL2tmNlNhR2laSmhUZVlJ?=
 =?utf-8?B?U0V4aEI4NFBqY3hOeG13QVliNzdtZE5URjJGQWl1UWxrUkRPV2oyTkRTblND?=
 =?utf-8?B?Y3NnVG1oUlQ1SjNhU04reWZnYTZkekhSMTRGUlZtLzVWNEJDSStDdERjcmwr?=
 =?utf-8?B?QTc1VC9HT1ZIczVsL3V5RERFc0ZBREFGRS9ZenFNRWg0UzJFdm14ZzNkUzhK?=
 =?utf-8?B?bW1tTUkza3FLSU84SnNQS2VYOEd6S092N2ZKeHFKR1QyTEVId1NIY0dvOVJK?=
 =?utf-8?B?M2hQeHJEWjdvS1krTUgzMVFCQ1h4SUZzT280dDFKeklwdFNhQVQ2Z0drSytm?=
 =?utf-8?B?eTM0T2FBaUFwN1pubkFkL3RXY0hYTWJMYTBaTnZ0YjNEMnVZYVBwN1FhVU9w?=
 =?utf-8?Q?c9YuyTLQyFEY7bNVYK1Q3bY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AEE2BB9AF20D14DB8C8C381ED715DDC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e729ea-b0a0-45f2-ea84-08daab53121e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 06:37:30.0372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LQiK2yim1Yq0kkoTrV2jdO11M2p8id1G7hzwGMs7vnxUoGrzePL6M5Sg0zWWtyxqqHV5g3X66D50ORrDE5RhawRfgZfpOgfw4jPU4CTq6Ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3265
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzEwLzIwMjIgw6AgMDg6MzIsIEppYXNoZW5nIEppYW5nIGEgw6ljcml0wqA6DQo+
IEFzIGlvcmVtYXAgY2FuIHJldHVybiBOVUxMIHBvaW50ZXIsIGl0IHNob3VsZA0KPiBiZSBiZXR0
ZXIgdG8gY2hlY2sgdGhlIHJldHVybiB2YWx1ZSByZXR1cm4gZXJyb3INCj4gaWYgZmFpbHMuDQo+
IE1vcmVvdmVyLCB0aGUgcmV0dXJuIHZhbHVlIG9mIHFlX3Jlc2V0IHNob3VsZCBiZQ0KPiBjaGVj
a2VkIGJ5IGNhc2NhZGUuDQo+IA0KPiBGaXhlczogNjhmMDQ3ZTNkNjJlICgiZnNsL3FlOiBhZGQg
cnhfc3luYyBhbmQgdHhfc3luYyBmb3IgVERNIG1vZGUiKQ0KPiBTdWdnZXN0ZWQtYnk6IENocmlz
dG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4gU2lnbmVkLW9mZi1i
eTogSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5nQGlzY2FzLmFjLmNuPg0KDQpEaWQgeW91IHRyeSBh
IGJ1aWxkIHdpdGhvdXQgQ09ORklHX1FVSUNDX0VOR0lORSBzZWxlY3RlZCA/DQoNCkRvZXNuJ3Qg
aXQgZmFpbCBsb3VkbHkgPw0KDQpDaHJpc3RvcGhlDQoNCj4gLS0tDQo+IENoYW5nZWxvZzoNCj4g
DQo+IHYxIC0+IHYyOg0KPiANCj4gMS4gQ2hhbmdlIHRoZSBwb3NpdGlvbiBvZiB0aGUgY2hlY2sg
Zm9yIGlvcmVtYXAuDQo+IDIuIFNpbXBsaWZ5IHRoZSBjaGVjayBmb3IgcWVfcmVzZXQuDQo+IDMu
IFJlbW92ZSB0aGUgJ2V4dGVybicga2V5d29yZC4NCj4gLS0tDQo+ICAgZHJpdmVycy9zb2MvZnNs
L3FlL3FlLmMgfCAxMiArKysrKysrKy0tLS0NCj4gICBpbmNsdWRlL3NvYy9mc2wvcWUvcWUuaCB8
ICA0ICsrLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMgYi9kcml2
ZXJzL3NvYy9mc2wvcWUvcWUuYw0KPiBpbmRleCBiM2MyMjZlYjUyOTIuLjMzZjc2Y2M1ODcyZSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCj4gKysrIGIvZHJpdmVycy9z
b2MvZnNsL3FlL3FlLmMNCj4gQEAgLTgzLDExICs4MywxNCBAQCBzdGF0aWMgcGh5c19hZGRyX3Qg
Z2V0X3FlX2Jhc2Uodm9pZCkNCj4gICAJcmV0dXJuIHFlYmFzZTsNCj4gICB9DQo+ICAgDQo+IC12
b2lkIHFlX3Jlc2V0KHZvaWQpDQo+ICtpbnQgcWVfcmVzZXQodm9pZCkNCj4gICB7DQo+ICAgCWlm
IChxZV9pbW1yID09IE5VTEwpDQo+ICAgCQlxZV9pbW1yID0gaW9yZW1hcChnZXRfcWVfYmFzZSgp
LCBRRV9JTU1BUF9TSVpFKTsNCj4gICANCj4gKwlpZiAocWVfaW1tciA9PSBOVUxMKQ0KPiArCQly
ZXR1cm4gLUVOT01FTTsNCj4gKw0KPiAgIAlxZV9zbnVtc19pbml0KCk7DQo+ICAgDQo+ICAgCXFl
X2lzc3VlX2NtZChRRV9SRVNFVCwgUUVfQ1JfU1VCQkxPQ0tfSU5WQUxJRCwNCj4gQEAgLTk4LDYg
KzEwMSw4IEBAIHZvaWQgcWVfcmVzZXQodm9pZCkNCj4gICANCj4gICAJaWYgKHFlX3NkbWFfaW5p
dCgpKQ0KPiAgIAkJcGFuaWMoInNkbWEgaW5pdCBmYWlsZWQhIik7DQo+ICsNCj4gKwlyZXR1cm4g
MDsNCj4gICB9DQo+ICAgDQo+ICAgaW50IHFlX2lzc3VlX2NtZCh1MzIgY21kLCB1MzIgZGV2aWNl
LCB1OCBtY25fcHJvdG9jb2wsIHUzMiBjbWRfaW5wdXQpDQo+IEBAIC02NDQsOSArNjQ5LDggQEAg
c3RhdGljIGludCBfX2luaXQgcWVfaW5pdCh2b2lkKQ0KPiAgIAlucCA9IG9mX2ZpbmRfY29tcGF0
aWJsZV9ub2RlKE5VTEwsIE5VTEwsICJmc2wscWUiKTsNCj4gICAJaWYgKCFucCkNCj4gICAJCXJl
dHVybiAtRU5PREVWOw0KPiAtCXFlX3Jlc2V0KCk7DQo+ICAgCW9mX25vZGVfcHV0KG5wKTsNCj4g
LQlyZXR1cm4gMDsNCj4gKwlyZXR1cm4gcWVfcmVzZXQoKTsNCj4gICB9DQo+ICAgc3Vic3lzX2lu
aXRjYWxsKHFlX2luaXQpOw0KPiAgIA0KPiBAQCAtNjU0LDcgKzY1OCw3IEBAIHN1YnN5c19pbml0
Y2FsbChxZV9pbml0KTsNCj4gICBzdGF0aWMgaW50IHFlX3Jlc3VtZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpvZmRldikNCj4gICB7DQo+ICAgCWlmICghcWVfYWxpdmVfZHVyaW5nX3NsZWVwKCkp
DQo+IC0JCXFlX3Jlc2V0KCk7DQo+ICsJCXJldHVybiBxZV9yZXNldCgpOw0KPiAgIAlyZXR1cm4g
MDsNCj4gICB9DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NvYy9mc2wvcWUvcWUuaCBi
L2luY2x1ZGUvc29jL2ZzbC9xZS9xZS5oDQo+IGluZGV4IGIwMmU5ZmU2OTE0Ni4uZjY2NTNmNGI0
MWRmIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3NvYy9mc2wvcWUvcWUuaA0KPiArKysgYi9pbmNs
dWRlL3NvYy9mc2wvcWUvcWUuaA0KPiBAQCAtODQsOSArODQsOSBAQCBleHRlcm4gc3BpbmxvY2tf
dCBjbXhnY3JfbG9jazsNCj4gICANCj4gICAvKiBFeHBvcnQgUUUgY29tbW9uIG9wZXJhdGlvbnMg
Ki8NCj4gICAjaWZkZWYgQ09ORklHX1FVSUNDX0VOR0lORQ0KPiAtZXh0ZXJuIHZvaWQgcWVfcmVz
ZXQodm9pZCk7DQo+ICtpbnQgcWVfcmVzZXQodm9pZCk7DQo+ICAgI2Vsc2UNCj4gLXN0YXRpYyBp
bmxpbmUgdm9pZCBxZV9yZXNldCh2b2lkKSB7fQ0KPiArc3RhdGljIGlubGluZSBpbnQgcWVfcmVz
ZXQodm9pZCkge30NCj4gICAjZW5kaWYNCj4gICANCj4gICBpbnQgY3BtX211cmFtX2luaXQodm9p
ZCk7
