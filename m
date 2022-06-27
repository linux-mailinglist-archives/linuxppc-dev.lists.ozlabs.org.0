Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5E855B7D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 07:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWcJy1KPQz3dtl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 15:50:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Eb5KZeBy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.47; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Eb5KZeBy;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90047.outbound.protection.outlook.com [40.107.9.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWcGH5vpmz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:48:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTtD16Ci9TAiTi5TZAWv35K9dtXV/9gN/9VaficB1CH1KEMqRij4NW46m5MSMHm1bLeLN54Ew7IF/IYdWZA/GfzinlQsB8CDRSQUgTe9TcQyWS0DE/ZDptzP32uSca52FFXHMuzjiKfScYYRs163AQhlwQxuEpmBD/4RiR55Drwitwr1Z0egc6YuE7HktQhhzn7X9V1A3A8ziaN/mLt4mK36iPZsfIEfD6fl/1sUC5R1yWZBTBDvVThttN40nBz7XkILr7K7vX+TipcA3Qr70VXjk0tFWxWZMDi7QKz3nInR65+cT2f8cl5t7b0sQU4TawlkCJr4Oa8hwjsUKtnR5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56ZSeZbZHcmrW7B2nJrcfSt8T2Q+4BiMpN5kJ3y6eqY=;
 b=AOiBA/Yz4II59XzhDc6c5g2CcU6vR42zZlHIMwDEsToUvl07y9PUc2IiUWKdAanURtUSHMhoMnI/xBP0O8XPfNhGinwKl5CKRhE2dMKx+Nil1SRQOKc+2ETBiwmrHJko/SJbJ1OJWLRi0w0KPZ5M14bD5OrOPW499PpwPL3dNCn/q3BgRx+XSGBBcdQkYPyXZEY53qJo0tUOht18ujIW1KROfj4En/YDb/1s3NRi5c5XKR2Y7ajnqdVIjx0PnLJg6hsR3QbYcorP6zVNMegjUiyxrpUZfhJGOsDjo7e5iVLXOiHEBHhBalGvIYQhJ4c9EeCpEsEvAXEml977DcBNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56ZSeZbZHcmrW7B2nJrcfSt8T2Q+4BiMpN5kJ3y6eqY=;
 b=Eb5KZeByFRScP4EwT1PnU5lNrC2HfX/pMFfNDUtZOOqto4Tl3SuoUQ6IgyCYdabXpm+r+d1HjjUKdIE9izgcoYAOMGGn1PX5byYQirE4TepNw5YkrvtVV7sgjeDfR7Ivd8DtmDumFOeHcCCfp7q4NYeDuaHKHGhQK34Q0bQh2fMbKYJdHl2enoQyc5nveOyqMdxGG2KP+DleaIrDufMMrpv6UgxVY2y8SnoPWjk2FQD1SBIhuaEumJdAtgIAN6D21L9x/nB+trGqpZjE1YsZd3HzKB48awnzJAdMaD0Jg6VsemztqTxs25WNl+10/igM+uCFoTE6Sz/Im7Ul+Zb4hw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1617.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 05:48:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 05:48:16 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V4 07/26] mm/mmap: Build protect protection_map[] with
 ARCH_HAS_VM_GET_PAGE_PROT
Thread-Topic: [PATCH V4 07/26] mm/mmap: Build protect protection_map[] with
 ARCH_HAS_VM_GET_PAGE_PROT
Thread-Index: AQHYh4UmuFs6WyWI+EODK+/fOi1l/61iw/MA
Date: Mon, 27 Jun 2022 05:48:16 +0000
Message-ID: <34116484-b5fe-3be7-b93e-0969510ba2d8@csgroup.eu>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-8-anshuman.khandual@arm.com>
In-Reply-To: <20220624044339.1533882-8-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0787cdd4-9a46-4b3a-e711-08da5800a20f
x-ms-traffictypediagnostic: MR1P264MB1617:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zaY8TrOnTPZNeJtihIYZWDomM5d6D0GPGuZRDhMv1OOmtZeZHfYFVifsXrxFq7zGvDqn7qNWWydmZdGQCSfF7aP6D9M4xMwbC+cEPUhM/h7IMeUwJLGjhlybR+aTsJPZep1OeG8uWvxQtiCGvf+lzwsCxg3hTLpedjr61tbFAVl7WPHTXezP1acdqeJE7JueGDrHKkRRpdTtemefRptjRwsXP+zAW7CM+aSiDPqV5BGyG21B43Jg3xzSqnozyDOqHnpbUme3zdWSmqFSMIydh0CDCknlq6sCcQGvR/9c+PsMCr0EtMtctb6B7jOSmQod7RxEOfMOqMz3VKwi+y21F9+cGZIu7vauCOnrKC/94k/rjjtvTc2+JTZImfLXVTKRANlIBsMuRRSrPankvZcbJ8OG1wKqDaHN1WwSw1G23yAEGViGp+/KobgEdNlL3yViirNwrlmflCanZ5jfc1J1cDH5z6z9YTwDlcEqaHYT2k2XUl9glXJJJGxxVf9MWqrNRtlvBp3QYwiT8oWXJaXsUnPKRQuvSSi0sAKhelKJUveQnpuTMIUndY2/ZW3xTQbcEphRQNwRvFbTSum8fCLRoH6CRlWpS+eo5BwZA8MTZwlAPE9aCDQWzsoGHpOvk2YP9T63m97CTKsxOTY5CKhE6LIGwIZ4pUiDPGlhkGVCcr4rNHZSXzkPhiOX8QcWApocBWv0EqEMYARJrT7oqaY5zcSjty4EjgbdlW+JU2thFGpL3gDW8F3Tn1myvphAlm2LEzrB/NgRxJAmIYdTWYHtrwrJEdCs9EKfpRmcCHwuUfzwBT+L5SifwEabXqbklZDu53cJ7cmxN+jrx/Wg+VizFHEWhoZSoSp41rToZH68lWU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(366004)(376002)(39850400004)(396003)(66476007)(66946007)(66446008)(8676002)(64756008)(6486002)(66556008)(76116006)(4326008)(38100700002)(5660300002)(71200400001)(38070700005)(8936002)(91956017)(44832011)(478600001)(186003)(2616005)(41300700001)(83380400001)(2906002)(122000001)(54906003)(7416002)(86362001)(31696002)(36756003)(316002)(6506007)(26005)(6512007)(31686004)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eXk3TWlnQ29zREZQWklkRkFhT1RvakhnRm5YckdCWi9SN00wY0FBazVtTkVM?=
 =?utf-8?B?L3ZGbjlEeUoxMzBoaEFOdldycjZTUFl1TU02cFIzek8zdUU0OUJGYzhUKzNN?=
 =?utf-8?B?Q0IwTnJJc1BGMWhVZmRHRDdSZUwwdTBicGJ5RVJoZ2xnc0VaSkZld1Z6VkJO?=
 =?utf-8?B?dHB3bkMzOUtmSHJvRUplYzBSdTdEWUpVdnBBdzhTN1JDSExCSjFDd0ZFKzFp?=
 =?utf-8?B?bDljM2pheXJuVnRLZjJBUmh1VyswNE5ueWU3MEVhL0Nkd3BWdzluVkFIR1lX?=
 =?utf-8?B?WWM3bWM3dFVDSkN6UmtjZ2hySERaOGk4TTJkSC9xdG1rWlpVdldPOWEyUUVZ?=
 =?utf-8?B?R29BMlUwZVhMTUtDVEZnRTg3aVdWdXBuMG14bXhvWjloVHFNM1pIZEQ0Sit2?=
 =?utf-8?B?N09icHBJV1MxUlk3RlBOa0s0dFVHL3hvU0psa0c4dU04SHc0NUU4Z3dtSEJs?=
 =?utf-8?B?WFBuQklvOHJueG80ekJKS3JMVmlEaGplSFA4dzlTWHFXbmhXazIwbmVBL2V6?=
 =?utf-8?B?MWpKcEU4RURtcDNMdHhyVUJlNlFRWmhhb1hrU3dTTDh3WmthV1c0WTFSSGh3?=
 =?utf-8?B?NXVCNlgxaXhkS0hXbkdoV1BhUFhGUFZmNUhHV3p6U1l4bmdpdTJVd29Jcnd6?=
 =?utf-8?B?dzFGUFJMNVpzOXpSbG9Xb2dTRE81dHZVK2VXaGlMbXRRTUtXcHJlc0tjRkNK?=
 =?utf-8?B?OFlVMzZqSWlsRnUrdWFKMmd0MzlTZHlaUkZVclVnRXBtci9QRWcwTzF6ZlFP?=
 =?utf-8?B?WkNjbDhwYksrV3dSSjNVa21CYTZzeUF3bmFQQXJ3cDJRZENsRGhUdTNiOHhC?=
 =?utf-8?B?Qi9sMndmUjlRd3gwVHhEeUMvSnR4UTk2bGpCaVRGOUlzNSt3WnlvZGpzNW8w?=
 =?utf-8?B?U2FBQkhyNnZMV0lRcUdCamhkOStHSi9tK25qMEZiZ0E2UnlJeVFaVy9CL29q?=
 =?utf-8?B?UzZjVXMvcFMraU9qSVRZMW9CUkxCdndMNWVjTDdzWW9VaUdBaFZ6UmtCcklG?=
 =?utf-8?B?WndISU9wVDJFSjNHYUFGRTdDaFlyUkQvczJYWTJGSG9zN09SdnpMTnhWZTdQ?=
 =?utf-8?B?VnJsUjRaMGtUSVZaOVhtRExpRU9XNFBtRFJrT0VOUTlGQlU5VnlKYUQzSy9l?=
 =?utf-8?B?MDdVMnk2VGdVRktjTk9oL0RqbXFjSjlNVmh4UjRuSXAvNGF2K0RvR2JTUHFW?=
 =?utf-8?B?TE4vcE1qWG5wVHU3MkkvWVRXT2RpLzdMRzc3eFNFb0c1Smh4VFNxZ3lsU3cy?=
 =?utf-8?B?WXFaamJnZ0s1T25EQVpmOHRTaW11Z2g3NG0rTEs2aXp6ZE9MT2UyRG5RVnZx?=
 =?utf-8?B?T3JUQ2M3YXJqek1FQjZmL05FZ1hpWGw5V0JOektmU0c2aWVWdCtQMVl2TGVT?=
 =?utf-8?B?alZCM0NXejJUbHc1MXppc2swcldMYmtFV21kYi9mcXN1c2ovZytHL2VtVTFp?=
 =?utf-8?B?aEh6MU9DYmZlQjhQU25kSFFTNlcxb2pPR1paVEtwc0NWZG1QVGxyTFBPdlZ3?=
 =?utf-8?B?SWdsSEZFVHRieVl4UW0vRFREOWRWTnlJTkQ5aU04Qlp3eHpHcGlsVHlJS3hG?=
 =?utf-8?B?WU43Nmd4QVcyckJoUnNIK0IwQi8wdXM3YlJrZlFyRERIUzdRTHowbndBeFhv?=
 =?utf-8?B?Qys2VkdwRGo2Z2tYL3Y4UjRKQk9YelJVeFJKbWF6Qk1EdU9IbDI3MkZYdi9q?=
 =?utf-8?B?M1ZCVjRIbElmZmdFbW9ueFU5cTk3UEYvRnRxcndhdWpUS0dqcTBrNnFxeGs4?=
 =?utf-8?B?N3NWeU83aVV5NFhwUExWaU1pSTdBbGxMOFhvejZJUnhueVMvVlNMdll0dTBX?=
 =?utf-8?B?T0hQRVNyd2dZamllMy8yZVp3OCt1NE1jZ1Z6dE1xck5tdDNTOHdGRlROOWNk?=
 =?utf-8?B?UE5VNnB5TFlSYVZIdlpzalhsa0RvemFuVjh6NEtaekFkSXdnUnkwdkwrZllG?=
 =?utf-8?B?S3dTVUMxWExWci82WFYwUkN3TzhSTmNkV3pGanBHZkJ3TytyVVlQM1NqTEMy?=
 =?utf-8?B?cGhuSWlXVzQ1OHAzUTM3Njk0RkFYazBKS2ZYcmlXcVNTYU1BMklWckRWa0tG?=
 =?utf-8?B?K0hrcStFcFJBdjNWQ2kxL1ZyK2JOdWtYNE5WZERWdUxMUit3Mkt3V0xyY3hm?=
 =?utf-8?B?ZXJ2TElTYkdaaXp2a2xIZGZHc3VvV3FLdjc0UXRDMExuQ3FWVmtjTVR1QllK?=
 =?utf-8?Q?aKeSBLePBaZCZj9qozIhpKw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19B3F174AAC36841A89EAE23A5CCAF4B@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0787cdd4-9a46-4b3a-e711-08da5800a20f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 05:48:16.8385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DT7WsnYrNYQoylDWdicrBYdk0A08bp3MH6r2I4Y1KRtb8EkyFmydyl1zsiZ95wM+dGpqxZCoEwZMu8AqWw5p1cdTYUDB3FYUgZY4A0VHplM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1617
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
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linux-snps
 -arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA2LzIwMjIgw6AgMDY6NDMsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IHByb3RlY3Rpb25fbWFwW10gaGFzIGFscmVhZHkgYmVlbiBtb3ZlZCBpbnNpZGUgdGhvc2Ug
cGxhdGZvcm1zIHdoaWNoIGVuYWJsZQ0KPiBBUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9ULiBIZW5j
ZSBnZW5lcmljIHByb3RlY3Rpb25fbWFwW10gYXJyYXkgbm93IGNhbiBiZQ0KPiBwcm90ZWN0ZWQg
d2l0aCBDT05GSUdfQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVCBpbnRlYWQgb2YgX19QMDAwLg0K
PiANCj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+DQo+IENj
OiBsaW51eC1tbUBrdmFjay5vcmcNCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcN
Cj4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFy
bS5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgaW5jbHVkZS9saW51eC9tbS5oIHwgMiArLQ0KPiAg
IG1tL21tYXAuYyAgICAgICAgICB8IDUgKy0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgNCj4gaW5kZXggMjM3ODI4YzJiYWUyLi43MGQ5
MDBmNmRmNDMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaA0KPiArKysgYi9pbmNs
dWRlL2xpbnV4L21tLmgNCj4gQEAgLTQyNCw3ICs0MjQsNyBAQCBleHRlcm4gdW5zaWduZWQgaW50
IGtvYmpzaXplKGNvbnN0IHZvaWQgKm9ianApOw0KPiAgICAqIG1hcHBpbmcgZnJvbSB0aGUgY3Vy
cmVudGx5IGFjdGl2ZSB2bV9mbGFncyBwcm90ZWN0aW9uIGJpdHMgKHRoZQ0KPiAgICAqIGxvdyBm
b3VyIGJpdHMpIHRvIGEgcGFnZSBwcm90ZWN0aW9uIG1hc2suLg0KPiAgICAqLw0KPiAtI2lmZGVm
IF9fUDAwMA0KPiArI2lmbmRlZiBDT05GSUdfQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAg
IGV4dGVybiBwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsxNl07DQo+ICAgI2VuZGlmDQo+ICAgDQo+
IGRpZmYgLS1naXQgYS9tbS9tbWFwLmMgYi9tbS9tbWFwLmMNCj4gaW5kZXggNTVjMzBhZWUzOTk5
Li40M2RiM2JkNDkwNzEgMTAwNjQ0DQo+IC0tLSBhL21tL21tYXAuYw0KPiArKysgYi9tbS9tbWFw
LmMNCj4gQEAgLTEwMSw3ICsxMDEsNyBAQCBzdGF0aWMgdm9pZCB1bm1hcF9yZWdpb24oc3RydWN0
IG1tX3N0cnVjdCAqbW0sDQo+ICAgICoJCQkJCQkJCXc6IChubykgbm8NCj4gICAgKgkJCQkJCQkJ
eDogKHllcykgeWVzDQo+ICAgICovDQo+IC0jaWZkZWYgX19QMDAwDQo+ICsjaWZuZGVmIENPTkZJ
R19BUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBb
MTZdIF9fcm9fYWZ0ZXJfaW5pdCA9IHsNCj4gICAJW1ZNX05PTkVdCQkJCQk9IF9fUDAwMCwNCj4g
ICAJW1ZNX1JFQURdCQkJCQk9IF9fUDAwMSwNCj4gQEAgLTEyMCw5ICsxMjAsNiBAQCBwZ3Byb3Rf
dCBwcm90ZWN0aW9uX21hcFsxNl0gX19yb19hZnRlcl9pbml0ID0gew0KPiAgIAlbVk1fU0hBUkVE
IHwgVk1fRVhFQyB8IFZNX1dSSVRFXQkJPSBfX1MxMTAsDQo+ICAgCVtWTV9TSEFSRUQgfCBWTV9F
WEVDIHwgVk1fV1JJVEUgfCBWTV9SRUFEXQk9IF9fUzExMQ0KPiAgIH07DQo+IC0jZW5kaWYNCj4g
LQ0KPiAtI2lmbmRlZiBDT05GSUdfQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAgIERFQ0xB
UkVfVk1fR0VUX1BBR0VfUFJPVA0KPiAgICNlbmRpZgkvKiBDT05GSUdfQVJDSF9IQVNfVk1fR0VU
X1BBR0VfUFJPVCAqLw0KPiAgIA==
