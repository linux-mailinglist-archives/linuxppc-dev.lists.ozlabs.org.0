Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD294750E96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 18:30:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=eM+Hvdpz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1NWr3WKZz3c1q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 02:30:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=eM+Hvdpz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1NVr3zggz30ft
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 02:29:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7DLi/PJflRF/W6M8om7jcs+LCJuc73EOBfx/1AsYsr9gfpoMLnMgSU99m5AYoQjac/BlCiT3OLEfYuBsKfC6qutnjeK829f/NjP7e9NoH7UaN+exC/+tmOEkqaNCM1LqqZhV7AccJWI8isVFnXIySyrnVONutcDVhxX4CflcSgxMyLt2ERhBSX3RNd04HqMpFfWaWY3SwSBn41W/Fe4rGeHY+CfeDeE2K9KPYTSTfpTOOfgezEqMZyNyVhzvWUGo8uflsIvR02WlUVJo0mZxuWPytuEN3HOIHBWlMw06qgxPZcwmBRL9UpRJx6vBtM0RSEYRkG94aZNj+24IGqGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/3wxecoRkhzkbyFKMTJCgfWD3uW8jpoTr+PgOO7MqM=;
 b=eG+dkRctw/V5nUMNq2wdiFYfS355f+dedp+Hkw747FBXZ7sJS8UL2VAIRdAtjZASfVyCl4RM16Pqan53dkPi+/KliApoCm1XaEmkq1N5QQ8CozSdcF6cXS90LcmYAnTZA4wLtb5Uhm2kFDUmnqXK33MSn+Z0vuG8wbdZ5kX3wksp4VLXwFDroome3sgVIk4PgT7QDaitCEVMg+pfwXlpbioBtMjohhT/Q+35eSGYGmdU6dLXsHyXgxemmncjueKUaM287A1oyGyk4JGHqvMUnLhJ4ygbL/lhHjQI05NNGhMzvuhvm3RCi5PdV/kqQZn7A0GAhB+r1IYnQ2B/4cTNkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/3wxecoRkhzkbyFKMTJCgfWD3uW8jpoTr+PgOO7MqM=;
 b=eM+HvdpzNQXgLA1NBdpfjuMegitOiCy7GPVdCXfBs8yiIgB+0ewOSOdYyl5sqkrKRIUk4tu5Bk4SL6FCXq+GW8/b9pnIP3p7D7B1TtquTgOK4flYqTX/F8ZqpLCc7y8XZ5KaEU69dsbk8p+LSH7RTMfZxCU+PvX97XnwMe9H1f4cahXUV+Zt5TDn4r2RJk5+zT7RAf0U4+WuNdViMXA2kESwRPczc0Vr+CKWGTqGyF2yGVaAcAIW9WevnzMV+3MChCS+lgPwJflCwZaVzEk8LDAFjPO2nuZNQt9u87+RfBD5BZUvRf8VQD7vZ2hmZEWiTKNPihitNesSFvbhl8zA3g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3436.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:14b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 16:29:16 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::19bf:f9b5:ef8f:b2a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::19bf:f9b5:ef8f:b2a%6]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 16:29:16 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 00/15] powerpc/objtool: uaccess validation for PPC32
 (v4)
Thread-Topic: [PATCH v4 00/15] powerpc/objtool: uaccess validation for PPC32
 (v4)
Thread-Index: AQHZtBH3I+ZydMZOwUaCknnPqlb3m6+2MNGAgAAjDIA=
Date: Wed, 12 Jul 2023 16:29:16 +0000
Message-ID: <7618a2c0-64b2-22a5-ad69-105450f0dd1f@csgroup.eu>
References: <cover.1689091394.git.christophe.leroy@csgroup.eu>
 <20230712142351.GJ3100107@hirez.programming.kicks-ass.net>
In-Reply-To: <20230712142351.GJ3100107@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3436:EE_
x-ms-office365-filtering-correlation-id: f2b104b2-bae9-4957-7dd4-08db82f522b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  lnMdk/+gctdnqXo+jAsDvZeeux4F3A4EapQXy9MACB5AwvCddUmiLLTQSc3nlkLyQR0pqJYf+2898pWq7hC90UJDOxXCc6uOO6vGrbB3ik2xntTbg6o3nto8q60F9N+1ljwEkFBvl0J/UwpXRa1CZLUPD2pcaq9cVUnyg6Zc4/HosUIXcH9+o/rcvP16cYbQ58UZ9z/UDv0g2y7qEwKGnebPPTaRUUeae72Y1K7yi/+BGKMeNyLyv6CY3azL2pSu060EokzziS5i+5myNmvUtkx/mDZTqU995CP1n2PjTScC7UBz03AivOSqClnPLw5d4tg01HIRWr2gYjKW6Ro2bOaFwkKj39U/VkkbMvvXVrp9Uv//Vkp2xgJsVBGZobzeRVuuvyncrzn92pIWBNx43zeH5MI9HVlBvTcu9+WXrFyp9+/J+4rAcIeNBBlCQvwmjpiiUa7fW652x7UQWmqr6GTbP6aBhnAom9claVDxXEICcbbnYluZg6PS8E8PINr0XT6zCc5l5GnqaZzmvlOSks6DUB19GE4hi1CXKMYICMC0Mx+vrurOOjDrj/XJny/NDYimwB/gV/bsigwCX2EMloPkBdUPUGSjWg0b98xkrL8IU7zSVYVZtEecPdNmjGEvpcezCmwvXusjsWpHXOL2vQobFlHUj2CADAw20TZ9y70=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(31686004)(2906002)(54906003)(478600001)(6486002)(71200400001)(8676002)(8936002)(36756003)(44832011)(66556008)(41300700001)(66446008)(66476007)(4326008)(76116006)(6916009)(64756008)(316002)(66946007)(91956017)(66574015)(83380400001)(122000001)(6512007)(38100700002)(966005)(86362001)(5660300002)(6506007)(31696002)(38070700005)(186003)(2616005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VWxhZHFGbm1Oc1dhSzVoLy9oalJGRklXT3JoUjFVOVhVOVN5Q3dqT2Vlbkt3?=
 =?utf-8?B?SkgxYlVDc0cwZFRrQ2ZSVHVXaVRoR2hvY0NYYTNJUWJwcXFJQ2tNMjdSakZm?=
 =?utf-8?B?WCtoTTNyTDlLaGQ4TU9jOGlkNjBsMkd4bTRrdmNJOXA2K3JsZjhkcWJxWDNW?=
 =?utf-8?B?SkZIcnEyTkdCRWV1SkNFMjF1S3JseWFZTm92RENJQ3B1eTIzbWsvMmt3Z0pl?=
 =?utf-8?B?WVVmcmpCMnpNYjBxck9EZHREQk5BREZjeEExOG1UQVA0VXlJNy9kOGRzSWFO?=
 =?utf-8?B?VGZmYVdLOUwyV0JzeTBlZXpIZXJDZlFqMjZidHNVSTZlUjBwdzdpUzliRjJz?=
 =?utf-8?B?ZE03L0prQXIzTDhOOTNkbjJ3b2JOR2JZeWtiRXI2SWJDWnU0ajhNNTZpTXJ5?=
 =?utf-8?B?d3p1bDRESHQ3YTdtUEtWZ0czdXRlaEd1M0hUNlJ6THQ2MnB1MGZ5Z2RYRnkw?=
 =?utf-8?B?U2VvdW85Q2E5ZThORFV6VTlEbXFsY0lPV3NCdWxPWjZyY25ha2NJOGN3RHhI?=
 =?utf-8?B?SmNGa1Q2SldsbElLajREN3NCU0ZQcHlDRDdtbGV3Zk1hTGlSTFFyaG5ZKzF6?=
 =?utf-8?B?aXVoUDlDRk1NMWRyMXNTVGNVR0IycGVJeVpGRFhIempMN0NxZkNXVW5IeFF1?=
 =?utf-8?B?ZWlZODc5WGxZSVBCUDRLTEJGTisveHRNNjc3b1FuS25CSU5IZkFKbFVrSkpv?=
 =?utf-8?B?dTBockJLU0pFMHNCU0g2YW5Vckx1bHV5aUV2OWIvQllkSmo4Y0c0bHJ1emxQ?=
 =?utf-8?B?a0FBNUVxNnNPNWJ2aC9zQUFFcTdNNFp4Yzc1YzhGbU4reU1RZzU1VldSZlIr?=
 =?utf-8?B?QWEydzZvY1BxRTJ0M1dNc2d1dWhaeXVlNys0ZGFubGVoK3k5QlhMa0N0K0lU?=
 =?utf-8?B?bUF3eEZ2TjdjNzJEODJDSDVaa3hmVXQ2WnZhMlh4clpRTkZLbVFMRVRmalp6?=
 =?utf-8?B?RCtmaXFOeHdvUUdyeWkvOWd2V0NFVnU4cUdmOGp4SUt0SEpVYUQ0bzc1eWtB?=
 =?utf-8?B?NEJOcFF2T3lMZC9EaC9FY1JnUGd4U1U2OUI1RTRZTVFtNEN3YUhwcHJRbUF5?=
 =?utf-8?B?WDNvVzJMWU1Db28wU2RsRm9TOE90V01OclhXR2ZqWkVuWFJEN2pyQVRoMStL?=
 =?utf-8?B?Y093VXBBMmVidjJTZGdhWnh0N2ZJRjFRY2Z0dW0vYmFNb3Vqa295a2hSdEN1?=
 =?utf-8?B?ZWZ3cGFqUHRXbzFQTlhWUzd4U1VHZ3o4SDJkTU9IZXRtSkloWHh4WUJuNEMx?=
 =?utf-8?B?ZWtielUxV0swRGF2T1JsVmZmNEpabE10dlNVRkk1MVNYTnJiaWwvL2YvY2lY?=
 =?utf-8?B?ek5ZU1hRQnRQcFI2N3plcHdwWnZwTTAvSEZXTWlHOTAxbXlMVjRLWU1seERD?=
 =?utf-8?B?RmJJekFEVGdUZ1ZPaDFlZlNvRmJ5bXFDcjJYR25WVVIrbW82R0RWOW5HZXhC?=
 =?utf-8?B?MXZtWHV2WlYzTmpGQkRXNFBXRnluZ25OU2lwdmhqcXhyQUV4enVqWFUyMFYy?=
 =?utf-8?B?SEs2YktKRTl2aExYYy8xMHQraXE2Rmh1b2tTMEhoaExnZlNmWDdzck9iY3hE?=
 =?utf-8?B?Ti84SzQrd0VObGp5SkFXY2VZSDJRajJ5a21VQWxlR1RZT25GQVEyYVJvZlR5?=
 =?utf-8?B?dzdEUG83eVdhZnVCbzV4SW5SY1pwVThhUlkwY3I3TXovaXoyZmI4SWVZcG1n?=
 =?utf-8?B?c0hYZ0g0dVh5UU1FVlVVQk5CWU9GbmkwaktGSjlBSS9HWkNNSG8xNDRaTFdh?=
 =?utf-8?B?OVBnMUNHTlh0US9NNlo3aXBnMXhXTThTK3gyblBPYUViNTFEL2x6anQ0T0pw?=
 =?utf-8?B?RWJDYTZtVE9JdE9iNHl2bzBOdUZrM2cwY0tidlNscnpOMHNNTEJOVC9sZGdJ?=
 =?utf-8?B?eWhhM3FTTWxoTnVsejU0eWp2Y3RqMllUaVQrMU9kK2ZnakpqbkdvblN2Mkdk?=
 =?utf-8?B?U2tIWHNpTnFRU1ZmUXloQTQxMUs0azVkUHlLclVVN2pvNlZrTkFkYnJ5OUdH?=
 =?utf-8?B?NlFrVFRqT2pKSWE0RUJXckI2UkJ1M3VIWC93ZzA5TVVIeDVtYlB6VFdSRFBL?=
 =?utf-8?B?SDRROVdTcXI0ZEh6d25TMEFqNmRXMTZiblRaQkwza2lCa3kyZGpmNTJDVTF3?=
 =?utf-8?B?MmVneGNHalVEZW9pQXZGTFhwTkNiSVh4L0lKTnBNVmlBemxLWmZxdkhjbjJz?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D387725A245B4442B997FB24EC08DB73@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b104b2-bae9-4957-7dd4-08db82f522b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 16:29:16.3909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ItlKidoLZC5EdK9AP4UWv38prOcAVqGLlmTaNh/fLOZGDsAMMGTxlEO2H4XsfSsytkoIgFuJn2Q0050cA7Cdm/ZXv7/1teJagOkahaK87lY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3436
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA3LzIwMjMgw6AgMTY6MjMsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIFR1ZSwgSnVsIDExLCAyMDIzIGF0IDA2OjA4OjI2UE0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBUaGlzIHNlcmllcyBhZGRzIFVBQ0NFU1MgdmFsaWRhdGlvbiBmb3IgUFBD
MzIuIEl0IGluY2x1ZGVzDQo+PiBhIGRvemVuIG9mIGNoYW5nZXMgdG8gb2JqdG9vbCBjb3JlLg0K
Pj4NCj4+IEl0IGFwcGxpZXMgb24gdG9wIG9mIHNlcmllcyAiQ2xlYW51cC9PcHRpbWlzZSBLVUFQ
ICh2MykiDQo+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMt
ZGV2L2xpc3QvP3Nlcmllcz0zNjMzNjgmc3RhdGU9Kg0KPiANCj4gVGhhdCBjb250YWluczoNCj4g
DQo+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgdWFjY2Vzc19iZWdpbl8zMnModW5zaWdu
ZWQgbG9uZyBhZGRyKQ0KPiArew0KPiArCXVuc2lnbmVkIGxvbmcgdG1wOw0KPiArDQo+ICsJYXNt
IHZvbGF0aWxlKEFTTV9NTVVfRlRSX0lGU0VUKA0KPiArCQkibWZzcmluICUwLCAlMTsiDQo+ICsJ
CSJybHdpbm0gJTAsICUwLCAwLCAlMjsiDQo+ICsJCSJtdHNyaW4gJTAsICUxOyINCj4gKwkJImlz
eW5jIiwgIiIsICUzKQ0KPiArCQk6ICI9JnIiKHRtcCkNCj4gKwkJOiAiciIoYWRkciksICJpIih+
U1JfS1MpLCAiaSIoTU1VX0ZUUl9LVUFQKQ0KPiArCQk6ICJtZW1vcnkiKTsNCj4gK30NCj4gKw0K
PiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIHVhY2Nlc3NfZW5kXzMycyh1bnNpZ25lZCBs
b25nIGFkZHIpDQo+ICt7DQo+ICsJdW5zaWduZWQgbG9uZyB0bXA7DQo+ICsNCj4gKwlhc20gdm9s
YXRpbGUoQVNNX01NVV9GVFJfSUZTRVQoDQo+ICsJCSJtZnNyaW4gJTAsICUxOyINCj4gKwkJIm9y
aXMgJTAsICUwLCAlMjsiDQo+ICsJCSJtdHNyaW4gJTAsICUxOyINCj4gKwkJImlzeW5jIiwgIiIs
ICUzKQ0KPiArCQk6ICI9JnIiKHRtcCkNCj4gKwkJOiAiciIoYWRkciksICJpIihTUl9LUyA+PiAx
NiksICJpIihNTVVfRlRSX0tVQVApDQo+ICsJCTogIm1lbW9yeSIpOw0KPiArfQ0KPiANCj4gQW5k
IEkgYW0gYSBiaXQgcHV6emxlZCBieSB0aGUgaXN5bmMgcGxhY2VtZW50IG9mIHVhY2Nlc3NfZW5k
LCBzaG91bGQNCj4gdGhhdCBub3Qgc3RhcnQgd2l0aCB0aGUgaXN5bmMsIHRvIGVuc3VyZSBjb21w
bGV0aW9uIG9mIHRoZSB1YWNjZXNzDQo+IHJlZ2lvbiBiZWZvcmUgZGlzYWJsaW5nIGl0Pw0KPiAN
Cj4gT3IgaXMgdGhhdCBub3QgdGhlIHB1cnBvc2Ugb2YgdGhlIGlzeW5jPw0KDQpHb29kIHF1ZXN0
aW9uLg0KDQpUaGUgQyBmdW5jdGlvbiBpczoNCg0Kc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lk
IGt1YXBfbG9ja19vbmUodW5zaWduZWQgbG9uZyBhZGRyKQ0Kew0KCW10c3IobWZzcihhZGRyKSB8
IFNSX0tTLCBhZGRyKTsNCglpc3luYygpOwkvKiBDb250ZXh0IHN5bmMgcmVxdWlyZWQgYWZ0ZXIg
bXRzcigpICovDQp9DQoNCnN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBrdWFwX3VubG9ja19v
bmUodW5zaWduZWQgbG9uZyBhZGRyKQ0Kew0KCW10c3IobWZzcihhZGRyKSAmIH5TUl9LUywgYWRk
cik7DQoJaXN5bmMoKTsJLyogQ29udGV4dCBzeW5jIHJlcXVpcmVkIGFmdGVyIG10c3IoKSAqLw0K
fQ0KDQoNClNvIHVhY2Nlc3NfYmVnaW5fMzJzKCkgYW5kIHVhY2Nlc3NfZW5kXzMycygpIGFyZSBi
dWlsdCBmcm9tIHRoYXQuDQoNCkxvb2tpbmcgYXQgdGhlIGhpc3RvcnkgSSBoYXZlIG5ldmVyIHB1
dCBhbiBpc3luYyB1cCBmcm9udCBldmVuIGluIHRoZSANCnZlcnkgZmlyc3QgaW1wbGVtZW50YXRp
b24gYmFjayBpbiAyMDE5IGluIGNvbW1pdCBhNjhjMzFmYzAxZWYgDQooInBvd2VycGMvMzJzOiBJ
bXBsZW1lbnQgS2VybmVsIFVzZXJzcGFjZSBBY2Nlc3MgUHJvdGVjdGlvbiIpDQoNCldlbGwganVz
dCBiZWZvcmUgdGhhdCBjb21taXQgd2UgaGF2ZSBjb21taXQgMzFlZDJiMTNjNDhkICgicG93ZXJw
Yy8zMnM6IA0KSW1wbGVtZW50IEtlcm5lbCBVc2Vyc3BhY2UgRXhlY3V0aW9uIFByZXZlbnRpb24u
Iikgd2hpY2ggZm9yIHN1cmUgDQpkb2Vzbid0IHJlcXVpcmUgdGhlIGlzeW5jIGFjY29yZGluZyB0
byB0aGUgIlByb2dyYW1taW5nIEVudmlyb25tZW50cyANCk1hbnVhbCBmb3IgMzItQml0IEltcGxl
bWVudGF0aW9ucyBvZiB0aGUgUG93ZXJQQ+KEoiBBcmNoaXRlY3R1cmUiLg0KDQpCdXQgZm9yIGRh
dGEgYWNjZXNzIHRoZSBzYW1lIG1hbnVhbCBzYXlzLCBpbiB0aGUgcHJldmlvdXMgdGFibGUsIHRo
YXQgDQppc3luYyBpcyByZXF1aXJlZCBib3RoIGJlZm9yZSBhbmQgYWZ0ZXIgbXRzci4gU28sIGRp
ZCBJIG1pc3Mgc29tZXRoaW5nIA0KYXQgdGhhdCB0aW1lID8gSSBjYW4ndCByZW1lbWJlciBidXQg
Zm9yIHN1cmUgd2UgaGF2ZSBiZWVuIGluIHRoaXMgDQpzaXR1YXRpb24gZnJvbSB0aGUgYmVnaW5p
bmcsIGFuZCBub2JvZHkgaGFzIHJlcG9ydGVkIGFueSBwcm9ibGVtIHdpdGggDQp0aGF0IHlldC4g
U28gbm90IHN1cmUgd2hhdCB0byBkbyBoZXJlLCBhcyBpdCBtYXkgaGF2ZSBhbiBpbXBhY3Qgb24g
DQpwZXJmb3JtYW5jZS4gV2lsbCBoYW5kbGUgaXQgaW4gYSBmb2xsb3d1cCBwYXRjaCBpZiBkZWFt
ZWQgbmVjZXNzYXJ5Lg0KDQo+IA0KPj4gSXQgaXMgYWxtb3N0IG1hdHVyZSwgcGVyZm9ybXMgY29k
ZSBhbmFseXNpcyBmb3IgYWxsIFBQQzMyLg0KPj4NCj4+IEluIHRoaXMgdmVyc2lvbiBvYmp0b29s
IHN3aXRjaCB0YWJsZSBsb29rdXAgaGFzIGJlZW4gZW5oYW5jZWQgdG8NCj4+IGhhbmRsZSBuZXN0
ZWQgc3dpdGNoIHRhYmxlcy4NCj4+DQo+PiBNb3N0IG9iamVjdCBmaWxlcyBhcmUgY29ycmVjdGx5
IGRlY29kZWQsIG9ubHkgYSBmZXcNCj4+ICd1bnJlYWNoYWJsZSBpbnN0cnVjdGlvbicgd2Fybmlu
Z3MgcmVtYWluIGR1ZSB0byBtb3JlIGNvbXBsZXgNCj4+IGZvbmN0aW9ucyB3aGljaCBpbmNsdWRl
IGJhY2sgYW5kIGZvcnRoIGp1bXBzIG9yIGJyYW5jaGVzLg0KPj4NCj4+IEl0IGFsbG93ZWQgdG8g
ZGV0ZWN0IHNvbWUgVUFDQ0VTUyBtZXNzIGluIGEgZmV3IGZpbGVzLiBUaGV5J3ZlIGJlZW4NCj4+
IGZpeGVkIHRocm91Z2ggb3RoZXIgcGF0Y2hlcy4NCj4+DQo+PiBDaGFuZ2VzIGluIHY0Og0KPj4g
LSBTcGxpdCBzZXJpZXMgaW4gdHdvIHBhcnRzLCB0aGUgcG93ZXJwYyB1YWNjZXNzIHJld29yayBp
cyBzdWJtaXR0ZWQNCj4+IHNlcGFyYXRlbHksIHNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMu
b3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2xpc3QvP3Nlcmllcz0zNjMzNjgmc3RhdGU9Kg0KPj4g
LSBTdXBwb3J0IG9mIFVBQ0NFU1Mgb24gYWxsIFBQQzMyIGluY2x1ZGluZyBib29rM3MvMzIgd2hp
Y2ggd2FzIG1pc3NpbmcgaW4gdjMuDQo+PiAtIE1vcmUgZWxhYm9yYXRlZCBzd2l0Y2ggdGFibGVz
IGxvb2t1cC4NCj4+IC0gUGF0Y2hlcyAyLCA3LCA4LCA5LCAxMCwgMTEgYXJlIG5ldw0KPj4gLSBQ
YXRjaCAxMSBpbiBzZXJpZXMgdjMgaXMgbm93IHJlbW92ZWQuDQo+IA0KPiBUaGUgcGF0Y2hlcyBs
b29rIGVtaW5lbnRseSByZWFzb25hYmxlIHRvIG1lOyBKb3NoLCBjb3VsZCB5b3UgcGxlYXNlIGhh
dmUNCj4gYSBsb29rPw0K
