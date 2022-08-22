Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E34A59C172
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 16:15:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBDsG0XGFz3dpN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 00:15:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=HzBwsZZC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.81; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=HzBwsZZC;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120081.outbound.protection.outlook.com [40.107.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBDrK5tZhz3c3L
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 00:14:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTMk19U0Jn3ij9XtaCbHNq5gKoMLH/Y4+in/ELl93TsxRorGFlDvxBRUM2UhcHIyg5wbh9d82Xt+1Bl2RT5jpIJL7uuz4rw4VeNB25U6cu0WiUG4Dfk7Xu2s7ebqqa0oFYoKyun9hka91+qZ5Pwu/WZlW93kdmvR7npAqqPT0/+r8LvNtjh265NfrjEfErxXCqaDjAbeMq3BgZ2xRkTSjRFqMKY3YlZUEEiyN76oF3uxgBYdlGU2RAvv5Pi9HaUcyIi45TFbs67+xquVXomPerhtjHDkurutIj9grLtQvz7Y+XzHb14IRFd42CJ+QB+ccn5ZcqLB/PxC3f2NWs9YuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FylykrQMKjHLcQ6hgSKgQdDcnyM5jbf4MkN+G93Otw4=;
 b=eeb52VOsUUgAYEr97vK49biZ4fxcPyZy20SgzwrXZBNDhQW+KuDH6ex16igRQHDzMALrm8/OfbjxneL+GTTHoPMt5/+TVn+oMjXFn8qi7aGdHbCkrZFlAxx8G/XqC1FA+hp6oq2S19e24hNGOUsMNpRCqI/0ZAzUVSMTRJ3NF+dPKHhW+u+Y9sSdRtSMnK6PU8cCIB1/KQwGMGjl9ZcENp773mGth2p5ZhHZSAfdPhfsqVBjVcszD5gyU6kNKtbYP/iIa/pvnZ4zzzQgaorEBKhaCe9A96oNPoag/HP3aEYGQfjVrQEeCByJvpuNKYn3r3Traue1DooqYgPO65oB5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FylykrQMKjHLcQ6hgSKgQdDcnyM5jbf4MkN+G93Otw4=;
 b=HzBwsZZC1fyLpg+iOu7ANw10AlgTJt8kgBi+XfadSM+xc5QTd3BA8gDb2Z6Pqni8lbidg99au+jF7VAPneWDlxqLwXE1PARaRVbBRdsfTcpgEvSpCeVWmbo1nOJIIwc0dggxk4bjzroxHlGPgYONOt4uCkR1iBsuNbGrEkgYJ2lxjJi+xnkizRhVNjT0sT9ygNIBadw/jptXexeZg18taEDF+w4NepeX29jSoj+J+bcgRTYRGEKDRCAgrPAhzlcarkQssqDEqmb25bG7K87WImrztOxd1PMedmzk/Bz5VLz1aTymVAdzyhynjRirt5JtOrkJM7p7MxWUtQoUkBo9FA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB4194.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:27::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Mon, 22 Aug
 2022 14:14:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 14:14:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, =?utf-8?B?UGFsaSBSb2jDoXI=?=
	<pali@kernel.org>
Subject: Re: [PATCH] powerpc: Add support for early debugging via Serial 16550
 console
Thread-Topic: [PATCH] powerpc: Add support for early debugging via Serial
 16550 console
Thread-Index: AQHYtBCQTPmF1chLTkiejFUksD5Awq22z30AgAABRgCAAAFCAIAEKLmA
Date: Mon, 22 Aug 2022 14:14:06 +0000
Message-ID: <b433ccf2-2e13-9084-6425-e0d522d18900@csgroup.eu>
References: <20220819211254.22192-1-pali@kernel.org>
 <35c0ff6a-387d-3c01-66b3-f659cfe67c2a@infradead.org>
 <20220819223848.lvxakjjzfdjvyqgu@pali>
 <ed703de5-2260-8cd5-4e28-2f7986b407d5@infradead.org>
In-Reply-To: <ed703de5-2260-8cd5-4e28-2f7986b407d5@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1227fbc7-18d4-4c36-d907-08da84489316
x-ms-traffictypediagnostic: MR1P264MB4194:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Rs95GvgbKoYFMZJDxbIL2cv7ntygie6eaLfrOYlGUyMbWANqCAD1EPmLU+wHRC2KBPOxcxT57f//G5jqlPV+y7ogukRkeVGIPV2fLIsZco5oWl7wztEpx4ML5iWP1o4v1p3hKeBpcX3pQ6zNiT+5SJF0RdNDMuwNomZUH1kNkp4Zl6BCSBhm7w5q/4b5nwKE2vTkqjFkZ8lSer+eRDa5VPycRHhqRqYUUPRuljcdI8Y5vJuXslQj80G4905FGIgI2YEovjAc8azUr2C+WS8JdVtOEABmSzSOvi/kwg7iFZ4cGTgwPSKIf+ZxIHXWuxAxXh7By8RdMM6IWDSND22jAv5D44ryzMhDD1ItzWZpc8Lb/bZIYlnHOOppFYTqSC5ty6ERFh8H213rR/Npjzrg/33iF6PMRTF52Ov6krgAqr6lwZSNxUwnuYa9CcKsSC5ZS1tkCsJrrgxIrms/xUFAZZ0djAHdleAj3O/fYQIfusd04oyrHbC+z82uXLmqP5zTcg9AIe9bpdWYH1ngFlIPbnGYWVYYk5yvOwLopUEeWGvXlSS9FCpS/MOg5hAWx/x6FsIOdyIeuyVtCqPopiJVz+CVDxMJsqJHMMz02UF60di1weNS54ChI9QtFhEpp8mtW2hei/pg+2dxQXlFPqLRchCL69qdS6MRp9t+badvpRslLBnhZaj4Z05BAbR3/cFs2j/XpSEqZ8ZTf7d9OyZCw9e+xcCXAh+nRUPb7h2wx3CEpybMT+hUqolS1mNv87BX0KF0URqFr23emtTVvZ7Jd8SB7cuiOqCBXqX2eXuwjzfquqPQYxUZ6X09KPuZahxpukyOuCil9R86zLv49a5c1MCxQ2g4jmYP6xxc7XcUofQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39850400004)(136003)(346002)(396003)(366004)(66556008)(38100700002)(66476007)(66446008)(64756008)(8676002)(66946007)(4326008)(31686004)(31696002)(76116006)(86362001)(110136005)(54906003)(91956017)(36756003)(122000001)(66574015)(186003)(6512007)(26005)(83380400001)(41300700001)(6486002)(38070700005)(966005)(478600001)(71200400001)(316002)(2906002)(2616005)(53546011)(6506007)(44832011)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NHZZS1JkQ1ZiVWE3Y1lhUlBpc1IrWTNmN1hBL3pxdnMvVlVpMnFNeGlOeDh0?=
 =?utf-8?B?QTNWNkpJbjBQYyt4dDBHZFpIdEVpWmRERStDRU4wMzFmSnBIcVl2ODE3c3pY?=
 =?utf-8?B?eDFCZ05TNjUvYXoxZlE3UEgvaVkyLzNsSEhQR24vamhqYmhxZ2J1REJjQVdU?=
 =?utf-8?B?Z3d6OTVjcTNJZTMwYjY0RHVpeC9VTlBjT2I5QTVZMWtXRXlORmhsOGMxa2ZM?=
 =?utf-8?B?SEw1bEFUbjFNSG83MHJGZHFsYVNMUFVublVIbmIxanl2RDZlaHhWNDNFY05B?=
 =?utf-8?B?R2VqK1AwTTQzakJiS0d5VGlmc0l4cmpsV0xJUEs5aFBnVEk0andhQmlsRTUx?=
 =?utf-8?B?NUZlRWZGcUhqUXRnQTFBa1lvTTBlekZHYmovNTFlT0NOZFNycmdRS2RhNXhw?=
 =?utf-8?B?NlhuZytYbTZ4ZllTZ012SHFPQ29tbFJ2NUxIdlR0M1FzRWxGMDJBZzgrSHp0?=
 =?utf-8?B?cW5hZnJ3NU1KOGFsMlMzeVZTbnpHTWdzZldwa1BML3NJTnZBajRvWXFxclN0?=
 =?utf-8?B?b0E3RlAraWdMbU1McjRYWEFlYXVPRExpWW5nbmUzNDhsa2dKbEpWOGV2bWJk?=
 =?utf-8?B?ZjU5aUdCVERlWmhEM3IrTTkvdGQwL1NxS3pQckgybEM1K04wRnkvT0JKQXdl?=
 =?utf-8?B?QU5namhnVDB5YXdUWWdWWlpPcmpuVzBrcTZQb1AwaG84eDd6TUg1a1lDVjdp?=
 =?utf-8?B?SXZKNUllSHZzZGg0S0xBVGY4ZUZpd21wZUtSdVBvSHlpMHZoMUtLakl3RWw4?=
 =?utf-8?B?SXZ6dmMwR2MwVkZ5anpXcjBoeTVEMnc5S1U3ZUc1bE1BazFnN3hOVFczMHNt?=
 =?utf-8?B?aDNMZ3NvRGFVc08wQjNTQXJlMy9UZDF5ZjFpVkJlY21ySUE3bjNHSEtoL3N4?=
 =?utf-8?B?ckFOYUJLSTJqVHpvaGxxWmdDQWo0dXJwcGYwUmxWcndaQmcydE8ydGJKbmY2?=
 =?utf-8?B?a2diZUpUbjM4YWJIQUl4ZG5qaVV2T0tZUU05RUxuVmVSekpQdFhQTTV4VFBq?=
 =?utf-8?B?dVBsYjJESTNoRWRsUVpkVGdKTk1tL3BHRGdSek9FTnU0MmVqK3RqYUViU2dT?=
 =?utf-8?B?MFZVcjVKakdESTc3WE5ubVFZZEwwZjFaMmhXRHlyWi9lYXp5bFR4aXhlSWk4?=
 =?utf-8?B?RkltSGx5dTdhb3prQ0lkNk9OVVVWTkFUd3ZJbmExcGQxaGhFMmZvbmlnVFpa?=
 =?utf-8?B?TGxRUmhyUlFkNE9qaUxOSjBqWm04bUkweFh2Y0p1b3JvUzJPWEZPdGlLSVly?=
 =?utf-8?B?OXFLL0lqVVc1K1pMcWt6dmltZEZZWkpYYTQwVlNIL3RXMWM1b2R1WmtqZmxE?=
 =?utf-8?B?OTJFQU9BU1VoUVBTemdlVjJ2RVRpK0lFaTRVUVIxMkxWdnRSYms3VkNWZ1Bj?=
 =?utf-8?B?OUs2RDZVYTVSQU5ybUlSZWxaa2J3TFhwbnh0YktUa1VaWjZCTFlSdXBnRUx4?=
 =?utf-8?B?R2lZOFFVN3NBSW9KWUpzRUxGNFpKVG41dWdHcUNYUkxaYjN2TVVRUVg2c3h6?=
 =?utf-8?B?UEo3dTZ0UlJPSTNDUFlQYTF6MDVxVjI3dnA5eWdUQUI2VVpjTEhFWFNHNytq?=
 =?utf-8?B?SWhXZjF4cGFvVkNhNE03elZ6N0VqSUVJNVA3dXRYYXk2MitmTUFKYnRaZ29t?=
 =?utf-8?B?enYydy9sa01XUExyeTBmYzRLbzRTQldEeFB5M0tibzFmcnpOd1EzN0N3ZVBx?=
 =?utf-8?B?R280TzBqY204bXlycW1jbUE4cmdFR0FFZlRvSGNPZ0FOaGNhSzU3ZGNPeVYz?=
 =?utf-8?B?UDhML2RjM2pGSEtOMlFwaitaUjBRTnV0MmYwdDdOREp3MlFFS2N5ZUZPNlFm?=
 =?utf-8?B?dm9TWUdnMEdRclhqU0RtNU5QYmlCeGVIa0NGMFVMNEo4ZU9BSkF6dXc1ck1u?=
 =?utf-8?B?TnJhc0ptc0x2N3BDZENCMnowKy8rTGJCdENFeHJpNnZpdVJiRnhXN0N0VHk2?=
 =?utf-8?B?MFZneDRyYk1oem9aaVNjaHZaSjlYd2pQaWxuaDVwbDVYTS9uUC9wK3RPOEFv?=
 =?utf-8?B?ZTFxallPNVNMdjBDVDNiUGNhMEMrQkZEcUQyUjVUT2ZTZFZTbHVNRURzdlNy?=
 =?utf-8?B?MkF4NXRsMFMyUzRQMzZFQnZLRU5ZakU3U2daeWRIVEQ0dnZDMUpMOThDSjBy?=
 =?utf-8?B?MEJoOFpiSTl6SUs2VXdKSDIweVBhV01BK2x2OE9XeHVFRE1ScklxT0M1Smo5?=
 =?utf-8?Q?CQBvPy3amfoM02kWBNETvoc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AEF8C2057BEF44B95274F1D6076F92E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1227fbc7-18d4-4c36-d907-08da84489316
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 14:14:06.6450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EjRATyHI6fWHpAewzlJo41kpV3AXNGm9qgoc5FkNup9HNE3wQnlvAexTfjyKl5jg4WvsFhGy3tLu/vdxeRCVUeaWyysUWGmWSxvDM0P6Okc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB4194
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
Cc: Nick Child <nick.child@ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Paul Mackerras <paulus@samba.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA4LzIwMjIgw6AgMDA6NDMsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIDgvMTkvMjIgMTU6MzgsIFBhbGkgUm9ow6FyIHdyb3RlOg0KPj4gT24gRnJpZGF5
IDE5IEF1Z3VzdCAyMDIyIDE1OjM0OjE0IFJhbmR5IER1bmxhcCB3cm90ZToNCj4+PiBIaS0tDQo+
Pj4NCj4+PiBPbiA4LzE5LzIyIDE0OjEyLCBQYWxpIFJvaMOhciB3cm90ZToNCj4+Pj4gQ3VycmVu
dGx5IHBvd2VycGMgZWFybHkgZGVidWdnaW5nIGNvbnRhaW5zIGxvdCBvZiBwbGF0Zm9ybSBzcGVj
aWZpYw0KPj4+PiBvcHRpb25zLCBidXQgZG9lcyBub3Qgc3VwcG9ydCBzdGFuZGFyZCBVQVJUIC8g
c2VyaWFsIDE2NTUwIGNvbnNvbGUuDQo+Pj4+DQo+Pj4+IExhdGVyIGxlZ2FjeV9zZXJpYWwuYyBj
b2RlIHN1cHBvcnRzIHJlZ2lzdGVyaW5nIFVBUlQgYXMgZWFybHkgZGVidWcgY29uc29sZQ0KPj4+
PiBmcm9tIGRldmljZSB0cmVlIGJ1dCBpdCBpcyBub3QgZWFybHkgZHVyaW5nIGJvb3RpbmcsIGJ1
dCByYXRoZXIgbGF0ZXIgYWZ0ZXINCj4+Pj4gbWFjaGluZSBkZXNjcmlwdGlvbiBjb2RlIGZpbmlz
aGVzLg0KPj4+Pg0KPj4+PiBTbyBmb3IgcmVhbCBlYXJseSBkZWJ1Z2dpbmcgdmlhIFVBUlQgaXMg
Y3VycmVudCBjb2RlIHVuc3VpdGFibGUuDQo+Pj4+DQo+Pj4+IEFkZCBzdXBwb3J0IGZvciBuZXcg
ZWFybHkgZGVidWdnaW5nIG9wdGlvbiBDT05GSUdfUFBDX0VBUkxZX0RFQlVHXzE2NTUwDQo+Pj4+
IHdoaWNoIGVuYWJsZSBTZXJpYWwgMTY1NTAgY29uc29sZSBvbiBhZGRyZXNzIGRlZmluZWQgYnkg
bmV3IG9wdGlvbg0KPj4+PiBDT05GSUdfUFBDX0VBUkxZX0RFQlVHXzE2NTUwX1BIWVNBRERSIGFu
ZCBieSBzdHJpZGUgYnkgb3B0aW9uDQo+Pj4+IENPTkZJR19QUENfRUFSTFlfREVCVUdfMTY1NTBf
U1RSSURFLg0KPj4+Pg0KPj4+PiBXaXRoIHRoaXMgY2hhbmdlIGl0IGlzIHBvc3NpYmxlIHRvIGRl
YnVnIHBvd2VycGMgbWFjaGluZSBkZXNjcmlwdG9yIGNvZGUuDQo+Pj4+IEZvciBleGFtcGxlIHRo
aXMgZWFybHkgZGVidWdnaW5nIGNvZGUgY2FuIHByaW50IG9uIHNlcmlhbCBjb25zb2xlIGFsc28N
Cj4+Pj4gIk5vIHN1aXRhYmxlIG1hY2hpbmUgZGVzY3JpcHRpb24gZm91bmQiIGVycm9yIHdoaWNo
IGlzIGRvbmUgYmVmb3JlDQo+Pj4+IGxlZ2FjeV9zZXJpYWwuYyBjb2RlLg0KPj4+Pg0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPg0KPj4+PiAtLS0NCj4+
Pj4gVGVzdGVkIG9uIFAyMDIwIGJvYXJkLiBJdCBhbGxvd2VkIG1lIGRvIGRlYnVnIGFuZCBpbXBs
ZW1lbnQgdGhpcyBwYXRjaCBzZXJpZXM6DQo+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4cHBjLWRldi8yMDIyMDgxOTE5MTU1Ny4yODExNi0xLXBhbGlAa2VybmVsLm9yZy8NCj4+Pj4g
LS0tDQo+Pj4+ICAgYXJjaC9wb3dlcnBjL0tjb25maWcuZGVidWcgICAgICAgfCAxNCArKysrKysr
KysrKysrKw0KPj4+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS91ZGJnLmggIHwgIDEgKw0K
Pj4+PiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvdWRiZy5jICAgICAgIHwgIDIgKysNCj4+Pj4gICBh
cmNoL3Bvd2VycGMva2VybmVsL3VkYmdfMTY1NTAuYyB8IDMzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+Pj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspDQo+
Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZy5kZWJ1ZyBiL2FyY2gv
cG93ZXJwYy9LY29uZmlnLmRlYnVnDQo+Pj4+IGluZGV4IDlmMzYzYzE0M2Q4Ni4uYTRlN2Q5MGE0
NWQyIDEwMDY0NA0KPj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZy5kZWJ1Zw0KPj4+PiAr
KysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZy5kZWJ1Zw0KPj4+PiBAQCAtMjc2LDYgKzI3NiwxMSBA
QCBjb25maWcgUFBDX0VBUkxZX0RFQlVHX09QQUxfSFZTSQ0KPj4+PiAgIAkgIFNlbGVjdCB0aGlz
IHRvIGVuYWJsZSBlYXJseSBkZWJ1Z2dpbmcgZm9yIHRoZSBQb3dlck5WIHBsYXRmb3JtDQo+Pj4+
ICAgCSAgdXNpbmcgYW4gImh2c2kiIGNvbnNvbGUNCj4+Pj4gICANCj4+Pj4gK2NvbmZpZyBQUENf
RUFSTFlfREVCVUdfMTY1NTANCj4+Pj4gKwlib29sICJTZXJpYWwgMTY1NTAiDQo+Pj4+ICsJaGVs
cA0KPj4+PiArCSAgU2VsZWN0IHRoaXMgdG8gZW5hYmxlIGVhcmx5IGRlYnVnZ2luZyB2aWEgU2Vy
aWFsIDE2NTUwIGNvbnNvbGUNCj4+Pj4gKw0KPj4+PiAgIGNvbmZpZyBQUENfRUFSTFlfREVCVUdf
TUVNQ09OUw0KPj4+PiAgIAlib29sICJJbiBtZW1vcnkgY29uc29sZSINCj4+Pj4gICAJaGVscA0K
Pj4+PiBAQCAtMzU1LDYgKzM2MCwxNSBAQCBjb25maWcgUFBDX0VBUkxZX0RFQlVHX0NQTV9BRERS
DQo+Pj4+ICAgCSAgcGxhdGZvcm0gcHJvYmluZyBpcyBkb25lLCBhbGwgcGxhdGZvcm1zIHNlbGVj
dGVkIG11c3QNCj4+Pj4gICAJICBzaGFyZSB0aGUgc2FtZSBhZGRyZXNzLg0KPj4+PiAgIA0KPj4+
PiArY29uZmlnIFBQQ19FQVJMWV9ERUJVR18xNjU1MF9QSFlTQUREUg0KPj4+PiArCWhleCAiRWFy
bHkgZGVidWcgU2VyaWFsIDE2NTUwIHBoeXNpY2FsIGFkZHJlc3MiDQo+Pj4+ICsJZGVwZW5kcyBv
biBQUENfRUFSTFlfREVCVUdfMTY1NTANCj4+Pg0KPj4+IElzIHRoZXJlIGFueSBjaGFuY2UgdGhh
dCB5b3UgY291bGQgcHJvdmlkZSBhIGRlZmF1bHQgdmFsdWUgaGVyZQ0KPj4+IHNvIHRoYXQgJ21h
a2Ugb2xkZGVmY29uZmlnJyBkb2VzIG5vdCBlbmQgdXAgbGlrZSBpdCBkb2VzDQo+Pj4gd2l0aG91
dCBoYXZpbmcgYSBkZWZhdWx0IHZhbHVlPw0KPj4NCj4+IE5vLiBCZWNhdXNlIHRoZXJlIGlzIG5v
dCBhbnkgZGVmYXVsdCB2YWx1ZS4gUGh5c2ljYWwgYWRkcmVzcyBvZiAxNjU1MCBpcw0KPj4gaGFy
ZGx5IEhXIGRlcGVuZGVudC4gUG9zc2libHkgYWxzbyBib290bG9hZGVyIGRlcGVuZGVudCAoaWYg
aXQgY2FuIHJlbWFwDQo+PiBwZXJpcGhlcmFscyB0byBkaWZmZXJlbnQgcGh5c2ljYWwgYWRkcmVz
c2VzKS4NCj4+DQo+PiBVc2VyIF9oYXMgdG9fIHNwZWNpZnkgY29ycmVjdCBwaHlzaWNhbCBhZGRy
ZXNzIGlmIHdhbnQgdG8gdXNlIGVhcmx5DQo+PiBkZWJ1ZyAxNjU1MCBjb25zb2xlLg0KPiANCj4g
T0ssIHdlJ2xsIHNlZSBpZiBpdCBldmVyIGNhdXNlcyBhIHJlYWwgcHJvYmxlbSB0aGVuLi4uDQoN
Ckl0IGRvZXMsIGZvciBpbnN0YW5jZSB3aXRoIDgzeHgvbXBjODM2eF9yZGtfZGVmY29uZmlnDQoN
Cj4gDQo+Pj4gQ09ORklHX1BQQ19FQVJMWV9ERUJVR18xNjU1MD15DQo+Pj4gIyBDT05GSUdfUFBD
X0VBUkxZX0RFQlVHX01FTUNPTlMgaXMgbm90IHNldA0KPj4+IENPTkZJR19QUENfRUFSTFlfREVC
VUdfMTY1NTBfUEhZU0FERFI9DQo+Pj4gQ09ORklHX1BQQ19FQVJMWV9ERUJVR18xNjU1MF9TVFJJ
REU9MQ0KPj4+DQo+Pj4gd2hpY2ggdGhlbiBjYXVzZXMgYSBrY29uZmlnIHByb21wdCB3aGVuIHN0
YXJ0aW5nDQo+Pj4gdGhlIGJ1aWxkLi4uDQo+Pg0KPj4gQ2Fubm90IHdlIHNldCBzb21laG93IHRo
YXQgUFBDX0VBUkxZX0RFQlVHXzE2NTUwIHdvdWxkIGJlIGRpc2FibGVkIGJ5DQo+PiBkZWZhdWx0
IHdoZW4gdXBncmFkaW5nIGRlZmNvbmZpZz8NCj4gDQo+IERvbid0IGtub3cgYWJvdXQgdGhhdC4N
Cj4gDQo+IFRoYW5rcy4=
