Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B23806EE34D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 15:41:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5NSv3mJ6z3fBd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 23:41:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Do29czuB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Do29czuB;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5NS43XHzz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 23:40:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYwuN3I+B+cB974TYCtJlZpe/TpQC5ZWJlqkAz1NjRiXCX+ylW7Dbl6xsGq5yucSUEjJ9bs9Z3YYQYBLJZH2cwTQ+FebmXbI7Pe7ewDQ7grUFp+hn7iEpdtcMpOqBbPAo7qTl3zAQnAdO5l0VPwHqGpGH23wphSKzvs8qTqNoWeHaxYTmFeU6GReTzjD/EWEqYxM9qyNQ1nvjNgR3uRjVZXolaSKnAAGaIuY6i/f5CT04Tel0HYmwOkTkIlWtQ/jCbBtu7yYMnoNV0DvqrfSIDwjYCFu+X/YaxC+bga03JAa1OaSCRY/Gk/l1otN61CwHQx6EhZPWmixG6KWfRRsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ATZaVYb4EM4Qoem6H1rVw4bAGSY4re07xXiMrwWDjEA=;
 b=bby7XBcDK/DWlcg1nIZ95ZO9NGFpO/eOOANL82o60IF9O3G/Bc7oTTe9vL0z3F6KDo0+gczs+jE/7qkIa15zQ9deyiDTbKFi/szQzeWYCW5xYdSXRTBTtyF5lUkiTuMgfnzsesfnxIoPISjqSU+kTMsq089zW0P6TcXfJMPRAzx9wzU5P9NmE6Cc5KALaBV71ftxg+9Q/2uSVBBTbN0j4OGfNeEjrqRuHOLZ3vXAEJYJLoacjEgkERqUFqVy/ElDmtofBlpk2hu6fp4ApTYszIX4Vhd8/35mJelXOvlrWdl4IQ5EdPxkm7wUk+20WItIEvQM7NxZnVBH+n63BAnDmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ATZaVYb4EM4Qoem6H1rVw4bAGSY4re07xXiMrwWDjEA=;
 b=Do29czuB4ATOjIrp3UXIgjoMIhNH1/fvMNBTqh9b94/dWcdiCngftPVg+8UBLnuD5CGbmMlBlF68AeJYuM84Bn76gKh5o9vG0C1OLVSN0ZZOGGSgqzvSXqpzzJTT2zv0KVKZsnYBYlEt2ozbWhBfQ/SAGacjrtBVTTsnCgAKnBK8kHMLfWk3AlCp3/4OtR4E69L1LrW31Jp2erTOqVdosb9A5LIdbSeGYUDr5/SNC6DyftaVKJoe6kuBtZ5p0PPRNvpWu3EMQL1Acc8D65h9WZ8byyWNMYua5Wu9iSsIMNRIX8qJMWdGZZPDpvQv5/AiuSf2cZ8qdFALCVKX5NLruQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2145.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 13:40:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8d19:d0c0:1908:3f25%5]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 13:40:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Joel Fernandes <joel@joelfernandes.org>, Zhouyi Zhou
	<zhouzhouyi@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Thread-Topic: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Thread-Index:  AQHZdRij7XaDRKPnAkCpLkVXFgccXa83txaAgAHnTwCAANStAIAAIX2AgAAENYCAADmigIABAIwAgAAMrQCAAAIPAIAAKyKA
Date: Tue, 25 Apr 2023 13:40:32 +0000
Message-ID: <528b2adc-9955-5545-9e9d-affd1f935838@csgroup.eu>
References:  <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org> <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
 <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com>
 <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com>
In-Reply-To:  <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2145:EE_
x-ms-office365-filtering-correlation-id: 51145ae7-fe43-4f90-1f77-08db4592a47b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  O3UuNsFmG5HAybUM16Muez4F3b9Otc4GzU0m4rz0e5DmOkw5puB7e0eE25Z4C/jiclHsTJcRDQ97Ni+FfvQrGGbpBzVIecpwIwNQ0fiAipFfFK6YEhsk6eUWyi1j2+eHD9Qa3zLrBDrmlmzHq7P1OZ541MpDKS+f8DRP0+N6X3VEW29bn7qhFJhGHb4JPGlv7DKrHDKHVruevOoThjJOu0DDFKn0UsUITL7wcDwRCzuZmbO4+Siyh18suQHFkmCCSs19vfjJIHqD++2L2cIWooLyE48aqDUcRk65msCKEUoCjiEPi1iCzNvSk6Kz3LALMOFaQCSkEWR1JBslIC0BIfPzxN8l1GwF2x9cCLUDWFMP7QqP9NPJjl6ltoQl1rGrHm2/4y/Oz3XtdYXVodn1ANu2+bJP1hIZ38z3iE58XaNEH/P+YlL253L+H907A9gTUrWIdrxN56NcUFRHhxq4ZDBSKBkJekKnO6lURgVvB98FxeyrxKye/4lW1dLK501aSHT/2HJUmlJP2Xo4gbklxO1q3n9YspY9YxfulqlyRlpyO0Kbhr3wdSoNAKtFpHT7Oj4AYfuWF09q17jf5FxTZU4M6/IJcjCz3GtwmSYnxrdbK+zejZ6VGcnfl3LBXnK33fU+8WuV1E+180hDz5ZMwGWFVj/ayCN1FRGBKrilEz2Md8m6eOFTZ0Z9X0zUZBtr
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(6019001)(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(269900001)(451199021)(54906003)(110136005)(478600001)(66946007)(66556008)(66476007)(66446008)(64756008)(4326008)(76116006)(91956017)(6506007)(26005)(6486002)(71200400001)(966005)(2906002)(6512007)(41300700001)(316002)(8936002)(44832011)(8676002)(7416002)(5660300002)(122000001)(38100700002)(36756003)(40140700001)(86362001)(38070700005)(31696002)(83380400001)(186003)(2616005)(53546011)(66574015)(31686004)(43740500002)(45980500001)(10721665004)(344275003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?N0JuZWIxY3pudnB2Q2tNUHJLUVlyeVZFanhqU1FpNDJlbE9vbHNmQkZYL3Vk?=
 =?utf-8?B?aldicysvRnZDZTdTZGdhRGhucytXNHJLWUhsbUNYL0Zoa1poV2hsN1ExTVNM?=
 =?utf-8?B?NlVsdldXUXM3c09tRTJNNHU2Q0xDTG4wejZSeDlvbHdJcDNydDhiU0lGckVx?=
 =?utf-8?B?N3JZeUpScWNGNmg5R1l3dHdJY1JZNG5lL3hvQzFVenBQZis2OHlqbytQYU5q?=
 =?utf-8?B?Snc2aEtlN0YxRzZQcEhieGNGTkFCaWpHejhPUWZIL1JCcSs0RlJBS3FmcDFV?=
 =?utf-8?B?SndjY3ZGVlB6Uk41UlRQNEdTNFpIYW1WNXpLQzFnMGJqUllrUmdVZzBOaXFI?=
 =?utf-8?B?WDNMcmRMdXYyRERpQk1YdjIwclFaREIvS0hrWlpmYStjSngrUm95VWRUUWU0?=
 =?utf-8?B?Yzh4V015cTl5d1RJZVVFclhiQVlVT0NoV3ZVKy9QSmJoMnhLNUdEZ1locERt?=
 =?utf-8?B?RDNObUNPd1hHeGhXWlJRS2FTWEFKdmVMN3pmdFpPMU9MMkNxLzdzYTRkYmc2?=
 =?utf-8?B?N2FUYjBUUjVLZmJtQ2JhcTRaVHpBWFZPUXVtUDdqZGM4Q2NvQkxJaFRMRjVj?=
 =?utf-8?B?VGltc2p0WEczekNLRlQvY1k3SEdwYmFKTTYwVVFWbUJMU2hzKzdvbGVvalE5?=
 =?utf-8?B?ZDFnYUJ2MVRmOVYwSTc0WWxsR2ZaRGVhR3Y2aWYwUkVVeEVRV3N3RUxxcWEy?=
 =?utf-8?B?RTNFZXZMdUozNHN4SmpxNkUvMEtnbWp1bFNxZDNSYlZDVnlHNzl5cWExN0l5?=
 =?utf-8?B?RG5rbnV5T1IrR2Q0YjR0UGxQOUJqeThYSGNHdWJERnRtRHErZmh2TGxYRGhY?=
 =?utf-8?B?VGpSaUJ3Mm41RkVUMFlZTHVMVmg1TkU2K01sVjhUSGxEZlV1bE9aMEpGeW9Y?=
 =?utf-8?B?UlQveXN2a1hLYno3MEIxdWZmRVRweTVpN3FjVHBlMDE3aGpBclRKa3RkTWNV?=
 =?utf-8?B?ZmMxMWJIcytEdDJoNHZtTW9EakZGTnpHTEVXclRta2Y1cU8ycThscDUwWUV3?=
 =?utf-8?B?bmxFU1lGbGVRZ3FSUkFRaHRyenYyY0FUbkp2TTZrcWg0eTVveUN6QkxGWU5V?=
 =?utf-8?B?TnM3L1VLU0VOeEVCcTcxbkdodlUwTVhKSjBjMWJqdlg0NWtBTkxaVEdBRGI1?=
 =?utf-8?B?bzZvUmlJZlV2Q1dQUElUd1RWUGFXNXFFRmhseDRBUlo4anpBK0I4UE5LNm5w?=
 =?utf-8?B?ekZrVEpoQ2dESEc3RE1KVzVUTVZnYXVGaG1qZFJvMFV3MWVzUDVoc3QyZWF6?=
 =?utf-8?B?a25SdEFUWU9CN3k2c0dQZVlQMitPUEpLaEdpdDFPU285KzZKNk9WcnlMWGpT?=
 =?utf-8?B?SDYvQjd6QUdOMHU2QnRVMXFyc3NyeEl0UjFVL0l5UzF3Y1N3R2lGOEcyU25q?=
 =?utf-8?B?dmxmYjJaQ0lhSFE1WHF3Y0JQT2x2ajhmL0dhODBmZmlnU2FJM2lsVjhvTXFi?=
 =?utf-8?B?YmJFNU9HZDlhaXl0LzkyK29XdFREbU96Umd4cVhNYzhBMkVXaDd2MGQ0NHFG?=
 =?utf-8?B?RzIzRzRpZnFqbzFRcWZlTzJSa2hEVXdlRFMrRnpyNGVBMWRmSG41dGtSTWth?=
 =?utf-8?B?NmFIZm0yZ2QzbEViMElHd1VSSm14b1ZyeVY4WUdianJXODkxVE1JTURlMlVB?=
 =?utf-8?B?c2dERHQxUzA3Y0d6QTRNdDdONk1mMWROc0NJY2VNSmJnSld2QXlxdlRMYzQz?=
 =?utf-8?B?YmhLcG1Pa1ROaEIvWHAyd2w1cXo4K1QvMWZ3bFdxcmNIVVl3d29tb1RKYzlH?=
 =?utf-8?B?NmZHb2hlMHMxcUpJUTdQd05mVU9rRllnejJFUUErZ3c5TzJPZjJjQ2VMaGtv?=
 =?utf-8?B?MG5VTGE0VllzditpblNpNXdRRlQzZmpwQkg5c3lVSFRVRzY5SUJhQisyaDNI?=
 =?utf-8?B?WDRNUXNiTjhtM09vQ1VEUzZUcWZ3d2xTcDY0S3ovUkJXWUNENFhBamVrVTlB?=
 =?utf-8?B?SmhDVmc3QmFZV05JWTNhK2UrYWNRL3JPRGZ1OWVuZDcrdVU5ZVYxQllLMm1N?=
 =?utf-8?B?N3EvcGFGQ3VzS0Z3UXBma2NJUitaMHROajJGWXFycUtCeDFOOEl4dDZwd25u?=
 =?utf-8?B?RVNBRDFPeXFjTy9IREJNNUdzZ3ZUN0VSM2xSdHFVZmFXMkFSSmJXd2hVeWpD?=
 =?utf-8?B?S0UwNGJyY3NURWNZc3BMWVh2QzhpNytSU2pPYmg5bXltOVViU2NkTUFPeHMw?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCA511D9276ED3468C92625248D16B34@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 51145ae7-fe43-4f90-1f77-08db4592a47b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 13:40:32.9613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 650nH7rIP7t7K7jmEK1BdpsyFybMs1gG0VVoQDzzSYes+/2+kqsa0u6nw0xxx2LD4DqrqrfUVSCv+yPO0KLXsQS9nZ4OKEcpRNRMB1f/H/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2145
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, "lance@osuosl.org" <lance@osuosl.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA0LzIwMjMgw6AgMTM6MDYsIEpvZWwgRmVybmFuZGVzIGEgw6ljcml0wqA6DQo+
IE9uIFR1ZSwgQXByIDI1LCAyMDIzIGF0IDY6NTjigK9BTSBaaG91eWkgWmhvdSA8emhvdXpob3V5
aUBnbWFpbC5jb20+IHdyb3RlOg0KPj4NCj4+IGhpDQo+Pg0KPj4gT24gVHVlLCBBcHIgMjUsIDIw
MjMgYXQgNjoxM+KAr1BNIFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3Jv
dGU6DQo+Pj4NCj4+PiBPbiBNb24sIEFwciAyNCwgMjAyMyBhdCAwMjo1NToxMVBNIC0wNDAwLCBK
b2VsIEZlcm5hbmRlcyB3cm90ZToNCj4+Pj4gVGhpcyBpcyBhbWF6aW5nIGRlYnVnZ2luZyBCb3F1
biwgbGlrZSBhIGJvc3MhIE9uZSBjb21tZW50IGJlbG93Og0KPj4+Pg0KPj4+Pj4+PiBPciBzb21l
dGhpbmcgc2ltcGxlIEkgaGF2ZW4ndCB0aG91Z2h0IG9mPyA6KQ0KPj4+Pj4+DQo+Pj4+Pj4gQXQg
d2hhdCBwb2ludHMgY2FuIHIxMyBjaGFuZ2U/ICBPbmx5IHdoZW4gc29tZSBwYXJ0aWN1bGFyIGZ1
bmN0aW9ucyBhcmUNCj4+Pj4+PiBjYWxsZWQ/DQo+Pj4+Pj4NCj4+Pj4+DQo+Pj4+PiByMTMgaXMg
dGhlIGxvY2FsIHBhY2E6DQo+Pj4+Pg0KPj4+Pj4gICAgICAgICAgcmVnaXN0ZXIgc3RydWN0IHBh
Y2Ffc3RydWN0ICpsb2NhbF9wYWNhIGFzbSgicjEzIik7DQo+Pj4+Pg0KPj4+Pj4gLCB3aGljaCBp
cyBhIHBvaW50ZXIgdG8gcGVyY3B1IGRhdGEuDQo+Pj4+Pg0KPj4+Pj4gU28gaWYgYSB0YXNrIHNj
aGVkdWxlIGZyb20gb25lIENQVSB0byBhbm90ZWhyIENQVSwgdGhlIHZhbHVlIGdldHMNCj4+Pj4+
IGNoYW5nZWQuDQo+Pj4+DQo+Pj4+IEl0IGFwcGVhcnMgdGhlIHdob2xlIGlzc3VlLCBwZXIgeW91
ciBhbmFseXNpcywgaXMgdGhhdCB0aGUgc3RhY2sNCj4+Pj4gY2hlY2tpbmcgY29kZSBpbiBnY2Mg
c2hvdWxkIG5vdCBjYWNoZSBvciBhbGlhcyByMTMsIGFuZCBtdXN0IHJlYWQgaXRzDQo+Pj4+IG1v
c3QgdXAtdG8tZGF0ZSB2YWx1ZSBkdXJpbmcgc3RhY2sgY2hlY2tpbmcsIGFzIGl0cyB2YWx1ZSBt
YXkgaGF2ZQ0KPj4+PiBjaGFuZ2VkIGR1cmluZyBhIG1pZ3JhdGlvbiB0byBhIG5ldyBDUFUuDQo+
Pj4+DQo+Pj4+IERpZCBJIGdldCB0aGF0IHJpZ2h0Pw0KPj4+Pg0KPj4+PiBJTU8sIGV2ZW4gd2l0
aG91dCBhIHJlcHJvZHVjZXIsIGdjYyBvbiBQUEMgc2hvdWxkIGp1c3Qgbm90IGRvIHRoYXQsDQo+
Pj4+IHRoYXQgZmVlbHMgdGVycmlibHkgYnJva2VuIGZvciB0aGUga2VybmVsLiBJIHdvbmRlciB3
aGF0IGNsYW5nIGRvZXMsDQo+Pj4+IEknbGwgZ28gcG9rZSBhcm91bmQgd2l0aCBjb21waWxlcmV4
cGxvcmVyIGFmdGVyIGx1bmNoLg0KPj4+Pg0KPj4+PiBBZGRpbmcgK1BldGVyIFppamxzdHJhIGFz
IHdlbGwgdG8gam9pbiB0aGUgcGFydHkgYXMgSSBoYXZlIGEgZmVlbGluZw0KPj4+PiBoZSdsbCBi
ZSBpbnRlcmVzdGVkLiA7LSkNCj4+Pg0KPj4+IEknbSBhIGxpdHRsZSBjb25mdXNlZDsgdGhlIHdh
eSBJIHVuZGVyc3RhbmQgdGhlIHdob2xlIHN0YWNrIHByb3RlY3Rvcg0KPj4+IHRoaW5nIHRvIHdv
cmsgaXMgdGhhdCB3ZSBwdXNoIGEgY2FuYXJ5IG9uIHRoZSBzdGFjayBhdCBjYWxsIGFuZCBvbg0K
Pj4+IHJldHVybiBjaGVjayBpdCBpcyBzdGlsbCB2YWxpZC4gU2luY2UgaW4gZ2VuZXJhbCB0YXNr
cyByYW5kb21seSBtaWdyYXRlLA0KPj4+IHRoZSBwZXItY3B1IHZhbGlkYXRpb24gY2FuYXJ5IHNo
b3VsZCBiZSB0aGUgc2FtZSBvbiBhbGwgQ1BVcy4NCj4+Pg0KPj4+IEFkZGl0aW9uYWxseSwgdGhl
ICduZXcnIF9fc3JjdV9yZWFkX3ssdW59bG9ja19ubWlzYWZlKCkgZnVuY3Rpb25zIHVzZQ0KPj4+
IHJhd19jcHVfcHRyKCkgdG8gZ2V0ICdhJyBwZXJjcHUgc2RwLCBwcmVmZXJhYmx5IHRoYXQgb2Yg
dGhlIGxvY2FsIGNwdSwNCj4+PiBidXQgbm8gZ3VhcmFudGVlcy4NCj4+Pg0KPj4+IEJvdGggY2Fz
ZXMgdXNlIHIxMyAocGFjYSkgaW4gYSByYWN5IG1hbm5lciwgYW5kIGluIGJvdGggY2FzZXMgaXQg
c2hvdWxkDQo+Pj4gYmUgc2FmZS4NCj4+IE5ldyB0ZXN0IHJlc3VsdHMgdG9kYXk6IGJvdGggZ2Nj
IGJ1aWxkIGZyb20gZ2l0IChnaXQgY2xvbmUNCj4+IGdpdDovL2djYy5nbnUub3JnL2dpdC9nY2Mu
Z2l0KSBhbmQgVWJ1bnR1IDIyLjA0IGdjYy0xMi4xLjANCj4+IGFyZSBpbW11bmUgZnJvbSB0aGUg
YWJvdmUgaXNzdWUuIFdlIGNhbiBzZWUgdGhlIGFzc2VtYmx5IGNvZGUgb24NCj4+IGh0dHA6Ly8x
NDAuMjExLjE2OS4xODkvMDQyNS9zcmN1X2dwX3N0YXJ0X2lmX25lZWRlZC1nY2MtMTIudHh0DQo+
Pg0KPj4gd2hpbGUNCj4+IEJvdGggbmF0aXZlIGdjYyBvbiBQUEMgdm0gKGdjYyB2ZXJzaW9uIDku
NC4wKSwgYW5kIGdjYyBjcm9zcyBjb21waWxlcg0KPj4gb24gbXkgeDg2IGxhcHRvcCAoZ2NjIHZl
cnNpb24gMTAuNC4wKSB3aWxsIHJlcHJvZHVjZSB0aGUgYnVnLg0KPiANCj4gRG8geW91IGtub3cg
d2hhdCBmaXhlcyB0aGUgaXNzdWU/IEkgd291bGQgbm90IGRlY2xhcmUgdmljdG9yeSB5ZXQuIE15
DQo+IGZlZWxpbmcgaXMgc29tZXRoaW5nIGNoYW5nZXMgaW4gdGltaW5nLCBvciBjb21waWxlciBj
b2RlZ2VuIHdoaWNoDQo+IGhpZGVzIHRoZSBpc3N1ZS4gU28gdGhlIGlzc3VlIGlzIHN0aWxsIHRo
ZXJlIGJ1dCBpdCBpcyBqdXN0IGEgbWF0dGVyDQo+IG9mIHRpbWUgYmVmb3JlIHNvbWVvbmUgZWxz
ZSByZXBvcnRzIGl0Lg0KPiANCj4gT3V0IG9mIGN1cmlvc2l0eSBmb3IgUFBDIGZvbGtzLCB3aHkg
Y2Fubm90IDY0LWJpdCBQUEMgdXNlIHBlci10YXNrDQo+IGNhbmFyeT8gTWljaGFlbCwgaXMgdGhp
cyBhbiBvcHRpbWl6YXRpb24/IEFkZGluZyBDaHJpc3RvcGhlIGFzIHdlbGwNCj4gc2luY2UgaXQg
Y2FtZSBpbiBhIGZldyB5ZWFycyBhZ28gdmlhIHRoZSBmb2xsb3dpbmcgY29tbWl0Og0KDQpJdCB1
c2VzIHBlci10YXNrIGNhbmFyeS4gQnV0IHVubGlrZSBQUEMzMiwgUFBDNjQgZG9lc24ndCBoYXZl
IGEgZml4ZWQgDQpyZWdpc3RlciBwb2ludGluZyB0byAnY3VycmVudCcgYXQgYWxsIHRpbWUgc28g
dGhlIGNhbmFyeSBpcyBjb3BpZWQgaW50byANCmEgcGVyLWNwdSBzdHJ1Y3QgZHVyaW5nIF9zd2l0
Y2goKS4NCg0KSWYgR0NDIGtlZXBzIGFuIG9sZCB2YWx1ZSBvZiB0aGUgcGVyLWNwdSBzdHJ1Y3Qg
cG9pbnRlciwgaXQgdGhlbiBnZXRzIA0KdGhlIGNhbmFyeSBmcm9tIHRoZSB3cm9uZyBDUFUgc3Ry
dWN0IHNvIGZyb20gYSBkaWZmZXJlbnQgdGFzay4NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBjb21t
aXQgMDZlYzI3YWVhOWZjODRkOWM2ZDg3OWViNjRiNWJjZjI4YThhMWViNw0KPiBBdXRob3I6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPg0KPiBEYXRlOiAgIFRodSBT
ZXAgMjcgMDc6MDU6NTUgMjAxOCArMDAwMA0KPiANCj4gICAgICBwb3dlcnBjLzY0OiBhZGQgc3Rh
Y2sgcHJvdGVjdG9yIHN1cHBvcnQNCj4gDQo+ICAgICAgT24gUFBDNjQsIGFzIHJlZ2lzdGVyIHIx
MyBwb2ludHMgdG8gdGhlIHBhY2Ffc3RydWN0IGF0IGFsbCB0aW1lLA0KPiAgICAgIHRoaXMgcGF0
Y2ggYWRkcyBhIGNvcHkgb2YgdGhlIGNhbmFyeSB0aGVyZSwgd2hpY2ggaXMgY29waWVkIGF0DQo+
ICAgICAgdGFza19zd2l0Y2guDQo+ICAgICAgVGhhdCBuZXcgY2FuYXJ5IGlzIHRoZW4gdXNlZCBi
eSB1c2luZyB0aGUgZm9sbG93aW5nIEdDQyBvcHRpb25zOg0KPiAgICAgIC1tc3RhY2stcHJvdGVj
dG9yLWd1YXJkPXRscw0KPiAgICAgIC1tc3RhY2stcHJvdGVjdG9yLWd1YXJkLXJlZz1yMTMNCj4g
ICAgICAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZC1vZmZzZXQ9b2Zmc2V0b2Yoc3RydWN0IHBhY2Ff
c3RydWN0LCBjYW5hcnkpKQ0KPiANCj4gICAgICBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExl
cm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4NCj4gICAgICBTaWduZWQtb2ZmLWJ5OiBNaWNo
YWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+IA0KPiAgIC0gSm9lbA0K
