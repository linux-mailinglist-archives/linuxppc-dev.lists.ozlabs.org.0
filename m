Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8827C61E1BB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 11:49:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4rhF35g7z3dv8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 21:49:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KpPXnjoz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.87; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=KpPXnjoz;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120087.outbound.protection.outlook.com [40.107.12.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4rgF0TW8z301Z
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Nov 2022 21:48:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3AkjSRuf7SkVMOz6bsdiMFdvuyFPLFNIlUtxFFAMBp9z2ZlGd1dQtr9//e0eenfqZ9gWhqz0Li1pciBPZKwt+KwqBvLna3aX7FBrVKJ41dqRwNgvBbTMPTX1eeZfqIXwiJnjTHerMsCAMV8D3Jw/Ox5X4Nfpoqm6LfAgiHyuSNGBAy4I4uAIsVWbC8pQxV8FTkfSAjqRQQ9MtDRf+SVaX2jFCWPSuq6uu3kdP+6l92XcsCwIfKHFgNcTzF+trfxMU1fc5UalpkV/okz2IkqsErk4mFfyU9GvEPEUxZt97W+cZ+C7SvTZbQ8NCEma07+cEDbpY4HxvK75T6ah1LNYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0xNZWFFyCmtrFlvMke8J2WCEDeZsluPq6NOndTsas4=;
 b=bo/Ahrwr9xud9MbQX/WsA4pFPGGWnsOgbQLLPbbECXCpOa+nOqyokKQ0IZOb7TdOzkRQJCeD+K8hWOFEnPWkaAWl7kBdLLFG67DHDeIjadeF2CqQqJ3A8tCz18SsykCIVIb52stiaSGgj3NQ0nPCNWf5psaFPQRxCgPBt4NlROBsFcGq8OjaLptuohiXyQMZIGr+Uf+mB16mB7jgCwOUAkMZrtES8T+kpdF0sQXNOrki0RA/apLdklGYOnYvoyvf8tuFPM8Sh0X1A9F8FKpnZsbALUKr72tTD0KJWZjHLSXzEDeDQ2DlDSFY3oaCBLo03j6stAaARq0cmu5aAsXOkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0xNZWFFyCmtrFlvMke8J2WCEDeZsluPq6NOndTsas4=;
 b=KpPXnjozM4bfJjkRls4AogTmM/JBpSSAR6Z4Q3lWHlH7SSWeAJMJ7vV8P+6LCq4XTTlOXcNkZvFL1hJJPWWxmm9nWwcCzxiQRyXcgAwvX4TKFHSQd6LDr0w6ua9j57l6t9UQi+E8DF88DFvF33vTVMdagxZNqzH/ffXLu6ROfhyzyZEBEKQNXt4XiDB8P+4w55brZrglH//Fz8N6XbWWR8zs5793pVPltb/CVRhtGcce3c9J2citLDWZSb7iXZl04dJz85CCBzyIZjzkCuvDG1fHwWD+boKZvTryLYAF2nlpxhq5sBpws+jYrXNpf6W74zzPRu+ldaOKjrkUq/12NQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2230.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:193::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Sun, 6 Nov
 2022 10:47:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%8]) with mapi id 15.20.5791.025; Sun, 6 Nov 2022
 10:47:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, "qiang.zhao@nxp.com"
	<qiang.zhao@nxp.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Subject: Re: [PATCH v3] soc: fsl: qe: Add check for ioremap
Thread-Topic: [PATCH v3] soc: fsl: qe: Add check for ioremap
Thread-Index: AQHY3T4L/2Iswwpqok+PEJki3pXcbq4x39cA
Date: Sun, 6 Nov 2022 10:47:44 +0000
Message-ID: <51573e02-cd54-d55f-b4ff-a4ad75aa6955@csgroup.eu>
References: <20221011065225.16602-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20221011065225.16602-1-jiasheng@iscas.ac.cn>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2230:EE_
x-ms-office365-filtering-correlation-id: baf68c6f-4c1c-42e8-1e12-08dabfe45670
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  sjYlzsOB+rHr8PVlmVpRMLHmFgg/nEvHIE3pmHVY4WDu1iaVq6f8h9azTiqjLumqPLX0/koOHWtwZZRqIUz6LJmI9z2RaRyItLvhwGPLdcCHeKGSif8waql44DlSt9nNPdnkXBt5610D+bXs9EtrKXv2ogj+aE3Frlvj4FSUU/QvE5Rvys01KaBcBKHEk5VfZpNQi1iecKGHwCd3QcoAoPc7Uxc38wyNPaJJiSLW4beqBrKyZAeDshwTtOErvLWaQRujnKdh53JQRbUysfvyzvevKKSpC5XKDZs/tVPKEl4nndnoQscuOCG/mLd5ZgQ2Dibwlo1FuEakRyOzavdX6+mPg8cNi7THOutv0LweiS4zzSisbgqEU9AmwNVYgJiJ1pZ9eFtnGgN3qYOJxPjxjqKDyIsKj6pTE0kiqYbmgDO4+fuBWkrOCG5CxVGt/LqYSdE9SmHKsqHdu894JSXyBKVQRf9nukDh+7e8NrCcCY3YM+SV2w6VPc6BghvPYayo2vzxeNlF8k9RSadZrzlcRVpD3kFBqDw6Zin3HLFe+R3qej6a1WwrHPTZe+FYjVhTPtlzV88LMhnw/TTNwZ3ZmFPXrjpSavv5WyndsLW1tElVCSF39XYxvv2QoAr6Pfc4U4Y507b8+4zYht1s9cZzE45zVwHYJeD4AXy238w8RaDvqQ52ST4Tz2p9yLE1rDbQFye1pSIz/7Xf6Vb0/LjIkQy6AfxaA5FMoEGsMog+uIBDztVXKAneC0tHyTxdC5xR+oFobrUZHnC8lWMiSPFwsXPrk2MuqpZYjqBcRGQh031pY/MUWNH/rNJHVzhctVhoDij6Nt7Yccx6ZyTI6MT5sA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(366004)(39840400004)(451199015)(76116006)(91956017)(41300700001)(4326008)(8676002)(66446008)(66556008)(66946007)(64756008)(66476007)(54906003)(110136005)(38070700005)(83380400001)(8936002)(44832011)(478600001)(6486002)(71200400001)(2906002)(316002)(5660300002)(36756003)(26005)(6512007)(2616005)(186003)(66574015)(31686004)(38100700002)(122000001)(86362001)(31696002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eGlkZnFQL0o5WlVzdXdIMFlDczBpRjlyMFowUENtdS9oOFphdGc0Z1JHcmlH?=
 =?utf-8?B?QWdtdVJSbWF1TDhlemFZaks4MFlvZTl4Z3FJMmRXbzhLbmlXZkg5Z0dqTTBI?=
 =?utf-8?B?WWVXbnBLN1ZsTXp6RWJnc3dISnhHVjY2OFNoYjBPbVlCMnZYZEVCUzFieXdV?=
 =?utf-8?B?SmdUS0lDdFB4dTAzOFpmSXZIemsxVUhzYlFpMlg1TXZpYnpTZFdLcS9uSDZR?=
 =?utf-8?B?YzJ5ZVZuMDAyQWpETm9mT3FGeUloQ05XRUdMNThUOXhPT2hwSFZQMnZFSGFo?=
 =?utf-8?B?SURhV1hBeGRrbTBFbXJBVGt3Nmp0QStEdjdRSS9rRittUlU1MitQcWN5T01S?=
 =?utf-8?B?cjdUOWRLSCtyS1owOUhSVXYzUGtMbGJTOXRuTmthZ25aSUZqeldrT3lvM1pm?=
 =?utf-8?B?Vk1rYkdqV2d0VVpDY2VxUzVGN3dNQ3VlZk8rQktzQUtpclk5M2RxQjBpVnh2?=
 =?utf-8?B?ekhVZTVuWmgrZVhvOHJzSHpjWXNsZHFKZGpkV0pTNEs0djh3UC9Ed3haSnd5?=
 =?utf-8?B?QTBRaUREYjFHU1JsQ1hXaHpxTDBGSWUrNUF2TFFzSzlYU0N6SmNBWGRkc0pu?=
 =?utf-8?B?NjR3NkhjQVEvaU5seUZPbC9HeFlzK3c0VjZHdnBleDAxdGRJTktLbmpyd3dU?=
 =?utf-8?B?em9qdVl0Ny9uYVNWL1R0SGR1Z21XbzNPRnRJbWx1NW5QYjFoQ28yVVpoR0Zm?=
 =?utf-8?B?NC9SZWd6Q0UyNklSSkRZbFBBcm81bzE4ODVJSTZDcWJEWDBDZVY1NndPU1cy?=
 =?utf-8?B?OVVBbGdrWjFVWElQWjBDd0JxRFdsRkEvTk53a0VrbW9EM3pub1VaUjVucFdG?=
 =?utf-8?B?SmVIbzVmNSt0UmVkMHlTcEdLbjhWS0pmdDdRVFBoMGFCWkx2OEZBUG5LVnN1?=
 =?utf-8?B?Wmw2N3BKMGJidDNUdGs2bXlTY1E3UUtlRWM4bTg3WkZSUkFWdWlHTFNsMHNB?=
 =?utf-8?B?dVVzZWY2NnBWWUtwdjYrWGcxR1ZZVC9hbUxPaXZrYy9iS1ZsMjhzbWVJZHcw?=
 =?utf-8?B?OXFldEpzWFZzc3NFcGd1bnhRWkp2SDFHK3dlNEp4aGp5cUFTejNGNFVQYVZ2?=
 =?utf-8?B?ZTFFbWZ6UnJFQXNxNzlXK3p3eWlIek5CWG1xYXQxN0RJMld5L0RKUEkxbGZu?=
 =?utf-8?B?YlNIQUFZKzdWUUdoWUJqdXk1UG5NaUNEeEEyWGxvbkZqRnVVMWppd05OWVRj?=
 =?utf-8?B?MU05d2VnSGRyZlAzM1VobmNNN3Q5b2NUeE45Sk5TR2l1VlEvdFFia3Z4QXZr?=
 =?utf-8?B?TmpqRWFCRDNnbEYxeEJMLy9mQTQ3bXFIelU3YnlkTHZCNmJPK2VrNzNyZldk?=
 =?utf-8?B?TXBTOEQwQjd1RG53REJHenRDcHQwNmxvTWZnV2RiL3dYRStUVVVmNDZzNThW?=
 =?utf-8?B?WktJT2dZMExVd2ZRYTFNZ251THhWbkEweHNYYU54aDlrZGQwOEF2YXQvYW9C?=
 =?utf-8?B?RGp4TjlpRk9HSUxuOWlBVUlBOVZNRnZ2d0ZTdEJhQmhBRmNZaEVZTkpzdTQz?=
 =?utf-8?B?TDBNK1NRMWlVQS9xTnlhRmRvaUlabDFnZlYzaFhHRVZRa2tma3k4WEVHdU1V?=
 =?utf-8?B?UG1LMForbHZFMkNqSVE4UHY5WXJGcTZVMlZQWE1Ud1grOEZTalhDY1had0JG?=
 =?utf-8?B?eFZlajkxRk5kNFk1V2dmYzZuSE1nWDB0VDhEU1VzK013dC9Jd0pNT1FtK1Nn?=
 =?utf-8?B?KzZFajVQTmtVZ1NOV0pJaTdXSXlRSDY2RXExTGZQdzFrZUZwSEs0anN1Vk5R?=
 =?utf-8?B?alBMcEpqeFA5L0N1bUd0UG1ZZnF0ZTd4M09iZFFtYzJsY0R2anF0c21ka1Bk?=
 =?utf-8?B?KzMyN2FtZTNkN05MeVdJVTJuS1hNUmR2UDdGMmQ0YmdwQ0VEd1p3YjFPL2l4?=
 =?utf-8?B?UzcvYWpTVjU4WkVSYnJKTFErNm9ra3Y2TFNET0Q5RGJvNDI5UnJ6aXN1VFUz?=
 =?utf-8?B?S2MvUTh3WUx6N2xUQ3hxK2NvVkhpQW9pOForblpkRTdSdmVYdnZUMnlyTmdJ?=
 =?utf-8?B?V3lKQVVIS1pFTzhQVjRtZk95MDVpSXdaMGFkQzF4OGtyZUVJN2RDTk42bzFF?=
 =?utf-8?B?YzFRYTdUVFRLMTNjYktLR2J6OVpablJYWGlCaUE1SDNmbDlpMmhRS0NEMWN6?=
 =?utf-8?B?d3B2SG93a1JIUU45bll3d0VnQjJlYytkQ3l6QnowNnp6T1JzTVU4cmRnc1NH?=
 =?utf-8?Q?AAg74AaIJDrCqkwrIvkyqUM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEABAF0762BCAA4FAF6A44AE522A9133@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: baf68c6f-4c1c-42e8-1e12-08dabfe45670
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2022 10:47:44.9671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y9jxObYXpDb3G7fk3oYfvfBUr6aj0dW1oNQXm+pa4W+scYjO6bWJ5gNzoFDPPkdTwVBnntAie0831WwJmIEFC+EcC6isIJSesx2vh1FAdX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2230
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

DQoNCkxlIDExLzEwLzIwMjIgw6AgMDg6NTIsIEppYXNoZW5nIEppYW5nIGEgw6ljcml0wqA6DQo+
IEFzIGlvcmVtYXAgY2FuIHJldHVybiBOVUxMIHBvaW50ZXIsIGl0IHNob3VsZA0KPiBiZSBiZXR0
ZXIgdG8gY2hlY2sgdGhlIHJldHVybiB2YWx1ZSByZXR1cm4gZXJyb3INCj4gaWYgZmFpbHMuDQo+
IE1vcmVvdmVyLCB0aGUgcmV0dXJuIHZhbHVlIG9mIHFlX3Jlc2V0IHNob3VsZCBiZQ0KPiBjaGVj
a2VkIGJ5IGNhc2NhZGUuDQo+IA0KPiBGaXhlczogNjhmMDQ3ZTNkNjJlICgiZnNsL3FlOiBhZGQg
cnhfc3luYyBhbmQgdHhfc3luYyBmb3IgVERNIG1vZGUiKQ0KPiBTdWdnZXN0ZWQtYnk6IENocmlz
dG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4gU2lnbmVkLW9mZi1i
eTogSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5nQGlzY2FzLmFjLmNuPg0KDQpSZXZpZXdlZC1ieTog
Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0K
PiBDaGFuZ2Vsb2c6DQo+IA0KPiB2MiAtPiB2MzoNCj4gDQo+IDEuIEFkZCByZXR1cm4gc3RhdGVt
ZW50IG9mIHFlX3Jlc2V0IHdoZW4gQ09ORklHX1FVSUNDX0VOR0lORSBpcyBub3Qgc2VsZWN0ZWQu
DQo+IA0KPiB2MSAtPiB2MjoNCj4gDQo+IDEuIENoYW5nZSB0aGUgcG9zaXRpb24gb2YgdGhlIGNo
ZWNrIGZvciBpb3JlbWFwLg0KPiAyLiBTaW1wbGlmeSB0aGUgY2hlY2sgZm9yIHFlX3Jlc2V0Lg0K
PiAzLiBSZW1vdmUgdGhlICdleHRlcm4nIGtleXdvcmQuDQo+IC0tLQ0KPiAgIGRyaXZlcnMvc29j
L2ZzbC9xZS9xZS5jIHwgMTIgKysrKysrKystLS0tDQo+ICAgaW5jbHVkZS9zb2MvZnNsL3FlL3Fl
LmggfCAgNyArKysrKy0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA2
IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xZS5j
IGIvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCj4gaW5kZXggYjNjMjI2ZWI1MjkyLi4zM2Y3NmNj
NTg3MmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xZS5jDQo+ICsrKyBiL2Ry
aXZlcnMvc29jL2ZzbC9xZS9xZS5jDQo+IEBAIC04MywxMSArODMsMTQgQEAgc3RhdGljIHBoeXNf
YWRkcl90IGdldF9xZV9iYXNlKHZvaWQpDQo+ICAgCXJldHVybiBxZWJhc2U7DQo+ICAgfQ0KPiAg
IA0KPiAtdm9pZCBxZV9yZXNldCh2b2lkKQ0KPiAraW50IHFlX3Jlc2V0KHZvaWQpDQo+ICAgew0K
PiAgIAlpZiAocWVfaW1tciA9PSBOVUxMKQ0KPiAgIAkJcWVfaW1tciA9IGlvcmVtYXAoZ2V0X3Fl
X2Jhc2UoKSwgUUVfSU1NQVBfU0laRSk7DQo+ICAgDQo+ICsJaWYgKHFlX2ltbXIgPT0gTlVMTCkN
Cj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ICsNCj4gICAJcWVfc251bXNfaW5pdCgpOw0KPiAgIA0K
PiAgIAlxZV9pc3N1ZV9jbWQoUUVfUkVTRVQsIFFFX0NSX1NVQkJMT0NLX0lOVkFMSUQsDQo+IEBA
IC05OCw2ICsxMDEsOCBAQCB2b2lkIHFlX3Jlc2V0KHZvaWQpDQo+ICAgDQo+ICAgCWlmIChxZV9z
ZG1hX2luaXQoKSkNCj4gICAJCXBhbmljKCJzZG1hIGluaXQgZmFpbGVkISIpOw0KPiArDQo+ICsJ
cmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiAgIGludCBxZV9pc3N1ZV9jbWQodTMyIGNtZCwgdTMy
IGRldmljZSwgdTggbWNuX3Byb3RvY29sLCB1MzIgY21kX2lucHV0KQ0KPiBAQCAtNjQ0LDkgKzY0
OSw4IEBAIHN0YXRpYyBpbnQgX19pbml0IHFlX2luaXQodm9pZCkNCj4gICAJbnAgPSBvZl9maW5k
X2NvbXBhdGlibGVfbm9kZShOVUxMLCBOVUxMLCAiZnNsLHFlIik7DQo+ICAgCWlmICghbnApDQo+
ICAgCQlyZXR1cm4gLUVOT0RFVjsNCj4gLQlxZV9yZXNldCgpOw0KPiAgIAlvZl9ub2RlX3B1dChu
cCk7DQo+IC0JcmV0dXJuIDA7DQo+ICsJcmV0dXJuIHFlX3Jlc2V0KCk7DQo+ICAgfQ0KPiAgIHN1
YnN5c19pbml0Y2FsbChxZV9pbml0KTsNCj4gICANCj4gQEAgLTY1NCw3ICs2NTgsNyBAQCBzdWJz
eXNfaW5pdGNhbGwocWVfaW5pdCk7DQo+ICAgc3RhdGljIGludCBxZV9yZXN1bWUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqb2ZkZXYpDQo+ICAgew0KPiAgIAlpZiAoIXFlX2FsaXZlX2R1cmluZ19z
bGVlcCgpKQ0KPiAtCQlxZV9yZXNldCgpOw0KPiArCQlyZXR1cm4gcWVfcmVzZXQoKTsNCj4gICAJ
cmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zb2MvZnNsL3Fl
L3FlLmggYi9pbmNsdWRlL3NvYy9mc2wvcWUvcWUuaA0KPiBpbmRleCBiMDJlOWZlNjkxNDYuLjA3
MTRiMGJhN2Y0OSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9zb2MvZnNsL3FlL3FlLmgNCj4gKysr
IGIvaW5jbHVkZS9zb2MvZnNsL3FlL3FlLmgNCj4gQEAgLTg0LDkgKzg0LDEyIEBAIGV4dGVybiBz
cGlubG9ja190IGNteGdjcl9sb2NrOw0KPiAgIA0KPiAgIC8qIEV4cG9ydCBRRSBjb21tb24gb3Bl
cmF0aW9ucyAqLw0KPiAgICNpZmRlZiBDT05GSUdfUVVJQ0NfRU5HSU5FDQo+IC1leHRlcm4gdm9p
ZCBxZV9yZXNldCh2b2lkKTsNCj4gK2ludCBxZV9yZXNldCh2b2lkKTsNCj4gICAjZWxzZQ0KPiAt
c3RhdGljIGlubGluZSB2b2lkIHFlX3Jlc2V0KHZvaWQpIHt9DQo+ICtzdGF0aWMgaW5saW5lIGlu
dCBxZV9yZXNldCh2b2lkKQ0KPiArew0KPiArCXJldHVybiAwOw0KPiArfQ0KPiAgICNlbmRpZg0K
PiAgIA0KPiAgIGludCBjcG1fbXVyYW1faW5pdCh2b2lkKTs=
