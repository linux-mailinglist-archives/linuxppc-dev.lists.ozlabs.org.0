Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4B547F864
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 18:34:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMSbW4yZtz2ywb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 04:34:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60b;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::60b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMSb14hwLz2xXx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 04:34:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1KPHe3AKK15ITFgeiXfo9Au6ly2EjaXp17fwup6qJNTUKgkeoH6WtZ/01ANbfBLS6spQi8KiLE3DLn8GMzBf2ThvCUSluvpnIoxpaLNcixCDH+GzGJroaKkt3nsTmcro6lPHqahrvFePio1zt4xpqrwn2Vx17VD3SsP/k7sHbsw8PCZvVoC0MSeRQrIJSBuI2lcEeFk61mgvogpsO/kwyilWlLP0Ys0nANSrKLqzNRTjQwfQcWTrOWE/7ooVIdJltHpEnDYsFt2PkItI3IwU3q3DI3JndbExr6gdJwwkpbe1dhTbSdkdVaIdBu4NSAIA94VKMUgaUtjVWUCVFzatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKD2MtCLgxjA6wrALHGyvNMLFqh9k3UqeCEXn8jEcNU=;
 b=AP22JH1NJ2qpOs3u9GzRYjxpmrHXDT+yDBfAQhnfWntugoUFZEwyHaHLLIVItPw8fy3eq5OcSLItHM0cbEApHHhfn9ohuwSwaITn1X0SLMWYFjM/D9BeuJWBNLOKG76nkPCsZJMfmXKJ2qQGnKzGM1CKYHylYZxZsFaPkpb2hja6pGSN0Rn2K1MSIeEwNhvjLYMKr3wZj05Om94bRHHcQHt0idaXut0V/k/ZXACSbMcEHb0t01+7ulmF1fMNcBYRzUmLHwAqRy/ySKV4+68lrCoTFvlRFqmEUmq5r9FNY8/p/QHhWMDHOyENNZ/bnvkkOVlq15gYD+IxWuu9j09AOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2103.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.19; Sun, 26 Dec 2021 17:33:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%7]) with mapi id 15.20.4823.022; Sun, 26 Dec 2021
 17:33:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Kees Cook
 <keescook@chromium.org>, Laura Abbott <labbott@redhat.com>, Mark Rutland
 <mark.rutland@arm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew
 Morton <akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 2/2] mm: usercopy: Warn vmalloc/module address in
 check_heap_object()
Thread-Topic: [PATCH v2 2/2] mm: usercopy: Warn vmalloc/module address in
 check_heap_object()
Thread-Index: AQHX+Yaax4EzDidjbE22oF2KJiR+jqxFCmeA
Date: Sun, 26 Dec 2021 17:33:43 +0000
Message-ID: <fadd9754-ab85-63ec-4d6a-c6490adb5d94@csgroup.eu>
References: <20211225120621.13908-1-wangkefeng.wang@huawei.com>
 <20211225120621.13908-3-wangkefeng.wang@huawei.com>
In-Reply-To: <20211225120621.13908-3-wangkefeng.wang@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0b38a43-1962-4537-607f-08d9c895dd13
x-ms-traffictypediagnostic: MRZP264MB2103:EE_
x-microsoft-antispam-prvs: <MRZP264MB2103001630318FEE916018BFED419@MRZP264MB2103.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2i9EuwMtgMuPRCbPgtcrHITg+EoRfzbm+Xn5wRUyEVobaGwyLMfHeSbcPU35nQxGwz/NKwvjEmWwncsH7vq6CdRMEEoOMrKmgLbJBuY+xtjgchU5oUNAFYPj7sO3F0aTPYTthVes2wM7/PdBPyV3IGggbmW/GdxECv8h854bFwcnUXv9nq8/Vg9RHEA/LeaNZL9T29tQViPRZGFqHdXGCRde+XjVPJoXoYyhVyJOu7fHt1kIby0ut0px8VPDRtsqrFy73qxjG67r4tGhj0wlj7o+dh3v6PmWWFwJxgRqdsnYoQMENC5dGn6BU4JMdvwu7VyTnKK1+TgPisWPerxrlDkNAHNAMAtQGW2AtsT+mmrHIOISpPdyhOaOSnN/l7GjEmM+aSUzJvQGt+zBrKNk45AR8zfVg5vkdZJIrQ6yioPkNBkDhTfwAuC4g9xwvCjI2YKsstJDLPaZ6Xh1FXybK3ttjhImK7Hk1enECWP3BuTFTazonXFBD9izhLWVA/B39IDTb0przo9vH9Tolp0tVGMRMn1DbGT9Vsce+tA7KzzMHVOm1nR+SiiPz5fsvtgCCWE5+WaLBXB2Qe0J0484I3YMDnSz9JxiFmHN9/dvi0G3StTsebMiaNyud2pyKoN8Xpct90FWTkdhdH9PWE0qTCuzMNMDD2E1lkxvTvSTYJFyneDr5mvjNaggnyQGRxWykkIj1sYMgAG2uaty+N5+NS77DbEIpExDdctOFGqLN5jsfHDpphENnDyTRoxYZ7TXm/tEiqVQ8gw7h3xitaGU/qa0lRQxTgYU8WsTprkZaOc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(508600001)(8936002)(36756003)(38070700005)(6506007)(38100700002)(122000001)(8676002)(5660300002)(7416002)(44832011)(26005)(186003)(2616005)(86362001)(66574015)(66556008)(6512007)(2906002)(110136005)(316002)(83380400001)(71200400001)(66946007)(921005)(91956017)(66446008)(66476007)(6486002)(76116006)(64756008)(31686004)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzNFR1MvMEdEZmdCS0NudUNQWHlwZ2Y2bXFPUzJRZUpnUkhCdFJsYzcwODN1?=
 =?utf-8?B?ZUMyY0dvRG5vZCtzcWhsc1FDWWFLeW96VWtyWVNLUTZ6WEJQZ21rUmpReHZh?=
 =?utf-8?B?N2VMbzhnN0xTWVpBR0ljclRiWXdzcCtzQjRYRTMrckUrSWo2ZEp0azVxNnd1?=
 =?utf-8?B?cDJodHpjOGc1RklXL2pSN0FKTXV2NmUzeWhtaHBOUFBETFBQWThGMnlrWjF1?=
 =?utf-8?B?b2J1akdHMHJ1NVp6dCtZRjFIZHp4dHFxZjE5d003Ky8yOFRJbmtyZ2d5bWVG?=
 =?utf-8?B?aHEzRGNEMEtLQnpnQmE5K054dHZIaVZKR3FwVEZKMXdESTg4SnZMQnZEVWpF?=
 =?utf-8?B?SWJXN3A3MDNmU0JtOE4ycEk2VEgyUDVpZWxGYlZjN1orOXQxWnhjS2tIWXRG?=
 =?utf-8?B?Tmt0Yjcyd0pCZjkvOVRxbjlNN3pqZmZHdTh2cm9wRml3QXNhODhUem9WRGRm?=
 =?utf-8?B?UnBsQ1E3TTN3Q3c5blZrK0kvT2k1MnozVXo2UXhGWE1wQVZXNEFTc0pSbkt6?=
 =?utf-8?B?Qm9WcTRpR0xXY1RKT0RaT1BXQ29qd1Jwb0pzcWRqWldzdStvZnlVTUNWNDJG?=
 =?utf-8?B?RTdrakpRSzc1aWYvcGI3TDBWMlYwSzBQRlZISTFJNi9mYVRmMEQ0dkZ5S3JI?=
 =?utf-8?B?cmZkdE92dGdGT2lRRER3MmJKajc3QVlEQ1F0WlQxSXFwUXNHeU1pMmprdS9v?=
 =?utf-8?B?UnA1TE5sQ0s4VVNiQzhaK0tqdjZjaSttZU1jUlFoNS9GcGtWalQ3bHJZZnNk?=
 =?utf-8?B?cWI5QkpQZDdPK0lncFhNUEMrZHYzSjJIWklJaVkya1AyNDNxbENzUUppQVZ6?=
 =?utf-8?B?SUZXSWcrWEVxN1RYZHpTMTlRVU41Vnp0bEl4bGdIR04yOWhuZGloQ21IYmIv?=
 =?utf-8?B?aDdyRkJiYjRtZmNHZXcxZDh6dk4wd25ORE00ZldmSHJaa0E1cVpscSs4RlpO?=
 =?utf-8?B?WXhUQ2dLMkdYcldPVjVpRVFLdC90RTdBRE9uZkRTc21LV1NaTkhDYm0yRzdp?=
 =?utf-8?B?MzRLaWxudm5EOVo3cENFOGxiY1lxWVZyL3BwaUxlcG1KbTY3UEwwZm9waHpX?=
 =?utf-8?B?VXJxVURYTnk5NzNEemg1OHpWY2o1ejNaWk42RGcwbHlUU240N1V2Vi9XTSty?=
 =?utf-8?B?ZDFweENoajR2Yk5lOFcvUXFGYUhUMHFaeHY5WnpxOHZuS0R4a3djdUw2UTlz?=
 =?utf-8?B?ZE92MnlqTjU3VU5QRTVlOVlPRXBYMlUySEZ3WjgwaEdBUXZ6QzRicjh0Mjg4?=
 =?utf-8?B?NzA1Qm5qRVo1Qm9pVVFXMENwWW9ydGlnMlhZZHY4b2I3U3drK1MrRmRBUUYv?=
 =?utf-8?B?cVdIdXNPZWcrSXU2YWZpZzNZc3VZaFl0SXRVeS9QN1k3NTFmemc3eldnaVZz?=
 =?utf-8?B?aXR0OUZPQWtscGs5RXNweFFLOUVVUnkra0NSZTdBTFgyTFZnV3VBem5pNTVz?=
 =?utf-8?B?bjQ4bUxnVmw4Qkx1TUN0TThjc284cVY1Um5tZ1lMRExLTEJySU8rRGUxWk5H?=
 =?utf-8?B?bzErSFNCVG5MbzhnZEhVRGI2L0dtS0xxYVdvd21oNURGRUhtcFF2S1pMMTFL?=
 =?utf-8?B?Mm9jcVJmdzZGc29XenkrVzJSUExHVFE3dVNWTEo5VTJvSXlFYjFHeFRmeHE5?=
 =?utf-8?B?aXE5UUZCcnBDeEprSmxVeE91QytwS3JhUjBCQjJicEVmLy9aaFJ1b3VOTy9E?=
 =?utf-8?B?OFdhcTNacGNtMkF0Y1NGMld2K00rblNTT05oVS9GeUFCbGprNWVoMHNvQXJl?=
 =?utf-8?B?SXhMWGZBUXU2OUlPYW9NQzNwV1RJT0pvdm56MFN1ZXJWQUtSeFNkSzlZekZr?=
 =?utf-8?B?QldoM0dzbG5kaFFQNFNtbnZ1Z3JqQU5lTU1IR0NJdDduVy9JbTVFMXZ5SXMy?=
 =?utf-8?B?cXFWZXFLQnhQMXIzZjlzZmxVMkxDR28zUjdSem1xbm1aU3Vud1RUcEJ2VFRr?=
 =?utf-8?B?SnYzb2E4aEVwWk9KOHVlVE9FOUgrNTFKdHU5TGFldkVzT2JJNXppY25qSUZo?=
 =?utf-8?B?a3pJbEFnd1p4MTZyTHVILzFiRHBEanZRdXg0TzZ2cnJZWDd6eG5NeklkYWlG?=
 =?utf-8?B?RzUzekovZEVwNXdITHYra2ZOK0xXWktaWjBSYlgxNGJLNGRxL0F6YXVLNVUy?=
 =?utf-8?B?bThsWHd0U2VtSldPWUZ3L1VHZTBYbENCTTM5d3luL2lqME1pbFd5T2t3ZHR5?=
 =?utf-8?B?c2VPaXZqRlZ0QjdMWHZ2Tmtuc3pjZ0dLL1BiQk9ELzcwUXZQSkUxUEVSM25i?=
 =?utf-8?Q?Iyyfftll5PUY4zD2zF44iyNxYI8liVhhuP725eOmAM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E228DBFC644B25468ED2E7752CB16991@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b38a43-1962-4537-607f-08d9c895dd13
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2021 17:33:43.3572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XbExp6F9fEIzW4CXot3q3AOOHrqT1NvZ6D2WR0i4HOEid/MO3Cz5GAcQgl+fsXDZ2UG0PbuQlPjrH6PacEA9/RCSZqhazZIXMWfqWjoJ8go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2103
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzEyLzIwMjEgw6AgMTM6MDYsIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IHZp
cnRfYWRkcl92YWxpZCgpIGNvdWxkIGJlIGluc3VmZmljaWVudCB0byB2YWxpZGF0ZSB0aGUgdmly
dCBhZGRyDQo+IG9uIHNvbWUgYXJjaGl0ZWN0dXJlLCB3aGljaCBjb3VsZCBsZWFkIHRvIHBvdGVu
dGlhbCBCVUcgd2hpY2ggaGFzDQo+IGJlZW4gZm91bmQgb24gYXJtNjQvcG93ZXJwYzY0Lg0KPiAN
Cj4gTGV0J3MgYWRkIFdBUk5fT04gdG8gY2hlY2sgaWYgdGhlIHZpcnQgYWRkciBpcyBwYXNzZWQg
dmlydF9hZGRyX3ZhbGlkKCkNCj4gYnV0IGlzIGEgdm1hbGxvYy9tb2R1bGUgYWRkcmVzcy4NCg0K
SSB0aGluayB0aGF0J3MgdGhlIHJlc3BvbnNpYmlsaXR5IG9mIHRoZSBhcmNoaXRlY3R1cmUgYW5k
IGRvZXNuJ3QgDQpkZXNlcnZlIGEgV0FSTl9PTigpIGluIGdlbmVyaWMgY29kZS4NCg0KVGhlIGdl
bmVyaWMgY29kZSBjYW5ub3QgY2hlY2sgYWxsIHdoYXQgYXJjaGl0ZWN0dXJlcyBkbyB3cm9uZy4N
Cg0KRXZlbnR1YWxseSB5b3UgY2FuIGRvIHNvbWUgdGVzdGluZyBhdCBzdGFydHVwLCBtYXliZSB3
aXRoIA0KQ09ORklHX0RFQlVHX1ZNX1BHVEFCTEUsIGJ1dCBJIGRvbid0IHRoaW5rIHdlIHNob3Vs
ZCBoYXZlIHN1Y2ggDQp2ZXJpZmljYXRpb24gaW4gZnVuY3Rpb25zIGxpa2UgY2hlY2tfaGVhcF9v
YmplY3QoKQ0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53
YW5nQGh1YXdlaS5jb20+DQo+IC0tLQ0KPiAgIG1tL3VzZXJjb3B5LmMgfCAyICsrDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21tL3VzZXJj
b3B5LmMgYi9tbS91c2VyY29weS5jDQo+IGluZGV4IGIzZGUzYzRlZWZiYS4uY2U4M2UwYjEzN2Rk
IDEwMDY0NA0KPiAtLS0gYS9tbS91c2VyY29weS5jDQo+ICsrKyBiL21tL3VzZXJjb3B5LmMNCj4g
QEAgLTIyOCw2ICsyMjgsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgY2hlY2tfaGVhcF9vYmplY3Qo
Y29uc3Qgdm9pZCAqcHRyLCB1bnNpZ25lZCBsb25nIG4sDQo+ICAgCWlmICghdmlydF9hZGRyX3Zh
bGlkKHB0cikpDQo+ICAgCQlyZXR1cm47DQo+ICAgDQo+ICsJV0FSTl9PTl9PTkNFKGlzX3ZtYWxs
b2Nfb3JfbW9kdWxlX2FkZHIocHRyKSk7DQo+ICsNCj4gICAJLyoNCj4gICAJICogV2hlbiBDT05G
SUdfSElHSE1FTT15LCBrbWFwX3RvX3BhZ2UoKSB3aWxsIGdpdmUgZWl0aGVyIHRoZQ0KPiAgIAkg
KiBoaWdobWVtIHBhZ2Ugb3IgZmFsbGJhY2sgdG8gdmlydF90b19wYWdlKCkuIFRoZSBmb2xsb3dp
bmc=
