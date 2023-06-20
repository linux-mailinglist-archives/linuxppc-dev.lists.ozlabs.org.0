Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B5E736377
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 08:17:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XJGpcoP+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlbyG3cqkz30hn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 16:17:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XJGpcoP+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::603; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlbxH5rhbz30Nn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 16:16:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gt2z+tdy0uQ2LyZrdREq0uSmXtdfSrngcybhueeLalKNi8YarFbpiUZ4VVbTNapXQcKiN065acLNjBT0xuG0TW9Ki5Er67GUrzsDEwfE6p5L4p/NN+HvpjB3W0hG+Ic40CDuvhDWeYESjCou0qaLgvTkSdxJzssRcehVQWSQ/8eVsGW4dcZ2xoSCH8YgZmejp9fFFGDQQCUhEbTTctLL4OQbK8O68IoTj8ouNNYzXD6y1m52fiqBEfI6iQOiAJlgH0uT4D9+7Pkv3NG4gOc2h4rMojh1qULe+GzimXJ9fw6Ip9mqz4H9OUxI8g1FcI7ObbWxPlDjjUDvqjsvP/U95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lpJTP6IlIA8i9CRvVavd/QiS0IDOmaAyGP/lxfhB04=;
 b=aWG54JfJePVYht4snXJJ8jy47FQwCt2o0wv+QCbQrSp6ZV6t9u/QXgD0N3ySHICVdS/TOvdCsTjtcJenKz0TJ3XZoqezqNMINXwrX07PcbG2bYQja6Q4KLEoj5VKG5Y7rnAZuxqEwVCOA1/hz9779yHKUM/Hz6FAWpmtX7EWw1qMM6743XcTTJyHxkLFX5zYs7d0A9Q4Z5HYAgIB+iGmwSmHhe4LdxFIzUovNJMFA1mKPzKMgjE0e/dTFs8Jvia540UdO8IkuFD3LDVG0t29N6vfZfrUHP6DoY1mR4oykt34KzWEyYETsPI7VExVf6e8b3EcYzRB5rUPUPFzVRl/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lpJTP6IlIA8i9CRvVavd/QiS0IDOmaAyGP/lxfhB04=;
 b=XJGpcoP+daHXUfarvtM7+c3Zsry5qIwEBXdrT6HMo7N/OpC3rjrSUiQGBJhvtaHUshqevg0CKG1j1LZZvCI6Py9wQKBGSZkrrgT1OPhXM5dfTEVbf9HoMAAO8lMZKuPEhDZf+attrkifvBS9XQM3UTalZVjjWK43oHIhlhxUWSBW9auauELXwfLrx7pKGrEb4bHtx5ujO+TXuRnSkWEQR2CEowqo1KRG+0mHWmZVnCF0ZVg57EUo69NACD1c4CU+04efkss7t292mPqJwIj8NQvJFnX9Av6JSRNC5sM5EaA20Oy0CxDa8a2t32LspSt0OS90xNjuyGOGmHdq8MX2wQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3116.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 06:15:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 06:15:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [RFC PATCH v1 2/3] powerpc: Mark all .S files invalid for objtool
Thread-Topic: [RFC PATCH v1 2/3] powerpc: Mark all .S files invalid for
 objtool
Thread-Index: AQHZoFky3HsXhnrDnEu3emuDcgEGRq+TOXkAgAADKwA=
Date: Tue, 20 Jun 2023 06:15:54 +0000
Message-ID: <185a1734-80a3-08fd-18d2-08b24acace37@csgroup.eu>
References: <cover.1686922583.git.christophe.leroy@csgroup.eu>
 <17feb760a05edd372984bdf148c760c6f279b401.1686922583.git.christophe.leroy@csgroup.eu>
 <1687240339.ekhpozhevo.naveen@kernel.org>
In-Reply-To: <1687240339.ekhpozhevo.naveen@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3116:EE_
x-ms-office365-filtering-correlation-id: 317c1219-9a87-470d-5f25-08db7155cddf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JovX4nHjBAXCZ4QfmMRxagbpKcxzUcNzrB84k3buPiXRJD4EZgmu0sLBeDaOmN5sQ/wXLjS1aZ/szyicXTfwvAzzaBbVVN0Qp/3IQauxbPpo7kA+5siQwcArF/6E4pu2Ke5Qf032AxhwrTa07jShuaztL7oAslTmLKAaLUV6dHlySi0iDjTVt70J5fc2UqCmqwzMTAOvtPtBPU00oFzv9vyoOYRo0sVIAniiVZceftlP2F+J+I/k7YpC0kLkOsQrzVIULG4A1ahe6Gq1NDcma4f9PKx0IvKVL4O1si1bQUleeqNBDRnxhv3StDUiwhWAZ+EG9hjOdRhVExLA+ob9LghUt9UrpmgkKFgc1ZAVlvp/4ivax2wPvJ8bbX88Df+l4TDJLo4gBuQVMOCcScBPPxdX3SaCJfVbFthDSpFPslTr1nRJq1j6q7BPxxSf4NGvnuiOaqSlNvBtxwjrdhen5k2swywkNK11AESyAfIaui4U29bhL2YyiOhIkMnMsWX6XvVt1Z287YdyFZH83d8pUjPEa5T7zFIVWm8lM2HlHB6mqMLsrh5aXqfqZrLTQ+fEGW5sjKSQE6oNSDn5tEjwkuh/HQlWV/TP4MwfKD2rpbRDzHEP/WNfYy666Z0x3+RnXKHN7Bl4fSN8yZ/1W9IS95AXYQkUpQyjfAFZm6+ndacnOy7REy6Z5HDhM5q8+Uo6YcDR8OC9R6LrGa3JB/D+7g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(38100700002)(4326008)(91956017)(76116006)(41300700001)(66574015)(66946007)(66556008)(64756008)(66476007)(66446008)(38070700005)(54906003)(110136005)(44832011)(86362001)(316002)(31696002)(8676002)(8936002)(122000001)(36756003)(2906002)(478600001)(71200400001)(83380400001)(6486002)(2616005)(6512007)(26005)(6506007)(5660300002)(31686004)(186003)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UHJFYkZHR3RQRU5CaHdRMHpZd045bmNZajRKaUJVMkdHNjJoVVlabWpzdTk1?=
 =?utf-8?B?aXNuSUdkTThvNjhGZ29lSmtrNzZFT3k2RXU5dXBlb0wzaGR5ZEMzajB4M3o4?=
 =?utf-8?B?TU9BZC9waWhNRmZRYXAzalJJZkxlOFNLb3pnZnFiREhGRkxvUjUvcXpLZVpL?=
 =?utf-8?B?MXo0V2ZWU0VaMzM1STdkUDNVcU5Bb0c4VjlVRkdVWU0wY1hMTnZoRUVGNmNT?=
 =?utf-8?B?NGZEVGwyeURBR3BDVWxXRnQ0RVcwbXdTVTZMVjdkUVVQNnFHK3FVT1NlSVE2?=
 =?utf-8?B?VVUzYXowbGhKSnNLajRiQlpoTWxsMk5ia1dKZkk5dTladE1xOTBnR2VTZ3o2?=
 =?utf-8?B?ci9Gc0dmVHdDUGZabGJCVytGM3Y1MUJsWG1HRWpSVkozNFFPZnBMZktzWWFU?=
 =?utf-8?B?OWxYeThkTVdWVDZvaU9jbGZDQVczTm1aVTgybWRxeG1ud3pENFpIVS9wbUlZ?=
 =?utf-8?B?R2NPVEhGdjkySUpWR0RjYk9tNWRWZFcraURta3I0ZTlIa1JjbktBUS9EVFhS?=
 =?utf-8?B?clNPYTNjTmkrZE4wcTIvU29ndVZuTjliMmVaWVJ2a21CMzFzZ1ZWMGFHTHB6?=
 =?utf-8?B?UjVLVjRnL0ZiRUpPc3RsOVBCZUxXN3JYUkZTV2xFN3RMeTNGRiswa0J0b1Br?=
 =?utf-8?B?VXJENlF2N1gyMk02OXU3V3BQRnhOano4ZTVpbE16by9MNS9OeStOQUFuemZs?=
 =?utf-8?B?djVXVkgydjVGNjdidVNkN0xEM3hQeFptdmdhTUZLU29ETHdWNVhSRkJJdVVI?=
 =?utf-8?B?TlV1am1Nekx6cmlCR0xvQ1d6MjFDd21EQjNRcDYxS1pHSWJESEF1UTYzQUc3?=
 =?utf-8?B?UFVqekg5djdoMGs0WFZPTEdSc2pPSnJrSHA3VHE2VDdjWVJnZHIxTnFRaEV2?=
 =?utf-8?B?aG5MMWZEdWpnWHBQeXdvUEhpTjRkeHZaWDdRSlVjQXQvTnRVcU1RVE1MdStv?=
 =?utf-8?B?bElWTHRhZ0UrVDN1aE5kRzFCTjdwVEpHZjhXYXVjMlRkMVYzcUVGKzZsV09h?=
 =?utf-8?B?ckdlQnVsY2UzUWVqbk13VDlWaEVqdG5jOFNhUGR2dUtpNW5ZcGE3eUJheGlP?=
 =?utf-8?B?R1dQNy96YnVrclNFbklRdU9UTHliM0Y4NlV2bDlkTmEwRHNuRmRUN3NuTHBx?=
 =?utf-8?B?UDA1UmFKaWU3WlUvMmJ6MzNoTmEyY2pSM1FvNEhJdktURlJDWGE4WTFsKzZj?=
 =?utf-8?B?UzhhZlhyVmR1SFRna01UNEZLQ0RHRktKUEZSRlZuUkV2M2dUV0JZcEJGT2Vv?=
 =?utf-8?B?am1HOWphZTVjTHNyS3JDdXF1eVJveDVKM3VWZCt4WmY3U0RZb25tUnh0S3FQ?=
 =?utf-8?B?TExidnNZVU85MmFXLy9aNUh4NkFiWjNHUDJBdUlUUzlVMTI2NFB6TkVwb3Ny?=
 =?utf-8?B?Z1ZHdEM4R3N4dXdTN0NPekYxc0VtYXdDSnZsK2tSSXVmTFhSOVM3bC9HVVYv?=
 =?utf-8?B?djk0c0ZCa1c4M0ZpS2ZlZkl2WlpwUlZCUGlFV0NRdU51VmdmcHMxa0NsQzVS?=
 =?utf-8?B?bVFRTklEU0JuT3ZScDJIS3hHcWVBZ0ZuNU50dS9ocXYvcVB4S0dTWHNNZDNY?=
 =?utf-8?B?cnlMTFlUdm54WjV1N3JySWpWSXhhSUlmRWFHV2hPK0xkaTlTTlBTSWtPTDU5?=
 =?utf-8?B?MmVEYm1heUxLRDZjNWNYakhIL2F1aENaYVllK0ttQ0xIeDE2S09oN05rZVdV?=
 =?utf-8?B?TTBHWStJaU51MmtpeHl1YjNaVEJOcnZsQUVjSXdWRFVURVZPc1gvS092RW1D?=
 =?utf-8?B?L2RXWXVGRDdScjlZV2NUK2hlWHV0amsraWs0UEc3OUZZZ2gvaGZvMFFMMTQ2?=
 =?utf-8?B?ODZsek02Nzd3US83TzBTRm5zWkZnNldzTWdhOWJ0aFFJYzhIL3RTSml5RHUx?=
 =?utf-8?B?Qk9vSjJjUjZNTU5TbG5iaGQ3TDFZMDlQaTNSUjhSckQvVFdYYWU5ekNZYW84?=
 =?utf-8?B?K3VoYWpPcnVQR3RPUUhhZGFzWCtWNlovbmFqclJWN2JPL3g2Wlg2dzRreDBL?=
 =?utf-8?B?SGR0QitIeU5HeWdFVzd3K3BlbU9qN0hYTWV2YnEvTmVCZnpoSHQyaFVobjZm?=
 =?utf-8?B?V1E0Ti9QNjB2K2JZRlUzNVg2dHg2M1pCYTk0ZWVobHd4SGo1S2hyVTlpWC9k?=
 =?utf-8?Q?MCrOy8GK2M1TfsPAUM5kERMiN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E70CB6B97F0FA438AD3F6FDE20331CB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 317c1219-9a87-470d-5f25-08db7155cddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 06:15:54.2628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pkd/lexikc27IRi1MAi8hfPK11wSArTWb44nL5zcz8YhGh+wXgnEq3rSAGN5FTcrTpSzohOeMM5TEsTXYzBoeplUVWWeU6r1CXB5qLBf+Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3116
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

DQoNCkxlIDIwLzA2LzIwMjMgw6AgMDg6MDQsIE5hdmVlbiBOIFJhbyBhIMOpY3JpdMKgOg0KPiBD
aHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4gQSBsb3Qgb2Ygd29yayBpcyByZXF1aXJlZCBpbiAu
UyBmaWxlcyBpbiBvcmRlciB0byBnZXQgdGhlbSByZWFkeQ0KPj4gZm9yIG9ianRvb2wgY2hlY2tz
Lg0KPj4NCj4+IEZvciB0aGUgdGltZSBiZWluZywgZXhjbHVkZSB0aGVtIGZyb20gdGhlIGNoZWNr
cy4NCj4+DQo+PiBUaGlzIGlzIGRvbmUgd2l0aCB0aGUgc2NyaXB0IGJlbG93Og0KPj4NCj4+IMKg
wqDCoMKgIyEvYmluL3NoDQo+PiDCoMKgwqDCoERJUlM9YGZpbmQgYXJjaC9wb3dlcnBjIC1uYW1l
ICIqLlMiIC1leGVjIGRpcm5hbWUge30gXDsgfCBzb3J0IHwgDQo+PiB1bmlxYA0KPj4gwqDCoMKg
wqBmb3IgZCBpbiAkRElSUw0KPj4gwqDCoMKgwqBkbw0KPj4gwqDCoMKgwqDCoMKgwqAgcHVzaGQg
JGQNCj4+IMKgwqDCoMKgwqDCoMKgIGVjaG8gPj4gTWFrZWZpbGUNCj4+IMKgwqDCoMKgwqDCoMKg
IGZvciBmIGluICouUw0KPj4gwqDCoMKgwqDCoMKgwqAgZG8NCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZWNobyAiT0JKRUNUX0ZJTEVTX05PTl9TVEFOREFSRF8kZiA6PSB5IiB8IHNlZCBzLyJc
LlMiLyIubyIvZw0KPj4gwqDCoMKgwqDCoMKgwqAgZG9uZSA+PiBNYWtlZmlsZQ0KPj4gwqDCoMKg
wqDCoMKgwqAgcG9wZA0KPj4gwqDCoMKgwqBkb25lDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPj4gLS0tDQo+PiDC
oGFyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCAxNyArKysrKysrKysNCj4+IMKgYXJjaC9wb3dlcnBjL2NyeXB0by9NYWtlZmlsZcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMyArKysrKysrDQo+PiDCoGFyY2gvcG93ZXJwYy9r
ZXJuZWwvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDQgKysrKysrKysr
KysrKysrKysrKysrKw0KPj4gwqBhcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL01ha2VmaWxlwqDC
oMKgwqDCoMKgwqDCoCB8wqAgNCArKw0KPj4gwqBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vTWFr
ZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMSArKysrKysNCj4+IMKgYXJjaC9wb3dlcnBjL2tl
eGVjL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsNCj4+IMKg
YXJjaC9wb3dlcnBjL2t2bS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCAxMyArKysrKysrDQo+PiDCoGFyY2gvcG93ZXJwYy9saWIvTWFrZWZpbGXCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjUgKysrKysrKysrKysrDQo+PiDCoGFyY2gvcG93
ZXJwYy9tbS9ib29rM3MzMi9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArKw0KPj4g
wqBhcmNoL3Bvd2VycGMvbW0vbm9oYXNoL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMyArKw0KPj4gwqBhcmNoL3Bvd2VycGMvcGVyZi9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAyICsNCj4+IMKgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy80NHgv
TWFrZWZpbGXCoMKgwqDCoMKgwqDCoCB8wqAgMiArDQo+PiDCoGFyY2gvcG93ZXJwYy9wbGF0Zm9y
bXMvNTJ4eC9NYWtlZmlsZcKgwqDCoMKgwqDCoCB8wqAgMyArKw0KPj4gwqBhcmNoL3Bvd2VycGMv
cGxhdGZvcm1zLzgzeHgvTWFrZWZpbGXCoMKgwqDCoMKgwqAgfMKgIDIgKw0KPj4gwqBhcmNoL3Bv
d2VycGMvcGxhdGZvcm1zL2NlbGwvc3B1ZnMvTWFrZWZpbGUgfMKgIDMgKysNCj4+IMKgYXJjaC9w
b3dlcnBjL3BsYXRmb3Jtcy9wYXNlbWkvTWFrZWZpbGXCoMKgwqDCoCB8wqAgMiArDQo+PiDCoGFy
Y2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvTWFrZWZpbGXCoMKgIHzCoCAzICsrDQo+PiDC
oGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9NYWtlZmlsZcKgwqDCoCB8wqAgMyArKw0K
Pj4gwqBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzMy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgIHzC
oCAyICsNCj4+IMKgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL01ha2VmaWxlwqDCoMKg
IHzCoCAyICsNCj4+IMKgYXJjaC9wb3dlcnBjL3B1cmdhdG9yeS9NYWtlZmlsZcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDMgKysNCj4+IMKgYXJjaC9wb3dlcnBjL3N5c2Rldi9NYWtlZmlsZcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKysNCj4+IMKgYXJjaC9wb3dlcnBjL3ht
b24vTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArKw0KPj4g
wqAyMyBmaWxlcyBjaGFuZ2VkLCAxNjggaW5zZXJ0aW9ucygrKQ0KPj4NCj4gDQo+IEkgdGhpbmsg
aXQgbWlnaHQgYmUgYmV0dGVyIHRvIGhhdmUgYSBjb25maWcgb3B0aW9uIHNvIHRoYXQgYXJjaGl0
ZWN0dXJlcyANCj4gY2FuIG9wdC1pbiB0byBza2lwIG9ianRvb2wgb24gYXNtIGZpbGVzLiBXZSBj
YW4gdGhlbiBkbzoNCg0KV2VsbCwgdGhlIGlkZWEgaGVyZSB3YXMgdG8gaW5pdGlhbGx5IG9wdCBv
dXQgZXZlcnkgZmlsZSBpbiBvcmRlciB0byANCnF1aWNrbHkgYWRkIHN1cHBvcnQgZm9yIG9ianRv
b2wgdWFjY2VzcyBjaGVja2luZywgYW5kIHRoZW4gb3B0LWluIGJhY2sgDQpmaWxlcyBvbmUgYnkg
b25lIG9uY2UgdGhleSBhcmUgcmVhZHkgZm9yIGl0Lg0KDQpJbiBtb3N0IGZpbGVzLGFsbCB3ZSBo
YXZlIHRvIGRvIGlzIHRvIHJlcGxhY2UgYWxsIF9HTE9CQUwoKSBieSANClNZTV9GVU5DX1NUQVJU
KCksIGFkZCBhIFNZTV9GVU5DX0VORCgpIGF0IHRoZSBlbmQgb2YgdGhlIGZ1bmN0aW9uLCB0aGVu
IA0KZG8gdGhlIHNhbWUgd2l0aCBTWU1fRlVOQ19TVEFSVF9MT0NBTCgpIHdpdGggYWxsIG5vbiBn
bG9iYWwgZnVuY3Rpb25zLg0KDQpUaGF0J3MgZWFzeSB0byBkbyBhbmQgd29ydGggaXQgYnV0IGl0
IHRha2VzIHRpbWUsIGhlbmNlIHRoZSBpZGVhIG9mIGFuIA0KaW5jcmVtZW50YWwgYXBwcm9hY2gu
DQoNCkNocmlzdG9waGUNCg==
