Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 299C272E8B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 18:43:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mPos4U/n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgZBg01YVz30h0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 02:43:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mPos4U/n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62d; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgZ9k0HZxz30MS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 02:43:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0MEtg3ZQhZiRh74+UxXyNc666gOpSbIJ8KbcDpb+FNMjEkvrdaG+1589ObryQ11tpN8u137KGRCYv808lfiaFGSjEBa4jH7EhnI79palqRhyfYv/KJKo1l9cLAvm9Dv/hcgGriNo/I4/noKXjffCqwoDVlFuWH6IOKUEttLF3dX9MjNS9xyCZZMsDsP73THYPOJyMixqAV7tg5WIp+ZlNwDzYtG+ZC8XgrqD1GVwRlq4BhwassYna000E/6Yo6htaWNPXcwOURgTku0OfNN5fAQtvxZ9SyX0hm7eCtolFXa8cVw5M//eUhRqCEtfikNG1fGla+vqNixI7PSh+fXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FjFaRZLOeND6fx5bm+35Nfr+HTPF9UjRyQKuXFpDso=;
 b=Oc4Fl8yBQjIFxGYRCgHyR1RbYez4ug28tQrqSKzqj9dPpGDg6qj+xOHWK9lEQryqFg3WXBjPcLlbCBVQI9+ZhN5tZvZuQwiJyfMMU1uW4x2c0pogMaY7DJXv5V//5zceAzKsHPHnFIM0HFqpHj+/I/UNa1NVioQDP63eY5orTqL68tRqG2VziLMUx3DhQDYS6wQ9EOqWuGxzFk8oXe9TFDCnBjiOMY1r9SKnP4dQpE5s5zQDSu7UujsOQJ6LxiEnQLBlxM6Uhlt0SmFCZpObYqVF0PnmN3cWxJVCR9Y3zBeqbcN5s1IZF2//5rNkc/ZXd8/DsIIpGH21V296pploag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FjFaRZLOeND6fx5bm+35Nfr+HTPF9UjRyQKuXFpDso=;
 b=mPos4U/nwmvAx6EumXtwis9c2hhNrhJLqdy2yT4JSjUPLgwCgm/L49MX2feb+nEmdIqbz0BDLhqNKEZDLQ85u7NEJqEQcGTTlCN4SZ3StnQa2Af8BFttKgOj8cMmpESehoxL3oIqzCijbl07DmwpSu6z0VYYYCCMsjeKqjJFeCk9wo2FctZJFYfMPo7Nht9gYLJ6OANlRmwELwXAfj0BnK5cSUElhG04a+/mcBe9kJzBjvKDm1iZxS9ZrqF1/1lWWW8J5BovctMG1C/+AzgYIedGjTH9715jk6SGGsDDD4p4JPFEVwR0FFubvKrYwgSmL0xomJoBpfXC82Qm+TnhVA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2886.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 16:42:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6477.028; Tue, 13 Jun 2023
 16:42:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [PATCH 0/3] Move the ARCH_DMA_MINALIGN definition to asm/cache.h
Thread-Topic: [PATCH 0/3] Move the ARCH_DMA_MINALIGN definition to asm/cache.h
Thread-Index: AQHZng8ej9W0KyGZMk+LfVAZvihuNq+I8AOA
Date: Tue, 13 Jun 2023 16:42:40 +0000
Message-ID: <5cc13519-e606-4dca-b22c-2dcb7bf06d32@csgroup.eu>
References: <20230613155245.1228274-1-catalin.marinas@arm.com>
In-Reply-To: <20230613155245.1228274-1-catalin.marinas@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2886:EE_
x-ms-office365-filtering-correlation-id: 864f692b-4f3a-4cd4-c49b-08db6c2d33bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  v4ihIqQMXRG5DaD4KJJw4tLFJYp2aZ4fY40qL304rE75fl8ZNYEErkCFOUnTiPqOw8EAYOpJxNhW2qnDJ1vtTKs4mC0oAaPjys3Z0pyLo/axSA5u+Mhz+vD6TFANAkqdehpUvdgw7sqTYJoXw+Gn0MCzPZGSbX/62TPKh/XxrpjfpQjndKK6oxX2QOc2nPofn2HIGSBFwKJDDGEFig4P8MQv/gjcJwJU6dSfc/8cp032HfUKv2k2+Pt0DJnxZY2+ozqad0yN+A9NPTv7elZTDqHywYOPXfoIQgsfv8mPsdACTjwgWbM6s5D+UKYBONSrhezODNlKtQf1qLgRA0USK0hkUgi2sev+H5q1x3Vqq6/xUMh13ZpFfcBX/6jKmPYfLrihCt8mGtKSCCAPh+dVO/k9Hr7aKoGFqC3y83iPiW3LHPuEFQRUjNBkFmnVGQgyJ2LchwbpKRMspv7Nnvt3o35+R2Mc5QAAC0VULVTZcLKObPmsncuxOenVPfKl3qMlOjZscol5SBxHJlg2vPnQyM2HMVWFL6Z/LaxA5Lo7CrnB8UCXsJ+acqV1OU47ULblMQc4Xrh7A07c5CqsWoHIGw0qor8y87mK/oaSMbkH0vXHS85UHH1WwR6uqMXGUT8zRFFxEv5QicvEup52yFHwu4d2o9+gYn/4vM7DoiQx99M=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(2616005)(66574015)(83380400001)(86362001)(122000001)(38070700005)(38100700002)(36756003)(31696002)(478600001)(110136005)(54906003)(71200400001)(44832011)(4326008)(6486002)(966005)(8936002)(8676002)(2906002)(5660300002)(7416002)(64756008)(66946007)(91956017)(66446008)(66476007)(66556008)(76116006)(31686004)(316002)(186003)(41300700001)(6512007)(26005)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SHlWZmN1UjBtMXRIM2JRVEh6dXBjZndtUm1hZlUwcTIvOUUwZHRiRHJKTkhD?=
 =?utf-8?B?Qm1mMzVMSjRPakdLQlRzaWYvMVAzWHV1N0ZVV2RDRGRDZElZSTRiU2N2a1o2?=
 =?utf-8?B?UUhxVjlFczJHZ1lFQ2pCRUFRQk1CU2VMS0ZmYnQxZTFJdzRRci9kWE5NbHhG?=
 =?utf-8?B?b3dXWWIwSjBBRGhvZmFsNm9yUExLVVZlRU4yV3FxUnpxaWkvU1RSalpZd0ZD?=
 =?utf-8?B?a0RoWXQvY200NjhTYkJKVXRKWURTdGNySCtNWlpMTUJSVUk2YkdDNWZMMmxI?=
 =?utf-8?B?clQ4UXd2TnJ3OW4zd25jTDJMNzgzNjZOSnpvcGxvRGhncjMwRHhNRGN1MzQw?=
 =?utf-8?B?SCtrSVNlQStFb21WWVhMY3ZUaHVTUWcvSXE5anVJT3lmK2ptMXFGTGxra3Jo?=
 =?utf-8?B?MVlsa2tSSHZWalpIazl4ZHFISW1Oa1VaZEFscnZ5eDY2bk5FK1Noc1M0T2JM?=
 =?utf-8?B?bHN2WTNSZkUrSndabXgxblIrS3FWdXZ6ZVpNbDRzQ2s4T1dNZHFNbzhWQU5H?=
 =?utf-8?B?QllBMk5Ed005Y1dtditEdmZkUW8xOGZVREl3OVh2UUd1L1lmMjU4M3FjMWlF?=
 =?utf-8?B?UmFVbFFjbXc2TDErRDZDSElnYVA0djdDUkFuTStKcVBtQkRiQkNtWWlWSWxy?=
 =?utf-8?B?OTg1OFhJSThrZEFHam1yZi9tY3JtaGF6Q0FjSVRhNnJPRjZHcG5TOXNDLzBP?=
 =?utf-8?B?bmZSU3MwdGNaV1BPejN5S282MXl6cktNR0VXZFp0anp4RHlGTkg0MDZOU00r?=
 =?utf-8?B?SC9URTNaakFZUndPRWFWQnVZMDU5NVYyTVpiU3VSeXE5UDBtNXFGMndPWFNV?=
 =?utf-8?B?ajB4aGVGQjlOdHRTRXgzTVA3Mm41NUxBNVhaYTBWdmduUDlBRzFOTzVPMzU2?=
 =?utf-8?B?Q3hmOTdVeGFRTldZWmRsNEZPc0J6cGNOdFVnWnAyUk1DWVlRb1drSmNYQ1VD?=
 =?utf-8?B?QXlVbWFjVFhYaXFSZm1Ja3lyV3l0WTB6RjhJVEM1RUZRT2pOLzVTWmphczZD?=
 =?utf-8?B?cGxQeHpYbjl3bUg3K1NyVFJLbTRqY0h3TTZUZ2Zkbm91cCtnNEpOQ3ZaWDFX?=
 =?utf-8?B?NkRpUlFlZ1FObE55WnNtN0lqcDJtVjhYeDFkM0ZrSU5ZeWhpclFNWGVLaE1m?=
 =?utf-8?B?ZmVwZVpTZ3Azb1ZLZjZBb0ZXVVYzNlV4OHd4K3BtbFJHRHBsUVlRZGx1OWty?=
 =?utf-8?B?cENvWFFoa1RxanpwbzBNR2hidm1qWGZ5ZzZQSFlrenRPcnNjZjBGeEk5ek91?=
 =?utf-8?B?bWhQVHU5VzJMclpyMU93NWRuVUgvckVhRW9xT1kxT1Z4QVRWNEh1Y1QwZFFE?=
 =?utf-8?B?TW00OU42ZU03aTl1ZTVlRXhRYWpPMUZMR0FQdWpEY2R4M3JWM0NQR1ZBN3Rk?=
 =?utf-8?B?UVRoM1lYK3M3aGRWdXlqSTBKZFRWRUlydnVXU0MvNm9QWUV5eWt3ckt1Qng1?=
 =?utf-8?B?MVF6S0FrY2RjRVZWTU1vamlsNlM0c0tCTmNSTGQ1dlNBbUpWMjEvYWwwMzVq?=
 =?utf-8?B?bCtjRCtMaHVnS3UvYWt5T2s3YXl1K3RXODRPRmtzczd1T0NCMi85LzR6K2NV?=
 =?utf-8?B?amdOVElMOEx6WlNaTlplb3M4dHArZjNXRDRyOGZsbEpoZDZhQ3BWa21yL2p6?=
 =?utf-8?B?ZXV2YVJ5Zko2c3Y2bzFTZFdKcllmendydDhiZkhyejZ1bjl1ZjBnaGJ6ZFQ5?=
 =?utf-8?B?RTd1aitFWS93VzZwdWVua0k2V3YwUXFpckJGUmNBOVZ2ckt5UlhHWCtHR2tE?=
 =?utf-8?B?dnkxK0lYL0lab29OYjd5WDhVUmdpWWpxYkF3Wm5iLzl5dHZpS0tFeUp3WG5W?=
 =?utf-8?B?TGNIOVRJQkYxZ2ViaDJNOHJiTDIrcUdYZGtscEE2Q1VwUkkxLzYvNGNzdlI2?=
 =?utf-8?B?dk4xTCtETjZHdWM1bWlGYmRVNWtxUWNNZ2pXVHJwQkJJQ2xjeHNwZmxCV0Rv?=
 =?utf-8?B?ZVNZUU02RSswQVRzTFI0dUZSMmhRUWFuSGJTeXJ5bUdzRmk3ZmVmL1ZCZkk5?=
 =?utf-8?B?Q3dSRnpXdFBGZUYyemZxcDQ5K0hHeFBtNlNMNGc5STlqY1dHdmtaOThtTkF3?=
 =?utf-8?B?aENWVzJ4ZWxwOWMyQUpUcUYxNjg4a3NiUEFJcWFjbUJ6YW9DbkZZS1o3cDVn?=
 =?utf-8?Q?DRKYs40jCFwjfZhWpkAfW5t0P?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D54FF9D4044104CA9DC8EC1AA6D636F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 864f692b-4f3a-4cd4-c49b-08db6c2d33bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 16:42:40.0174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GVMHb7G9gtsRGG1Rw3/Sc1VShXqaLRLyLMvVn9iMsrN8LVO91l15xRzAnsKTzCOTpaMINZa4uhsU0O3ereFmI949nhHnKVuXWB5LX9CX5Gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2886
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
Cc: Michal Simek <monstr@monstr.eu>, Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzA2LzIwMjMgw6AgMTc6NTIsIENhdGFsaW4gTWFyaW5hcyBhIMOpY3JpdMKgOg0K
PiBIaSwNCj4gDQo+IFRoZSBBUkNIX0tNQUxMT0NfTUlOQUxJR04gcmVkdWN0aW9uIHNlcmllcyBk
ZWZpbmVzIGEgZ2VuZXJpYw0KPiBBUkNIX0RNQV9NSU5BTElHTiBpbiBsaW51eC9jYWNoZS5oOg0K
PiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMDYxMjE1MzIwMS41NTQ3NDItMi1j
YXRhbGluLm1hcmluYXNAYXJtLmNvbS8NCj4gDQo+IFVuZm9ydHVuYXRlbHksIHRoaXMgY2F1c2Vz
IGEgZHVwbGljYXRlIGRlZmluaXRpb24gd2FybmluZyBmb3INCj4gbWljcm9ibGF6ZSwgcG93ZXJw
YyAoMzItYml0IG9ubHkpIGFuZCBzaCBhcyB0aGVzZSBhcmNoaXRlY3R1cmVzIGRlZmluZQ0KPiBB
UkNIX0RNQV9NSU5BTElHTiBpbiBhIGRpZmZlcmVudCBmaWxlIHRoYW4gYXNtL2NhY2hlLmguIE1v
dmUgdGhlIG1hY3JvDQo+IHRvIGFzbS9jYWNoZS5oIHRvIGF2b2lkIHRoaXMgaXNzdWUgYW5kIGFs
c28gYnJpbmcgdGhlbSBpbiBsaW5lIHdpdGggdGhlDQo+IG90aGVyIGFyY2hpdGVjdHVyZXMuDQoN
CldoYXQgYWJvdXQgbWlwcyA/DQoNCmFyY2gvbWlwcy9pbmNsdWRlL2FzbS9tYWNoLWdlbmVyaWMv
a21hbGxvYy5oOiNkZWZpbmUgQVJDSF9ETUFfTUlOQUxJR04JMTI4DQphcmNoL21pcHMvaW5jbHVk
ZS9hc20vbWFjaC1pcDMyL2ttYWxsb2MuaDojZGVmaW5lIEFSQ0hfRE1BX01JTkFMSUdOCTMyDQph
cmNoL21pcHMvaW5jbHVkZS9hc20vbWFjaC1pcDMyL2ttYWxsb2MuaDojZGVmaW5lIEFSQ0hfRE1B
X01JTkFMSUdOCTEyOA0KYXJjaC9taXBzL2luY2x1ZGUvYXNtL21hY2gtbjY0L2ttYWxsb2MuaDoj
ZGVmaW5lIEFSQ0hfRE1BX01JTkFMSUdOIA0KTDFfQ0FDSEVfQllURVMNCmFyY2gvbWlwcy9pbmNs
dWRlL2FzbS9tYWNoLXR4NDl4eC9rbWFsbG9jLmg6I2RlZmluZSBBUkNIX0RNQV9NSU5BTElHTiAN
CkwxX0NBQ0hFX0JZVEVTDQoNCg0KPiANCj4gQW5kcmV3LCBpZiB0aGUgYXJjaCBtYWludGFpbmVy
cyBjYydlZCBhcmUgZmluZSB3aXRoIHN1Y2ggY2hhbmdlLCBjb3VsZA0KPiB5b3UgcGxlYXNlIHRh
a2UgdGhlc2UgdGhyZWUgcGF0Y2hlcyB0b2dldGhlciB3aXRoIHRoZQ0KPiBBUkNIX0tNQUxMT0Nf
TUlOQUxJR04gc2VyaWVzPw0KPiANCj4gVGhhbmsgeW91Lg0KPiANCj4gQ2F0YWxpbiBNYXJpbmFz
ICgzKToNCj4gICAgcG93ZXJwYzogTW92ZSB0aGUgQVJDSF9ETUFfTUlOQUxJR04gZGVmaW5pdGlv
biB0byBhc20vY2FjaGUuaA0KPiAgICBtaWNyb2JsYXplOiBNb3ZlIHRoZSBBUkNIX3tETUEsU0xB
Qn1fTUlOQUxJR04gZGVmaW5pdGlvbnMgdG8NCj4gICAgICBhc20vY2FjaGUuaA0KPiAgICBzaDog
TW92ZSB0aGUgQVJDSF9ETUFfTUlOQUxJR04gZGVmaW5pdGlvbiB0byBhc20vY2FjaGUuaA0KPiAN
Cj4gICBhcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vY2FjaGUuaCB8IDUgKysrKysNCj4gICBh
cmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vcGFnZS5oICB8IDUgLS0tLS0NCj4gICBhcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vY2FjaGUuaCAgICB8IDQgKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9wYWdlXzMyLmggIHwgNCAtLS0tDQo+ICAgYXJjaC9zaC9pbmNsdWRlL2FzbS9j
YWNoZS5oICAgICAgICAgfCA2ICsrKysrKw0KPiAgIGFyY2gvc2gvaW5jbHVkZS9hc20vcGFnZS5o
ICAgICAgICAgIHwgNiAtLS0tLS0NCj4gICA2IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KyksIDE1IGRlbGV0aW9ucygtKQ0KPiANCg==
