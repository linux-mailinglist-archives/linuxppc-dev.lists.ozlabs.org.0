Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192D5F2452
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Oct 2022 19:41:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MgWVc48jvz3cBk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Oct 2022 04:41:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=qBK/RGPX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.40; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=qBK/RGPX;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120040.outbound.protection.outlook.com [40.107.12.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MgWTq6pBlz30B1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Oct 2022 04:41:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OezHozPKNh+vOqJ5aU47ukC6QV03zyPOPeGZWEp+2+fyoX5S/vs7OJzredAOQc7d/T5FwGKs7qPiwcivBU+k/0GblkIjcjbwYEEq7ufeJTy118kWPBKbaOU5ZOf5LbZJ4kmYkoWC80gOt/estDRu0cbXpOYur0/OAAMmiTakAkxaDRUXMsZKcnCfO/XQBeIObQJiXl9ICRd/7fC+S1RLsKK8K1PdDyEZMmC9nCpaVmRDfQSv1KYvu1mxBonpuDuNGrCwXd2FrtnN/lHnETgcy3It9eyZ3VllURW6OYIiOBMe0xQ63jQOUwX7//sctvMoeWAul1sBu8ZW4YJAOBW5VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHVDT+fUrY8ZxwuIsSydJFUedlJPoB6dB36ll2B1SOQ=;
 b=b11ihfFgVeqvUZqmyMDfW1qMENyAlb6AzECWR3L6S46K3J/+LNGpF2zkyve5hVpsuzb9aZDyOZN84xwf8QBCN2mOcp4nYRELTjHhAezLgZjrCR/nmq7aH9HqThPG0GvPp5FUQLPEkqokuC/i4ZwwPaWeH3/NH7ZMa3hdZvVleZOOPIOCQ/KnZg8wFuO7mWWp4VaS54MiBpmtO8qo2C3rxc8htS/2/zTpSZacuiDykoGqQkHGkWvn8OUA3/9gIf8/sfmxAW4/XKW2HK3aBpXrOLW+OKYy7c5HFmI631Xw+H7jDHG6WFMQvMBLM6Gw3gA3dI9Qv9k0ZuvR0hs813fhuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHVDT+fUrY8ZxwuIsSydJFUedlJPoB6dB36ll2B1SOQ=;
 b=qBK/RGPXdmPzZ6xvkgpldVsCrwohVOqiwjkwycTPBDX1JxAxHGz8WpeZ+ca7zdyP8XpGkDAC/BuHy+9tbOHudLJTDj7M4xLHaWBVziIBpeMMVxBgOHGpvkvovWBuSVzzEuzv50g2H8S3gAGL272B0bLuil8q/xw7E/uYUsBAS6h6N786gvrXoODCnFlkYcFa1u/LOI2FAKzNtRLXJKcz95rYymjazv+DeQxO9R77Xrf6HbTpZiaEn1wK/QJq5NOsG6NwlR2AXTmdNDuOkQ1zgu8jvVC3T4xuFkymoCH0ix6f8lQDIZohitS8ubCvt2XBoS9k+5OmY2EjRkejRVsluQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2155.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:168::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Sun, 2 Oct
 2022 17:40:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.028; Sun, 2 Oct 2022
 17:40:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 11/16] objtool: Add --mnop as an option to --mcount
Thread-Topic: [PATCH v4 11/16] objtool: Add --mnop as an option to --mcount
Thread-Index: AQHY1kv013WfgaLNVUym9942TRnNHK37X5UA
Date: Sun, 2 Oct 2022 17:40:41 +0000
Message-ID: <172590d6-8e46-4992-acc5-a2d01504636b@csgroup.eu>
References: <20221002104240.1316480-1-sv@linux.ibm.com>
 <20221002104240.1316480-12-sv@linux.ibm.com>
In-Reply-To: <20221002104240.1316480-12-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2155:EE_
x-ms-office365-filtering-correlation-id: 0ed08b7f-d7c5-4743-8b3a-08daa49d39ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  HZMF4QUx7WdV8kFEQR/ujvjk6YR9sW9+CSg10wJd6Yce0yLfYRthY46dAHlinsHuEfMOjObJiy5d09oEuqQc2+4DhVbOY7axyb47Ap/M/jx0KFL1TUlnKlzpAxMie+2XTw4NuGeZKg9v+6gHWr0yAuk1GXeSbRT0BcniK7CUcYCe/Osm9daQeAABk8GSjLegUdEHL2cFlTccpvDmudBJkFzOEdxvYAAERmn1IPqTEwuuh90HFr3YUGvDTMoA4vD1Vtrjp3iTFa+ST893BW4cCkssr40PYX9HRaYc5odUknWdejIUn5cgwYaZyCddvSQ7UJ8V8bckOjCzT/rS58cuISirbx2MMjBYfY05mOF8TMaH0zGiqVcKtmLPaAjY8JZDy/1gm6MeSH0312Dbbv0RpBc/79YZMrHT9hPcRFk59c4+6+sAbtQjY7W5EqdKw8NdpDcODoE/C2kuDJ60A4ccrt4TLmXl1f8GVjelqOr5Y6VknCEVR6qw2zz4NxVQHW/A8pum5ksrSkMxwqRAM9VYafeNolFoFxXi2G2pgb6/V4ovHPYtIS1kVKi4r3vcRt6lwVGvBTsXXI4D1nEGi+R1TTle6Qnbc38HIrMlpLXty+DKA+mm5rgo+JiM4bVmI3YeG5oZN1j7YV3Ydje47xIFfwJnEKY5WlQD27HNVv+J3ZYu3B+4HcG03Eot/IQdOW2OXQ4j1VZyRDw9qfcS8s1CNAJDKOl7Ne94y7FV9YVOB9890fNxeGQFbJU1H/vDP1/49uk4CyLZxbLQktfJztUAHNO6G2zCh+7ZBGC0fmvOuYitjZ6aWwguWYoSET0BnIvVbcBUyA6RYz0y9z1xauBQwA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39850400004)(366004)(451199015)(316002)(54906003)(7416002)(66446008)(38100700002)(5660300002)(6512007)(8936002)(66556008)(38070700005)(110136005)(26005)(71200400001)(31696002)(76116006)(66476007)(36756003)(41300700001)(2906002)(2616005)(64756008)(91956017)(4326008)(8676002)(83380400001)(44832011)(122000001)(478600001)(6506007)(186003)(86362001)(6486002)(31686004)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UllzcWVzVzR2OU9XY25lZlluWUp2UERnT3pCM1RYd0NXRk56bGltaWp6UEFD?=
 =?utf-8?B?ZUJ2ajZ6TlJVRFZvZTFmZktWSmlqMkN5Qmpra3BDb3BsVEVOSTM4cnc2NVZQ?=
 =?utf-8?B?OHNITCtRb01mRWdoeHVqckI4ZFJaa0VuVzBUZ3RiTE1uUjVWK2ZnaGZVZWlO?=
 =?utf-8?B?NE1WMjI3dkplTmNwY2xMYURmdzdXYjZQbW4rS3gvUWZ3Q0VTcjZDbjlTZWI0?=
 =?utf-8?B?aGFSNkpUMTBQSTlwT1Rra0VQTCtiWkVrZ0FxZys3bmtyTEV0UktFa3RqV2FT?=
 =?utf-8?B?U1VHOGEzME9LZXhjeDhZUnlGd2tGY3FINFBvVjFEd0FzdlRSa3dadGFoMktS?=
 =?utf-8?B?d3BqODBZZXpJMnc0bytGYnlhcXlqemM1QnlGQTdXT1Y5Lzk1c0F5UnU1QkRq?=
 =?utf-8?B?RzlFa05ETnpDWWhUemxMNWZnUnRIc0F5TTBwbnpIVTVYVHZnSzhMVHJEOXJw?=
 =?utf-8?B?WC9qUWZBd1lqdkJ2VE82Q3VQS2ZONSt2OWZIYlIwa3VqYThoWEl3UTlJS3ho?=
 =?utf-8?B?VGxsaGcvY09mOGZGelhyMHdVRFF6MTNpK1k4UHlvclZGVFo0M1pDKzZCUHZT?=
 =?utf-8?B?Q2U4VVNnaysyRTRkSGMzNEdURHVwVjJCUDlVVkR0Y1BNUG90ZHBqejk3TTZj?=
 =?utf-8?B?N2hWRnU5UHRJSjJsVGE3NFl0KzRtT2hzcHZzZEdERTFFc1lpOXNmWkxFNXJk?=
 =?utf-8?B?L1NBSjNBTDlvSm9FeHUya2tvMis5YnVuN3RBdXhiTXhhM0xIN003VE1EYmVO?=
 =?utf-8?B?YXNBZU85dlJld0JjcHJ0RDkweGl4aHlTUGRmSTJyL3VXcjZBdi9jcGJJY3hs?=
 =?utf-8?B?UW1YNGtnU3JGR1plZHpDQkVoU2dObE40bzliU2ttOGZTTFFlUEpJeXJHRUE3?=
 =?utf-8?B?WCtLaTJpTlQ1YktQRDJjZmtuSVNQdUhuSWdiKzY0VmUySkFzVDJFdHdhazJG?=
 =?utf-8?B?cWc4ejRQNGRacWF4OTlFWVNDQjB6T1VwRUVEbjVocGZsdWpoQXlPTHhMMVRP?=
 =?utf-8?B?TjVtVEQ5Q1JkTzZNZm5BVGNoaDBrMUpzRElZNkNDcFRxeXNFVWE5VldjWTZN?=
 =?utf-8?B?RitXNDBEUkdlQUR1Y1Z4WXZUSWNkR25VRFY4SHlVdkh4azFkVGpCcVBnWVdI?=
 =?utf-8?B?NDJhQStIbzhrcjNWejI4WnZ4UGVCSk5EZlpUMytvWkU3MER0MmpnM1hpU29P?=
 =?utf-8?B?QjRpbmp5QWpWa3orN2pLSCtacjF4NWpGQkpYTlZUamtJcVNuRzhPaVRUR0JU?=
 =?utf-8?B?OGZ6TDMyTm84b21tWUNtdmxabStLcnN1K1N0bmV0ejNhNmVOaGFVNFJXK3Zx?=
 =?utf-8?B?aXRadUFvQUJMNlFQbEozSFl0THg2SUY0T2ptcjZhc001Mys5M1E2Qk9HSFI4?=
 =?utf-8?B?SDBJYXRXdER1bXdZTEk5Z0lVS0VUcVZ1UnF3WnM1aEkwUVVBU3JodVAyOVNn?=
 =?utf-8?B?THBZbGNTVW5IWU4yaEpvSmtHT09jNjUwTDRsZHNJQ0dXbXVwcHZrSUlwdmda?=
 =?utf-8?B?U010UHlYVTN6YkZoN2ZNUDIzcURoUi9sb0daK0dhWWRXRkpBWmNCeTJvQU5L?=
 =?utf-8?B?WEJCeU00TTVvR21VNi9GWlkxL0w4c3luVUN6SkcvcEpIbzJ2L0p3MG5TRUdk?=
 =?utf-8?B?NG9HZnlRVGc2cmFrSlB0eXlHejhobnJGYVo1YVdNSWhFTWxreEtIN3Q0STh0?=
 =?utf-8?B?eFpleTVRZlRCL1NoZzJac1hKWFlpMXRvV2lXREpsTlVNZVppaGY2MVdvaldq?=
 =?utf-8?B?R2xsN1lXQXdpV0dSSEh5d1hudi8zM2xLQ0RXSDY4Y050bFlZbHB4eGpCdSsv?=
 =?utf-8?B?clI3d2lDamNWZHpGUzk1Ni9BR2FKNjJiZDkxOGVsNHBmN25UeGhzOUErblUy?=
 =?utf-8?B?T0Q2RGJBeW1nQk5saE1LdXQ5RDBZR0RySStrTDFGMEV5T3diMjE0cWFCVXMv?=
 =?utf-8?B?WnYxaGZIR0F5S1A0UklleVNtdTV4S2NEcm9yTzZuUmh2ODFoVmE2cllheFlR?=
 =?utf-8?B?THdVM2ZxUWRjcXlGcVN1dmJ0c09FWnV1UklkRTU4TmdYenp4Y1V2YU0ySkd5?=
 =?utf-8?B?U1FzTmgwRkR6SWg2M3BWdjE3MWlhejlwZXk3YTZ1RjZQSWRsQ1hnMHNKc2dH?=
 =?utf-8?B?YWw1VnQxRnRzM2ZhK0c1T2dQV2E4QjhKVXRpbGRmMXhTRjBLT0Q0UC85TXJl?=
 =?utf-8?Q?1UC2fidslnaocpzqyyyteDg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF168B4D68524144BE089BCC2AF7A59D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed08b7f-d7c5-4743-8b3a-08daa49d39ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2022 17:40:41.2430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: De6/gXOF3XpBkWsADrbcovgYu/LlTiy3da85nqtapxsMEpObYRIMgzaLsW21728vvsCS/LctpAN9W23lCbnGE2DipZenTtTXuKbumFAE6A0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2155
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzEwLzIwMjIgw6AgMTI6NDIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBTb21lIGFyY2hpdGVjdHVyZXMgKHBvd2VycGMpIG1heSBub3Qgc3VwcG9ydCBmdHJhY2Ug
bG9jYXRpb25zIGJlaW5nIG5vcCdlZA0KPiBvdXQgYXQgYnVpbGQgdGltZS4gSW50cm9kdWNlIENP
TkZJR19IQVZFX09CSlRPT0xfTk9QX01DT1VOVCBmb3Igb2JqdG9vbCwgYXMNCj4gYSBtZWFucyBm
b3IgYXJjaGl0ZWN0dXJlcyB0byBlbmFibGUgbm9wJ2luZyBvZiBmdHJhY2UgbG9jYXRpb25zLiBB
ZGQgLS1tbm9wDQo+IGFzIGFuIG9wdGlvbiB0byBvYmp0b29sIC0tbWNvdW50LCB0byBpbmRpY2F0
ZSBzdXBwb3J0IGZvciB0aGUgc2FtZS4NCj4gDQo+IEFsc28sIG1ha2Ugc3VyZSB0aGF0IC0tbW5v
cCBjYW4gYmUgcGFzc2VkIGFzIGFuIG9wdGlvbiB0byBvYmp0b29sIG9ubHkgd2hlbg0KPiAtLW1j
b3VudCBpcyBwYXNzZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTYXRodmlrYSBWYXNpcmVkZHkg
PHN2QGxpbnV4LmlibS5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKysrLQ0KPiAgIGFyY2gveDg2L0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gICBrZXJuZWwvdHJhY2UvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgfCAgNyArKysrKysrDQo+ICAgc2NyaXB0cy9NYWtlZmlsZS5saWIgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgIHRvb2xzL29ianRvb2wvYnVpbHRpbi1jaGVjay5j
ICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKysrDQo+ICAgdG9vbHMvb2JqdG9vbC9jaGVjay5j
ICAgICAgICAgICAgICAgICAgIHwgMTkgKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgIHRvb2xzL29i
anRvb2wvaW5jbHVkZS9vYmp0b29sL2J1aWx0aW4uaCB8ICAxICsNCj4gICA3IGZpbGVzIGNoYW5n
ZWQsIDM3IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L01ha2VmaWxlIGIvTWFrZWZpbGUNCj4gaW5kZXggYTVlOWQ5Mzg4NjQ5Li5iMjIzMGFkMTQ3NDgg
MTAwNjQ0DQo+IC0tLSBhL01ha2VmaWxlDQo+ICsrKyBiL01ha2VmaWxlDQo+IEBAIC04NTcsNyAr
ODU3LDkgQEAgaWZkZWYgQ09ORklHX0ZUUkFDRV9NQ09VTlRfVVNFX0NDDQo+ICAgICBlbmRpZg0K
PiAgIGVuZGlmDQo+ICAgaWZkZWYgQ09ORklHX0ZUUkFDRV9NQ09VTlRfVVNFX09CSlRPT0wNCj4g
LSAgQ0NfRkxBR1NfVVNJTkcJKz0gLURDQ19VU0lOR19OT1BfTUNPVU5UDQo+ICsgIGlmZGVmIENP
TkZJR19IQVZFX09CSlRPT0xfTk9QX01DT1VOVA0KPiArICAgIENDX0ZMQUdTX1VTSU5HCSs9IC1E
Q0NfVVNJTkdfTk9QX01DT1VOVA0KPiArICBlbmRpZg0KPiAgIGVuZGlmDQo+ICAgaWZkZWYgQ09O
RklHX0ZUUkFDRV9NQ09VTlRfVVNFX1JFQ09SRE1DT1VOVA0KPiAgICAgaWZkZWYgQ09ORklHX0hB
VkVfQ19SRUNPUkRNQ09VTlQNCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L0tjb25maWcgYi9hcmNo
L3g4Ni9LY29uZmlnDQo+IGluZGV4IGY5OTIwZjEzNDFjOC4uMmE3OWEwNWM0NDAyIDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnDQo+ICsrKyBiL2FyY2gveDg2L0tjb25maWcNCj4gQEAg
LTE4OSw2ICsxODksNyBAQCBjb25maWcgWDg2DQo+ICAgCXNlbGVjdCBIQVZFX0NPTlRFWFRfVFJB
Q0tJTkdfVVNFUl9PRkZTVEFDSwlpZiBIQVZFX0NPTlRFWFRfVFJBQ0tJTkdfVVNFUg0KPiAgIAlz
ZWxlY3QgSEFWRV9DX1JFQ09SRE1DT1VOVA0KPiAgIAlzZWxlY3QgSEFWRV9PQkpUT09MX01DT1VO
VAkJaWYgSEFWRV9PQkpUT09MDQo+ICsJc2VsZWN0IEhBVkVfT0JKVE9PTF9OT1BfTUNPVU5UCQlp
ZiBIQVZFX09CSlRPT0xfTUNPVU5UDQo+ICAgCXNlbGVjdCBIQVZFX0JVSUxEVElNRV9NQ09VTlRf
U09SVA0KPiAgIAlzZWxlY3QgSEFWRV9ERUJVR19LTUVNTEVBSw0KPiAgIAlzZWxlY3QgSEFWRV9E
TUFfQ09OVElHVU9VUw0KPiBkaWZmIC0tZ2l0IGEva2VybmVsL3RyYWNlL0tjb25maWcgYi9rZXJu
ZWwvdHJhY2UvS2NvbmZpZw0KPiBpbmRleCAxMDUyMTI2YmRjYTIuLjljNjk2Y2IyNDc1NiAxMDA2
NDQNCj4gLS0tIGEva2VybmVsL3RyYWNlL0tjb25maWcNCj4gKysrIGIva2VybmVsL3RyYWNlL0tj
b25maWcNCj4gQEAgLTc2LDYgKzc2LDEzIEBAIGNvbmZpZyBIQVZFX09CSlRPT0xfTUNPVU5UDQo+
ICAgCWhlbHANCj4gICAJICBBcmNoIHN1cHBvcnRzIG9ianRvb2wgLS1tY291bnQNCj4gICANCj4g
K2NvbmZpZyBIQVZFX09CSlRPT0xfTk9QX01DT1VOVA0KPiArCWJvb2wNCj4gKwloZWxwDQo+ICsJ
ICBBcmNoIHN1cHBvcnRzIHRoZSBvYmp0b29sIG9wdGlvbnMgLS1tY291bnQgd2l0aCAtLW1ub3Au
DQo+ICsJICBBbiBhcmNoaXRlY3R1cmUgY2FuIHNlbGVjdCB0aGlzIGlmIGl0IHdhbnRzIHRvIGVu
YWJsZSBub3AnaW5nDQo+ICsJICBvZiBmdHJhY2UgbG9jYXRpb25zLg0KPiArDQo+ICAgY29uZmln
IEhBVkVfQ19SRUNPUkRNQ09VTlQNCj4gICAJYm9vbA0KPiAgIAloZWxwDQo+IGRpZmYgLS1naXQg
YS9zY3JpcHRzL01ha2VmaWxlLmxpYiBiL3NjcmlwdHMvTWFrZWZpbGUubGliDQo+IGluZGV4IDNm
YjZhOTllNzhjNC4uY2UxNGUzYjg1NzdmIDEwMDY0NA0KPiAtLS0gYS9zY3JpcHRzL01ha2VmaWxl
LmxpYg0KPiArKysgYi9zY3JpcHRzL01ha2VmaWxlLmxpYg0KPiBAQCAtMjM0LDYgKzIzNCw3IEBA
IG9ianRvb2xfYXJncyA9CQkJCQkJCQlcDQo+ICAgCSQoaWYgJChDT05GSUdfSEFWRV9OT0lOU1RS
X0hBQ0spLCAtLWhhY2tzPW5vaW5zdHIpCQlcDQo+ICAgCSQoaWYgJChDT05GSUdfWDg2X0tFUk5F
TF9JQlQpLCAtLWlidCkJCQkJXA0KPiAgIAkkKGlmICQoQ09ORklHX0ZUUkFDRV9NQ09VTlRfVVNF
X09CSlRPT0wpLCAtLW1jb3VudCkJCVwNCj4gKwkkKGlmICQoQ09ORklHX0hBVkVfT0JKVE9PTF9O
T1BfTUNPVU5UKSwgLS1tbm9wKSAgICAgICAgICAgICAgICAgXA0KPiAgIAkkKGlmICQoQ09ORklH
X1VOV0lOREVSX09SQyksIC0tb3JjKQkJCQlcDQo+ICAgCSQoaWYgJChDT05GSUdfUkVUUE9MSU5F
KSwgLS1yZXRwb2xpbmUpCQkJCVwNCj4gICAJJChpZiAkKENPTkZJR19SRVRIVU5LKSwgLS1yZXRo
dW5rKQkJCQlcDQo+IGRpZmYgLS1naXQgYS90b29scy9vYmp0b29sL2J1aWx0aW4tY2hlY2suYyBi
L3Rvb2xzL29ianRvb2wvYnVpbHRpbi1jaGVjay5jDQo+IGluZGV4IDI0ZmJlODAzYTBkMy4uOWJk
MzQ3ZDNjMjQ0IDEwMDY0NA0KPiAtLS0gYS90b29scy9vYmp0b29sL2J1aWx0aW4tY2hlY2suYw0K
PiArKysgYi90b29scy9vYmp0b29sL2J1aWx0aW4tY2hlY2suYw0KPiBAQCAtODIsNiArODIsNyBA
QCBjb25zdCBzdHJ1Y3Qgb3B0aW9uIGNoZWNrX29wdGlvbnNbXSA9IHsNCj4gICAJT1BUX0JPT0xF
QU4oMCwgImRyeS1ydW4iLCAmb3B0cy5kcnlydW4sICJkb24ndCB3cml0ZSBtb2RpZmljYXRpb25z
IiksDQo+ICAgCU9QVF9CT09MRUFOKDAsICJsaW5rIiwgJm9wdHMubGluaywgIm9iamVjdCBpcyBh
IGxpbmtlZCBvYmplY3QiKSwNCj4gICAJT1BUX0JPT0xFQU4oMCwgIm1vZHVsZSIsICZvcHRzLm1v
ZHVsZSwgIm9iamVjdCBpcyBwYXJ0IG9mIGEga2VybmVsIG1vZHVsZSIpLA0KPiArCU9QVF9CT09M
RUFOKDAsICJtbm9wIiwgJm9wdHMubW5vcCwgIm5vcCBvdXQgbWNvdW50IGNhbGwgc2l0ZXMiKSwN
Cj4gICAJT1BUX0JPT0xFQU4oMCwgIm5vLXVucmVhY2hhYmxlIiwgJm9wdHMubm9fdW5yZWFjaGFi
bGUsICJza2lwICd1bnJlYWNoYWJsZSBpbnN0cnVjdGlvbicgd2FybmluZ3MiKSwNCj4gICAJT1BU
X0JPT0xFQU4oMCwgInNlYy1hZGRyZXNzIiwgJm9wdHMuc2VjX2FkZHJlc3MsICJwcmludCBzZWN0
aW9uIGFkZHJlc3NlcyBpbiB3YXJuaW5ncyIpLA0KPiAgIAlPUFRfQk9PTEVBTigwLCAic3RhdHMi
LCAmb3B0cy5zdGF0cywgInByaW50IHN0YXRpc3RpY3MiKSwNCj4gQEAgLTE1MCw2ICsxNTEsMTYg
QEAgc3RhdGljIGJvb2wgb3B0c192YWxpZCh2b2lkKQ0KPiAgIAlyZXR1cm4gZmFsc2U7DQo+ICAg
fQ0KPiAgIA0KPiArc3RhdGljIGJvb2wgbW5vcF9vcHRzX3ZhbGlkKHZvaWQpDQo+ICt7DQo+ICsJ
aWYgKG9wdHMubW5vcCAmJiAhb3B0cy5tY291bnQpIHsNCj4gKwkJRVJST1IoIi0tbW5vcCByZXF1
aXJlcyAtLW1jb3VudCIpOw0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+ICsJcmV0
dXJuIHRydWU7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgYm9vbCBsaW5rX29wdHNfdmFsaWQoc3Ry
dWN0IG9ianRvb2xfZmlsZSAqZmlsZSkNCj4gICB7DQo+ICAgCWlmIChvcHRzLmxpbmspDQo+IEBA
IC0xOTgsNiArMjA5LDkgQEAgaW50IG9ianRvb2xfcnVuKGludCBhcmdjLCBjb25zdCBjaGFyICoq
YXJndikNCj4gICAJaWYgKCFmaWxlKQ0KPiAgIAkJcmV0dXJuIDE7DQo+ICAgDQo+ICsJaWYgKCFt
bm9wX29wdHNfdmFsaWQoKSkNCj4gKwkJcmV0dXJuIDE7DQo+ICsNCj4gICAJaWYgKCFsaW5rX29w
dHNfdmFsaWQoZmlsZSkpDQo+ICAgCQlyZXR1cm4gMTsNCj4gICANCj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL29ianRvb2wvY2hlY2suYyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYw0KPiBpbmRleCA3Mzhk
ZTIzY2I5ZTguLjM1ODI3ZTZjNmRmOSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvb2JqdG9vbC9jaGVj
ay5jDQo+ICsrKyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYw0KPiBAQCAtMTIzMywxNyArMTIzMywx
OCBAQCBzdGF0aWMgdm9pZCBhbm5vdGF0ZV9jYWxsX3NpdGUoc3RydWN0IG9ianRvb2xfZmlsZSAq
ZmlsZSwNCj4gICAJaWYgKG9wdHMubWNvdW50ICYmIHN5bS0+ZmVudHJ5KSB7DQo+ICAgCQlpZiAo
c2libGluZykNCj4gICAJCQlXQVJOX0ZVTkMoIlRhaWwgY2FsbCB0byBfX2ZlbnRyeV9fICE/IT8i
LCBpbnNuLT5zZWMsIGluc24tPm9mZnNldCk7DQo+ICsJCWlmIChvcHRzLm1ub3ApIHsNCj4gKwkJ
CWlmIChyZWxvYykgew0KPiArCQkJCXJlbG9jLT50eXBlID0gUl9OT05FOw0KPiArCQkJCWVsZl93
cml0ZV9yZWxvYyhmaWxlLT5lbGYsIHJlbG9jKTsNCj4gKwkJCX0NCj4gICANCj4gLQkJaWYgKHJl
bG9jKSB7DQo+IC0JCQlyZWxvYy0+dHlwZSA9IFJfTk9ORTsNCj4gLQkJCWVsZl93cml0ZV9yZWxv
YyhmaWxlLT5lbGYsIHJlbG9jKTsNCj4gLQkJfQ0KPiAtDQo+IC0JCWVsZl93cml0ZV9pbnNuKGZp
bGUtPmVsZiwgaW5zbi0+c2VjLA0KPiAtCQkJICAgICAgIGluc24tPm9mZnNldCwgaW5zbi0+bGVu
LA0KPiAtCQkJICAgICAgIGFyY2hfbm9wX2luc24oaW5zbi0+bGVuKSk7DQo+ICsJCQllbGZfd3Jp
dGVfaW5zbihmaWxlLT5lbGYsIGluc24tPnNlYywNCj4gKwkJCQkgICAgICAgaW5zbi0+b2Zmc2V0
LCBpbnNuLT5sZW4sDQo+ICsJCQkJICAgICAgIGFyY2hfbm9wX2luc24oaW5zbi0+bGVuKSk7DQo+
ICAgDQo+IC0JCWluc24tPnR5cGUgPSBJTlNOX05PUDsNCj4gKwkJCWluc24tPnR5cGUgPSBJTlNO
X05PUDsNCj4gKwkJfQ0KPiAgIA0KPiAgIAkJbGlzdF9hZGRfdGFpbCgmaW5zbi0+Y2FsbF9ub2Rl
LCAmZmlsZS0+bWNvdW50X2xvY19saXN0KTsNCj4gICAJCXJldHVybjsNCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzL29ianRvb2wvaW5jbHVkZS9vYmp0b29sL2J1aWx0aW4uaCBiL3Rvb2xzL29ianRvb2wv
aW5jbHVkZS9vYmp0b29sL2J1aWx0aW4uaA0KPiBpbmRleCA0MmE1MmYxYTBhZGQuLjA3ODU3MDdj
NWE5MiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvb2JqdG9vbC9pbmNsdWRlL29ianRvb2wvYnVpbHRp
bi5oDQo+ICsrKyBiL3Rvb2xzL29ianRvb2wvaW5jbHVkZS9vYmp0b29sL2J1aWx0aW4uaA0KPiBA
QCAtMzEsNiArMzEsNyBAQCBzdHJ1Y3Qgb3B0cyB7DQo+ICAgCWJvb2wgYmFja3VwOw0KPiAgIAli
b29sIGRyeXJ1bjsNCj4gICAJYm9vbCBsaW5rOw0KPiArCWJvb2wgbW5vcDsNCj4gICAJYm9vbCBt
b2R1bGU7DQo+ICAgCWJvb2wgbm9fdW5yZWFjaGFibGU7DQo+ICAgCWJvb2wgc2VjX2FkZHJlc3M7
