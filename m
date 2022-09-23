Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BDE5E8022
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 18:48:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYylF0zZJz3cjN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 02:48:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=WXDevIDl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.43; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=WXDevIDl;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90043.outbound.protection.outlook.com [40.107.9.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYykR5Hffz3c7t
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 02:47:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK/Q45LBywlAHWFrEJcc1biitECuBmg/KQiXdw4f53SMRV5XFtWu4vqaEBvkCPReXPUtwbYWYFdgs9LvXI8NaIQhTnLm1y1sIdYUw9GTpxvjQVbI5quTYU3JBMwm3rttCeMFg7hLScaJVlB7OY48Tc9+DuToMyaXKT360HaWp6e96oVcxUaV8CbyRyTiEZQ4Iorx0d1qjFtbK4oiU+sQ1mSQaUJhY/bidHXScPdNQWIK2MmyTwbnEei2sCwQfnl2+pgi8C2j+b74sFfhNWLkY5yg2I1UCYD5TB9+qqK1rXCYj/09BKrluzaoOa6RO2GmELD81t0Old05UJv7bEVDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGj7nTXTMcoNqVO28slz9JzeIm4ymT8ZSAvXgFTZiDw=;
 b=nM9hmoumv+j0xdtM8vN3Ks2TSu6ENWPMqV27hd13IV4Rv8aPuyndZqcliWJgJmmMp6mLpIT2xk/G4dnjcWv6kf4IL5Bvmlc+sSLPZo4aBCdzJnx1rak0WfBtAmFKzDuU4Lonv9WZSnAqriJieFZ0vhqH1cRPuhRCW4jfQNAIa+H6lYmDG6H0H4xbXk4eI7x5M0OBMXjGr5YFkWsm5yHJoNds8LlU4k7CkITDfFbrUzRMV7BuDroE5K1gh1FCeLeappddbGG1mbmdeOFm7MRn8CksDAc1kVU0a2Ipr72WxN3nT/pE/UVWyl0geqiHVvkEIFKz/rwbXn/UW7TADjci+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGj7nTXTMcoNqVO28slz9JzeIm4ymT8ZSAvXgFTZiDw=;
 b=WXDevIDlPVVxHRvVrrGTNSuMnBgdxdBRufyQRWtzDRtHnVeR/StLvH0MacLDtXHgOTEDxQ0dosUJh2oeXACXswoVMjaA9TIoCurjK3K0ILq/y1dzXANoupzTIDdygxvO0RK1PzEF6AndW1xBkUXaYlfUr0yzPPB4eCDVecJDe8x1kMssrVNSJQ9qEArhNsDV4Go4Rg2RG7QALGCqdkOgownQfSN0WF5ANyi8nRmUFcGWgUc/UyEHqF7z9eOuVzA6hpv3qLtLU2JpMboIGRIcKc+Wf9gIk+dmbO4kh/yM9Bp03RQ8Du9CyuPnHBXyLVhjumTa6hx5vOLK2yFoQH0Abw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3043.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Fri, 23 Sep
 2022 16:47:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 16:47:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 2/2] powerpc: nop trap instruction after WARN_ONCE
 fires
Thread-Topic: [RFC PATCH 2/2] powerpc: nop trap instruction after WARN_ONCE
 fires
Thread-Index: AQHYz2MQW2imcSyh3k+BNNYfFkQymK3tOYQA
Date: Fri, 23 Sep 2022 16:47:20 +0000
Message-ID: <264df1e7-ad54-0fa3-c658-dff76dec8a97@csgroup.eu>
References: <20220923154143.1115645-1-npiggin@gmail.com>
 <20220923154143.1115645-2-npiggin@gmail.com>
In-Reply-To: <20220923154143.1115645-2-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3043:EE_
x-ms-office365-filtering-correlation-id: e5741156-749f-4132-7e9d-08da9d83481e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  lQsw8D7swQ48wJaN6rMdgK6xID1Rkv0/Gdx3iegog5/rEn7XGzWLff+MUkMgCdy2PfiwBTy7HE+c2SywssklzDCc1wQBC3u9p/bC9a9jfgOouGab6+d1QJeWwJtmhwQgXxJu8o5+Cmlzxs3K5NwCpVA0AzAT3wFphX3vdKtSdCsD10Ceyzlz5eUM6BmksOYkGD9C6aziPVcX1n7SOFeTOn86OFxNOHS617J9CZL2pw7M3nJL4IRs2HX1UQn4n0+aCEp59SBWkY7FkFM/Yr6FWZQ2w1YMl/dxdwHZ+DBpGBzlMu3srH1I4cli6DiQrgOdUIefjV5YfxHiubFIi4xVik35OjnfwUFqXbNlzb1h9o3Zau0YVcaDEfdz2MLK3pft+7ybpMxc2PqpLnwolxlC3FWMKWq/GVyyyV0dosWSlF+8Kmd/lgRq5edaAt3CUDAp/ew25C1iAvxI0ZJk5NVv/g5N+HfN0o8fFbJLteOmTAKJDSKwrWv6Asbixqt0BlcXB5QiBkMt01Y6VsTHqp1M5ARb+spXoC5jyzLTfNfBSu3EDj3O8AjiJrnnsfi/Z8xH0VdS/9bDkJoGuvNfvwmjbSOSefB9/yT+mS1w12RCc0EmiWrzMTbp46eYPJDViV1lZ+Ub4rukVdfZSN3dsEnQlkBe9DYJ6gkm8kQnFzViAjpvrFKVh14OA+huhIoL8qZYEryob9CtIAPh158gh73QAO8eQ4bowzp9MlttjjX3wVQTk4R6cQCi5327hkig1MjpmvWEOich/UkwgY+3HreWN4bYj+vxnbGs4sUT7DTZckU6vxydte25LTBD3YIq+AKFvBiZ+jlm2nBpbxRSElOMeQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199015)(110136005)(122000001)(86362001)(38100700002)(66476007)(66446008)(64756008)(41300700001)(76116006)(66556008)(31696002)(91956017)(8676002)(66946007)(44832011)(2906002)(316002)(8936002)(38070700005)(5660300002)(478600001)(83380400001)(186003)(6486002)(2616005)(71200400001)(6506007)(26005)(36756003)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bmxkVzlJM2VZWE96QjdKVFpoWEtXSEFycHBUOXlGVDR0Q1locXBoR0k2K1la?=
 =?utf-8?B?UEcxWlRsNUdnRGgvUWJOWkdGRG4xQ3hHZGNHZnpjTkUweDQ0SVFOQ3lSamlV?=
 =?utf-8?B?Q1RYRmwydjZWc1JsQmxyNlQ3ZXBmenBWUVlaNFlvZWFwOXByWVZoV3BZS0Qy?=
 =?utf-8?B?WFVJU1gyaXhRUVRiV3R1LytOSGlQRWJrM0RpMDNmaFZ3MXp0a1pic3JwRmUx?=
 =?utf-8?B?SXBXU0luRVN0TCt4WFVmYUpBSndldTlncllJazF1V0JCQUU0SzhieUVRSG9y?=
 =?utf-8?B?ZVBXRW1iTUVNc0ErVDdmeE82Ni9CTks0ZjBwRzZFRlJ1V2JHdW1TUTE4dG1O?=
 =?utf-8?B?WmJCZmpjVmh4M0xoWlhCVlFOaGhvR0ZQalNhdEt0SWVlOVJyRHhrS2VQTEVw?=
 =?utf-8?B?cmpielhZRENHWUZFckEvTWI3RW9pb3h1YXJrLzVzRlJSekdRS2podEVseW91?=
 =?utf-8?B?WlRSN21xOVltVXRZZVUvWk13aEIvTFJhcC8xMzM3NGM4UWx1RGlhZGgya3pF?=
 =?utf-8?B?UFFTckxhQmZsRkl3L0NYeGMvd0hoVFNFeSt2T2MzYlhrYWxaMUxQVjJVRVB0?=
 =?utf-8?B?SXordWVtbFJyRWJ1b2xobVNIZlR6ank3SkJvdXh4MnlSUVVmenR6OWUrM2gv?=
 =?utf-8?B?NXVVQ3djVjBjVzdwYU1UMDVGd3RGVk1ISEpaMmFDbk9HZVZCUXZOWVJZVFJM?=
 =?utf-8?B?aU5VZU8vYzduWkJFWFluSmRLSU5jSXJiMGJ4ci9ITlBtL05PUkhSR0dlTWtE?=
 =?utf-8?B?NENiQXA5MjIzNWNmcWxUelJmVVNLZ0tDVXpqVmZZZ3I2eGl6Y0dGZ0Fia2l4?=
 =?utf-8?B?dUtVWmpMeHYyQnAzQmxHL0x2ZE05VjJHQnFVelJUUU80VEh1cU4vQlVsODlU?=
 =?utf-8?B?WlZhbi91cjZZOVpJSjg0bzdTREpvUWtwYlV0K1hFZVcxc2dhOXM1MnNjclND?=
 =?utf-8?B?MHZKeUdaY0RRY0VWRWR3MkNSMVpmQm5oWWFObWtwS1BaK21DWlFLT1JzRGxq?=
 =?utf-8?B?aU52eGRmdGpUZXhRb25wUWx0YmFjOWptQ2U3QVFvbjR2eVVpdVpMUitud0ZF?=
 =?utf-8?B?aHE5THg5cEJia3RPdHlZNGNzUVlEbS9NbVVpOGMrTnphdktrSEdhWC9WNVFD?=
 =?utf-8?B?OWJCNkdLaC9kbm0xWEZwMXFIaVFoTklUK1Q0L2t0SzcvWVU3R3Q5RVZYSTJI?=
 =?utf-8?B?T1RId2VlVWtRTmZ4Vk1Mdmw3MHd1bnFxeko0dlQ4WWZuNk9idFdzcFpaY0pW?=
 =?utf-8?B?Qkd1emR3L2t0MUpmb2MwK0liSHBIOEdjUTI0bTR3UUtydGprRG0rbTZVeGpS?=
 =?utf-8?B?RXZNWHJlVDZmb1BkM1hIN0IxUHpTSXh1UkpKdEFFU3ZRenVmeUxheUtoK1Zh?=
 =?utf-8?B?QlJyZnlFdXRYZTVuY0VUY0IrYU83bTVJMit2eHZKUEpMLzVzREYvSnBIRnl1?=
 =?utf-8?B?elR5VnFmdzRsNmpNWHNoNVZJaFpiSjhYZlRidVM0dkNtaVNhd0trZy9ndzk5?=
 =?utf-8?B?anJKcy96MG5EZm9XN0Z1akI3U1FVVnBqeWVKYWtaQ0lob2crbGVhT1RJd2lS?=
 =?utf-8?B?K21QUjJNUDBWMkk0SUJFQmdaS0ZsY2NQQkhUR3BVVFNrYlYxRHRSdW1YcHNN?=
 =?utf-8?B?bXV4NnhaVXM4STFGWEZnUS8ra2VtM0tmWkI0V25CY1ZXelZwOHJZMUpYUkZ4?=
 =?utf-8?B?b3NaWUFXalo2NVhDbzRmSENMa0lxVmgzQy9UU3hmQm5NM1p4STVWL1Z5NEVr?=
 =?utf-8?B?VGdvQ2NKVTNzWEgvd3JObStRT0xsRzA5aGI5eUFnL2FHcXdEcUM5NDBEV2JI?=
 =?utf-8?B?YU13dmNwY2d3bElWNlBITG1Bc056NnFLWWV1Q2hJOE9nNzBMam00TzJpREZZ?=
 =?utf-8?B?eExkb3dOb3JJVkpnQWEvMFpTN0xidnNFZU9INTU4cW8yck1ZTW9rbzQya2lR?=
 =?utf-8?B?MkZiNmNLSVhiQStoRGpTVEYyb1pZWXprMFIxN0pRWDN2RG5YbzdoeGNIdU1Z?=
 =?utf-8?B?VEdaN1B4Rnl4VkpLMWd0YjJ4eURMMlVoOWZBaVZEV2t4VmJDRW52bGlCR2tL?=
 =?utf-8?B?NWl5RkxLdVJPYm9odkJDblFNS3Uxa2pFLzFjbXZ1YmFscVl3cFJPem90Ulls?=
 =?utf-8?B?Z01aczVveDdZTjNGcldmNi9lMmlCT1JwS0ltclJZSXlLbmNMWEYveldteU0x?=
 =?utf-8?Q?1Zq0nrVofFsqo9sBeQGLxrQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8C24D74C21FA44B83F15855BD88EA32@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e5741156-749f-4132-7e9d-08da9d83481e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 16:47:20.2268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gUkvlZI8Pv9aiJQBbSKIQ+OsNCyDlDY8qT1XQbim0wxNpv6496zWe+MO0OxBnCrl3jvERiI9IJXDSEhnbfSfIRUV2o3FA3vq/nBZ36c2LxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3043
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

DQoNCkxlIDIzLzA5LzIwMjIgw6AgMTc6NDEsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBXQVJOX09OQ0UgYW5kIHNpbWlsYXIgYXJlIG9mdGVuIHVzZWQgaW4gZnJlcXVlbnRseSBleGVj
dXRlZCBjb2RlLCBhbmQNCj4gc2hvdWxkIG5vdCBjcmFzaCB0aGUgc3lzdGVtLiBUaGUgcHJvZ3Jh
bSBjaGVjayBpbnRlcnJ1cHQgY2F1c2VkIGJ5DQo+IFdBUk5fT05fT05DRSBjYW4gYmUgYSBzaWdu
aWZpY2FudCBvdmVyaGVhZCBldmVuIHdoZW4gbm90aGluZyBpcyBiZWluZw0KPiBwcmludGVkLiBU
aGlzIGNhbiBjYXVzZSBwZXJmb3JtYW5jZSB0byBiZWNvbWUgdW5hY2NlcHRhYmxlLCBoYXZpbmcg
dGhlDQo+IHNhbWUgZWZmZWN0aXZlIGltcGFjdCB0byB0aGUgdXNlciBhcyBhIEJVR19PTigpLg0K
PiANCj4gQXZvaWQgdGhpcyBvdmVyaGVhZCBieSBwYXRjaGluZyB0aGUgdHJhcCB3aXRoIGEgbm9w
IGluc3RydWN0aW9uIGFmdGVyIGENCj4gIm9uY2UiIHRyYXAgZmlyZXMuIENvbmRpdGlvbmFsIHdh
cm5pbmdzIHRoYXQgcmV0dXJuIGEgcmVzdWx0IG11c3QgaGF2ZQ0KPiBlcXVpdmFsZW50IGNvbXBh
cmUgYW5kIGJyYW5jaCBpbnN0cnVjdGlvbnMgYWZ0ZXIgdGhlIHRyYXAsIHNvIHdoZW4gaXQgaXMN
Cj4gbm9wcGVkIHRoZSBzdGF0ZW1lbnQgd2lsbCBiZWhhdmUgdGhlIHNhbWUgd2F5LiBJdCdzIHBv
c3NpYmxlIHRoZSBhc20NCj4gZ290byBzaG91bGQgYmUgcmVtb3ZlZCBlbnRpcmVseSBhbmQgdGhp
cyBjb21wYXJpc29uIGp1c3QgZG9uZSBpbiBDIG5vdy4NCg0KWW91IG1lYW4sIGp1c3QgbGlrZSBQ
UEMzMiA/IChTaW5jZSBkYjg3YTcxOTkyMjkgKCJwb3dlcnBjL2J1ZzogUmVtb3ZlIA0Kc3BlY2lm
aWMgcG93ZXJwYyBCVUdfT04oKSBhbmQgV0FSTl9PTigpIG9uIFBQQzMyIikpDQoNCkJ1dCBJJ20g
aGF2aW5nIGhhcmQgdGltZSB3aXRoIHlvdXIgY2hhbmdlLg0KDQpZb3UgY2hhbmdlIG9ubHkgV0FS
Tl9PTigpDQpCdXQgV0FSTl9PTl9PTkNFKCkgY2FsbHMgX19XQVJOX0ZMQUdTKCkNCkFuZCBXQVJO
X09OQ0UoKSBjYWxscyBXQVJOKCkgdmlhIERPX09OQ0VfTElURV9JRigpDQoNClNvIEkgZG9uJ3Qg
c2VlIGFueSAuLi5fT05DRSBzb21ldGhpbmcgZ29pbmcgd2l0aCBXQVJOX09OKCkuDQoNCkFtIEkg
bWlzc2luZyBzb21ldGhpbmcgPw0KDQpPdGhlcndpc2UsIHdoYXQgeW91IHdhbnQgdG8gZG8gaXMg
dG8gcGF0Y2ggdGhlICd0d2knIGluIF9fV0FSTl9GTEFHUygpIA0KYnkgYSBub24gY29uZGl0aW9u
YWwgYnJhbmNoIHRvIF9fbGFiZWxfd2Fybl9vbiAuDQoNCg0KDQpDaHJpc3RvcGhl
