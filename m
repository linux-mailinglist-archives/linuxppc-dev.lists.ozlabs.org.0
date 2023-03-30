Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4836CFEE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 10:45:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnH7V2nwfz3fSZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 19:45:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jo5z0teh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=jo5z0teh;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnH6Z0Sykz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 19:44:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFj5Fd4gin0/XOyneGfSKTPfzoL0JqJ1Vss5P4Dyjo0w2T5BgR7XU0sgG9zfCQWrUTaCbpjxoNBQyBx5WxZnelW+cKyHmSukKdWplVw5JKecPdmnGFQ4wFV+CtyDnHeHeAOEI/w5UACSDYpVnSP8I9FpWZh8IDwGcabgy1gae7kmB6sg2hB6mpTE/XwvtHTt6irPGO3hOSiY1PFjcritJBOfp4QMdsiPtl1YBT5t9vLENhHYh8vyKV8LgDIf1E61RsmKieTzxKzBXQ1RKDDoxghbdw4MeEmU0i83MIKFOjASMu9eUnpwHtrnr2IqO0izToKgUuP8vJCsWOH+UWp9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiVsdJFQKEiDLxfCykGgtCn/8NZQK1J6PxPPIQFhXjg=;
 b=GhrDClM6omN1TsINpBxSVkoATloIWyiBp5fJjGUSRkse13G3NoxIfuZnEjThsgXTB6rB1ahCpfEPIMSWZdsYQFBc+9qCY+yFV90fOcjb7WBMH8lIUsWR+9eUtW1CGps7q1fqSmcM1Jj+kPw5JlSPBXNW0zJIzgjaRXpbrkUxKMd//px0gjPvU7YM1dd0GIy3tIdbUtkR8vGhJinT/JlBX6SuK40j8jbOUYQMYIt/TnW60iiTpCVjEhrLeXmGgZTydh8FanzbDQ8HsBdF1rmxvHguncj5N7t6VgI7ERmzYbYXeckXvHXVrkJmPb7dVYZz++tJZix61H4KOejJr251dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiVsdJFQKEiDLxfCykGgtCn/8NZQK1J6PxPPIQFhXjg=;
 b=jo5z0tehxpL8hBCzEoHmHpsDwf1pQUs1Uub3B2bUVJOBMPC0GSxsh3TaBi27NyTn2AcI3+o4n6Gmugw8BDzicUWsrQJfpm7/CONmWgA6jU5hfD1voQjteioDFucwyc2qzHNUpVHhRMtnL9VV0Lwi50V1ZY0hJDV6Gtcv189KrMyUODSLq8mTaFiPx/iwgsXU2B6tp5584hmn4T9lVCijLhau87b2FXdjiRS4hJ+wNghTnlGv66GIPaCj5+TcPGbi0kz3KjiMIG0N5o0AMmjlmIyEMKYqACPYyjDYImvaGFzhVtv9aI/VJSw+oODMNSl0MR0pCziWe/Eks66O+GwaAQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1734.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 08:44:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25%5]) with mapi id 15.20.6254.021; Thu, 30 Mar 2023
 08:44:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Jens Axboe <axboe@kernel.dk>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: don't try to copy ppc for task with NULL pt_regs
Thread-Topic: [PATCH] powerpc: don't try to copy ppc for task with NULL
 pt_regs
Thread-Index: AQHZYDCsztI03jSsUU6NInBtpDi8N68OLIwAgABAVgCAAUxpgIAAXJiAgALxbQA=
Date: Thu, 30 Mar 2023 08:44:32 +0000
Message-ID: <644648e1-3f62-8bde-f974-e40265abade8@csgroup.eu>
References: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
 <CRGYHQ3C77DV.1PXS812TV997N@bobo>
 <6727b289-aef6-89f9-8b4f-d63cbaeb81e5@csgroup.eu>
 <CRHSOZ15ORYN.1DMP7BFBDRFII@bobo> <87ilelcd1w.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ilelcd1w.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1734:EE_
x-ms-office365-filtering-correlation-id: 8af9d11d-0871-4c03-6696-08db30fafbf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iFqyuH3VfYwD5iMC/yX8PC2HyCNp+9s0vDYV7GRDIMKUriA/zxt0rZyF/5CCOfgeLhRi3QS0uvkAaSpnvI7qV83G44/y/XZmRLd8WEaqHHeajsRsiwoCxd1ctqOrQ1o/Z/BZf2DS1YIPTRLs+ZENreH97F0l/2rOXLxfw+a4orp4gNunkoclFUmw7IhuYKl9E8Wfto+eUKRfOVEsWamb46dCPQZLTAsZxGbwKefEdSy7qk7N3SfZTGfeFwn7Z6mMWWjyQt/cebSe3ZGpQzgMWoJ9U1F+qGdw7tWfBkT27sCRaAL4cDmzeIgdQ+g6Eje5pJqq4TMP+hQZNiO+F/2HQ3zaCGnEUayupTjt52tn4wvJxc3ODnLugUJBZP6Az2D2p26/ZQuo/dEzZ0IARvnk+6iIjgm/Csi1hcvq0PkNfwMnMFR/xqwkPQgL8ACbJAh6WlePN9gbiBE/JUgGJE+5J9ZwJCWrf1OBzshPLPsnE7rvIZKRAnALNGfK4dvpwskPHkfrGK+uKcytqa5ZoDoN7shnyXhbIUlNOf19V6Yu/Y8o0U4MypRIlCpUAx9Re7DXBxWG3kPEIyafVsHAHYZ77K1t/KRtM0vxTGypOqBvmCy3ILXIAdIFmaIYlD5Pg3tFdw+0KBM23SBRmtjTBD8CAhH7uLH4KH/TEuD8lsxNxo0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39850400004)(366004)(346002)(376002)(451199021)(71200400001)(478600001)(316002)(110136005)(2616005)(36756003)(186003)(38100700002)(31696002)(86362001)(38070700005)(122000001)(966005)(6486002)(8936002)(26005)(6506007)(6512007)(5660300002)(31686004)(44832011)(2906002)(66446008)(66476007)(66556008)(66946007)(64756008)(8676002)(91956017)(76116006)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZmJ2SUNNNmREYW5UNmlOTDQwczRjNzZSWThqTk5CUU5sV1M5WDdUdVRDQ0VL?=
 =?utf-8?B?OXYwMkVtTEpjWmEyY1BSZnI2cnFOQzhSV1FnUlJtK1pJa1hhNVZCTVNaSmhh?=
 =?utf-8?B?MkoyQm9NMCtJbWtnRGxkM3U5OXJMeGRiWHNuR0FRSFh4SDhPMCswTnRTWFJ5?=
 =?utf-8?B?WWJ0OEVOSC9lcm1WRmh4RnR3TFVaMjBaeW85QmhIVmc2MjNuTkp5b0gvN1BF?=
 =?utf-8?B?aDR4SEVoZVBnMHM4OFVJV2IvNVcxOG9rdVlvZmNZZ3dYRXNQbXlLUjl3Rm82?=
 =?utf-8?B?a3NYQlFrR00yLzRsY3gwamxYdlgrS1pWSERVSDFBdmZrN3Y1eU5yODdCTERD?=
 =?utf-8?B?Q2l0ckpCQzZnSmdpamloTk1VVTJsUU0wSlpFMkhYdndZRkUwc0pyRWF1S3BK?=
 =?utf-8?B?NHV2NXo2cHFWTWlWKzMyZUloRmRjSEd3SCtXSTBmTXZVNTJhK0hXRVBuRU1o?=
 =?utf-8?B?TEt4UzFTTUs0NW1XblBpdmpDUTFSRzMzTXdJNTlCUEtRZ2RZTVlHNzI2K1RE?=
 =?utf-8?B?RXJreGszLzNwWE5VenhYSTVJYjhma20vdTdudXpWc0NOVERrQ3NFcWpoOW4v?=
 =?utf-8?B?c1F3NUdjWDhxS3pxV3J1RHNCc3RVa2oxOXVZaTdXa0VlckEyZENEWEE4RWls?=
 =?utf-8?B?UHhVT0l6RUdlSTEyS1lGbHRtMGlySjdXVlZobndPamlLQXhad1BuQlUvM2d3?=
 =?utf-8?B?VnlhV295WnM1WFFnRS96RkZtL3VjUkxuRXQ3UEFsZ3ZTSXBJZVVDLzJrdnZS?=
 =?utf-8?B?MWFqNk1QdUJIZkxOWjduYnpjTmFDSWxuUzBpZmlTUWt1b2g4OWNCeURZeWtI?=
 =?utf-8?B?M3BZditmd3E3Vk5xRzZQZmI2VVRtRURuQ0JKd1lLWG5hQ05pMEs5TWprb210?=
 =?utf-8?B?OExzVkJLNGpGMVNndUZqd2t5UEo1MXQzMThYcHc3U1ExdW1zY1dYNmtZbU1G?=
 =?utf-8?B?UEVFSzl4Z1h1aFRtZGRUK2g4MTZFK1UrUWt3YlpXUW8xK0hxQWNud0hQejRm?=
 =?utf-8?B?Vml4d2c3ajd3Mll6U1dnaTBEaUhXSEZHOTBIM1VadjR4b2pxdW9EazZTcGYw?=
 =?utf-8?B?Zm9CYzF5cDZNSFJPRW1QYjRZYlN6bGlkd3UrYTFrWVdyL3VzdlgvYnRYUjRL?=
 =?utf-8?B?TjM4UEMyS1llMmxIcDdMQTVGbjhyckFFUHYrTEtjSnoxTlJrMTVkMVpvMnZO?=
 =?utf-8?B?dGg0d2RyMUpWUHRMT295UHdDQTMyY1kzaXREeEZuaUVCRTJmK1h0YWkxYkVw?=
 =?utf-8?B?bWExTFM4VDVtb1ZJRk1RRDVyY3BGWnhzYTE0VlkzU1Y3RmV4aGVpZEkwWGtx?=
 =?utf-8?B?T0hBUEVYRElReStBVUhlY3l1dzNwSVJwVlJib2pyMGNtZEd4cDBqUHVTdU9t?=
 =?utf-8?B?K2tDelo0SlJsNHR0K3BjaVFPd01mQmoxSmRCWUNjOXZJb2UyczNHU1JCdnFZ?=
 =?utf-8?B?RHJzWWl2S2N6bzNQMWRNRUI5Z0thWTRwNUEvMmEyak84NUhJMFlxUjc2Z053?=
 =?utf-8?B?MzU5N1dVV085NDRCdjNBMjliYk1ZbGMyQUpLZ2FseTQ1cDFyeko2ckl0eERK?=
 =?utf-8?B?SzF5R3BNc2diZVh5TlRSVTdLVFN2WWgvSENQWGkwN011clVTaXpYVmF6aE0w?=
 =?utf-8?B?ZXRmeGhheStyOVYyemRIK2Z5bjdmcnFURkFTMERKcVNpY2wrSEgzTVhLVWpS?=
 =?utf-8?B?Mno0OHBQU2t2d1R5TkdWTXFuOFN5OGx6ZTZkMTdKZmpwM2lWWmNtOVd3ck1B?=
 =?utf-8?B?azAyMFNHS2RkTnhnVE12SU1KTHZkOEVHUTQyN0U0Y1drbW1SL3p5c09jclRv?=
 =?utf-8?B?dDUvcC9wcWtSZ1hCMDF6ZnoybUZMRzVFUjVtbk9IMFFyekVuVGVKbEQrYkpv?=
 =?utf-8?B?VVNiZFI4WU1TUU1oOElmNFdEcHZQVWxFTVpNZkF3SDl5M2pabW93dnEwclIw?=
 =?utf-8?B?ZU85UTRCV2RSVmp3ZG1HM3hBcU9DWDNlZ3BnSk9GQTRjRFVKbjNUb2cyWlJz?=
 =?utf-8?B?dW9RS3c0aGpCcUJZVTFHNGJWT1NNRXZKR2MzUFdOaTRuVkQ0eUM3Q0svNWtY?=
 =?utf-8?B?ZzNRWGdLRnNXVjlXTUhqTzIvd0NNVlZTTWJBSXNtUWZCTTNtK2NkbkRob0l0?=
 =?utf-8?B?SmYzVUFDQTdlWWMwbFRoKzJKZm5JemJTY0R2ZS9hV2p1M2VhSElxbHYrN2ls?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7F87BE2B69021438D85AA7F4E856F30@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af9d11d-0871-4c03-6696-08db30fafbf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 08:44:33.0084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E65cMnOGt71N+tJ+7KHYu3mOn/vuWIwhCcYBjZ2oVMuQv2W58b/7FcSn7rq/6DmBiPYcJf7pYw1Lm5oCek1LWSELwOdThhspg+eS7XnRQDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1734
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

DQoNCkxlIDI4LzAzLzIwMjMgw6AgMTM6NDcsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gIk5pY2hvbGFzIFBpZ2dpbiIgPG5waWdnaW5AZ21haWwuY29tPiB3cml0ZXM6DQo+PiBPbiBN
b24gTWFyIDI3LCAyMDIzIGF0IDg6MjYgUE0gQUVTVCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToN
Cj4gLi4uDQo+Pj4NCj4+PiBOb3cgdGhhdCB0aHJlYWQucmVncyBkb2Vzbid0IGNoYW5nZSBhbnlt
b3JlIGF0IGVhY2ggaW50ZXJydXB0LCBpdCB3b3VsZA0KPj4+IHByb2JhYmx5IGJlIHdvcnRoIGRy
b3BwaW5nIGl0IGFuZCBmYWxsaW5nIGJhY2sgdG8gdGFza19wdF9yZWdzKCkgYXMNCj4+PiBkZWZp
bmVkIG9uIG1vc3QgYXJjaGl0ZWN0dXJlLg0KPj4+IEtub3dpbmcgd2hldGhlciBhIHRocmVhZCBp
cyBhIGtlcm5lbCBvciB1c2VyIHRocmVhZCBjYW4gZm9yIGluc3RhbmNlIGJlDQo+Pj4ga25vd24g
d2l0aCBQRl9LVEhSRUFEIGZsYWcsIHNvIG5vIG5lZWQgb2YgdGhyZWFkLnJlZ3MgZm9yIHRoYXQu
DQo+Pg0KPj4gVGhhdCB3b3VsZCBiZSBuaWNlIGlmIHdlIGNhbiBkZWZpbmUgcmVncyB0aGF0IHdh
eSwgSSBhZ3JlZS4gV2Ugc2hvdWxkDQo+PiBsb29rIGludG8gZG9pbmcgdGhhdC4NCj4gDQo+IFll
YWggaXQncyBvbiB0aGUgbG9uZy1saXN0IG9mIHRoaW5ncyB0aGF0IG5lZWQgY2xlYW5pbmcgdXAu
DQo+IA0KPiBJIHRoaW5rIHRoZXJlJ3Mgc29tZSBjb21wbGljYXRpb24gaW4gd29ya2luZyBvdXQg
d2hpY2ggc2l0ZXMgYXJlIE9LIHRvDQo+IHVzZS9naXZlLW91dCB0aGUgdmFsdWUgaW4gcHRfcmVn
cyB0aGF0J3MgcG90ZW50aWFsbHkgYSBkdW1teSB2YWx1ZSwgdnMNCj4gY2FzZXMgdGhhdCBhY3R1
YWxseSB3YW50IHRvIGNoZWNrIFBGX0tUSFJFQUQgYW5kIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQu
DQo+IEJ1dCB0aGF0J3MganVzdCBteSBodW5jaCBJIGhhdmVuJ3QgbG9va2VkIHRocm91Z2ggYWxs
IHRoZSBzaXRlcy4NCj4gDQo+IFRoZSB0aHJlYWQucmVncyA9IE5VTEwgZm9yIGtlcm5lbCB0aHJl
YWRzIGdvZXMgYmFjayB0byBhcmNoL3BwYywgYWJvdXQNCj4gMjAwMiBieSB0aGUgbG9va3M6DQo+
IA0KPiAgICBodHRwczovL2dpdGh1Yi5jb20vbXBlL2xpbnV4LWZ1bGxoaXN0b3J5L2NvbW1pdC8y
YThlMTg2YzM4NGMwYzkxMWY5MWNkMTIzNjc2NThlYWJkYzgyMGQ4I2RpZmYtOTM5YjcwNWNmZjcy
MmVlNzU1OTVmYWQzMGQ1NmJiMTE3NWRmZGNlNDlhNjlhZGI0ZDU2NTZmMzU0YmUwNzZjNg0KPiAN
Cj4gVGhlcmUncyBubyBjaGFuZ2UgbG9nIG9mIGNvdXJzZSA6KQ0KPiANCj4gU3RpbGwgbWF5YmUg
aXQgZG9lc24ndCBtYXR0ZXIgd2h5IGl0IHdhcyBvcmlnaW5hbGx5IGRvbmUgdGhhdCB3YXksIGlm
IHdlDQo+IGNhbiBkbyBpdCBkaWZmZXJlbnRseSBub3cuDQo+IA0KDQpJIGhhdmUgdGhlIGZlZWxp
bmcgdGhhdCBvdXIgbG9naWMgaXMgYnJva2VuIGFmdGVyIGNvbW1pdCA1YmQyZTk3Yzg2OGEgDQoo
ImZvcms6IEdlbmVyYWxpemUgUEZfSU9fV09SS0VSIGhhbmRsaW5nIikNCg0KQ2hyaXN0b3BoZQ0K
