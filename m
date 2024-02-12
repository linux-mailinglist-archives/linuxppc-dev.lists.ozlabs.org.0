Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 596C68514F4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 14:25:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GiNN4glu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYQFT1rzdz3c9N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 00:25:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GiNN4glu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::701; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYQDf48Srz3c1J
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 00:25:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHa/wDWv4aUP0x8Q2JHWO1BMXpwxEcyrQV20zuIxKaD6U+1KPZyuv7vvzfPHI5sdheDlvVmasqCOTY0vPetS5GyB/rOQwjrC3hAhkZm5llUQ4IXI8T0xPf1EYQKZL46x3FgSogLRhJHa1dT4/+e3vCCl1bCqukaWwzwNUDaTzwRwTq5aRgaLuEKOAYneq9stTdI/NjnXUIrUdZbTpJnsrIaXC7W5sCw7U9EkGU1TvznmBEz7ixONTvU2kKUCLvcR2yuPYoIaXfxysFZu4qmi4mSEUF2VByj7GXNXUqXNcIjvT5iyBjuJYUH6Cxjtt7Yu7TpLnGzBNGydIuraaEe8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cVbnJfxQJCfB4dE8nx6nOqHz5MZK2lZvO7uQjTRcRA=;
 b=FPxTNoFHDx8dNXO2EE4MpllLRZg1Tjzo+qT3N+yXUMWRF8kPP/03eTzch9hVpU1rza+NdQzVmiLTrauIX7S4NtzbooIeiRrhn59OC6Ze29z5F0ecAwhZjwl3HCxHdwQ6h67+eESz9dAO7R7J/pOU9/J0XPscY6GozPaFLzw69Bz4dMBDRg4IFWKDEPZFeOrHYww7pkQQRBcpNvlKWGUFM9AwibsUPdsZcQfiXPHLAMaTGarbDgkuv1HY2ju727y2+95FQMP3Zrlpfo5T2vAYNKGJlFLcZksbLk9LB7VPvoLQwFxtru8YheAZLA61iQxh25IM8xtVYPv0rCASa8/Qfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cVbnJfxQJCfB4dE8nx6nOqHz5MZK2lZvO7uQjTRcRA=;
 b=GiNN4glutvTx+UlXMDCrGW1uoMHJ7oJRei3crV8cIMSfyBKWSku4WonP6tyS7g6N+JtrEqAObkZTBtHbSwpxV6SXdCtPAgSh+q+Is32ZEcskQJX2c3fNYkcwClUj7lO94PcFFewUI8tmdP/5dDisbu/XtFm/BO8Gj7rrzmkcGpUpGUr+rOc5+wRVRaBNlAvfqXHlmfQ8bKBWmWE/zusfI0eRuywACR5NIyDMVfxhRe5dvttsUG6JRjlQfS9iAsI3mojUJU6JgvMQkhIZfzcuxclbUPh/iKRS44DTELXOGlNtjNW7+wX80zRkqQAjdFg8+dd4vOp67mYZrVtxMGQr7g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1914.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37; Mon, 12 Feb
 2024 13:24:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%6]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 13:24:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: David Engraf <david.engraf@sysgo.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/cputable: Add missing PPC_FEATURE_BOOKE on PPC64
 Book-E
Thread-Topic: [PATCH] powerpc/cputable: Add missing PPC_FEATURE_BOOKE on PPC64
 Book-E
Thread-Index: AQHaWaf0D+iyLsW25UyGApzZ8/Ey1bEGulwA
Date: Mon, 12 Feb 2024 13:24:42 +0000
Message-ID: <5de5628e-89db-4b90-8eb2-2f8189ed9223@csgroup.eu>
References: <20240207092758.1058893-1-david.engraf@sysgo.com>
In-Reply-To: <20240207092758.1058893-1-david.engraf@sysgo.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1914:EE_
x-ms-office365-filtering-correlation-id: e5127972-f8aa-4a10-6044-08dc2bcdf93b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  MR7i3aCf2/16EFMJiN88nFz7+SSBV71Nu9usRNXolM+zlR0lDrhBg8kKNgqV7tM1H+sVJlDEiSoTFMvoAkAZYIp6/0aB7cXBbpVAWQhXq1Ih986HZIiyJW+hhSrx7ZJh2FnboUVTmf8OSYQVpAbWTPKpAUp4ITDaDTk70u4zNg6Oix18HZNAT6z7UAQj61J2LOB7CVd7mCnb4nQBE8PP/FPCl3iscbLkFeDMpVRCcArVpSLyMXRx5VphxIm1oAou+eKwXnnH8i6SQMmsJRf1Tg9agV2zYSa5qF8JhIiv6g2WMlUVFa5QFl28rpTzqJLQ+l/DXVpA3BbEyfFjUEor3p3s6rwQaiHLo+ME9ep4tcIcgzJenxqsCuSAWitTxyg79m+3hE3kQ4tfjIZJWDYu4nWBaK/uRBl0KzubXS1AMPdOfsT3+9j05O98WhcjIAiNYjJE/oyvnOF+n4ySEn1SXzQRF//nM6Ua/MRBMT7AqnaAyu3mw71GE3zlmGCEwGY2by8fYHW6aRMN4mUDldu7wfoFq6vbjTt8m7qYiqpD6rdLYIud3+5HZ0S9SQ6rNDLUF17Ro6oc2Hj8eGByWHt40uJ1LDxYa4KXz0cuJ9JhTXly2NC5TPuoE+oHYAucCWxP
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(396003)(39850400004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(2906002)(44832011)(2616005)(478600001)(38070700009)(5660300002)(41300700001)(66446008)(64756008)(966005)(71200400001)(6486002)(8936002)(4326008)(76116006)(91956017)(83380400001)(66556008)(66574015)(66476007)(66946007)(26005)(6506007)(36756003)(8676002)(122000001)(6512007)(110136005)(54906003)(316002)(38100700002)(31696002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?K21lak80YzdWTlRNUlJHZ09zVGYvY0x0aDF1a1pxaUhaUmp4d3hPSjhJcmln?=
 =?utf-8?B?TWVOTFYraWVKdVozMkJQWDRScWY1a3Evd3JHa0dMaE52K0F0bHdXaktwZFZk?=
 =?utf-8?B?dlV0bmphTWJXQ2JSWVB0NGdsNWtVc1RjRzhQNEI2d1k3TisyR01WRjJNN2d0?=
 =?utf-8?B?ME9od1JnS3FWQTZ1ZWZyeU1nUkpVaHdscHJraFgvSm1uNFhYVUJVU25VRmlW?=
 =?utf-8?B?bDJyNUU3N2dkMDBuQVVZUnNDM21yb3YxWnJ0M3dLY3IyRnNDYzZWU1ovTFR1?=
 =?utf-8?B?Sk1weVRuRlVkdThDTi9uYkNrcFZ1S01FM3VmL0EraWFTanRHN2tSVGlDVDM0?=
 =?utf-8?B?Q2YySjFCTTM0QzNtNGM2WW9yTVlRNWNSeit1RkMvZUN3UE9QMWxsMkRJK205?=
 =?utf-8?B?UW0wY1E2Q3dqbjZxZkhkRXY0ajRrek9sZVJneld4RkFoN0N1T3RjM0lZWnpL?=
 =?utf-8?B?bkFoc0dreWZab0VXam42bGl3RTVWczBCQituN05Nb2FERGtjWGpQOFo2Q1Br?=
 =?utf-8?B?WEFRdnNyQnR3cTFSYTFXbkFJbDVvcURQdjJwYVBPa2o5cUVDRSt6T3oxc1Ur?=
 =?utf-8?B?U0hNcGUyL3Q2eTdPeS9FNW00MlRybUtyWHVxRlN6UFZNU3BBSE03eFdLMkdE?=
 =?utf-8?B?dFYxVy8yRU1iZElHazZ1elBBL2Y4akNCNzNXQTVWUEIrODI5OWNmNE1QcGYz?=
 =?utf-8?B?Sk92L2NSZXY4b3ZrUC9SM3hJanJVVlpGNW5CQ0JsK00yRzBVQXozQWRQVWpE?=
 =?utf-8?B?Y3Y2OVkzVklTck1SZHF4SzJ0aFFGTTh3a1R5QzI3Yk4yZmRvVkZ0RTFLaVUy?=
 =?utf-8?B?dHhlNTFOMVkvYWhkdk5CRWcybmlYMlRJQ2NwWVVNTC9VQjkzdVRoeC91TjNo?=
 =?utf-8?B?S2hTbmtYRS9jeDJSTVF4Z2QyK1JaWjd1NmczK0FtdFMrTW4xQVErSEx4MWlJ?=
 =?utf-8?B?TkIvNEFtQlpjSndMNG55MnJPMFc4ZzNpcHJpdDdpb0ZjU0lqUThRaEtBVHlr?=
 =?utf-8?B?TkVYM3VDbXFGdW85bk1vSWZCMjRwYWN2VkFzYWlPMGExNy9wM2xHNzBNNkIv?=
 =?utf-8?B?VUpHekFKQ3FBSE1hZHNrL2xZcG9CVUZrbTQvUGpobjFqWUZuK2hwTnlNaisz?=
 =?utf-8?B?Zm44MUFCYVl5VGtmQzNCSWtyRHBpQnF2NVFoemRSVjhPRlFja3J5QXpYb2N2?=
 =?utf-8?B?bTRMUjV2NFdDelU5b1FvY1BuZ3dacmY1UXJ0eFJ4RkN0YTNpYzBpSFFtK2pi?=
 =?utf-8?B?RXAxMDM1dW82Vno1UUh1T1l1TTRLOGxseWlsaW05R1lCd2RCWE95dWxieGJK?=
 =?utf-8?B?a281SWNiUElnakRHZXlkSlVKYnBjaXEyWUlpWlpseklZTzUyN3hmZHpMbWJZ?=
 =?utf-8?B?R1JtYXYwTUppSUNGNFBjYUExa3gydjJjM3hySm5QYjZYRnRicXFPdldTMEFC?=
 =?utf-8?B?WmhSQUVSLzhtVEEyWTdMZDllNUxNeWROZXF1ckZibGp2UGNaWENaSnRsWXJL?=
 =?utf-8?B?VUJWRjFBVWpza2lrZ0NZYjdBZTlZSXc5cER0MStseVJmMlErL2liVDExMXNZ?=
 =?utf-8?B?VFgzYVFUamN3R3g0TVJzZHljZXk1Qk9XYktkckJId1JzcStLdHBMY1I4Wmxz?=
 =?utf-8?B?dzZ5amdCZk5lMEowSGRuWHZocjE2QXdsc2MvSzFEVzV4TU9VSS9vM3k4NzJa?=
 =?utf-8?B?ZVBJSWxoVUNwWVpYeEtFd29wTnNKM1o3bDdFZjFKaFNxSEN3WkZDRWt2NUJz?=
 =?utf-8?B?VDdRb01oQmVYMUtoeTExYzZ6TVB4dGlZUjVnRjZ0WFA1dzVBWExvcTRrNnhS?=
 =?utf-8?B?QTZnRUlJcE4reHlrMStPeG9jenBOekFmempVUTFvaEo3TmdvZVVTMWhZdFds?=
 =?utf-8?B?Z2I5TVVRNWZlRTJXTXBiR25QYWI5MytDc3hZRlJMcjk5QVlXY3VxVFlWRC9J?=
 =?utf-8?B?WDlEZDRLQUh3WklRMkJHYVRJNWNDdE1EelNoNU9KRksvT01sTWxRTmh3T3R5?=
 =?utf-8?B?djd5c2lxYzlTQmxPZmRvR051bHp4VVhWemUxdkd5cE5kanRlMzloT2xhdjhw?=
 =?utf-8?B?bEgxMDBHcFVsQkR2anlKKzdrN1k4WG95NVF2dC9XbCtuNjczWVplRFFnQXJk?=
 =?utf-8?Q?qhMA7oYUZwgAIvWrwEDa3P1x3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60FBCC971DDF1F4996F1A90D754ACAFB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e5127972-f8aa-4a10-6044-08dc2bcdf93b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 13:24:42.9288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3eH16Ys9Bi397zTOJWwstEV9BUi+aG5WyOIvaD3In00GoDNBXZ2S2Q/sDL3uZblm7sF4qXI+JnVKnIZC2RE5E1ywXUyG273HuHQk5mtv+Dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1914
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzAyLzIwMjQgw6AgMTA6MjcsIERhdmlkIEVuZ3JhZiBhIMOpY3JpdMKgOg0KPiBb
Vm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSBkYXZpZC5lbmdyYWZA
c3lzZ28uY29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCDDoCBodHRw
czovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gQ29tbWl0
IGUzMjBhNzZkYjRiMCAoInBvd2VycGMvY3B1dGFibGU6IFNwbGl0IGNwdV9zcGVjc1tdIG91dCBv
ZiBjcHV0YWJsZS5oIikNCj4gbW92ZWQgdGhlIGNwdV9zcGVjcyB0byBzZXBhcmF0ZSBoZWFkZXIg
ZmlsZXMuIFByZXZpb3VzbHkgUFBDX0ZFQVRVUkVfQk9PS0UNCj4gd2FzIGVuYWJsZWQgYnkgQ09O
RklHX1BQQ19CT09LM0VfNjQuIFRoZSBkZWZpbml0aW9uIGluIGNwdV9zcGVjc19lNTAwbWMuaA0K
PiBmb3IgUFBDNjQgbm8gbG9uZ2VyIGVuYWJsZXMgUFBDX0ZFQVRVUkVfQk9PS0UuDQo+IA0KPiBU
aGlzIGJyZWFrcyB1c2VyIHNwYWNlIHJlYWRpbmcgdGhlIEVMRiBod2NhcHMgYW5kIGV4cGVjdCBQ
UENfRkVBVFVSRV9CT09LRS4NCj4gRGVidWdnaW5nIGFuIGFwcGxpY2F0aW9uIHdpdGggZ2RiIGlz
IG5vIGxvbmdlciB3b3JraW5nIG9uIGU1NTAwL2U2NTAwDQo+IGJlY2F1c2UgdGhlIDY0LWJpdCBk
ZXRlY3Rpb24gcmVsaWVzIG9uIFBQQ19GRUFUVVJFX0JPT0tFIGZvciBCb29rLUUuDQo+IA0KPiBG
aXhlczogZTMyMGE3NmRiNGIwICgicG93ZXJwYy9jcHV0YWJsZTogU3BsaXQgY3B1X3NwZWNzW10g
b3V0IG9mIGNwdXRhYmxlLmgiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBFbmdyYWYgPGRhdmlk
LmVuZ3JhZkBzeXNnby5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJp
c3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5l
bC9jcHVfc3BlY3NfZTUwMG1jLmggfCAzICsrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
a2VybmVsL2NwdV9zcGVjc19lNTAwbWMuaCBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvY3B1X3NwZWNz
X2U1MDBtYy5oDQo+IGluZGV4IGNlYjA2YjEwOWY4MzEuLjJhZThlOWE3YjQ2MWMgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvY3B1X3NwZWNzX2U1MDBtYy5oDQo+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvY3B1X3NwZWNzX2U1MDBtYy5oDQo+IEBAIC04LDcgKzgsOCBAQA0K
PiANCj4gICAjaWZkZWYgQ09ORklHX1BQQzY0DQo+ICAgI2RlZmluZSBDT01NT05fVVNFUl9CT09L
RSAgICAgIChQUENfRkVBVFVSRV8zMiB8IFBQQ19GRUFUVVJFX0hBU19NTVUgfCBcDQo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBQQ19GRUFUVVJFX0hBU19GUFUgfCBQUENfRkVB
VFVSRV82NCkNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUFBDX0ZFQVRVUkVf
SEFTX0ZQVSB8IFBQQ19GRUFUVVJFXzY0IHwgXA0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBQUENfRkVBVFVSRV9CT09LRSkNCj4gICAjZWxzZQ0KPiAgICNkZWZpbmUgQ09NTU9O
X1VTRVJfQk9PS0UgICAgICAoUFBDX0ZFQVRVUkVfMzIgfCBQUENfRkVBVFVSRV9IQVNfTU1VIHwg
XA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUFBDX0ZFQVRVUkVfQk9PS0Up
DQo+IC0tDQo+IDIuNDAuMQ0KPiANCg==
