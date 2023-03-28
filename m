Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8D16CB7B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 09:10:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm1612PMwz3fTK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 18:10:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1asf9KA4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61f; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1asf9KA4;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm150630yz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 18:09:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpN4LmSV55tD+endaYrD+6TnVfGhdeCWVuFxx8zA4gYm4apYHwbBSktYpqo0DxYD+DsIiNfLh5qUQtEdKkmMUtehhvK3zfFByXj5VOzLDQyDXJ2HPoH1cMvkxE2YDTtOm7TbhCiFTBNzkkufp6TBb4JizBF8NHr1aVzjcpkLV4w3w/DAhxgcNl8y8R7RjHoulH/lGGURKlXxFNKUEtMInbtUijg5SJNuuYHzIP8QYAibEyA4Fa6HB0yFH8eYv8ybBVLAc+2b9J/b/92hCnjlEtZ4GC3cYUwpljnCmR0koPo6Ho+F55PeE3DHrXqoK+WsmU81v2D5kKFuh8nE1x8yig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OvbJpPoTrmxZn7LZbEhb+QqVOGrt6xz3x91m9EHhpo=;
 b=kZcP3HCKWcZayifCuYiLhGZ80NDj/7neYlOKfHmMmI71B8nnN7CLkie/s9VEpk651/5TL/LI2ukuNsHRRpzg2Mhpzt1KmosIRmTfb/peAt1NDDnDQIFdjfWqxWWA98+LTB5UyImvMDXkwAIiEV9HRstURjhUZKA8DLk/Gi3TdaO54ya/raaNyFTwkC/50LaOKoQOUEec4xNz8OS9nnmRCpTK3OkEyMWMNnv/Nhq6OPaj+FaSUHv19TPEOJ0Y5nmFYaDb07IcG5LDQfpbal0rk4jn05dn4gLqE3+baCFbk8gs2pbl6IAxteFvMfMa8eccNkZM2WMXnUyZNh2wfIOW5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OvbJpPoTrmxZn7LZbEhb+QqVOGrt6xz3x91m9EHhpo=;
 b=1asf9KA4q8L2UWWzx1Kk7BUdforiJmHIvrSq4k22Xdz7uwdQ6Ev2KsyHwBecER9LMtDjuO7aEkpfDGgfH/7tqf+EXNECUGExqem18JGkr9MCwlbzRva2kJ8Lpq9ANnhf28TrXfFzP+plhF4bibELEXCpSR3UiKtmTaF7GQeJJrXLbwfEYEQEYtZh0YB+gOCEAp5DKwxZVbNfU7guYXM7h0spUG8HnQI63er8cRrKrvZMqF4beRjc82S4nwDIgmrgtdXYQ2Udj4dnMUhcHVfsTA7iRv3hstqWNnb9wySr5YappX9K3l0PgGnCXSHzgdBOLpWrjbgoUzuEnmvTV2uN+g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3166.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 07:08:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%5]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 07:08:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/64: Rename entry_64.S to prom_entry.S
Thread-Topic: [PATCH 2/2] powerpc/64: Rename entry_64.S to prom_entry.S
Thread-Index: AQHZXxrq+8HPN7EdUkuvKUy3NcYjV68O6mKAgADazICAAAThgA==
Date: Tue, 28 Mar 2023 07:08:45 +0000
Message-ID: <9e4aa969-32d2-8797-3a99-05dab0729f17@csgroup.eu>
References: <20230325130651.2457266-1-npiggin@gmail.com>
 <20230325130651.2457266-2-npiggin@gmail.com>
 <ffded830-6081-5e8a-b51d-fd1882e9b8a8@csgroup.eu>
 <CRHTFLEGR6RH.3NTYMVN9N1WBZ@bobo>
In-Reply-To: <CRHTFLEGR6RH.3NTYMVN9N1WBZ@bobo>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3166:EE_
x-ms-office365-filtering-correlation-id: 7b81e082-75e7-4a88-53cb-08db2f5b4516
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  yd3BS1VzX+wmTMpHUKs5jQhgbGZhJZb7vw3TMHqS56CXll190xSAcu0WYXoom5bcqBP4x3J5+ZlmZE5glTy2HgIrE67ymrecjBmcYHCd6px2A8c+qf/Ea4tXfWQ33e7Iu9TufH8ZNYryccq5U2h6WQfnfl0JA8nPOnapcIrtB7SXpW8IMU6IiajQknOn9pU6klfb5F23OuoMMIvskGEDkb88JtPYkx87juuDt7QKNo9/doOlL1EBpHAUSK7aNuloELTHaeDPWV7uwUme1GVL/7DqgqJ/zaD+zOxaGa3KtzL9VI0HyL1TQSRjGoj8K+KnJ8YYsb4IhdPwqBbrrvcfXZrSBKf8OaPCTQsT76QteU/595QnSSUO3a6OCaUCHKTrITKanJWFcy3F/Tt5U5PCDxjq1NXppwS9eqQRSC7Q+HqcCwjhQswZnQu8YcsrYH2ueEiUfPikIWJjZAL2LF6ZnUTqEsGhhFR/IhC1jObrrADsMOdIIOWeaRvBLUAh9DBiWxYgxuioGOyqT5bqaAdtlQaqsvteaOIqWQaVL7Cgw9iepDcgUByLXnY5k6ZhpmKI21Xkz4H/4i6Utce9i4m1fvEHMdUWtGOfGU1EfjNbzsrsotIc/y3rNOl14sq5ugufKa3RbQNtv4CDEHcCgLkYdcAd9FDK8Crp4nv7dcDdn5SbfdQNTNSH2oXBFiLXp9Zd
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199021)(2906002)(71200400001)(44832011)(38100700002)(478600001)(86362001)(31696002)(38070700005)(6486002)(316002)(122000001)(5660300002)(66556008)(41300700001)(66446008)(64756008)(8676002)(4326008)(76116006)(6916009)(66476007)(91956017)(66946007)(8936002)(186003)(36756003)(6506007)(6512007)(66574015)(26005)(31686004)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NmlPUjJMNE9iazlNRkIyVGcwNzBYa29EbjBjNTJXdGJlSEhOc0VQYSs0Y1Vq?=
 =?utf-8?B?WmZTN1B3bnJLMDlDYVBSSnB6NmYwb1pCY3FyZzNGVnZTLytiQlVNYWVPNXdo?=
 =?utf-8?B?SU4zT0IyOEdnY1gxTENwSjIvL25LMUI4QnNqL1BDbkJMb09UMTVyM25QOGlZ?=
 =?utf-8?B?cndDb1dNSFVXbmZSZ1I1WGxVeHJpWWRqcW1zQW1VaFNETFVVelN2R1lkOXJ2?=
 =?utf-8?B?bE1sa3RoVTFLdFdtdU1BZEFHNzJWcHVvNG9LTTZKcmR0NkI4MmhxazltWDNP?=
 =?utf-8?B?RDJpdEpPQVo4Z2Q2MHNLNnNNK252T3FsTjYvZzErUmgvRnQ1MG5FV0UrZ21G?=
 =?utf-8?B?dWZqazFtdmMzRVJpS3RqanR1NU41cERjeUhxSkJjZHd4bXA3R2JBQ0JiYURU?=
 =?utf-8?B?bzdNcGJta2ozS0svd0dkSDdwckJTb2dwOHpRWFNjSEVEVytpRzJvbDM3ZGlQ?=
 =?utf-8?B?VWpHSjhoZzg3eHg0V1VGYUVlNlp4NFE1TnlWNnB5T2RQd2wyWVl1S2puTVpQ?=
 =?utf-8?B?YjJOTHJXekI2VWo2RzkxU054bjB3NGxxamhIN28zUXdQcHhCTTNsS2MxRXlk?=
 =?utf-8?B?bTNSSTQwNWMyWVg1R2E1VzAwOHNsTE9YcytXVVlFVG1KQ2p1MkptOUJ5UTND?=
 =?utf-8?B?a0VGdU9sODQ3U2libzM5b2IxSDhuYTNXM1JEajN3eXRWeGR4a3pudjJ5VElN?=
 =?utf-8?B?TVdZeTRqR0Q0bWVTWmp0Y1JJWFg1VVI5L1BtdThWMVh6TmxOdm5KUloxWjRR?=
 =?utf-8?B?UVhGbGtNMWMxZ1h3OWJMTGU0UEpwRExna0xxT1N1ZnFrWjgwL2ZVV3dWVkZE?=
 =?utf-8?B?RzdZZS9oUm1yS0U3Y1IrNi8ybXhwcURCaGxpNzYwTk9pN2FBbDlLaVhLczlp?=
 =?utf-8?B?TlFZUXB0NWwwKzJCcUtsSVdBQUlVbjhCaW5rU3FKcnY3eFZxSU5GMSt6dmM4?=
 =?utf-8?B?NG53NnRWT0JDUlJvUE5TVjh1Y1J2RUw0YTZiMUpoak9aU0lZU3BOL1R4d2Fs?=
 =?utf-8?B?QnJiZnlLN0EzdjFlSERNMW1LVk1uZWJRMHFyOTRkeHRHMlhGbWJGTW5UN1Bk?=
 =?utf-8?B?REhLN0VNdTB2cGNUWGo4UUxPaTIyT2hmcENQK1h1cUVoUlBoakJKMk5HYzVm?=
 =?utf-8?B?VVdZS2ttUm8wa3lKYk1FODJoK2xqYjEzOEZKSDJlbEI5dXpidmhEaDE5U1Az?=
 =?utf-8?B?VnQ0VTB2MkhMdlZGbXhxOEZZbmJIczc2L256V1h6b0Q3ZUFFKzZLQXRmSDB4?=
 =?utf-8?B?eldqN09Sckt6ZG1NZFB0aUFXT2RCbUMvT1VYQnNLK2hpNXFlajgzc2NabzFY?=
 =?utf-8?B?U3VmbUlHbjdRUzU0MGQxMHR2eGFYNWVXYUJIYnJtWU9za2t3WkdKTE1CVXhF?=
 =?utf-8?B?ZjN3b1h0SVpIYzZGUmx6YlFENmtxdWNVdDJVdmJRTzRFV1N3ZEhPbWhicUJn?=
 =?utf-8?B?UERKaDBkcVVRcjVHNVhubHkxbTNJWlpDUWJ6N3Q0WWNjT3k0OVJ0OTNoZElk?=
 =?utf-8?B?WHMvYjBYVVZYd29Wam1yeUxlM3oxRXVMMWxMTEZvV2wvT0xjRTVleGJIODVE?=
 =?utf-8?B?bGhIVThCMWJaT1ZGRGV1Q0FXK0xtNFlrU0w3YlF1VzN2dGoweURKdDg1aDlN?=
 =?utf-8?B?YldSUU1EQittUzU2QXRGZEJYVEZlb0lYLzduU1YvOWVhQU12ZVhEdU40b2pv?=
 =?utf-8?B?YkZmTitoV2poT2laWkswTXkwcGxuWkNvT1g0bW1GeEdjTWlVTzdSSWxZMlV6?=
 =?utf-8?B?Y1NwcldmOGFJSC9hQ002ekkyR2phTE1SRWRLc3dJTjBlcnpLU1NINUg2ZzhW?=
 =?utf-8?B?MzlVNDduQjRlUVRnNG5WaHFyclpVSXZyWmRPYnArQWhXT3JVRHFOdGwzZlBr?=
 =?utf-8?B?eCtHRENVbC9NeVF4OU1FZnhwL2RvUzlORURzcDR0cklyVVNTYXhYUGJ4QjJ3?=
 =?utf-8?B?UmRvb3lxRzJ3SGV0SHlRaVova2x4TjN6RHJjY2ZrcVMvZEN2VkFkMXd1MHhS?=
 =?utf-8?B?SGdLY1BtWkFLTUVGQlpkeEJxVFpWTnd2T2d1clh6Q2ZQR0JVMWtha05ranVY?=
 =?utf-8?B?SUVUWS8vNEQxcHFYcTlBSFpObVFLMUpidmxndEloR2xGaXlCS0VjM1hWT2Rn?=
 =?utf-8?B?dHYwL1JwWFJmSUNlMjQ2dzg0VWkyOFBxaUtwOXZOQk90Ry9PbUJZZjF4RCtM?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8744B05290513A43BCD64886C284A448@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b81e082-75e7-4a88-53cb-08db2f5b4516
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 07:08:45.0183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KZXYPxds8+b0CzUCZhPEbLQNKgxfNlQKg982pSDKNvRWl+ao9ZGFSsNO8o/0Y5UxUMhNL6G4EQHhUcrHcz4wZcSSOCLycdpR05oGgAT/MRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3166
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzAzLzIwMjMgw6AgMDg6NTEsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBPbiBUdWUgTWFyIDI4LCAyMDIzIGF0IDM6NDggQU0gQUVTVCwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+DQo+Pg0KPj4gTGUgMjUvMDMvMjAyMyDDoCAxNDowNiwgTmljaG9sYXMgUGlnZ2lu
IGEgw6ljcml0wqA6DQo+Pj4gVGhpcyBmaWxlIGNvbnRhaW5zIG9ubHkgdGhlIGVudGVyX3Byb20g
aW1wbGVtZW50YXRpb24gbm93Lg0KPj4+IFRyaW0gaW5jbHVkZXMgYW5kIHVwZGF0ZSBoZWFkZXIg
Y29tbWVudCB3aGlsZSB3ZSdyZSBoZXJlLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogTmljaG9s
YXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4NCj4+PiAtLS0NCj4+PiAgICBhcmNoL3Bvd2Vy
cGMva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgOCArKystLQ0KPj4+ICAgIC4u
Li9rZXJuZWwve2VudHJ5XzY0LlMgPT4gcHJvbV9lbnRyeS5TfSAgICAgICB8IDMwICsrLS0tLS0t
LS0tLS0tLS0tLS0NCj4+PiAgICBzY3JpcHRzL2hlYWQtb2JqZWN0LWxpc3QudHh0ICAgICAgICAg
ICAgICAgICAgfCAgMiArLQ0KPj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAzMSBkZWxldGlvbnMoLSkNCj4+PiAgICByZW5hbWUgYXJjaC9wb3dlcnBjL2tlcm5lbC97ZW50
cnlfNjQuUyA9PiBwcm9tX2VudHJ5LlN9ICg3MyUpDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZSBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvTWFrZWZpbGUN
Cj4+PiBpbmRleCBlYzcwYTE3NDg1MDYuLmViYmEwODk2OTk4YSAxMDA2NDQNCj4+PiAtLS0gYS9h
cmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxlDQo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5l
bC9NYWtlZmlsZQ0KPj4+IEBAIC0yMDksMTAgKzIwOSwxMiBAQCBDRkxBR1NfcGFjYS5vCQkJKz0g
LWZuby1zdGFjay1wcm90ZWN0b3INCj4+PiAgICANCj4+PiAgICBvYmotJChDT05GSUdfUFBDX0ZQ
VSkJCSs9IGZwdS5vDQo+Pj4gICAgb2JqLSQoQ09ORklHX0FMVElWRUMpCQkrPSB2ZWN0b3Iubw0K
Pj4+IC1vYmotJChDT05GSUdfUFBDNjQpCQkrPSBlbnRyeV82NC5vDQo+Pj4gLW9iai0kKENPTkZJ
R19QUENfT0ZfQk9PVF9UUkFNUE9MSU5FKQkrPSBwcm9tX2luaXQubw0KPj4+ICAgIA0KPj4+IC1l
eHRyYS0kKENPTkZJR19QUENfT0ZfQk9PVF9UUkFNUE9MSU5FKQkrPSBwcm9tX2luaXRfY2hlY2sN
Cj4+PiAraWZkZWYgQ09ORklHX1BQQ19PRl9CT09UX1RSQU1QT0xJTkUNCj4+DQo+PiBZb3UgZG9u
J3QgbmVlZCB0aGF0IGlmZGVmIGNvbnN0cnVjdCwgeW91IGNhbiBkbzoNCj4+DQo+PiBvYmo2NC0k
KENPTkZJR19QUENfT0ZfQk9PVF9UUkFNUE9MSU5FKSArPSBwcm9tX2VudHJ5Lm8NCj4gDQo+IE5p
Y2UuIFNvIHRoYXQgY291bGQgaGF2ZSBiZWVuIG9iajY0LXkgZnJvbSB0aGUgc3RhcnQ/DQoNClll
cywgYWxsdGhvdWdodCBpdCBpcyBub3QgdXNlZCB0aGF0IHdheSBpbiBwcGMva2VybmVsL01ha2Vm
aWxlOg0KDQokIGdpdCBncmVwIC1lIG9iajY0IC1lIG9iajMyIGFyY2gvcG93ZXJwYy9rZXJuZWwv
TWFrZWZpbGUNCmFyY2gvcG93ZXJwYy9rZXJuZWwvTWFrZWZpbGU6b2JqNjQtJChDT05GSUdfSElC
RVJOQVRJT04pICAgICAgICArPSANCnN3c3VzcF9hc202NC5vDQphcmNoL3Bvd2VycGMva2VybmVs
L01ha2VmaWxlOm9iajY0LSQoQ09ORklHX0FVRElUKSAgICAgICAgICAgICAgKz0gDQpjb21wYXRf
YXVkaXQubw0KYXJjaC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZTpvYmo2NC0kKENPTkZJR19QUENf
VFJBTlNBQ1RJT05BTF9NRU0pIA0KKz0gdG0ubw0KYXJjaC9wb3dlcnBjL2tlcm5lbC9NYWtlZmls
ZTpvYmotJChDT05GSUdfUFBDNjQpICAgICAgICAgICAgICAgICs9IA0KJChvYmo2NC15KQ0KYXJj
aC9wb3dlcnBjL2tlcm5lbC9NYWtlZmlsZTpvYmotJChDT05GSUdfUFBDMzIpICAgICAgICAgICAg
ICAgICs9IA0KJChvYmozMi15KQ0KDQpCdXQgaXQgaXMgaW4gcHBjL2xpYi9NYWtlZmlsZToNCg0K
JCBnaXQgZ3JlcCAtZSBvYmo2NCAtZSBvYmozMiBhcmNoL3Bvd2VycGMvbGliL01ha2VmaWxlDQph
cmNoL3Bvd2VycGMvbGliL01ha2VmaWxlOm9iajY0LXkgICAgICAgKz0gY29weXBhZ2VfNjQubyBj
b3B5dXNlcl82NC5vIA0KbWVtXzY0Lm8gaHdlaWdodF82NC5vIFwNCmFyY2gvcG93ZXJwYy9saWIv
TWFrZWZpbGU6b2JqNjQtJChDT05GSUdfU01QKSAgICs9IGxvY2tzLm8NCmFyY2gvcG93ZXJwYy9s
aWIvTWFrZWZpbGU6b2JqNjQtJChDT05GSUdfQUxUSVZFQykgICAgICAgKz0gdm14LWhlbHBlci5v
DQphcmNoL3Bvd2VycGMvbGliL01ha2VmaWxlOm9iajY0LSQoQ09ORklHX0tQUk9CRVNfU0FOSVRZ
X1RFU1QpICAgKz0gDQp0ZXN0X2VtdWxhdGVfc3RlcC5vIFwNCmFyY2gvcG93ZXJwYy9saWIvTWFr
ZWZpbGU6b2JqNjQteSAgICAgICAgICAgICAgICAgICAgICAgKz0gcXVhZC5vDQphcmNoL3Bvd2Vy
cGMvbGliL01ha2VmaWxlOm9iai0kKENPTkZJR19QUEM2NCkgKz0gJChvYmo2NC15KQ0KDQpDaHJp
c3RvcGhlDQo=
