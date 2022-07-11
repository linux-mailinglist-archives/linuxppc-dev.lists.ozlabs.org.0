Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8FB570957
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 19:43:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhWSW09gQz3c70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 03:43:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=J59NlZtp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.41; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=J59NlZtp;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120041.outbound.protection.outlook.com [40.107.12.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhWRm0Tm4z2xh0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 03:42:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2qKdZkI1Sntohq0aBSfOPzA+cyRD2Q9ts8b6G3QNfhuIVJyfoIp1MOWb/Z+u1MsxldHI8XfueIziqDd5530UXQ52Zjw4XohTrKnMQ3jxSH0A9rPqCmb4JTNLiYn1PNcEonQvjWcdgvM5CTazdoL2N9eYoaWeBz+2Q8ZKn0WsXkFmyfds86v5anbFHZoNONnNDaN8Ma7qJ5vYEk3jmYkfH/eOQNoY/f+pg1EVM8CbY9xBAnoSIMNb+B9iXsSl4UDZAcVIR2oeZvKxUymgLUF5ytRt3pTJIivfaCLORM8m5k9nhI01xXJsnXOtRAWNTZYAbH6PbHQ+dZCX7a2V9f5/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQdoIM5pbZaBeEs4uhDH87zum/UyHFFNZnFHuTwya14=;
 b=eSTFeGs/Q0hIyKjwMOrAEVDbjhZ6IsHoiqKheWPPfn7F1QOFbPBMaq3SRud/WJs06+2X8azdQW8/6KYz/l4FosWp1ZOaeMgu2fGKBqoEMckPSgRt3MgRntj/YNyjvPWnc4XgBTWnp8UjCjli0WjmQfFenvK9gm43ZrO0l+zatda8zbYgodNAvsqSP6eIoHuMENqleayNA0xOJEzBD7YnVHkBSi8x17zq0tdJT1NCKdvvXWjA+us0qKO2y9ncMLhdpckdePtmE7EgHLLDny9dkuJ1YDkJKzRQETXWVljW1yzpKL1gZQQD80mpATa2iTDGVPcc2szoH+Y0qDOF1SSFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQdoIM5pbZaBeEs4uhDH87zum/UyHFFNZnFHuTwya14=;
 b=J59NlZtpTmxJvwZ1zkFR+MHJzp6/uXVp2n3TDDR5+oCjJf2AmhpDF4SvDHVXPC7169+LTtU6dsh1PaOowREKtUpRUt64/OrkDufQ9q8CGhfDgg3DwbwhGFWJ9mThH0zQMYCkTkO9qmGdv0Q8LnwxovXxr//Zv1HhCED9l5lRosm3aPugaMV8KpV2Lwd84gT7KHBrXnZ1zcAh/oGi9y0G6kPCI6OmvRmIws4L1A2vBJJkLCdX77iMfbAMI6l3S0Tjx0U8dTbyk3/Ay6x05zXP8KafRgeogLns7PWQQQqMwabvKxqgr/xSsX6/nQAfs41J928fNuvuRrK/ZeLzS8AnQQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2056.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Mon, 11 Jul
 2022 17:42:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 17:42:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v1 1/5] powerpc/32: Do not allow selection of e5500 or
 e6500 CPUs on PPC32
Thread-Topic: [PATCH v1 1/5] powerpc/32: Do not allow selection of e5500 or
 e6500 CPUs on PPC32
Thread-Index: AQHYlTFJkxARn2T9RECABCcXCjO+Mq15XzcAgAAReoA=
Date: Mon, 11 Jul 2022 17:42:07 +0000
Message-ID: <ec2a8a52-73cc-edb5-1343-ec879f2355e6@csgroup.eu>
References:  <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
 <20220711163934.GE25951@gate.crashing.org>
In-Reply-To: <20220711163934.GE25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0076bc8-ddf0-4b55-3c8a-08da6364ad14
x-ms-traffictypediagnostic: MRZP264MB2056:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  HCO7zJIj2D1cHOvd+yIn6bD0UYBhbUEIZEZiv57Hy8O1hn03clIvMr+mJR+nALVF7ENjEbT5yUkfJPidXENenwDJl0lq+vs1yR/Eho7XDeSWtmun4eLgpPR3s0CDurrpQW1WglDagS2bDHyli27GAoSvBgIa2eUWY4gGbYwUbP/7jxk0P6UwdoyTsHNoRhJAFQIY6Roukm5UeRG4x2f8VCDfAXbecr6TMw/w/UO1LzBqXvBT1GX5wYo8LDXsQK1kkCY7882NFAy/AYU3WTu0PuBZxD1uSbZ8P6allKUrJTj2e/jno0XnpEpNgaggW8SJkHHkEJddptWbDoBLZBnuqg6t4upCu5VsL9yNUzr3sepJqOrzHqkV+6DjYVsZBc2H0AyKcqPo0T7+j+W1KBlV2gchKsV3y4l7zlenvsM6Wyy+Wji2/aF9dEclUdndCHoB7cm0nYV3ntF7WdWOU8bBj2SJpeG4AC56iId/bCZSmsJ+mA3J6yBwYoFSXYcJFxU9GmpjB9JmmF7PmbUppRCH8+Tdb2Pml7pnx/A9QAqJnxyQa7fI+18dSrA43C/UK8Ywf4cltWGAxzdcOhllo0KhdsgIfwIcc8c9UnTx+72eJVOyAozB/u6l/ypcWG6o2CFiB7/13V5oMv/q1HD2k8YMpxWubrkXPfQKC4LY7H71uJZTbIF+Bdi1KuwwPYSuUL9/pDYzGHfiHk9Frb7WRHWxi5N+qvoh/SfwckaBC6lHnOm7LDH227haaiATnLDhFAxozcWzXfkafuT5YHlBM+mok3wa0mlEs7Z035nZVmQ0De0l43Xq81FmhYBtgiCgo2lWpGTAWwyAWGJ4WjY0PW+XxuXoQ77aADouIwCc6MaJylnvOWHj0/p5vG7ir+Vj2mwC
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(66556008)(478600001)(64756008)(41300700001)(186003)(66476007)(2906002)(54906003)(8676002)(86362001)(31696002)(6486002)(316002)(71200400001)(4326008)(66946007)(76116006)(26005)(91956017)(6916009)(6506007)(36756003)(6512007)(31686004)(66446008)(83380400001)(38100700002)(2616005)(38070700005)(8936002)(44832011)(5660300002)(4744005)(122000001)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RnVjWEc5YzVQNXkyQ2RuSjVSY0I2ZmVpbThabWRrbUNxRFBLYjJKeEYxcjNk?=
 =?utf-8?B?WjhFbUZBQ3FlK252VzljU295MGhqaldXSG43TnQ0Yk4rc1ZONytxU3FyNmtr?=
 =?utf-8?B?UmVZM2JJaURKN2JlUklTWFhreVRwUFVaSjdDWUxFbkowakQ4RHdNckRuRmRo?=
 =?utf-8?B?MWljTENPRnBabzhBeUhaYURzem5GZFBTVm0wQlF2WW9TVzk1UUdMSkJrOUkv?=
 =?utf-8?B?bGtkdXlOcWFtenFCcFBSbVlhQ2FrM3BEMTdrcDRhRGJlTjc3Z0VVd1JxZnFM?=
 =?utf-8?B?NmErSWlzY0Z0MlBSNmo0d1A1R2M2UFlieVZ3T3c2ZTJTelhkdGtzeFd1ZmFF?=
 =?utf-8?B?aVdMTUptNHEzQ1JxYjNyT01jaEduVk1sN2FTK1dmSUZMR1lQalQ1b0RKWG1H?=
 =?utf-8?B?akNuR2hjVkVSWjhCS0FrZDVFcVVKTEl3THhWVmRWcXB3ZnR5eW1rcWdUOE9P?=
 =?utf-8?B?bzQ1MlZkS29sYWcwQTNjMG5iT3hOYVVrL3N4cUp5bFp4OFE4SFVLMW90MGg4?=
 =?utf-8?B?a1JOS25XakppSEhIdFlNMHFJOHlLUS9ldTZ6anRlT2h0OFZCVFpQZ29TOXU2?=
 =?utf-8?B?c1RjRFI5K2kvMnJqaUl5MFJqejlXazdKaHYxWHJ5ZmdhcUtnZzVQMmRPa3or?=
 =?utf-8?B?c1FDWnZ2SGRXNklCaEczNGl3M0cxdkl5eTJXc0RHZHA5S3VyR0l2SUx3ZFdT?=
 =?utf-8?B?Nkl5V1FBZFJVQjJQeFljTEU4ajluR3UrSUwwRWJSNTdVdlByQ044ODdqeXZ4?=
 =?utf-8?B?UzhRMklqN3d6ZkJKT1RBWk55WjAyanNEOEZaczJ2bVZTWU5YL1RQWEM0dUZ3?=
 =?utf-8?B?TVFSaUxSK0ZndExxSkVPZ3djeTh0cHc0Y0VlaWg3V2dadnd2TFd4dXlkWmVn?=
 =?utf-8?B?ZGhldnBvUnlCeGdpZlZSRzBFSkFFU29BT2hhUXNYYWJ1aW5vcTk4Q3FyZU9k?=
 =?utf-8?B?T0RLLzh5b0lYZTc5ZTFrdzMwZUF5bWl4UFBNVGlLcHV4eWo4VEkvM05nOGtH?=
 =?utf-8?B?UWxYVDFOaEc5ZE94cWIxb0RKYllweHNoRThqREJPWkgzQTFXUFZrbUxUaUxh?=
 =?utf-8?B?ZmJaMFA4bEpaZ1hwZm1zTjdqdFFvR3RnUmRhZWlrOUxVTFRoRDVFS1J0ekJU?=
 =?utf-8?B?VzRnaU90U1p4aDZKUzMwTHpFOWtaUjJkZkhndHpBa21UR2RDYjhMQVNtSFVS?=
 =?utf-8?B?V1F6bjZMZHBRS3NKVWdwVHFFRksraFVYTUNzT1lPc3V6SXJlYlQzOTNnVTlL?=
 =?utf-8?B?QjdvL1cvNWZPWlliRXR4c1oyZVhaalZmdkJ1aVlnRjhwSFhIUVUrR2V4c0Mz?=
 =?utf-8?B?WHFBNlNleEM5MTIyK0dJMTVMUVo3YTZnNncrUk9UY3ZjRFM2ZFVZOThzM2g3?=
 =?utf-8?B?Q3ZFUmo1Wms3ckZIZVpJTk9Zc2J1M25LU2NmYUo4VHU4MHdnUkJwQzFHYXVI?=
 =?utf-8?B?Y3JMWk9UWEphTzJ1S3l1bU5WSnkxQnZwb0RNSkFhalI1Vng4OWhyTHlyNUJS?=
 =?utf-8?B?eXMrUWxTaWx6dDlQUlp6aDM3VWtVbFJhd1N1elRkRnlIMG41eHFQQTVLMXFx?=
 =?utf-8?B?ZlpraWM1cVdLMDFSRThiQUdDQkY3OUlSeElmOXp6dElydDBoYkhOU004djhr?=
 =?utf-8?B?eXl4TkpyNDB3UUR2TnB6K1d6ck82NXNtUWphOCtWVUtRT2JRQnREY1lHVThm?=
 =?utf-8?B?bHlLY1RhbmIwNWVXeXVNUlppWDEzR2FzSFJOejFWYmYxYXZKVmg0MjNMUWgy?=
 =?utf-8?B?ZmNNUVZubWNmdTlSTE1tYkU4YzBSb0oxTDVlMklXTGxXbmR4M0tVREt1YnI2?=
 =?utf-8?B?YmN1VlNjeFVQNElQNjcvN3VQVzZva0VFcXpNMFBqWmgxYjlFaW1hN2l5VWRD?=
 =?utf-8?B?eE1OYTluc3MxdzgrZndaMGtSVTl6SU5nR2xTVDNpMTNQTm8yT0pkTXlJR1Vu?=
 =?utf-8?B?aW5hNm02NGNGL24ybjJxSVZtRUpYdmRIWERySFF3TVpoVVhRMTBXNWFjZTZ3?=
 =?utf-8?B?bUMwWEQ0RldoWEhzQ1VIYkZNb0ZOa0tTdkZyeEk4WUllSlozZEsyZ1QwbUN0?=
 =?utf-8?B?ZHRYdU1MOTJmMjl6Wnd5UThKN0FPZnpzVGFCZFBVcXZQSEJ5V29rSjFEZitP?=
 =?utf-8?B?WGRIZytkQVpwSzR2SUpZNWdoelYvNUtHZEIvZENSSWJMR2hGczlHZGtKMnZj?=
 =?utf-8?Q?ZCFfS3x3zvr5kgWgLmLCYGc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AD8D7E706113F4793F2DC04542E7C5C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0076bc8-ddf0-4b55-3c8a-08da6364ad14
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 17:42:07.7541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNvjwLwNjh8kYiJZv70PrmS6gp1lqCeoOBHsTeLREnvaem9m8hnawnCduA3Z95wwL+K3MqaDtWG1W213XFYXVL6oC4hmn51fGpm99H+5nP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2056
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzA3LzIwMjIgw6AgMTg6MzksIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBIaSENCj4gDQo+IE9uIE1vbiwgSnVsIDExLCAyMDIyIGF0IDA0OjE5OjI5UE0gKzAyMDAs
IENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+PiBDb21taXQgMGUwMGE4YzlmZDkyICgicG93ZXJw
YzogQWxsb3cgQ1BVIHNlbGVjdGlvbiBhbHNvIG9uIFBQQzMyIikNCj4+IGVubGFyZ2VkIHRoZSBD
UFUgc2VsZWN0aW9uIGxvZ2ljIHRvIFBQQzMyIGJ5IHJlbW92aW5nIGRlcGVuZCB0bw0KPj4gUFBD
NjQsIGFuZCBmYWlsZWQgdG8gcmVzdHJpY3QgdGhhdCBkZXBlbmQgdG8gRTU1MDBfQ1BVIGFuZCBF
NjUwMF9DUFUuDQo+PiBGb3J0dW5hdGVseSB0aGF0IGdvdCB1bm5vdGljZWQgYmVjYXVzZSAtbWNw
dT04NTQwIHdpbGwgb3ZlcnJpZGUgdGhlDQo+PiAtbWNwdT1lNTAwbWM2NCBvciAtbXBjdT1lNjUw
MCBhcyB0aGV5IGFyZSBlYWxpZXIsIGJ1dCB0aGF0J3MNCj4+IGZyYWdpbGUgYW5kIG1heSBubyBi
ZSByaWdodCBpbiB0aGUgZnV0dXJlLg0KPiANCj4gQSBsYXRlciAtbWNwdT0gYWx3YXlzIG92ZXJy
aWRlcyBhbiBlYXJsaWVyIG9uZS4gIFRoaXMgaXMgdGhlIHNhbWUgYXMNCj4gd2l0aCBhbGwgb3Ro
ZXIgR0NDIG9wdGlvbiBmbGFncywgYW5kIHdpbGwgbm90IGNoYW5nZSBpbiB0aGUgZnV0dXJlLg0K
PiANCg0KDQpCeSAiZnV0dXJlIiBJIG1lYW50IGFmdGVyIHBhdGNoIDIuDQoNCkF0IHRoZSB0aW1l
IGJlaW5nLCBpZiB5b3Ugc2VsZWN0IFBQQzMyIGFuZCBNUENfODV4eCBhbmQgRTY1MDBfQ1BVLCB5
b3UgDQpnZXQgLW1jcHU9ZTY1MDAgLW1jcHU9ODU0MC4NCg0KQWZ0ZXIgcGF0Y2ggMiwgaWYgeW91
IHNlbGVjdCBQUEMzMiBhbmQgTVBDXzg1eHggYW5kIEU2NTAwX0NQVSwgeW91IGdldCANCi1tY3B1
PWU2NTAwDQoNCkNocmlzdG9waGU=
