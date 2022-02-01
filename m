Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE944A5BA6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 12:58:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp3Nn120Lz3cQS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 22:58:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::626;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp3NH6G9Bz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 22:58:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIyhuZIXgyBaylhRsusgCNpZRy4wcpQ72MMbb2uY/xsT9/4cSYOmApJTq4bGOrE8n6t20FHN1wwExhb6HerUmWXyfP27Im/SnUZaLoP7Vy7jOtpiOrD8UQzDHTLSCBLxIFqPj4/2gnjazCe6e6BNsg7Dddfx2saKrtAgmZ/i3n90tZql9FjBLlWqbngzop0OzKvxu3GL2NcfFd8+6C8GByvrNzOhS90Tyeb2A3R7znh4fGRDPu+5jBwqSprq/JICsijsuRbASkBDcOUOYWWwFaBHohuNNK0g2p0XF1Cstmq9GsuzgT4LTBHwJDcOqztoyLM85M8ncyF5N259aChvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8AOpY1XqgEnNLUgrx0yw/JHCFlEeNeAZzaV8+eOn3k=;
 b=FMbYrPQdFg+HXk03fpfhKae6roca1YdPu7WKf36K8Z78+NuGvtNeLjGOrFX83TSPNXjk5dyOTk9VIBVnowrNbUCW84ZLkNqBWiXmCHJ4v8bDYjYbQDfp5sz8H6ogE5VF3AIlUJzKfQAxT+JexTNeQkFBKGjNVBWNaZKujSCEEiEQDXI724No1b2ZblgVbsD5THfyO7PesTgwO3aPcvOa+dywE6Ftv0+rnWPzGpEsxxDxWk63UXUYpbVRXGp0s2uuBtKnl5GqdigQ0zfwJnWZ63OkR1FNfMfumwQq4TLgaJL56OuLz9hqncZ32f/RlHjvz2MzNUM/zs65Cu0A3rK72w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2647.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 11:57:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 11:57:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] powerpc: Fix virt_addr_valid() check
Thread-Topic: [PATCH v3] powerpc: Fix virt_addr_valid() check
Thread-Index: AQHYE7IubZGX/TJzNEu385KbWjPcjKx+nnMA
Date: Tue, 1 Feb 2022 11:57:45 +0000
Message-ID: <17b1fca7-bb83-fa53-32ac-56b3bf45944c@csgroup.eu>
References: <20220127123754.77825-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20220127123754.77825-1-wangkefeng.wang@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cf8c7a4-48b0-496e-2741-08d9e57a0f64
x-ms-traffictypediagnostic: PR0P264MB2647:EE_
x-microsoft-antispam-prvs: <PR0P264MB26475F399CA4FB9CDCF4DEABED269@PR0P264MB2647.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZsIruLBzGcGzRyZx9RVDf5jP9XqvUDU8psFOgrtv6V14mnvlab+aIloBf+ciLAq0EEhGfU6elK2ziCneBc17Dlump2a3lO/9CMSLPQj93csjTy2QZOYX7kpv8/alGwxuiYWVwUnDo/oNCYvsoWHsbGRLkou+sB8C1HhLqoWR9M1SBR/IT045ltQBImejSWtnjUufFP7j7Tmkc1UD5wjLYD9PcH7+XtwJPyDnDPR34/Ae9E09Jr03c0Wg/94ptOEp7MSNxV9DsOSRw8w0ZpgtpObDwMn+RoXT5N55DzUXSjVsOpz6gvL+Cq01k2rjuFhQPVFuhKTmQr7L77W27s5WdBtriU5iGSUAfpZd4H8ywBN4ke297Kl6WO2awRNErUBkZY/uiqpQrL1D9kPDJ7yD+Pbd9dhTiQcFJDvhrVa8OyyhYGMEE4weh/ejTc0Ontip7asIbV8G1i2vZ8XW53TQHTjevU82+E1/hivFBhlbKVY8HTRSYpzs7auahNDy1NrE0l8ZPT8Wa1+FhZmywFD9s71sCUzu6mkyoO1pn62AbvqEF9UveLcR6nIvPK5TIgfVkwGALWvkZlGqTBJXQo3CFa1Oxq2JyIbr+Ts+NfPjQ/Gwf8QN7y9/FeE3k7aNOi6ONKHiId6TmqHt9lEq8042CZ9iXC22wquwqPMHuelwY2MiYeWFNGE9XFE/NjxegAO9lbK5aYjlhetpa1+wpUFgZrtPfruLNz9k4CacZSxjw0ztudbBhNkzfXuwWH3s+IgNY4vstOZHy2a0waFt8lUqqg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66556008)(76116006)(91956017)(71200400001)(4326008)(8676002)(38070700005)(66946007)(64756008)(66446008)(38100700002)(6506007)(5660300002)(8936002)(44832011)(122000001)(508600001)(6486002)(186003)(26005)(110136005)(54906003)(31686004)(2616005)(86362001)(2906002)(31696002)(6512007)(36756003)(83380400001)(66574015)(316002)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFR5SGxIcGFrNkcxenNpVWh0L1l5azlDbXZ4QlJoVWtuRlRMZkZUTGVkbDJm?=
 =?utf-8?B?ZmxVUENVa1dQdWdSWStCYWUxZlI3QzkwOWlSbmxOWklwZStiVW9mMUxXUUg3?=
 =?utf-8?B?dTA4cTU1N0pGY2hsZGloMDFCRWJYM0FJWEFrYVN1Vnc0eE5peU5BR3JYeE1Z?=
 =?utf-8?B?VEF2ZTV2R1V1RW9MSHo5WE05S3dURCsveGlYbVorWVlNR1JKTjVvMHlLWnRo?=
 =?utf-8?B?V0dzRFZRNmdGbkExYUVEb3NLZWJZdEt1ekdselY3cE1OQVQ4bjhsK1F1YXZh?=
 =?utf-8?B?Vmo4azN5YmV2TzZ5TWF5UTBQekIxNXZKQ21IMGpZVzNqK0VyQUJVVktSbkUy?=
 =?utf-8?B?ejExTnM4eXA4Y050Mi9RM2pzdzltY2xjSk5SQ2gyeUwrbHZkb2RCSFJHVmlk?=
 =?utf-8?B?OHVQelREZFdIVE5ZR2QyNTFUUENERUNqcXNaTVdhV1paWFhkYk5Pa1BkQXkz?=
 =?utf-8?B?bjFlY2I3MlQyYURnL2tvNDN3UDgxUDhvektsVk9qMWtsRVBCU0dIYjN3VzUy?=
 =?utf-8?B?Uk4wRHhwdmVQSHdxU0Z0OUFsRG9zK3B2MUUvK3ZpZkNwV01UNDBJSDlOTWV5?=
 =?utf-8?B?MU56VEYyNDUrMTdENGNDT0F5MmZEeDhHWWg3M2gyMWtWUU8zWGRacFVrZEly?=
 =?utf-8?B?ZHcwVGVZbWZINWttV1Qyc2s3TWJKOTAxbFhLYk1xR0JvOWVPNnZYeEc5SzAr?=
 =?utf-8?B?ZmJjOXZyNUdCS0lUVWdOaU9ad3V4Vk1qWVlHMWVubjdKak91MCtPb0doVXk4?=
 =?utf-8?B?bDB1RVJrNmFyRjV3MDI2cVF2M1ZiWmMveWdvU2N6QmdYbFpZWXVlRTJRSDdl?=
 =?utf-8?B?YU5FckttODV0UWxZcUt4cWZTRGxtYjFwOCtMMFlmYXhicWxVWUcwOHEvbFpa?=
 =?utf-8?B?M1NoQmpPeGJ1RTZkbkJOTG9PZFYwWkUzUCtLNGpxNkx5NHg0dXBuK25MNlFH?=
 =?utf-8?B?T1NObktYak9FMTBwd2pubXkrb05iVWxjZ2c2alVzNUZPbjhucXFyMUpZMnZ1?=
 =?utf-8?B?Q3lTL2tLTzlza2ZraDUwSGhJeG9RRGJFWklaNEh3eVJBVVBsV0x0TEpwa0pn?=
 =?utf-8?B?aFIxSmNQTGxTT3RMN05PamFNd2dtSUtkT2ttUnFlT0VhZk5DZ0xjT2FOYTJZ?=
 =?utf-8?B?SXQ1K0tJQTVHSlBvS251THBjVFRLNWVwaGpPVkVwU28wc0NLZ0RZRHlucnJ4?=
 =?utf-8?B?b0JObkhoRGpvRnAxTnNVRGltWUZBWkd6cWZUNmtmTExkYnUrMTFnRUxwRksy?=
 =?utf-8?B?MXdMdHppQS9YVHU0MmRPTVNNSUlyZkdJRVF4bEVtSkdPdjZLdGdMTEdnTDhY?=
 =?utf-8?B?S1NyL2R6YlMveTN6dndveDltdWc3dWpHaWtwa3ZQV0tnVnVMQlFHYzJ4YUtP?=
 =?utf-8?B?OUZqcDk1UHFqVit4aTZLQ1Y3MzRrWlhlOUZSSVhNRnBtUVJHZDlEM1B1U3BL?=
 =?utf-8?B?WFByVHlBc2xwVEQ0U2lDdzN5UmJmQ1ArK3lWdklJR0tBdkNlUGhTK05ITDFl?=
 =?utf-8?B?OUtoYWR2bHE4bk9TZ0dWT3BrTjVTNTI5MHZFcGZRcVh2dlRVR0dhakwxaDg4?=
 =?utf-8?B?MW9DNjhmdzZ1MjI5YVExMnBhenMxbnVKVEtSNytOb2EvdE5IV2JIbEdacEx0?=
 =?utf-8?B?ZVpxVVhMRVo4LzkyUFRDWm5hVGdwR2FINk1JRnZHcHgzQ3FlUlFoOWNIUDRO?=
 =?utf-8?B?a3R3REMxenJXMzFuWXR1aDNOSzdYWUhONjA1NXBvYTNhbUpyQW5CNFpoSjFl?=
 =?utf-8?B?QmtTL29SMGtLWG9kWW1DYjkrY0NLNU5rUXBrK2hpVUwyQlpqN2tTU3NzTDZ6?=
 =?utf-8?B?QVN1ODUza0c5RDF5VGcvSHBERDJNcjVrVHJrNVBXUnAwbnNNeW9JRHB1YVBS?=
 =?utf-8?B?eDFST2tncXZUVEQrTHFrV2Q0Z1RTY0xzU2ZVT3RDdFY3YnU0SDV0YlZUQzVt?=
 =?utf-8?B?aWRHS2NNNzdWUlcxU0R1ZEVrZGlGajVXYkozOXdaUTdjWWh4Q2hoNGpyYXNm?=
 =?utf-8?B?OTNucm1vRzhtQUQwSmdFWGIzY2pSbVpUalE0WFhrcEZLaDkzaG5td1p2L2RU?=
 =?utf-8?B?R080WHlmOCtSWXV0SWc1L0NpR3RFMXJXT3d1NlJQKzg3TGJLQXd0enlDNUNL?=
 =?utf-8?B?TUd0VWU0cUc5Yy83TnJPTU16SWQyNmpzUXdZMVNIZUZ0aFoxallqOEtsQmk5?=
 =?utf-8?B?L0tPTlQ0anNxWkZqREtTMzRSaDJYZVhWR0VvRkRZRGsxWGlRSjlkYk9zbFpL?=
 =?utf-8?Q?qnzjfBdG9TxCD1diiXhGiE49YKAcjVfqrThRTleEd4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA2A6832C34DCB48AB59B087E62F3D03@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf8c7a4-48b0-496e-2741-08d9e57a0f64
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 11:57:45.6159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mi0WB+7N8MppCUr6GsB0hdghCUL7rTf+5LBElbbHdogs7U4pZ3XLDahFyBscA4HuG16M42wMMmKrLT5VbSE1yFgQ9ipyX7M9RN+hjpp1ttk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2647
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzAxLzIwMjIgw6AgMTM6MzcsIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IFdo
ZW4gcnVuIGV0aHRvb2wgZXRoMCBvbiBQb3dlclBDNjQsIHRoZSBCVUcgb2NjdXJyZWQsDQo+IA0K
PiAgICB1c2VyY29weTogS2VybmVsIG1lbW9yeSBleHBvc3VyZSBhdHRlbXB0IGRldGVjdGVkIGZy
b20gU0xVQiBvYmplY3Qgbm90IGluIFNMVUIgcGFnZT8hIChvZmZzZXQgMCwgc2l6ZSAxMDQ4KSEN
Cj4gICAga2VybmVsIEJVRyBhdCBtbS91c2VyY29weS5jOjk5DQo+ICAgIC4uLg0KPiAgICB1c2Vy
Y29weV9hYm9ydCsweDY0LzB4YTAgKHVucmVsaWFibGUpDQo+ICAgIF9fY2hlY2tfaGVhcF9vYmpl
Y3QrMHgxNjgvMHgxOTANCj4gICAgX19jaGVja19vYmplY3Rfc2l6ZSsweDFhMC8weDIwMA0KPiAg
ICBkZXZfZXRodG9vbCsweDI0OTQvMHgyYjIwDQo+ICAgIGRldl9pb2N0bCsweDVkMC8weDc3MA0K
PiAgICBzb2NrX2RvX2lvY3RsKzB4ZjAvMHgxZDANCj4gICAgc29ja19pb2N0bCsweDNlYy8weDVh
MA0KPiAgICBfX3NlX3N5c19pb2N0bCsweGYwLzB4MTYwDQo+ICAgIHN5c3RlbV9jYWxsX2V4Y2Vw
dGlvbisweGZjLzB4MWYwDQo+ICAgIHN5c3RlbV9jYWxsX2NvbW1vbisweGY4LzB4MjAwDQo+IA0K
PiBUaGUgY29kZSBzaG93cyBiZWxvdywNCj4gDQo+ICAgIGRhdGEgPSB2emFsbG9jKGFycmF5X3Np
emUoZ3N0cmluZ3MubGVuLCBFVEhfR1NUUklOR19MRU4pKTsNCj4gICAgY29weV90b191c2VyKHVz
ZXJhZGRyLCBkYXRhLCBnc3RyaW5ncy5sZW4gKiBFVEhfR1NUUklOR19MRU4pKQ0KPiANCj4gVGhl
IGRhdGEgaXMgYWxsb2NlZCBieSB2bWFsbG9jKCksIHZpcnRfYWRkcl92YWxpZChwdHIpIHdpbGwg
cmV0dXJuIHRydWUNCj4gb24gUG93ZXJQQzY0LCB3aGljaCBsZWFkcyB0byB0aGUgcGFuaWMuDQo+
IA0KPiBBcyBjb21taXQgNGRkNzU1NGE2NDU2ICgicG93ZXJwYy82NDogQWRkIFZJUlRVQUxfQlVH
X09OIGNoZWNrcyBmb3IgX192YQ0KPiBhbmQgX19wYSBhZGRyZXNzZXMiKSBkb2VzLCBsZXQncyBj
aGVjayB0aGUgdmlydCBhZGRyIGFib3ZlIFBBR0VfT0ZGU0VUIGluDQo+IHRoZSB2aXJ0X2FkZHJf
dmFsaWQoKSBmb3IgUG93ZXJQQzY0LCB3aGljaCB3aWxsIG1ha2Ugc3VyZSB0aGF0IHRoZSBwYXNz
ZWQNCj4gYWRkcmVzcyBpcyBhIHZhbGlkIGxpbmVhciBtYXAgYWRkcmVzcy4NCj4gDQo+IE1lYW53
aGlsZSwgUEFHRV9PRkZTRVQgaXMgdGhlIHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgc3RhcnQgb2Yg
bG93bWVtLA0KPiB0aGUgY2hlY2sgaXMgc3VpdGFibGUgZm9yIFBvd2VyUEMzMiB0b28uDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+
DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3Jv
dXAuZXU+DQoNCj4gLS0tDQo+IHYzOg0KPiAtIHVwZGF0ZSBjaGFuZ2Vsb2cgYW5kIHJlbW92ZSBh
IHJlZHVuZGFudCBjYXN0DQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhZ2UuaCB8IDUg
KysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhZ2UuaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmgNCj4gaW5kZXggMjU0Njg3MjU4ZjQyLi5hOGEy
OWEyM2NlMmQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYWdlLmgN
Cj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhZ2UuaA0KPiBAQCAtMTMyLDcgKzEz
MiwxMCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcGZuX3ZhbGlkKHVuc2lnbmVkIGxvbmcgcGZuKQ0K
PiAgICNkZWZpbmUgdmlydF90b19wYWdlKGthZGRyKQlwZm5fdG9fcGFnZSh2aXJ0X3RvX3Bmbihr
YWRkcikpDQo+ICAgI2RlZmluZSBwZm5fdG9fa2FkZHIocGZuKQlfX3ZhKChwZm4pIDw8IFBBR0Vf
U0hJRlQpDQo+ICAgDQo+IC0jZGVmaW5lIHZpcnRfYWRkcl92YWxpZChrYWRkcikJcGZuX3ZhbGlk
KHZpcnRfdG9fcGZuKGthZGRyKSkNCj4gKyNkZWZpbmUgdmlydF9hZGRyX3ZhbGlkKHZhZGRyKQko
ewkJCQkJCVwNCj4gKwl1bnNpZ25lZCBsb25nIF9hZGRyID0gKHVuc2lnbmVkIGxvbmcpdmFkZHI7
CQkJCVwNCj4gKwlfYWRkciA+PSBQQUdFX09GRlNFVCAmJiBwZm5fdmFsaWQodmlydF90b19wZm4o
X2FkZHIpKTsJXA0KPiArfSkNCj4gICANCj4gICAvKg0KPiAgICAqIE9uIEJvb2stRSBwYXJ0cyB3
ZSBuZWVkIF9fdmEgdG8gcGFyc2UgdGhlIGRldmljZSB0cmVlIGFuZCB3ZSBjYW4ndA==
