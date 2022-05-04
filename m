Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4EF51A661
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 18:51:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtjXj2xVKz3bpJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 02:51:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62c;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtjXD1k7sz3bd7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 02:51:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmpFzxxSukIJokPPVoC9Tw16EU2Tt6d6PjkrUBCmy4KNcoLd1c7EifbKUhLoDPnlSomYMDJ1z+bdmXwLUwnDgPPO2jOl0OrSPT01fmLes/tpmWkUSJzVodIx5r8xtdGCorimG81LvWiIxOJ+Z2O/jo+GP0Bdo46PPNcVsiAFsZKsCtU8F6Uf0NNe278OTzkpPOYHTSXmNaHlACQfZhFCT4UL0DovkrWbQjAzhCVo/AF6tAbuntoXOtAiwAVGCZHzlprYt1+QwJ7wDd3Z5eScNo5omDT3Fbe2vX4iN58W7bTXCZd5pUZz8DE7r46Vu5RPKbnzhNa26yrw1Om6/lwfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqsItLf2UGXNAt+zbDiQ1pydRaEXphath5C8M9dPBm8=;
 b=aEVyVBi9jwe1q4RdqXnIOOoUdmslvcPtxBzxsz32CPrjYm/jj+6FCX6rm9ITmIRbcou9BSLoSTzBfbFgZVF0rwCCtmZ5uwzhw8vzQ5xlXjhVl5kDnC01EnAYTcCLdSQ2CXSa+9GODQjclJTO9G0wGUZTvG9RFcB7HCRRIe9XTi/vdCDzIatSdlalbIK5cda+XtaPGaR5U/rmosAuryjMsae30TYVINokeU/m/laKQ+Qt9IymjRq0wyELlG14T422qzBlt6QbRQY4v4IoMVD29BH6nupkQhQg4o/ygNumjVhp+1Mw+26Xx/+h+cPHwmRGdMYfNjXiaPdD6sPMOpONIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3147.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:30::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 16:50:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 16:50:58 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/2] recordmcount: Handle sections with no non-weak symbols
Thread-Topic: [PATCH 2/2] recordmcount: Handle sections with no non-weak
 symbols
Thread-Index: AQHYWhpl5ryAcxR0pEGOg1yZCKWDp60DyFuAgAErRACAAGpbAIAGVDIAgACZFoCAAMAVAIAAVUeAgAGZa4A=
Date: Wed, 4 May 2022 16:50:58 +0000
Message-ID: <72d17597-874c-f3a3-9398-0cc944350c5b@csgroup.eu>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220427095415.594e5120@gandalf.local.home>
 <1651129169.fpixr00hgx.naveen@linux.ibm.com>
 <20220428100602.7b215e52@gandalf.local.home>
 <819939e3-285b-2a65-9c4c-85640d2a3a02@csgroup.eu>
 <20220502195251.5d862365@rorschach.local.home>
 <6d5ff91a-560e-56ea-0047-175f712872c2@csgroup.eu>
 <20220503122533.6033647e@rorschach.local.home>
In-Reply-To: <20220503122533.6033647e@rorschach.local.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53648d3d-0fe9-4a0d-9d70-08da2dee43c6
x-ms-traffictypediagnostic: MRZP264MB3147:EE_
x-microsoft-antispam-prvs: <MRZP264MB3147C51992647685EB557318EDC39@MRZP264MB3147.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zv8mb9cfaYsqLKbYO9aErlEez5sG6TtU2xaVHDh9buL1WO0EtAUlwBEQVh1jgMtSaJYLR5KAI/H7CylTC65SC7MbuhiCW/q1dmb/QEoAsq67bL5eV8ZbDErXJSb1uQjoeo2RKWyODMDUdv1+K6E0qZfqZyWpMaN733+wTYVGXrKoHV4650Nkb46rHK4xlxrgxVF9eTn7DmYpbthcpkMtGZGlByKtwCNpFKSdgkrvD59pujG6Fah2W/J/cbhyXt52Mko77gh9ps8a5fbRh5yWfZAcsfoSSfawysGzqXHInLkLB8Ps2c9O3ir8ZJ4ke7OMH7/V3k8nWUxB2uyJSINmZIebwoehmrrDwjg5Fom7UQbhRiPg8TamA9M19SZWGnN9JEHqIaIcK1mQGBJy/iA4k/1UYMCDFy0QVKm6qCKZeqAmR+1whu2Xmcdq6GdCO/mPBGKxbj+I8O9/PWchR0vFZde1ZwVKbPoubXbFojAihDcQud4QjlS72bAeq7eHv14wrG6CaAZMQt84hfAnhBXPcojWXSfk2QnudvP7CutOt83Ay6bMPxTMySRxHi+2MxS8PHJzO3eaGgDLtPftF2BsUcIlgFby5UCy06pIopK/0+jfGOuQuDZrTZoxsaSwlS2kSfKMqYoFCc0D2ze8woj29zDOK2cM+tpeIRLKQL8Xf9ivAgL4JOkHsAjKRPQOngmu5PT7zdvkscIlObrHmT/7thxztETS3+6aljYn9bX42GaFMoyvtMN5hizevFZItD/vR1ttP4dv/Jy3auOWETRjEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(5660300002)(38070700005)(6486002)(76116006)(4326008)(2616005)(66556008)(66476007)(66446008)(64756008)(8676002)(8936002)(91956017)(66946007)(38100700002)(71200400001)(6512007)(44832011)(26005)(186003)(316002)(6916009)(36756003)(2906002)(6506007)(54906003)(122000001)(31686004)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFNYdEpjSFhEN3pROHhKUDdka053QUpybDhQWVBHWHcvb2pLQkxYVWxWZUVh?=
 =?utf-8?B?TEJmQmgxWjBEdXFCT2RNNjlqV2duc0hybEliNmhRQmRsTmhTcDZOVkJmdTRu?=
 =?utf-8?B?Uk9xdG85aUFpWDZQckhBSVpMNXFESElBa1g0QzFwVnVjSFVXTmM4eWt2Znk5?=
 =?utf-8?B?c2o2T3ltRm9QRk84OEFmUEREaGpWQWFpb3U2d0RkV2JYT3Y2czdkV0s1RXR6?=
 =?utf-8?B?d1Y3aWtEUXdKSlN6TXFHWHFuSzFJUVZSR0E2VFhQaHRwci92Y2o1bWlBeCs2?=
 =?utf-8?B?dWIvYVpEQWRBNzRlWFNjSzgwcmxSbUZjelVUMEtZa0QySm96NUovRjRob25i?=
 =?utf-8?B?RCt4bUlQVkQ3citwL3V2NHBhY1hDRzBUbVZySENHdkJtRXZXbm9TUnkwVmVh?=
 =?utf-8?B?UDNBQmQvK1hXRGt0S0trMUkyeXhKa093S3FuUjk4NXZPUlhhbkRZdDQyZS9O?=
 =?utf-8?B?Qk83aENublFiaXdlSWtpeUE1N2dFT1k0Nlh5NEFwb3JrbFpqZC9MMVBHWW1h?=
 =?utf-8?B?R1paWUZLRDgvRVk2SDhlbU5lS3RNTGhzRUdmM3RiVXJnc2daU0VBWGhCTTNj?=
 =?utf-8?B?c2xyTXFncmRnSHJQNmVSN20zOTMwTkIxOWZKZkVDUHF3czM0VDA3d3VrWDNy?=
 =?utf-8?B?WFgzU2NPQkFzeXhBQ3hYMjY4UGJJN2pQNkxUQVlIRU5sOU91ZVh0bmtmcFkv?=
 =?utf-8?B?TGk1YjRSNnB6NHhPNFlaVHJCQ3VGaEVBNUVvOE9GcXhOUUtrL1lINHpKaVRL?=
 =?utf-8?B?Y2xuTkt3WjJGbG5IZnUwTDBlUjdmZUV0cHVGcVQ3VGE1bTdHMFNmMFB2TERs?=
 =?utf-8?B?bS9YS3FoVlRJT0U4T2xBRmVQdlVWdVBraUVSZ2xneFpDL1JwTzByeFRGVjZa?=
 =?utf-8?B?OUprY1JRa0cvd1FOZE5xWW5vK2JRUVB2RGF4Z0k1dXRCWkZjcUpBRVcyQkRa?=
 =?utf-8?B?MzhvbXpoR1A2TTBDeTZMaEI2bkhPdUx5Z2hGbXRkMUQ0bkJWeHJHeVBwWjFQ?=
 =?utf-8?B?b084YnpFdVJqdWlURlRrU2pNMUVhN1dVc2pJVnFKSnptN28zQmhqUVgzL29i?=
 =?utf-8?B?OXQ4Y3dXdDJ3Tzl3ZGlBTGxmN2E5WXhjKzE1L1NicGN0T2tvVll5cjNtOXU4?=
 =?utf-8?B?dm80NFZNSW9QRVVHdkFEcUpNZ3laOHZRZis4T2JzNC81OGJJcDZNem4xUzdr?=
 =?utf-8?B?UXBHaFVYcE4yZVB3YTY5MVEwbUtzY00wVENRbFh0TFMybkpRVk1Mc0x0RnJm?=
 =?utf-8?B?ZXg4WXVJWWhTQ25pQlNPenBnMnZ1ZC9sTWwxYldmalUvUnh5dFRRMlgrYlJy?=
 =?utf-8?B?bDNkeU9XWldSUlhPOG5tMHhTWTd5Nis3Y1g3RjJqQXpyMzBPQVMrVW1nSlNi?=
 =?utf-8?B?YTM0dzdwVDlKUE50bS9hNVlkRm85bjFldy9CN2xZdC9mMk1BSnVKTGhiVzR6?=
 =?utf-8?B?NzZKUW91c25YbjFoeE9mMHpjUGNxL2tERFVqdG0wT3VvbmNpT2g2YkpKclgr?=
 =?utf-8?B?R3ZiMHZnY2RkcXA0VXFpTGpHakhOcnRkeHpnNnNXaXJENGJuWVp5dzJMNUhj?=
 =?utf-8?B?eFV4dGpWb09XUzNMdzFiTjE1RUNqcUEvK3RjQ3h3TGpLYWZoVVhTK3lWNkhF?=
 =?utf-8?B?ZTVoc3FSRDVqTm9HcVZGV2l3VU4zclhPNE5xZGFCRGYrbjdiOW9nQ3IyZG8w?=
 =?utf-8?B?Sys0Snc1MEdNek1NVWV1OW5GSW1ZSFMvUCtFN0hIUzh6REgwdnl6ejN4TDU4?=
 =?utf-8?B?d21mcFhEMXM5SmVnTWNaU2hVRWlxK2l3TW42LzJCeWc0M3RKcXdsMGlaWWFR?=
 =?utf-8?B?U3l1RkR4bWdEYUhmTksyUEw5TUk0aUxtbG5Ud2NYSVZYTVNhTXUzdUpjMGxn?=
 =?utf-8?B?WUhyeisycndMbEc1Qk5zQ0dkcFFYQkY0V2ZOSXhFVWZXb084ckhUWm1vb0V6?=
 =?utf-8?B?UmlYaTBzWlJCRTcvRkpxc0JVK1dvODJWYm9iS0pxNWpFRlBHU0x5WStzVFVq?=
 =?utf-8?B?YkFrTVhGSlRxM3NUa25xUVY3cFM0OGpGeFhxNGdkMkNlZkpEZTZOTWVmalMz?=
 =?utf-8?B?d0NWb3ltazVNNmhYMGZXUXpSVVlNN1hDWkpsZkNKbmlwajlJZmNKRlcvaWFM?=
 =?utf-8?B?cUEwY1VaMllQMkJlRWNUaDFEOHFjR0dCUm51TlE1Q2drTHBJSEU2Y1duU3F0?=
 =?utf-8?B?ZkxDVVBnTzBWZ0NIaGNtQnMzYVFnVkgxK2k4bDcvdndVQzkzdkVGR2N0eEpr?=
 =?utf-8?B?Q2NuY1h2TlVhSUFDZlRMNStMRzZlSjVVWG1MOFFTTnVJYXhFODZvNG9DWHFq?=
 =?utf-8?B?NUVaSFpnNkZCc2Irck9ZbnZzL2NqZUp2dFlxaElLZmlSSkpTZTJkbnhCMVpB?=
 =?utf-8?Q?aBgUZG7FUG7QLYSx+rsJU09KEv3rIyNCo0DsZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF6A112247AB7E48966DB6E402594230@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 53648d3d-0fe9-4a0d-9d70-08da2dee43c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 16:50:58.8278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RmNaxDTk2PttfMoXcWWlYwlSnxUnFFQLoJO52a5kNLwXEavdUVd6cjFpCvCEhJ8vf0v+Ea55R8ywUYcuHTDyEtBic8F7zrEa8rcvaZs2NfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3147
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA1LzIwMjIgw6AgMTg6MjUsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIFR1ZSwgMyBNYXkgMjAyMiAxMToyMDoyMiArMDAwMA0KPiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPiANCj4+IE1heWJlIEkgbWlzdW5k
ZXJzdG9vZC4gV2hlbiB5b3Ugc2F5ICdhZnRlciBsaW5raW5nJywgZG8geW91IG1lYW4gdm1saW51
eA0KPj4gb3Igdm1saW51eC5vID8NCj4gDQo+IFdoaWNoZXZlciA7LSkNCj4gDQo+Pg0KPj4gSW4g
dm1saW51eCwgdGhlIGFkZHJlc3NlcyB0byBiZSBzYXZlZCBpbiBfX21jb3VudF9sb2MgdGFibGUg
bWlnaHQgbm90DQo+PiBjb250YWluIGFueW1vcmUgYSBjYWxsIHRvIF9tY291bnQgYnV0IGEgY2Fs
bCB0byBhIHRyYW1wb2xpbmUgdGhhdCBqdW1wcw0KPj4gdG8gX21jb3VudCwgaW4gY2FzZSBfbWNv
dW50IGlzIHRvbyBmYXIgZnJvbSB0aGUgc2FpZCBsb2NhdGlvbiBhdCBsaW5rDQo+PiB0aW1lLiBU
aGF0J3Mgd2hhdCBJIG1lYW50Lg0KPiANCj4gQnV0IGhvdyBpcyB0aGF0IGRpZmZlcmVudCB0aGFu
IHdoYXQgaXMgZG9uZSB0b2RheT8gQW5kIGF0IGxpbmtpbmcsDQo+IGV2ZXJ5dGhpbmcgc3RpbGwg
Y2FsbHMgbWNvdW50LiBJdCdzIG5vdCB1bnRpbCBydW50aW1lIHRoaW5ncyBjaGFuZ2UuDQoNCkV2
ZXJ5dGhpbmcgY2FsbCBfbWNvdW50IGJ1dCBub3QgZGlyZWN0bHkuDQoNCkluIHZtbGludXgsIHJl
bG9jYXRpb25zIGFyZSByZXNvbHZlZCwgdHJhbXBvbGluZXMgYXJlIGluc3RhbGxlZCBmb3IgDQp1
bnJlYWNoYWJsZSBkZXN0aW5hdGlvbnMgYW5kIHlvdSBkb24ndCBhbnltb3JlIGhhdmUgYSBzZWN0
aW9uIHdpdGggYWxsIA0KdGhlIHJlbG9jYXRpb25zIHRvIG1jb3VudC4gSXQgbWVhbnMgJ3JlY29y
ZG1jb3VudCcgb3Igd2hhdGV2ZXIgdG9vbCB3ZSANCnVzZSB3aWxsIGhhdmUgdG8gcmVhZCB0aGUg
Y29kZSB0byBmaW5kIGFsbCBkaXJlY3QgY2FsbHMgdG8gbWNvdW50LCB0aGVuIA0KZmluZCBhbGwg
dHJhbXBvbGluZXMgdG8gbWNvdW50IHRoZW4gZmluZCBhbGwgY2FsbHMgdG8gdGhvc2UgdHJhbXBv
bGluZXMuDQoNClNlZSBiZWxvdyBzb21lIGNvZGUgZXh0cmFjdGVkIGZyb20gdm1saW51eCBvbiBh
IGFsbHllc2NvbmZpZyBwb3dlcnBjNjRsZSANCmJ1aWxkOg0KDQpjMDAwMDAwMDAwMDEyMzAwIDxf
X3RyYWNlaXRlcl9pbml0Y2FsbF9sZXZlbD46DQpjMDAwMDAwMDAwMDEyMzAwOiAgICAgICA0YyAx
YSA0YyAzYyAgICAgYWRkaXMgICByMixyMTIsNjczMg0KYzAwMDAwMDAwMDAxMjMwNDogICAgICAg
MDAgYmUgNDIgMzggICAgIGFkZGkgICAgcjIscjIsLTE2ODk2DQpjMDAwMDAwMDAwMDEyMzA4OiAg
ICAgICBhNiAwMiAwOCA3YyAgICAgbWZsciAgICByMA0KYzAwMDAwMDAwMDAxMjMwYzogICAgICAg
NGQgNjAgMGQgNDggICAgIGJsICAgICAgYzAwMDAwMDAwMDBlODM1OCA8X21jb3VudD4NCmMwMDAw
MDAwMDAwMTIzMTA6ICAgICAgIGE2IDAyIDA4IDdjICAgICBtZmxyICAgIHIwDQouLi4NCmMwMDAw
MDAwMDIwZTg3NDAgPGdldF9jdXJfcGF0aD46DQpjMDAwMDAwMDAyMGU4NzQwOiAgICAgICAzZSAx
OCA0YyAzYyAgICAgYWRkaXMgICByMixyMTIsNjIwNg0KYzAwMDAwMDAwMjBlODc0NDogICAgICAg
YzAgNTkgNDIgMzggICAgIGFkZGkgICAgcjIscjIsMjI5NzYNCmMwMDAwMDAwMDIwZTg3NDg6ICAg
ICAgIGE2IDAyIDA4IDdjICAgICBtZmxyICAgIHIwDQpjMDAwMDAwMDAyMGU4NzRjOiAgICAgICBj
NSBmZiA3YyA0OCAgICAgYmwgICAgICBjMDAwMDAwMDAyOGI4NzEwIA0KPDAwMDNhZjJiLnBsdF9i
cmFuY2guX21jb3VudD4NCmMwMDAwMDAwMDIwZTg3NTA6ICAgICAgIGE2IDAyIDA4IDdjICAgICBt
ZmxyICAgIHIwDQouLi4NCmMwMDAwMDAwMDI4Yjg3MTAgPDAwMDNhZjJiLnBsdF9icmFuY2guX21j
b3VudD46DQpjMDAwMDAwMDAyOGI4NzEwOiAgICAgICBmZiBmZiA4MiAzZCAgICAgYWRkaXMgICBy
MTIscjIsLTENCmMwMDAwMDAwMDI4Yjg3MTQ6ICAgICAgIDk4IDhlIDhjIGU5ICAgICBsZCAgICAg
IHIxMiwtMjkwMzIocjEyKQ0KYzAwMDAwMDAwMjhiODcxODogICAgICAgYTYgMDMgODkgN2QgICAg
IG10Y3RyICAgcjEyDQpjMDAwMDAwMDAyOGI4NzFjOiAgICAgICAyMCAwNCA4MCA0ZSAgICAgYmN0
cg0KLi4uDQpjMDAwMDAwMDA0NGJkY2MwIDxoYW5kbGVfbGNkX2lycS5pc3JhLjA+Og0KYzAwMDAw
MDAwNDRiZGNjMDogICAgICAgMDEgMTYgNGMgM2MgICAgIGFkZGlzICAgcjIscjEyLDU2MzMNCmMw
MDAwMDAwMDQ0YmRjYzQ6ICAgICAgIDQwIDA0IDQyIDM4ICAgICBhZGRpICAgIHIyLHIyLDEwODgN
CmMwMDAwMDAwMDQ0YmRjYzg6ICAgICAgIGE2IDAyIDA4IDdjICAgICBtZmxyICAgIHIwDQpjMDAw
MDAwMDA0NGJkY2NjOiAgICAgICBmZCAyZCBjMCA0OSAgICAgYmwgICAgICBjMDAwMDAwMDA2MGMw
YWM4IA0KPDAwMGE3NTFmLnBsdF9icmFuY2guX21jb3VudD4NCmMwMDAwMDAwMDQ0YmRjZDA6ICAg
ICAgIGE2IDAyIDA4IDdjICAgICBtZmxyICAgIHIwDQouLi4NCmMwMDAwMDAwMDYwYzBhYzggPDAw
MGE3NTFmLnBsdF9icmFuY2guX21jb3VudD46DQpjMDAwMDAwMDA2MGMwYWM4OiAgICAgICBmZiBm
ZiA4MiAzZCAgICAgYWRkaXMgICByMTIscjIsLTENCmMwMDAwMDAwMDYwYzBhY2M6ICAgICAgIDk4
IDhlIDhjIGU5ICAgICBsZCAgICAgIHIxMiwtMjkwMzIocjEyKQ0KYzAwMDAwMDAwNjBjMGFkMDog
ICAgICAgYTYgMDMgODkgN2QgICAgIG10Y3RyICAgcjEyDQpjMDAwMDAwMDA2MGMwYWQ0OiAgICAg
ICAyMCAwNCA4MCA0ZSAgICAgYmN0cg0KLi4uDQoNCg0KQ2hyaXN0b3BoZQ==
