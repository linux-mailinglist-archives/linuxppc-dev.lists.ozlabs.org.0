Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB5A4894B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 10:07:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXSd84pP5z30D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 20:07:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::613;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXScg1pvFz2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 20:06:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0hCJlObtdI25EWhVi22QYarmcBi+L7EuwmTsSKEquOf1MMxfUUTYpZRops64HFM4IfcHuQnxA8IdJv0tebMy2lJmsxdM0wdhIScTSlHt/dPqPOUT20PGpQgiHJNb1s8K5NxZDo6Q+SFgHcssFXLRXzVYLdSoLRKEbxIdsH6VFXw//9W0IcaWrmEQYLKR0P9kN286TX0ZnxQ3fov9ewXaS+GPxgyBxN8UMhjfFZ/4anu296pjYBRT/N+3n3v57j69I5qWfu+PL+jWuu67YlNHHNfTr1EuEmzBk32bIFQKYiHaq47/SflgduA26LBkokwYG5dKvMk/InW4kRAKQiPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vURpEn1LG9FnVuuCYITlKQlrt90/5lFKX9XPU2LE/+g=;
 b=Jp6584sYGMT9X0j2cfvBtdre6lWKfh4/ToeIyqM/zYrHHzwfzO/fjT74RgJz8M7JECFTAXvAv35nn8/+ASZm1cIFRphgyciadqExa4VJ50ItwL7a8e2kNFoUZzc8Lz03cSeqa4VtwavTmfbEMOGqvJXEpNPyYkgS0yW7EJerz7w3GVEpzy9ODlADH9tm+4XViurZlTtB44+U48SMMgtoqIEwxTkAVgbSjE0LUnozAYGmsDTSjlO0nra5kI0g+QYaVpodL4IcM9EM5kVqP+QI+kZkykE+g8pdK6y780xzP+jqLuc7xpl+Q+b6uhlWPNPVhyN3WCMlwTVc4MNXO7id2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0114.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 09:06:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%4]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 09:06:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Daniel Borkmann <daniel@iogearbox.net>, Alexei
 Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH 02/13] powerpc32/bpf: Fix codegen for bpf-to-bpf calls
Thread-Topic: [PATCH 02/13] powerpc32/bpf: Fix codegen for bpf-to-bpf calls
Thread-Index: AQHYAvL/Xea5VnBC50SY87rOOoG44axb/MOA
Date: Mon, 10 Jan 2022 09:06:20 +0000
Message-ID: <4f7b021e-0527-0113-ca99-8c63b43ca21c@csgroup.eu>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <52d8fe51f7620a6f27f377791564d79d75463576.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <52d8fe51f7620a6f27f377791564d79d75463576.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb8186f6-4fe7-4f67-94b7-08d9d41877c9
x-ms-traffictypediagnostic: MR2P264MB0114:EE_
x-microsoft-antispam-prvs: <MR2P264MB01148F2966727BDC974108EEED509@MR2P264MB0114.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R/EOyh/AqrLDVZWjII0A2jl1SvRe9sQBxT6Gp167hnWT7UhOrGl0Ja7dgFnCoiy5yuuJ/5ezB2a2Vgij7OD9VYYTE7axdbqS5i1PAC0fD/ABz6e3uh9/PdSCD7HBsc15+AlVPqGKhJNlIoV1jH5PgQ8li+v1MnFGphsDDKMOtZqM4ZjSepZWI/pzObMYVsZJdDYpkyYHfL5/wE/qgKZbcQi4L9s3J4ijaEJkLchAq6Ky41lEXpy9Gof5sq+CBAK0lM8LlEuedTKkThFlAUqoCH8qcRwcj4z0tpzzCVHc8zh+V6v+060OBIxASn0EqF//WyjUUqNkwTTs3Ayz52ZvwUrQoqKsO5x78FQV3Wif4Vm5jHd4fQxU/4c8oIGc4xCiYiezdBJCb3CEjtAoIAdfMKtw66I6yPHAEG+1YQ6g3bpX2GhvnLTilooYbp2ETdZwJL53dU2OJWPO2l9auae27WR60DujZG0AcJEkhtg0t/cCtzKNJjNiLXXYdNGfNFQljl2otjUQfA1kZxGtwU0naJFGN3cccGbZizvUA2K9hGfIWwOeznnsNj73KbpWIsBfBbhzn5VoWdsqLDVOeVi3XivsluZv/aDe7oqnuDOfE2oh4J+dbGOHEa0qkvWnGy7HTm8YYmJk0PqB0+kM/sQADRNLE+Cp3y/nr7A4Tx7b9gvCWPjUbDXkBig0hN5OFlhEC6Xntt+FMgsi+dEhKXG5YhHZ0o0RMz8RsjFVY1LBbFjS6FdODoFLLi3kavK8jTve1MNm4rlFX/WFs8ZbU99zsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(86362001)(8936002)(71200400001)(31686004)(6512007)(316002)(4326008)(66556008)(38100700002)(83380400001)(110136005)(54906003)(2906002)(2616005)(8676002)(6486002)(44832011)(66476007)(508600001)(66946007)(64756008)(76116006)(36756003)(91956017)(186003)(66446008)(6506007)(31696002)(26005)(66574015)(5660300002)(7416002)(38070700005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGFkL0ZqRTYxeUM2NGNoK3ZuTWtjRWoxSWVYYkNVbXJ1cmZHaVJKOC9lU1Ny?=
 =?utf-8?B?c3VML0FqeTlnREgxTHdMNmlSaEJ6cmNTRjNIZ09yNklpaE1SK2o2UTY1N2ts?=
 =?utf-8?B?RER5cUcwRmhrQit6QURIeC9DUnh6R2dKb2pGSmVLbzNJaE43aVVkVS8vRFRD?=
 =?utf-8?B?VW5zU2Y2SzdRa29lNGUxbzdhUHR6ZEUxTWZPbjJSUEFSeDNvNEJQYngrN0l6?=
 =?utf-8?B?NGRJQ2pDYkJJTFpZRVhLRHZFcmc1OVQ4VitEUWRtRWtTeGdwUTZublBDOW1W?=
 =?utf-8?B?WmtDTjhhRjBKUHVjc2FYVFQ1aUNoYU9YNkViYlkySDdKWWJITkxsQ2RZM3pF?=
 =?utf-8?B?eDh5Tm1IbGtjbFZCNDVRQ0p2RllmM2htWDVXelpOUS80VnF0N0x3a0xONTNY?=
 =?utf-8?B?Zk5DMjZoRkZIMjhSdWR5dzlSM3phVXJGSWNoNTlwMTFOU3RPYkkwekRaWGZl?=
 =?utf-8?B?VjJRdTA0d2p5Tkd5V1ZlQnMyQjhmazUvS0w3akkvMHREZVJObW56VVYzNzUz?=
 =?utf-8?B?SSszVy9wNkJiTUxnNUFhM3hOaGJObCtQcFZVeFBza0pVM1lKVmdyNXk0NWtq?=
 =?utf-8?B?QTllMExsWTl0bEJXaW1PU3JOUkhKZVFjdklldVNIMHdDbnk2SFV2R1EvcHBB?=
 =?utf-8?B?cTEzZTU0Y29DWFV5M0ovTGUyTSs0bmlhQWlyR1MrQ3gvSDdFQWNMeE5Rb3NO?=
 =?utf-8?B?cmE3dGRuTW5kL1h5cXIyV0FFeFFtTkhPNGdwY09jUG14MjRMK0k2S1JmSXEx?=
 =?utf-8?B?UjRiandiaHZnbWxDVy9uSVcyN1hrdWNvQ0VwT0x0SXd1SDVya3dwVzJLckVJ?=
 =?utf-8?B?UWR6L2NTZlJTbUtFc3BEa2tjaXAyaFZVMDFXR296SkZFTnYxNFVxRTNYWkJG?=
 =?utf-8?B?eUc2NTFMZGQ4b3ducVQyaVB1OWR5VFljZERqUUZDdUpLdFYreGQ5MVpJMmVl?=
 =?utf-8?B?T3BCaTVuN2ZDSDB5cFE4eXJBYWw1YTY2UVk3a2lMWHgveFhza0xkRFRqaDZa?=
 =?utf-8?B?ZkN4aU4xdUdDc20yNXZGaldFY1AxV3RQbDA3REsvUTRoTjFCN0hTMTVaN2dB?=
 =?utf-8?B?MTJ0Z1ZCbG81eEt6OW9zZjc1TU83WXE2ZWVhR1U2MXBVaTFFNHVmdWxRa0w1?=
 =?utf-8?B?WGlZNC9zVmp1SjJESmUyQ1Z2UGdwQkpKaWs0ZUljaWlDdmhTSjRxU2FnZi9E?=
 =?utf-8?B?YjVTbG1UVHRUU3hRVmlmb1J2QnpacDVKempnKy9xanZ5ZnJZOFljWE83NXJX?=
 =?utf-8?B?SDkwWkZBQ2lsNlhSQjBKOEd6TVQ3bmUrc1NQcVhJMlQ3VVhaYjVVS0pCSU84?=
 =?utf-8?B?OUVDbE9UZ3VQdlVIMkhzaW05eXAwOFUrZGZaUk84NjdWY2RUVjJXK21Wa0kr?=
 =?utf-8?B?RUlOZlYwd0l2MHFQWHppSXpKWUVYMUpqRXovUFNURUNzanByajF1aHRvZ3M3?=
 =?utf-8?B?dlQ2SnRmSWkvMUZBd05aZTFOeHJYaTVQejJWSWs3Z21scGtuTmFHZkpmRzhm?=
 =?utf-8?B?dVBmY0t4SVRBdXVXUkp0NmZJUU1sOTZnUXFaUSs1TnEvR0pNSWduT081d0Ny?=
 =?utf-8?B?eU5FWlJKSWNrZXdJSjZlMFlaVC90RkszalpRdW96T1RpZ2VwVW9ZYTRsbjFt?=
 =?utf-8?B?WUM4Y1VPaDNra1ZMa0lpWUswQXdCSStqM3JFdjNQcWVJS0k1NXVRWkV3SXEx?=
 =?utf-8?B?RE1GWXViMUhPajZSMFFFUE1VeVpPalljY1NCSEhZMWxIeTVGVml6aEVzNGtP?=
 =?utf-8?B?YnJYK0F5c2JkOUJsMTBmWCtjNlA2alIvY0IzcEJZZGdQRTZaR2w5NHBVVFlu?=
 =?utf-8?B?VlZiSjlsMHhiRDhvR0JkQkQ2Y2laT093cFpHM3drbk82YTcrM3hNR0FGQUdB?=
 =?utf-8?B?MlMyVWRMWUdOZWFIbGlvQkROK0tuZjRhSk1ZeFkxQzJEdFFwZzNVMzB4NnZT?=
 =?utf-8?B?QWYwZ0loQjlHTjdhWUFhVHlRS2k1STZrRUR2dHZNUHF3b0I0RlQrdVc0TXFS?=
 =?utf-8?B?SXViTGU5bUg0YmcycDRQZklOYUQvWEdKd1ltUVJ1ck5TWTFla2IzeVpwTmxk?=
 =?utf-8?B?OENiK1pRWklmTWE2WTRlakUwWDljUDc3VFB2eE1MM2x4WWxaQ1ZtdjRsWmgx?=
 =?utf-8?B?eTRqanAyWWYyejlVTjlWT2pna3hSVURVY0Yvd2MzSXlCMm5HTU5TQ3poazlU?=
 =?utf-8?B?cWVyV1UxVWp3SHY0OE1lbXFCdVAvQ3MzcUtxOW1ZUkdMUTdCNVppaEFaMGMz?=
 =?utf-8?Q?+0yDtzwiAzane0dZXdbkeEfV6+nTtMdxrQ79Y0GO3I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FE11D664CCB384593E76CB6990FA7E0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8186f6-4fe7-4f67-94b7-08d9d41877c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 09:06:20.3014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZNFA9rY3uiQdCtfLVpFldxWpg+aTbpTcN/ObU8ifrIhh9Jy8KltSEramikbGa4YasWTsLMxT6wC8rmml7on80x1LQ4zS9ae1yYHGs7SludQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0114
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
Cc: "ykaliuta@redhat.com" <ykaliuta@redhat.com>,
 "johan.almbladh@anyfinetworks.com" <johan.almbladh@anyfinetworks.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "song@kernel.org" <song@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzAxLzIwMjIgw6AgMTI6NDUsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
UGFkIGluc3RydWN0aW9ucyBlbWl0dGVkIGZvciBCUEZfQ0FMTCBzbyB0aGF0IHRoZSBudW1iZXIg
b2YgaW5zdHJ1Y3Rpb25zDQo+IGdlbmVyYXRlZCBkb2VzIG5vdCBjaGFuZ2UgZm9yIGRpZmZlcmVu
dCBmdW5jdGlvbiBhZGRyZXNzZXMuIFRoaXMgaXMNCj4gZXNwZWNpYWxseSBpbXBvcnRhbnQgZm9y
IGNhbGxzIHRvIG90aGVyIGJwZiBmdW5jdGlvbnMsIHdob3NlIGFkZHJlc3MNCj4gd2lsbCBvbmx5
IGJlIGtub3duIGR1cmluZyBleHRyYSBwYXNzLg0KDQpJbiBmaXJzdCBwYXNzLCAnaW1hZ2UnIGlz
IE5VTEwgYW5kIHdlIGVtaXQgdGhlIDQgaW5zdHJ1Y3Rpb25zIHNlcXVlbmNlIA0KYWxyZWFkeSwg
c28gdGhlIGNvZGUgd29uJ3QgZ3JvdyBhZnRlciBmaXJzdCBwYXNzLCBpdCBjYW4gb25seSBzaHJp
bmsuDQoNCk9uIFBQQzMyLCBhIGh1Z2UgZWZmb3J0IGlzIG1hZGUgdG8gbWluaW1pc2UgdGhlIHNp
dHVhdGlvbnMgd2hlcmUgJ2JsJyANCmNhbm5vdCBiZSB1c2VkLCBzZWUgY29tbWl0IDJlYzEzZGYx
NjcwNCAoInBvd2VycGMvbW9kdWxlczogTG9hZCBtb2R1bGVzIA0KY2xvc2VyIHRvIGtlcm5lbCB0
ZXh0IikNCg0KQW5kIGlmIHlvdSB0YWtlIHRoZSA4eHggZm9yIGluc3RhbmNlLCBhIE5PUCBhIGp1
c3QgbGlrZSBhbnkgb3RoZXIgDQppbnN0cnVjdGlvbiwgaXQgdGFrZXMgb25lIGN5Y2xlLg0KDQpJ
ZiBpdCBpcyBhYnNvbHV0ZWx5IG5lZWRlZCwgdGhlbiBJJ2QgcHJlZmVyIHdlIHVzZSBhbiBvdXQt
b2YtbGluZSANCnRyYW1wb2xpbmUgZm9yIHRoZSB1bmxpa2VseSBjYXNlIGFuZCB1c2UgJ2JsJyB0
byB0aGF0IHRyYW1wb2xpbmUuDQoNCj4gDQo+IEZpeGVzOiA1MWM2NmFkODQ5YTcwMyAoInBvd2Vy
cGMvYnBmOiBJbXBsZW1lbnQgZXh0ZW5kZWQgQlBGIG9uIFBQQzMyIikNCj4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcgIyB2NS4xMysNCj4gU2lnbmVkLW9mZi1ieTogTmF2ZWVuIE4uIFJhbyA8
bmF2ZWVuLm4ucmFvQGxpbnV4LnZuZXQuaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBj
L25ldC9icGZfaml0X2NvbXAzMi5jIHwgMyArKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2Nv
bXAzMi5jIGIvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAzMi5jDQo+IGluZGV4IGQzYTUy
Y2Q0MmY1MzQ2Li45OTdhNDdmYTYxNWIzMCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL25l
dC9icGZfaml0X2NvbXAzMi5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21w
MzIuYw0KPiBAQCAtMTkxLDYgKzE5MSw5IEBAIHZvaWQgYnBmX2ppdF9lbWl0X2Z1bmNfY2FsbF9y
ZWwodTMyICppbWFnZSwgc3RydWN0IGNvZGVnZW5fY29udGV4dCAqY3R4LCB1NjQgZnVuDQo+ICAg
DQo+ICAgCWlmIChpbWFnZSAmJiByZWwgPCAweDIwMDAwMDAgJiYgcmVsID49IC0weDIwMDAwMDAp
IHsNCj4gICAJCVBQQ19CTF9BQlMoZnVuYyk7DQo+ICsJCUVNSVQoUFBDX1JBV19OT1AoKSk7DQo+
ICsJCUVNSVQoUFBDX1JBV19OT1AoKSk7DQo+ICsJCUVNSVQoUFBDX1JBV19OT1AoKSk7DQo+ICAg
CX0gZWxzZSB7DQo+ICAgCQkvKiBMb2FkIGZ1bmN0aW9uIGFkZHJlc3MgaW50byByMCAqLw0KPiAg
IAkJRU1JVChQUENfUkFXX0xJUyhfUjAsIElNTV9IKGZ1bmMpKSk7
