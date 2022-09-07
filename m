Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6355B0B36
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 19:12:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN8210mDdz3bkP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 03:12:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=4/7O4HO9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.45; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=4/7O4HO9;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120045.outbound.protection.outlook.com [40.107.12.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN81F5k52z2xHk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 03:11:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vu9lnUMslnG04jq5VYkN1B3WY+5Er9DTY1GU5fQ00O7J72y378Qife6Q2jOE2YUcX4A/gd191LhbI3sgdN/j3wtZB2vsqNkyMwxN56EKqo0NM7PmW1dQwjrnr6v4KJBGCy28GSgh8Te8B1wiDvGrHguNLSSKparYG5uimpCZ55rM8hK2vIsUFDnqmwUCsAvcpUlqyegVrzrhupWOl4/XrdV5NP+Y+GrSUgyZJskX5NLIwgJ1p3ucExJqIkdFp6uGy+10tMZiSShjsxW2kKi45AVm8bDFuxsKmTk1ShBBDdS7b67hgJfBlQdc/HKRIC63QUayrAq70d4rBYrpBLU+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IUlrIEi50brUbF6LjCzRFVfxm7Xb6sKG3pmKttLbXI=;
 b=Wz/SLl+WW9JNc+TC26W1vFY7W1tm1iLZx9FpX8Wxb/xq0j/F8wqo2hbdXvNDcodTChz6EnMYEzotyV6xzWkITLabP26GzESGv+/f8xn9I6sJcMMHf34ObjNIt9sggl5S7KY7UKoy/1ZJzdJJUWJuudQTKc79/EPngw+gZ3wTwsPDkKS+A4rZqXnEwJwum3seLc5sJzMQyAvaeRhv/43SQUIWUA4Pa9QFHR2wf2OKiFqFXcORRIJn3B6NLYPvgNjVN1nLuPxCzEPwSx45g8eZTu3t11ZzoCB6Rki5NTMw5sMYfVK7QCMLIry+Gjbuy7GGwfrjrgmnqme4NkQWx/mSiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IUlrIEi50brUbF6LjCzRFVfxm7Xb6sKG3pmKttLbXI=;
 b=4/7O4HO9xbN7+qrTFzcPjRJtcW4GXGzJ9oCgaovHbOgxQ3g0EA/m/1Vgt8dmkQqZe8RfsBNT3u6+qiz0u4BuPrjKFsBbmoSngCqBe+alHPKidi4XyR6hn2qmJlBXcMiV/ETRMm0JAMKZEkTh34pG92ryLPpicPVJTpO7J1iOdVU0nFCfTM1MvjiTZFN2vMHvRA9g+iVsGFWH3MZ+1PFzHJinQ4Hvn/uhLRgi0husp+8kwnmDgQV34XJwSihM1JLU7oeko6bl3ktUfCt06M9E2+WEvnnyF49Y8/UigaQJ+2YH8siJzlSsx86GT+ER6pVyBtJ9RL1Gadzigb43e6HLCQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3170.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 17:11:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 17:11:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Youlin Song <syl.loop@gmail.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"paulus@samba.org" <paulus@samba.org>
Subject: Re: [PATCH] powerpc/prom: move the device tree to the right space
Thread-Topic: [PATCH] powerpc/prom: move the device tree to the right space
Thread-Index: AQHYwtzSa3G4UOr8qEusQsvxww3a3Q==
Date: Wed, 7 Sep 2022 17:11:08 +0000
Message-ID: <03df3312-cd60-554d-9711-9b87d43dfe7e@csgroup.eu>
References: <20210303050054.3343-1-syl.loop@gmail.com>
In-Reply-To: <20210303050054.3343-1-syl.loop@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24911f86-2f8d-4025-b28a-08da90f3f4fd
x-ms-traffictypediagnostic: MR1P264MB3170:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  BV1YPr/f7I4yr7O+kbbFZlfXuLD1aCimOIG8eoYquQ4tEuA1Cx7znhHcXPM7uiNscqKO6IAffRXI60fBLy2oGDGHAbQdGgz0o/9CC53qqmL/8AxFEMZsf7PtiqOO326yS3sqxhyRIDi5s8wFMs4GGwnzh8dZwhq/0aQXr3jU2L1+wB8Jnzhttr3RmVXQNW9LzbSd8GnzWeUwF8M5NDOgItH/+xu+/K9joLwKm7uMCXJA03F6+WiEBLc//Ky+1XH8ZYz8kJVBhOdgW6IW1F2o9JYfReSAXZSBi9+VAli826zBZ99HQwEI3HSH7YL6zhXm7Mnh+2AK46tHp1uEBt7c7EfzH9BamtXUAks5331D3gtuhs88DryWzW+XDOIyci5a3PxrIUUTpVPFp6sZdYE7pRbBtnS9iLPmRNGOVE9iV2XXDnZELHwXOgUjpGmGjxX8NFoX0q4LeW5nA8GvZ4uF22daNwOT+ke8CsH1gvxmr22VkViui3hMW9E4wqeQlHMiWC8Rs2ghZ8O6TGvlGF7iWbHB19InPAomnigwzjW6czUgPDzE28tMtS3whLb6z0mGExsjNkNIiOfLGfJUUCS00rCnHZV+IY6sBdJjXmR0H8fu8QVn4yAFEkkeTQCLfum9spDeml2WyB+Zm3GZD0U2e4WYAOX+F5CVKpWBehgBoCZMkWL3mgGVD28ochpUKNhR+Eo5CDdo8bHBHOrQMvYeUlMk+LyD/1Bfl2InTa/aUhlscu7gxbVr6naOsMQmgi0dk9ey/PQokYMsTFbZtgylYXdY7p+J56+1FtObBH5Ky3hi9DzY0J63GyJcE5AUrqlR95jcm4RbfoKmthkPx17JKw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(38070700005)(38100700002)(122000001)(66556008)(4326008)(66946007)(66476007)(64756008)(8676002)(66446008)(76116006)(54906003)(316002)(91956017)(44832011)(110136005)(2906002)(2616005)(5660300002)(6512007)(8936002)(186003)(83380400001)(66574015)(478600001)(71200400001)(6486002)(31686004)(6506007)(26005)(41300700001)(86362001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?REFmbkZBOGlvNUlzaUttd1FMS3I3Y0lBWWZkSnh6ak9Vb1loRVVtOWd1M2c4?=
 =?utf-8?B?WTI1S2dVQTJhUVlRdUhreWpkMnZtdWw1OENXVU05R2VuYUR6RC90SFhLS0dr?=
 =?utf-8?B?ZjBHaGJFSFhWcGprbENGaHl5eE5LSkZJY0Z0Y09XZkpBeENiR3VNMkVRMlA4?=
 =?utf-8?B?QktUVEVGLzJYWDh0azRRZHhGdkFqSmlFQXJLQ21ONWdBM1R1bFJNSG5nZUJH?=
 =?utf-8?B?Q0lsd2FaQ3hjMGJrbGlvRDV1OGljcnJka3ZzWVBIUktIL011YzM0amFDeGlX?=
 =?utf-8?B?S3c1KytQaVdGcVFramRBSkdCY3pLWjJCV1ZsbmlMeFZ3dlFjdWJaRDJRaXJp?=
 =?utf-8?B?Z3RzUDlWRFNWUmpDcmp6b05waDZRdWlTdk9za282R2dBc3ozbzFkZ25mdjhs?=
 =?utf-8?B?dENob2tYY01ycktIL2VpV2Rmbm0weGVzVWV2N0tXNFdhSGtuamdSdVJvbnRi?=
 =?utf-8?B?d1hYeG5oT2QrbmF1blFFeUlCc3BpVnFLRDNMYjdpRGpMMElWdXdVanM2d1Fu?=
 =?utf-8?B?ZGtjSkl3V1k2aUhob1ZvKzA0WCt2dmFkMGhOcjA2UlpIUXNPQ3Rhdkl2c2JQ?=
 =?utf-8?B?c2FKNEUxTHQ1eUQ2Mmt0WkRaaktKWDdYV0FZZERGbjU4S2N0bjk1N2tYRitI?=
 =?utf-8?B?b3FQR015elJxT2gxSlJldDdtMDZlTXlxVG1CeEdjMXdtaFdsNFRqTHB3a1Bm?=
 =?utf-8?B?eG92cGlISmpQQVJURFpqd0N1ZStzQURyNmVYT3EwcFhyalpYRzdYNTZXSVhY?=
 =?utf-8?B?djBnSnEwWkJYYWRucjBTb05iMGh2WlJ3WlpvSXJubjkzc0sydUwwQzRGT1lu?=
 =?utf-8?B?YTF0UTErRmh5dURISlBxb1plbVdwdHd4S3B0NWUyUTFJdEZqUHFUWG5LVnJ4?=
 =?utf-8?B?RnNSTFo1M1RRL0R6eDVDRGhVcWF5dGhKUXYyNXRpbzRSd0dEZEZPTjNaemZQ?=
 =?utf-8?B?aTdEUFY4c0MrVVkzQlM4MVNEU0JHSENqTUZPMVd2RjR0QW5aTm9Qek55amR4?=
 =?utf-8?B?R0hhaTBRT1hZL29ydHJadnV5ZUk4YUdGZDZ6MHFxZjNmTHNmMTZQc2VmNEQ2?=
 =?utf-8?B?akxERkpJeVkrdHpnUCtmNEF6WFFzMkJkc2tuS2FnNXd6aU0wQ3pKWGptRHU4?=
 =?utf-8?B?b3BQVlZlZU9yVDE3R25vRkxHUXFCWU5iR3Bwb25LV3h2WDExK3FDbDFGZGxD?=
 =?utf-8?B?d2tWSWpzeVVmajhEK3F6N00rMkRNWk9vN0Z2V085c3NvaEFZNWkzbFJoRTRL?=
 =?utf-8?B?RXk1S1FaSjdCTFpRWWlVM3FFQ1JlNTFTUkE4dVh1SFZDZyswVmZNZy9CakZL?=
 =?utf-8?B?Vi9Ia2Jxb1draHVlK0IxeWZwZGlGRy9paEl6MGFiczIwQWVxV1ZKMzgybmFH?=
 =?utf-8?B?ZzZxMXkxWHpsSVZoc2JPSUM1aEJabW5MVFRLbWtKSVRncHgyVllPdWxjdlds?=
 =?utf-8?B?WndicXVuaHdlZlN2QjVMSjd1UUxRWlU3Tmt3Tys2ZHIzT2NOZ2Z0amRHR25s?=
 =?utf-8?B?bWx0WDlSR2pIWUk2OFo2MzVibzkwVWhYQ1R2VGxHcEdtcFhCZzlCTFF2UEww?=
 =?utf-8?B?QXh1b29samRyTHI1TUFPV1ZkT1lESmVPOFkrd0t1RzByRktSSDZXbE9XTWh0?=
 =?utf-8?B?KzY0enc0eWUwd2RDejM5KzcwcGZmRStUWHFULzJLMFpjUzN5dU9TemdTajZp?=
 =?utf-8?B?bUhaUTFLNnVLUmMwRnRSZ1V2QitteGxXSTBsRGVhNFZhUGtKTy9GQUpjSTlX?=
 =?utf-8?B?Q3lxWmdNTFpGSWs5dFpUc0MvQ2JzS3hyVW91R3YvYm5HUmhPeUtMT3YyL2Ir?=
 =?utf-8?B?d1VtTzhKbGNERXQ2T01rdFdiOHp5Mld3RldsRnZRb2RLNkQyR1BUQW9WbU82?=
 =?utf-8?B?RFBiZ0xxWlppV29ZSzh4MXcvZGNDM0YwVmFtK3NnV1EzbkdDY05zcWdXVlpH?=
 =?utf-8?B?Z094SWhCUEZ0eENKRXY2djNTak1OdjNLMUw3M2dSN1FIYnRkNW9WRG5GUm4r?=
 =?utf-8?B?VTBYQWo3eTdyNTYyYzJSRTZxVFJTRWYvcXVOOTV5RHE1VXNJNm9SanFsczZG?=
 =?utf-8?B?aTgwbmdhTFZJc0JMdGhoY0JQcyt5SjBHRDY4ek9lTTFKZEllRExEc0JQRDE2?=
 =?utf-8?B?blpzK2xieUJCYklzaC9qTVFzTG9MLzJJbnpHSWkxaUdXd3gyU1VxWm9UVTRQ?=
 =?utf-8?Q?JzjWDCdjSEnSzj8PrVHhvYI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6445E4A8F595584293857A51F0081B97@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 24911f86-2f8d-4025-b28a-08da90f3f4fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 17:11:08.7909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5KPWOuAnTpehPRlJhtn5A3d73ZJkHcFG3AXvT15ykB8TbLOER6xyXtCBJBEBgjTrEX8nNgzROqRZideFv4ghxRApWYabXUA73pGzaRQgPu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3170
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzAzLzIwMjEgw6AgMDY6MDAsIFlvdWxpbiBTb25nIGEgw6ljcml0wqA6DQo+IElm
IHRoZSBkZXZpY2UgdHJlZSBoYXMgYmVlbiBhbGxvY2F0ZWQgbWVtb3J5IGFuZCBpdCB3aWxsDQo+
IGJlIGluIHRoZSBtZW1ibG9jayByZXNlcnZlZCBzcGFjZS5PYnZpb3VzbHkgaXQgaXMgaW4gYQ0K
PiB2YWxpZCBtZW1vcnkgZGVjbGFyYXRpb24gYW5kIHdpbGwgYmUgbWFwcGVkIGJ5IHRoZSBrZXJu
ZWwuDQoNCkNvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSBjbGVhcmVyIGV4cGxhbmF0aW9uID8gSSBk
b24ndCB1bmRlcnN0YW5kIHdoYXQgDQp5b3UgYXJlIGRvaW5nIGFuZCB3aHkuDQoNCkVzcGVjaWFs
bHksIHRoZSBTdWJqZWN0IHNheXMgeW91IG1vdmUgdGhlIGRldmljZSB0cmVlLCBidXQgSSBjYW4n
dCBzZWUgDQphbnkgbW92ZSBpbiB5b3VyIHBhdGNoLCBvbmx5IHNvbWUgY2hhbmdlIGluIHRoZSAn
aWYnLg0KDQpUaGFua3MNCkNocmlzdG9waGUNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWW91bGlu
IFNvbmcgPHN5bC5sb29wQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5l
bC9wcm9tLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tLmMg
Yi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb20uYw0KPiBpbmRleCA5YTQ3OTdkMWQ0MGQuLmVmNWY5
M2U3ZDdmMiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tLmMNCj4gKysr
IGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tLmMNCj4gQEAgLTEyMSw3ICsxMjEsNyBAQCBzdGF0
aWMgdm9pZCBfX2luaXQgbW92ZV9kZXZpY2VfdHJlZSh2b2lkKQ0KPiAgIAlzaXplID0gZmR0X3Rv
dGFsc2l6ZShpbml0aWFsX2Jvb3RfcGFyYW1zKTsNCj4gICANCj4gICAJaWYgKChtZW1vcnlfbGlt
aXQgJiYgKHN0YXJ0ICsgc2l6ZSkgPiBQSFlTSUNBTF9TVEFSVCArIG1lbW9yeV9saW1pdCkgfHwN
Cj4gLQkgICAgIW1lbWJsb2NrX2lzX21lbW9yeShzdGFydCArIHNpemUgLSAxKSB8fA0KPiArCSAg
ICAoIW1lbWJsb2NrX2lzX21lbW9yeShzdGFydCArIHNpemUgLSAxKSAmJiAhbWVtYmxvY2tfaXNf
cmVzZXJ2ZWQoc3RhcnQgKyBzaXplIC0gMSkpIHx8DQo+ICAgCSAgICBvdmVybGFwc19jcmFzaGtl
cm5lbChzdGFydCwgc2l6ZSkgfHwgb3ZlcmxhcHNfaW5pdHJkKHN0YXJ0LCBzaXplKSkgew0KPiAg
IAkJcCA9IG1lbWJsb2NrX2FsbG9jX3JhdyhzaXplLCBQQUdFX1NJWkUpOw0KPiAgIAkJaWYgKCFw
KQ==
