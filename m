Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A14776071
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 15:18:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ID0vCL4M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLVx45BnSz3bT8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 23:18:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ID0vCL4M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::602; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLVw65z1wz2yGB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 23:17:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAp2EW9xew88VQxwDLSvz8tlLWb8uO/3LlsQKjaagnNmFFncsmcgNLVUtF2YzR7tHlCCrcU7hkRon0zgA2axOSGF/tiZt4pTM6ZC4BY6z5+yA38IrmeDjTo0Jhn9eiJeWI51CqyVKzj4dGTrm8QFMdRLCHb73tjeca5hncb7D6DxQb6NBr9YIj7geiHXFftkjJu7alr/DweqklrbY/ywSxKO0OS+kYR1hom6SDnB+LYvz6Awg4pXdgHaTJF8xb+aeWXF9mQZ+fiWKrGLAp1uOclhCG0d3f65BJczBq9ovgFmxh/Y1MA9q93pYjQF7cYTTtpg8fnrA0aaoN24fUYwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCi4jmu62xrfgUo9jmzwDJQNyse4nR2WOya2N5YhEpg=;
 b=ACfhKGZ0N7fETiAkm4t1BpUuU65hAsy7rBkK7glvlqqYRjv3u/Yt+XbaMvLPDz3ceXRpXrr/nSguLwUvKwYGgsEvqUPn2ZZndC0DwR/tRePe6QQ+Yt4vXlqst/6+/si4JlmpWdj3c1qWwfI+S3SnWRQLE+vHq3tYmeHjDQ437ibf7I0OO+IM1HUc+l1cWWX6hzJNmOWSgTJdBY4PnEpyHVqstYRzMRZDf2SYrChNRD9qwAHeBbE7yfk+ln2t2vHNkeVUNQYoeQffzWHTmxINQRUq7RXCFqvH+XcKqJMVNUsR6B9Dsa2+Mn3pf8+AAA63Dg6Y6/tvGJTcyaFzSNhoqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCi4jmu62xrfgUo9jmzwDJQNyse4nR2WOya2N5YhEpg=;
 b=ID0vCL4MkmBDprTP4ojTRXJjxgX+0JxOlxAqMPJ62AFF0gg+TTY4AUB3cW0qyrI50s0KpudrUDMtB3s3J4sjMM3Hfe6ubAAfl8DuvkuXHA2mPEU7Wj4/ZWhA2LyZgpbWlo9wm+JgEjX7BUJsXDYVfu8A5XlA/7z/g0ycxsnqyNehgTscZxcoy61dYdqMGM1kTl8LnH0vDXa2G+uE/6Gy77uUg4NS1TVwDF83DQpWj9ZWNMGOckTj1izskZ9ZZs8pjeBBHjWYrxVspUqgf9ZbrzeAts4HtUZNc+gvuBLc0W/HyNaHJ+JXWRAX517qZTALOephTWV8m79PARHYsEEvGQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3389.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 13:17:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 13:17:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc: mark more local variables as volatile
Thread-Topic: [PATCH 1/2] powerpc: mark more local variables as volatile
Thread-Index: AQHZysLik2jSorxJoEa1cRJ1fMiL+6/h8gsA
Date: Wed, 9 Aug 2023 13:17:02 +0000
Message-ID: <66ca8677-6a8d-c2f6-f215-a49ae7248458@csgroup.eu>
References: <20230809131024.2039647-1-arnd@kernel.org>
In-Reply-To: <20230809131024.2039647-1-arnd@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3389:EE_
x-ms-office365-filtering-correlation-id: e157a5e3-b9b4-49a7-2b11-08db98daeb91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wEaS+CrIF5z1qCsBdt3vAyeuUC1FurM+KV7EldCPrXfwdA36cChX42bvQl5jK9OwToMZzXZ3AQzWQ5ucnYbKodQFgoXNZl6PjKFhikHScwjetZvYe1WXKjNGoEi4sdsbpcEbt0bp2P8XzWdPxmj4ha3sCEGN1GiD91BKCSotFWrh6A4FkZ+6BlroYTvFcWCOurZzgGH/4YNtU//Jti8TSvkaMM2LkJpN5JBlFntC4tRUBJP8Hux3CsYHzq6rWbm5x7y7eXDnWCDdXpu8M1MA3J2WWiN5Y9cuefOcvBYyEvIXeLha8BFLpf7EjxTq0XIsZJQyAh7I0Siuzf4dxVD/f95FeSfgpffBA92mDttuDCOyEvufYLputXkvvdoO/ppXlTxpEwfPbvcSFoU0sz0c/bcu5Uz+E+slTwnSKhJ5UNb8V/zB+1HucWwCaYjOBAKO6JJUt5auy1+1NxdjPPHBZZMZuZHTRJ/oTGLQL0jQfyJEBNB9dQ00EScZHq2+wIp+irS9a6+RqOjqEvsxN8hna7YENMc0z9UrMJMIXqDoDGTS7J98FTYNX/7/XNwPtMKeG4xndnIbdRfiYj1ePT2Ft7uLUDbog5C63cuTlNNDS0f27jnZRILOEf9Ky/Q6h6T7dm5vKD47Mpu75MKmRIj7WSLr8+oFSY0gfhtK7ygHK84=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(346002)(396003)(39850400004)(451199021)(1800799006)(186006)(316002)(31696002)(2616005)(31686004)(66574015)(71200400001)(41300700001)(2906002)(83380400001)(86362001)(38070700005)(5660300002)(8936002)(8676002)(6506007)(44832011)(26005)(7416002)(66476007)(91956017)(110136005)(966005)(6512007)(54906003)(6486002)(66946007)(122000001)(66556008)(64756008)(66446008)(76116006)(36756003)(38100700002)(478600001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MXFUeFpxRVNINGVFMVE3VnFTbkxGS01XaDV2dXBhU2dUbkFTNThneWd3Wi9K?=
 =?utf-8?B?L1FTSnBsWUl0MDVGa3VXWEJHU1lLR1ZpY1RMMWVXaEFFKzU5UTgybUY2bDQw?=
 =?utf-8?B?OGx3Ny9GTVFacER4c0pYNUlKSTl0ZUlaZWE3N1dRUjgvT0NZYVE1YVpVRlVL?=
 =?utf-8?B?L0Z2eityRlA4clA4QkRUeks0ZStNZlpXencvOFFCMThSNXE5ajd3S0lmQWFN?=
 =?utf-8?B?Q3RlK1lqNDFPMUd2b3BYWVFBcEh1TkNSN041ejIxbkVnVTBQODByZytPZWZZ?=
 =?utf-8?B?elVSUTZPWmVRaHN4WGl1YmU5b2l2WksxSGN1VHdpSmtXdHNtbGFvdzJXcGlz?=
 =?utf-8?B?cFdYV1V5c1hpcVpQbFhIYzE3VWpGKzlxaTN6bWNmdWRCV3ZkWHhXam9VbEtW?=
 =?utf-8?B?L3hLZFBqVjBJc1dYREVRWk1Fa0xxVDdRR0hHc1RTYkdwTUxCWDdZQmZPYjBr?=
 =?utf-8?B?cDA2andQTUJTNjdLRjFCZERrNGJyNkwyZWpsQnF4d3Z1SXhpeXk2KzdhZjkz?=
 =?utf-8?B?cndIRHV0WlcrU1hUQ2piTVNzeDc4Q2pYZVBWa21TdGhCV0hycEtRSWtLb01v?=
 =?utf-8?B?V0FSV2wyV0ZJNHJNcVgvWGt1SEt5SHFKLzR1eXF0dHNTODJRRUQ1Kzg5WnBP?=
 =?utf-8?B?VXRBVmNrZ0hNaGwxTzBqWk9HZExHL3h4dkJQalZnZlFHWE9wUXNpaHRWNGlN?=
 =?utf-8?B?RFdhSGtNZnZSckZ0SnYrbHA1NStSOW14WDNxamM1cGtJNGthZ1JPZHpVSSto?=
 =?utf-8?B?ZXNvZ0ZZVXNjMEgvUCtqeVJCUG5DeURJeUc5czFOUDB0WWZFL2pBM21HaWF0?=
 =?utf-8?B?Sy9lOEhJM09ZSnMzVkJ1SkJYYS9aRThjVVYyLzlEdmVJS1BhRW1ROTJyemlF?=
 =?utf-8?B?Mk9YWWl5ZkdmRVZod0VLWEtsVitGcTM3Z21PNy9KNUZiMzVKWEZWM0NHUjNj?=
 =?utf-8?B?NlJXODNjbEZ6VjEweFBubnRGaStTeW5DVWZqQXY1SFN6MVA4M1p1ZHV3MllB?=
 =?utf-8?B?QXJTOXpoekVjeFRtd0V1YTJRcXJZQ0Y0ckZQZE1LSkdQUzc1S2RVUWREakU4?=
 =?utf-8?B?MVhoeng5Vk5abkJGNm42VGcwV1Njd2JmcXdabGwxUktMVllkQXMwNnRYdXl5?=
 =?utf-8?B?TDdxb1BQcTZuZUZiOUJKQjRNZXNPM2NUUXhlcitoMElmUjZHSjlsU3M2L3Bz?=
 =?utf-8?B?K2I3NmZEejVVSWRPZC8zWFZFTXYrVEQ4L0RqUnNzOFN4cG1oeGovTFlXRWRH?=
 =?utf-8?B?UnlNOUN2NEZhcm50ei9mdVlsbXlYc3diaDY3ZXdvdGk1b1hLS0kyOEpiVm15?=
 =?utf-8?B?V0dmd0p3MW4vWUdGTW5hS3A1MHhXSEdHUU5KQmNNZkdEcjQ1TjdlMVF0MHU1?=
 =?utf-8?B?TTVIM29TVEs4NEQ1WUZYQk5xcis2K2l6Q2FEbGxHSnFKN3Q4K2Q1UGJjdzFJ?=
 =?utf-8?B?V1Vzdi9hSEVsOWZGdWhUam93dXNEV3BzVklQcXRKa1VxeklEV0V2b0ljREx4?=
 =?utf-8?B?UGdlUzh3NUV1bUZWV0ZtMURWdnQwZDNLSEdwWnpvL3Nhc1pTajVQUzh3Vjdx?=
 =?utf-8?B?Zmtma1pwWTNpMzBUUVZHUHp0WWlCUVdienZ5azBVQUdNVytkUGpMU3lTODVJ?=
 =?utf-8?B?YnpVK3ZyK2FUNVRxblBLTWRTaVZKdCtrdTBTZTlHVG1JYXZpUXllSmVUem9w?=
 =?utf-8?B?YnNud013K2hRUDNucXhFUTBWcDY5KzJkUmI1U0x6b2ZiSHNIM0x4OEFLd2R2?=
 =?utf-8?B?NmRoZDRRZ2EvTDd2bUFyZFdKSHM0M2VzSWhXbWZmTkVFZklIOTExQThIOU5H?=
 =?utf-8?B?VDE4MldUaW1Zck5KamlpS3VFQUhPbUhQbzI0S1NrV0gwYUdJZ005ZTNXcmdu?=
 =?utf-8?B?RHN1RDNVdlNkbjE4TGF4N1RpYVpuTjF5QjduWmhEVWNjT3oxMXFXaktsVitT?=
 =?utf-8?B?b3ZEb2c3ci95SXFBcWp1MG41MzRnenBUWloyOEZxcTFiTFlRb1RIVEluY0N1?=
 =?utf-8?B?ekM4bkl5NFVZZUhJL3kvK2lvNTZqMXczWFFjMHd2emNoUmhCeHRHdS9wZHAr?=
 =?utf-8?B?dnpnZUxHb1hldVBRRjlOUVFXM0dIaTdQR0pxRmJqSUYxMXlOWURGd01qQ2xp?=
 =?utf-8?B?TEtTa3RUNVo5NkhzNy9Tc1JvZVFWWHZvVnQzT0hVWGhNQ2FHVVNqZDNlZ0xo?=
 =?utf-8?B?U0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B559D4EC90E404D965718AFC1B772E6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e157a5e3-b9b4-49a7-2b11-08db98daeb91
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 13:17:02.5167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23XWn+R1eF9AglvZTyzNPxJbCP6rALS3H7KF5l/UdgO2ONbCjCgrxZiTozGK1H8mGhJ+wbhlkvnnOAfEVIQ/4TNjHJnx0xP83S7EyTmgSxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3389
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Hugh Dickins <hughd@google.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maninder Singh <maninder1.s@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA4LzIwMjMgw6AgMTU6MTAsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
RnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gDQo+IEEgd2hpbGUgYWdvIEkg
Y3JlYXRlZCBhMjMwNWUzZGU4MTkzICgicG93ZXJwYzogbWFyayBsb2NhbCB2YXJpYWJsZXMNCj4g
YXJvdW5kIGxvbmdqbXAgYXMgdm9sYXRpbGUiKSBpbiBvcmRlciB0byBhbGxvdyBidWlsZGluZyBw
b3dlcnBjIHdpdGgNCj4gLVdleHRyYSBlbmFibGVkIG9uIGdjYy0xMS4NCg0KU2hvdWxkIHRoaXMg
YmUgZXhwbGFpbmVkIGluIA0KaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvcHJvY2Vzcy92b2xhdGls
ZS1jb25zaWRlcmVkLWhhcm1mdWwuaHRtbCA/DQoNCkNocmlzdG9waGUNCg0KDQo+IA0KPiBJIHRy
aWVkIHRoaXMgYWdhaW4gd2l0aCBnY2MtMTMgYW5kIGZvdW5kIHR3byBtb3JlIG9mIHRoZSBzYW1l
IGlzc3VlcywNCj4gcHJlc3VtYWJseSBiYXNlZCBvbiBzbGlnaHRseSBkaWZmZXJlbnQgb3B0aW1p
emF0aW9uIHBhdGhzIGJlaW5nIHRha2VuDQo+IGhlcmU6DQo+IA0KPiBhcmNoL3Bvd2VycGMveG1v
bi94bW9uLmM6MzMwNjoyNzogZXJyb3I6IHZhcmlhYmxlICdtbScgbWlnaHQgYmUgY2xvYmJlcmVk
IGJ5ICdsb25nam1wJyBvciAndmZvcmsnIFstV2Vycm9yPWNsb2JiZXJlZF0NCj4gYXJjaC9wb3dl
cnBjL2tleGVjL2NyYXNoLmM6MzUzOjIyOiBlcnJvcjogdmFyaWFibGUgJ2knIG1pZ2h0IGJlIGNs
b2JiZXJlZCBieSAnbG9uZ2ptcCcgb3IgJ3Zmb3JrJyBbLVdlcnJvcj1jbG9iYmVyZWRdDQo+IA0K
PiBJIGNoZWNrZWQgYSBidW5jaCBvZiByYW5kY29uZmlncyBhbmQgZm91bmQgb25seSB0aGVzZSB0
d28sIHNvIGp1c3QNCj4gYWRkcmVzcyB0aGVtIHRoZSBzYW1lIHdheSBhcyB0aGUgb3RoZXJzLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gLS0t
DQo+ICAgYXJjaC9wb3dlcnBjL2tleGVjL2NyYXNoLmMgfCAyICstDQo+ICAgYXJjaC9wb3dlcnBj
L3htb24veG1vbi5jICAgfCAyICstDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tleGVj
L2NyYXNoLmMgYi9hcmNoL3Bvd2VycGMva2V4ZWMvY3Jhc2guYw0KPiBpbmRleCAyNTI3MjRlZDY2
NmEzLi5lZjVjMmQyNWVjMzk3IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2V4ZWMvY3Jh
c2guYw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2V4ZWMvY3Jhc2guYw0KPiBAQCAtMzUwLDcgKzM1
MCw3IEBAIEVYUE9SVF9TWU1CT0woY3Jhc2hfc2h1dGRvd25fdW5yZWdpc3Rlcik7DQo+ICAgDQo+
ICAgdm9pZCBkZWZhdWx0X21hY2hpbmVfY3Jhc2hfc2h1dGRvd24oc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpDQo+ICAgew0KPiAtCXVuc2lnbmVkIGludCBpOw0KPiArCXZvbGF0aWxlIHVuc2lnbmVkIGlu
dCBpOw0KPiAgIAlpbnQgKCpvbGRfaGFuZGxlcikoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOw0KPiAg
IA0KPiAgIAlpZiAoVFJBUChyZWdzKSA9PSBJTlRFUlJVUFRfU1lTVEVNX1JFU0VUKQ0KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3htb24veG1vbi5jIGIvYXJjaC9wb3dlcnBjL3htb24veG1v
bi5jDQo+IGluZGV4IDNiNmY1MjRjNzkwZTMuLjllMTJiNzU4NTBkNzUgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gvcG93ZXJwYy94bW9uL3htb24uYw0KPiArKysgYi9hcmNoL3Bvd2VycGMveG1vbi94bW9u
LmMNCj4gQEAgLTMzMDMsNyArMzMwMyw3IEBAIHN0YXRpYyB2b2lkIHNob3dfcHRlKHVuc2lnbmVk
IGxvbmcgYWRkcikNCj4gICB7DQo+ICAgCXVuc2lnbmVkIGxvbmcgdHNrdiA9IDA7DQo+ICAgCXN0
cnVjdCB0YXNrX3N0cnVjdCAqdm9sYXRpbGUgdHNrID0gTlVMTDsNCj4gLQlzdHJ1Y3QgbW1fc3Ry
dWN0ICptbTsNCj4gKwlzdHJ1Y3QgbW1fc3RydWN0ICp2b2xhdGlsZSBtbTsNCj4gICAJcGdkX3Qg
KnBnZHA7DQo+ICAgCXA0ZF90ICpwNGRwOw0KPiAgIAlwdWRfdCAqcHVkcDsNCg==
