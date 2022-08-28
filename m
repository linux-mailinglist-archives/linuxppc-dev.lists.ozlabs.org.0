Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D165A3EF3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 19:44:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MG1DM4Pw0z3bqT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 03:44:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=mmAvnGUT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.81; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=mmAvnGUT;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90081.outbound.protection.outlook.com [40.107.9.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MG1Cc1Stvz30Lb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 03:44:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0rR959U1/ytdkXZvdBtK2G9h+3EZHde/Vz799bzkG+QSxfMVLa+z9/IUiEutxQwqZEbVfBgPvEIVNe0Yvz8G5DOTkto3Ut+LnQ76pjkn6FeKKew+BmoB98PolOdM0OnN4uW3woDIO0yWARoWUCcCdpk11LfC1VAHxAKJc5y4c5A8nJBP9pLWqSomYJx23/bma4NFXBocjzwx+6YYHednJJCK5PlQrPH1X+d/Z9KLNB444gcs7KZVcBprcU7NzL6/SnsqvCDyaSlRaSRLu6YldZxlDaJh+OsRghKKF8/41kyjkkteOryRc1savdJwN/8Szc9gUQ/Mu3b5wzWIzEVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUGio2PeApH07RrFVT+iU9aBuUb5N0mQh/LWrmgRa4M=;
 b=ZCazqP51Tv19MpK3UoSIYtCQRBX2RhMYRQrJ0oHi8fJqQrEkvvpvkOsR4rpLNVmb7obA1gIM6QaDFqC0NK1t054GPrc1wGQ8XE/Yqi/jVa5jl9qnpde1c109G0HmG7H9gVSe9aLJURHQAZBV3Dn09aqgwgoGdPLpDbAzdGiQXIZTGJ61IHQugwLIejykaZJ4GSKoZc+FDUZDyXSb3y53F8RJCRZM/zXG/Vc808vw4S0irA3JhGTLydWJx2OtYG1HayONLBAIIRUHG83yEGELjZxni5X6L02m1SiZO8Ri9Q5H1RhprDEF+nZ2bsgda8zf+p9h8+xkLFFxcrhgs25+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUGio2PeApH07RrFVT+iU9aBuUb5N0mQh/LWrmgRa4M=;
 b=mmAvnGUTpzyh7pK2CEoMgNcTCbkRNcAmhd9d6450Ph8JeHshSU6i3po8UesEtDqZj3hSVdaq1j7zD1/FsfHOFXr9sher1R5XYHYLas12iC63OQQBTPPSvBG7uv/jYehB4YkXeGxe3whEibg0eGUnvBfPjiH8uf6YU/FK/FbmmY+u0Iu452Ok+XbVN4QClj3XPdLLlkxA0HmLnhiptADfkyh7vy1EBTZtp4Kfw5S7ShfSr5nYIQDw4e5yffVBbjvARjJDAobJGEei3xuHR+PYkUzuk9n/V04tZSurfEpZKzw+DB0vBUUAZcSvPmmZndXnlincApi+KlMY9GC5gvAP6A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2881.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:36::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sun, 28 Aug
 2022 17:43:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Sun, 28 Aug 2022
 17:43:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Topic: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Index: AQHYusSLeJySvCAqP0OhPUxxriPKGa3Eku+AgAABwQCAAACcgIAAAKWA
Date: Sun, 28 Aug 2022 17:43:53 +0000
Message-ID: <d49c5905-ff68-00e9-ddaf-d60d5e5ebe65@csgroup.eu>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220828095659.4061-1-pali@kernel.org>
 <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
 <c8d657db-02da-7840-5b40-755e47277a2c@csgroup.eu>
 <20220828174135.rcql4uiunqbnn5gh@pali>
In-Reply-To: <20220828174135.rcql4uiunqbnn5gh@pali>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1592c7d-54fc-46be-3860-08da891ce020
x-ms-traffictypediagnostic: MR1P264MB2881:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dkessDhPZv8Iudx7cfaucNQUxBS+agcJwOTO54p5RKw60+0n5xPtFr8GVUSYky6mvErsFAPg1yZxqjqeX1hXl9SGv0r3BGk0DsPbeolfnMDQMLjHmoWQK0e50UnFkvQDZVC9ZCUHuBE902VoSZHvfoNniWkESV30l146ceg8BLxYisS/bw7hDJF5fCFLA2j+D+sID8X7sBlDpHy9Hht4S4RsCmrZudlmAQmSwrH07ZeG2G+KT6Oo7BQpokpMd6zQ+oFBxWk2r1ZRBfMVinZUarNpypApnRMo9cCQy/7oU8rk2mnbW86K8EW2ZgB2B60LjkH8wHjDfKmff9RjEhpEjl8f8qzfH2u2DUkQcCHj6NXJnJLVTt2KFqWWN87FqPxqplSLjjicwfOiSl7tQ5lVBxmiX1k8ubJ0nWTb7TA1FMlBiIsBFxlr3XFug2gJlepiqfPP+DvdO0h1CAg87LChZ+ADWiN4JTJQDAMyEOMweZajpOLSQG0RXA7Mmr0lG1Tbv/Z8tmdt480OTn57ly3Riw56xI/MF4UGwmGOL2x36l7YYd8mG09bkJ7OfCDOC5xpw81UPTokvDZeZWeBwjdNrm5qT8WVNsQMPA5JIGvTDorf958KRWxk/bTjsuIc7WRei/C3JqCPPy/QDtYSGK4Z/W/mfIIPQqCkh29rGBmhciADRxVujpGsWnQa4sSQ2LLLKHeYDQn9i7HtfIk3IYFvMacie9JFiz5FvyY4QOcamIhKIepNW31x2cv2OyjlAp64ue8qZuBr3flyR8D4x5adHdTOMvvvgnf4DxPZS3M1yxHAeJj29l/UKdnuEZMTx2BewcDyRrw0OXdrhfwHH+G5vQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39830400003)(136003)(376002)(396003)(366004)(122000001)(36756003)(316002)(38100700002)(83380400001)(31686004)(6916009)(71200400001)(54906003)(66476007)(66556008)(478600001)(6486002)(91956017)(66446008)(64756008)(4326008)(76116006)(8676002)(66946007)(38070700005)(41300700001)(5660300002)(8936002)(44832011)(6506007)(26005)(6512007)(66574015)(186003)(2906002)(31696002)(2616005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZG1NV3FwZlpTdmQrdVU5M0FoYTBTYld2a0FEVkJlWGZGa3Q5RjVXMWt6Y242?=
 =?utf-8?B?NzRlaE93T25nbktCbEdVSjdqelZNM0g4Y2VQQm1KOExoYlkvN0VqWE9xcVM2?=
 =?utf-8?B?MFE2WkNnRUpVMCtWR3c4dHI5cm9CV1d4UmNkcmhOM3NnaXJQc3JodDZpbkdZ?=
 =?utf-8?B?eWFEYkNTQmNiK2dNQzF6d3FhU0JqSlFKUWN6ZzhpUzhBZVZXWGM3STd0ZERD?=
 =?utf-8?B?cTcxMUtZRlFXMFhXT1BTKy9SbHZVR3lLaDhQdVlZODZQbDA0ZTR2RXA2akFo?=
 =?utf-8?B?aDZHcHVPRXp2Q3B2dE9uaWpPeWx3QUhKSGFZam1jUGxvMkZBSFExVmdtZkNQ?=
 =?utf-8?B?bTgwdnJ0MEFEME1DWHNqRlJmZFlyeU1MWWlwZGw1ck00WGxmZmlsd1N4bTdD?=
 =?utf-8?B?bEpuUTg4WUhzc3BkeWRsRmtidHhhMU43d0lVM0Z1c08yekc3MTI2elVoK2Vj?=
 =?utf-8?B?eVNUVHdlaFROOU50dDRNczZ4QzZFaHUvU2xyZ0R4T0JHRm50TjI4WEpaS1Vv?=
 =?utf-8?B?cG9hSVBBUk51SW9lT29vTERibzl4dzlpV2xtYmI4c2hSR3ROVnBPYldJNmpn?=
 =?utf-8?B?TzNMeW9POGs0SU9rY3IyM1FQekVkLzE4VHFNcEc0WUo3Rnh3R3E2TmJVK0M0?=
 =?utf-8?B?OTZlMnozZDBoTzUzTWZ3eVg0cXVDckJORkRNMjg1eDNOT2RJaWpDbnBuR0g5?=
 =?utf-8?B?bERVWTNXMW54eW04SklKSHVKUnF6Mk15UWozQlpXNUxmVWN0SVJNdEF1dzF5?=
 =?utf-8?B?QjZVNzJMSXovd1BqcUtSR2VUdmNHVlFwWlpCdU85SGt4aU5iZC85NU5WVDZn?=
 =?utf-8?B?QzdMMUtLWFBaNmM4b0VueFg3cHdtd1ErRDBZckxBZmk4QXNGdGIwL1hGVHph?=
 =?utf-8?B?TlRuS1M1WGtzSExyZ3pYNERlNFk4eHVLOGY5TkdSckRvT0xWejBJb2NUZ1pq?=
 =?utf-8?B?MGFJZkxZNTV6WVlnZ0tiQjNyNldjRDdQbTZNelZPV0tjRXlmcnlVbDRwbzdv?=
 =?utf-8?B?ZGwwbGN2Zkx1aGJseFhib3VobGorVC9yR2hUYWN4UFJQeVpwTnphQTNMcWRV?=
 =?utf-8?B?NXhidTYvMW1DSmpIdHMvVWk2ZGJySTVvYVJCQ2hpUXpweEhXa2gvcXhxNXRN?=
 =?utf-8?B?N1NLSHpFVllUUXVvbnVMb242OFo2T0owaHBUR0NvVHpaUk10ZGlIREQzbGhy?=
 =?utf-8?B?SW9TZU13YkVqSmZoTG1JQTFBbUhUKzB2bU9temJ3enBCT3RrYy81ekRBSjI0?=
 =?utf-8?B?UmtiekwraXNxWUdVWGxIblVSN3VFd09MOCtBUjA3c1JtWVVQK0FBOUttODk4?=
 =?utf-8?B?ekJUZTRZSDd6cUNiV0swWmcrbXlWUFM3T0dUZE9IVWVKNFZ2ZCtWb3BEbGtq?=
 =?utf-8?B?YUxGcksvaG1lVlZsWDBBQjQ0djg2cU5ra2hkTkZFeFIyeDlucjNiSENJN3d5?=
 =?utf-8?B?OU15RDJQR0htN010Z2c3dlorTXpJZEtSWDVTK3doQnh0d3Rvd0V3S2NDL3Bv?=
 =?utf-8?B?QXJsSzI2ZVkzeHNEUThwamdwWDQ5L2pzeUN1ZzlEQjYzZTg4djFXb043ZTEw?=
 =?utf-8?B?NExObkRiZFdrVjFpOGxoWHhoVG52eGZBeWZvZHc5akJybk1HbWk5THA4YUpp?=
 =?utf-8?B?UDVOR25HZDA3SWxTVHc4REVrZlYxVzBNYloxeTN1TExiN01sWEpDMGRKSUgx?=
 =?utf-8?B?d29iUVk3K1R6bjVhL0N5UVpZNS9GVzR5c3VlRlM2OUNqVW95REswV0dnczkx?=
 =?utf-8?B?b3NNa1FEb25yV2hQOWNMK01CQmQ4WThPT1FYV0cwOEFQM2lIRGU5MVRFTnVk?=
 =?utf-8?B?OTFjL0JNaU9VNUpZWTQvdmRNdE5JNVVpOVZNQUhMSjIxOXdjbWhRWFJSZzZi?=
 =?utf-8?B?anRCZjFiVk83ekpENGY2UXRoWkNoY1lHaUxoaVUvSGIrRlpLNjRybXZMZlVP?=
 =?utf-8?B?cVREN2k3WFl4NEJuOFlCTE1SNnRCS3ZiVEE4eDIxMUEzRStmTk5IdjA2ZWJD?=
 =?utf-8?B?OE5jSTlBRVVBWkZUYzdoMU1QUy9mdnpnWi9PWkxSSVRnR0hpaFlmVVlPTyt3?=
 =?utf-8?B?NDAwWDZ6b1FZZS9PQSticmVTNG1GZVk0N2RNWTVEUk9mWVJ5aWZTeWdmUmpq?=
 =?utf-8?B?RG9NaThOYURBT2NPTUFHd3hDVVVCNklGQ2tZV2VvTTBGc2JUZXpwUnNERTdj?=
 =?utf-8?Q?feC0dJSVELqi2vr9agUk8Rw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4210C924489DCC45B24E8DBF5CBD7ED9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a1592c7d-54fc-46be-3860-08da891ce020
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2022 17:43:53.8175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gq+5+ruXC9u5Y0Urp3XBTGC8zF2oMWVyJfOR38aNYofKYuA74yn7REOiFDdwSKOdZYDtjeVivIskmxAOYpbjRbzZBqf0dmew4M1oaU7wB9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2881
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzA4LzIwMjIgw6AgMTk6NDEsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IFN1bmRheSAyOCBBdWd1c3QgMjAyMiAxNzozOToyNSBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0K
Pj4gTGUgMjgvMDgvMjAyMiDDoCAxOTozMywgQ2hyaXN0b3BoZSBMZXJveSBhIMOpY3JpdMKgOg0K
Pj4+DQo+Pj4NCj4+PiBMZSAyOC8wOC8yMDIyIMOgIDExOjU2LCBQYWxpIFJvaMOhciBhIMOpY3Jp
dMKgOg0KPj4+PiBXaGVuIENPTkZJR19UQVJHRVRfQ1BVIGlzIHNwZWNpZmllZCB0aGVuIHBhc3Mg
aXRzIHZhbHVlIHRvIHRoZSBjb21waWxlcg0KPj4+PiAtbWNwdSBvcHRpb24uIFRoaXMgZml4ZXMg
Zm9sbG93aW5nIGJ1aWxkIGVycm9yIHdoZW4gYnVpbGRpbmcga2VybmVsIHdpdGgNCj4+Pj4gcG93
ZXJwYyBlNTAwIFNQRSBjYXBhYmxlIGNyb3NzIGNvbXBpbGVyczoNCj4+Pj4NCj4+Pj4gIMKgwqDC
oMKgIEJPT1RBU8KgIGFyY2gvcG93ZXJwYy9ib290L2NydDAubw0KPj4+PiAgwqDCoCBwb3dlcnBj
LWxpbnV4LWdudXNwZS1nY2M6IGVycm9yOiB1bnJlY29nbml6ZWQgYXJndW1lbnQgaW4gb3B0aW9u
DQo+Pj4+IOKAmC1tY3B1PXBvd2VycGPigJkNCj4+Pj4gIMKgwqAgcG93ZXJwYy1saW51eC1nbnVz
cGUtZ2NjOiBub3RlOiB2YWxpZCBhcmd1bWVudHMgdG8g4oCYLW1jcHU94oCZIGFyZToNCj4+Pj4g
ODU0MCA4NTQ4IG5hdGl2ZQ0KPj4+PiAgwqDCoCBtYWtlWzFdOiAqKiogW2FyY2gvcG93ZXJwYy9i
b290L01ha2VmaWxlOjIzMToNCj4+Pj4gYXJjaC9wb3dlcnBjL2Jvb3QvY3J0MC5vXSBFcnJvciAx
DQo+Pj4NCj4+PiBjb3JlbmV0NjRfc21wX2RlZmNvbmZpZyA6DQo+Pj4NCj4+PiAgIMKgIEJPT1RB
U8KgIGFyY2gvcG93ZXJwYy9ib290L2NydDAubw0KPj4+IHBvd2VycGM2NC1saW51eC1nY2M6IGVy
cm9yOiBtaXNzaW5nIGFyZ3VtZW50IHRvICctbWNwdT0nDQo+Pj4gbWFrZVsxXTogKioqIFthcmNo
L3Bvd2VycGMvYm9vdC9NYWtlZmlsZToyMzcgOiBhcmNoL3Bvd2VycGMvYm9vdC9jcnQwLm9dDQo+
Pj4gRXJyZXVyIDENCj4+PiBtYWtlOiAqKiogW2FyY2gvcG93ZXJwYy9NYWtlZmlsZToyNTMgOiB1
SW1hZ2VdIEVycmV1ciAyDQo+Pj4NCj4+Pg0KPj4NCj4+IFNlZW1zIGxpa2UgaW4gZmFjdCwgRTU1
MDBfQ1BVIGFuZCBFNjUwMF9DUFUgYXJlIG5vdCB0YWtlbiBpbnRvIGFjY291bnQNCj4+IGluIENP
TkZJR19UQVJHRVRfQ1BVLCBhbmQgZ2V0IHNwZWNpYWwgdHJlYXRtZW50IGRpcmVjdGx5IGluDQo+
PiBhcmNoL3Bvd2VycGMvTWFrZWZpbGUuDQo+Pg0KPj4gVGhpcyBnb2VzIHVubm90aWNlZCBiZWNh
dXNlIG9mIENGTEFHUy0kKENPTkZJR19UQVJHRVRfQ1BVX0JPT0wpICs9DQo+PiAkKGNhbGwgY2Mt
b3B0aW9uLC1tY3B1PSQoQ09ORklHX1RBUkdFVF9DUFUpKQ0KPj4NCj4+IEkgdGhpbmsgd2UgbmVl
ZCB0byBmaXggdGhhdCBwcmlvciB0byB5b3VyIHBhdGNoLg0KPiANCj4gSXQgbG9va3MgbGlrZSB0
aGF0IENPTkZJR19UQVJHRVRfQ1BVIGlzIGJyb2tlbi4NCj4gDQo+ICAgICQgbWFrZSBBUkNIPXBv
d2VycGMgY29yZW5ldDY0X3NtcF9kZWZjb25maWcgQ1JPU1NfQ09NUElMRT1wb3dlcnBjNjQtbGlu
dXgtZ251LQ0KPiAgICAuLi4NCj4gICAgIyBjb25maWd1cmF0aW9uIHdyaXR0ZW4gdG8gLmNvbmZp
Zw0KPiANCj4gICAgJCBncmVwIENPTkZJR19UQVJHRVRfQ1BVIC5jb25maWcNCj4gICAgQ09ORklH
X1RBUkdFVF9DUFVfQk9PTD15DQo+IA0KPiBDT05GSUdfVEFSR0VUX0NQVV9CT09MIGlzIHNldCBi
dXQgQ09ORklHX1RBUkdFVF9DUFUgbm90IQ0KDQpZZXMsIGJlY2F1c2UgdGhlcmUgaXMgbm8gZGVm
YXVsdCB2YWx1ZSBmb3IgRTU1MDBfQ1BVIGFuZCBFNjUwMF9DUFUuIFdlIA0KbmVlZCB0byBhZGQg
b25lIGZvciBlYWNoLg0KDQo+IA0KPj4+IENocmlzdG9waGUNCj4+Pg0KPj4+DQo+Pj4+DQo+Pj4+
IFNpbWlsYXIgY2hhbmdlIHdhcyBhbHJlYWR5IGludHJvZHVjZWQgZm9yIHRoZSBtYWluIHBvd2Vy
cGMgTWFrZWZpbGUgaW4NCj4+Pj4gY29tbWl0IDQ0NmNkYTFiMjFkOSAoInBvd2VycGMvMzI6IERv
bid0IGFsd2F5cyBwYXNzIC1tY3B1PXBvd2VycGMgdG8gdGhlDQo+Pj4+IGNvbXBpbGVyIikuDQo+
Pj4+DQo+Pj4+IEZpeGVzOiA0MGE3NTU4NGU1MjYgKCJwb3dlcnBjL2Jvb3Q6IEJ1aWxkIHdyYXBw
ZXIgZm9yIGFuIGFwcHJvcHJpYXRlDQo+Pj4+IENQVSIpDQo+Pj4+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnICMgNDQ2Y2RhMWIyMWQ5ICgicG93ZXJwYy8zMjogRG9uJ3QgYWx3YXlzDQo+Pj4+
IHBhc3MgLW1jcHU9cG93ZXJwYyB0byB0aGUgY29tcGlsZXIiKQ0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPg0KPj4+PiAtLS0NCj4+Pj4gIMKgIGFyY2gv
cG93ZXJwYy9ib290L01ha2VmaWxlIHwgMTQgKysrKysrKysrKy0tLS0NCj4+Pj4gIMKgIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4+Pg0KPj4+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUgYi9hcmNoL3Bvd2VycGMvYm9v
dC9NYWtlZmlsZQ0KPj4+PiBpbmRleCBhOWNkMmVhNGE4NjEuLjE5NTdhM2RlN2ExYyAxMDA2NDQN
Cj4+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUNCj4+Pj4gKysrIGIvYXJjaC9w
b3dlcnBjL2Jvb3QvTWFrZWZpbGUNCj4+Pj4gQEAgLTM4LDEzICszOCwxOSBAQCBCT09UQ0ZMQUdT
wqDCoMKgIDo9IC1XYWxsIC1XdW5kZWYgLVdzdHJpY3QtcHJvdG90eXBlcw0KPj4+PiAtV25vLXRy
aWdyYXBocyBcDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCAkKExJTlVYSU5DTFVERSkNCj4+
Pj4gIMKgIGlmZGVmIENPTkZJR19QUEM2NF9CT09UX1dSQVBQRVINCj4+Pj4gLWlmZGVmIENPTkZJ
R19DUFVfTElUVExFX0VORElBTg0KPj4+PiAtQk9PVENGTEFHU8KgwqDCoCArPSAtbTY0IC1tY3B1
PXBvd2VycGM2NGxlDQo+Pj4+ICtCT09UQ0ZMQUdTwqDCoMKgICs9IC1tNjQNCj4+Pj4gIMKgIGVs
c2UNCj4+Pj4gLUJPT1RDRkxBR1PCoMKgwqAgKz0gLW02NCAtbWNwdT1wb3dlcnBjNjQNCj4+Pj4g
K0JPT1RDRkxBR1PCoMKgwqAgKz0gLW0zMg0KPj4+PiAgwqAgZW5kaWYNCj4+Pj4gKw0KPj4+PiAr
aWZkZWYgQ09ORklHX1RBUkdFVF9DUFVfQk9PTA0KPj4+PiArQk9PVENGTEFHU8KgwqDCoCArPSAt
bWNwdT0kKENPTkZJR19UQVJHRVRfQ1BVKQ0KPj4+PiArZWxzZSBpZmRlZiBDT05GSUdfUFBDNjRf
Qk9PVF9XUkFQUEVSDQo+Pj4+ICtpZmRlZiBDT05GSUdfQ1BVX0xJVFRMRV9FTkRJQU4NCj4+Pj4g
K0JPT1RDRkxBR1PCoMKgwqAgKz0gLW1jcHU9cG93ZXJwYzY0bGUNCj4+Pj4gIMKgIGVsc2UNCj4+
Pj4gLUJPT1RDRkxBR1PCoMKgwqAgKz0gLW0zMiAtbWNwdT1wb3dlcnBjDQo+Pj4+ICtCT09UQ0ZM
QUdTwqDCoMKgICs9IC1tY3B1PXBvd2VycGM2NA0KPj4+PiArZW5kaWYNCj4+Pj4gIMKgIGVuZGlm
DQo+Pj4+ICDCoCBCT09UQ0ZMQUdTwqDCoMKgICs9IC1pc3lzdGVtICQoc2hlbGwgJChCT09UQ0Mp
IC1wcmludC1maWxlLW5hbWU9aW5jbHVkZSk=
