Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C44599579
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 08:53:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8CBV1ZmPz3drl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 16:53:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zRPXjZLq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.89; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zRPXjZLq;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120089.outbound.protection.outlook.com [40.107.12.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8C9g4M5qz3cBF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 16:52:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrE0czhYSToaJHLQTJ77VLmAfn2+JqrMftupUDjyKvqU2pk8Ule8VnmFbd9oZEWOuCdg7FSb/AKrMTItiIkdjlpkrJnxuMozVQ3ylxJWPgcIYtBNKewEZOr+oepmPiP47ixRU8komZTWVQ8sOLKUwDiyj9u1rznqWDP3x9ZJMRK+F6rE+hWRHdKjbWO5KbqfHsEEPZuADRqTnra17zlSC87SWAr7Q4lSCjeY+qKOfNk6Fu4fUP5oQlk1bz/YUY2okX5YqNfC3NpCibb42tTNdYyTMfnh/RmlXcoRvMr6Y2Fvzf22rEBgYCiTISjoWHficgblvxs1Z31LlmjtV19FjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KqmUJcZz8IxQ3j+p2bcw9uL6W/MWPBrZs/5SmpT+6E=;
 b=ZPkuTeuSDnrqIvJ7za2eiQzOyD33O+XpSyUb3IMRXhsK6D3Gjexd0ulwk7XH3+rrry70bZh0IZiykjVLExKRwf4CIu2oOiF9Yx2eWOyue+CszS6m4fYAny5HZrL+9a8BnjgJ9nMZVzVhUQViAWPc0oghROoBgZUilhbwOpV7zc16EjSHkqv39sZPNtGShxImrQXu4CQip9QrMmDgz08lbZMGiZnY5ewMCUNzx3pS/O2GApAWFY+nkCnW7Ofi+NG66RLDSYT18qiTV4Gbt8hn1VUWXxBdBw7uS5U/C7T7PKcYJSzAuTdIEnIcx0EuNfXBAmrmoXCZdJSiEP93TVDeZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KqmUJcZz8IxQ3j+p2bcw9uL6W/MWPBrZs/5SmpT+6E=;
 b=zRPXjZLqbnVeRE6wmz+yCSy+dDh0/0PaAZopgKr3SlQGTiwsUyhfON8MMQhVAG+RSxhS+Iu56MxeWxBlBrwwTLofFZ9Kt6SHl/Rnvpxruqbof7hfhI6kCkFeosOdfalpSFyCZJQvv70Q72/leHDfSiXB+npXLQg+4kqukGjs+yWo4JEZK1+GFQjkIDxPNrEf7HWPWooQQ/FXC9sbLriZQKKssuB7nFNF3u5GGMGZa7V/cA5F/SMwmNiiiT2xJL374fAd6/KEt4mPoHZPfrq3nJSTBMaZCPYebQ1Ik/ZrJdPJlC6R6XVefYfQc5pM82V1o0LRdi6KhoAKEdY75rne3Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1436.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:144::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Fri, 19 Aug
 2022 06:52:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 06:52:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 14/18] powerpc/64s: Clear/restore caller gprs in
 syscall interrupt/return
Thread-Topic: [PATCH v3 14/18] powerpc/64s: Clear/restore caller gprs in
 syscall interrupt/return
Thread-Index: AQHYs35Er6Yhodd7SUmx9k0AcJsAuq21yWGA
Date: Fri, 19 Aug 2022 06:52:02 +0000
Message-ID: <7672f9a3-e8e2-a6e4-cca0-730cb4d6b0f4@csgroup.eu>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
 <20220819033806.162054-15-rmclure@linux.ibm.com>
In-Reply-To: <20220819033806.162054-15-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93a95b05-c15c-44bb-c972-08da81af523a
x-ms-traffictypediagnostic: PR0P264MB1436:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4iYv28ijY9TZ/9EzGaAaY20aQe9UzX32Z0eRqEbckBb1nOX2vvPdKjspMDVRJeGynlq9txzpvrwDOpF2WsLIO4yLmos6f115WahS/job6kwiQuC9hIIJhNAEUv8N5hDnD9bnuF5czpAGQf/xtOwu0xvfhyFcwiZLRAP/bCJAFAW4fMFpqW1jKdY7Pko8INsWPVS5QQ1ERNqSseIxk6E7PATdRFGPxPI5iDsmTSA7Dtzj/BYuNbVqOAUGHqoFAug2chjYsnnkkgG07qlP80UfeXO3bGPNW/aRyQTYxD9itD1jyRsOoilyecnXZQNT0Dmsom17JvHpHTVMue1UlwTCBeAKcmG4bB3ZsazW7NNFOkkaMyISi34lk/iXfDsQqPJr5tNWQ4QQCrLktMXagVGQQma8eJIqn5F+Q55gT6zP5me3/kQweLvhkdnpt9C24/R4G5o+Gqgxe08xARRTi1IiNtb4j6oSP4p7ZghV3axfrb+wEGWBpvzZnRM+CeaOiQ2+rNgTBR9K91lZVhOJccJWlSPW4XsKYnU0fh41lLG8TIxPOMqVGicewhJEL9ALYnTHneusgDfX7h734NbaEzp20XnVUTfjbIKST4uMmlxgZPX61/EkdEraoe0MbonKDWW0ZGls+XQUwkze3D7oelghrKEm2VMt3PbT0Hrg7yBZWfK0zFjyaNpwxAaoHrzkCD8/+S/M/z3Fbd9GPYvhGU5OHuaMBH8boaKSnVn91acpZEJsJp5srWQn0AcHDLVw6IftuCNOJRjmQjuWgosQqKvNROUMtC7ORdFLSfaZkz29iqnrUaE9K4qv3OrXzfLvcCh0lqfCNvDyQn++vyd8wxw+6A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(316002)(8676002)(91956017)(76116006)(5660300002)(110136005)(64756008)(66476007)(44832011)(38100700002)(66446008)(66556008)(8936002)(66946007)(122000001)(38070700005)(31696002)(2616005)(86362001)(2906002)(478600001)(6512007)(6506007)(186003)(66574015)(71200400001)(83380400001)(6486002)(41300700001)(31686004)(36756003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?b1p6QStib3prMjV4UEdxa3ZBS1dpMVdud0plb042V1RydTNvZHB2L1FyUUFa?=
 =?utf-8?B?ZE0wQ3JoNktHS2RKSTlQMHVRN3BXb1FNVEtFQ2x6MDg4bkFyMitiU1dsM2NT?=
 =?utf-8?B?aldrcTJuWWxvaHA3Z1ZCb0VlNHB2UGhVU1FJNytDb2ZsZzFwNXZtNzRCbXBX?=
 =?utf-8?B?TU5XUExQZUZNam1mMkhZclBsTDU1UnZSUExKS2tPU2tVNEJLNE16UjN1MFgw?=
 =?utf-8?B?ZzRNZDdVWHRFbVhScFRKMk5SbEs0aFg3SzFkUitLWWFUMG9pYjBIaWJibWw4?=
 =?utf-8?B?NEhvWHVFVzJmMmlML2YrRmhYM3VCRE5XRllkSkVpNWtsajUrcG1IMEhadUpS?=
 =?utf-8?B?VGJ6R0NGTFBRM0hxRHhGaXY2NGZoRHJhOFk4YWRUOVg1WXdIMWdEK2pwaVJ0?=
 =?utf-8?B?NXhVeGlHcjVmcCtxT0RiMG9yWW9PTStFRVFhemtJVzdDWTdzcTZVYjJkVnJx?=
 =?utf-8?B?R3dCN0hFWXVvakxCNU5sTHIxY0tGZUtkcGZSaS85b0lMT0dUVmE2S1lxcDZ2?=
 =?utf-8?B?RnliUkZkRDFxUDVObWtPTUNZQWZSZkJ1aVFWYThyamJobmtXeWRMSHhzSDJr?=
 =?utf-8?B?WDZoNEw2VFluNXlCRmxON3gzNjNnWkNtb3E1TXBkaWF3Q25oYWpDdkZqQWZG?=
 =?utf-8?B?WU56Uk1RN0tSQVAyTXJSQ3l1VVpVK1oyTWZEdTFqeEdpMk5DUVJ5d3BIUk56?=
 =?utf-8?B?blRTckV2clI1NXlmOGg4WisvS3NLT1Y5dzMySEpzT0xqQzBxWXpJLzJTRmRh?=
 =?utf-8?B?MFhWY0dsZ2FiMGRSMGRxQWtQYm1MaTRFTDAzVzJTdk8zaHRLcU1ScGYySkpw?=
 =?utf-8?B?cG5xeDVNWjdNMXM1Y21COG15Q3ArMjhzT2JSSDdTOHhaYmtxNkNXWGZ0TVpG?=
 =?utf-8?B?MFZSa29rRkhzR3ZoS3JSd1ozSXdhbjFVVmpic1NkWEwyVjd6a2RSVXR2OGlH?=
 =?utf-8?B?UzZmeU4wMnlYVTdNOGNRejJYRGUzbldKY1VpVWlaemxHVDhBN2tYMWswYXhk?=
 =?utf-8?B?VForNG1xQURMd0hBbUNUYkRveDNlOGZRSWdUa0wzQS9IQTVLZW1JMTJscWp6?=
 =?utf-8?B?a2NJN0EwbXBkNmRiNy94NFVBa1YzMm1tQzNjMFZtd0hybUZLNTRsQi90SWtk?=
 =?utf-8?B?QXpQSTlWRnBoUTY5cUZISTJrQ244bkNVcDF1S3BJSVBta1FKYWFoSWV4NkZM?=
 =?utf-8?B?ZVNtRTlLM09XQnJuVUFYTnZkK1hHSXVRZGp6aThHKzhxV2M2RWZXcmVkN2dh?=
 =?utf-8?B?eSt3TEJvcUtCRHp2eFZ2Y0lJbzh4VFg0ZmtRb21WTFN4K3ZaN2d3b0FYWjRx?=
 =?utf-8?B?WFlaV05JU1NXZ0UrSWtrS0p1YVJwTHR2Mkl4Sm9oSE5BYnloNGp1TVpKbER1?=
 =?utf-8?B?b01saVZrYUh2a3ZpdmhraHFpU0tnRk1CTkJabTFSMmljMGdYM0k0NXI5UUla?=
 =?utf-8?B?UWV5azVxNGZyUmg2clFiTEZPNURPMTQySTh2YlFOcDBXQWVpdEs4b2I0TGFt?=
 =?utf-8?B?MFZEUkR6Ykt0eldYTjVwSjJsb1ArOXlKT3l2V0c1WHhXc1hRL3FQa1lBa1RY?=
 =?utf-8?B?WDI1QzMyOHFDaFZDMUU1KzlnaGsvcXl0UzVCNWdHSFpuQUhOa1BWNGlqNDJG?=
 =?utf-8?B?MEhwVVFYVlBkaks4VTBaakNVMXo2QVpydHZ3ZEhEVGU5VUhPdnRHYm9xRlE5?=
 =?utf-8?B?YnBaeC9PR0JFditJVFdrN0lHSFcwdUUzNFQrQmxmZnlyZDByNk5OWEFhdzJn?=
 =?utf-8?B?cUZ2NGlpYllEa0JKY0FCTHFHbVl5dWNmWG1qZHVIZ0FxWXVKaGFYdVROdTk2?=
 =?utf-8?B?UTZHUGRRVm9IMFo3S3MyUTU3aEtHdkRQT1VOUUFhemVRdzhFS2hQSkZKa1Zp?=
 =?utf-8?B?MTVDTHFjL0tIVmRlamh5dE9TMDJzbmdhQm1LNklzbGo2aXlkYTVNeFZRN2J3?=
 =?utf-8?B?ZWh2cDdENFJzcWNYdE1IbUM4aXQzZ1d2YWI5Y1JkUUpEcE54OVVkYlB4WTMy?=
 =?utf-8?B?MFpKb3ltaUxPMXhEK2NzakVjOGNlQkxQS1dVdERkUCs5N3lqaHZjenExZmNV?=
 =?utf-8?B?WDFLM21sSytUL1NtTDdqRWdVc3E1bmZsb2U2aTJqM0dTc21pUExhTWhsZzdX?=
 =?utf-8?B?dzcxUGhsZjFKeVZGT3M2MWllcjJlM0RZNEJGQUY5VllMLzNsOHdrOTdzck9S?=
 =?utf-8?Q?XzaikUNsL/TaoyiZU1VNnaE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <84FCF2E59D7DC84A8CE0A4B828374059@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a95b05-c15c-44bb-c972-08da81af523a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 06:52:02.4566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lpxh3OJ8LyxV5UGHZD5C3ITMHJMHiwRlPq4qiwi+9am/Ffb9XbPAL8Z1onerJJsLvXwqEYrQ90baD0B7r0LFHo619Dxk9jSs4OyuuYLxORw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1436
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzA4LzIwMjIgw6AgMDU6MzgsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBD
bGVhciB1c2VyIHN0YXRlIGluIGdwcnMgKGFzc2lnbiB0byB6ZXJvKSB0byByZWR1Y2UgdGhlIGlu
Zmx1ZW5jZSBvZiB1c2VyDQo+IHJlZ2lzdGVycyBvbiBzcGVjdWxhdGlvbiB3aXRoaW4ga2VybmVs
IHN5c2NhbGwgaGFuZGxlcnMuIENsZWFycyBvY2N1cg0KPiBhdCB0aGUgdmVyeSBiZWdpbm5pbmcg
b2YgdGhlIHNjIGFuZCBzY3YgMCBpbnRlcnJ1cHQgaGFuZGxlcnMsIHdpdGgNCj4gcmVzdG9yZXMg
b2NjdXJyaW5nIGZvbGxvd2luZyB0aGUgZXhlY3V0aW9uIG9mIHRoZSBzeXNjYWxsIGhhbmRsZXIu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNv
bT4NCj4gLS0tDQo+IFYxIC0+IFYyOiBVcGRhdGUgc3VtbWFyeQ0KPiBWMiAtPiBWMzogUmVtb3Zl
IGVycm9uZW91cyBzdW1tYXJ5IHBhcmFncmFwaCBvbiBzeXNjYWxsX2V4aXRfcHJlcGFyZQ0KPiAt
LS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2ludGVycnVwdF82NC5TIHwgMjIgKysrKysrKysr
KysrKysrKysrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaW50ZXJy
dXB0XzY0LlMgYi9hcmNoL3Bvd2VycGMva2VybmVsL2ludGVycnVwdF82NC5TDQo+IGluZGV4IDAx
NzhhZWJhMzgyMC4uZDk2MjUxMTNjN2E1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2Vy
bmVsL2ludGVycnVwdF82NC5TDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvaW50ZXJydXB0
XzY0LlMNCj4gQEAgLTcwLDcgKzcwLDcgQEAgX0FTTV9OT0tQUk9CRV9TWU1CT0woc3lzdGVtX2Nh
bGxfdmVjdG9yZWRfXG5hbWUpDQo+ICAgCWxkCXIyLFBBQ0FUT0MocjEzKQ0KPiAgIAltZmNyCXIx
Mg0KPiAgIAlsaQlyMTEsMA0KPiAtCS8qIENhbiB3ZSBhdm9pZCBzYXZpbmcgcjMtcjggaW4gY29t
bW9uIGNhc2U/ICovDQo+ICsJLyogU2F2ZSBzeXNjYWxsIHBhcmFtZXRlcnMgaW4gcjMtcjggKi8N
Cj4gICAJc3RkCXIzLEdQUjMocjEpDQo+ICAgCXN0ZAlyNCxHUFI0KHIxKQ0KPiAgIAlzdGQJcjUs
R1BSNShyMSkNCj4gQEAgLTEwOSw2ICsxMDksMTMgQEAgRU5EX0ZUUl9TRUNUSU9OX0lGU0VUKENQ
VV9GVFJfSEFTX1BQUikNCj4gICAJICogYnV0IHRoaXMgaXMgdGhlIGJlc3Qgd2UgY2FuIGRvLg0K
PiAgIAkgKi8NCj4gICANCj4gKwkvKg0KPiArCSAqIFplcm8gdXNlciByZWdpc3RlcnMgdG8gcHJl
dmVudCBpbmZsdWVuY2luZyBzcGVjdWxhdGl2ZSBleGVjdXRpb24NCj4gKwkgKiBzdGF0ZSBvZiBr
ZXJuZWwgY29kZS4NCj4gKwkgKi8NCj4gKwlOVUxMSUZZX0dQUlMoNSwgMTIpDQoNCk1hY3JvIG5h
bWUgaGFzIGNoYW5nZWQuDQoNCj4gKwlOVUxMSUZZX05WR1BSUygpDQoNCldoeSBjbGVhcmluZyBu
b24gdm9sYXRpbGUgR1BScyA/IFRoZXkgYXJlIHN1cHBvc2VkIHRvIGJlIGNhbGxlZSBzYXZlZCBz
byANCkkgY2FuJ3Qgc2VlIGhvdyB0aGV5IGNvdWxkIGJlIHVzZWQgZm9yIHNwZWN1bGF0aW9uLiBE
byB5b3UgaGF2ZSBhbnkgDQpleGVtcGxlID8NCg0KPiArDQo+ICAgCS8qIENhbGxpbmcgY29udmVu
dGlvbiBoYXMgcjMgPSBvcmlnIHIwLCByNCA9IHJlZ3MgKi8NCj4gICAJbXIJcjMscjANCj4gICAJ
YmwJc3lzdGVtX2NhbGxfZXhjZXB0aW9uDQo+IEBAIC0xMzksNiArMTQ2LDcgQEAgQkVHSU5fRlRS
X1NFQ1RJT04NCj4gICAJSE1UX01FRElVTV9MT1cNCj4gICBFTkRfRlRSX1NFQ1RJT05fSUZTRVQo
Q1BVX0ZUUl9IQVNfUFBSKQ0KPiAgIA0KPiArCVJFU1RfTlZHUFJTKHIxKQ0KDQpXaGF0IGlzIHRo
ZSBsaW5rIGJldHdlZW4gdGhpcyBjaGFuZ2UgYW5kIHRoZSBkZXNjcmlwdGlvbiBpbiB0aGUgY29t
bWl0IA0KbWVzc2FnZSA/DQoNCj4gICAJY21wZGkJcjMsMA0KPiAgIAlibmUJLkxzeXNjYWxsX3Zl
Y3RvcmVkX1xuYW1lXCgpX3Jlc3RvcmVfcmVncw0KPiAgIA0KPiBAQCAtMTgxLDcgKzE4OSw2IEBA
IEVORF9GVFJfU0VDVElPTl9JRlNFVChDUFVfRlRSX0hBU19QUFIpDQo+ICAgCWxkCXI0LF9MSU5L
KHIxKQ0KPiAgIAlsZAlyNSxfWEVSKHIxKQ0KPiAgIA0KPiAtCVJFU1RfTlZHUFJTKHIxKQ0KPiAg
IAlsZAlyMCxHUFIwKHIxKQ0KPiAgIAltdGNyCXIyDQo+ICAgCW10Y3RyCXIzDQo+IEBAIC0yNDks
NyArMjU2LDcgQEAgRU5EX0JUQl9GTFVTSF9TRUNUSU9ODQo+ICAgCWxkCXIyLFBBQ0FUT0MocjEz
KQ0KPiAgIAltZmNyCXIxMg0KPiAgIAlsaQlyMTEsMA0KPiAtCS8qIENhbiB3ZSBhdm9pZCBzYXZp
bmcgcjMtcjggaW4gY29tbW9uIGNhc2U/ICovDQo+ICsJLyogU2F2ZSBzeXNjYWxsIHBhcmFtZXRl
cnMgaW4gcjMtcjggKi8NCj4gICAJc3RkCXIzLEdQUjMocjEpDQo+ICAgCXN0ZAlyNCxHUFI0KHIx
KQ0KPiAgIAlzdGQJcjUsR1BSNShyMSkNCj4gQEAgLTMwMCw2ICszMDcsMTMgQEAgRU5EX0JUQl9G
TFVTSF9TRUNUSU9ODQo+ICAgCXdydGVlaQkxDQo+ICAgI2VuZGlmDQo+ICAgDQo+ICsJLyoNCj4g
KwkgKiBaZXJvIHVzZXIgcmVnaXN0ZXJzIHRvIHByZXZlbnQgaW5mbHVlbmNpbmcgc3BlY3VsYXRp
dmUgZXhlY3V0aW9uDQo+ICsJICogc3RhdGUgb2Yga2VybmVsIGNvZGUuDQo+ICsJICovDQo+ICsJ
TlVMTElGWV9HUFJTKDUsIDEyKQ0KPiArCU5VTExJRllfTlZHUFJTKCkNCj4gKw0KDQpOYW1lIGhh
cyBjaGFuZ2VkLg0KDQo+ICAgCS8qIENhbGxpbmcgY29udmVudGlvbiBoYXMgcjMgPSBvcmlnIHIw
LCByNCA9IHJlZ3MgKi8NCj4gICAJbXIJcjMscjANCj4gICAJYmwJc3lzdGVtX2NhbGxfZXhjZXB0
aW9uDQo+IEBAIC0zNDIsNiArMzU2LDcgQEAgQkVHSU5fRlRSX1NFQ1RJT04NCj4gICAJc3RkY3gu
CXIwLDAscjEJCQkvKiB0byBjbGVhciB0aGUgcmVzZXJ2YXRpb24gKi8NCj4gICBFTkRfRlRSX1NF
Q1RJT05fSUZDTFIoQ1BVX0ZUUl9TVENYX0NIRUNLU19BRERSRVNTKQ0KPiAgIA0KPiArCVJFU1Rf
TlZHUFJTKHIxKQ0KDQpTYW1lIHF1ZXN0aW9uLg0KDQo+ICAgCWNtcGRpCXIzLDANCj4gICAJYm5l
CS5Mc3lzY2FsbF9yZXN0b3JlX3JlZ3MNCj4gICAJLyogWmVybyB2b2xhdGlsZSByZWdzIHRoYXQg
bWF5IGNvbnRhaW4gc2Vuc2l0aXZlIGtlcm5lbCBkYXRhICovDQo+IEBAIC0zNzcsNyArMzkyLDYg
QEAgRU5EX0ZUUl9TRUNUSU9OX0lGU0VUKENQVV9GVFJfSEFTX1BQUikNCj4gICAuTHN5c2NhbGxf
cmVzdG9yZV9yZWdzOg0KPiAgIAlsZAlyMyxfQ1RSKHIxKQ0KPiAgIAlsZAlyNCxfWEVSKHIxKQ0K
PiAtCVJFU1RfTlZHUFJTKHIxKQ0KPiAgIAltdGN0cglyMw0KPiAgIAltdHNwcglTUFJOX1hFUixy
NA0KPiAgIAlsZAlyMCxHUFIwKHIxKQ==
