Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 584FF5EBA58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 08:08:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc8LT39NWz3c9g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:08:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wMBB1FW+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.51; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wMBB1FW+;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120051.outbound.protection.outlook.com [40.107.12.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc8Kl2fwQz2xGn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 16:07:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ls2vNtKeNWU8G1nIf7hvGyOUyUAJRXmaFI0YxwGMaYa/i8kEZuJY8bA2/G1zZDbhq7iA8y1fF6bJh9uwMH6w1UTvPiF0a7/rSwRmrTo9w0VaNEXaHI5axD/ybWsRKpgFNINJrqnBFAQdKk9w+EtGKuPTNBbl7h/r4AJUTE81JdhWbq4kRaazGycgN8ypNM7FUYVBgVj0bWQo3mZwOoZpEux78B5MvxBSaAUWV80NMPTj+g5yTpZa5UbyAIQitTpwZWXadrmHQYGFPVovlEJQ7Qw7DTPTYu+HUE09I18hdHcBJ4qvkxUYN6ntuYlzbmzx6/eRr3afiHTWwTzt3XSUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LAUv4R9eny9Tfh8gb2RSsAFE99s59FG3Xq3ChVDXxs=;
 b=gNeXjDzg8ZR/FUB6o2GrH7IuaqLrJ5WyWiXIq8Ejuhx/6bOF5iU3+4wT7To5OfAijqvmxeGNbu2fwEL7yE8KTohq8LOmIp49aMjrXOeJtqzJa4WrqNsmuLIMbmpD4j/1q4NFTBVUf+pkNxIbMKMCsQjUJ5Tkw/JGNxFfKxLRER7BUb38ON7m85U6p6qNKlKUp7nuyCAtxzl9qS5O2w8PTg3Pm2MmYsDl0lwJtsSKFrU8J7Br5vkGYIfuyywO5Q55I4+ZJL9qpJpHKdTEDT0s7fLriF4rufc9rH/MU57M/TEs4u8BS2epfxJHS3Q0VgHY9NT4QPIqzzMRjWQ/9fYqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LAUv4R9eny9Tfh8gb2RSsAFE99s59FG3Xq3ChVDXxs=;
 b=wMBB1FW+lZAIEOIucnwi7eQFTcwWESDinSqHdt3ysuF+Dld2QJZ9rvg5yFqnDvogVw0t5hOUvAwfP3yHA5yFwnJeBTDiPOt+N8l/DmLd3W9okSrfTYy72FEsQuTyGZcrVKepgbclbzWfYKFd51isbV0s+4C2zhmw3USDvw5SfyEEuxK5Y0srAmulnaFjClkpOcv9T0uBIk5vuiz0unCxgIIehGCXbTwjZzu2EIOm1w2oWBHnxTncJBTrNRL/0YTpcLQ7EhecAFdBS4+gXW5svSbwsEEUg9DRnkxEypfqipalXtfJrVAtprWcDdfU7Y6cwWMIL3hm4QgPzgu5TyZqKQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Tue, 27 Sep
 2022 06:07:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 06:07:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 5/6] powerpc/64: Add support for out-of-line static
 calls
Thread-Topic: [PATCH v2 5/6] powerpc/64: Add support for out-of-line static
 calls
Thread-Index: AQHY0XNhlTbgzftlYUWN4r+snCpZxq3xsYeAgAEM1ICAAA13gA==
Date: Tue, 27 Sep 2022 06:07:03 +0000
Message-ID: <610beb16-c39f-8f40-d41b-6bc69636d8a4@csgroup.eu>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
 <20220926064316.765967-6-bgray@linux.ibm.com>
 <5bba0206-b8d8-778d-e9fa-eab2dd6c792c@csgroup.eu>
 <cf482a1dc5481c9f3d435059d8c074e9e733f5c1.camel@linux.ibm.com>
In-Reply-To: <cf482a1dc5481c9f3d435059d8c074e9e733f5c1.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3178:EE_
x-ms-office365-filtering-correlation-id: 2b1a9e28-e5df-4a2a-a630-08daa04e7fdf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ip66wTZ+DIH8ZYjZlbWlVWb+H+bVZVGR24lZF6X5KhuoWmEQEePBmB8o+cBRELQoqHHsBGaxKN0F3eShW1+L7wARaN/63I2np4zmbhP2+7xQfNk2zwCRh723Hzb0eaiDqcXXCP83aSjiIQU7ry20WbPIwYK9qR9NaUx2q65gad4NK9jaRefPOlnu6uWSbMZ47h9dkFUPgGxKxQQCm0rh6PgCV19DYghGA67tMiuP3lv2L2PCYOsl1ah6QMlqVrwPtTnF23i4d4HIYcGmsfywOa8XSMWtI6hEWfZ1TQGCA98TmGQwF+pBA9jJo4OOymuJz7Yr4mMtciZ8O2qmXbKJzVopoRnIFE1g2gRxq9YWsocVaONht/2ggypXMzC1EVSfnLd5xVmV7aRVJBJjeRrG73EZ2k5xl1YavrK3cGTaTB8oOuXeLzSVoPn3evu8vVzaMgs6qLfP6kDPkCSEZz28Jgp/X6aEGNqSfZ+jh+smOb/BrjdBmtjnX7aL00xJ0k0wbHtXAYe5fB3CfgMRVI7luDKe6cSYzmfEVJMRhcukiAjbjBUHqvF5J5zSHwNtg85ojiRnHENMcFxB+Fn4JxSfyVHjcD3fKUp/tykvh2Uy5CTJitXNweTm0KCCinwg5jYUO0J7gtRclT+WiOUmJ+ksOL1pKxOCJ/ZKQ22RFMiGQ+5JZ1SaHoxQfoMzLKJG/MZkO1bVO5cp8MCw2FUdAhFcVaiHlude0T98XISLdvq2/mxV/vq0kcyXEvcnKGjVsCKpLP4RcZc0WkcBwL4UPbHHA88WGZEedvbfmdnN3HwFGg62FbK5rQOXScLOO/Ysbac1W9cGxIHOJMHXbsfRqBICoA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199015)(31686004)(31696002)(86362001)(76116006)(91956017)(4326008)(8936002)(4744005)(44832011)(36756003)(66946007)(66476007)(66556008)(8676002)(7416002)(64756008)(122000001)(54906003)(38100700002)(316002)(5660300002)(38070700005)(110136005)(66446008)(66574015)(6486002)(6506007)(83380400001)(26005)(2906002)(6512007)(71200400001)(2616005)(478600001)(41300700001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NnJ5VmNJQXUxTUREUU9YVCs4eWVnVm1acU4yb3B5ZHhHNVpSWTNhRU9IRzMx?=
 =?utf-8?B?bUl3R3V1UXFhS281TDh0VkdyRCtHdWN2Vm1FTXMyWmtubUlUTzVXYncwN3Bk?=
 =?utf-8?B?Y2hJNjlMY3NlT0Q3K0t6Mmp2Mnluc0l5aW1LNGpNclE0c1RCUG5ON0VjRlFK?=
 =?utf-8?B?USs1V3g0YWFGMEpWNEFWUnF0dytjWm9IVC8wdjZydFZRdFV1WDcwM3pjbHZM?=
 =?utf-8?B?bWJiOFJwdmxlNEN1Q0RsOFJ4aHRNaHIwTjJZTnlLbkZReWU4QnoxRkZXYko0?=
 =?utf-8?B?UmRtMGk4RXJ4YnF0R29tTUthUTlhVk1Oc21GNjlhS3B6SzhCelphUmgza2VH?=
 =?utf-8?B?Y1BmVjlVMEdlZ2RxNkZtQnc4TndmdnNBb3BoUXByckYrYUxYelVkM09MWEtW?=
 =?utf-8?B?VEZDWGNJVExLaGJKblJLRWpXZ3M2NHpmejhZTXZ4cXdvNUlHc2lCMXVuaUJn?=
 =?utf-8?B?VjlGK29Jc3BORWpyc0ZScW5OYy82Q2hndWlNMndxQ0s0bHA0R3ZyY1FLeWRB?=
 =?utf-8?B?ZDBpTkVBNWVCb1BQOU8vbzVZQkZhcHRaMWVtNXZreGFFdm5nYThqNnB2RmVk?=
 =?utf-8?B?NWp4UHhhTysyQlI3b0p5NG14WFZFcUE0czNEbk5zTU1QOWZNOG9CME01R210?=
 =?utf-8?B?RS8vTVovSE5NeVBPakJxSVM2eDJ0SXg4TDUweDZUYWd6R1NvaXVwcGVUNndp?=
 =?utf-8?B?OEE3cEhWMlJoeUIzNjBUdnh6VE1ReGJ5dHdFQUJKUjNZaUd1SHNmVFBlQ3ZI?=
 =?utf-8?B?SDlSaDhmRkpHWWNTVFdNV3phMGRrZDF1ZVl2Rk53aTUydDh6TExKM0F5cGl6?=
 =?utf-8?B?YTYvTHljR2YxRm91b05iakhGSi9UOHEzSjRVUEZoUVhnNFlUeDlyMHpIcW5u?=
 =?utf-8?B?bk0xeU0vN1FYYVFYOFJYZ1VzREp4eE5QNldXYnMxYkhQMkp0a2N3UjRlcHIx?=
 =?utf-8?B?VHh4Q0s1MVhBOEFaRlNOWU5wdlZtTnk0YnFQQWNkRHhOYkVPMmVoZ21BblJQ?=
 =?utf-8?B?SXFTV21nWHh3VmpjZlNoakNHMi9vQmpXTnZIc2tTT1hud2YwZTBSeFhOeHNz?=
 =?utf-8?B?U0xEOWNKKzUyL0g4Z3lzUEI3bnFsemd4VWxkSTIrcDNkNE9ZU3pHMC9Ja2Z1?=
 =?utf-8?B?YVZVMUppa1FmS2RLRWRKcWEzd29VczBrWklNQjF3UXU0UVdkNGRYNlBiTVRy?=
 =?utf-8?B?M2hmVm55RWY4R3RMWUZRTlFTTHp4UC9BK1JpMEJxaEUrSmNncGNRdHR1dnRC?=
 =?utf-8?B?M2VUaFAvOE9GSFdHZUFSNnRqaFp2dTF1MG4yVFZOVGc0a2UzNzFrOWEzb1RM?=
 =?utf-8?B?Z2NzSFd3TFhCaXdHVVBNby9laS9UREoxcXRjcXR6SXlSaFFIT2FXSUliRU01?=
 =?utf-8?B?QThsU1NobUpZcDJLRk9NdXZMdDhJK2ZqZUU5TC9MdERPOUpoS2wyNGdKM1ZV?=
 =?utf-8?B?TWdBWkZ4WlVCUURFRGZjcTMxRG11L0o4UnRXWFdYL3pQYXNlYW1RMFQ0TE11?=
 =?utf-8?B?UmVaTnJKeDlabFNVMGdNbGpiTW93VUppMWJDT1N6UkcyNmFzbCtKMXVMUTZ4?=
 =?utf-8?B?OE5QK0gzYVlOb1BBQmppVEZvWFVkcitocDNSZVdHS1lCcnp5LzQvcEpiNHF6?=
 =?utf-8?B?QktsMkk2R1hEMUprR2ZmZkpFdkJSUGwxcW9kYWRubGpvVjhucEJxRDNQZG52?=
 =?utf-8?B?T0RUMlpsQVo2Yks0Q2VyNDZOZnB3Zkozc2FEWEZYWTlwMEJjOSsxRkREK0R2?=
 =?utf-8?B?d0NRc3NSdHpUeVRRVkhsSWZXS0RSdjFXbEpFZnRFZnZLTWVXempoM3NxYTh6?=
 =?utf-8?B?bUVFMDVRdTZ0UGMwRzdEY2FmY1BxOTJDbEc1clZqajRuWVQrNlRUK3lZUlYv?=
 =?utf-8?B?aERRaFJlMmdObW5HTXVsSnRVOUZ2cjNrTTNNVThPMGY3andkWW1zY3NCd29s?=
 =?utf-8?B?UXhoSzQ2NXFYUzR5UHZ6OXZJU0tpYVJsK3BuOWt5ZnJUbjFQb0ZIcm10bllj?=
 =?utf-8?B?ZVdxRlVKTU9wQi9jbjdtcDlaVWlBT2IvNDMxV0cxTjlaU2lZUjJ3b3lvNy9B?=
 =?utf-8?B?RnNiS3drRGNZNUxQZjRTQUZsRHVkTjVNYlpHQ21RMjdFeG9NV0RaWTBtOTJv?=
 =?utf-8?B?Z0lXN29WR0Urdnh1a1hSTkNVRCttdElPWFFwNlQ2N3JNajBWV0F2ZUp0L1hL?=
 =?utf-8?Q?RiLxJBBaTbCpSiOZ/vzCAp8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0263C30BED78B3448E2B099B180DA67F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1a9e28-e5df-4a2a-a630-08daa04e7fdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 06:07:03.9290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m1moAEWbeALycx4Y+eWZrmFgRXgeWd2WSiHiAW587YTPJNItZIwE4pfEK4J0I3Rb1xuJ4+QCgkRq9vYdBwGHsQcIFV9MTETRVnVMU4HIKpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3178
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzA5LzIwMjIgw6AgMDc6MTgsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gTW9uLCAyMDIyLTA5LTI2IGF0IDEzOjE2ICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPj4gQnVpbGQgZmFpbHVyZSB3aXRoIEdDQyA1LjUgKHBwYzY0bGVfZGVmY29uZmlnKToNCj4+
DQo+PiAgwqDCoCBDQ8KgwqDCoMKgwqAgYXJjaC9wb3dlcnBjL2tlcm5lbC9wdHJhY2UvcHRyYWNl
Lm8NCj4+IHtzdGFuZGFyZCBpbnB1dH06IEFzc2VtYmxlciBtZXNzYWdlczoNCj4+IHtzdGFuZGFy
ZCBpbnB1dH06MTA6IEVycm9yOiAubG9jYWxlbnRyeSBleHByZXNzaW9uIGZvcg0KPj4gYF9fU0NU
X190cF9mdW5jX3N5c19lbnRlcicgaXMgbm90IGEgdmFsaWQgcG93ZXIgb2YgMg0KPj4ge3N0YW5k
YXJkIGlucHV0fToyOTogRXJyb3I6IC5sb2NhbGVudHJ5IGV4cHJlc3Npb24gZm9yDQo+PiBgX19T
Q1RfX3RwX2Z1bmNfc3lzX2V4aXQnIGlzIG5vdCBhIHZhbGlkIHBvd2VyIG9mIDINCj4gDQo+IExv
b2tzIHN1cHBvcnQgZm9yIGEgbGl0ZXJhbCBzdF9vdGhlciB2YWx1ZSBpbiBgLmxvY2FsZW50cnlg
IGlzIGFkZGVkIGluDQo+IGJpbnV0aWxzIDIuMzIgLiBJJ2xsIGNoYW5nZSB0aGUgY29uZmlnIGVu
dHJ5IGFzIGZvbGxvd3MgZm9yIHYzOg0KPiANCj4gICAgc2VsZWN0IEhBVkVfU1RBVElDX0NBTEwg
aWYNCj4gICAgICAgIFBQQzMyIHx8IChQUEM2NF9FTEZfQUJJX1YyICYmIExEX1ZFUlNJT04gPj0g
MjMyMDApDQo+IA0KDQpXaGF0IGFib3V0IENsYW5nID8=
