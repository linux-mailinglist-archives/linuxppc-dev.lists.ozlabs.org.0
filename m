Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4F5429D4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 07:42:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT4LP4ry3z300b
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 16:42:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=40.107.9.57;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-eopbgr90057.outbound.protection.outlook.com [40.107.9.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT4Kw6tfDz2yNC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 16:41:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dT44n+P1wW24zIVsnU1DiDVwk9ZJDRrsi9H2/481quPrpqWrrHZHXuYaDAc/cIHNT9bxElKKRp1tsX5xY1fpw2MrFw44aJeHdmvQCSS+0/Pna9Fnl9/QhUkzzUK4fA0s3Oq009kWiAV86AuFcPJD9JNGuc7bMOz/HJinGZ2ZAQgJcqgTXXfLgEBDYz6OkYGAjFkiAuyd0YJfXquqrkaxtOQdm6HJnSHbEGE2rWfbsBlGxN1J8QvwKBky8bz1+n2yUoZd55vnnkU1ifDO3tQFYrzuw1oKHLpTXAxPCWr8PP5jiNXwx1KkoycKoqofevALEX8BL7v7LF+2auKZQkxCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/uY0lZWgTaxTZ03Y6+b1l5/28Nn6qefBtOxrvgOu/0=;
 b=LyJ+SX+kjh9ofuOlHR5jrrSXCshOdh6GMwqPrrBXKnYuguGO+pO7FkBCtvU73p8/4gYNZsVhinwOJ4dnub2Q2iZRHhlN7doIo9Ne1sGmIfWiH4ybVjIH3Y8k51eHEyUrOBvcHhQLLvB5ll6tRPJcUOzM5vamnz6wIcr+9NFvUvDJCE5PdXmlNEePCJuHIkwZhA4/PiZY5fn6LMgrNi9i/wsj7oBFfzQGDEp8mNFlPGoqJDOWKUMLUeuV3I4j2cjh6+g8oR53G6C/NkRtpy0MYjMB2g29IwQwigj73c9RzuA2dTK4JLGLwKWf48RFPNjql1Q2kDWrGNoavZbCytizlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 05:41:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d97f:2916:ef40:fdf8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d97f:2916:ef40:fdf8%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 05:41:35 +0000
From: LEROY Christophe <christophe.leroy@csgroup.eu>
To: Liu Shixin <liushixin2@huawei.com>, Marco Elver <elver@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc: don't select KFENCE on platform PPC_FSL_BOOK3E
Thread-Topic: [PATCH] powerpc: don't select KFENCE on platform PPC_FSL_BOOK3E
Thread-Index: AQHXsQ1UAojAYaqX4EqoNp6w2rV7q6vOsviAgABCjYA=
Date: Tue, 12 Oct 2021 05:41:34 +0000
Message-ID: <7260f4a3-80c1-d59b-ae03-9c95b4073d6c@csgroup.eu>
References: <20210924063927.1341241-1-liushixin2@huawei.com>
 <77ce95e4-1af1-6536-5f0c-a573c648801a@huawei.com>
In-Reply-To: <77ce95e4-1af1-6536-5f0c-a573c648801a@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb0e8389-872c-46c9-9be3-08d98d42f3f6
x-ms-traffictypediagnostic: MR2P264MB0146:
x-microsoft-antispam-prvs: <MR2P264MB0146878BEDACFF186BA865BDEDB69@MR2P264MB0146.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cPQKzcNvADcYXdeEZ2gin11dQxkLGr+pGq8DZcRjlJVFtsUtgOm+/dPrs4AqLBpFGKoUznjXRGA7p+g8+gEdEdSxNemY6tzNmiEFi8Ja/imT6prpB0srsolNag6kgbrjhm9QyOY0Rxymm+hzrghk+EhXlWZNDhdCIRxuGgqSG84YAbAp6GUA2lYx2nmwssdPSi/CAWdx+sZiGb0haLAENcZZ2LRBQ1B9RaewMrQ6E7TeDuLD/lWguPny5v/p67sDdwF+2tik56PHcMs2BMFhE1xiueTWrTX2IA0Rrr0Lov+elxnaMs7hvKmfIryNBNFi8rp27buRRypMd4/UkaFmgCIpRA4RZD1w61hS/4H+bDIvN3OhfvV+QVTPzUUpYY/k9ZP+Q/PlnUx2jCeFJeJjqj2uwSnqHguJYvwLnA2AtAXQi/Tw832tZZCpdV35+WXTo0q98BnJxRzUi4+btZBBliUmuKdYN5RGVyiMPOzAhBumtdDpBSCYeR0JKdZWHx0k+TIWdsAUSEZKU3+gsLFVANeoHm68m7v+xJ4QV/AJ1RU9FbkUUS9vpL6J62ntQJOLxiZDLfwsBwwynegilD4n5q5RYRW1YDQjxAjEHIA+qa9pApRCvA9Ep0UQK4RJnw/eqqo83jsomIufSetCff9tYJ5IhzQRohSuZ8NbrwT1stoEXQreGBAxeL+An9Uvyj09EpuWDBnhHQZ/Y5+GbC1E3HD7elOY91MpXGcQebdefqvZX2Oou6+5otHuvakhvXDT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(110136005)(38100700002)(5660300002)(6486002)(31686004)(53546011)(6506007)(54906003)(122000001)(4326008)(8676002)(86362001)(508600001)(186003)(26005)(316002)(38070700005)(2616005)(6512007)(76116006)(8936002)(31696002)(71200400001)(66946007)(83380400001)(91956017)(2906002)(45080400002)(36756003)(64756008)(66446008)(66556008)(66476007)(66574015)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWM2ZTA0eFNLQ2hlUUlZTHpQblBiRUdBQVkzS0EyaVVTdzFTQzN2RmdoVFV5?=
 =?utf-8?B?Tkh2RXZEcFpXWURCUXlBenJJS2ZjSGpiditINFVVZjVMS1orNFRCZkoyVW5D?=
 =?utf-8?B?R2U2cm9MQUlyNWUxbERFZE9MMEE4Sy9EeVRqa2drcTBBeUYyanNEYWg0bVZk?=
 =?utf-8?B?Nk90UTlXMEV5V0V0Z1hwS1lhWW9wZCs4NGhmUXRlSXdvd1hwVWtnY1RxNU0z?=
 =?utf-8?B?Ui81NDVETXhHZDdseStxck56MEtBOGZnWGErMSt4N1Nxa3FEZWdlNldmMHdC?=
 =?utf-8?B?NGdDTlhSMGVQL2pDWTNIVjJ0Snh6cWFKSG93S1Byek9Ebzl6OWRTL2xGcWhQ?=
 =?utf-8?B?bk5hVU5sRjFYT3E1MDJpZXN5aS93ZFNRaXVTV1RobndXRENSd0NMWVZVNDVs?=
 =?utf-8?B?VG42N0VBTXFja1V4YlVBQWtJUXhtYjFJMjBqWlI1WDlSRWd1VzBrUkJDYnYz?=
 =?utf-8?B?TVBPeU5ISXIvRkZRMFhTNWlaMVBEa1IxblcyZWgyNXFzZk94bVVlMWdqTHQv?=
 =?utf-8?B?QklJcUVZalFFWG1zcGpsMHREV04zcXdiZnRQZmE4dDBsNGpCaUpTOExLYk1L?=
 =?utf-8?B?TjQ4RUw5SDVKemQ2QXNlMVZnTGEwdXBHbld4SllyT1NUTEp6WTRJK1NSUE4y?=
 =?utf-8?B?M2RJTEtCMjkwc1VReGlXU1h6cVkwMk5CL2hlOFBvaDlCQVNiUWkvZ3lsdGZq?=
 =?utf-8?B?RmVZY1loYXo0ZDVoVzhjUHVQNlZwNzUwb0JOd2YyK1Z5UldVU2x3MTYvZGFa?=
 =?utf-8?B?ZVVWdGlrTlJhbGJac0NDaHdLQjIyM0VVcVMyendMQi92a1lsT1RSYldHZm8v?=
 =?utf-8?B?N0VxQ091bzVEWllVYjU2eWdWV05jdHBDK2tpd2pXZk42VTdCU2ZYN2wxa1o4?=
 =?utf-8?B?MEFxb215REJxQTYvbTBRRDhNV2dOTEIvZmxKV2Fia0UwdUtrcjZldTBrQkhm?=
 =?utf-8?B?cWE3VlU0VkszeTRzYUt3ZjU3YVRSTi9jMmpSUzVwemR6cTlFRThuSlM0eXlE?=
 =?utf-8?B?LzJaYVZtVUFteHBPSkFRS2JHenBsUWdTa281L1VaUUtINkp0VVJidUl5RTNW?=
 =?utf-8?B?VmVVUGVSTXFZL0swZUhROGlMWGJjRkxjNjJzRFRGODQvK3RZeS9IekUwMlVW?=
 =?utf-8?B?Ri9HenFuZHFsMy9XRWNiZkxPNVgwSHl6K2VIUlFoSTFuZGVNV0JaY3Mzckhz?=
 =?utf-8?B?RHhjRmpESmdBdlVDQnY2aEkrOERucHNLZ0RiaVlIQkxZb2xXSW5VWmI4ZWZI?=
 =?utf-8?B?cjJTUTRVUHhRMmRvWEZISDIrckhRU2lncktOWW5IYitKdWgvVTh1WUJOaFFw?=
 =?utf-8?B?K0h1eTV6RjJ2VGt1a1lDcGlwWmFzVzU1bkJEdGV6dmlWdmZSMmFpSmNXV1Zn?=
 =?utf-8?B?bW5oY01TWU51UXd4Sm4rRzZRQThyTDR2UkdlWWNwYTByeDZJV0NLR2ZQWVJD?=
 =?utf-8?B?ZFA5VmUyZ0kzTzB1S09pTmt2Vm1iL3pZcUMxcUhkNTltZHd1dW0za0ZlQWRu?=
 =?utf-8?B?R1hTQnVNMjdyTVRTU0lxOWsvU09qQW5kZEJFN2RqdjUxZ3NsTktjQjE5QXUy?=
 =?utf-8?B?bThGM3VidzRtUjk1bk1Pd0QwdG10RC9uanEraU94RjdHbmlYT20wL0pTNDJ0?=
 =?utf-8?B?RllOVFl4RHlMcklBdHJycjRHbzFqVlZMcnc0RnpVTHpXZXFiMFF4cGNIaE1Z?=
 =?utf-8?B?VDNWRXRnMi9NZS9VNUFlUEl3Rzl4UGpCZGI1azFWYTl1cmhsZ3pPaldYRWlW?=
 =?utf-8?Q?fWL/6BxG2u61Ryc5W1/iBEXLqMklNUyWn6Ysv8U?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <593981B0298E8B4CA9A41A3881AC0ABD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0e8389-872c-46c9-9be3-08d98d42f3f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 05:41:34.8963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNKRICo4mIYieFjIryCpGYj2XW657CC+TrxOr/19KGCwEO1AW3e0hkxU55hSbHrhleUm6Axg8RW1JZNLMsoIN4O/CEDl6NEngDhlJK4d1Lc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0146
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzEwLzIwMjEgw6AgMDM6NDMsIExpdSBTaGl4aW4gYSDDqWNyaXTCoDoNCj4ga2lu
ZGx5IHBpbmcuDQoNCkhpDQoNCkJhc2VkIG9uIHRoZSBkaXNjdXNzaW9uIHdlIGhhZCwgdGhpcyBw
YXRjaCBpcyBub3QgZW5vdWdoLiBJdCBzaG91bGQgYXQgDQpsZWFzdCBhbHNvIGRlLWFjdGl2YXRl
IERFQlVHX1BBR0VBTExPQywNCg0KSG93ZXZlciBJJ20gbG9va2luZyBhdCBmaXhpbmcgaXQgdGhl
IG90aGVyIHdheSByb3VuZC4gR2l2ZSBtZSBvbmUgd2VlayANCm9yIHR3by4NCg0KQ2hyaXN0b3Bo
ZQ0KDQo+IA0KPiANCj4gT24gMjAyMS85LzI0IDE0OjM5LCBMaXUgU2hpeGluIHdyb3RlOg0KPj4g
T24gcGxhdGZvcm0gUFBDX0ZTTF9CT09LM0UsIGFsbCBsb3dtZW0gaXMgbWFuYWdlZCBieSB0bGJj
YW0uIFRoYXQgbWVhbnMNCj4+IHdlIGRpZG4ndCByZWFsbHkgbWFwIHRoZSBrZmVuY2UgcG9vbCB3
aXRoIHBhZ2UgZ3JhbnVsYXJpdHkuIFRoZXJlZm9yZSwNCj4+IGlmIEtGRU5DRSBpcyBlbmFibGVk
LCB0aGUgc3lzdGVtIHdpbGwgaGl0IHRoZSBmb2xsb3dpbmcgcGFuaWM6DQo+Pg0KPj4gICAgICBC
VUc6IEtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ugb24gcmVhZCBhdCAweDAwMDAwMDAw
DQo+PiAgICAgIEZhdWx0aW5nIGluc3RydWN0aW9uIGFkZHJlc3M6IDB4YzAxZGU1OTgNCj4+ICAg
ICAgT29wczogS2VybmVsIGFjY2VzcyBvZiBiYWQgYXJlYSwgc2lnOiAxMSBbIzFdDQo+PiAgICAg
IEJFIFBBR0VfU0laRT00SyBTTVAgTlJfQ1BVUz00IE1QQzg1NDQgRFMNCj4+ICAgICAgRHVtcGlu
ZyBmdHJhY2UgYnVmZmVyOg0KPj4gICAgICAgICAoZnRyYWNlIGJ1ZmZlciBlbXB0eSkNCj4+ICAg
ICAgTW9kdWxlcyBsaW5rZWQgaW46DQo+PiAgICAgIENQVTogMCBQSUQ6IDAgQ29tbTogc3dhcHBl
ci8wIE5vdCB0YWludGVkIDUuMTIuMC1yYzMrICMyOTgNCj4+ICAgICAgTklQOiAgYzAxZGU1OTgg
TFI6IGMwOGFlOWM0IENUUjogMDAwMDAwMDANCj4+ICAgICAgUkVHUzogYzBiNGJlYTAgVFJBUDog
MDMwMCAgIE5vdCB0YWludGVkICAoNS4xMi4wLXJjMyspDQo+PiAgICAgIE1TUjogIDAwMDIxMDAw
IDxDRSxNRT4gIENSOiAyNDAwMDIyOCAgWEVSOiAyMDAwMDAwMA0KPj4gICAgICBERUFSOiAwMDAw
MDAwMCBFU1I6IDAwMDAwMDAwDQo+PiAgICAgIEdQUjAwOiBjMDhhZTljNCBjMGI0YmY2MCBjMGFk
NjRlMCBlZjcyMDAwMCAwMDAyMTAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDIwMA0KPj4gICAg
ICBHUFIwODogYzBhZDUwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDQgMDAwMDAwMDAgMDA4
ZmJiMzAgMDAwMDAwMDAgMDAwMDAwMDANCj4+ICAgICAgR1BSMTY6IDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwIDAwMDAwMDAwIGMwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwDQo+
PiAgICAgIEdQUjI0OiBjMDhjYTAwNCBjMDhjYTAwNCBjMGI2YTBlMCBjMGI2MDAwMCBjMGI1OGYw
MCBjMDg1MDAwMCBjMDhjYTAwMCBlZjcyMDAwMA0KPj4gICAgICBOSVAgW2MwMWRlNTk4XSBrZmVu
Y2VfcHJvdGVjdCsweDQ0LzB4NmMNCj4+ICAgICAgTFIgW2MwOGFlOWM0XSBrZmVuY2VfaW5pdCsw
eGZjLzB4MmE0DQo+PiAgICAgIENhbGwgVHJhY2U6DQo+PiAgICAgIFtjMGI0YmY2MF0gW2VmZmZl
MTYwXSAweGVmZmZlMTYwICh1bnJlbGlhYmxlKQ0KPj4gICAgICBbYzBiNGJmNzBdIFtjMDhhZTlj
NF0ga2ZlbmNlX2luaXQrMHhmYy8weDJhNA0KPj4gICAgICBbYzBiNGJmYjBdIFtjMDg5NGQzY10g
c3RhcnRfa2VybmVsKzB4M2JjLzB4NTc0DQo+PiAgICAgIFtjMGI0YmZmMF0gW2MwMDAwNDcwXSBz
ZXRfaXZvcisweDE0Yy8weDE4OA0KPj4gICAgICBJbnN0cnVjdGlvbiBkdW1wOg0KPj4gICAgICA3
YzA4MDJhNiA4MTA5ZDU5NCA1NDZhNjUzYSA5MDAxMDAxNCA1NDYzMDAyNiAzOTIwMDAwMCA3ZDQ4
NTAyZSAyYzBhMDAwMA0KPj4gICAgICA0MTgyMDAxMCA1NTRhMDAyNiA1NDY5YjUzYSA3ZDI5NTIx
NCA8ODE0OTAwMDA+IDM4ODMxMDAwIDU1NGEwMDNjIDkxNDkwMDAwDQo+PiAgICAgIHJhbmRvbTog
Z2V0X3JhbmRvbV9ieXRlcyBjYWxsZWQgZnJvbSBwcmludF9vb3BzX2VuZF9tYXJrZXIrMHg0MC8w
eDc4IHdpdGggY3JuZ19pbml0PTANCj4+ICAgICAgLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAw
MDAwMCBdLS0tDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTGl1IFNoaXhpbiA8bGl1c2hpeGluMkBo
dWF3ZWkuY29tPg0KPj4gLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnIHwgMiArLQ0KPj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0K
Pj4gaW5kZXggZDQ2ZGIwYmZiOTk4Li5jZmZkNTdiY2I1ZTQgMTAwNjQ0DQo+PiAtLS0gYS9hcmNo
L3Bvd2VycGMvS2NvbmZpZw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4+IEBAIC0x
ODUsNyArMTg1LDcgQEAgY29uZmlnIFBQQw0KPj4gICAJc2VsZWN0IEhBVkVfQVJDSF9LQVNBTgkJ
CWlmIFBQQzMyICYmIFBQQ19QQUdFX1NISUZUIDw9IDE0DQo+PiAgIAlzZWxlY3QgSEFWRV9BUkNI
X0tBU0FOX1ZNQUxMT0MJCWlmIFBQQzMyICYmIFBQQ19QQUdFX1NISUZUIDw9IDE0DQo+PiAgIAlz
ZWxlY3QgSEFWRV9BUkNIX0tHREINCj4+IC0Jc2VsZWN0IEhBVkVfQVJDSF9LRkVOQ0UJCQlpZiBQ
UEMzMg0KPj4gKwlzZWxlY3QgSEFWRV9BUkNIX0tGRU5DRQkJCWlmIFBQQzMyICYmICFQUENfRlNM
X0JPT0szRQ0KPj4gICAJc2VsZWN0IEhBVkVfQVJDSF9NTUFQX1JORF9CSVRTDQo+PiAgIAlzZWxl
Y3QgSEFWRV9BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTCWlmIENPTVBBVA0KPj4gICAJc2VsZWN0
IEhBVkVfQVJDSF9OVlJBTV9PUFMNCj4g
