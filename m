Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E445D67DD5B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 07:10:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P36cS4zDlz3fHh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 17:10:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pVap1wne;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.241.70; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=pVap1wne;
	dkim-atps=neutral
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2070.outbound.protection.outlook.com [40.107.241.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P36bP6mThz3fDy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 17:09:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGOcpOVWxItgXoZVYHTNa2wAD+Le1ChI2uA1988/WnqlrKRro99DZ6ni86ubC90SxhBs0aph6V/+U4Rts73xCUrUhYDHcN61auFNV7Q4suFach5y3TskiUjvF4Tpx/OLYmb00ocaZ24XYibjG3+awTVrjUoqs/cI65nHOlQaONf7syMBFXqMIVMr4MODayeqqJdmH1FZInIIxSKWeMm4Tq1nYzzP+5AhBaDiDbdv9Hb0zWzDNySs9M47W+gEa8f1Gl6/DPZ+nr1vzrbntfCBdtrasqk0G6p0g3820gWMVZThEfYjwTdqHO+GTGIcPzZEVKPWnilre4gH8Ltz6gGLSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n46FbRmrkujeUAKjWExMFFVEeUfi9L91hflwQYgzs1Q=;
 b=SkLnAe09yx1mwtRSnXuZt0jlrwzCpft4SECMq1KiMM3SwSOnEnmc37HRKjoiwWvMvajnOPkAt9YWb64F/HdYeDWAGTw8jYCv5zwqNgMl38oEA09YVaoE2kwGQPNdEmZ+Yh4v66nMdcVCkci5Ex19QdJgbWV//Yfd8wv6NVMtMMkVDKRIs4OLGLhyjcmLhzNjTF3ZX/TI9EgiFdgfuv1wzqXCzcG4fwBVeStFWocVOriI6KLVQyuHtzFOnnycecgGco2vnhLrP5LLVs3GeyJiFOVG5j1Tx6T/3DLudKoTFFe1jaq6s8b+DfjRdKLc/UxoRem8+E/j9Dp9KRtEgh2A9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n46FbRmrkujeUAKjWExMFFVEeUfi9L91hflwQYgzs1Q=;
 b=pVap1wneMLXYEtoiO3vgOHU6EPUAHrKr1dvF9lO3d4P41K+vaSElUwBmqrMf8+27MoFx9KL9XebXHAHNg+scJ/G5wotgSrqdhzllkb/rajKiBcm2X7lBsM5DIoeoR2E7xkBXW4SIdj2u+aDWba7Rr6mam7z/9Nh00L/sZmucffWXMLS/uxC8cKEnJqNrOw4tB6ziqR7bZw8UCNyF+HPQYjBN32N/14MzJa/ukOGy40osZd3zHG/s6nl9KoDUUstFan1+2WpEfF6+DRjRC8suY458o/sgE9nqLDDzHhtMJRjl3xQZ7pP3qlm3UV/OcBLxOxm7FX16ZhTzy3J5n6+Yiw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2087.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 06:08:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6002.033; Fri, 27 Jan 2023
 06:08:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/tlb: Remove BUILD_BUG for book3s/32/tlbflush.h
 local_flush_tlb_page_psize
Thread-Topic: [PATCH] powerpc/tlb: Remove BUILD_BUG for book3s/32/tlbflush.h
 local_flush_tlb_page_psize
Thread-Index: AQHZMD63caK9kPPNA0eQ1a4ZVMQtPK6u4luAgAJo4YCAAH/lAA==
Date: Fri, 27 Jan 2023 06:08:44 +0000
Message-ID: <225b6988-d1b4-214a-728b-19b7d9bf276a@csgroup.eu>
References: <20230124215424.9068-1-bgray@linux.ibm.com>
 <ffcd0097-b366-b98c-9853-1d10d78a5666@csgroup.eu>
 <0e47ee626fc06957a51c4535f1cddcf7c57836e3.camel@linux.ibm.com>
In-Reply-To: <0e47ee626fc06957a51c4535f1cddcf7c57836e3.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2087:EE_
x-ms-office365-filtering-correlation-id: 8e72d2a7-0db9-4c5c-a6c8-08db002cf242
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Iq11BcAVFT5V21jCVJSt+G7xPhI3GsdhiMU7+46Jo07mvKQPXFQRvSz+sGXy/afdGTIZq8hsfY25qIkKpmJQ1kZrqpE1H6ziBM+iJ1+OUmPwbFwgGH0K+B3bh622OWqL8n1lagT0PjMoIGXGDAYx8TZrUhdzSxzUF7O4hvTPJkMljAog7LmAnu+a/8SnvAxe38RTBoAnwi4Y7910DSnU92ehasNxJtU5+Vu/asogkL9X/d/sdT7Z8CkW203LAasJzdr6Zl4G4GK803b2NAUVVgJLqgPqBN814fkuRomuoiBzxD8xlYOVPKcfnuBMuuKrW0iG8v4wJQONwdG3mHGm/yfVSTarwNPoQCjTn4/rO20H4y3jn4x6OWzD+ALhjH4B4z7g66TYuTNjyYlKwM8XfxkKL+2Am55QnVYRr+RH7+7hcoW5n0jrCnDN1ccEVtuYcyKMZM7rHl5pkz/8xThB62WAEoXPYJ0NrMiODqs6wJPdFByhNBvG4xFQI1d2GhhFxcuA9wwep1lF57wTZtLC4j0xEZ3s2UNdVRI1+wrgmFhd0++Zxbe+HRHEPMoU735c855vl15x++PyYszsOZ4luKopi5A5DcBHXyfI5czx9n736mWSxIMnZCLmhZaAPpCTf+aRhRySzX1uQpkxDd2RqGo+e6wOHNRCtSKfPinWeVb5ZRvvMDUrutvGHY4xnNjf90ji3onz5oJJPvD7cEsHFOucuEW7lwYxtAV1f3DtuHoAblwEXORWNLmkLFATmm+KS7Pl8Lg1M51sb27TAdDXhand5TSclZrpNELSlxsF4vw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199018)(44832011)(2906002)(66574015)(6506007)(5660300002)(8936002)(41300700001)(6486002)(8676002)(4326008)(91956017)(76116006)(26005)(186003)(6512007)(31686004)(478600001)(2616005)(86362001)(122000001)(83380400001)(38100700002)(38070700005)(66476007)(66446008)(71200400001)(66556008)(66946007)(64756008)(316002)(31696002)(110136005)(36756003)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cUZXNEYrdDVhQzJ6SnZFbFdvME9tYW1wMWQ1RVEvS1NzSjBIdDl1MFlrbUlJ?=
 =?utf-8?B?WFpFZWY0a3ZNQ0JsSVZQeUNManArVi9VazNOdGRsNEJLR3NJeGJ2SVkzZktk?=
 =?utf-8?B?MndYazJENTJ4MThzTlVWMXNsNXRuY25lNzVRSUt3SkxNRFhHNGN2R2FXNHVP?=
 =?utf-8?B?cE9vREpFTk4zbzRRWDFPcndXcDV5RlYyWERSbElTUHlvR0pyMFVMbFNrMG5v?=
 =?utf-8?B?VTFGSkhUZHgvUU1mMTA3YjljcytISTZxR21yUjE4dU5VVGVvQjY3Z2M0WHVz?=
 =?utf-8?B?bVE0UWgrUUpUZmlXYU45MEttbExwWmtKVVhtTUtiWjlKSkgzSFNzNVk5MzVJ?=
 =?utf-8?B?OEdzVXJQZ05ZSUg3cHVNdHpxOElhQW5KbUM1cENSd3BXMzl0T2R3YUJBcVF2?=
 =?utf-8?B?WDNVeE1HMTdHSERYcng5TlBndDVwR28zZ0JVbFZxaEJuVUdRdHZYM3FYQzVk?=
 =?utf-8?B?L0lGcGwvU0JwcTE1eDBVYjNtdHMyNzJxdDczK1lLZ3FNeUhNbkRNWVIrSXdP?=
 =?utf-8?B?Y0JVWHlNcHlidVZoU0lGcHZMdVlyZFBJMUx0L1NGTzlsSEtNbjY1T2pLeVFr?=
 =?utf-8?B?clA1Wmo0N2w1eTk4VFIxSE5yd2R2aTJaTlVuMHVBbzhiQXpHaHdiU1VKS2tt?=
 =?utf-8?B?bEJDeitCR1NRVDkxdlJJanJOak8yck8rYTZBeWdTQjJlcHl4b1VycDRsZUtn?=
 =?utf-8?B?WVZ6a3k4cUhRQWxRMWR6QVJNSDZYbStEREtyS2taUFNsL0U4VVp0YkVwUzdW?=
 =?utf-8?B?b3VaNEFQajlJelZla21NQUN5bWFsUVB1SC94OXlWaFBzRWFwemdSd3lNbDJ6?=
 =?utf-8?B?UjJmQlk5UHNPaHpxM2ZDU0lXbUptRnlWNTVaV1g5WFBYL3NHWGFnWjZLdUov?=
 =?utf-8?B?bmgwRHpyeStJbG9adGFtQURUYmRWdGttYWNMOTVLd3VsQzQ0VVpqenlPZGVz?=
 =?utf-8?B?M2EvMlJaeUJUdjJyTHBLVm1LSGdRQ3FNL1drdHIvclhHYjI4UFZaKzFCL2lK?=
 =?utf-8?B?QnFBbTA1eWlqRm41czdSdFBNSjJDZWVncFBzNC8xZU9jNmZ3MU1rVlI2RW9s?=
 =?utf-8?B?M2dqMHM5R21aajJaNGM3cVZkMU5Mbks0YkNCVjNDMzJjTk9TUkZvQlBlSHNp?=
 =?utf-8?B?d0xQeVg1bnNQRVpFQnlqWmY3ektOY0NaemZnOE1NNDJ3eGh0WG5DZzBMemxP?=
 =?utf-8?B?NzR6S21WazhzMmxaOEdySzVyVzJ5QWJ3R1NKYytaTGFQRWdFam84THF2UGEx?=
 =?utf-8?B?Njg2S2FIcURZYUpaY3AvbFRTemRETDJBaklYMW16OHJGcWp4TjJEUk1DNHhF?=
 =?utf-8?B?Vng0cStaOTg5T3JKQ21qQm9reG1TV1FkZDJEY2RGcVJRT3ZVR1JvaVVTdm5n?=
 =?utf-8?B?VFJ4dllTSGNPRC91WmQzdjZKbjZnSnNKbnUvQVE2Q0ZsVWF2NlMxbmZvWnBI?=
 =?utf-8?B?aENkcEllVGhWcE1OeGxzQlR4S3FYNWxtd3ZVVTE1UHF3cVM1d2xVcmdpQk1o?=
 =?utf-8?B?YjIvbi96K09mVnZkQlpyOXV0dWVQL0Z6S0JFRHZDWDAxZTFYcnV0MVAvYko0?=
 =?utf-8?B?VnFUcjhHUTk4aVJiR0prbG1iem1Xclg4a1dJWmU5LzE5eC9WOHE4NksyUmhE?=
 =?utf-8?B?K2tmb2lIQmJZaTUramluWVBJb0ovK2Q5Q3ovSjZEeHk2b0Z1cGt0WldqeER1?=
 =?utf-8?B?N1JpNGdxZ01JQ3lXeGpqL2JtMGtOTHVkM0ttNFVrd2tKd1djdklYeG1rN1pU?=
 =?utf-8?B?U3lPRW1DbnNuTDhmNmY2VThiSkowdUFjOFZHSlc0RjlNU3NjdHdMWWpxUFg1?=
 =?utf-8?B?alRVM1ZSdmV1bUlvR2YrUU16czR0VUZpN1hQaXdVS0YwQ1R2WDlvTnNZSnFx?=
 =?utf-8?B?R0pualVMWWdybXZxd09Cb2NmNjR6TklCY0RwbllNdXp3TTAzTzhKanorRWNo?=
 =?utf-8?B?cWVIdzBpVFU0ZENZbmNUYjRoQTI0Z2d3RTc3WFc1bmZ4cktybGIwRkJRODUx?=
 =?utf-8?B?VUZtVGhVMFlnM0k2K2Q1QVc2OEM1S0E0bkprZnBwZGtXV3M4OHlsY3JRREdV?=
 =?utf-8?B?RTMxY0MvU3FicUUrczZGdHQvWURkYWhJdHFKaUE5cjRLUmJJZjlyenUyWFlt?=
 =?utf-8?B?Q3R1eUVHdzFTQ0FmNm94OFB6L0s4aFMrdjhXL0JvY1lqTWpsaGpab2poMGVj?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2742E309971AC4C90BAA413CE3427CB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e72d2a7-0db9-4c5c-a6c8-08db002cf242
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2023 06:08:44.5916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ncb0Hp/WwCmpjYyB8J5yrL+GcKMpXZSG9q/HQdCtqE5hj9Pze3rVo+ZqTHCxH0Wu4yRfmVYFfQAKlprd0EhRuhTl95yfIjIVrKzAV3Q5KXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2087
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzAxLzIwMjMgw6AgMjM6MzAsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gV2VkLCAyMDIzLTAxLTI1IGF0IDA5OjQzICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiANCj4+IEJ5IHRoZSB3YXksIGFyZSB5b3Ugc2hvdWxkIHRoZSBwcm9ibGVtIGlzIHJlYWxs
eSBCVUlMRF9CVUcoKSA/DQo+PiBMb29raW5nDQo+PiBhdCB5b3VyIHBhdGNoIEkgd291bGQgdGhp
bmsgdGhhdCB0aGUgcHJvYmxlbSBpcyBiZWNhdXNlIGl0IGlzICJzdGF0aWMNCj4+IGlubGluZSIu
IEhhdmUgeW91IHRyaWVkICdzdGF0aWMgX19hbHdheXNfaW5saW5lJyBpbnN0ZWFkID8NCj4gDQo+
IEkgZGlkIG5vdCB0cnkgaXQsIHNvIEkganVzdCBkaWQgYnV0IGl0IGRvZXNuJ3QgbWFrZSBhIGRp
ZmZlcmVuY2UuDQo+IA0KPiBMb29raW5nIGZ1cnRoZXIsIHRoZSBmYWlsaW5nIGNvbmZpZyBhbHNv
IGVuYWJsZWQNCj4gQ09ORklHX0pVTVBfTEFCRUxfRkVBVFVSRV9DSEVDS19ERUJVRywgd2hpY2gg
Y2F1c2VzIHRoZQ0KPiBtbXVfaGFzX2ZlYXR1cmUoTU1VX0ZUUl9UWVBFX1JBRElYKSBjYWxsIG9m
IHJhZGl4X2VuYWJsZWQoKSB0byBiZSBub24tDQo+IHRyaXZpYWwuIEl0IG11c3QgY2hlY2sgc3Rh
dGljX2tleV9pbml0aWFsaXplZCwgYW5kIGZhbGxzIGJhY2sgdG8NCj4gZWFybHlfbW11X2hhc19m
ZWF0dXJlIGlmIGl0IHRyaWdnZXJzLiBDbGFuZyBhcHBhcmVudGx5IGNhbid0IHNlZSB0aGF0DQo+
IGVhcmx5X21tdV9oYXNfZmVhdHVyZSB3aWxsIGFsc28gYWx3YXlzIHJldHVybiBmYWxzZSBmb3Ig
UmFkaXgsIHNvDQo+IGRvZXNuJ3Qgc2VlIHRoYXQgZXZlcnl0aGluZyBndWFyZGVkIGJ5IHJhZGl4
X2VuYWJsZWQoKSBpcyBkZWFkIGNvZGUuIEkNCj4gc3VwcG9zZSBpdCdzIGNvbXBsaWNhdGVkIGJ5
IHRoZSBmYWN0IGl0IHN0aWxsIGhhcyB0byBydW4NCj4gbW11X2hhc19mZWF0dXJlIGZvciB0aGUg
YXNzZXJ0aW9uIHNpZGUgZWZmZWN0IGRlc3BpdGUgdGhlIHJldHVybiB2YWx1ZQ0KPiBiZWluZyBr
bm93YWJsZSBhdCBjb21waWxlIHRpbWUuDQo+IA0KPiBTbyBiZWNhdXNlIG9mIHRoaXMgd2VpcmQg
aW50ZXJhY3Rpb24sIHRoZSBmb2xsb3dpbmcgc2hvdWxkIChhbmQgZG9lcykNCj4gYWxzbyBwcmV2
ZW50IHRoZSBjb21waWxhdGlvbiBlcnJvciBieSBtYWtpbmcgdGhlIHJhZGl4X2VuYWJsZWQoKSBy
ZXR1cm4NCj4gdmFsdWUgbW9yZSBvYnZpb3VzIHRvIHRoZSBjb21waWxlciBpbiB0aGUgY2FzZSB3
aGVyZSBSYWRpeCBpcyBub3QNCj4gaW1wbGVtZW50ZWQuIChJJ3ZlIHB1dCB0aGUgY29uc3RhbnQg
c2Vjb25kIGhlcmUgc28gdGhlIGVhcmx5IHVzYWdlDQo+IGFzc2VydGlvbiBzdGlsbCBydW5zKS4N
Cg0KQnV0IHRoZW4sIHRoYXQncyBwcm9iYWJseSBub3QgdGhlIG9ubHkgcGxhY2Ugd2hlcmUgd2Ug
bWF5IGdldCBhbiBpc3N1ZSANCndpdGggcmFkaXhfZW5hYmxlZCgpIG9yIGFueSBvdGhlciB1c2Ug
b2YgbW11X2hhc19mZWF0dXJlKCkgYnkgdGhlIHdheS4NCg0KV2UgYXJlIGluIGEgdHJpdmlhbCBz
aXR1YXRpb24gd2hlcmUgdGhlIGZlYXR1cmUgY2hlY2sgaXMgZWl0aGVyIGFsd2F5cyANCnRydWUg
b3IgYWx3YXlzIGZhbHNlLiBJcyBpdCB3b3J0aCBjaGVja2luZyBmb3IganVtcCBsYWJlbCBpbml0
IGluIHRoYXQgDQpjYXNlID8NCg0KSSB0aGluayB0aGUgYmVzdCBzb2x1dGlvbiBzaG91bGQgYmUg
dG8gbW92ZSB0aGUgZm9sbG93aW5nIHRyaXZpYWwgY2hlY2tzIA0KYWJvdmUgdGhlIHN0YXRpY19r
ZXlfaW5pdGlhbGlzZWQgY2hlY2s6DQoNCglpZiAoTU1VX0ZUUlNfQUxXQVlTICYgZmVhdHVyZSkN
CgkJcmV0dXJuIHRydWU7DQoNCglpZiAoIShNTVVfRlRSU19QT1NTSUJMRSAmIGZlYXR1cmUpKQ0K
CQlyZXR1cm4gZmFsc2U7DQoNCkNocmlzdG9waGUNCg0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9tbXUuaA0KPiBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9t
bXUuaA0KPiBpbmRleCA5NGI5ODExNTI2NjcuLjM1OTJmZjlhNTIyYiAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL21tdS5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9tbXUuaA0KPiBAQCAtMzI3LDcgKzMyNyw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBh
c3NlcnRfcHRlX2xvY2tlZChzdHJ1Y3QNCj4gbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBh
ZGRyKQ0KPiAgIA0KPiAgIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByYWRpeF9lbmFibGVk
KHZvaWQpDQo+ICAgew0KPiAtICAgICAgIHJldHVybiBtbXVfaGFzX2ZlYXR1cmUoTU1VX0ZUUl9U
WVBFX1JBRElYKTsNCj4gKyAgICAgICByZXR1cm4gbW11X2hhc19mZWF0dXJlKE1NVV9GVFJfVFlQ
RV9SQURJWCkgJiYNCj4gSVNfRU5BQkxFRChDT05GSUdfUFBDX1JBRElYX01NVSk7DQo+ICAgfQ0K
PiAgIA0KPiAgIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBlYXJseV9yYWRpeF9lbmFibGVk
KHZvaWQpDQo=
