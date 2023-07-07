Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFC874AA07
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 06:44:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VNJDvDn8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qy15j0lNfz3c33
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 14:44:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VNJDvDn8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::602; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qy14n0H6Yz30hF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 14:43:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2cFEY0mG8y7gPYdnPxUz8Q8IkybCwbeDIc+pU+1lFMfLfppCNmr1CqsIsa1NL0NaBbcxq4FaLpWm1tDZl0wVg3orYx7r0Ovvkvn+dITlgrh8oUbkvWInt0UmfHheAHO06e9GfRXkcQN+F36xOEE2BXTQixZSVafaFnQqfZC42zjFvLg5IKmnec0EqmrCzbBnICKzKNFL9NedWWj4TBqWXJUXKmYdIQfYu7zycl6AOp8kt7Ui39leCWoKES/P4+3S3AHNLusLBumcBnbQ4PLGZPqn+JUQtB8AVidxZ4Tn2ZzLjuHUHu4fpEFG5GOfI9JD+TDBsCuSiEfxnbt9HPsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PGJ9BgxOHrYmnX1FdytZ3PHrmRfM3hr6wI/CzOO+xU=;
 b=A1cXQ+Ee6jhpsRsIbaF/d2uhgmrWaqFc6UWbVPQAIY7yRXV0SwiHqPECc/i8yp9ltqIpASbxnAlreoBzHyaW1ae4PBNVMo1T8atIL8Keaq9j7+CiEcxSTouXHdAB+SkE6lpZAyh5bUBzIiWuGA1dzUEIqaVN4QJ5xF9MsqPrqsQfaA9foaehlvDqxG6/WNNQ2qXFt9H1PVDvSxyFZGB72wHCBBlL+0+iUKS3GsZw/XHtXi8xU5q+XVo1P2FvckSjhhbilNRIMhVExJm+nPnqwctFo7JlOMTyFf7eOhW1UDWF37GrbuwYLQPEjmyOAfjv4YYt2eFaHenSE40hcQOesw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PGJ9BgxOHrYmnX1FdytZ3PHrmRfM3hr6wI/CzOO+xU=;
 b=VNJDvDn8WYQH4It1W+RBwn6VyhFX+g0m0GdEdGoMUFG1HMXSnbVdz0K/yuUnBhi9QqAZAPvpjSN5NP1ixsF3iIUPfe+1rz948NK3+7VtwFP3syRiTkSQYCFCqLj3yXNn5beHlTRrkQDW0b7ENN+r7LIzCXMFiiVrfIcZDvJFKcL82WXOifv3dCLUbNIXVUrS6Emo3UkBpF9xljRJC4E/KtuSHPxmh9EN7FPwXAJZW8A0SIBmxbLP0my6bYYsWD0mk5f7PUXqU/Lq2PYuOe2KxPnF+A/RGUhKB/0JNwFSb8FEcRdPjsGjOT4tWSSPUQkQ9ZbnYuCP8EIS2HvQ5N42fg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1572.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 04:43:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 04:43:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc64/kasan: Call kasan_early_init() after PACA
 initialised
Thread-Topic: [PATCH] powerpc64/kasan: Call kasan_early_init() after PACA
 initialised
Thread-Index: AQHZsHLfOkky4mHuhESmRsZPgdoIYa+tuj6A
Date: Fri, 7 Jul 2023 04:43:28 +0000
Message-ID: <00f51e45-ae63-253c-781c-a78b77ed9c79@csgroup.eu>
References: <20230707013110.215693-1-bgray@linux.ibm.com>
In-Reply-To: <20230707013110.215693-1-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1572:EE_
x-ms-office365-filtering-correlation-id: 15915c1a-9955-446a-025a-08db7ea4b55e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  syAT2Nry39nUs0uVHeAPwlQtGEn1qIy3uVFdxdiM57Rqv8xAv1ExezfGmFfMW2T1k+5UyTzvz6564AJ9er6Mu5lHAlqpgc6On3/mA1+DwG7aiFxND26vRl24d2xgq+VlYpDksceL/FI9bXP7/6HX2gGEzExZ4OeVA3k34u86H12V6WlTLaiyXfjuK/q6Af9bB18l1S2inx53GKtUjJidB+L1c4o/JWAlYuMCXCY5dMvSTv1JUw/V1qtHht6wQ6AnKhUlH9BNR5KsJy2DVfHixkk4wjPELQ+ZeVlPNbs1LoYhGQM6I1Yc8smeq6qGzMS6gkjRyW49mu7rVY26sl4iOtnWejfyxdBaCVy0ESIV4549PQm24Ou2ODRVjYWio/eTZE6huf6zt7W0bt4UMuqkxhaT1zVQRAyVpZrkWaJI9tfYpbG864KYcTkfH/DWJvEfOXkl+cTDR/J6DeW3620mrJo0BANQLl2crS8lkpdWqT2p2ASAVNuSs954iF4ok3+ThrzBqpFVGs5L5V2MzDexKS2Qw1Uvefk9qL1A74VFY3xHtMw1+gbAmAV7rpCFY/lHL1WR73fAHbtZqOyM4wa8E5bW9nLowAyeylmVxe1Gfbyh1y7hr5357LeerGrKhdrCitzwF5z900QsSMUhr1rjCKp8UXZVZ3+PGcacINr+BqPIsqF239LZzjaimqebdXGw
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(366004)(39850400004)(451199021)(31686004)(2906002)(91956017)(71200400001)(110136005)(478600001)(6486002)(8676002)(44832011)(36756003)(41300700001)(8936002)(316002)(64756008)(66446008)(66476007)(66556008)(66946007)(4326008)(76116006)(66574015)(6512007)(83380400001)(122000001)(38100700002)(38070700005)(31696002)(5660300002)(86362001)(2616005)(186003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y3F6dFdMYnA4cm82NWdDTkZMRXJsRXplMDVwMXZ0MHg5QW9KKzJmRE91NTFV?=
 =?utf-8?B?MzJRSUpqZ3ZteEk1RGN1WlJna2dKS2tNOFVIMW9LMFN3ZVdPVHFXVFZzc3o0?=
 =?utf-8?B?aGh1YkV5dlJQVzVJTHZmdzBtY0x6R0Q4NVNYWXB5dWNjR3lWWloyZDQrMEpM?=
 =?utf-8?B?OXV0RWpaWFZrdlI0cytoSlNEck5QQUFPZjF2SEpvSGpyRHhld0JuL0hLY1lE?=
 =?utf-8?B?OVBpR1IxNE82MWtXM21WZllQbDFMeW51MWpIV25HWTczZ2NXNWJDTXp3aUcv?=
 =?utf-8?B?ZndRVklJSXBoSkkyc2NmWmQ4c3lIcHBXcWM2a1dkL2pHT1k0UkhkWjVvWXIz?=
 =?utf-8?B?bTYwVUhiQmtDTWpBODFJRnBYN2JNVTltTmpraFQ0MzFPNTJ5RG1UcFh1cWha?=
 =?utf-8?B?MnNwWWNyUWgvaHFFYVA1RTQ3VU5URUM4dnlkQlRQS0hGV2RUd2hpR09PWEt5?=
 =?utf-8?B?c2V3WUxqcXlCN3pPekcyQUt4OU9NSzA0WUdEeGd6UmtWazRrM1kyRURRbGNC?=
 =?utf-8?B?Q29aK2NId0F1QUlBY3QyUC9YdHM0Q01RT2lCNGU1Q3plcEJxTnJLRlNVVCtu?=
 =?utf-8?B?MXlZWXprd2twMGVPNWU3OEsvSGorZHA3VXhveGVtT3dPZE5KcjcwWFFtSWNs?=
 =?utf-8?B?MkJncGRMUGlOV1lraVZBbG9XTjlVVm8wMlVxcjZlcUNiRHNSSVI1Wm1KS0lP?=
 =?utf-8?B?Q3U1S1JhNytUWWJLT1c5WVN4a1dNRGZNV1dPWVRmNnlxaUlUU2lDczMwZ1JL?=
 =?utf-8?B?VEVWdURNUjk4enZOV01kQmpFRWRwK0R0bUpQeDJIbW5rMmNQRXJCMWtSTTZn?=
 =?utf-8?B?d3JQMW5UTXVTWldUUHYxU0dxWVVuTHZMK1ZweWtFZ2tJT3YrU3RuWXlNMzJ5?=
 =?utf-8?B?U3dzaVQrb2RwcElpeG9IdWlwQm5SRE9PN0phbW1UaHdySUpJQW5ENkJGdTE5?=
 =?utf-8?B?eS9zNCtiTEx2YUVIRk45S3VqWVZ1eHB6OEJPcFBHYUVHWDFiazNCK3oyV0o1?=
 =?utf-8?B?RTBwRXdaWkdJcjl3RmY1YUxGM3k4UWpva08rOGZubEJQNi94QStOZW1GSWZN?=
 =?utf-8?B?dDdTRERFZ2VBcml6V1E4SzZRTm1FNlBTQWdsUGVOcnd0ZFM1MGpKU00wWGJK?=
 =?utf-8?B?dlExcG9ReS92TTVScWd3SHNwM3BJU3ppaVRBZlRCcE84TlNLSCtyeFQ5ZEdQ?=
 =?utf-8?B?TEhBZmJaSFV2S09GVk1SUjFBd2hBN0dlWktjQW5oN0JKVzBIaWpvMFdPYWFp?=
 =?utf-8?B?VGFkdnVMUHU5eTdxSEtJZ0hGY0h1SzljZDRlNDNWL0lLKzdpazhoWVUweHRV?=
 =?utf-8?B?dEtQMkZQaE1Tdmd1L04yYW5uTU01NjhjRXlLVlF6MFVXUk05VXRjM0Y0ODVx?=
 =?utf-8?B?VU95dnNhRmJmZDhnZ2dIWHg3UHFKdUY5aEsvSU4vTjJrd0xXb2Q3SGNUYWl4?=
 =?utf-8?B?WTZQMFAwWnAyQjdESndVcCszM0NHQW1LUnpHWGFYYld4bXk3NFlwZ3hZcWNQ?=
 =?utf-8?B?bFB3Y2tOS2V0WUQ3cHlDVnJtaGZqRHIrakVuQ1FqUWF5MEQyZWpxQWttcXlR?=
 =?utf-8?B?S1p5aHpHaCtLZ0JNZ2xIcHVNa2t4WXdxQVNiZWhxSFdGMy81cXA2NFF4RmpC?=
 =?utf-8?B?aDRheW9aQ2hFOThySU1YWTB2S0tGd0ZUT1NCZXZpSGplRXVnWDdaSXdrdmtN?=
 =?utf-8?B?RDR2cnNpWCtlL1g2dDFwVVBLK0JzcVVNTHVkWWZNS1NuODFEV296aGdvNHFW?=
 =?utf-8?B?L1dNTHU1WnNJR2pQaWpnaTlpMmJNNGRrUzA4YWVRTndyMlBLRGlyeHZNRStr?=
 =?utf-8?B?REdMM2tiQkx3b3BTVEhYQkYyM3hZUmJub1RGK1R1WTRJL05uVUo5V3dZRXkr?=
 =?utf-8?B?dkpNMWxCNmJITS9SWUNYd0VEVXljdmtzeEFPS0RLTnJ4Kzcwd3BYT2dxNits?=
 =?utf-8?B?cVJmaVR2bVZMUmlmMVFiWUsrT21nSHc3SnBpQ2VydnlNUUVHT2w0ajFpdDF4?=
 =?utf-8?B?MGNQMldGYW5PbTI4S1FIek1IamJ1K2Y1N0pmQzBlckxWWDk0RWxZbllGRkxW?=
 =?utf-8?B?V3NkdmxhZWxSV3dKckhIVVJLTzNvOGNtcjh4U3FReEowOGJSN2xqdkY1Uzl0?=
 =?utf-8?B?eW5ScmI0OEFpVkN0MmlxQTRhNnlUcE1VSlNmR0dUY0kvUUllNHVIMkU5aHJO?=
 =?utf-8?B?Y0JKWjc3Q1hiNXZCNUp3eFZZUENVemY4ZTJzMGl6cHc1SkFyUlRtdzgzQXpv?=
 =?utf-8?B?akh2Sm9SdHhwK2VucHl2cUg5alZRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <073F314150BC1F45ADCE88DE25198BE9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 15915c1a-9955-446a-025a-08db7ea4b55e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 04:43:28.5302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WhdgnzmNW37QzLmQPRv6lNxJe7wyFdVGtXCA4qNQtXcN1By09Yia9WX10H0u/uyuyg4CCP3mRgA20HUvvh+0vHMebAK71mBEZtIDNuxqxmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1572
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
Cc: "ruscur@russell.cc" <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzA3LzIwMjMgw6AgMDM6MzEsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlIEtDT1YgaGFuZGxlciBfX3Nhbml0aXplcl9jb3ZfdHJhY2VfcGMoKSB1c2VzIHRoZSBQQUNB
LCBzbyBpbml0aWFsaXNlDQo+IHRoZSBQQUNBIGZpcnN0LiBUaGlzIGZpeGVzIGEgaGFuZyBkdXJp
bmcgYm9vdCB3aGVuIEtBU0FOIGFuZCBLQ09WIGFyZQ0KPiBib3RoIGVuYWJsZWQsIHdoZXJlIHRo
ZSBjb3ZlcmFnZSB0cmFjZXIgaW4ga2FzYW5fZWFybHlfaW5pdCgpIHRyaWVzIHRvDQo+IGFjY2Vz
cyBhIGZpZWxkIG9mIHRoZSAoY3VycmVudGx5IG51bGwpIFBBQ0EuDQoNCm1tL2thc2FuL01ha2Vm
aWxlIGhhcyBLQ09WX0lOU1RSVU1FTlQgOj0gbg0KU2hvdWxkIHdlIGFkZCB0aGUgc2FtZSBpbiBh
cmNoL3Bvd2VycGMvbW0va2FzYW4vTWFrZWZpbGUgdG8gYmUgY29uc2lzdGVudCA/DQoNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+DQo+IA0K
PiAtLS0NCj4gDQo+IEkgdHJpZWQgYW5ub3RhdGluZyBrYXNhbl9lYXJseV9pbml0KCkgd2l0aCAn
bm90cmFjZScsIGJ1dCBpdCBzdGlsbA0KPiBzZWVtZWQgdG8gaGFuZy4gSXQgd291bGQgYWxzbyBi
ZSBsZXNzIHJvYnVzdCwgYmVjYXVzZSBrYXNhbl9lYXJseV9pbml0KCkNCj4gbWF5IGluIGZ1dHVy
ZSBjYWxsIGdlbmVyaWMgY29kZSB0aGF0IHNob3VsZCBrZWVwIGNvdmVyYWdlLg0KPiAtLS0NCj4g
ICBhcmNoL3Bvd2VycGMva2VybmVsL2hlYWRfNjQuUyAgfCAzIC0tLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9rZXJuZWwvc2V0dXBfNjQuYyB8IDQgKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvaGVhZF82NC5TIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9oZWFkXzY0LlMNCj4gaW5k
ZXggZjEzMmQ4NzA0MjYzLi4yMWE3OGE4NDljYTggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvaGVhZF82NC5TDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvaGVhZF82NC5T
DQo+IEBAIC0xMDA0LDkgKzEwMDQsNiBAQCBzdGFydF9oZXJlX211bHRpcGxhdGZvcm06DQo+ICAg
CSAqIGFuZCBTTEIgc2V0dXAgYmVmb3JlIHdlIHR1cm4gb24gcmVsb2NhdGlvbi4NCj4gICAJICov
DQo+ICAgDQo+IC0jaWZkZWYgQ09ORklHX0tBU0FODQo+IC0JYmwJQ0ZVTkMoa2FzYW5fZWFybHlf
aW5pdCkNCj4gLSNlbmRpZg0KPiAgIAkvKiBSZXN0b3JlIHBhcmFtZXRlcnMgcGFzc2VkIGZyb20g
cHJvbV9pbml0L2tleGVjICovDQo+ICAgCW1yCXIzLHIzMQ0KPiAgIAlMT0FEX1JFR19BRERSKHIx
MiwgRE9UU1lNKGVhcmx5X3NldHVwKSkNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJu
ZWwvc2V0dXBfNjQuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXBfNjQuYw0KPiBpbmRleCAy
NDYyMDFkMGQ4NzkuLmEzZjVkZWNiYzA0MSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tl
cm5lbC9zZXR1cF82NC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXBfNjQuYw0K
PiBAQCAtMzY5LDYgKzM2OSwxMCBAQCB2b2lkIF9faW5pdCBlYXJseV9zZXR1cCh1bnNpZ25lZCBs
b25nIGR0X3B0cikNCj4gICANCj4gICAJLyogLS0tLS0tLS0gcHJpbnRrIGlzIG5vdyBzYWZlIHRv
IHVzZSAtLS0tLS0tICovDQo+ICAgDQo+ICsjaWZkZWYgQ09ORklHX0tBU0FODQo+ICsJa2FzYW5f
ZWFybHlfaW5pdCgpOw0KPiArI2VuZGlmDQoNCkRvbid0ICNpZmRlZg0KDQpJbiBhcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20va2FzYW4uaCBhZGQgYSBzdHViIGZvciBrYXNhbl9lYXJseV9pbml0KCkg
DQpqdXN0IGxpa2UgYWxyZWFkeSBkb25lIGZvciBrYXNhbl9pbml0KCksIGthc2FuX21tdV9pbml0
KCkgYW5kIA0Ka2FzYW5fbGF0ZV9pbml0KCkuDQoNCj4gKw0KPiAgIAlpZiAoSVNfRU5BQkxFRChD
T05GSUdfUFBDX0JPT0szU182NCkgJiYgKG1mbXNyKCkgJiBNU1JfSFYpKQ0KPiAgIAkJZW5hYmxl
X21hY2hpbmVfY2hlY2soKTsNCj4gICANCg==
