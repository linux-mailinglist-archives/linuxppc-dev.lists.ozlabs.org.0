Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 869315ABF78
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 17:12:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKdYw3WN3z30Ly
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Sep 2022 01:12:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GwAeuZbl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.50; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GwAeuZbl;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90050.outbound.protection.outlook.com [40.107.9.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKdY55DjRz2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Sep 2022 01:11:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eeh1TY+H4KiQkH75Y5qcsWNH0QsRBHyfyyCaFlNIIqyBXoyeQRdDAImkuXbDjHkwLnLl6SyMOhW5I4Zo8iOJoi5IMJrvENPM+C6eMS11Dn/XgVxID5Ii1atf33gVgm2GzGHmld3WF6Mi/L6D9WlcIicEowcYUn8aQzw3I69vxkzbmxL4/PPrycGtArv7OuSHA6OC3ShpKw4cR+CVVI41OzuoVYAsIM68mLWTjnQXMPdr1E3fFGz094x4ncYGeP8QZ7OUD7HjdC3ex5Df1S/pua6WcASDv+kMFO8ictbbnv2/+mBVOzuO1GnokYksnLDKktWyPZsLRbqGu/o3WLG2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfGx8cp1wNMTNPqR8Yh9hVGFlYkLQW3m4nY295onUfc=;
 b=izwvY5GGBG0nurUQjuGbX6ZVHoROsT++VbZKOyb3DAet8yZ5x6YzoQjZOq0ibKimUizEJlLtBNkkQmheqw4iqICQW4xi9rP2U3krQh/CcHau08RawmXAkZopKVXmOzZ96Zmka10RBmTggBo0zDIN32iWlAQ8Bk8w0U2eaX9SxZdNMhZWIBGrhnK0T+DOEmjUwxx6BlT4r+nXZEG0aqE1DJxGw0u/zQAnzI1oezs04q8thRyFz7uLr4HgWLyM1+b5Cwf0+j6nKxLQGWT/Dvh5xxrKL4rnxaQicK8GAWlR9EuAaX0a05nHp6vpz38hmQ3t6jZTSgmYkCqjiRPaYXwuPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfGx8cp1wNMTNPqR8Yh9hVGFlYkLQW3m4nY295onUfc=;
 b=GwAeuZblMl1+NeyJdLbGroNN1SABSlXB8kj+WgdYA3WIsnNSvA3hOX/W4LX7fRqD+BatllQ0PysrNRMy4S8c1nTpr8UCTwKyYfwMdzBDcS1oaZodf+kVn4GjwaYmELmuPpjx2yMv18Lq+urilJc/t25L+5p+4UeEcX6n08JIyV22VQNeq0xC1R9b43HtvirV/Y2zA1HUa+0yaipMXeDNYt1tRZa4ZkDcWFRv60EvL551sqAHj7b4fUW+oa1zPr31yMAuA5j3ieYRltVRSKKJKM/IauUqrq4Uv1CWApJJlCZ7EFfPK48+E+BrvKRt/Dx1T7Uu557G/uE6dfqV6Einwg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1914.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Sat, 3 Sep
 2022 15:11:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.017; Sat, 3 Sep 2022
 15:11:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/2] powerpc/mm/64s: Drop p4d_leaf()
Thread-Topic: [PATCH 2/2] powerpc/mm/64s: Drop p4d_leaf()
Thread-Index: AQHYv5HcjEm2kHPuo0OTQ8XJPugmMK3Nz8OA
Date: Sat, 3 Sep 2022 15:11:34 +0000
Message-ID: <4c607d70-6b1e-46d1-72f2-8bbf0fc40949@csgroup.eu>
References: <20220903123640.719846-1-mpe@ellerman.id.au>
 <20220903123640.719846-2-mpe@ellerman.id.au>
In-Reply-To: <20220903123640.719846-2-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e5ed2d7-193b-4a46-b004-08da8dbe9729
x-ms-traffictypediagnostic: PR0P264MB1914:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VbsIY97oCjh30WiPYPgqqyMREOGFielifUHCMQ1T8S4r0eIpa6mR/dsyNOTXEeuQjc3OZwN3khnIuPkvBZToFeIerHjrYdUX8StQDwtKPaiC2ucq1sQZehMzmWZD7tkHTAzijbaasroLAKK9+ZUYkvrYdPEYCM5ub4zyLbJ1db0qMETEXhW4/sTEUDQQuRrU8OJJcW5duxGtp5N5difZk2MRbTfwWMtKZmb4aDJhndImBs21Oq8LDtcp1lN5JHfdu9VdiV2z/7tXnL1Rvh+7AiBKWqVYwu4j7UJbl+2qXUnrlYIYj6eU2AoXYfUKpC+CAAMBwLbdLTiGxslaBqxLhZbKxZL5M8n2UfT4Aea6G6o5v79/8+kQ/LHKwGGBpeRZY2V1JkPAp5gi79ps3aRz43lZcCt/I+ChPl90WonFmqjRo51IJCbGsegItx2UwYh2IRb7sQ5UgPXFyGA1J06pjoO1eCBhCjfvE3gmZihWJ2NWSR+3ZI6IIJDMqgLNxBnXJg8DwtEjENyzQwve9J9twGc3MRMNVC8jeQ3N61jU8Pctgd5FoSNzLWst+M+2C3DxWJx2npD3csSfTuvyLWRK4WDDm+CiRiMcty9AIBz988P6LBpmNtaktaMxmMJulVvje0y+E+aX9QgvW7zpwAfrQjiGm8V3CEhcmnYMfCUaijE3mPOcok2U2UAyetlW82drxAY1R5juhPbX9s3/mo2riYargZhBCaN/xnSt2IiNnzXVQg/URxvBXB0fftpOu6zBeTeMYiT5yWhKHSjMcJ5AjPWTuK7Q9BGIzr1dfQ8TnudiKzClMnJdhmrfFe3wE80kS/FyFplOtf8fq8SqRnK6KA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39850400004)(366004)(478600001)(26005)(6512007)(2906002)(91956017)(66946007)(76116006)(66476007)(66446008)(8676002)(66556008)(4326008)(64756008)(44832011)(6486002)(8936002)(36756003)(41300700001)(6506007)(31696002)(2616005)(186003)(86362001)(38070700005)(316002)(38100700002)(31686004)(122000001)(110136005)(54906003)(71200400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SzlXdThGUFREYkRZSmZtVWo1ZDEwWW5sNytUZ25HcmpUL085c21iT296dFNx?=
 =?utf-8?B?bkJuaGVzc2V6c2N1dS9VMGdQR2poUWQ2MG1GN0hDd3FuVlZRTTlsbDhzRFhS?=
 =?utf-8?B?NGIrY2t4dEdpN2w0N2h3QlJqSDVOVzNrQkJuTU14d3N1dnMwZ2QwcFBEU2hl?=
 =?utf-8?B?cFRjdEt3ZndUNmIvbjVHMk01Zm5PNkVNSHZPdCs3KzA4ZDgwZENaU1Vsclhq?=
 =?utf-8?B?V081dVc0UURQazVmaWlaMVp3T1VTSllwVWJ2Z3czYzRrQTZaSnp3Wi9ueVlY?=
 =?utf-8?B?ek5QVUF1T3k5SEd3ODR2Vys3UGUydzhxMkc2TUhURGFzZXhSaFpiNUhTVlBk?=
 =?utf-8?B?REU0dDNyN1M3WkZFcFNXNlRxYk0yNG05U1Q0VnNZNGJMdk9IMVZvUldhc1Ru?=
 =?utf-8?B?c3BucEJNTHpwYzBhTmZnWnFTL1lhY0g2bFVONWJxQmVOd2llTG9EUWUvQ093?=
 =?utf-8?B?UVkwc1lVVzJCdTZrTk10NmlobGNseWlKZWFEWVNueFVxNitMRFVZeU1zdEFx?=
 =?utf-8?B?dUo2U2ptbmtHODBCYTVISWNPRDhUb1lYaDVGSS9wQnlZUFFhbUNwWDVoV3FE?=
 =?utf-8?B?UzVHY3ViQXlZR1k5YUdFTCtHTTR2cmxXSlR6cVZQNk53YjlWZ2p1bzd3bUFl?=
 =?utf-8?B?L1BYdGF5em5FUUFsbVBPNU1xY3YrTWx2bUY2RmNUVzBYS3FjamExZEZmUVpU?=
 =?utf-8?B?RFp3UjNPbTMwTnZuUk0zSzdhWjNCSzJVbmN4eWRWSjkxNG1qQ085c2FJN3hE?=
 =?utf-8?B?VjdSMUk5aUZhMGJiUnJwSjBHcGZsUmluSEdKNnRBVEhKUmdXWVVSZDJKR1RX?=
 =?utf-8?B?QVltK2ZWRkF2SHpLVzlWNWE0U2h5UlpOSksvZWJLeXpMK1lleExIaFpGWlVl?=
 =?utf-8?B?aEdMdDhlUFQ3dGtJTkdrMTFydGtNMVRmQVVGTGF4dWtJN3ZIdWtTM3Z5SVM3?=
 =?utf-8?B?UXBzaHMyTVcwWHV4UW5aUzVkZ25DaEExbzJhM0dvZld2b1JMVW1aZ0tNQVA0?=
 =?utf-8?B?WlRaOGh2aDRFenh2K292ZmcycTgrRVZ0YldEME9XUFZDZ2UvSzl0dS84ZTZR?=
 =?utf-8?B?MjFJcW1BaWRoUm5iUlU2MVFyRjFteTRpWVAweERtcTdia2lybVF4TmxIZk9Y?=
 =?utf-8?B?eDhQMUtZM2tiUmdUVHBUSTZXdy9iK0tpM1ZjaFpaK3lNRTE5RHU4Y0dZWTJk?=
 =?utf-8?B?RjljMDJ3M3p1SjRqZEYxSHo5b2wzOFpNeUc1bGt4a0N4NzRHZkdIVGtzVDM2?=
 =?utf-8?B?cE9md1RlUGtoS0srYXRaR3gvcFVrZWxtaWN6L2Fibk1Xcm90UUcwWTYxRGh0?=
 =?utf-8?B?V3Q4ZjRSUTBYUHQwcGhJTU13T2wrcmpIemRUK0tHRDNSWXViT0E3ZkJRWDNa?=
 =?utf-8?B?TzdJUnMyTzdrMXF5MERDeEVjUktrQ0d3dXVqaHNWNHF3bmhhN2I3MHBNS21a?=
 =?utf-8?B?TEZCRVE5cTZHRkVqUWQvTFhBRVVUZnZ6OFJtQUh3c1ZBQ2hLNXNZbFEzdTV6?=
 =?utf-8?B?M2c3OWNyN3pmZGR6enZidVAvWXJqSU1FakRHSFlQMUJleUh5UXc1K0lBUVhl?=
 =?utf-8?B?OWlSenhjMlhxNjhIZFEyUUpDVHNFOVN1LzV4M012UUNkVVV1ekV2eHU2cjNW?=
 =?utf-8?B?OG90c1owd0c2NzlrOWtnQk1aSUNBQlM3QlFxMUZHS09IWHQ2Q21rOWVmSTJC?=
 =?utf-8?B?Z2txOUFsODNUMld3OGtod01CRGc2Y0NuQThLVUc0UlIxcEY1ZTI1NHRwblVh?=
 =?utf-8?B?TDNBWXVTZkc5MWh3bXNWY2Q5NWsyaG9STG8xZjRNUnk5azBtMEF1TjlZS3Nu?=
 =?utf-8?B?SWY2RGJ3aG1yYjZvNHRoaDV0TVpBNmNjM29waFpkSDZpRkduZmNjU2VkN0ht?=
 =?utf-8?B?elFUcHVxaVhLalB0elhGYXNUd2JhT2FoSTA2Z2VxeFlITGIvYW40eFdGTG9E?=
 =?utf-8?B?OW10OWo1dnhrNmlFSlhoNlpIVDJRVGJyKytpWVVNcUdjTlhxWFF6clh0MjEv?=
 =?utf-8?B?WGdVeGJxZUhRNGJZRGdtNmQ0Njk1U04wTm5RcWdrUHFhRXN4eERQMWlRMzVW?=
 =?utf-8?B?QzV6Z2ZSa2pYQTZpdmJuMTNmWkUvengwaWpxQ1hkTU9PNnRTVmFpblFhVUhn?=
 =?utf-8?B?NWsxT0lxRUR6OGt5Zkw0RDA0clcrSXB3KzZEZkZ3elV0V1BadFB6L1kzU2Z6?=
 =?utf-8?Q?81sUIAhOiXEQuR5pdolZWt4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9EEA635D770454FA6F1F65F81E170E3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5ed2d7-193b-4a46-b004-08da8dbe9729
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2022 15:11:34.5585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BV3bT1/dayag8MBYAQZznMO8905sTz+rNOYigzn6HJ93xFZPdCB26l8s+DlSi/92sBH87e7OmKzUjEi0wCbNfjkSjqigqegPNQvsIgCKIaU=
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA5LzIwMjIgw6AgMTQ6MzYsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQmVjYXVzZSA2NC1iaXQgQm9vazNTIHVzZXMgcGd0YWJsZS1ub3A0ZC5oLCB0aGUgUDREIGlz
IGZvbGRlZCBpbnRvIHRoZQ0KPiBQR0QuIFNvIFA0RCBlbnRyaWVzIGFyZSBhY3R1YWxseSBQR0Qg
ZW50cmllcywgb3IgdmljZSB2ZXJzYS4NCj4gDQo+IFRoZSBvdGhlciB3YXkgdG8gdGhpbmsgb2Yg
aXQgaXMgdGhhdCB0aGUgUDREIGlzIGEgc2luZ2xlIGVudHJ5IHBhZ2UNCj4gdGFibGUgYmVsb3cg
dGhlIFBHRC4gWmVybyBiaXRzIG9mIHRoZSBhZGRyZXNzIGFyZSBuZWVkZWQgdG8gaW5kZXggaW50
bw0KPiB0aGUgUDRELCB0aGVyZWZvcmUgYSBQNEQgZW50cnkgbWFwcyB0aGUgc2FtZSBzaXplIGFk
ZHJlc3Mgc3BhY2UgYXMgYSBQR0QNCj4gZW50cnkuDQo+IA0KPiBBcyBleHBsYWluZWQgaW4gdGhl
IHByZXZpb3VzIGNvbW1pdCwgdGhlcmUgYXJlIG5vIGh1Z2UgcGFnZSBzaXplcw0KPiBzdXBwb3J0
ZWQgZGlyZWN0bHkgYXQgdGhlIFBHRCBsZXZlbCBvbiA2NC1iaXQgQm9vazNTLCBzbyB0aGVyZSBh
cmUgYWxzbw0KPiBubyBodWdlIHBhZ2Ugc2l6ZXMgc3VwcG9ydGVkIGF0IHRoZSBQNEQgbGV2ZWwu
DQo+IA0KPiBUaGVyZWZvcmUgcDRkX2lzX2xlYWYoKSBjYW4gbmV2ZXIgYmUgdHJ1ZSwgc28gZHJv
cCB0aGUgZGVmaW5pdGlvbiBhbmQNCj4gZmFsbGJhY2sgdG8gdGhlIGRlZmF1bHQgaW1wbGVtZW50
YXRpb24gdGhhdCBhbHdheXMgcmV0dXJucyBmYWxzZS4NCg0KVGhlbiBoZXJlIGFzIHdlbGwsIHlv
dSBhcmUgcmVtb3ZpbmcgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlIHdoaWNoIA0KaW1wbGVtZW50cyBh
IG5vbiAnYWx3YXlzIGZhbHNlJyB2ZXJzaW9uIG9mIHA0ZF9sZWFmKCkuDQoNCng4NiBoYXMgb24g
dGhhdCBpcyBhbHdheXMgZmFsc2U6DQoNCiNkZWZpbmUgcDRkX2xlYWYJcDRkX2xhcmdlDQpzdGF0
aWMgaW5saW5lIGludCBwNGRfbGFyZ2UocDRkX3QgcDRkKQ0Kew0KCS8qIE5vIDUxMiBHaUIgcGFn
ZXMgeWV0ICovDQoJcmV0dXJuIDA7DQp9DQoNClNvLCBzaG91bGQgaXQgYmUgZHJvcHBlZCBhcyB3
ZWxsIGFuZCBhbGwgdXNlcyByZW1vdmVkIGZyb20gY29yZSBtbSA/DQoNCkNocmlzdG9waGU=
