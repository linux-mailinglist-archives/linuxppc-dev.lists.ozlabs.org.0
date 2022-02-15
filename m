Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 029B74B6635
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 09:34:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyZBG4DLDz3cTJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 19:33:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61f;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyZ9j49q3z3bT0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 19:33:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsPGvz75HXbgU+UKgSbnQE+19g6aVwMaqQ+RzBNAEGff62gs6PdA8cY2US3cBeFvvOkryXpTTnKyB218X1DDjD9aaLxbjDmdqnfHswbUPCdpV8pxsLThHWmZjohbGATzyBrRit/4zCKT/UUHsSrUKrF9qKconk0iSDOgSjKWlyIWqWSaHyyPiYvlo6vHHYh8X+qQZiJCUPwq0DYaWGe8cfvq3SI7CAG+9P5k7vpguC5y/zi0DiBNgzJXPTUD9ECj5JtGemNb2Y0imNU20eoBqRjdih0nTCAuscsDHZK5EAOj1Npeqc7DHvabnlQFxHBODJDSzBLCWDUyqUdg5ZSJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrckqNSeE29e3Yq5+/cQhv4/KsZXD0Xc31e3XFfHpl8=;
 b=foOVuG3ElOvz6DNsgZg/zfW0HBFj9FFveJ/UJQbRfZb/ZR5zP1zZSrceZWT+p+TiRrv3nmPTkkkOrYJ5HJ2iC3b/zxf44pMWisC9KX4v7AgiwrIgY3rXQECHKIdtWkwFfvaGNGHc1lwnUSpaDYs1N7+1oqHL0Gebp/9yZa/cONfGFon9KFZ6OoDiDFHhdDAIOriF1MS1iqF795+ONuiX3raA6/OT0suUIsxtnoXPfDwWYH4s+R9D8NCV031e1qkhTsTGQOPdAuaa2ssgvt/ZfqjtNFNrt42dNdcr7q8ftjEjS4TKUdDTwKNlCedFQRRH0MJo9HmnPH0xhcOolS7uXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2192.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:193::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 08:33:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%9]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 08:33:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Jiri Kosina
 <jikos@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Ingo Molnar
 <mingo@redhat.com>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>
Subject: Re: [PATCH v2 12/13] powerpc/ftrace: Prepare ftrace_64_mprofile.S for
 reuse by PPC32
Thread-Topic: [PATCH v2 12/13] powerpc/ftrace: Prepare ftrace_64_mprofile.S
 for reuse by PPC32
Thread-Index: AQHX9cAL+q8e/kpRIUG40cd4NXnolKyTq5wAgAD2MgA=
Date: Tue, 15 Feb 2022 08:33:07 +0000
Message-ID: <758cd183-b2cf-3cab-7fcb-6fa485997209@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <82a732915dc71ee766e31809350939331944006d.1640017960.git.christophe.leroy@csgroup.eu>
 <1644860537.hyunv1mld0.naveen@linux.ibm.com>
In-Reply-To: <1644860537.hyunv1mld0.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1736773-1f3f-4b62-539e-08d9f05dcabe
x-ms-traffictypediagnostic: PR1P264MB2192:EE_
x-microsoft-antispam-prvs: <PR1P264MB2192F4751E037AA53AD89954ED349@PR1P264MB2192.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3UYZ9kBI+iFvVSAH+o3qdOzss7ySCwSGPMPsM2sasuYvLmAsrADGzesJMG4uGVRq4TY4lqUnFuCpmSMD4GXTBx/86f3FKTHcsSzC3LpQzXYdN+5JIRbgRgDHG/jmYQykNj6Cl26mDzZ4N6fdXYgA+UIveUfW0QYjrXtjMyyM7XDR9i0aJWK7XI0n63a5QoHsd8CW+izXQYq7QMbuh8tbRa8TPMd/i7TxWzumYMTBQzY+TXwk9BoEoT381aMgPb14NTEHNmFtQqaXwaWd03T9abGoNZWT30sGKHghjGaw+5MybkXNMwm6ngNQlP4hVVbkEvjmmZIHHgiawa/cRmSa6IsyLgFOkzzyOe89FFrXS/xYPoDhESSsGQ0XGrvYzP2ooT6wawhUmG+Aut130OjclA/tg/SBFrQxQdQQfJhpZVrEEiCf1+wKoWJzrg3jZl2k/FZA3pJAaek7SfP4LEGFmjjtgfw7wwIwYHqc7ttwgsfrHvTDr9FGEakwc4gMsNGecDj4eo9ZKNOSbw/0lvwBwU5MPPH66TaY6MatFq1d1KTtdteZudqkcHeZSXebZNmMptvU6BPe+44vFd6wWfoUGvYpDO6PVtjz1TromWn6mW3WgjuWZHMqL6fyZu2JVtzWZkYBF+KvYJJsp2Ng//Wbm4bB/NTRTNVm2QPzoAcHxewwSEZ7Sizo7M9fS5SdRw44nLOmtQiBMDiWdB8avi82JzY/mZ7ya0b13qTGSkCYn3DPkhNQNWGYvG4vdwnCeu7TzaTIDfjvIiSedkCkwGWQUQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(44832011)(4744005)(7416002)(6512007)(2616005)(31686004)(5660300002)(36756003)(186003)(26005)(8936002)(38100700002)(71200400001)(2906002)(83380400001)(6506007)(38070700005)(66556008)(76116006)(8676002)(91956017)(4326008)(66476007)(66946007)(6486002)(66446008)(508600001)(64756008)(86362001)(122000001)(31696002)(110136005)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0JURERmVUcra3RFVHlXajZHbXlHK0t1MXFzT1JVOXpiVHpjdnkvU3ZEbVRU?=
 =?utf-8?B?MS9rQ1hXejdWaEhWdTAvYmJtcm1YbHZVbFlXWk5NQ2FtK2J1cWNsc29FZ3Nk?=
 =?utf-8?B?Ni9KR3NNdGNxaWhXNTdHaTYyL0x4RTFmYUVpUDdjQjREVVNiTll6Mk1sd0Vk?=
 =?utf-8?B?SGdrZUVBbVRIUjFLc1FBakpzY1IyZWZ4NkJtRkhWa1hFdEJ3QlBnTXBGaldP?=
 =?utf-8?B?cDV0dFJEeGdyWmlIMmpLK0FKcTA4bk1vNFk1Y0FCU3Z0b1VBaHFYNGk4UXZG?=
 =?utf-8?B?OVBLUDZ5ZFNEMElycjlLcDBYVzFYZ0ZWT2NiYTZSWU9EMVVIS1o5Umg1bFJn?=
 =?utf-8?B?dHk2TTNpSnU0ZXdaaUV4ZHZ6SlFUWVdpSmlwZzBJWk5wODdDeUpPZForQ1Ni?=
 =?utf-8?B?aEgrcVlOaDVBdGVDcWRJTnZaQVkzUnRuN0ZVWEtyY25tU1E3eUN1Mlc1eGdK?=
 =?utf-8?B?OExlZ1ZSL1hvQk1qejF6eW42Y29id0w4YUlqc1lqN1RhamQvcXdwenRhSmlL?=
 =?utf-8?B?WnFaV1I2SUlwZ1hiZ21WaFBsWE1JbTk3bEtWay83M1RjVDFHdTVabWR1d3Fy?=
 =?utf-8?B?UFZJdXdZejJMQjVPTlA3emdRY2wzdFJ5MENhZm1kSVVBYlhkODU5OTdlbHNR?=
 =?utf-8?B?UmdmckljZGUwTG5Oc2xTSkVLbXVYYTgvcTRpV1F5NWcrL2NMZUhIaEhPSjk2?=
 =?utf-8?B?VE12MVJzdEhUWVlwRlVJM0toVmx6Z1BEa1dNdFp2YVpwYzlDSEZPNysrd2V5?=
 =?utf-8?B?bU5EYXdaeEZZbFJGMmJqU3RHN0JZdU04VFpnYXl5WGxKZjVXb0hFcHFDczVP?=
 =?utf-8?B?dUpxSFNoMkRRS2tiNmR3UnpQN0FwWUpwUmRLNFBMSVAyMWI4cVpDcW9YcVhm?=
 =?utf-8?B?anFZL3htYTFtVjc1MTgzdlFzeVQvYkl5SnFURDExUVpJU01DUmJrTHIwenB3?=
 =?utf-8?B?REtwRTJnS21MVlltVzc1RS8vS2ErUWxhMTJvTVk5UTE1WXp0Rm9rVnZjblpW?=
 =?utf-8?B?YTVCOG9NalM0SFdiSThLdlNtOG1hY0MzU0ZqbVFCRS9ZdW14dVF4TDZiV0Y5?=
 =?utf-8?B?K3k1VjZTbmhOR1ZWV3RpVUl2YUgrZmZhYzVPQ294b3NJb3lGSXU0TEZtVVNR?=
 =?utf-8?B?VlVKek9ORUVEQnpBWEhzUlZTa2t5MTZOdis4dllMcFZYNW5oZC9tSHMwcFdI?=
 =?utf-8?B?a0JWeVFUMGorajdTWC94L1dXaTdhb3JzUWliVTVkSnBjQlZURkZLYkE4RXFJ?=
 =?utf-8?B?Sk4vWmx1RExmbHo0bDBnSS85QTdWUXBNelgwSTY1ZXFjWER3VncxVzA1YXFC?=
 =?utf-8?B?REhpelN6UUUweVUxYkpGYWxLSjhOcGQwQnRaamVqQXNNNzdVK3czbEErVitG?=
 =?utf-8?B?MEwzN3ZsejlGcWNzcWI0c214OWM1Qk5iUC9najFWMlNEL3lMSXpwck9jaEJ5?=
 =?utf-8?B?UVc4YTRuM1YrZEE1UU9nckRhWmJ5S2JQd3dTdk9weTZzcXpoTzlNYjRSR3JE?=
 =?utf-8?B?NUlZS2RPcDVTbWVMdjZTdkE1Vktabkt3cHFnYVptY1Zaa1VNeGFKbVYvTHFT?=
 =?utf-8?B?SmV1SjlUQ0VDejRqZ3FFOU12UDRFVmJqemJlZ2l6TndtQnZsbWJiL0RXN1hU?=
 =?utf-8?B?MHdZMkxvL2VGV2JlNFJzei9vOFM5VnJ1VXJrczhieUxhZHUrN2ZhZzgyVjZ4?=
 =?utf-8?B?bUE1Y2xvQW5SZmV3VGpYS0lVMmhMWkNlRHp6Tzlud2xtM3p1cng0NDl4bE1y?=
 =?utf-8?B?RjBJTm9PVVdVYlFsOER1SWxiU3Q3cmU3cTg5UGFWb3gzNTY0blFxYUNMalJk?=
 =?utf-8?B?eHhlMVZmM1NlODc0VHRUZGdOQ3Nyenk3U28rR29zbXJyZHhNNUlkaVN5cGJ5?=
 =?utf-8?B?b1ZMdGhzNFdyTjlCS3BXZmhXZCszQzJNYktiZllML1BIM0MzY1A1Smx0UjZn?=
 =?utf-8?B?dXR2VHlHdjYvTGY2Tkd0RERQRHBMRG5US0cwd0VXNXN3SnVKc3BGU2JLWWl5?=
 =?utf-8?B?eGZndk01TGxuVWZJK1dsZGhkOVhQVGdGb1h4WFd3MzE5cm1rWVg3QzkvMXhw?=
 =?utf-8?B?a0FMOVVPbHlRQXFibXlWNGxRRUdmcUpkbkJSV3VxcGpEK3dIeTJUMmNSbW5L?=
 =?utf-8?B?bzFkZnh2ckZRTXc3V2Z4b0pQLzZEVTN3MWRMM0FONlFHVXJaOEJOUkJQa2VN?=
 =?utf-8?B?c3lHZ3dEcHpxK1J2UWxaVUdySlRpRTRzU1lFcUhLSzVZUWUzWmVmdFJ6MkZO?=
 =?utf-8?Q?41qNj7Tu2DQTIKO3mcyxqWa+OZLIRG7kVm3wSMu4AY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49EF578B8568E54EBB291F6C9A3D27D4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d1736773-1f3f-4b62-539e-08d9f05dcabe
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 08:33:07.2937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shIF8ffVMXuY/9vEyevd3CkNJsyqxcBOrLOw+g5t2XryCaqL1gZovO+6FaYrpe2vjXl6bmXox0qWkNAdAsvX9f370oyGeHuiT+UC9SFuTBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2192
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
Cc: "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzAyLzIwMjIgw6AgMTg6NTEsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IFBQQzY0IG1wcm9maWxlIHZlcnNpb25zIGFuZCBQ
UEMzMiBhcmUgdmVyeSBzaW1pbGFyLg0KPj4NCj4+IE1vZGlmeSBQUEM2NCB2ZXJzaW9uIHNvIHRo
YXQgaWYgY2FuIGJlIHJldXNlZCBmb3IgUFBDMzIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4gLS0tDQo+PiDC
oC4uLi9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2VfNjRfbXByb2ZpbGUuUyB8IDczICsrKysr
KysrKysrKystLS0tLS0NCj4+IMKgMSBmaWxlIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDIy
IGRlbGV0aW9ucygtKQ0KPiANCj4gV2hpbGUgSSBhZ3JlZSB0aGF0IHBwYzMyIGFuZCAtbXByb2Zp
bGUta2VybmVsIGZ0cmFjZSBjb2RlIGFyZSB2ZXJ5IA0KPiBzaW1pbGFyLCBJIHRoaW5rIHRoaXMg
cGF0Y2ggYWRkcyB3YXkgdG9vIG1hbnkgI2lmZGVmcy4gSU1ITywgdGhpcw0KPiBtYWtlcyB0aGUg
cmVzdWx0YW50IGNvZGUgcXVpdGUgZGlmZmljdWx0IHRvIGZvbGxvdy4NCg0KT2ssIEkgY2FuIGlu
dHJvZHVjZSBzb21lIEdBUyBtYWNyb3MgZm9yIGEgZmV3IG9mIHRoZW0gaW4gYSBmb2xsb3d1cCBw
YXRjaC4NCg0KQ2hyaXN0b3BoZQ==
