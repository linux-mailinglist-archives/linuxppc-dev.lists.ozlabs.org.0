Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EB06958C3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 07:03:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG9ch4tBPz3cGv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 17:03:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=m37vpVka;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe12::61b; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=m37vpVka;
	dkim-atps=neutral
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe12::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG9bj38W2z3bgk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 17:02:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dvhrzn5bjfyC47KPMy2saIHaoewsHfruxb58wOHgYcoByz0lJYxx6vEUSnBG90UB1zmgbec46lVcAncc9a3mdSIEL28Lel6ruI2RwbzMafAmlOhkbG25dTvGRhfX6+7WgOWEVOYW0X8jcxGjWP4Zi7q/8S0LicOEinJ1mhbTWc4mhmTO+U2Vp3/QgLD6xYqOycqmskjk8JC3Uvt3HyZ05RSOn+GO26Fjn7OhJ7BT/omHdVUmSplqBpSS108Nz2BMZREzVzb4kkCkXLwjOGcRToZK+pCeJM5Lwvn5QlVVeaGJpId43qszOw65wKGeiVfFf8eZ08hoe7R+ZVJgBKTMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7L4DJ4+cLiSJB1TE5VIMfNZOJeveRP7jq3YZa7Srai0=;
 b=mA+mBbEAsiozG29tgM0m3ZSxnGPoPahszRDiQxkp66Zh2/2tOrtl1z1nRCZlYCneqBCprfhONdgPQQ4ZGo6UNO0bR1diJiOXrWuyNWWDnQzTx4l/u60rV5B1J19w+Ny9hS+SoeUlmc7scg166X5HM+jS+JGfTMSVfKF0qRwwKtCo3ByVBsp2rddl+sO6vfprCjzSf/I+fD0UrSL9wRkWv77axCkvaMAMvJyYp9msx1/T8CX12n9AR01GriYx2CwnqgcRg7Yt49ajRnJ/h4Wo1acn6V3a0Sz+CvppcT/UALhTXJMLQdsde0/GFPQi0P6hSB5JxnabinfR1BAetsFnGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7L4DJ4+cLiSJB1TE5VIMfNZOJeveRP7jq3YZa7Srai0=;
 b=m37vpVkaoV9EuZiuNxabEdH2RexfrlMZRNl6OGvRa+zOeOccUH59xkY3eFXQXZNzVo33JWSd/UBj7B8iGQcS7ZzYfjrUhFosSrF5A0auZh7DkRnVNPREnQt5W1x0nwklg221ye3SZnZiww+YT5RiUelfJ/g9H0LQX1Ag9+cerBafreiESFiXrWkMR17oLyaV+8P2Zw/q1As3++vfxtTdNIzlrVEEu6Zkzp2NNePr1229+u4ZVrj1avUSf9PGFYP6JQVqpgtHeOsSS0VqB/bEHAsixpAYkNHrH0gT4DLDITHvjoaDeYA46kTAGSo6shsgtyRownaLa1hwZoCLYnobPQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3083.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 06:02:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 06:02:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 2/7] powerpc/64s: mm: Introduce __pmdp_collapse_flush
 with mm_struct argument
Thread-Topic: [PATCH v6 2/7] powerpc/64s: mm: Introduce __pmdp_collapse_flush
 with mm_struct argument
Thread-Index: AQHZQBgcfj2pHkTsekeal/LYnqsaX67N854A
Date: Tue, 14 Feb 2023 06:02:22 +0000
Message-ID: <d7ea2b97-ef14-e621-4b16-577c99f8198a@csgroup.eu>
References: <20230214015939.1853438-1-rmclure@linux.ibm.com>
 <20230214015939.1853438-3-rmclure@linux.ibm.com>
In-Reply-To: <20230214015939.1853438-3-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3083:EE_
x-ms-office365-filtering-correlation-id: b06d533a-495e-420e-9f92-08db0e510a03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dnormkxm1yHKfzAgIeDgfdT/g5SyO5RVgtcfwUZZXqjBeWhqu7qpnl2x6KjoPsi3HjXdp6PJ/KxNNYA2ocLITJxW4irLtgQ2i9RHW+8Lv4F5UnzSc9fN7IPRB1oqtFWuGq3jD0BOBuirLsGQQ87gN9MpKbz4hpys+bNfa44HfKnAypHJVQtBAINotIIv5OPkdLtyPgd282I1cYWGZIO0iacIQJo2aqQNzuAbLR6DJYUyZ7KBGNkBfva55dSMmvfcIbiHUJCixyjhC6tpNCEi5XSzeN9ZKz1TF/4dqQIb43LaZOrJlex5bkWNrRxfAzCFLkXjN2rG35phpA5/4OYQp3Ir6qdpt9O+tIrDDoC7ujuLSn1TV+8oxY6M7GSGNGzTCyzBLQyuFlZ3sIU9PDpTv+/LtcRULXfJ76mi8DUSF3+ZPbrrlgh3l7iVYfD2m5DSom/+SpmUHoNOU/yOdqrxlpsrhHJSi2ZbWs6PJN10nKJmdzHZgXYlFtIWMMfI9Y2RZUB/NsrJ8n64QFc01ChuM45Q2MCMiPynmEh1UnL5JidtYRs1G2+6ReTzO45i8Nil6+oRiVSIyPFNKAox7jTjKXAXa3ML3L9zd3nKoBlSt+xvkZY7BUTHEMtiKL4WIj27IgY6ERJ8F1iPZDD2Fnn3Wi8/VwB/nNCFy+hvvfenmm2QSf7CxI3sUt/lK5Jj806ofVaNYZb+C1244NTl6d1NvHy5cyIgDWrmUNc6FPrk7AOoPWpqVt6uSoKQXNVK6MXyMtnKRMhu7q+P+/FoJtnm5Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199018)(2906002)(36756003)(44832011)(5660300002)(6512007)(31696002)(83380400001)(26005)(186003)(38070700005)(2616005)(122000001)(66946007)(76116006)(91956017)(38100700002)(64756008)(8676002)(4326008)(316002)(66476007)(8936002)(66446008)(66556008)(478600001)(6506007)(86362001)(6486002)(71200400001)(41300700001)(110136005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UVdFeWNOK0tOQ0JaWVd3a2RsdUFOb0FMcVB1WlJzbEhqRGpOT1VuZy9uRmU2?=
 =?utf-8?B?OUNRSEsrQ05WaHVzTlhUSU9MVlJteDZDaFkwTnUvOE1Wc0RBL09IWUpzVkky?=
 =?utf-8?B?N09PUWRNaXRubjdZV3ljZjdabjFBQzAxZVFFbHRYK01pd3lXUFJsamJVUUpp?=
 =?utf-8?B?UXJ3ekdVNVF3c2RZUG4rN2cxK0NmdVhmN2k1ZmRTdmxBdkloNGpnZHFNNDNB?=
 =?utf-8?B?cUh1TjRObHR4ZFhDNEROTXoyK3czNDFYVTV4eGp2bndSTWF0NjJobGFRcUNJ?=
 =?utf-8?B?Y1hneHZrMEFxUDJLd3ZtRWpnRCtLOHBjVjhXaDU4RGd1R3dsYXg1Q0t6dmF5?=
 =?utf-8?B?U0JKbU42TktoTTF0OUozVjV5Vklva1hWZk94Z1RDdXQ0V0FOVStFZytBMGNK?=
 =?utf-8?B?TWE3M2RzU0x5WlVEOUdrNlpwR0E0VGhLcjZpZ2N3bThPTTN3a2gyYU9ybVdK?=
 =?utf-8?B?MEZXZEM0TzFjNFhYNmQxVHRlUXk2Y1Yrb0RaRHE4N3E1WUJCbm9keEc5N2lq?=
 =?utf-8?B?dWdINTBFbGZiRXZFaVdtVE9vcGoxL1JWcEZaQzh1SS92MHBSSWhONGh5T2Zv?=
 =?utf-8?B?K1Yva3hBKzFyMTFuQ2t2VW5wRll4alQ4Rjd2RzVHZzg3WFQxT24vYTVpcUFV?=
 =?utf-8?B?b3pnZXZtVTZtOUxOMHFwNStqOWorSnpXazlkZkE3MnhDUFJhd2R1STdqalN2?=
 =?utf-8?B?US9zQytDdTJUMDFMU3BQRHUrZXVLSHN4dlA1SHRBOGFjYW15dGRkVnlNOUxG?=
 =?utf-8?B?dXhzc242d1g5SnpRRE02WlUyQkVmNjNSZWlPb2hZQ21EN2p5K0NzaDNvU3Zl?=
 =?utf-8?B?QlBDVGhBTVp2aHNlY0JQQ3Jrc2dtU1dsMWJXWUtLZW0zSnc2THA1ZHdvbUdY?=
 =?utf-8?B?RnRML2V1ODRIZTJZc0VBYVJXYzdsVk1wbDAzVjZRTk1KeCsweEMybXpESWpl?=
 =?utf-8?B?NHlnWC9xR2Z4UmthVE42aTcxMFJHK091QnBzMVBEbEx6Uy9hdndpTzdYMnU0?=
 =?utf-8?B?b0d2c1FJRGtMVDVYWFlTR29vSWNzQ2ZBQTYrMDhyQWRGbWNNZzhla244NzNE?=
 =?utf-8?B?SGVvckVLMGhFQlZGZHVkYVBUYXpGejhjYkgyZFBNdmErTXRyVXpSenpJd1ov?=
 =?utf-8?B?OU9ZYjVOSEpBdnFnK2MwVzZLUGQ5d0tRbFUvR2VyY0N5UG51L1ZMU1pnbFdC?=
 =?utf-8?B?VXFFeVE4ejFvRnpHVUVpektjUklMbFltSlI0WDQ2TUwweExCK0pHU3ZhTHdB?=
 =?utf-8?B?Q3doOEJrc2lEUlFPMWtaWjU2RVZvZ0Iwd3FkM2YxLy9Fdm5YS0d1amtrZWFO?=
 =?utf-8?B?a3I2MEdjVXMwS0hYdTFsbXhEVzd4MC9xQldMTk5uUVQ2Q3VsNmNoNUlyQmd2?=
 =?utf-8?B?QjR3eXNYclQwMzlCa3FnMVRBdEpCRDZ2ejlvUXo5L0ZCVy9wa0NGT1llU3g4?=
 =?utf-8?B?VW1RaXBKelJPeWVXenVhMm93VjVuUGFRVDlwZzFlYmt1MmxvaWRyZkF3NmRI?=
 =?utf-8?B?ZVVnVDNnZ3hGWnZVY283MkM1eFQxVXQwY0VSTGdQZHdGK0VQZWhFOXVJMDZM?=
 =?utf-8?B?N1JWeUtqY3l6Q3Jsa2g2bTU0MTd3amJkRnAxK0RNOTl0Qi9KU1ZoTENIQU9X?=
 =?utf-8?B?a0dpR3B5K2c1cHkvQmVOdnMyZWMxQ0E1VzU1d0lZMmZBVUJnRzlOeEhiMno2?=
 =?utf-8?B?dVN3YS9tTUdueEQxTGtEejVnYzFBRFRaM1AvU3d6WmZNSVlPcWhoNTlmNVdq?=
 =?utf-8?B?cHYyTEI2VmxKKzhqVitGMmlGSU0vQUtWUkxkQW9rWWFGZlM0QVJPYmVoeTFy?=
 =?utf-8?B?cEl2djFSRTFHMlo4WW43NHZDelc2eFhlM2N1b0xoSXJqcmRHT1BsQTF3TmIw?=
 =?utf-8?B?aFVxTHhtVHdaL3E1Q2JXOFpwWU41QkRRNHozZ2V3NlNRV1RHaFlWREZjUndp?=
 =?utf-8?B?dks2cjhLeE4wQTlRN3R6UUJkK0NEOUU2eGRpZXVQcEN1MklQT0RGOHhmRFdZ?=
 =?utf-8?B?dmlwcGJ0a3V1MmZ5UkdqVUcrejNjOGtUOCtETWF4aU9KSVdxMCtwUTY1Tmc0?=
 =?utf-8?B?SExjWmZpMVpPTWlvWlBzNS85T21tczZIWTRBMEhhaVQxRUEzeC85QnE0cFQw?=
 =?utf-8?B?bGdramd0YnVoL3FIaW9YMmIzYjN6c0VyWmY0UVpoTWZlNFFXYjNLR2FBZ2E4?=
 =?utf-8?B?MkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <496006CF0A7296418248EC0529923073@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b06d533a-495e-420e-9f92-08db0e510a03
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 06:02:22.6050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7lBIbxpOu7EJ11R3A7EQIBPyUGUfN6uCSqCQ3jZKdNhvg6DZuClguLKKWZxcyLW4wBDs8q0E9tXanD3BpiGgDEbmOKJmGAVW1ZUFlpYrzjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3083
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

DQoNCkxlIDE0LzAyLzIwMjMgw6AgMDI6NTksIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBw
bWRwX2NvbGxhcHNlX2ZsdXNoIGhhcyByZWZlcmVuY2VzIGluIGdlbmVyaWMgY29kZSB3aXRoIGp1
c3QgdGhyZWUNCj4gcGFyYW1ldGVycywgZHVlIHRvIHRoZSBjaG9pY2Ugb2YgbW0gY29udGV4dCBi
ZWluZyBpbXBsaWVkIGJ5IHRoZSB2bV9hcmVhDQo+IGNvbnRleHQgcGFyYW1ldGVyLg0KPiANCj4g
RGVmaW5lIF9fcG1kcF9jb2xsYXBzZV9mbHVzaCB0byBhY2NlcHQgYW4gYWRkaXRpb25hbCBtbV9z
dHJ1Y3QgKg0KPiBwYXJhbWV0ZXIsIHdpdGggcG1kcF9jb2xsYXBzZV9mbHVzaCBhIG1hY3JvIHRo
YXQgdW5wYWNrcyB0aGUgdm1hIGFuZA0KPiBjYWxscyBfX3BtZHBfY29sbGFwc2VfZmx1c2guIFRo
ZSBtbV9zdHJ1Y3QgKiBwYXJhbWV0ZXIgaXMgbmVlZGVkIGluIGENCj4gZnV0dXJlIHBhdGNoIHBy
b3ZpZGluZyBQYWdlIFRhYmxlIENoZWNrIHN1cHBvcnQsIHdoaWNoIGlzIGRlZmluZWQgaW4NCj4g
dGVybXMgb2YgbW0gY29udGV4dCBvYmplY3RzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9oYW4g
TWNMdXJlIDxybWNsdXJlQGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiB2NjogTmV3IHBhdGNoDQo+
IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIHwg
MTQgKysrKysrKysrKystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vYm9vazNzLzY0L3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3Mv
NjQvcGd0YWJsZS5oDQo+IGluZGV4IGNiNGM2N2JmNDVkNy4uOWQ4YjRlMjVmNWVkIDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiAr
KysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3BndGFibGUuaA0KPiBAQCAt
MTI0NCwxNCArMTI0NCwyMiBAQCBzdGF0aWMgaW5saW5lIHBtZF90IHBtZHBfaHVnZV9nZXRfYW5k
X2NsZWFyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLA0KPiAgIAlyZXR1cm4gaGFzaF9fcG1kcF9odWdl
X2dldF9hbmRfY2xlYXIobW0sIGFkZHIsIHBtZHApOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBp
bmxpbmUgcG1kX3QgcG1kcF9jb2xsYXBzZV9mbHVzaChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSwNCj4gLQkJCQkJdW5zaWduZWQgbG9uZyBhZGRyZXNzLCBwbWRfdCAqcG1kcCkNCj4gK3N0YXRp
YyBpbmxpbmUgcG1kX3QgX19wbWRwX2NvbGxhcHNlX2ZsdXNoKHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwNCj4gKwkJCQkJICB1bnNpZ25lZCBsb25nIGFk
ZHJlc3MsIHBtZF90ICpwbWRwKQ0KPiAgIHsNCj4gICAJaWYgKHJhZGl4X2VuYWJsZWQoKSkNCj4g
ICAJCXJldHVybiByYWRpeF9fcG1kcF9jb2xsYXBzZV9mbHVzaCh2bWEsIGFkZHJlc3MsIHBtZHAp
Ow0KPiAgIAlyZXR1cm4gaGFzaF9fcG1kcF9jb2xsYXBzZV9mbHVzaCh2bWEsIGFkZHJlc3MsIHBt
ZHApOw0KPiAgIH0NCj4gLSNkZWZpbmUgcG1kcF9jb2xsYXBzZV9mbHVzaCBwbWRwX2NvbGxhcHNl
X2ZsdXNoDQo+ICsjZGVmaW5lIHBtZHBfY29sbGFwc2VfZmx1c2godm1hLCBhZGRyLCBwbWRwKQkJ
CQlcDQo+ICsoewkJCQkJCQkJCVwNCj4gKwlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKl92bWEgPSAo
dm1hKTsJCQkJXA0KPiArCXBtZF90IF9yOwkJCQkJCQlcDQo+ICsJCQkJCQkJCQlcDQo+ICsJX3Ig
PSBfX3BtZHBfY29sbGFwc2VfZmx1c2goX3ZtYSwgX3ZtYS0+dm1fbW0sIChhZGRyKSwgKHBtZHAp
KTsJXA0KPiArCQkJCQkJCQkJXA0KPiArCV9yOwkJCQkJCQkJXA0KPiArfSkNCg0KQ2FuIHlvdSBt
YWtlIGl0IGEgc3RhdGljIGlubGluZSBmdW5jdGlvbiBpbnN0ZWFkIG9mIGEgdWdseSBtYWNybyA/
DQoNCj4gICANCj4gICAjZGVmaW5lIF9fSEFWRV9BUkNIX1BNRFBfSFVHRV9HRVRfQU5EX0NMRUFS
X0ZVTEwNCj4gICBwbWRfdCBwbWRwX2h1Z2VfZ2V0X2FuZF9jbGVhcl9mdWxsKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLA0K
