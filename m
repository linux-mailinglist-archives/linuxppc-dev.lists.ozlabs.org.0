Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 683A878392F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 07:20:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=jdoYmrjc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVHjN70ypz3bkm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 15:20:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=jdoYmrjc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62a; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVHhB6Jfnz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 15:19:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6b3iZw1n8ZR555ZypBi6iAytNh/83fG0AvW/0JOMhPnFQNWHri5kXyuKsvSrCJyX5mECM+V47J1XCfMFR7/5NNqi5O4QVIz087BgNJnYVBT5T04qDMHD0javKsRBv13h99D/l51/HnS8nzfbfmLzi70l4fmNrJjyoFtc6c+dFooea11+8TifJMRBGVq3j1A73R4Q4pIifoOetYHRwhvukPH1EzAwY1CIKvk3nCHTJn6mHOTdA5AKW7to/LzGQxHC7x9YSWfsPDRBWLwGTw1K5SnZL2ve4LJ6HAnHM45hgdsNEtCK1YnxglHjBWIp78lPwFiygYgawHHTas332H1lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnLCO1eOot6hfC6vjXpLQf+kd8fehnh6Q7/akELY8W0=;
 b=KhV+UI/ia/AIx6iDvoTzHMVBSinqAWto1FXVUfD6p/JiPbvf+A/1yrvVZfpZAVjKku/AW3LEX2Pxwr+FM35itlb/bgvsKIc6tMixPqD9tznZGDyQRku1Kderlmwuhq666KreLPt+sIjv4VR/JCmzAozbLO9G8rMMj0/A+sFp0D1WCh9LPLyncrmFxYioBwY6ClEElZ9ae6rz4cU+vwtzCH3UMdPciiGAOZZ9Lo3zvlx9lO4LCcw51Iv4IKGNBrD3XroydA+nXrIJNuc8Wua7MwSQxhHkLLQJrgiN+5kuTmklULl3igha5skGbKEMv2r26fwhxF1oIZTgiZOaER5S5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnLCO1eOot6hfC6vjXpLQf+kd8fehnh6Q7/akELY8W0=;
 b=jdoYmrjci0eg5I4OVRR58dvLMaviPKpWXapeVwrYbhLw7FflX9Fi5pQlEpVwKAchh9FhvbGkFu3x8jD0RzKukFc0Hsioya6cw7AeGtEK9mJ5N0lgKygcDWYKedB54FY2Cz5QZPZavG1sV0p0+Q4L1AzKfzile6PzUkCYixZP5j6dB8mfscen95vieVCHAblVfJ8e7pNZYl06jjnZySHvq2ppBHbZ9r4fmkW1Ak3qqWc0Wr8+9UngPVLMq39y4oeo7rBz+SkoqoqLmQtChTXNY2DShwno+ewVCcBg6SNa9+vmBUB8LkmHWOck7Ny3r8HLR4X0XAPdED7Cix1CwtXCSQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2418.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 05:18:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 05:18:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/perf: Convert fsl_emb notifier to state machine
 callbacks
Thread-Topic: [PATCH] powerpc/perf: Convert fsl_emb notifier to state machine
 callbacks
Thread-Index: AQHZ0bJlB0VMKTfnYkePEnbQYqNS2a/1zNgA
Date: Tue, 22 Aug 2023 05:18:45 +0000
Message-ID: <dec65bd2-326f-c0ce-d568-036ff1303c38@csgroup.eu>
References:  <603e1facb32608f88f40b7d7b9094adc50e7b2dc.1692349125.git.christophe.leroy@csgroup.eu>
In-Reply-To:  <603e1facb32608f88f40b7d7b9094adc50e7b2dc.1692349125.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2418:EE_
x-ms-office365-filtering-correlation-id: eef1fab2-c91d-4c08-4fab-08dba2cf4220
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  i9ODww0bFY286lriIi9bDTUSGCZM6VFqgeVfkNTTg2ZNVEEW/QvKPFXgJA8WVkka1t2ORbCb80SQHxNFpanKY4qMSfdoIfNNrY+YXiyMk5AmgymMh7/0zFgd3rUzcbQsakJ3ViiT2B5soX7ymbDk08jErh35/Tu3lAjf42d+5e7hM94gdmHn7JYFQ/jnO7LT4FP2zZnqhld0k3FxWHsQ55HwgRzij7KI6hJFfp5pG4ecHatHAQj4XHQrFqt0ZWXjxbxa+Lr8G5d88LplzijCm4y7DKPMEgiVo8QmHpBN5UpZiC+lxjhCfqwf5iDKnwb02h9iIfeeGPL2BscSNCnBEYWDY9RO6HBSXFdXxtqPjxo8rIDd29eqgozSJzm92vQP+rHj+ptF3WGOyVF2WZr0/0GonlNY+ibrwHTTYMmKLrI4DsH1COwtqacA0Z77pP86XxF211fTCNCiHhBhIiGM60ELiApGEQi2j3m0j39g6/F0hKYflp+73Wsr1mjebc/iYhJRBBnmtVPs0C5WZY+gf4+RxJoj4cUeyG6m6wzG0Xsd2MypkWQfGp8Dt2nG1NvKurFxSMoFJAVzGbm5ynhjPI64we29am8bUkMte5FsCENOYha6d1t0U8tycZPSgFGlLWVbuzV6qia2CUACtIN0oGbdyvEJAnf+kRTJuqT1L9Y=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39850400004)(366004)(346002)(376002)(186009)(1800799009)(451199024)(54906003)(66446008)(76116006)(66476007)(66556008)(64756008)(316002)(6512007)(66946007)(110136005)(91956017)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(122000001)(966005)(478600001)(71200400001)(38070700005)(38100700002)(6506007)(6486002)(83380400001)(2906002)(86362001)(31686004)(31696002)(44832011)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?akJCdkdmMFNEU1FFelRJSWFKTlpURDM5a1ZCT2lxL01qZVRyUVJZb084RWFJ?=
 =?utf-8?B?M1R0OFZQamI3OUswQ3RZQXdZYjhZaTNGSzRVclg3L1dNa1V6MStpT0ZrOW1q?=
 =?utf-8?B?ZVRCUFNRcTg3ZjkyakNHcXdETFNNbDQyYVlqUlV2Y1J4cGZJL3Q4Wkx5NVpP?=
 =?utf-8?B?YnBQNHF1NTdqR1pLWHprYUdxQ0JZdVZDZXZRWVAvcFA3K1VoczErc0tCcDVY?=
 =?utf-8?B?V3BxMHZROVlFMFozSUJoN2p4NXVPbGJpTnpFeERFR0tWUThUOEh6YmpwNEdT?=
 =?utf-8?B?QU4vS3VLWVVoR2J4RzdTOVlQNzJSbmszSmRCSEZWZG8xN0dTaFdFWGtpcktR?=
 =?utf-8?B?SHdvbnk0c0Zwdm9mM1A0aXNsbFNUdW40SnhZR0Z6b1JPcnEyYkJ0ZHFwTWJr?=
 =?utf-8?B?Tk5iK0RSSEFFbTZ5UlJFQU93MjRGZE5tNWNVczRTeWxJVVFlWmQwUDVtZ3BP?=
 =?utf-8?B?Y2kzRldhT2MxSXJiS3g5UWxpcGNZTDlZVDhtUzZWMUhEamgxMFM0QmNEdXlZ?=
 =?utf-8?B?TFJQTTNCT3JUdXdaVy9DT0FReTVaWGVXQm5rblZ3eDRsZVhGVFZTUm9pNGZu?=
 =?utf-8?B?YVFOMkI1c0VTYmNIdjNmbEtZcXJLRkNDQ0pZa1BMWXhJc1RoMmorVkxacGM1?=
 =?utf-8?B?NDNLRmozcUZwQm1iOWRZcHlPV1JOQ0NvbEJLanJIWDVIMldVb0M2U3NSV1Z5?=
 =?utf-8?B?TzVzTUpBS0U5Zjc4NXB4bDRRUW5xbWlLb2ZqSmpteTBlRnJwT0FwLzJVZ0Jv?=
 =?utf-8?B?akorU3p6WEkzZ2FJd2pUUkZpOWlIblpYK2R5eEpSK0N6UUxvblR2eGd3YW1w?=
 =?utf-8?B?ZTIwaTZmdkNra1M2UlgycDcxN3VXTEpLSjN2RmxrTW0wS0hHbDh2V0ZCYXJ1?=
 =?utf-8?B?cm95clRDY2phOXQ4YVdNM1haNlpoQWlmdlhHQ3JMVXpPU3F6ZkV4SkNPenky?=
 =?utf-8?B?YTBXTGtwVWZpQW9oSmJKL2k1czI0TkdYNEkzS2FOWUVrRzZOWGUwRmZpRU9n?=
 =?utf-8?B?d0hZWW8wRmFxUkM5R1JkUnJUY3pjWHYwS1ZEekg0bU40YXBXVDNNN2k3QjB2?=
 =?utf-8?B?UUJMTlRoYnh5dWdwRFR0Nms1Mmh0MC9raFA3bGg1eW0zNWNCRjl3ZmJhMTdt?=
 =?utf-8?B?UDU3aEEwWWhPdmlUNzBYU2xmU2Z6d1dWRHpQT2hMMzhxVEd3cDRSZDViYnBt?=
 =?utf-8?B?K2VxQy83KzZ2RDlHUzVTME1UTTRTZ2Erc25wRXJsVVVpZHlYUGxJKzlYZk56?=
 =?utf-8?B?dVptdkxRQXZjU1VYc1IyYjJzYm51QVVtbkliTkhlL2RKd1QwOS9IWTNDUnlB?=
 =?utf-8?B?V3h2b2FLSm9RampNV0Y4eGJmMkRUOWVUWnY1NmpGOUI0QlQ0S2Q4SS85Smh5?=
 =?utf-8?B?eEtmait5YjNIdG1yWi9CeGtMODdPK0ovQWpPRzV2N2ROb0RDSVpRU2Faelg4?=
 =?utf-8?B?VGYvTFhpZDRQTGlBb1lQUi9DK25nN0xteHluTDFrMzNJT2dvNEtQOFlBNHp6?=
 =?utf-8?B?ZHRSYi9RNGI5Sjk5WVdRYzFYbzM0cm5aeTNJdSs1L2J1dnNZSytHMzhDRSsv?=
 =?utf-8?B?VlNaTSswTTR5ei92a2VmdnR3WTVBVnRuRnZURURrWmVFd2xmSVZlVlRqbzlD?=
 =?utf-8?B?aUZsYmtBclJEQzZSMm9YTWlibVRQcWZ4OGcxYmFjNkpzWjVwNUxTUDFKZjBW?=
 =?utf-8?B?VFdpN1o4ZjZzemFrVWplekFWN0ZhT3paY1VFZnVnenRHWnN3cm4zYUxBZmlO?=
 =?utf-8?B?R3dFdEFsUmxobWh3emg4cHNCb0RJZDRKTHlBY25BL1A5emJkVURBSEljR0xz?=
 =?utf-8?B?ckxJazc0a3NWSnNOTk10ZHQzakpTN3NqaHNHekF6RldhVWpIVmV4K0JMSzhR?=
 =?utf-8?B?NWFLclNjWk9CUVBUSERqV2Z3SURudVJUWGZ5c0hoSitXSDlZdURPY2Q1Y1VB?=
 =?utf-8?B?OUw4R0g0eXVFeUsxSi9UQlBwaWlXbmJHeVFRNThVSHUyb1M1ZWNVYXEvak8r?=
 =?utf-8?B?akNNRnYwaVpqNy9GRzlEc1RQTUt2eXIra3NubHpleE9VRW55aFMrdDlCTWVv?=
 =?utf-8?B?RlByZnNwRW9obk51aUhJMHhLUU55dktHanhWMFZoVlNIMm9VWEl0OHFvS1VF?=
 =?utf-8?B?VENXNVQzRUJvV3VnMGRHZEFpMUhzNkphekNZVThXbUZVTjdQUjVyNGF1dklN?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90CF2DC0C783B24797212843477E180B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eef1fab2-c91d-4c08-4fab-08dba2cf4220
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 05:18:45.3991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9gzgvaEdur315j9RlWHhEn2ndky2I2uoQPuXe227q+MBYcHHFYPEmvnNUM8maoxRdkiVWumZ9sqZCkj9V7jJiDxDY892sJfmTCx6ofij3/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2418
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
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA4LzIwMjMgw6AgMTA6NTksIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gICAgQ0MgICAgICBhcmNoL3Bvd2VycGMvcGVyZi9jb3JlLWZzbC1lbWIubw0KPiBhcmNoL3Bv
d2VycGMvcGVyZi9jb3JlLWZzbC1lbWIuYzo2NzU6NjogZXJyb3I6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3IgJ2h3X3BlcmZfZXZlbnRfc2V0dXAnIFstV2Vycm9yPW1pc3NpbmctcHJvdG90eXBl
c10NCj4gICAgNjc1IHwgdm9pZCBod19wZXJmX2V2ZW50X3NldHVwKGludCBjcHUpDQo+ICAgICAg
ICB8ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fg0KPiANCj4gTG9va3MgbGlrZSBmc2xfZW1iIHdh
cyBjb21wbGV0ZWx5IG1pc3NlZCBieSBjb21taXQgM2Y2ZGEzOTA1Mzk4ICgicGVyZjoNCj4gUmV3
b3JrIGFuZCBmaXggdGhlIGFyY2ggQ1BVLWhvdHBsdWcgaG9va3MiKQ0KPiANCj4gU28sIGFwcGx5
IHNhbWUgY2hhbmdlcyBhcyBjb21taXQgM2Y2ZGEzOTA1Mzk4ICgicGVyZjogUmV3b3JrIGFuZCBm
aXgNCj4gdGhlIGFyY2ggQ1BVLWhvdHBsdWcgaG9va3MiKSB0aGVuIGNvbW1pdCA1N2VjZGU0MmNj
NzQgKCJwb3dlcnBjL3BlcmY6DQo+IENvbnZlcnQgYm9vazNzIG5vdGlmaWVyIHRvIHN0YXRlIG1h
Y2hpbmUgY2FsbGJhY2tzIikNCj4gDQo+IFdoaWxlIGF0IGl0LCBhbHNvIGZpeCBmb2xsb3dpbmcg
ZXJyb3I6DQo+IA0KPiBhcmNoL3Bvd2VycGMvcGVyZi9jb3JlLWZzbC1lbWIuYzogSW4gZnVuY3Rp
b24gJ3BlcmZfZXZlbnRfaW50ZXJydXB0JzoNCj4gYXJjaC9wb3dlcnBjL3BlcmYvY29yZS1mc2wt
ZW1iLmM6NjQ4OjEzOiBlcnJvcjogdmFyaWFibGUgJ2ZvdW5kJyBzZXQgYnV0IG5vdCB1c2VkIFst
V2Vycm9yPXVudXNlZC1idXQtc2V0LXZhcmlhYmxlXQ0KPiAgICA2NDggfCAgICAgICAgIGludCBm
b3VuZCA9IDA7DQo+ICAgICAgICB8ICAgICAgICAgICAgIF5+fn5+DQo+IA0KPiBGaXhlczogM2Y2
ZGEzOTA1Mzk4ICgicGVyZjogUmV3b3JrIGFuZCBmaXggdGhlIGFyY2ggQ1BVLWhvdHBsdWcgaG9v
a3MiKQ0KPiBDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPg0KPiBDYzog
VGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+DQo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4gQ2M6IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQoNClJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2Jv
dCA8bGtwQGludGVsLmNvbT4NCkNsb3NlczogDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1r
YnVpbGQtYWxsLzIwMjMwODIyMDY1OC5PUjVoSEZjRC1sa3BAaW50ZWwuY29tLw0KDQo+IC0tLQ0K
PiAgIGFyY2gvcG93ZXJwYy9wZXJmL2NvcmUtZnNsLWVtYi5jIHwgOCArKysrKy0tLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BlcmYvY29yZS1mc2wtZW1iLmMgYi9hcmNoL3Bvd2VycGMv
cGVyZi9jb3JlLWZzbC1lbWIuYw0KPiBpbmRleCBlZTcyMWY0MjBhN2IuLjFhNTNhYjA4NDQ3YyAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BlcmYvY29yZS1mc2wtZW1iLmMNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL3BlcmYvY29yZS1mc2wtZW1iLmMNCj4gQEAgLTY0NSw3ICs2NDUsNiBAQCBz
dGF0aWMgdm9pZCBwZXJmX2V2ZW50X2ludGVycnVwdChzdHJ1Y3QgcHRfcmVncyAqcmVncykNCj4g
ICAJc3RydWN0IGNwdV9od19ldmVudHMgKmNwdWh3ID0gdGhpc19jcHVfcHRyKCZjcHVfaHdfZXZl
bnRzKTsNCj4gICAJc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50Ow0KPiAgIAl1bnNpZ25lZCBsb25n
IHZhbDsNCj4gLQlpbnQgZm91bmQgPSAwOw0KPiAgIA0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgcHBt
dS0+bl9jb3VudGVyOyArK2kpIHsNCj4gICAJCWV2ZW50ID0gY3B1aHctPmV2ZW50W2ldOw0KPiBA
QCAtNjU0LDcgKzY1Myw2IEBAIHN0YXRpYyB2b2lkIHBlcmZfZXZlbnRfaW50ZXJydXB0KHN0cnVj
dCBwdF9yZWdzICpyZWdzKQ0KPiAgIAkJaWYgKChpbnQpdmFsIDwgMCkgew0KPiAgIAkJCWlmIChl
dmVudCkgew0KPiAgIAkJCQkvKiBldmVudCBoYXMgb3ZlcmZsb3dlZCAqLw0KPiAtCQkJCWZvdW5k
ID0gMTsNCj4gICAJCQkJcmVjb3JkX2FuZF9yZXN0YXJ0KGV2ZW50LCB2YWwsIHJlZ3MpOw0KPiAg
IAkJCX0gZWxzZSB7DQo+ICAgCQkJCS8qDQo+IEBAIC02NzIsMTEgKzY3MCwxMyBAQCBzdGF0aWMg
dm9pZCBwZXJmX2V2ZW50X2ludGVycnVwdChzdHJ1Y3QgcHRfcmVncyAqcmVncykNCj4gICAJaXN5
bmMoKTsNCj4gICB9DQo+ICAgDQo+IC12b2lkIGh3X3BlcmZfZXZlbnRfc2V0dXAoaW50IGNwdSkN
Cj4gK3N0YXRpYyBpbnQgZnNsX2VtYl9wbXVfcHJlcGFyZV9jcHUodW5zaWduZWQgaW50IGNwdSkN
Cj4gICB7DQo+ICAgCXN0cnVjdCBjcHVfaHdfZXZlbnRzICpjcHVodyA9ICZwZXJfY3B1KGNwdV9o
d19ldmVudHMsIGNwdSk7DQo+ICAgDQo+ICAgCW1lbXNldChjcHVodywgMCwgc2l6ZW9mKCpjcHVo
dykpOw0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiAgIGludCByZWdpc3Rlcl9m
c2xfZW1iX3BtdShzdHJ1Y3QgZnNsX2VtYl9wbXUgKnBtdSkNCj4gQEAgLTY4OSw2ICs2ODksOCBA
QCBpbnQgcmVnaXN0ZXJfZnNsX2VtYl9wbXUoc3RydWN0IGZzbF9lbWJfcG11ICpwbXUpDQo+ICAg
CQlwbXUtPm5hbWUpOw0KPiAgIA0KPiAgIAlwZXJmX3BtdV9yZWdpc3RlcigmZnNsX2VtYl9wbXUs
ICJjcHUiLCBQRVJGX1RZUEVfUkFXKTsNCj4gKwljcHVocF9zZXR1cF9zdGF0ZShDUFVIUF9QRVJG
X1BPV0VSLCAicGVyZi9wb3dlcnBjOnByZXBhcmUiLA0KPiArCQkJICBmc2xfZW1iX3BtdV9wcmVw
YXJlX2NwdSwgTlVMTCk7DQo+ICAgDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCg==
