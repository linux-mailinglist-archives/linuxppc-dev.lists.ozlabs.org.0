Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23CC4C2655
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:35:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45nL6x7Zz3cPp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:35:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60a;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45mw17Xqz2x9b
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:34:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoFjynrnuwto2Z2+mssFKKWRMxW5Vw4heHjIl8+ztQSGAwbgUMjeo+Cap9xa3dWDUN7WZ6lwDFz7KQG47X2wF0XMZjrsxmkQv60tT1YCrynHXdjQo6T/pI2bXOXxPNmMLUtIc9ji/AC7QGYnvuAvcLfBzOSTWexgsNHumcVrdsJf5o8dkWe4s8c5jV3ND/PohJksmaJB20Aty0AIDUiCpJAKYOw3hzTuqxIGLcmppg5HqyuW+Djm6KHBEQEGk2CxWDmbBrZvRqUVizl5MbHZFleRSeqMltBmkBmtFkTfuHTQr2cgM5c/spTaM5J7Xmr5DdVET3ERq5JSZl4zlC6xKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoEeoZ8h9kofEks11I6lFCL7nOMW6y6LxJurHqafEF4=;
 b=aK0sTIa0NxzM6whDU4aiWdLUgCcwLSNJpv19kziTlpwZYLPDnTZweaEkHluninbm2cO8GYhhTm/tMqvyPCx93xpIbG7XmX9nNvGD8O015RBuKP3yBKWjZmCdTF2LxKcjrhsOoxD4+IE2eXn9rknl3YtlxMYhd+DwSBd54r3sSB7nWnoOc7Go8KyvtNDjULMVOdJm2f/2eyvM5zP/7hcMTtIAbriGZ1AiBQvn/nrViapWYPc3d6jWznEbFqDWrO41T7w7QOPjkiuJc2hdcCDkqVCRCZlzO5Was6TEXkmUhV4X549EjBWjULGWxjANllYL2mPpa/FrE+JMByNlua6qXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2634.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 07:00:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8142:2e6f:219b:646d%5]) with mapi id 15.20.5017.021; Thu, 24 Feb 2022
 07:00:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] powerpc/32: Clear volatile regs on syscall exit
Thread-Topic: [PATCH] powerpc/32: Clear volatile regs on syscall exit
Thread-Index: AQHYKNh0eyGIwSmwv0u/u8dEgkopEKyhhvUAgAC/uoA=
Date: Thu, 24 Feb 2022 07:00:22 +0000
Message-ID: <adec0b54-85c8-d477-f733-6eeb39083e83@csgroup.eu>
References: <28b040bd2357a1879df0ca1b74094323f778a472.1645636285.git.christophe.leroy@csgroup.eu>
 <202202231131.08B7EC1@keescook>
In-Reply-To: <202202231131.08B7EC1@keescook>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03716bbc-e28a-452d-8e6e-08d9f7635386
x-ms-traffictypediagnostic: MRZP264MB2634:EE_
x-microsoft-antispam-prvs: <MRZP264MB26340F00A36E7312D45E2391ED3D9@MRZP264MB2634.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 56+qzhFyZTBwiRHWSKFaPBbIhD0KlJo+K2Jl4nfj52x/l7KKwEFPUNk/34uIlbqByUAkulO9CCKkQuuxo0zyduaH54ttBhvff5YVduL1iFgkSpkhlKaYP6k/pe9OZXtp46OZ/bdsbywxrFbJaLuESrwEc6v8DsUFitEemNPSxfQ++kMftJsV23SnHGxZIA6JI9+u/bLwWsaDlxrDwEPw53ZkY8Z9O2kbiYQUAvtC/q5BMXEUiwt0qNftZsmfkJpSOI0F/1mPtoO9Gn+Udwqxw12RsE1SuF5HIwj/WG4j0QnrcON0qS/WyjQFs4chdueJENpegTB3UgB65P77DzmyPrvaxFlB1iPSWUJGeh8z4tC2d0A5naywH4y21KWU1odnqPjnom4GqiTFve4e1zPWObLeEni+ryyKEfVsnVbKlaXFWQ1ekUoh0cCrBwbMZmhH7R3dJWq1tdEbLtJqbcGISAlk8AWMeh0gm5j03DNf02IYcrPkGAZxIF3AG/g3b9nAgN+BSFnhv52TzONYFz5+JfvyJymPeDUJAlCHEuXHXea2VXrv4O6anAMNNLsSb7WhNfYSDANashRHwxdDtMW80BQYkAaJJE8FPsnwccZR4IpmQ7pNPBbWNvuZnVndz2VdfJTDUKL8/4dHxu7RLaXTje65LK4dhNsiVPcqL2qBJutvLyDWzIdnTSQndY1Y3usmnAq+sc4h9VFulUvYWONo8dn63d9dVq1IFzqcrvF0kZy3yPRCVEMm7VbmMw7HshS1k/UyH1bc97PdpWDRfl8UDQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(6916009)(86362001)(316002)(8936002)(31696002)(6506007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(66946007)(76116006)(91956017)(71200400001)(83380400001)(2616005)(38070700005)(6512007)(2906002)(44832011)(5660300002)(38100700002)(122000001)(26005)(186003)(36756003)(31686004)(6486002)(508600001)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUhHVlJCN01FOEFPZWs3UzV3ZldrUVdwWFFxa0Vwb09vT2pUMHVyTHhyV1ho?=
 =?utf-8?B?UTFNaEhCd2p0ZnRmRmtOUW55YUNDRnRGRm9uQmYydDcxdkp3Y1YrWGtFTkpt?=
 =?utf-8?B?eWozOGg4QzFxS0VZVGYwMW1RalZvOWxRYk1FVEdQak5lMjk0SVJuV1d0dnEy?=
 =?utf-8?B?Ymc1MUhFL3pONTZpYkNaM0U1ZGgxRzIySTIyZXNLakI5U3JXZkdlaVkzNlEv?=
 =?utf-8?B?ZTJZMnJjajYrR0ZFc1hxVGxKbWZmeVRjT0xlSWRpQ1c0Q2o3UnFKcHhxQTFP?=
 =?utf-8?B?RTBUYm5NdXhscWErVEx3Vm1ZWUZVbkNzSDhhQjQ0aFRtWVFjYlIwV1cwbU41?=
 =?utf-8?B?eGhONTh0eGRKSkV1MFN0OWJtV1J5SU1mdjVIQnpIWlhjYXZqU1lIRE1OaFkx?=
 =?utf-8?B?Y1ZUTUFZUFdDRndvdllpV09FV1RrZXpWNkZjUUhKOUVMQkhqMGxwN1JvVXFz?=
 =?utf-8?B?bHU5OXg1WHBoRzk4OURReVJiZmhwY0VONlRVWDAxWVEvdi9pSHpMRGVHTTF3?=
 =?utf-8?B?MDNGVlZVSDlLR2dmUG9kTTV4MkRTSEpTa1M0cko3T3FqOEJRanNibzZnTFNC?=
 =?utf-8?B?UVM0OE00S09TSXNuTVpqTHFBOHlER3FoNjBzQVErQVpobnhhdmZaQTY1Q3Br?=
 =?utf-8?B?UE1jWHhRSElPbTFndTBlQTQxRWgzOGMvZ201cjZ6WWgvNjdOTGtyQXo2cjRQ?=
 =?utf-8?B?OWZidFJOYVpaaitUbGRiTk1wYnI2MXhNUFRENDM1ZHozQk1JSGlOa2NVaEg1?=
 =?utf-8?B?UGNsT0VKbWRkNm5HSXU0UGt0YU9ldW45RFdzTlA3VC9OMm5NZ3d6REVGdWtW?=
 =?utf-8?B?Sng4bUt5SXZvckdSNnJMMXQ0R3ZNRDc2NlBrTXhHai9oSHVPTlRRaHRIMnVr?=
 =?utf-8?B?MGY0NWhhaFQ2aVZnWngrM3FPbHlKcDZsK2x2RlJXU1ZLaUc2TGxWWEZNTWQv?=
 =?utf-8?B?eExiZlpvUTV2ajFNNTkzR1lBT2JXRmhrUjRzMkZaZE5abmZudzRpZkpnZ3NS?=
 =?utf-8?B?cHNrbGNrZjFZZkl3UnIwT0E4VEtBYko2WmtIcEpyNkpBK3Ryb1ZadnVkV2p0?=
 =?utf-8?B?bkNoNDJCRVl0K1dUSVpYcEJYL0FXTVV2OER3L0VHb1FUSG00ZC84RC9zQnFP?=
 =?utf-8?B?OWlyN01saTFVQjdkQURadHFIVWlXUVQzeG5mbmRESC9uOTVtdjIrV2FjWDNu?=
 =?utf-8?B?SldyU2d5ZmQvOWFoSlN0cHlDZ3p6UGgrcE5odzZiU0tpemhoay9EdDdrLzRM?=
 =?utf-8?B?cGZxOHRvWDErMUVTMEc1MFF3di9FMG9vM2dQeTFTVGZ0RFNQSTJXcGxlVUhv?=
 =?utf-8?B?ZktoN0pNWFhyV3Voanh3T1F6Zm8vZmtZS1NzZWl2dE1yMU83VEFkcWpjbThT?=
 =?utf-8?B?R2ZlYm4wc0d0OE1nK2NwRnI5bjZDcE1CVDlSRFRpRXV3b3owaHJJOXZwTXBR?=
 =?utf-8?B?SkZJcld1RWdrRGszV0hNVnBDY0wyWE5yT2dnZUY3RFZ4UVF1N3BUTGRIdjhS?=
 =?utf-8?B?blNnZ0JlekY5ZVhBOVNzeTRhYUZ6RFd3QmpSRkFZN2x0QjFBa3NPRTVBcGJH?=
 =?utf-8?B?TlpNaElLYnd4UVlDYWY5TUhFREFVbGNhbmcvM01nOVZVeEpWMy9mWHpYZ1Zr?=
 =?utf-8?B?M0JNYk5XS2NLb3hYUVh5andmNFFwcEkwdnR1Yk40aFNYeTVLcXF2YTNTSEJZ?=
 =?utf-8?B?azlmUkJDV1Y4Qm50S3JwZGhldDRDamxtR214RDRlRWMvWmxUODNKczI2Y1Qr?=
 =?utf-8?B?YnRsSFppUHJkeG4wbjhpZUxBTkdjME5rQUxTWDA5SW9remhlWGRwWVhCeTJ3?=
 =?utf-8?B?eU9GWlVGQTQ4T2NqTXdmV3MrNG5zRGpmLzZTZVpPU0VTTHdsOE05MG9wVmU4?=
 =?utf-8?B?cE9lQzdsNDBUdHRqNE4vazc0bDVDQ2pqTWVmRXliVE1CVnpkQ3EvQWp4Tkpo?=
 =?utf-8?B?d01hR2lDaUNOcmJScGNJbGhzcUIzQ09VNnF6dzVYN2FLd3M4UFc5bW42bTJu?=
 =?utf-8?B?YUxnd1YzVHlNcWNNNlByOFVqdE15UkFlYUZnSDNyUkFPd3NjTmozdFFFNUxF?=
 =?utf-8?B?Q0I3OWE4ZDQ4VkMxUGZkdXRVWGhFcnRlak5ZRWc0L1BqM0doVTIxTjc4UEJB?=
 =?utf-8?B?cHhvWEdXcWlaT1dMUFVuOHBrVWVUeDZYN3lQRzNzWDZtR2NiTGpFOFpoL01h?=
 =?utf-8?B?c1gzb2ZQakFQMk51cnJxMnRYU0kvQlluYUhtTUFXODUwWkxLUmJuZ3pqQnND?=
 =?utf-8?Q?sohz0mMPzrmoXcP5MmJpACx8Cjg1Ae/OJRvaSFmOvA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5D4969423A8A94B9F7F57848D2BB4E8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 03716bbc-e28a-452d-8e6e-08d9f7635386
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 07:00:22.4317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KK2ynFhUJi69giIxRiw6Rj4vA3rydMQNRKwUpfOJSM77dGz5gdA8T1Hlp0tbrMqzq2qInpTRg8PG4s0L2WQmIc++V0mjzqwjtT4qcZyNcY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2634
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
 Paul Mackerras <paulus@samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzAyLzIwMjIgw6AgMjA6MzQsIEtlZXMgQ29vayBhIMOpY3JpdMKgOg0KPiBPbiBX
ZWQsIEZlYiAyMywgMjAyMiBhdCAwNjoxMTozNlBNICswMTAwLCBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPj4gQ29tbWl0IGE4MmFkZmQ1YzdjYiAoImhhcmRlbmluZzogSW50cm9kdWNlIENPTkZJ
R19aRVJPX0NBTExfVVNFRF9SRUdTIikNCj4+IGFkZGVkIHplcm9pbmcgb2YgdXNlZCByZWdpc3Rl
cnMgYXQgZnVuY3Rpb24gZXhpdC4NCj4+DQo+PiBBdCB0aGUgdGltZSBiZWluZywgUFBDNjQgY2xl
YXJzIHZvbGF0aWxlIHJlZ2lzdGVycyBvbiBzeXNjYWxsIGV4aXQgYnV0DQo+PiBQUEMzMiBkb2Vz
bid0IGRvIGl0IGZvciBwZXJmb3JtYW5jZSByZWFzb24uDQo+Pg0KPj4gQWRkIHRoYXQgY2xlYXJp
bmcgaW4gUFBDMzIgc3lzY2FsbCBleGl0IGFzIHdlbGwsIGJ1dCBvbmx5IHdoZW4NCj4+IENPTkZJ
R19aRVJPX0NBTExfVVNFRF9SRUdTIGlzIHNlbGVjdGVkLg0KPj4NCj4+IE9uIGFuIDh4eCwgdGhl
IG51bGxfc3lzY2FsbCBzZWxmdGVzdCBnaXZlczoNCj4+IC0gV2l0aG91dCBDT05GSUdfWkVST19D
QUxMX1VTRURfUkVHUwkJOiAyODggY3ljbGVzDQo+PiAtIFdpdGggQ09ORklHX1pFUk9fQ0FMTF9V
U0VEX1JFR1MJCTogMzA1IGN5Y2xlcw0KPj4gLSBXaXRoIENPTkZJR19aRVJPX0NBTExfVVNFRF9S
RUdTICsgdGhpcyBwYXRjaAk6IDMxOSBjeWNsZXMNCj4+DQo+PiBOb3RlIHRoYXQgKGluZGVwZW5k
ZW50IG9mIHRoaXMgcGF0Y2gpLCB3aXRoIHBtYWMzMl9kZWZjb25maWcsDQo+PiB2bWxpbnV4IHNp
emUgaXMgYXMgZm9sbG93cyB3aXRoL3dpdGhvdXQgQ09ORklHX1pFUk9fQ0FMTF9VU0VEX1JFR1M6
DQo+Pg0KPj4gICAgIHRleHQJICAgCWRhdGEJICAgIGJzcwkgICAgZGVjCSAgICBoZXgJCWZpbGVu
YW1lDQo+PiA5NTc4ODY5CQkyNTI1MjEwCSAxOTQ0MDAJMTIyOTg0NzkJYmJhOGVmCXZtbGludXgu
d2l0aG91dA0KPj4gMTAzMTgwNDUJMjUyNTIxMCAgMTk0NDAwCTEzMDM3NjU1CWM2ZjA1Nwl2bWxp
bnV4LndpdGgNCj4+DQo+PiBUaGF0IGlzIGEgNy43JSBpbmNyZWFzZSBvbiB0ZXh0IHNpemUsIDYu
MCUgb24gb3ZlcmFsbCBzaXplLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IC0tLQ0KPj4gICBhcmNoL3Bvd2Vy
cGMva2VybmVsL2VudHJ5XzMyLlMgfCAxNSArKysrKysrKysrKysrKysNCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2tlcm5lbC9lbnRyeV8zMi5TIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9lbnRyeV8zMi5TDQo+PiBp
bmRleCA3NzQ4YzI3OGQxM2MuLjE5OWYyMzA5MmMwMiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93
ZXJwYy9rZXJuZWwvZW50cnlfMzIuUw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9lbnRy
eV8zMi5TDQo+PiBAQCAtMTUxLDYgKzE1MSwyMSBAQCBzeXNjYWxsX2V4aXRfZmluaXNoOg0KPj4g
ICAJYm5lCTNmDQo+PiAgIAltdGNyCXI1DQo+PiAgIA0KPj4gKyNpZmRlZiBDT05GSUdfWkVST19D
QUxMX1VTRURfUkVHUw0KPj4gKwkvKiBaZXJvIHZvbGF0aWxlIHJlZ3MgdGhhdCBtYXkgY29udGFp
biBzZW5zaXRpdmUga2VybmVsIGRhdGEgKi8NCj4+ICsJbGkJcjAsMA0KPj4gKwlsaQlyNCwwDQo+
PiArCWxpCXI1LDANCj4+ICsJbGkJcjYsMA0KPj4gKwlsaQlyNywwDQo+PiArCWxpCXI4LDANCj4+
ICsJbGkJcjksMA0KPj4gKwlsaQlyMTAsMA0KPj4gKwlsaQlyMTEsMA0KPj4gKwlsaQlyMTIsMA0K
Pj4gKwltdGN0cglyMA0KPj4gKwltdHhlcglyMA0KPj4gKyNlbmRpZg0KPiANCj4gSSB0aGluayB0
aGlzIHNob3VsZCBwcm9iYWJseSBiZSB1bmNvbmRpdGlvbmFsIC0tIGlmIHRoaXMgaXMgYWN0dWFs
bHkNCj4gbGVha2luZyBrZXJuZWwgcG9pbnRlcnMgKG9yIGRhdGEpIHRoYXQncyBwcmV0dHkgYmFk
LiA6fA0KPiANCj4gSWYgeW91IHJlYWxseSB3YW50IHRvIGxlYXZlIGl0IGJ1aWxkLXRpbWUgc2Vs
ZWN0YWJsZSwgbWF5YmUgYWRkIGEgbmV3DQo+IGNvbmZpZyB0aGF0IGdldHMgInNlbGVjdCJlZCBi
eSBDT05GSUdfWkVST19DQUxMX1VTRURfUkVHUz8NCg0KWW91IG1lYW4gYSBDT05GSUcgdGhhdCBp
cyBzZWxlY3RlZCBieSBDT05GSUdfWkVST19DQUxMX1VTRURfUkVHUyBhbmQgbWF5IA0KYWxzbyBi
ZSBzZWxlY3RlZCBieSB0aGUgdXNlciB3aGVuIENPTkZJR19aRVJPX0NBTExfVVNFRF9SRUdTIGlz
IG5vdCANCnNlbGVjdGVkID8NCg0KQXQgZXhpdDoNCi0gY29udGFpbiBvZiByNCBpcyBsb2FkZWQg
aW4gTFINCi0gY29udGFpbiBvZiByNSBpcyBsb2FkZWQgaW4gQ1INCi0gY29udGFpbiBvZiByNyBp
cyB3ZXJlIHdlIGJyYW5jaCBhZnRlciBzd2l0Y2hpbmcgYmFjayB0byB1c2VyIG1vZGUNCi0gY29u
dGFpbiBvZiByOCBpcyBsb2FkZWQgaW4gTVNSLiBBbGx0aG91Z2ggTVNSIGNhbid0IGJlIHJlYWQg
YnkgdGhlIA0KdXNlciwgdGhlcmUgaXMgbm90aGluZyBzZWNyZXQgaW4gaXQuDQotIFhFUiBjb250
YWlucyBhcml0aG1ldGljIGZsYWdzLCBub3RoaW5nIHJlYWxseSBzZW5zaXRpdmUuDQoNClNvIHJl
bWFpbiByMCwgcjYsIHI5IHRvIHIxMiBhbmQgY3RyLg0KDQpNYXliZSBhIGNvbXByb21pc2UgY291
bGQgYmUgdG8gb25seSBjbGVhciB0aG9zZSB3aGVuIA0KQ09ORklHX1pFUk9fQ0FMTF9VU0VEX1JF
R1MgaXMgbm90IHNlbGVjdGVkID8NCg0KPiANCj4gKEFuZCB5b3UgbWF5IHdhbnQgdG8gY29uc2lk
ZXIgd2lwaW5nIGFsbCAidW51c2VkIiByZWdpc3RlcnMgYXQgc3lzY2FsbA0KPiBlbnRyeSBhcyB3
ZWxsLikNCg0KSG93ICJ1bnVzZWQiID8NCg0KQXQgc3lzY2FsbCBlbnRyeSB3ZSBoYXZlIHN5c2Nh
bGwgTlIgaW4gcjAsIHN5c2NhbGwgYXJncyBpbiByMyB0byByOC4NClRoZSBoYW5kbGVyIHVzZXMg
cjksIHIxMCwgcjExIGFuZCByMTIgcHJpb3IgdG8gcmUtZW5hYmxpbmcgTU1VIGFuZCANCnRha2lu
ZyBhbnkgY29uZGl0aW9uYWwgYnJhbmNoZS4NCnIxIGFuZCByMiBhcmUgYWxzbyBzb29uIHNldCBh
bmQgdXNlZCAocjEgaXMgc3RhY2sgcHRyLCByMiBpcyBwdHIgdG8gDQpjdXJyZW50IHRhc2sgc3Ry
dWN0KSBhbmQgcmVzdG9yZWQgZnJvbSBzdGFjayBhdCB0aGUgZW5kLg0KcjEzLXIzMSBhcmUgY2Fs
bGVlIHNhdmVkL3Jlc3RvcmVkLg0KDQpDaHJpc3RvcGhl
