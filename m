Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B7F700B30
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 17:17:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHsnK1Nxnz3fY1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 May 2023 01:17:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=2sj44ha4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::621; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=2sj44ha4;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHsmQ5NlZz3bjW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 May 2023 01:16:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDx5uXlEm+DO88T/72XTb77eGxkBtXp0ItnrCSlT96MBhID0n7Hpb4zVl1JSclabsxDkA6fWzxwxwBBXFdmMmXni3cR5mOfgmSjSd+AhZ0KbtVU8aepF3yk2xg2ekZ/DUsGjp4VJX0Dr6s30rkJVgbL1ISPK6CB1eItrZDocw74NubiD4ApmANpTb+hpi5bTuYgpkLf87c20gx9Y+4WKqixBcDOxRx9xYESEZm3p++9jt8j6Qx3VaZ3UW/q/hGEAwaKrSX+XdJ5vOecl2SGz7x07xKarrB9R/AGhCeCCigViV2Rj4eJLtjDTMjFTGoBn92P1yM/AnepJ3ErGxP8rAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n72ggp03fr2etdSF0x5oJqAY3uPdBYdAr0XVqtVWobA=;
 b=LuApAWrA/7vmIdkm02n+Y6VoyVZ+Kx14sk0m7FDdwjtTjSeY0Zj2SwTuwXWq8HveEELHkiu5L9wiYQBeGLICf+h8oPu5Jx+GiBcsd7GrSgskUS6VjjQV9g8upvzu9ed3wpOuHU7IY3eR8IT8RrShHHMNAmYKH/O+jyP5paRoQ4/dO/fO4xOo1zbQ13aAH6enKbuPtLvIZlLUP6AGze+orZF4nYBFHK2mal/MfxfR7LURA6FqGhyzWmhcFzdgaJi6+FAYFEeRI2JSwTn5c7OPENPA/S1eV0s4/sNB/r447f7Yk8Ay2l6vsbk9i0uo9MGGGXS8XLAzPP6EYPGVk9HzzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n72ggp03fr2etdSF0x5oJqAY3uPdBYdAr0XVqtVWobA=;
 b=2sj44ha4mcZloX126ctGnE+I0AG4J9rgP0K1pecrRnlx+Vxi1Ap69gPnrj4plq03KWt6+EM9+MORl9gpufQJ65YLovJvZ6qHm6kbik8WWMS1eyDEB72fKw8/umSgtfPHHKjPaMbwIo2+PheymJA0Cj/9pOXdNk0+dLDZKVJxqin1wgbgvl7/6McwJhL8XPBwqFf8zcq9zKyRA5CKjW9Rp/Zdl6MKZWXlYMYwFKzaL2U4Jljpya+1Hz90+LkLJS6UKtHo6LFi6oyF/GWAeyO3CT/aMA8oExID+GFdDrJ+3/vZwmJpkvkapw8GXVDGfJqSu2xwkt4DAj3j8cX5Eh2Pdg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3050.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Fri, 12 May
 2023 15:16:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243%3]) with mapi id 15.20.6387.021; Fri, 12 May 2023
 15:16:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?TmljY29sw7IgQmVsbGk=?= <darkbasic@linuxsystems.it>, Bagas
 Sanjaya <bagasdotme@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted to
 read user page (1128) - exploit attempt? (uid: 0)
Thread-Topic: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted to
 read user page (1128) - exploit attempt? (uid: 0)
Thread-Index: AQHZhOSo80XglPW4fEGWQFVvMWcR5g==
Date: Fri, 12 May 2023 15:16:00 +0000
Message-ID: <3383ba6e-e62b-cd9b-8a61-39b0de8af579@csgroup.eu>
References: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
 <3e5548e4-5a3e-9346-ec58-3617e1947186@gmail.com>
 <a50537d1f1af34104793218acb954a61@linuxsystems.it>
In-Reply-To: <a50537d1f1af34104793218acb954a61@linuxsystems.it>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3050:EE_
x-ms-office365-filtering-correlation-id: ecf4b088-5570-4c64-ffe5-08db52fbcb73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  OzzV0ntwNZsKovRB5DA5hg9VVCEkNwZiLPAMy966wSUcu+1KKY/OZp+lRi6xpks9VI5w7Gp536fHvcy66NDlVaJNtsW/cYDnMqWiNM5XwqshCWSCznIO9+DadA+bW0ydVibtnTN9gbDqcrcSDN71C5BB+dbP3jQG8LAaTok3AJLUDFxqXkdTCn+Y7KIKi5e3to+dNVNnsQE6ZnD/ETZmO4avgkr20XJzEt9jjGw6sj9SE7C4iE3kVS3Rw52X24oOT5MFAHB5J47CBm0mxBDYNjQdddILPr+7PH2clch4pGLA1tMITDOGdW3ePcBiRRgdV2A/lTrNQdLXd6D66xsCKEftx04b0a84pep90hgZmX3POrKi8GtqC79rJUFHZY1gBmtzXyrPYQyHCQy8MyjwxA8FAyQW6i7fXvJkZTA/cid4Y9RR0tJS3AUuWGJ+BMigPZfsrmXlXabAsf9wOzLtbenUTMmGrfaevxKxIt0UT2Ds0YgpJ2ggNj3rA0kJgs21oLwE9IUvvX8WeflcIG2A9ewZtJ/xnuo9GCNI0UucIcZyQUSJE9KKZWRST01wEN3ITkss4b+NDL3R8+VZ4XODlPqHoU3WDC90gqbOhgecdHmOAqCYYhnw4DfHB1+T4WjY
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199021)(86362001)(66574015)(83380400001)(186003)(2616005)(2906002)(38070700005)(36756003)(38100700002)(31696002)(122000001)(316002)(966005)(110136005)(6486002)(8936002)(71200400001)(8676002)(41300700001)(7416002)(44832011)(5660300002)(478600001)(31686004)(54906003)(91956017)(66476007)(66446008)(4326008)(64756008)(76116006)(66556008)(66946007)(6512007)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NE1wVTM1N2dzOVJLT3g4T2hwS29DVVk5UHpRRStpNWNSN0IxeFFOUXRVQ1pK?=
 =?utf-8?B?YUh1aUg4a1dCSFYyeHZRMmZqQXdMbmFoL0pBV0FJWmhGWWxMWU96QXJhcHR4?=
 =?utf-8?B?c0NtZEs5VDVZcVM4OEJ3U3Y0NEJ2bklzYXlISVhmUHJPSnNmZFZ2clphK0V6?=
 =?utf-8?B?K0NjMjFzZU5raFZHOXZ2MmRLQlp1TTgwSWQ3MlhZL3g5VTNyaWEzUFNSOUh2?=
 =?utf-8?B?REhEeGcxNnoybW5jL1N0T090aEo4QVBDeDRBcTR1MDgrbHluYmdBbEl0cDh0?=
 =?utf-8?B?OTl2SDlSMDZmMnlLRDlkOGVTVmxMV0VyRGZTNG9XcVBzdU5sWU9QaUIwOVZk?=
 =?utf-8?B?VzVOQytJZlpabWxNSUVuOWpxcDF2N3pKeFE2T0ZRYTlPa3luVGg5NWFSZ1NN?=
 =?utf-8?B?OS8rREpxUU56Y2pHd3pjZ3Vqd2FmVDJ0Z3lIOTFPdGRmNlloREZsUTkxUEhQ?=
 =?utf-8?B?a0FKQ3UxVWVJK05FdkhQT2J4b2twbHcyQkQrV0ZOdnI0SHVkZzFXMUh1b0RG?=
 =?utf-8?B?N3Y2SnZ2TGtpR2RCUVh3RW1hMEREZDcxaFNBUkZ6N2NIT2pWMi9nNC9EVXlZ?=
 =?utf-8?B?Zk9Pak04czBlRzE5U1hRVGNiaTkxbnNjT0thT2VQeGRqUmxzY0V4cjZWYU0w?=
 =?utf-8?B?K2RuY2U5T2dQNHhmWHhHK2k3cDJaazZERHgrUUF4dks2V0ovY1cxcnJhYWdu?=
 =?utf-8?B?S1V2WmxNeEZ1WHNFOC9CTm1FTVovb3FjNnFCdXh0Vmk2alZyeFJBUGEwR1d4?=
 =?utf-8?B?TjBGem12RnVBTFlzdUxSODBlYys5eS9QVU1RS2RRazBiU2Rld0hPcEdWK05L?=
 =?utf-8?B?ZmNjS1VERnk1OTNxazF1OGxwclFWMWkxQTNNK3hkN2U1UjFnVmtLNEcyRnJE?=
 =?utf-8?B?YW1zb2VoK2tMZjQ5OTI2RVNQOVgvNmZMSEcxK0NwdGFGYklCQ1Jyd0ZlakJs?=
 =?utf-8?B?RDRGaXJiQ21NRFBDaXo1ejNBSmRPbGdmdEVwTVhrYmpvdk9HVjA2SVRoU2dZ?=
 =?utf-8?B?YVBTeGVHTWxocmQvTnMyUlg5Ti9MMDFTaW1XVTdKN0pGNCtHemZ6c0FHRGo5?=
 =?utf-8?B?Wlh1aHhEd0JhN0QwaDJkWlZKYTg3OEM0RUNtcjFhTzc0L24vRXlnWWxxZU9O?=
 =?utf-8?B?TXZtcXNnOHR1YjEyZXVoVXFNL2JEZ1Z0WlZxSFMzU0xvRzFMMFpQUVhncUdl?=
 =?utf-8?B?alFNYk15VXdodXdFL3FpVElZQjYzOWY5VHRXMVpqallGOFBpSHlaeDUzT2dD?=
 =?utf-8?B?K09HODhtZC92RTJOK1lEU1VhVW4vei9aSGdZaHRrekh6Y1h5eGd6TDFLQjMv?=
 =?utf-8?B?L1JKRXBlakRsVnBCaHY3ejJqcjExWnlDczlHN1BnYWxUNWt2TGllc0FPNkph?=
 =?utf-8?B?cXcvT3VpT2laaUdBYlN1NWtubVBNZWs5S3FCRVQ5dDNJRGt5bGhZb0psZ0Va?=
 =?utf-8?B?TmplUkoydGY3VGdHUy9DMTJnMzErTDJHenp0ampia1lqUyttNXZ1VjNMalRZ?=
 =?utf-8?B?cWJEZjRhTFFtUThjOEJtTDh4SFNnM1cxVnpSM0Nqa2lPMENBQzZkUnFUYWUv?=
 =?utf-8?B?dkYzczFGbW90ck9PMGJ0bTBRNmxUZjVGMHpZQnFtcXlxYVpKbzdBdm9sTVBm?=
 =?utf-8?B?aHdrZG9uUkhiZlp1VFFtYzZXbk16MndhbGFYcm5nRFpWWEVlZG9IQWFMYnd6?=
 =?utf-8?B?ZDFia0QxemlLVnI4bHk1c3JVT1NNV2V4Wlk4ZUhLd1hzSHZ5ZmVPUlNENmFh?=
 =?utf-8?B?Tm52MTNUVXQzNVJPc2pKdG04V2IxWWtWUVFKb3RiZXNUdmhVbDJ3ZVkxNUVx?=
 =?utf-8?B?YlVLZk8rMzhPL1o2VDNlbkdrSEVxOVFCWGJJMG05a05DcUMvZVdidy9xZnRv?=
 =?utf-8?B?Z2FsMjg5eEdzdXJua3o2bUZaQnFCaEpSeFg0U0VWMFNIYlU5dzhBOVZJOUpq?=
 =?utf-8?B?MmN0K2ZubklocjBycDBUb3dVS2JsRXB6Tll3bWhRVmx5YmN5aUNKdVhwVHhJ?=
 =?utf-8?B?SVgxcGh5YUpzN3VwQnBuTUhWcXE0azIyVnRjaFRCQ2Z6T0RwTElGUHl0dnpq?=
 =?utf-8?B?QVJKMkorbXFJUncvMXZrZm1YTE95WWR2Y1BDYld0NDVueG5iM1dLeFY1c2Zt?=
 =?utf-8?B?R21mSFhXb1ZmSjZvL1Q2bTZvMjdXRXJUYkRuK083a0paaGRmUEYrWjhyaWhD?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3EBA43A812D9F4FA47AFDD69A400C49@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf4b088-5570-4c64-ffe5-08db52fbcb73
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 15:16:00.6381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVG29OcrJeuV5fqJJcLwrigskaO+9RlB9FLJKwcLl798etNftTfhavOYq1NHx0il+AqQnxj2vWRLf2d+y6tbDoJbIxsSVXkWFtsRaGJf3B8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3050
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
Cc: Linux Regressions <regressions@lists.linux.dev>, Qingqing Zhuo <qingqing.zhuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, Linux AMDGPU <amd-gfx@lists.freedesktop.org>, Fangzhi Zuo <Jerry.Zuo@amd.com>, Hersen Wu <hersenxs.wu@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Linux for PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzA1LzIwMjMgw6AgMTk6MjUsIE5pY2NvbMOyIEJlbGxpIGEgw6ljcml0wqA6DQo+
IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIGRhcmtiYXNpY0Bs
aW51eHN5c3RlbXMuaXQuIA0KPiBEP2NvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50
ID8gDQo+IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+
IA0KPiBJbCAyMDIzLTA1LTEyIDEwOjMyIEJhZ2FzIFNhbmpheWEgaGEgc2NyaXR0bzoNCj4+ICNy
ZWd6Ym90IGludHJvZHVjZWQ6IGY0ZjNiN2RlZGJlODQ5DQo+PiAjcmVnemJvdCBsaW5rOiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8yNTUzDQo+IA0KPiBJ
dCBkb2Vzbid0IGxvb2sgbGlrZSB0aGUgYWZvcmVtZW50aW9uZWQgcGF0Y2ggbWFkZSBpdHMgd2F5
IGludG8gNi4zIHlldDoNCj4gDQo+IG5pa29AdGFsb3MyIH4vZGV2ZWwvbGludXgtc3RhYmxlICQg
Z2l0IGJyYW5jaA0KPiAqIGxpbnV4LTYuMy55DQo+ICDCoCBtYXN0ZXINCj4gbmlrb0B0YWxvczIg
fi9kZXZlbC9saW51eC1zdGFibGUgJCBnaXQgc2hvdyBmNGYzYjdkZWRiZTggfCBwYXRjaCAtcDEN
Cj4gcGF0Y2hpbmcgZmlsZQ0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbV9tc3RfdHlwZXMuYw0KPiBIdW5rICMxIHN1Y2NlZWRlZCBhdCAyMjcgKG9mZnNl
dCAxNSBsaW5lcykuDQo+IEh1bmsgIzIgc3VjY2VlZGVkIGF0IDI2OSB3aXRoIGZ1enogMiAob2Zm
c2V0IDE5IGxpbmVzKS4NCj4gcGF0Y2hpbmcgZmlsZQ0KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuaA0KPiBIdW5rICMxIHN1Y2NlZWRl
ZCBhdCA0OSB3aXRoIGZ1enogMiAob2Zmc2V0IDE1IGxpbmVzKS4NCg0KQXMgZmFyIGFzIEkgY2Fu
IHNlZSB0aGF0IHBhdGNoIGhhcyBubyBGaXhlczogdGFnLCBzbyBpdCB3aWxsIHVubGlrZWx5IGJl
IA0KYXV0b21hdGljYWxseSBtZXJnZWQgaW50byBzdGFibGUuDQoNCkhhcyBhbnlib2R5IHJlcXVl
c3RlZCBncmVnL3Nhc2hhIHRvIGdldCBpdCBpbnRvIDYuMyA/DQoNCkNocmlzdG9waGUNCg==
