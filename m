Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B444B6ECD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 15:28:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jyk3p15Lnz3cYf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 01:28:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::629;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jyk3J6dvtz3bWj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 01:28:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLMpQwWaQK1c/XCoVLJgAMsLbl4PgXLoNteyUw10ae1W2TJ3oRfogOiSLKT/TeDHdTKw+MRuqP1p/u9Mp72rCg390u8X7EBh/SUDIxuQLcwRXOs0FyvLknCc/Q96GFhB5UttmJemD2m+OR/XnB2Zl3RV/BI3E85r7CDMX3daXOOT7f37zWJz9qk1VX4ePhC8IjnQPuQtlcYTf88pmfEnJd5yyywLGK6T4I/see8GbcQDeYYeNprdOqrjEQha+Adssr5FqqYPMzG4ipffYZfo1PoXwYQBA6TG0lKGLSaX+lwaT5rm1loBTJB68EEEL7a3Qo74mdCC2BOTLhUGpdbw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIfRJTuZHZBBEvzj5vkflQC6xgjqpADsDB4AEJ1ID5M=;
 b=m6+JzFcg+UuVrtChfcVi/q6yDFjS5NUK+4a3RVBZ2ORbn6GeMY7foign6Qf/oZKcMj97vz/fkbaMxlBP7yjKWevTTBhGjDXRCgNO1Hlsc15HVWdxsXiy7pK5E0YOJAhhIDD81o6S0HaaJuotNr0Rp3r+kd4TfIz+kefUHq7gZVU17seOfUt5cB5uUNmG7K4ab2I6yfwxGkatMRcvdtciumjOKe+LYoP8u77PDyEgmrsGZfHtGt3FAILeh+RfZ4nzbE3Lbl37895VZR24+WCjfADvtrsVjAu9FZ+0HhI5Nc4gW5/txkMDxpZtmULmNaIL6pj1lvx9TehAoGJ8hcDa2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2778.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Tue, 15 Feb
 2022 14:28:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%9]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 14:28:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Jiri Kosina
 <jikos@kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Ingo Molnar
 <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Thread-Topic: [PATCH v2 09/13] powerpc/ftrace: Implement
 CONFIG_DYNAMIC_FTRACE_WITH_ARGS
Thread-Index: AQHX9cAEWTCD8cHnLE+YV5TEx6NNVqyTgraAgAEV/wCAADOPAIAAKmUAgAAOUwA=
Date: Tue, 15 Feb 2022 14:28:04 +0000
Message-ID: <6dc50f09-4d14-afa2-d2a1-34b72b880edf@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <5831f711a778fcd6eb51eb5898f1faae4378b35b.1640017960.git.christophe.leroy@csgroup.eu>
 <1644852011.qg7ud9elo2.naveen@linux.ibm.com>
 <1b28f52a-f8b7-6b5c-e726-feac4123517d@csgroup.eu>
 <875ypgo0f3.fsf@mpe.ellerman.id.au>
 <1644930705.g64na2kgvd.naveen@linux.ibm.com>
In-Reply-To: <1644930705.g64na2kgvd.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75ffa270-3123-4ec0-991c-08d9f08f6123
x-ms-traffictypediagnostic: MRZP264MB2778:EE_
x-microsoft-antispam-prvs: <MRZP264MB277830093DC7EA0D8F229FFEED349@MRZP264MB2778.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yjp8oHnVGQoenNh2dcbbM+Cp92aHp0BOCpj04/LxPy1ygnxAVCA//OCv59Ui3VeOO+emhB+nuR51yvcheFc5GSnIks3hTTyr6maOZSJ7RtpKQDXWSHnviGHHpmbKkI4DB79ridz7XipOj8x+4I6SvR+jwv7ZuMqdz/aIOOKxJpwDSeXIoHtS6Ye1yViCrTrKGAvuJ+GG+ssl7Ega3SCPP8tL9ZwVEUKmkRgPhf216AJW1PPNFalT8atVqAT5oe0g2W78eHAfmK4S1NLNFQuNTs/tpJaK/7vaArB0A1YKlXomm6obgdS3YhtpoEwCPLCwjG9fvOfaNb/hlrw2x2ByuQ+A6xIb36AZfUXtl34LT+3ZzqJ8QHlp53/r7zj6lk45xPW+qrfPG42TPSbqi2gBcPjn6WL9S+EaKBixsbH4ju4XFwAJs+GxPQPjoUVyYbcJDuPaVCeNo/0x7WHNFpCEpKLdEtJ22Cl8BXKIsbKnlWaledLbbCPbMS6vUSqsyr3Dy6w1P37AcCbEA0IgvUBuEXAAXJzDY9uM3fmP7zcrVe8SjUKisAxGc74PJqSwPWX2W4+XZ+tHu6RpsOChe4Yb2eqi4GVPC8vRwhuKOE0TfnxcaJpvj/ygSo9tTqDlJP1VHvNI3v5XCkw3l1GbMsa8X6mB1G8cefZuWP4cS7gHkEsRxFnLjOc/1s3qAG1VNyJRbjMDBPgBL2MlnmoBmoVZWOBwUkWnDP2cxj1+rhInQkgMgsb3nGx9rp9ERUEqbWsG+Ezmb5wUwPqx806Cv+tPAYDGZBlsU0KlV3qolr8BJoeNYY5wREjM2zle20m27j2hJe9nTB1AT5WIU0mL7KhVfzh1kgD0iIUKSSuV+ETQlR4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(5660300002)(316002)(66574015)(83380400001)(7416002)(8936002)(38070700005)(2906002)(66946007)(8676002)(76116006)(64756008)(91956017)(66476007)(66556008)(4326008)(66446008)(31696002)(110136005)(86362001)(44832011)(36756003)(6506007)(508600001)(2616005)(31686004)(186003)(26005)(6486002)(71200400001)(54906003)(966005)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXJobE5vMnVKYXY0TXZTVlhBQjN2cXBwbmFmTzFwdGV1NXVRdVFwd2pRd0V1?=
 =?utf-8?B?NXUrVTBLdUlYQit6d0ZZbEEzV3M5NHVOcmlTaDlOWXJoc2xJbVNHc2RobUVh?=
 =?utf-8?B?RUhOWjhOcnFhYjZPM3ZDU3dSYVhjWnBBL2xlVE1yeEsvaVdQL1FBN0xHZUtm?=
 =?utf-8?B?TjFyLzhxM1pab2tCUDMvUTZVQUZkek8vRHVYaitETjJCdHIrTzlhUFNSanVK?=
 =?utf-8?B?WWF6MytsMTJmWlJXODJHaURZczU3SjZ3bTJoMHpQeDZ4UThqS0pIZUViR0tr?=
 =?utf-8?B?YmlPTExWU2h0NWNPU0Q3amxJUlNsckdzU1VJWTRmUXIvV2JSRUxRbjgyNTE5?=
 =?utf-8?B?dllXNDBwOGRaaVhNUzF2dW15VUY0MlJvcExpTU9ySzZRZEQ5WmdWc2d1QTc1?=
 =?utf-8?B?WDAzeGlyN08xWml1blQzcFFYT3BMM25CQ3dyYkJhaGtFem9UYXFzSFBINElR?=
 =?utf-8?B?YWV0c0xqQTRPTkRPd3ZxakpjRnNxZCtYczNCb3k3ODFab0VndzgyUm5TQTND?=
 =?utf-8?B?cFZlVEVuY2F6cnpaTnlZMStwekd1VGhRVTFNd1N4c0JGMkNvNUNxUEZRNUd1?=
 =?utf-8?B?SFpuYld6cnRJQ09COGw0aThGOUFEaHV1SG8rWVk5RndXOXlNcGJiMzBGZy9V?=
 =?utf-8?B?ckt1MS83R2VaSFAyVy9FbGNQZWY0bld1NkNuUWZhQVAzank0QlN6Y09WcExu?=
 =?utf-8?B?VlYxejcxN2poREtWV1JzRCs2d3dHeEZCOGhHS2Q4bFRnUUpLSVptNkJHWlZV?=
 =?utf-8?B?QW1oU0JIaFlmMnQ0akhHakh3S2JIT3kxUDNua0V5b29TS3RaODZ3WGtrZjZ3?=
 =?utf-8?B?aTJ1MGx5c3NMOXhBdllvWGJYRllKcjhtSmJ2Tk1qeFh4RGt6WGQ3RGIyOWlI?=
 =?utf-8?B?aDBYSVduZk1iZlMxMlU3MFA1blVxTWhsS3VzU3VwK1ptanI3aU9WVFJOV1Ny?=
 =?utf-8?B?dGxXSVJsNGl4Ym5SQ2daWGl2UUNpRW02cWMyZUNsRTBqNWNxeXpGcGlhdURh?=
 =?utf-8?B?ZUZxTHpaZjM2YitiL3RGQzFTQ3BUYlIwbXREd0lWRHdET0pTdjF2SDUrQWM3?=
 =?utf-8?B?NlVodGtVZXdyY00yNGFLb3BhNllNVGwvSDJzK0pDZTUyR1FkU1FQSkllVVdG?=
 =?utf-8?B?TkUxZXNHYm1rb3JyaUFEY3BnQmU5TmVXSGJER2VrQzhPaXZqTVFkTmFYK0hk?=
 =?utf-8?B?RlFqNGdvQXFUczU0OGRiL0ZVMzRQcC9GQ2l5Q2luVTUzT1FqMUJ6Y0djUGFv?=
 =?utf-8?B?UC9uc3FybkY4Uncway9IbkdEU1NKTjZ4YzRmSVo1bEV6a2JBNUlmS0EzK3pE?=
 =?utf-8?B?Q2Q0NXBGRW1DSS9kR0tHcVk4R0oybzFXT3lsU0tZRzV5VXF6UnRhcEFDUlBC?=
 =?utf-8?B?L0RXR1Q4b051c2plQWw5SjZoeGppOU8rTlFZd3NGbTlRLzRrRmNWb2lZMVZ5?=
 =?utf-8?B?SW9PNWo0aUFjSTBSOHNHWGRCZ2pWc0hHUUhVTkQvaUJhaDRJWlJSZHNsT0Zp?=
 =?utf-8?B?Y2JFaGw2UWtlYzNJNzljNTV0cngwRElPaTA2QmxkVW9rRHlteTRFYnlxNFlD?=
 =?utf-8?B?NnFRL25VMFIrUU4wZVdRcU5uU2VpckJ1a2pwcWlRbmV6eVhuaTVJY28yWUE5?=
 =?utf-8?B?MXZsYjNUVUE0Y3BxVU1RQ0tka1dmVUc3dEhLaE9pVWlHakYwTU1XU0diazhK?=
 =?utf-8?B?bjVvdjBmaHJrWkFFRnJ3bExrdm5ZQmhOTEdkTVhEZmVDa1lGU2RvWmJ2MldK?=
 =?utf-8?B?NFJnb3FuVktOK2hEMHY4V01XdWFSVWZSVFlramtycityS2w5aDFrSzMzNHl5?=
 =?utf-8?B?YUhuMW1nWEFITFRKMEIzSjFoVHVkcTFEcHZKczkweUpndkVjcE5jejFPMHg3?=
 =?utf-8?B?ZCt2RFZPb3BiQU1VMTZjZzVzSENQMmczWVNrNzJqdGJXeVZlNURlQXdwV25u?=
 =?utf-8?B?WDZmK3p6OVlIVFMrMElFY3h1bXQyTEJoc3FCaFIzSldHa2k2VXFKTk56UXZV?=
 =?utf-8?B?Q0lFL0JtRHRLVzl0eC96dUpUTVBPYUZsY2I1VFpjT3ZqT1Y2VnRtVXJXR3lh?=
 =?utf-8?B?eGE1YVNua3NHWllFMnRKU0hPM0hjdGhBVEVYMHUzZ0NTZTFINUIvSU82WFNQ?=
 =?utf-8?B?S2hPM2dQU2lqcFZJaksrUlAyeGFIRWRHbmN5MENHV1FMN3pSbWdKSnFDdXY2?=
 =?utf-8?B?TDlCYTBUZnMyd29TWStuNExWM255aFR5WUVBaWhGMjFUdGU0dkkyS0JhWjgw?=
 =?utf-8?Q?bjVd/RVVIHz+tXjALdYvQWHyn+1UoppCBf1mNZmaFE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BE11D263D0B984DB4FBB3FB72820D6B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ffa270-3123-4ec0-991c-08d9f08f6123
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 14:28:04.9722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l2aZQra9m7SnPdNC/ukyDYchxwT/jt/awvNI0q1pR5ZPpd7fR2P8bts9BbplIjwPtdfQBV2IRoqEAyPoDp03khxaNE2XhDDpnUR3CJYCWl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2778
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

DQoNCkxlIDE1LzAyLzIwMjIgw6AgMTQ6MzYsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
TWljaGFlbCBFbGxlcm1hbiB3cm90ZToNCj4+IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4gd3JpdGVzOg0KPj4+IExlIDE0LzAyLzIwMjIgw6AgMTY6MjUsIE5h
dmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4+Pj4gQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+
Pj4+IEltcGxlbWVudCBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9BUkdTLiBJdCBhY2NlbGVy
YXRlcyB0aGUgY2FsbA0KPj4+Pj4gb2YgbGl2ZXBhdGNoaW5nLg0KPj4+Pj4NCj4+Pj4+IEFsc28g
bm90ZSB0aGF0IHBvd2VycGMgYmVpbmcgdGhlIGxhc3Qgb25lIHRvIGNvbnZlcnQgdG8NCj4+Pj4+
IENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1MsIGl0IHdpbGwgbm93IGJlIHBvc3NpYmxl
IHRvIHJlbW92ZQ0KPj4+Pj4ga2xwX2FyY2hfc2V0X3BjKCkgb24gYWxsIGFyY2hpdGVjdHVyZXMu
DQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3Bo
ZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4+Pj4gLS0tDQo+Pj4+PiDCoGFyY2gvcG93ZXJwYy9LY29u
ZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKw0KPj4+Pj4gwqBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vZnRyYWNlLmjCoMKgwqAgfCAxNyArKysrKysrKysrKysrKysr
Kw0KPj4+Pj4gwqBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbGl2ZXBhdGNoLmggfMKgIDQgKy0t
LQ0KPj4+Pj4gwqAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9LY29uZmlnIGIvYXJj
aC9wb3dlcnBjL0tjb25maWcNCj4+Pj4+IGluZGV4IGNkYWMyMTE1ZWIwMC4uZTJiMTc5MmIyYWFl
IDEwMDY0NA0KPj4+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4+Pj4+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9LY29uZmlnDQo+Pj4+PiBAQCAtMjEwLDYgKzIxMCw3IEBAIGNvbmZpZyBQUEMN
Cj4+Pj4+IMKgwqDCoMKgIHNlbGVjdCBIQVZFX0RFQlVHX0tNRU1MRUFLDQo+Pj4+PiDCoMKgwqDC
oCBzZWxlY3QgSEFWRV9ERUJVR19TVEFDS09WRVJGTE9XDQo+Pj4+PiDCoMKgwqDCoCBzZWxlY3Qg
SEFWRV9EWU5BTUlDX0ZUUkFDRQ0KPj4+Pj4gK8KgwqDCoCBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZU
UkFDRV9XSVRIX0FSR1PCoMKgwqAgaWYgTVBST0ZJTEVfS0VSTkVMIHx8IA0KPj4+Pj4gUFBDMzIN
Cj4+Pj4+IMKgwqDCoMKgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHU8KgwqDC
oCBpZiBNUFJPRklMRV9LRVJORUwgfHwgDQo+Pj4+PiBQUEMzMg0KPj4+Pj4gwqDCoMKgwqAgc2Vs
ZWN0IEhBVkVfRUJQRl9KSVQNCj4+Pj4+IMKgwqDCoMKgIHNlbGVjdCBIQVZFX0VGRklDSUVOVF9V
TkFMSUdORURfQUNDRVNTwqDCoMKgIGlmIA0KPj4+Pj4gIShDUFVfTElUVExFX0VORElBTiAmJiBQ
T1dFUjdfQ1BVKQ0KPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9m
dHJhY2UuaCANCj4+Pj4+IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Z0cmFjZS5oDQo+Pj4+
PiBpbmRleCBiM2Y2MTg0Zjc3ZWEuLjQ1YzNkNmYxMWRhYSAxMDA2NDQNCj4+Pj4+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9mdHJhY2UuaA0KPj4+Pj4gKysrIGIvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL2Z0cmFjZS5oDQo+Pj4+PiBAQCAtMjIsNiArMjIsMjMgQEAgc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIA0KPj4+Pj4gZnRyYWNlX2NhbGxfYWRqdXN0KHVuc2lnbmVkIGxv
bmcgYWRkcikNCj4+Pj4+IMKgc3RydWN0IGR5bl9hcmNoX2Z0cmFjZSB7DQo+Pj4+PiDCoMKgwqDC
oCBzdHJ1Y3QgbW9kdWxlICptb2Q7DQo+Pj4+PiDCoH07DQo+Pj4+PiArDQo+Pj4+PiArI2lmZGVm
IENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1MNCj4+Pj4+ICtzdHJ1Y3QgZnRyYWNlX3Jl
Z3Mgew0KPj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgcHRfcmVncyByZWdzOw0KPj4+Pj4gK307DQo+Pj4+
PiArDQo+Pj4+PiArc3RhdGljIF9fYWx3YXlzX2lubGluZSBzdHJ1Y3QgcHRfcmVncyAqYXJjaF9m
dHJhY2VfZ2V0X3JlZ3Moc3RydWN0IA0KPj4+Pj4gZnRyYWNlX3JlZ3MgKmZyZWdzKQ0KPj4+Pj4g
K3sNCj4+Pj4+ICvCoMKgwqAgcmV0dXJuICZmcmVncy0+cmVnczsNCj4+Pj4+ICt9DQo+Pj4+DQo+
Pj4+IEkgdGhpbmsgdGhpcyBpcyB3cm9uZy4gV2UgbmVlZCB0byBkaWZmZXJlbnRpYXRlIGJldHdl
ZW4gDQo+Pj4+IGZ0cmFjZV9jYWxsZXIoKSBhbmQgZnRyYWNlX3JlZ3NfY2FsbGVyKCkgaGVyZSwg
YW5kIG9ubHkgcmV0dXJuIA0KPj4+PiBwdF9yZWdzIGlmIGNvbWluZyBpbiB0aHJvdWdoIGZ0cmFj
ZV9yZWdzX2NhbGxlcigpIChpLmUuLCANCj4+Pj4gRkxfU0FWRV9SRUdTIGlzIHNldCkuDQo+Pj4N
Cj4+PiBOb3Qgc3VyZSBJIGZvbGxvdyB5b3UuDQo+Pj4NCj4+PiBUaGlzIGlzIGJhc2VkIG9uIDU3
NDBhN2M3MWFiNiAoInMzOTAvZnRyYWNlOiBhZGQgDQo+Pj4gSEFWRV9EWU5BTUlDX0ZUUkFDRV9X
SVRIX0FSR1Mgc3VwcG9ydCIpDQo+Pj4NCj4+PiBJdCdzIGFsbCB0aGUgcG9pbnQgb2YgSEFWRV9E
WU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1MsIGhhdmUgdGhlIHJlZ3MgDQo+Pj4gYWxzbyB3aXRoIGZ0
cmFjZV9jYWxsZXIoKS4NCj4+Pg0KPj4+IFN1cmUgeW91IG9ubHkgaGF2ZSB0aGUgcGFyYW1zLCBi
dXQgdGhhdCdzIHRoZSBzYW1lIG9uIHMzOTAsIHNvIHdoYXQgDQo+Pj4gZGlkIEkgbWlzcyA/DQo+
IA0KPiBJdCBsb29rcyBsaWtlIHMzOTAgaXMgc3BlY2lhbCBzaW5jZSBpdCBhcHBhcmVudGx5IHNh
dmVzIGFsbCByZWdpc3RlcnMgDQo+IGV2ZW4gZm9yIGZ0cmFjZV9jYWxsZXI6IA0KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvWWJpcGRVNVg0SE5EV0luaUBvc2lyaXMvDQoNCkl0IGlzIG5v
dCB3aGF0IEkgdW5kZXJzdGFuZCBmcm9tIHRoZWlyIGNvZGUsIHNlZSANCmh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE3LXJjMy9zb3VyY2UvYXJjaC9zMzkwL2tlcm5lbC9tY291
bnQuUyNMMzcNCg0KVGhleSBoYXZlIGEgY29tbW9uIG1hY3JvIGNhbGxlZCB3aXRoIGFyZ3VtZW50
ICdhbGxyZWdzJyB3aGljaCBpcyBzZXQgdG8gDQowIGZvciBmdHJhY2VfY2FsbGVyKCkgYW5kIDEg
Zm9yIGZ0cmFjZV9yZWdzX2NhbGxlcigpLg0KV2hlbiBhbGxyZWdzID09IDEsIHRoZSBtYWNybyBz
ZWVtcyB0byBzYXZlIG1vcmUuDQoNCkJ1dCBvaywgSSBjYW4gZG8gbGlrZSB4ODYsIGJ1dCBJIG5l
ZWQgYSB0cmljayB0byBrbm93IHdoZXRoZXIgDQpGTF9TQVZFX1JFR1MgaXMgc2V0IG9yIG5vdCwg
bGlrZSB0aGV5IGRvIHdpdGggZnJlZ3MtPnJlZ3MuY3MNCkFueSBpZGVhIHdoYXQgdGhlIGNvbmRp
dGlvbiBjYW4gYmUgZm9yIHBvd2VycGMgPw0KDQpUaGFua3MNCkNocmlzdG9waGU=
