Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459475591C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 07:19:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTlly0ccyz3chl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 15:19:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=vOn6Jite;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.43; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=vOn6Jite;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90043.outbound.protection.outlook.com [40.107.9.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTll968Zmz2yxj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 15:18:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5ujpY4LOLf/fyHtDz53xnTmmGkVX3WJc5NCudVpvwSkMN57zEx4NoAJujKYbvSW4YY1T0hSualpvTvR8aJVOKJfyhok9Kg3WAw2plwK1Ln202xifFlHptwxT/SB3XkzsSy30wefQ9FNJkpmJfBXw786tPWy1V97nGzaQpPmtNZx9Gg2cWJNuAM+lBbhbXhH9dML0W+qg9Gl9oPx1cf4x3HKjjEYUFsUZgIY51N/UOzJQ+W4R6g/UWhjWANcJEIk9jAibEIjbSGKlTHYbcU/W86EAlTzxQALpktXPiFVCCMkSX4fqUHy2uP3tvaPUvzV2n9vAodixRKBuHuG8jIGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=et9H1+2DDQRIpe1BfwD29ebJ0hAwfQZc8FSAsTIJEY0=;
 b=bvPcgfgwgaZy9kTNs6/+UyzSENf+DFX4VSa+lui0dcZ2llUXyZ8e8wl1K+Gp7DFRdojeAFpw7TqnCtcB2xq8/rFekxc14Nd/uY9gjy/OmuK3UbtXiuDS3+vpwFX9MNiWkh6v9UiwC9ZTDYbR+uB/zqe2c2ujdpuV5SNUyyu3a7xr+iOLd2Lu37jZmaXbmOVQfeGdsdFbY8371hzTve+zVP2Lhtms0VCtHgOfyuupQ4HS3ipNb4rSkbc68it+0HPZaKl6QhrcZnhxDfxoZC5PWGDppwRbkxejG/B3VBCITaU+yrkO14CoqX0K1i8XazXpiC0V0jTxjCiTvmjKYU0gDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=et9H1+2DDQRIpe1BfwD29ebJ0hAwfQZc8FSAsTIJEY0=;
 b=vOn6JiteQoJ8oWRIIwBgDCdezROR3CscjC1IYmz/8jmf4p06OZOiJ94BZ1MHQiqslYbqobAzVVkubLfqJlB6LVCnSGIh0vW8pxYTHvkGOJOOqAbBOYWRZ7MprJRbivzO+ZGzT4AyEy8dO/ktPBDr3RBWwFnoOEa/DgiPrw9O96db3kKEnP7yWMszyofAURIZSKv+Pd5aSxqW8LXRLi7R3/jlXQvVdx5QLiIOZhAIJprp3jTBBrIC7nSabMEXLqKVhxBmOnYy5igtRED2IMWtGg+35ckHyv/tkgd8fhZpLWlP2luBs7O1u4693mZGctO18zXRsHtI3qBQCQiv5XynlQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3068.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 24 Jun
 2022 05:18:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.015; Fri, 24 Jun 2022
 05:18:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V4 03/26] powerpc/mm: Move protection_map[] inside the
 platform
Thread-Topic: [PATCH V4 03/26] powerpc/mm: Move protection_map[] inside the
 platform
Thread-Index: AQHYh4UT4ajuZYkeKEiGebOQBcEAVq1eBIaA
Date: Fri, 24 Jun 2022 05:18:07 +0000
Message-ID: <bce16cfe-45e1-6417-2a01-6a3ff6b67077@csgroup.eu>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-4-anshuman.khandual@arm.com>
In-Reply-To: <20220624044339.1533882-4-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3183549-7a8f-476e-7fdd-08da55a0ec55
x-ms-traffictypediagnostic: MRZP264MB3068:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  y6CgI+NECbWD43LzkQnWrSTNmYE7u3OrJWNKkuTK47bpYVXxDVs+TxpRtTzMuUwS0XljzfEAfCVqeQflG91Ze0RLUzE+3Tn2WdtS1uNQDZITrH0OfwbxwC1dw452ExHF8ETuCSTY/QOb1vwqOgRqozLcV8spOI1a89SEumTc12l4RR9n0PGKmSMKY5tvqNGfT5J+gO4gCdQdGZpQFHf+Tbwj2FbrrEj0deFcasUpw4hUJTfYHM1AJ1c+mhziw6e+m/JMK9Zu/IOgo9z+fkq5kSYs/pRO0lCRAEaTGZXAjb5+wa6qH+eSEFkafsKo6OzNHdAsVckAXaKyIMtAAhKXtV2w+R8nnESqXdf2xg3+hlSFvjjUo5gloeHoiFxZPQEBQTBkwmme/I1/H1eX9Zbg+8EZOezC1kZhIdv5oYOvG7ER47sW1dzPT2txdlAUrMETyL7SRT8jKOiqzCyYk81pSKkS8B1KVDJIwOWv3eTrOd79EWSobHsP0rIMr35jjhmvD8zGogcWED8qFcZbfY6AJ1A5e3T5jIMHAPUIhUKo7DFEiKoRxAJbFa6vSUSw3FN20haU31wxyj+osMjdJHxGMNdEgfXcizsKXEEbeLQsabECv/5NyLZkH+VtN/Ui6gjf08x5HYC2R2YYHFjrIFRe9RrCDBzAG6Fgm0RMglJ9H+FV5y7WEzUa3sBg31HQJRxzoeNlA8A2V/fXfFEYjwnjQlrTspWvedsFZpFkvGawtAHZz4iMUjXYCSGXig8+ipXFrfk8U5lEOKcevacpaCKihUUXlV0xWsCAUNWPZULtOskGgSUWct5+NS7O7cNTs9Mx9+Uo5qvdCeoZOM732c99VPJR71KGrgTezqHdg++gUTc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(6512007)(83380400001)(6506007)(38100700002)(31686004)(478600001)(6486002)(2906002)(316002)(36756003)(41300700001)(26005)(2616005)(54906003)(31696002)(66556008)(8676002)(76116006)(4326008)(91956017)(66476007)(66446008)(66946007)(64756008)(71200400001)(44832011)(122000001)(7416002)(8936002)(186003)(38070700005)(110136005)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V1pETXB3dXlveVlwYVM3Vm9taVNVaWdrb01WYlRvaTg3R3N3YzdRTGNDbmoz?=
 =?utf-8?B?R25OeWpLSXJtUks5UDFqQlNheFVYalRMUE9VS2NVQTcxYVBNM2RnaXdlRm9C?=
 =?utf-8?B?ajJ4VkN5Tkp1V2tZQzExR3dUQ3owQTZ0UkF3UXBuU0R5ZkhaaHVSV0s5cU9k?=
 =?utf-8?B?WWVHbDlNK2lTVXZmM0JmWUFjT1FXNVkrRUxmYWl4Yjl2SVNZT3JETXpmZmw4?=
 =?utf-8?B?dHNzUitpOVNZc0o0YzVSTVpqSGhVSlZLV2dKOFY4NTkyTzJpZUUzQTNwLzFa?=
 =?utf-8?B?NWhjVWU4bzR3OFlXWjU3MGVCaUltWDk2NC8zSjFvYUpQM3JnK0tqTzVqdW40?=
 =?utf-8?B?d0FPRWRiQWlQRUhkUFZRcTVRK1BLRHUyT0NKY0NWQ1FPbWhXRmcwczhOZGg3?=
 =?utf-8?B?Z1d4Snp0a1FLTjRHZ1dONnFCeFBDTVduT2RqclBhSXIwK0x4bEFreFZKOEl5?=
 =?utf-8?B?cHg1V3BZdS9teWo3VWNSSVh5ZjZEQWcwU09FcnpRaWJpSVBrczNibkFoZ0xX?=
 =?utf-8?B?QmUrMmlselV5VHBDWVlTUzg4R21BeHUyTExQaThRVWdCSEVhNkVSVk5QSkRD?=
 =?utf-8?B?YU9lK09hOWQrY2JzZ3FpamRudXl5ajFYdzlVR0VwTnJvd25DVTZaU0Zac1V1?=
 =?utf-8?B?aXZHR3VHd3JRTElVamtxU0U2K1lRazZCQU1BK3NrckNKa255N05hQUF6N01B?=
 =?utf-8?B?RlFqdEU4bTQvMVlrdjBSYk9pRkJWT2p4R04vc1E3dklzc2lPdFQ2ZmhqVzUv?=
 =?utf-8?B?WXg1RU9iOE84ZU5oTFI5WlhTY0NwaFBPTWpoL05rMHJIV2R5UEt2eFB0cC9h?=
 =?utf-8?B?RTZjbUdrdGNXZkFLZ3ZGTkFSNFFITUMyZjBxam5vQTBFTGxtUVVndmdyT1lK?=
 =?utf-8?B?M3F5VEhYSnN2UllWQXJoRTJMVFFua0xDZW9YY202NzZ2OW5LTUJjaDcvT2Zt?=
 =?utf-8?B?QmFMWmZNR290N05MTlkxZTJIcWJUWnFtOGpPYjBuL210cVRmdUx2TVYxbW9M?=
 =?utf-8?B?QndicU1yZ1FURlBkcnNEUWJtZy9ZeUp1TDV6U0NTSVFhSFh0Zzg3TUJKaW94?=
 =?utf-8?B?SGlFRlJDanhEZUxuTDU2c3A3YzlTeUdjbmp5ZU80K0lFUnRjdkJjOWJHZ0FK?=
 =?utf-8?B?eDdVcGdLTTF1M3Z4ZURibGVRalNmRGVoajNDZ3JaNjJnaTRTOEZjMVR5bVp3?=
 =?utf-8?B?cDI2OWRXVVhaMWxhRGoxTzNZL0VQZ3p6NU5PVmFiZXg4QTRPMGhWSXFDSjBz?=
 =?utf-8?B?NGdhU29PSGx1VzdvN1NhQ1RndC82SGVLRjRhdVJ3ZjA5MmJyQXgxVmdMZE93?=
 =?utf-8?B?NzBRcjZWTERvaXhxSmdqZ25EOG1qa3FjRlpCSmxBaStVWHBIcWw0T1JBTnl6?=
 =?utf-8?B?bVFadVhTWGw0Q0prL2VJRUx6aEZmai9tK3IreE50M0JmcmxxRUM5aW41ZUNC?=
 =?utf-8?B?dmtnVVlhODJXQ2NEeXNzekYzdjB4Wi9JQk1sNVdTalozWXFRVk9hU3BiMWRy?=
 =?utf-8?B?VGVsQ1JLVUsvZTR5ZnYvVHNXWk1NOVZienYvWmtKdDVoSzAxSFE1ZFdHUVdI?=
 =?utf-8?B?dm5YTXExWGlHb3lLZzZnMXlnbkF6RmZvWDl5TUxnSTZsMzFrUkVYL3dhM3ly?=
 =?utf-8?B?NnV5R00yY2phZGNGN3NvdDZhMmxWRFpzaENDaDVOK1NWRHFYMzZ6N2xuSlNn?=
 =?utf-8?B?cVAxOVhNTzBwMStYdVRmZmpWYzgvQTlUQ0lGRGZ2Umd4c04zTXJnUzA0dDdz?=
 =?utf-8?B?cmxFVmkrZVhhaWQ2eXR1bm5VSjlNb3ZCaDA0V3REdTJlVWp1cC9lSk5vSmhZ?=
 =?utf-8?B?WEFBclB6elo0dHJxaEpmM3RXYUN2d2k0K3BHaHRQRjVlb3ZGQWFqZmRVQUhx?=
 =?utf-8?B?cjA0ZmlmUEEycm5DY1E2eFQ1VFdyUFhvUjdma3VmMjF2U3hORXpZVzg1ZnRs?=
 =?utf-8?B?YWY2UTViMnlGU1Y2T2JNL204V0JlN2Q2NjdSRVRMSWYrQjF4NVpMSVdCYkZF?=
 =?utf-8?B?OVRmbXRrd3BxZkdaSEtTYUJ5YXFwRUp5dEJ1bTlndXZ3Z29nbXV6Yk5teitU?=
 =?utf-8?B?T2dwSmk5ZEJkOG1JUHZ6Yk9uZndWdHk2VnVNcEtVdE8vYkV6RThtVzBCUXc5?=
 =?utf-8?B?aVdkaTR4U0tEZ0E0WU1icFRqSzR5Mm9HSElVcHJlTmdXUlI5Z3JMTW1rcFFo?=
 =?utf-8?Q?sQjhGbW83Rrdlkgcukk7nMc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <740D0487E603EF46A82382D21BE65E29@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a3183549-7a8f-476e-7fdd-08da55a0ec55
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 05:18:07.4189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mwqosb8RQ1O/72BvJyHNYjxjtUzdlPMZ6ND5bfFbbbkk0FD4yoL/WpJH8eOesQMQpxe2pjZJLLnXlAnHTvT4/bgOfF43GgKCtQrCOWuo7kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3068
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecore
 s.org" <openrisc@lists.librecores.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA2LzIwMjIgw6AgMDY6NDMsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IFRoaXMgbW92ZXMgcHJvdGVjdGlvbl9tYXBbXSBpbnNpZGUgdGhlIHBsYXRmb3JtIGFuZCB3
aGlsZSBoZXJlLCBhbHNvIGVuYWJsZQ0KPiBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UIG9uIDMy
IGJpdCBwbGF0Zm9ybXMgdmlhIERFQ0xBUkVfVk1fR0VUX1BBR0VfUFJPVC4NCg0KTm90IG9ubHkg
MzIgYml0IHBsYXRmb3JtcywgYWxzbyBub2hhc2ggNjQgKGFrYSBib29rM2UvNjQpDQoNCj4gDQo+
IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+IENjOiBQYXVsIE1h
Y2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4NCj4gQ2M6IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dp
bkBnbWFpbC5jb20+DQo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZw0KPiBDYzog
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBL
aGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dl
cnBjL0tjb25maWcgICAgICAgICAgICAgICB8ICAyICstDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL3BndGFibGUuaCB8IDIwICstLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgYXJjaC9wb3dl
cnBjL21tL3BndGFibGUuYyAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgIDMgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2Nv
bmZpZw0KPiBpbmRleCBjMmNlMmU2MGM4ZjAuLjEwMzVkMTcyYzdkZCAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL0tjb25maWcNCj4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gQEAg
LTE0MCw3ICsxNDAsNyBAQCBjb25maWcgUFBDDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19USUNLX0JS
T0FEQ0FTVAkJaWYgR0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1QNCj4gICAJc2VsZWN0IEFS
Q0hfSEFTX1VBQ0NFU1NfRkxVU0hDQUNIRQ0KPiAgIAlzZWxlY3QgQVJDSF9IQVNfVUJTQU5fU0FO
SVRJWkVfQUxMDQo+IC0Jc2VsZWN0IEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QJaWYgUFBDX0JP
T0szU182NA0KPiArCXNlbGVjdCBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgCXNlbGVj
dCBBUkNIX0hBVkVfTk1JX1NBRkVfQ01QWENIRw0KPiAgIAlzZWxlY3QgQVJDSF9LRUVQX01FTUJM
T0NLDQo+ICAgCXNlbGVjdCBBUkNIX01JR0hUX0hBVkVfUENfUEFSUE9SVA0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmgNCj4gaW5kZXggZDU2NGQwZWNkNGNkLi5iZjk4ZGI4NDQ1NzkgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBAQCAtMjAsMjUgKzIwLDYgQEAg
c3RydWN0IG1tX3N0cnVjdDsNCj4gICAjaW5jbHVkZSA8YXNtL25vaGFzaC9wZ3RhYmxlLmg+DQo+
ICAgI2VuZGlmIC8qICFDT05GSUdfUFBDX0JPT0szUyAqLw0KPiAgIA0KPiAtLyogTm90ZSBkdWUg
dG8gdGhlIHdheSB2bSBmbGFncyBhcmUgbGFpZCBvdXQsIHRoZSBiaXRzIGFyZSBYV1IgKi8NCj4g
LSNkZWZpbmUgX19QMDAwCVBBR0VfTk9ORQ0KPiAtI2RlZmluZSBfX1AwMDEJUEFHRV9SRUFET05M
WQ0KPiAtI2RlZmluZSBfX1AwMTAJUEFHRV9DT1BZDQo+IC0jZGVmaW5lIF9fUDAxMQlQQUdFX0NP
UFkNCj4gLSNkZWZpbmUgX19QMTAwCVBBR0VfUkVBRE9OTFlfWA0KPiAtI2RlZmluZSBfX1AxMDEJ
UEFHRV9SRUFET05MWV9YDQo+IC0jZGVmaW5lIF9fUDExMAlQQUdFX0NPUFlfWA0KPiAtI2RlZmlu
ZSBfX1AxMTEJUEFHRV9DT1BZX1gNCj4gLQ0KPiAtI2RlZmluZSBfX1MwMDAJUEFHRV9OT05FDQo+
IC0jZGVmaW5lIF9fUzAwMQlQQUdFX1JFQURPTkxZDQo+IC0jZGVmaW5lIF9fUzAxMAlQQUdFX1NI
QVJFRA0KPiAtI2RlZmluZSBfX1MwMTEJUEFHRV9TSEFSRUQNCj4gLSNkZWZpbmUgX19TMTAwCVBB
R0VfUkVBRE9OTFlfWA0KPiAtI2RlZmluZSBfX1MxMDEJUEFHRV9SRUFET05MWV9YDQo+IC0jZGVm
aW5lIF9fUzExMAlQQUdFX1NIQVJFRF9YDQo+IC0jZGVmaW5lIF9fUzExMQlQQUdFX1NIQVJFRF9Y
DQo+IC0NCj4gICAjaWZuZGVmIF9fQVNTRU1CTFlfXw0KPiAgIA0KPiAgICNpZm5kZWYgTUFYX1BU
UlNfUEVSX1BHRA0KPiBAQCAtNzksNiArNjAsNyBAQCBleHRlcm4gdm9pZCBwYWdpbmdfaW5pdCh2
b2lkKTsNCj4gICB2b2lkIHBva2luZ19pbml0KHZvaWQpOw0KPiAgIA0KPiAgIGV4dGVybiB1bnNp
Z25lZCBsb25nIGlvcmVtYXBfYm90Ow0KPiArZXh0ZXJuIHBncHJvdF90IHByb3RlY3Rpb25fbWFw
WzE2XSBfX3JvX2FmdGVyX2luaXQ7DQo+ICAgDQo+ICAgLyoNCj4gICAgKiBrZXJuX2FkZHJfdmFs
aWQgaXMgaW50ZW5kZWQgdG8gaW5kaWNhdGUgd2hldGhlciBhbiBhZGRyZXNzIGlzIGEgdmFsaWQN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMgYi9hcmNoL3Bvd2VycGMv
bW0vcGd0YWJsZS5jDQo+IGluZGV4IGU2MTY2YjcxZDM2ZC4uNjE4ZjMwZDM1YjE3IDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9t
bS9wZ3RhYmxlLmMNCj4gQEAgLTQ3MiwzICs0NzIsMjcgQEAgcHRlX3QgKl9fZmluZF9saW51eF9w
dGUocGdkX3QgKnBnZGlyLCB1bnNpZ25lZCBsb25nIGVhLA0KPiAgIAlyZXR1cm4gcmV0X3B0ZTsN
Cj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTF9HUEwoX19maW5kX2xpbnV4X3B0ZSk7DQo+ICsNCj4g
Ky8qIE5vdGUgZHVlIHRvIHRoZSB3YXkgdm0gZmxhZ3MgYXJlIGxhaWQgb3V0LCB0aGUgYml0cyBh
cmUgWFdSICovDQo+ICtwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsxNl0gX19yb19hZnRlcl9pbml0
ID0gew0KDQpJIGNhbid0IHNlZSBhbnkgcGxhY2Ugd2hlcmUgcHJvdGVjdGlvbl9tYXBbXSBnZXRz
IG1vZGlmaWVkLiBUaGlzIGNvdWxkIA0KYmUgbWFkZSBjb25zdC4NCg0KPiArCVtWTV9OT05FXQkJ
CQkJPSBQQUdFX05PTkUsDQo+ICsJW1ZNX1JFQURdCQkJCQk9IFBBR0VfUkVBRE9OTFksDQo+ICsJ
W1ZNX1dSSVRFXQkJCQkJPSBQQUdFX0NPUFksDQo+ICsJW1ZNX1dSSVRFIHwgVk1fUkVBRF0JCQkJ
PSBQQUdFX0NPUFksDQo+ICsJW1ZNX0VYRUNdCQkJCQk9IFBBR0VfUkVBRE9OTFlfWCwNCj4gKwlb
Vk1fRVhFQyB8IFZNX1JFQURdCQkJCT0gUEFHRV9SRUFET05MWV9YLA0KPiArCVtWTV9FWEVDIHwg
Vk1fV1JJVEVdCQkJCT0gUEFHRV9DT1BZX1gsDQo+ICsJW1ZNX0VYRUMgfCBWTV9XUklURSB8IFZN
X1JFQURdCQkJPSBQQUdFX0NPUFlfWCwNCj4gKwlbVk1fU0hBUkVEXQkJCQkJPSBQQUdFX05PTkUs
DQo+ICsJW1ZNX1NIQVJFRCB8IFZNX1JFQURdCQkJCT0gUEFHRV9SRUFET05MWSwNCj4gKwlbVk1f
U0hBUkVEIHwgVk1fV1JJVEVdCQkJCT0gUEFHRV9TSEFSRUQsDQo+ICsJW1ZNX1NIQVJFRCB8IFZN
X1dSSVRFIHwgVk1fUkVBRF0JCT0gUEFHRV9TSEFSRUQsDQo+ICsJW1ZNX1NIQVJFRCB8IFZNX0VY
RUNdCQkJCT0gUEFHRV9SRUFET05MWV9YLA0KPiArCVtWTV9TSEFSRUQgfCBWTV9FWEVDIHwgVk1f
UkVBRF0JCQk9IFBBR0VfUkVBRE9OTFlfWCwNCj4gKwlbVk1fU0hBUkVEIHwgVk1fRVhFQyB8IFZN
X1dSSVRFXQkJPSBQQUdFX1NIQVJFRF9YLA0KPiArCVtWTV9TSEFSRUQgfCBWTV9FWEVDIHwgVk1f
V1JJVEUgfCBWTV9SRUFEXQk9IFBBR0VfU0hBUkVEX1gNCj4gK307DQo+ICsNCj4gKyNpZm5kZWYg
Q09ORklHX1BQQ19CT09LM1NfNjQNCj4gK0RFQ0xBUkVfVk1fR0VUX1BBR0VfUFJPVA0KPiArI2Vu
ZGlm
