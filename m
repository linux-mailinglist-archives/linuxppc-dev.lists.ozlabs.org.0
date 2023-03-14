Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D83A96B8C54
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 08:59:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbQsn4nWDz3cV7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 18:59:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1f1Modu3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::631; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1f1Modu3;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbQr40jqXz3cMr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 18:58:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8hwmtAh60CS4rykpsTzXyggPs4dyM3aMuS9yi1XBP0A1ElxlrwsPD3leXhWTmQcWxSolMOYc/Kl7bldKa7sDAR7/vOmhlF6VBB5FMizm8IaPo3B4GPXeIWVuzsrbhSRfIaPEBs++4E9vDhSuJSfibI2ohrL1d8rzFo6bgLQTssnxbN9KszjsZ2riQoprVEfE6iRTEFBFX66SfhrT8Qzafq+KxjtByCncP/eZ2otohI0ONFxgNaiWSykTQFPG9XRllbGoP20ypg+q6M45K2A+SBGXKh+OylbivbPul2S72bQkVsc+qGDX0fCzHyXvRHjRP4v8se/Cy6KnwDk9xCrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPc7pKxfU2ozA4dhob79QX/EqfznKv867c5/XH2b6DE=;
 b=KfskqnM22m7GHoBklmHOwGGmhF8FXSkEusiUJgO0JFXdA4bwuHKng8IzLtPYSjv8Bk+S28Yi4goLvkGBDgkYXwn7cKD0sRVOXRtL6oKFqUT5euC6L0MemcCuTbWUViQMTqgY3TcldVUMwigOrJH5t83FMNez6A60UpnFo/gBKqJRa4VWRGuss8GAtPVA+3Shw7KCydY053+Yt8jdECEln6KNaanelnaEU7j2Kax0791fK2Hwj93b9smVQW0N6l9KG+IAm9ko48MFEyrzHYEj7lX8LtRyiRbZZYdA8lSuCaWdmdTa9Hn9w/nRYTEHFZQBE2tAm5DTwsU9wQtJrsOtyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPc7pKxfU2ozA4dhob79QX/EqfznKv867c5/XH2b6DE=;
 b=1f1Modu38aWai1/wxl3Y6uQN2pXEP6Y9kjgPnYXDbZ4suPDSbib8L93aKw1f1e0ima9PvV+FXxQJBau9oA0po9ko4G9suCXAmSyi4K4qPq/fD+0lQA+/lvrog52X+ENLchia94AVhRkPfCkoRxKyKcDkoPDeSaQKwmtW+mvyZsO8RVqF6rBXipnygvEkeGC3GrpJ9669tl009pdGYkQrXycA+A1aYJSIIqj+5Gkn4WQW1zvkwdd7SvyPMC4FwqI/Znyr34cPer0ezwfTXDRD1LLwVD5fxVEUwkT1PYMuCxHkczwVEGe6cMyEbVdj8aJ8wC4FOmbM76aOzOJWJril0A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3120.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 07:57:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::3943:154a:eccc:fe3a%8]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 07:57:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Herve Codina
	<herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Mark Brown
	<broonie@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>
Subject: Re: Question about the dependency on the config SOC_FSL in CPM_QMC
Thread-Topic: Question about the dependency on the config SOC_FSL in CPM_QMC
Thread-Index: AQHZVkWtHpOi4+tuq0u8KkTviKWQ3q756MgA
Date: Tue, 14 Mar 2023 07:57:47 +0000
Message-ID: <49c46a72-ba18-2271-cd0b-5ef2af4639a3@csgroup.eu>
References:  <CAKXUXMwwQuwssyzBrOXHOz__YRpa1Rjgqmwn5rRFjDVLBbabPA@mail.gmail.com>
In-Reply-To:  <CAKXUXMwwQuwssyzBrOXHOz__YRpa1Rjgqmwn5rRFjDVLBbabPA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3120:EE_
x-ms-office365-filtering-correlation-id: 8ac978b8-3aa2-4ff4-4f5e-08db2461cd12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  L1hAeoApoc+qqXrhvqN5mECZu7RXy36gvWRRcV8ZOr44N9CO5O3RR0JGG+hzYfUFrl9lH2rUNvuzL6ZMd15CCGbbKfFxO4X/ne0n5JXP2qUd2XZm399bM6iWo/b3b2c1mlkwf29GXW4hycek8I2nIisAPnaacioru28zVGobnugK1Gc+H9gqNYQ4mg81RyY2Druojb02E1p1q0FHLGUaYZyhg4B3VhMMNKAQpyI/XG07SLJj6yUxRo8EWdRpkp7TZJifLrZu8AUh73GokOIRn/4hjuotsSbHXT06/5tiCJmsWMF2zPfDDSXbOel6zcglm2Ddy9UHlmECV9jbrwdLWzsYVlIBZp/ARj7PLLCsqtn32Si9iyWfa8rwYiyTp3/OHbBOw2tRFZk+9pIxguTfHi3sumqhrCVGCf5aI2gLcnuLvYGAgCRZpUEGCqOF84yw6kFrQF/jTbS6Jm5ZE0Nb3Y253WsHhKAetzcvk+jberR7MgDCK38GVGv7HW2q9LkYUOlX0e9aHoYGYxyfGOEXGqwsL8lmpv34ifHBJkN/ZeJBxWYwoMkrVPFLWFsfwDcSTS1QcEmU6d4XWqG++7eCBJdebgKgNWBJx7kSaEGsxY6fs9+qigV993Ss9ur14OtB7umqbDZP9MlSVmdX+5/kzh4mnApb0/3YCVwMTGA/WDhGNBROp2dgxWD62DSfsdxAqMQmO4SJFJCBqWrIJEAsM5T1TthoyhrFz6tnKvFyUeRKPgTLJg9FzLLAAEIRBJmF
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(451199018)(31686004)(66946007)(36756003)(478600001)(110136005)(91956017)(54906003)(316002)(66556008)(41300700001)(4326008)(66476007)(66446008)(76116006)(64756008)(44832011)(8936002)(5660300002)(2906002)(4744005)(38070700005)(86362001)(31696002)(8676002)(71200400001)(186003)(966005)(6486002)(26005)(6512007)(6506007)(2616005)(38100700002)(122000001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?R1Q3WnhQOGREZ09ZSUFjK0hoeklRalczZEFEcit1bHNTMENZQndUZG9vclI0?=
 =?utf-8?B?WWxMT3FYYmFoSnRjdm92OVhRMXkycHRqY042aWZvbEdrT0VsZW4zUExFeUJw?=
 =?utf-8?B?cmxRa2ZQakQ1RlhJdjRoSko3cVlkaldzQ1BYdmtwUW9iTFBrK3dmTlJQVVdn?=
 =?utf-8?B?MysrMDZkQU93WURRYll6bjZIYWQwazNiM1hvQ0dIMWJUOU1qVThieURXOXFX?=
 =?utf-8?B?ZGJOT3hMUDlQUi9EelRaeGVPMG1kYmNYOWlIUWtveW45YzVIdjEzRUxVQnhU?=
 =?utf-8?B?ZFBTdThWajdsNG9raXZzckxRWmk2Y0pXYlN1MlNlckRpbDRoU1dUOU1reWZ5?=
 =?utf-8?B?U3VwZ3Y2UmFWMnQ2OXlRTkxmUG5kSHpBZjZxZ1pGMU9ycTdzZFh6YjNQZmpq?=
 =?utf-8?B?YS9TSFk0VGZOazZHa0VXeU1EejB3UlgvanorUWttQVBtcCtmUlc0U2RyZDhl?=
 =?utf-8?B?cmhyNHdqcnBKVlFibkRBaHNJbkVSdWpuQXcxTHE3MkorOUxlc0QzRVFOaExo?=
 =?utf-8?B?ajYxVGFWWFhqU3Y0S1R5azA3T2lWSmx2N1greFhjaTIyTm8wbVowLyt5S24z?=
 =?utf-8?B?VFBmbHdEN3JtTjYyaUNaM1dnZUV0L01DeUNyRHpZRUtwT3lGOWppeGU4K0Rt?=
 =?utf-8?B?cFhhRE5WaXhPMjFFWlNsS2FoclVTODdFN082RE1hR0Vac3BmTnNoNmk5QTlE?=
 =?utf-8?B?M2NrbXpPWVZpU1hnSzYzZGFKcGtLcm5BalpSZFJOY3B6TGVEYTZOVUE3QUlk?=
 =?utf-8?B?SXUweHByVzgwbHAvOFQ0TksydStrY1NsanBmTVVsRjdNUzI5SFpwZGhqWjky?=
 =?utf-8?B?WVpYUHRvMlJOeWtBaHIwY1g5QlpEMVZSc0grVlhmU2ZsRVpPUlJMM0IxOHZO?=
 =?utf-8?B?OW9sZXBaeGc0SVNwOTVCcFMyU0tTKzRwMzRTT01MczN3ZGczV0tzVUZWR3R4?=
 =?utf-8?B?bVZpcktsa2ZDbEgyZHFCRzlINzMwWHF5cFlCQzN2QUt5U3pSelNhYUk3L0xW?=
 =?utf-8?B?eW84R3lpNnFHV2IwQ3hZckRUNEhRK1NMdTAwVjFObStwMVZCR2VJMDFXUm1B?=
 =?utf-8?B?dkwrdVp4bGwrYmtYd2o0REYvaXFKRCtvcjNEU0pFVERPTUplV2IzT05RMksx?=
 =?utf-8?B?VW9oQjUwRlFhbzNRMjZscHUzeDQrKzR3dmlvRmpobXU5VjVyZXhTajVDeElo?=
 =?utf-8?B?VVFuY3M3SDl6aEFoZlR0aDlOaUdnVFE2TlJrWmwyS1FGZ0JLckdTK1BpOWx1?=
 =?utf-8?B?Znc1WUF0NHRXcGdDeVNNdDZ4NVIyYVR3MU4rWFpEV0VSOEl0bVBMbWpoVTZV?=
 =?utf-8?B?cUJZZkJxNVNHaUJ3dTEyR0xmUCtSK0hMalhIYmdtNnRVVlFhcDEwcGJvaUxN?=
 =?utf-8?B?UzEvdTVtMkVpeHdzNDZzRVRzMXdValBwRndwaWJoUmtEOTM5WnJsV0FTRmQy?=
 =?utf-8?B?S2RDTkpqeDBxOVZrbmdVd1hleGJLUVdhamZJRldVelRXYitTWUFBeG5xWVox?=
 =?utf-8?B?UkM1NmlPRXlSKzVEMzdhUVFIZFAzbTF3ZStsQWdNc2tOcVhlTFpjNFFyc1pu?=
 =?utf-8?B?YlNYbEcySzJUVUdxTXhmUmM3Zy85Y1RWUWdPUmtLYXpvVGVqbVVTazI2RHln?=
 =?utf-8?B?VVpiN1dPQ0xWeDAzT09vUE9ZTUJzUzRqOVU1RHFlOStTajY1T015ZEZ0dEIy?=
 =?utf-8?B?b0d4YUJWYXRKZzJxZDlzOTVORWh2MW5KVmppQmp6RGMyQ3BNOFBVc0RFTXBT?=
 =?utf-8?B?cHJyckM3emNjTGpQcy9rTktnWTdIVmYzM3k4bzVYZXAraWFhekFsNmVXaGM0?=
 =?utf-8?B?ZGpDbUZDTmROcFlKdzg5aEJRRENXMDNET2JKK1JKSkM5VjBFd3R1Nlp4eWl6?=
 =?utf-8?B?OEU1Ymh6YjArVVNFaFN2cGRIYkFScEdzYXJkVkNKOEttcndvRTNPeHIwa2N6?=
 =?utf-8?B?V1E5dEhVTkxOZ3d5NS9iUWx3cnZjK0ZjK2wxOEZnWFRjT254UTd1UnZ0Y1hZ?=
 =?utf-8?B?b0dHbElvZldQTDA0ZUNXWDlsYS9vRmQ1TFhkVUhEUmRkWkZjdWROZDU0clVP?=
 =?utf-8?B?UjhNSElzTTRrSDhOVFVpYVM5c2NQdHB2VlRDd3YrOFdSY3h2ME1nVWE0RVpv?=
 =?utf-8?B?STJSVnBKTlhFWkJXMy8yNU5EeWllWGJCbmRncG5oUXRHNEZRZHNidlJjd1VH?=
 =?utf-8?B?WHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F006A0BE6DC39944867D6252EBACD81A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac978b8-3aa2-4ff4-4f5e-08db2461cd12
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 07:57:47.3700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LwV552O7wDxygso9K/KLKes0IJdgjMbzggUPbLv4JxLqwtn59OuKvKpHs7tbrmnCTAYtpI0AcCFtGG5S5DkXnTDjNNy2WteLfZn/x87Q/TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3120
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
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTHVrYXMNCg0KTGUgMTQvMDMvMjAyMyDDoCAwODoyMSwgTHVrYXMgQnVsd2FobiBhIMOpY3Jp
dMKgOg0KPiBEZWFyIEhlcnZlLA0KPiANCj4gSW4geW91ciBwYXRjaCBiZWxvdywgeW91IGFkZGVk
IHRoZSBjb25maWcgQ1BNX1FNQyB3aGljaCBkZXBlbmRzIG9uIHRoZQ0KPiBub24tZXhpc3Rpbmcg
Y29uZmlnIFNPQ19GU0w6DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwMjE3
MTQ1NjQ1LjE3Njg2NTktNy1oZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20NCj4gDQo+IFVwIHRvIG15
IGtub3dsZWRnZSwgdGhlIGNvbmZpZyBTT0NfRlNMIG5ldmVyIGV4aXN0ZWQgaW4gdGhlIG1haW5s
aW5lDQo+IHRyZWUuIElzIHRoaXMgZGVwZW5kZW5jeSByZWFsbHkgcmVxdWlyZWQgb3IgY2FuIHRo
ZSBleHByZXNzaW9uIHNpbXBseQ0KPiBiZSByZWR1Y2VkIHRvIENPTVBJTEVfVEVTVCBhbmQgd2Ug
ZHJvcCB0aGUgZGVwZW5kZW5jeSB0byBTT0NfRlNMPw0KDQpUaGF0J3MgYSBtaXN0YWtlLCBzaG91
bGQgYmUgRlNMX1NPQy4NCg0KU2VlIA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8yMDIzMDEyNjA4MzIyMi4zNzQyNDMtNy1oZXJ2ZS5jb2Rp
bmFAYm9vdGxpbi5jb20vIzMwNTg2OTANCg0KQ2hyaXN0b3BoZQ0K
