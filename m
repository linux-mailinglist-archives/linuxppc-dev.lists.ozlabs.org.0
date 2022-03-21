Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AB94E22AF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:57:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMT5Z233Jz3bfQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:57:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::619;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::619])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMT533gLGz30DB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:56:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGAIWl3vyqFGbOGNZtiwm+StJA0aAtInG4zf2P9x9LRS8Xzl2IWzf64mMqQwLCCrDuHUJVAiQkLEfOCXSuJuC2L7X2+9jS04OKe6kDd3Sc0dXnEjp4msFSieeUQinf1IzhNfq4cQpeFr72he7ND0qGZqtLj6g+0GHSnOVWTXmFq3taB2r+eJeBKZCcM0xdN3FPfG4wqBIhpER3XO0OmrJ58jjfOILkyyy8X5sogDveECUFLcm6LOpo+9UGsc0zhkBw/RGOYE2rPVL+Aqp35j//ljSI+mMxw241Sqgg7AYHXpbNNdlPYElkJfAifZLEq+llm2nwi24m3bOpLfSjK6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ4lpHHilCQlKbhraD9hdWMcktIaZ4HHCVlgMr2y7fU=;
 b=N+RA3BkXZsE/48I5D+zWd7SkpWLDRy9DeKL48VsIo3EbGbsBjYXGl1rfsklSuipnuG+A8WpeaA0woLeP5BoYclwUMEfDxkyjXNSBYaU9rIDhMoSYv+Qdd69uxMBiZcQEh1eV/TkiwKj1GaaASiAmw7l8IbrJJEJu+su8RilMB2zdQGgX/8p7STiLKAIhMmdpCD53OxBribomRrzvnqfGMUeGSBx7M9HapiPI6cL/7w9x36iWHFjEJxeEdbIwJD7//bcwXCepYBpWwCziNKcalJyaQYYZaw7713NZ4xHtRC+UDzU/UeEbFNmw87d50pJu7GIcVoNJz7gUs3+VvywrNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB4369.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 08:56:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.022; Mon, 21 Mar 2022
 08:56:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Finn Thain <fthain@linux-m68k.org>
Subject: Re: [PATCH] macintosh/via-pmu: Fix compiler warnings when
 CONFIG_PROC_FS is disabled
Thread-Topic: [PATCH] macintosh/via-pmu: Fix compiler warnings when
 CONFIG_PROC_FS is disabled
Thread-Index: AQHYO2NbGWH8CI3mhU+PVN1BAmrQRKzJZuMAgAAfJACAAASugIAAAagA
Date: Mon, 21 Mar 2022 08:56:36 +0000
Message-ID: <073c34e0-a016-cf70-1deb-be286da94bde@csgroup.eu>
References: <650f5577599a701fdd632cdd469a9cea9788cdf3.1647674431.git.fthain@linux-m68k.org>
 <bb6d3131-3c46-654f-d2a0-6d57bb8cbfbf@csgroup.eu>
 <39f63c1b-5a1b-8c8e-5991-813d3d3c2576@linux-m68k.org>
 <7b16264-dfef-414-8195-87c14a89fb40@linux-m68k.org>
In-Reply-To: <7b16264-dfef-414-8195-87c14a89fb40@linux-m68k.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd8f136c-682b-4dae-1821-08da0b18b4a2
x-ms-traffictypediagnostic: MR1P264MB4369:EE_
x-microsoft-antispam-prvs: <MR1P264MB43693E364D739352F9BCA3D5ED169@MR1P264MB4369.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LieT2NUB6yL7ft44WvPzyEIMhmRZTtwapCr2gcdqyf0hGB+9ODXXq8Ig5zmfaWbr5tQpIC+J262syEyMvJ/7fGL0b/QrtZ497cFLHYzk007mIhKjmNQpF0mA3MkHPtS0cLBtfbELZZgKTHIt7NatpAYvTvHS7OWjjXq5zKIpqfuf/QckgEdGoi2sDzL2w/xfadtWYARVQTakf84CMl8pbvBbZoCQ+dss4EUtumRClwL0RyXvXd4jm5z7sGHgib4G+JGC0gaDOY9ddr/ZfI0GZSJPIl3JJS4at8jGpR3xSZZeYajMnBoWF7pFiiXyTERmQhm02WYYhdhbwA/SaYUNNfzRFSQgG5kpeH+vIS0vLS2I3HSSrGQ9t1Vd50yyFZ15+nB/Oaky8KLcseueh7JbybDMazr9BAptE9Z1ngEt+eMbd4jB7L5xSRz6jv8+HlhbOsujibs1lqu5ReqlZIkR/JBp6Ic19+ZAzCNG5oDEuDVclwYUnkgwHKFQIyFe/mAjEupIy0UWmOusWKSOtzGlubi4jzeeKy5BPaXcuRMWgnZR6RUheArzW5yb3JqKpnmOYlCW3NI6tpb1iAyT5yE83p4GzmYvLaBgHY3LmQsBKD5q/EFhoRNUdRZZ23jR248RrJ+Uru9Z9ALu5qI3yU75sNxzyKG8j/L2l2qB+J7HipnVBNKmcq+oqcFm/rkO7KlWIDtETdnK17oFt44mqFUBMERmw0KRb7omS2KbK/9pZ9b8LxtP4SUsAkMGbI+eX7MLexV6ziZP0Y+eZ5oNHV2+hA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(64756008)(66446008)(91956017)(8676002)(4326008)(71200400001)(38070700005)(5660300002)(8936002)(44832011)(83380400001)(36756003)(2616005)(66556008)(66476007)(26005)(186003)(66946007)(76116006)(66574015)(31686004)(6506007)(31696002)(6512007)(86362001)(2906002)(122000001)(6916009)(316002)(54906003)(6486002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmFDWFdYL1prc2hva2N2VTFLYUVHcHdoRTJhL3FWMkVONDc0N1hiUXR5M0dW?=
 =?utf-8?B?bko1YWR5K2N1RzR0aysxWUtrWVh1U2xZR2dzRktuSnhkK3hQZWNUWE52b1hs?=
 =?utf-8?B?ZysyVUFXVDNNaGVJWDZUeVFxMEdQMWVPUGhCQXI1c1RZb21hVHdHRXhJbGxM?=
 =?utf-8?B?dGlSYVFKSU1xbmsxUUh3Zml6T0R0RVl3Y1dqejdqRHdDWCtGbzFVcXZicEI1?=
 =?utf-8?B?dG40WFBmYVlmR0pEKzFBOXZOOFN6KzlQQ3NkQUZkd3VpY2RHd21SUmdKNjFB?=
 =?utf-8?B?NzFqZk1Sd0xzc2h2NjBxWGhndW5tcEVpVDgzU0xZbm15TUVvdExiaFJLSWhi?=
 =?utf-8?B?dHNZRkdETFVUVDlDZXRVTndMTEZLczlFMXZiOC9OV2hEeHhnU3BpQVh2ZUlr?=
 =?utf-8?B?cjE0K0xMRzRWNlp3WmVFT29XOVVES0x6NDlqcFVBMFZteUdHdlZ0Vk80ZjB6?=
 =?utf-8?B?cmpYdEFKdVY4UW1PZFVSMmplOEY3d3VORDdjeExFeFA1UytZTXA0VHk2MFNC?=
 =?utf-8?B?ZUh3bHB6TFlxbm5rdk12ZXdPT3VJcUVyQmtRRjh3dWxMWkhtOGpQUTRtK05r?=
 =?utf-8?B?Qkt1RHRqc2hTY21EQWRhTlFSWFN3ckdRSnlWMUVPU2Z5TnRsU21NNGxnTSt2?=
 =?utf-8?B?d045Zm5KMkxVczNieXhvVUxDcEIxN1BMSjZSb2xVb3BRVnQxL1FRZGd1MUtJ?=
 =?utf-8?B?U1JkMkhHdlNOOU5QYnB0anB4akhxQWtKNlVxdUpFMlpmc3ZyTGlSRkJ5Y2sy?=
 =?utf-8?B?YnhUenRseGJyVFJVUXVlZjZueEZlalZGVU1oMnBMYUdXNzZIekhuMGoyMi9H?=
 =?utf-8?B?d0dxSitOeG0xTXJ1ZmhzOVZpc3ZTVWtKK3RxSWNnN1F0M3BsMmlueDNvbk11?=
 =?utf-8?B?eG5MNWR0Smw2V1EwU2xHNGhEa3praWVaWU03RzlsN0JBWi9mNjVaYzRWMXlY?=
 =?utf-8?B?cjZnRjQzNkNUU3B3VHptTkhPUk9rMlFyeGhabEZJRS9nTUMzY1B1Y1BKeFUw?=
 =?utf-8?B?VThEUVoxZjZBYTJ5MUtFQ215Q2F5RnpkbjhiN3NRYVllQ2hYdzZKdEFNQjQr?=
 =?utf-8?B?VWlWa3JKc2F3dHE3WXVaaW85bEdsWklFMnhHUkpidmdIcGJXTVhvRHB2YkVx?=
 =?utf-8?B?ejZTZnNJeVBtNU1xdUpkTXlLUkxicko0UCs2aEJka0FjZmNDVkNMamVzMFM2?=
 =?utf-8?B?eFBzN3JNUFk1Y3NWckk4QnIrVnNKY1BqZ0FRYXVEZC9BNHR6YXdUMFNSYm1Z?=
 =?utf-8?B?ZkZZSUhvMENDYStxVjRuWHUzYzVpM01ZSGpOd3A1cjlSR3BvK0xCR1NQZHZI?=
 =?utf-8?B?eE9FbGRiRlBsWVEvZk1jcjVPbnovZmhIaHlSeUhtTmQ3Y09HSkZ4Zzd3S1dp?=
 =?utf-8?B?dityY2JGSGlvQ2tJYk1iUG1IRnVGcnhMaUNZQWFTK0N1aEdtaUVsbW9NcnJF?=
 =?utf-8?B?akRPTXhtcldrUVBDU05RTGtPS0w3eTE2Q05XQVNtcGxoUUE2eW5IYlpQYlcy?=
 =?utf-8?B?Tmc0VUYxMVpZcERBU2RtUUNYZk5SUGVnb0EyZjl0NklNY1JXcGpySlVkblZx?=
 =?utf-8?B?b0JocGp6TXlXU1lWR0pQSUxOK0tBVjQ2dEZzWCsxNFNFZ3lTL2xGVVRSeC9M?=
 =?utf-8?B?QUZHdUM1U2E0RXIzbWY4aUdrV2RqZUdrWVgrbi9rUXN1c2Q5NHJSUFA1NTNT?=
 =?utf-8?B?ZXFseUF0L2pFeERldFAxUnZ4R2QvZEk4ck5ld0xBTHVRSC9TMmNsNTI2SnZ6?=
 =?utf-8?B?TmFMN0N5V2ZRVjhCaGFJSUttVlloVnRaL3h1SkovQ01kU2ttTGdWWkhRQkc1?=
 =?utf-8?B?RWRSN0pWSW54cFJXK0t6bVpHSnMxbGpOdHRtT2Rqa0RPQlg2ZkhLTWViR0kx?=
 =?utf-8?B?eHBrejNndFI4Z0UzNlFlN2E4MGtOaWhsUFBNbVlaSEcvTnRjVEQ3N1FtR0Q5?=
 =?utf-8?B?UFhwbTEvTFF5UGswMkRYZkoxdVdXcUQzbm5pYURWTVBRbnJlVjBxSmxLMWpQ?=
 =?utf-8?Q?vUwLX/V4pOa9cWpQ2PmK+pImYuGNfE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5477E6C06B07884FA6C30E54C4E8B704@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dd8f136c-682b-4dae-1821-08da0b18b4a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 08:56:36.3520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IdFI8Ww+qLrOElPbJmENwrNyQ/t8Q9OkSKk25ev4KzQz9aXzXgbGQsVBOCnft/sOM+GmF29rDpIxJoiL7i8ELGHMZ8kSWMsabxAsROpOuSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB4369
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAzLzIwMjIgw6AgMDk6NTAsIEZpbm4gVGhhaW4gYSDDqWNyaXTCoDoNCj4gSGkg
Q2hyaXN0b3BoZSwNCj4gDQo+IE9uIE1vbiwgMjEgTWFyIDIwMjIsIEZpbm4gVGhhaW4gd3JvdGU6
DQo+IA0KPj4gT24gTW9uLCAyMSBNYXIgMjAyMiwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+
DQo+Pj4gTGUgMTkvMDMvMjAyMiDDoCAwODoyMCwgRmlubiBUaGFpbiBhIMOpY3JpdMKgOg0KPj4+
PiBkcml2ZXJzL21hY2ludG9zaC92aWEtcG11LmM6ODk3OjEyOiB3YXJuaW5nOiAncG11X2JhdHRl
cnlfcHJvY19zaG93JyBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dDQo+
Pj4+ICAgIHN0YXRpYyBpbnQgcG11X2JhdHRlcnlfcHJvY19zaG93KHN0cnVjdCBzZXFfZmlsZSAq
bSwgdm9pZCAqdikNCj4+Pj4gICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+
Pj4gZHJpdmVycy9tYWNpbnRvc2gvdmlhLXBtdS5jOjg3MToxMjogd2FybmluZzogJ3BtdV9pcnFz
dGF0c19wcm9jX3Nob3cnIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0N
Cj4+Pj4gICAgc3RhdGljIGludCBwbXVfaXJxc3RhdHNfcHJvY19zaG93KHN0cnVjdCBzZXFfZmls
ZSAqbSwgdm9pZCAqdikNCj4+Pj4gICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
DQo+Pj4+IGRyaXZlcnMvbWFjaW50b3NoL3ZpYS1wbXUuYzo4NjA6MTI6IHdhcm5pbmc6ICdwbXVf
aW5mb19wcm9jX3Nob3cnIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0N
Cj4+Pj4gICAgc3RhdGljIGludCBwbXVfaW5mb19wcm9jX3Nob3coc3RydWN0IHNlcV9maWxlICpt
LCB2b2lkICp2KQ0KPj4+PiAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fg0KPj4+Pg0K
Pj4+PiBSZWFycmFuZ2Ugc29tZSBjb2RlIGFuZCBhZGQgc29tZSAjaWZkZWZzIHRvIGF2b2lkIHVu
dXNlZCBjb2RlIHdhcm5pbmdzDQo+Pj4+IHdoZW4gQ09ORklHX1BST0NfRlMgaXMgZGlzYWJsZWQu
DQo+Pj4NCj4+PiBXaHkgbm90IGp1c3QgcHV0IHRob3NlIHRocmVlIGZ1bmN0aW9ucyBpbnNpZGUg
YW4gI2lmZGVmIENPTkZJR19QUk9DX0ZTID8NCj4+Pg0KPj4NCj4+IFlvdSdkIGdldCBhIHdhcm5p
bmcgYWJvdXQgdGhlIHByb3RvdHlwZXMgKCJkZWNsYXJlZCBzdGF0aWMgYnV0IG5ldmVyDQo+PiBk
ZWZpbmVkIikuIFJhdGhlciB0aGFuIGFkZCBhbiBpZmRlZiBhcm91bmQgdGhlIHByb3RvdHlwZXMg
YXMgd2VsbCwgSQ0KPj4ganVzdCByZW9yZGVyZWQgdGhpbmdzIGEgbGl0dGxlLg0KPiANCj4gT29w
cywgSSB3YXMgZm9yZ2V0dGluZyB0aGF0IEkgYWxzbyBhZGRlZCBhbiBpZmRlZiBhcm91bmQgdGhl
IG5ldw0KPiBwcm90b3R5cGUuDQo+IA0KPiBUaGUgc2ltcGxlc3Qgc29sdXRpb24gaXMgcHJvYmFi
bHkgdGhlIHBhdGNoIGJlbG93LCBhcyBpdCBiZXR0ZXIgZXhwbG9pdHMNCj4gdGhlIHN0dWJiZWQt
b3V0IHByb2NfKiBBUEkgaW4gaW5jbHVkZS9saW51eC9wcm9jX2ZzLmguDQo+IA0KPiBXYXMgdGhp
cyB3aGF0IHlvdSBoYWQgaW4gbWluZD8NCg0KWWVzIHRoYXQncyBleGFjdGx5IHdoYXQgSSBoYWQg
aW4gbWluZC4NCg0KVGhhbmtzDQpDaHJpc3RvcGhl
