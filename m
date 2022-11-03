Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B856178CF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:36:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2xtW3sgrz3cJ7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:36:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=rLRDc6j/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.77; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=rLRDc6j/;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90077.outbound.protection.outlook.com [40.107.9.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2xsX74Lxz2yMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 19:35:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gooRMgRinuDhDC8Hxe5aRP3UTKMzDJamvwzCyUBY4D+QPbyrj4+r75A9nA+1uj9Mm2DAgDsgCDH21bmUNATzjrIW/nVnJc91kDmXahmOiZtaza+Htp95ivSCGEoJj9JA0/i/9MHzXRWPmlcg97a8Uhfganml8kc5rq2FkWIXMYnNENM5436TXmDuP2eD0YRP6kwa0H6oWOA44U3gfLFNV22l9MSbtazbcPI529sXNK+zV8VniCIAqtTuuPIUOrzrVkCbzLUsLdQk52a+zQhDAeCnfKRiu7ifZvF7/TzSrIQc5L/KA7UAIbAEZ/X1rNvJ/kxvRPBhynB6NcYNf+qufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqgrrBynTpVKstNLANA12SDZl75rhVI6jsYQgax9UPM=;
 b=eAApkjPefJySGhNCjjHnKTwTo0wXp7r1A8oLWjFCtRnrQzdpI5WT7r8g0Liysx1Bz3sp6adgA4IN6YEaRPbqpccBkIR8gkCx8vrMosl45fy9OjIbU0RW/cZQDjgNXXH3t3BnZ2pxSJiDAY3QdO2FIrQRU679GIIHsJXVU6XGR3Q7KSUuMfEivD//vtZvmgYGmQ7LuXXSaFfnw3iaS1STF+/olYW1nIYBa8P0/24+VAR9t2XMeVrhlt4L2FlwE55m8MNgzu5ntG7fll/70Ql4usWCtK4utNWXltI7DBKgn3EchbJsnjM6TR0LdEilAER6ZEj50gIRnT6mdeNq1mjvFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqgrrBynTpVKstNLANA12SDZl75rhVI6jsYQgax9UPM=;
 b=rLRDc6j/OuofDIF8wTLwMk95WMapxfOYuiF5mHd2x9if4CiHwxHYa2AeTBulZT5/7DMSNFBSo+3+Din/r7e1fL3bzNk2/U40ELFU6164n4dZWWBOlDJL+sofWbnTR/y0Pq4GAUIMq6N+v8Hpr92olngLeMS/P9XNSkFhVlUmpALz5mRn9EKSQfn7nJ8sJw1DwMYgoKSO1u0ydLQ1OYzDnLWVgNVqCEXhgdhoypDfwpQzfAlo0TwTFUtmW3SpyBqCB2bKDWYICORVi/BNuzslXr2QH3dmvOrxa7BZiBqeK17va33J7UxwIgkiDRcPFHGJXIV15XVM0CdLz1AyEkn6MQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3072.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 08:35:09 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 08:35:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linux-modules@vger.kernel.org"
	<linux-modules@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v5 2/2] powerpc/64: Add module check for ELF ABI version
Thread-Topic: [PATCH v5 2/2] powerpc/64: Add module check for ELF ABI version
Thread-Index: AQHY7SFuQ3YDvt40Qkm2SePGxQaP6a4s5BWA
Date: Thu, 3 Nov 2022 08:35:09 +0000
Message-ID: <513e1973-a1d4-c698-1441-9c7d0f5205ed@csgroup.eu>
References: <20221031120733.3956781-1-npiggin@gmail.com>
 <20221031120733.3956781-3-npiggin@gmail.com>
In-Reply-To: <20221031120733.3956781-3-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3072:EE_
x-ms-office365-filtering-correlation-id: 3c41d88f-24e1-446b-541a-08dabd765130
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  74cAy01cyAa5ax4HtrOfhx8S74m8it1XwC0/qShryRPgUhSrL+HMyfwqSQp2uJ8YEB3BTugGPmcAcbwsBONrHZTLwZQUpIRO8DSaXHIKAEPxiSfXtFpC5EkMGVHV+YpRXNCDBQxSMRuYko0opDeYchTpbdAgC7RwHkl3UH6YPBO7/a0RllHzEe+SvD8g+cW0fUj86k1IFAmX7Te4LrQQaDiLkIds4vDy7rdwGk1GYJCxvQl4o54iuZOQN4EfRoibizi30NwXtzvm/qToPBGYIU0rKo2ojYw0i/BqwBKhGhgT4Uh46pT7CSB2tPByY7Htab8ezR7+nbrkcX6U+YRkvIwwvqYhVCsSGT4lGRXLVyrbPZq2cJSewj92pMqWbW9Q22UUovaicIXYekeBBVA/VyS6Nr08PohMLieh0C8ILjDc6jspqy3vqmCTSPJLakuX3LOqKyXO7MkdwHvdGBU770B9eemTxrNEhqE6RSPYk3P+pr7S+6w5wK7hAwElrlq0L/3InCfkqnZxqEX4illHvCKpTs7ln3vhwk6aCjOZdJixgVGb6chDQgpJVYk6c4Sek8K+5Jv9NSy76cpGZX5Gcx2fx47g7ajmRP2y/KB/8BEeZK/A1D/fBwc3OPVC01kHEoWL3YIirgG+w8L8fkzNb43TFkHXKJ6WbSVlmGKtSnyZshVj0fvtfhyM456W1Gg5vkFZkAjzvNoMIJuVRrHwlYL9raMWvvEt6uF+V02dg/AcpRvvfpatqh8elsbJRssbTs4FOw6ny9AYKVyNNxKUSvgLQUzVXmvCdHaZU5MCj7kAZ2E+q4dLZbwvfWMcOCuvLwi1J+btwPMz8Fu5fed+zQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(346002)(376002)(136003)(366004)(451199015)(64756008)(76116006)(66946007)(41300700001)(4326008)(66446008)(66476007)(66556008)(8676002)(91956017)(2906002)(5660300002)(44832011)(316002)(6512007)(8936002)(54906003)(26005)(6506007)(2616005)(186003)(71200400001)(6486002)(110136005)(478600001)(66574015)(36756003)(122000001)(31696002)(38100700002)(86362001)(38070700005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RmRubjhFa0puM1ZhZnVxTERIK2lBTkkzWTROYUZuUm1ER21qd25FUGlTVWJa?=
 =?utf-8?B?RHdGcjV0ZUNobnBxSUwvZHNWcmZ4UWdQL0FmWXdVL2pIQVpWZGNXRG9KQW9o?=
 =?utf-8?B?WU8xNE50VDNNTnU2M3FTazlhd0VYVy93OG05YjVTdkd2QmE1U042WUw3UHhW?=
 =?utf-8?B?TUpyUnhETW5EQ3M5TUpIcUd2czVMaWk4Wmw0OEpGVDRDNktOcjUvclRGVkll?=
 =?utf-8?B?N080bi8yTGtSVXpvdk9WQ2hXd2RxQXplelhoVm44QjlpRmd4ejB2Y2hOenJM?=
 =?utf-8?B?bU1MdmtZTjNJOHM1M21jdnU3K25BTmo3bllKcWRERWpxYytPak5iakZYRXJK?=
 =?utf-8?B?RC8walRBUExTRjhIZHJPMjUwYTNtR3FCVGNYTmY4WlBwcnkvSGJET3VjZ05u?=
 =?utf-8?B?YlpFSWhDVGYxMWt0RjlwMEJSNkU0bE1kS01LWGs0ZXdZczRESU4xYm02YXIz?=
 =?utf-8?B?bERaNEJQNFlBRkhRcU9vRmdVOWdJbWFaZ0Y1eVNGZFBjNUs5YlJuMzNwdVly?=
 =?utf-8?B?eXFrb2ZvTERFTTR1YTR6YUZYWDRRK2gwQ2xocmU1cHNXaWVmWTNjV0VIMDZp?=
 =?utf-8?B?eXV5RUs1TG1GWUVpRjVld0JmVENFUGh0NzlvQkNYSDQyUXhYWEpjVy9DcnRN?=
 =?utf-8?B?VUY2cWhtOXdLMWg1N2Q4VWZGVytybXdTbTlFbTk2V1kxS01OL1kyWWhHWEd2?=
 =?utf-8?B?QTR2QzgyTzc2YjVIVHJSNFBFbFNYd3RIdUdISmtRWXYxZldGN2l3c3QyY0E5?=
 =?utf-8?B?UHd3L0dYRTZSTEc5RXdiMFozQ3FIeTVHSFE5VlhOSUNWYnhnbUszQkJDNFJo?=
 =?utf-8?B?cCtvdTM5Z3J1TGhjNjVNSVpJRWlKb0NuRXhyendSVzdTM3dDYjkxTEhpYTdp?=
 =?utf-8?B?ay94Z1lvbXNXWGtjTU8rdUl2WG9aZHdlRFJ2MnQ5dXVWSlI2Nm5Wd0hNcHFk?=
 =?utf-8?B?d3h6WDFxRk92U2djdGJCRWxQY1hGMTBkc0tFdkJXcStlMkxQMXBzSSttRk95?=
 =?utf-8?B?ZHZWSEcvSTVqT05aNFo3OHdlaCtoLzhVbHRjM3N6UFZoTythZjF3SW1uRXNB?=
 =?utf-8?B?VTdTWjJEVldDT0VhVFptamdqVzcybXFYUkpRRm9lbm1JeG5vWXU3RnVWYUxD?=
 =?utf-8?B?MVJPR0VHeVRnbWhocXZMbFBDSWlocUVGRVQ4QlZpSXB4VTBxbnpsZDc0NVJ1?=
 =?utf-8?B?dkltbXZxZzFNRnRmY1J3V3ZKbDhoc0hRZEp4clk4RTVJWVgxMHRrZitPTmt1?=
 =?utf-8?B?MFFRdW52QXJwZ2c5ZWhxV1RzYlpQcXo5Y0N3TlpHSmFXVG5KREpmMmt5ekpX?=
 =?utf-8?B?cFl4bTd1K2RRQzlwMVp3bzFta2k2bXBmK0Z0TVVzQXRiaFgrdXRYQm8xd2RQ?=
 =?utf-8?B?bTdFKzN0ZkZoWjR3Skp4RDVTNHpJWm5HZDdWSVQyd0xwaTdWNXRDakgzeVlT?=
 =?utf-8?B?ZHc4UEp5V2NML2M4a3JWb3dRWUZsb3dLbFlicXFmOEhzQ3VSUGJhWlI4RjUr?=
 =?utf-8?B?dDFoUURGMjRHeWlHcHhLRWNkMVZGNS9tL3FpZ1BLZmxOTmZMeW5HTkdLYWxU?=
 =?utf-8?B?bjJiY05DNHdzc0cwRlIzaGlySVlTRHJZR2tHUWpMTjBVaU5YdHBZeXo5TkNj?=
 =?utf-8?B?MHk1QWgzNnJrVjVwQmZ0TUVBdEgrWVFCSFIzN1ZrdTlBbE55aUtaQ3BuSDNJ?=
 =?utf-8?B?VW9qZWFNZ3F6aVMzTmkxMGoyZmJBV05Yb1YwK1VsZ3RCaXhtcWU4eWdJMWY2?=
 =?utf-8?B?RkFLSFpGdkpjbVdYRVBGaFZnR2N2cFIvK1ZFUmg3VkhxUmsrTzZtTmVmcitQ?=
 =?utf-8?B?MVBwbi9SWkptZnRJQnBmbm0wWlhKeVB1c2Y2bTJPK3RJWG56NjlodVc3RGNu?=
 =?utf-8?B?RklzQ1NoNnZxWjB1NkxGZE5QWEwvenkxK2VOQVpTRlFoam1yWkNDRDd0VFIw?=
 =?utf-8?B?Znluc29td21WenJoZWdQaFBFVkN6a1Y0QVl3dGFQRThyRU5tNHVCTU5KZlJN?=
 =?utf-8?B?OVJPQ2hrZWtQdjNSVXlOaEtUaHNESnY5cFd6eVZ6M3E4UjVFK0Z3TStXdThS?=
 =?utf-8?B?bXVrSmxNNG1HVkxTMFJvV21MOW1vN0JRb2hmY2p4Q1BNR3U5ZFF3MVBiK1pO?=
 =?utf-8?B?VmJBWUVHQk1PZDJuNnpNTnF4OWV5eDgzU0lzOWc5WFBIUlhZRm1ScEpuWDhH?=
 =?utf-8?Q?OipfWQWlY+7RUqL/C8mI/+Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC173E3E2FFD7B47A1A2C3F250DF8373@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c41d88f-24e1-446b-541a-08dabd765130
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 08:35:09.1946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VCIYrlxm3tmyitGVSplBOqi+TFb3dWwemiYWTKu2kt66YeFK1hMd8L2pBrQ3XJU6vczy3+7bGGwuQ2fk7JVpDWGC1ItAL1rO+xlBrQtivg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3072
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMxLzEwLzIwMjIgw6AgMTM6MDcsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPdmVycmlkZSB0aGUgZ2VuZXJpYyBtb2R1bGUgRUxGIGNoZWNrIHRvIHByb3ZpZGUgYSBjaGVj
ayBmb3IgdGhlIEVMRiBBQkkNCj4gdmVyc2lvbi4gVGhpcyBiZWNvbWVzIGltcG9ydGFudCBpZiB3
ZSBhbGxvdyBiaWctZW5kaWFuIEVMRiBBQkkgVjIgYnVpbGRzDQo+IGJ1dCBpdCBkb2Vzbid0IGh1
cnQgdG8gY2hlY2sgbm93Lg0KPiANCj4gQ2M6IEplc3NpY2EgWXUgPGpleXVAa2VybmVsLm9yZz4N
Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pg0K
PiBbbnA6IHNwbGl0IHBhdGNoLCBhZGRlZCBjaGFuZ2Vsb2csIGFkanVzdCB0byBKZXNzaWNhJ3Mg
cHJvcG9zYWxdDQo+IFNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBnbWFp
bC5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlLmMgfCAxNyArKysr
KysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9tb2R1bGUuYyBiL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvbW9kdWxlLmMNCj4gaW5kZXggZjZkNmFlMGExNjkyLi5kNDZiZjliZmRhMjYgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlLmMNCj4gKysrIGIvYXJjaC9w
b3dlcnBjL2tlcm5lbC9tb2R1bGUuYw0KPiBAQCAtMTksNiArMTksMjMgQEANCj4gICANCj4gICBz
dGF0aWMgTElTVF9IRUFEKG1vZHVsZV9idWdfbGlzdCk7DQo+ICAgDQo+ICsjaWZkZWYgQ09ORklH
X1BQQzY0DQoNCkNhbiBpdCBnbyBpbiBhcmNoL3Bvd2VycGMva2VybmVsL21vZHVsZV82NC5jIGlu
c3RlYWQgPw0KDQo+ICtib29sIG1vZHVsZV9lbGZfY2hlY2tfYXJjaChFbGZfRWhkciAqaGRyKQ0K
PiArew0KPiArCXVuc2lnbmVkIGxvbmcgYWJpX2xldmVsID0gaGRyLT5lX2ZsYWdzICYgMHgzOw0K
PiArDQo+ICsJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQzY0X0VMRl9BQklfVjIpKSB7DQo+ICsJ
CWlmIChhYmlfbGV2ZWwgIT0gMikNCj4gKwkJCXJldHVybiBmYWxzZTsNCj4gKwl9IGVsc2Ugew0K
PiArCQlpZiAoYWJpX2xldmVsID49IDIpDQo+ICsJCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiAr
DQo+ICsJcmV0dXJuIHRydWU7DQoNCkNhbiBiZSBzaW1wbGVyOg0KDQoJaWYgKElTX0VOQUJMRUQo
Q09ORklHX1BQQzY0X0VMRl9BQklfVjIpKQ0KCQlyZXR1cm4gYWJpX2xldmVsID09IDI7DQoJZWxz
ZQ0KCQlyZXR1cm4gYWJpX2xldmVsIDwgMjsNCg0KDQo+ICt9DQo+ICsjZW5kaWYNCj4gKw0KPiAg
IHN0YXRpYyBjb25zdCBFbGZfU2hkciAqZmluZF9zZWN0aW9uKGNvbnN0IEVsZl9FaGRyICpoZHIs
DQo+ICAgCQkJCSAgICBjb25zdCBFbGZfU2hkciAqc2VjaGRycywNCj4gICAJCQkJICAgIGNvbnN0
IGNoYXIgKm5hbWUp
