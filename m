Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5D951A891
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 19:10:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktjyk0kzHz3c7v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 03:10:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::615;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtjyF48knz3bc9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 03:10:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUMQmdAlYivt5+A38LpL4OBUna7k4eIkgI96Jfc64/IDbuRmZHo26dEG4prb0Z/WRsBEFzPUZXeesRALApqsr+c4jtt2FPkToQQHVcLOrBkREi7KSwimx2S1uCyOEMYj7/zVSKB5WOjBELq4D4LX0nvfgm0tn+3WiFRMeNBQhwbihOHEJVRITwHDv77x4ffJ/s6joH9OivtxGqIkepYdycvdPb1fJX6kneGRI/w9aOiuUldLHH0qY2PSMydmHL4Pl5lXfLWSXV/eXrh3yJqE63GNmtaMEFOMRcbUyHtoR9YfNJ9X6k/04ITtiYISwipHeT07XhRafQTV+c7LtxYOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLUm1lknSmYoMbsd07TgZtlZkrHeUBuM8bb5NOz9V60=;
 b=mj3GW7QnS8+E43BiwEqYm1a2690uLx8d2+Ua3CMuS2QwXPPXqL29UsStjsLpArMOuirxBlD/qgDmHTU+K3cRSuhyecEv0vlhCmDRSOFedRHAV7prLBPzgf0Ix+MaSAS/s6TRAFQxvp7dvpvV6PyJzxnMcybjNHC09pgnm54pjhvnvURPZWFHhIQrgKXwqgi0CBnqdNftg3lnDbStpNbSk3417iQuDrwpWOrPNKFg3BflEJJGVMBXSRZkvjZfR/4+pB0fa5+A8s/uykZ3mSCa6xUV/Y5iEgV1Lbe0yAgYU1qGpE57gsLPhBTax+YMBFt5laesNQc4ZIEMT7+XEDd9Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1951.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 17:10:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 17:10:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/2] recordmcount: Handle sections with no non-weak symbols
Thread-Topic: [PATCH 2/2] recordmcount: Handle sections with no non-weak
 symbols
Thread-Index: AQHYWhpl5ryAcxR0pEGOg1yZCKWDp60DyFuAgAErRACAAGpbAIAGVDIAgACZFoCAAMAVAIAAVUeAgAGZa4CAAARpAIAAAPMA
Date: Wed, 4 May 2022 17:10:07 +0000
Message-ID: <7c235943-4ea0-1f09-bbbb-8f23fbe8bfae@csgroup.eu>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220427095415.594e5120@gandalf.local.home>
 <1651129169.fpixr00hgx.naveen@linux.ibm.com>
 <20220428100602.7b215e52@gandalf.local.home>
 <819939e3-285b-2a65-9c4c-85640d2a3a02@csgroup.eu>
 <20220502195251.5d862365@rorschach.local.home>
 <6d5ff91a-560e-56ea-0047-175f712872c2@csgroup.eu>
 <20220503122533.6033647e@rorschach.local.home>
 <72d17597-874c-f3a3-9398-0cc944350c5b@csgroup.eu>
 <20220504130642.7b9a301d@rorschach.local.home>
In-Reply-To: <20220504130642.7b9a301d@rorschach.local.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a390971-0977-4c65-4936-08da2df0f09e
x-ms-traffictypediagnostic: PR1P264MB1951:EE_
x-microsoft-antispam-prvs: <PR1P264MB1951413744896A73301697D7EDC39@PR1P264MB1951.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3zpTfBxUC0cwlL1XdlcOIFWNwGhk4J2xtCYW7uLMykXM6BBYlGcXAMyQFv7pvLC2ha4oJv/VrNPhBgVj19Cfcuw6BTuUjBvfAjkujn/Hy9Fm1z59jpSjmyQ4IApgNTYMpTVZLkCNKsZSPi9YSPncLfUfMMpmOrDzhdBHcnAszU2NkktfVe7+bbOFEsxO5q61tErg4Bcdbu3N4Qs2nKseUD/u74YcFgbGgde5WNq4ihgrQftVe2bZg+dyuML7zJ2DsEaqJAikEBQxmlf+dylTnnndy/BJNQEoXNy3IJbLwWH0zD/cv6gEZqBLlLm/GR3BEFcvMndtzi9S9957S0TloL6DRky/5Qqj97PoNKjLUWduYLstXYKDi0ASlHWAFB34RVRD0yc6v9F5HZnDKvZQMBOzKzwEkbX8wXd2YkLhSZvddbmXO+zL1wE42xFEn278NCmPhSC0b3/8E3Khv1XzftiNUqVcHsEDKJTTlg4GD5KUVV/Tzcmqepq8HgaDNgkJ4y4RDefSKumAcM7xoX3y8K57XLBF/sdJkXwa6hA19rBDt4xzJ0uE+g2HcVbWy6aKX30XPqpFQfabHlpr3g0ukBARAmxEzdh5PtP7ZfwsN3CRjTQj1Ovrr2Xwxdvh6/dqiOW6DJEx26owsp9O4JSV6FLBAOOvwZmpqHyXc0877XpCLSfh1JCvuzDuJXpasF75t7XgIpYNZ3+LAAONUxbnrVl12+HKEWssW4j6nmJkJyHSY5Rd6EzyHTRtl0Dstd0KmLHAefARdSRHYKCr0HTreQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(186003)(316002)(6486002)(5660300002)(2906002)(4744005)(26005)(54906003)(6506007)(6916009)(31686004)(508600001)(44832011)(6512007)(86362001)(38070700005)(38100700002)(31696002)(2616005)(122000001)(4326008)(36756003)(8676002)(71200400001)(66446008)(66946007)(64756008)(76116006)(66476007)(66556008)(91956017)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjRjOER5Yy95cnBINW0xREZiRDRZeFZUT3FubjlBT3I1K1l2SjZOaFFuU1hw?=
 =?utf-8?B?Um5Beko5NWVibWJMVmRESmphaGpXMkVKM0lvUmhvWGk0TG9DcXVXaWhHU1Nm?=
 =?utf-8?B?RmQvYzBwdnZFaXNEZzZ3dG9vVW84dXZCYkFlQ05oTk0rTkZmMEJoekVLMXo3?=
 =?utf-8?B?bEUzVTVEVlJaMlB2WXAvLytsWTkyUHRjNnY5bVpTcnI5M01ZK1NsMXB1aUp5?=
 =?utf-8?B?cHc3a0w2S2pVWHhHQXdqSlF5WFhrNXVCMWJSOW43THJsUkJOYStyVFlLT01z?=
 =?utf-8?B?czlzVHhKaWdSNmdtNms4Y3NFakdPT0hDK3QzSUhnT2lFZlVDWGdjd1c2UFkv?=
 =?utf-8?B?RkVWOGtTR2Q2Q3ljWWxaR0ZMbVphK3JzT2RvMmJFOWxVMncwWUJZaUFWVTE5?=
 =?utf-8?B?TTVMWTBTQzNqdVBzdGR1TXg1bHVpY3FtdGRuTHJwUG0zRi9rSXVnVGhGOEh1?=
 =?utf-8?B?L1ExYTV1VlJFMEVacmtsQmkvY2ZtZzlVQ3dzTmNiTDRTUkpRNWE5c241dGVQ?=
 =?utf-8?B?YkhuUnRPTEpYN1ByRGRRLzJ0L1hsdFV6R1FZWlE5M0tnKzFzQzlCdVc1YVVo?=
 =?utf-8?B?ZzRpTG1RSVhVSjVnYXZjYmNRaGxoZENyaDZidzcxMndocStzdExPRWtkTmRr?=
 =?utf-8?B?K2xPazVuSGhlU0U1VUxNTXlWc084NHBjd3BTOVR2aVlOVWxXNHlsVDBsS1Va?=
 =?utf-8?B?VEJuQm1UUkZGRVgzb2lVb3c1cHBvbmdEMVpTTlJoS0s5NWpkbk9jVExEWjdm?=
 =?utf-8?B?V1BSZmZpMU9SRE51VDJZeEFZU0p0ZnlST2FVbklIM1NhakpkVldBUXFRbjVU?=
 =?utf-8?B?K1FUR25vTXRpYXpMeGFiT0YwcURFWHJKMGtOT0Z6RVRhK0hOTm4wRnJpamRR?=
 =?utf-8?B?OWxwTERnWDV1MVQxaTJIeERadnRDZjU1a2FsZVFyeHpWdGJzdTNBU1ZndjlE?=
 =?utf-8?B?b0RqOWJDN3lva3F6Mm9UUlYyV2RPN3ZxM09RcDhvaW9oZDZRMUJTNGE2aTA1?=
 =?utf-8?B?bzlhcXBKUi9KRmFvb1R6K1RnQnRmczVkbG4rNUVFdFVNZk5aQWkySkxOWGxQ?=
 =?utf-8?B?OTdhTmtPMGNYL25sc1BnNnIxck1rd2N5Tm5oa3lQNXU0alR1ay9xR1ZTb2NY?=
 =?utf-8?B?a3dVMHFMV0k1aTlqdFVmdW80UENjV1BIQWlTT29oSit1amo3dEt2dVh5MVpY?=
 =?utf-8?B?dmxoUHJEaEJBRUF1N0k3eEpaeEovVlBWdFBRNDlpcHU0YVQvVTM0bGhPNVBm?=
 =?utf-8?B?bXZiNXoxN2FqMU9tbVpDSmZQcGNpOC95ak84QTVJL3hMeHRxWERBdjl3T0Q0?=
 =?utf-8?B?TEM1RXRnRTE0UTJDZms1TG5yT3psTmNWNWJ4MmE2dEl5bm11RlBFYmMyamIr?=
 =?utf-8?B?UEl0Q1ViR1JERTZrWVMxWm1Qdkc5ME5hOG1yWFg5T0cvTnlJa3hWMkorMXFE?=
 =?utf-8?B?SUdpNmg3SHVmeEp4UXJkUGNZdjhMKzlWMXROOG80WlQrL3R3SzFCMzlrRnMx?=
 =?utf-8?B?b250VC9SeUpuUmZtdVN0dEt2MDA5aHpRUC91Smk3bUhwTlAwQmM5RzZaa09T?=
 =?utf-8?B?dVhuMTlkVUxXbFRMQ1lGRnZhQWhscWxkUUowczliVnAvYnVBNFJhTUE4V0Vz?=
 =?utf-8?B?L3dkYXZON2ZrWnpUY0VNSC9RQUhoak5nWW1nWVlsYVczbU03Z3Z5eEM0Ylkz?=
 =?utf-8?B?MnlYNnIrSGNRUHRDRDZkQ0RQVE5kSkdyVm9RTk5NcVVPYWFwYVF3K0RvcDNl?=
 =?utf-8?B?VWhETUpKVjh5MHVHaHRWWHNBNE9GK0xqWElxZVhCanVMdUtpRnJ2bHBxbFhB?=
 =?utf-8?B?UUhEWFZoS0dNN01ZYWZGUDlzMGNSck1xY0w3SkczV250SlhOKzB6VHVGWXVQ?=
 =?utf-8?B?N3ErRk8rR1BHUUp5QTduQ3ViakdGN1RtMlJRYWF3aVdWR1lXRG1aZXZmbEpK?=
 =?utf-8?B?WUs5aTV4YXYrL0l3UjUwT3I0cVd2aFFmSm4yVlY0NVZHZHpPSnhJNXRGU1Nj?=
 =?utf-8?B?c0JObWZsNUllNzVHQXlpYmY0V0V4R0lad2RkVTlzdHNjRFhId050WHVHMVNT?=
 =?utf-8?B?aHozRVdac2V4Qno0VENtUFk4THY2VWJDWFAycnJEK3hhWGFDeVQ1b0w0WSty?=
 =?utf-8?B?UU9ibHJXVFcvOUMzZFlDZWlZellRblJxeXZCWkFBVmJBYk1RQ3ZxN3FUM1NX?=
 =?utf-8?B?bENQa3lvOXpXMFV3V1RsL1N5aHUwalUrdlB3K0hEa2JxL2s3SXZlS2VUWHlw?=
 =?utf-8?B?SXJNNERWMzZaV1VZSXNTQ3NuM1l4V2gzWThGL3FOZGN2QzNqdGJWNCt4VTE0?=
 =?utf-8?B?VEI2WFVWU05samdFZlZFUjhadjlrSkZrRUgxOE9Sam9TaVkvcDNKRDFqVGtT?=
 =?utf-8?Q?cHLrx0OKEj2tbueQ1woUFowMqYSfHXPcbZXg3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDC02346F7EF07479BACC97A0AE87ACB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a390971-0977-4c65-4936-08da2df0f09e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 17:10:07.8184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NnMx5v12T12kF5gPjN3jSR4zyShRn3Se7w1JaapaQE88fAG/d/lXNHk4D9QoiA1qsKf/iPxMQ0TrVMbTAV0IxUatGOJibn0khny+j1SElQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1951
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

DQoNCkxlIDA0LzA1LzIwMjIgw6AgMTk6MDYsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIFdlZCwgNCBNYXkgMjAyMiAxNjo1MDo1OCArMDAwMA0KPiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOg0KPiANCj4+IEluIHZtbGludXgsIHJl
bG9jYXRpb25zIGFyZSByZXNvbHZlZCwgdHJhbXBvbGluZXMgYXJlIGluc3RhbGxlZCBmb3INCj4+
IHVucmVhY2hhYmxlIGRlc3RpbmF0aW9ucyBhbmQgeW91IGRvbid0IGFueW1vcmUgaGF2ZSBhIHNl
Y3Rpb24gd2l0aCBhbGwNCj4+IHRoZSByZWxvY2F0aW9ucyB0byBtY291bnQuIEl0IG1lYW5zICdy
ZWNvcmRtY291bnQnIG9yIHdoYXRldmVyIHRvb2wgd2UNCj4+IHVzZSB3aWxsIGhhdmUgdG8gcmVh
ZCB0aGUgY29kZSB0byBmaW5kIGFsbCBkaXJlY3QgY2FsbHMgdG8gbWNvdW50LCB0aGVuDQo+PiBm
aW5kIGFsbCB0cmFtcG9saW5lcyB0byBtY291bnQgdGhlbiBmaW5kIGFsbCBjYWxscyB0byB0aG9z
ZSB0cmFtcG9saW5lcy4NCj4gDQo+IE9LLCBzbyB3aGF0IHlvdSBhcmUgc2F5aW5nIGlzIHRoYXQg
aW4gdGhlIG9iamVjdCBmaWxlLCB3ZSBjYW4gc2VlIHRoZQ0KPiBzaXRlIHRoYXQgY2FsbHMgbWNv
dW50LCBidXQgd2hlbiBpdCBpcyBsaW5rZWQsIGl0IG1heSBub3QgY2FsbCBtY291bnQsDQo+IGJ1
dCBpbnN0ZWFkIGl0IHdpbGwgY2FsbCBhIHRyYW1wb2xpbmUgdGhhdCB3aWxsIGNhbGwgbWNvdW50
LCB0aHVzIHRoZQ0KPiB0b29sIHdpbGwgbmVlZCB0byBmaW5kIHRoZXNlIGNhbGxzIHRvIHRoZSB0
cmFtcG9saW5lcyB0aGF0IGNhbGwgbWNvdW50DQo+IGFzIHdlbGwgYXMgdGhlIGxvY2F0aW9ucyB0
aGF0IGNhbGwgbWNvdW50IGRpcmVjdGx5Lg0KPiANCj4gRGlkIEkgZ2V0IHRoYXQgcmlnaHQ/DQo+
IA0KDQpZZXMgaXQgaXMgd2hhdCBJJ20gdHJ5aW5nIHRvIHNheS4NCg0KQ2hyaXN0b3BoZQ==
