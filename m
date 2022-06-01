Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820D653AA90
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 17:56:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCtzc27ynz3bwQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 01:56:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=snsFFTS9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::604; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=snsFFTS9;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCtxT0RLrz3c8C
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 01:54:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvV7zc09fl2/961kQiv8SHfHo0kUCrv4mDJJfzwO5IIUQS/VMhvqu/u+mFgp5wJfXa9wGVMU92KmX2DZrUGbvo99k2HjYijSve3NRAVlrUykRgNEnnzsaMg+0iS3wSeBHy3vM1GdW4bNLF7i+DH009vP3poDyfeHql4fPrDQW6DtwssE1aSXK+ANX291ytz7i0iEeshv7IjePNqzG877T7+3I5c+c2frgSPBgucHLbmr9x54764TLqnebVlKce7C1KUxKmnbuIU4V2KDrMCBcxnb/YGlXOEjma7jDc+AdxHh+RAD/YiDKn2Taf1cEu+ijxn2P0VN9A5Awxsdb3I0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdVOsmTtIkuG6VcHY/cjkTn5KJT1yEbWoPfF+HU7bnI=;
 b=LRmktbkOVPUnBfSmTRShcyY0Ce1BfXXP57i7RRlRyN5cReFUtPcyWiODHpCAS79w63KBlPk8kdflEKN6pR7/oYiOKdsP1fZ1Kb0lqUtSLF1kdWHJPCnVnluoXwSlyAUNCJ4y62fPDnfS3v2qVAqDjlKvMFE4jEDoukTCkfKeC7Fv1rDB1QOU4LXHz4nK3Qe4PEV7qvuDYRJ4xlLv0sYeVhWs140viFOb5/VFPYQBDATqLfGVR9ai07WKPHCCiCZVcKOF/dDxd45VZhc4+6N+kA/8eHJlhhnnKNDOq3L4/Anyq4xL6FAaWW5bka67QBK/XlbbBtTZ3ba59JQPZgOXiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdVOsmTtIkuG6VcHY/cjkTn5KJT1yEbWoPfF+HU7bnI=;
 b=snsFFTS9vSp3wE2iPPX8M7Yz/frsNyzgBNqXzwQJT0m623xmQKQlKvtrmg2En2Ra3I8vPGyH0SRgZbdXisANiMu1mvZKisnNTFlq+TEGW8gXVo04luXJGVkhBe1WhMD/2lXeA6gFrYokqTT2Z9TFAxoI6y54bhVBAECnfOk5OnroAD++vHmgTq+6W64ovyIpy/ip6EN2pDWLayAdozA/9mTIhbsbdqj6loqQXT1Nmz/33gfskeWLq6CFKWxEryn0ZYpIxMhBWGhTh9Ocurn62ZPVnKU7PGN4ruJD6TU52z/DoyWoI3t/cxRjfQYWzuxInUMYx7wMyZsAOhgc9oql6w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3473.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:23::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 15:54:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 15:54:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/kasan: Force thread size increase with KASAN
Thread-Topic: [PATCH] powerpc/kasan: Force thread size increase with KASAN
Thread-Index: AQHYdcRL2SXHeYyLQ0mVs7Hj1SmXbK06tBSA
Date: Wed, 1 Jun 2022 15:54:00 +0000
Message-ID: <5aca588f-6d39-ef11-73d2-70a15bfdcd96@csgroup.eu>
References: <20220601143114.133524-1-mpe@ellerman.id.au>
In-Reply-To: <20220601143114.133524-1-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1080a7fe-4a9c-4b95-c83d-08da43e6f1f0
x-ms-traffictypediagnostic: MR1P264MB3473:EE_
x-microsoft-antispam-prvs:  <MR1P264MB34739AC191E2F90A4DFFBB14EDDF9@MR1P264MB3473.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  pywfH51xqOJrOJckZzIgH6BEqWiVD+3mZZ0vUqr7DurZuBqllhkxLjdofJn69HY9su9S+fYRNCI7xJbJB8fC7SfCGoLKjPAG/HSoGsLAlYGtAbyYi+3tnnBvfvl9l69SLQ7fN93G6vZ2QvPxP3MTDvOHD1aIaCb9QVjesb+k47vIlKJKbO8l/P4SIEg4JQP95iZv6XMxBB6s+xVgB3vsuek+JV5xUzHDsR+PgO2ZWnMMks0f37pibxpHfS9tKixxcntbPcfBv+L0Zd8iJsCyHUIUatzaUPoeiQM+/qZoe9tDGeEplHDGoIb0WhNw6rDID6kRr4yimOv+X2Iyl8mITkdcweV3C9inUQYxDjeJwm4sUPk2Wh4eM90r0JeARU2VjhcKeeYScz8dnlTWuBHW/k0ugWWGFqNGTAP2WRCiJ9aSA6BxQA7Cb5sWD+F6JYJcLfX28jueEb1yceHRTgvtbJijDNMqBiLyqRGUN2HO/nMvT2dgGoE7Pw0s2pDT/4dgCrS5nkoAFR8cCV5Q8ILM8QZ8fvTlzFUm0CmyoMeooSCV/uiVjbXuTvOJDaWXWmGpS8Xzj1lUAcarspcS/aUL2YsnqfRwEOb6Fe8SSJbzQOdKutJBt7SDEX3YzRCL1m+p/UCG6jQXQ1bgZXvQlZZA8+qeYrtP91luJ5UsiucMYZWq5B9744k/qD35A4JyP/UuHv3eARZRSAkWCzG9Shux0Tthxc0ftQDTzY9s1Qox98Qf/GSVpKLUY2xcHH+JDupIsED4MVW0RP/0hngsXu0I9g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(44832011)(31696002)(38100700002)(5660300002)(110136005)(38070700005)(316002)(122000001)(71200400001)(508600001)(6486002)(8676002)(2906002)(66476007)(76116006)(66946007)(66446008)(66556008)(64756008)(91956017)(36756003)(186003)(31686004)(83380400001)(86362001)(6512007)(26005)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OGZiZEVJakhCZ0VrU1JBVDN0a0hpVC96cEY3a0hVV1BPVXU4N0M2dWZiTFpS?=
 =?utf-8?B?aHZiSzZDNStseVU3cFhNMGZtYit1MllKQ3REeXRNNGd0SWxiVjhTV3I5RVc2?=
 =?utf-8?B?UXhZejRPWkh6cmRJNjhXOEZ0aVVpQldXVG5MVGh4dVlYOVI3VW1GZUI0TERP?=
 =?utf-8?B?Y1IxOEZMaVNuK045VEEweDlvSktjUmtmMjhjZklOQlVGMHlnWUYrK1luSzNk?=
 =?utf-8?B?cWRLSEtZZlJEcmtjeDl4YzU5WEFhNDV6T2hSSmM5WUdNdFhMZnZ4bStyL2ZS?=
 =?utf-8?B?V1BFL1d6YSthYkl2QWpPT1hRL0tMUjJIeXBUT2EybUo5UEw2OFFYOHdmdFZ2?=
 =?utf-8?B?bWlwaHBLSm1Fck9NdkhWMWhkaWNnWFVpVEdUUlNjeVdDNWJMRW53U3gweE9y?=
 =?utf-8?B?RmlKZ2p3WEhOZzNNcnBDTDJOeTR4WXNJcEk1MWJISWpBdEFpcnRvVjl3NE03?=
 =?utf-8?B?R09XYnV0L2p0MlBMZDFmVUV4bDlUMlVBM1ZuNUExTnhQNHNRSGFweHFNakxn?=
 =?utf-8?B?eFhDZCtRV1NqU2JSbVIzRzF0RXdRaUJ1YmpCYUNBMzA1REZJeWo4Y3FtR2lt?=
 =?utf-8?B?OGcyTnZLMjhWVFVpV0lOaHFyeWJXcnhMZzRGZ3ZiQ2JMNThuUDRBZEtlSFFh?=
 =?utf-8?B?V2RoSDkvbUhTcGVlTjUzS0xHdm8xbVpaVXFTYVF2dHFyRDljTmtBemZUcVFj?=
 =?utf-8?B?TWNIYVpuaU9CakNtQ0htcHByelgvTFlkNlFzaUxCTWhBWEY4eXlmbjEybWVq?=
 =?utf-8?B?bGg1clBjNkhoRmQyT0VQaDN0QlBZQnNMQzcrVy9vSUk4NXh1OWJWMTFyNVdj?=
 =?utf-8?B?anFBVGMzS0dJLzJuclFMQ1RHNDBqQ0Y5YTBOdURTTEdrOTh5Qnlqak8yOThk?=
 =?utf-8?B?am41K0tJOEZiWkRSUU4ySUdnQnZuMkFNL3FrOWdsbmRVeThXSzZCWjVYUjBG?=
 =?utf-8?B?MjhsNGc1SnFKbmRER2NNamtITHZSMURYbENWelJQUUYxa2Z1UmJsUkIxSndo?=
 =?utf-8?B?YnVBMUMvVnJLRkFjSHNTOUNVcDBBeVpucHZWeHBoVU1ua25McklSTmkwNVhk?=
 =?utf-8?B?OTFwQ1JrNkh2Y3pXUUtzYlpiY1prbjl4Wms1WnU1TEFZcmJmMHVQSWlRRURJ?=
 =?utf-8?B?aFc1cUxvYWR1VkR1OHN6UDNQZUZTcXlSTEdWRlJwN2tYbmpsbk8wd2xvc08z?=
 =?utf-8?B?aHU0Sks5VE0vUzV6VFhyS2V5b1JzS2Y1VThXd0NkaU1WK3E4WFB6YUQzb2Vt?=
 =?utf-8?B?RkdRb1hLbVNMblk2Ni9RY0d2ZlBkZVZPZDRYY3E2SC92eW1SckRNMHJ5d3p5?=
 =?utf-8?B?UHJJZG8wU3Vtc0VCR3FFVWdFWGJRTXJJK0NDR0lnaWI2OG9KUUlxL0tuUkFY?=
 =?utf-8?B?WHl3VmJhdVB5bDhwMDZtVVVVekVLdU8raE55MjFzMU5HMEUxd1puT0VBZThN?=
 =?utf-8?B?b251d1dCQkhxUGpBS0lza09vYzhuUW51MEhKRWNHeFdvQ083d3BFT1RUWFgz?=
 =?utf-8?B?eEFyQ202SHEwbFZSekM0ZHdLTW9nNjk1MzMzcklod0dFUktndjBJQmJRaXpY?=
 =?utf-8?B?M0hSUTlhQ003YWsrRytjb2lqZ1krWkxaU1pmUnQwV2RGOS9qZ3V0SnJUVHEy?=
 =?utf-8?B?K3oySS9Bck5TVHVXYUpOOTFRUnEwaEJKN0VZaW5paE5xa2ZOQUhiTnorQjdh?=
 =?utf-8?B?V0FLbFFKZDVRMkR1ZmUzMmVvQm0rQUgwVW9ZcUNiRWU3U0taVWRsYmQ2UVNZ?=
 =?utf-8?B?NjhYTUNSc0dtRm9WVkw5Q3l3ZnNEZmxFMjFYTnovNWhNYzRBN1dET3IrQjkx?=
 =?utf-8?B?RThZTytPYWNxY2Y4VThJdFFieGZDQi9GNGZYMTMxZjEzN0N6b1VPc0ErZElF?=
 =?utf-8?B?aWVKejJlZ3Qwd1VmMlRyZjZwYXdJZGkydVFaWXErSGNKdWptVzFPZVYyNkp0?=
 =?utf-8?B?eU9TSk9FMDlVUFR0Tzd2NThUTXREdkVIUEh1YmhUT3dvbEhXNk1oZUpaWklK?=
 =?utf-8?B?ME5QcTJjWlZPc0JXNEVBSDdaZ0pDSXlRK1pPY29ZWVZQV0xUaDZ6NlhGS096?=
 =?utf-8?B?ODZFY0NBYm1nS2loOVNzNFFmUlI4UjhYdGhvU090alg5TzNxQ0lZL1ptT2tR?=
 =?utf-8?B?VkVHZWU5UEpCSzZxRFg0U2VKSXkwemhxaXhRdDh2SUd2TkR2NWdyMUVhcFQv?=
 =?utf-8?B?SUJXRE11L3k3RVhUNjVzVUdXVG82YjVuR3RhMllzMFBOaGd3WlpZSVdwKzBP?=
 =?utf-8?B?RXRPSjBIMzdNakZNTjQzOGt1bVF2NUZDTzUyWW5RYkhCZnl3bS9JSGZqQ2Ri?=
 =?utf-8?B?Y2gwL2FwVjdSaWpkSk50V09wYWRGTjNWU2lYWk1Tci9mWElmWTlUT0ZKSjZv?=
 =?utf-8?Q?aMvffVJWa1cMNtXfszhZ/6xDARr/m0lGKg1EM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53FD6CD56D74D948B849D19CF2A5E018@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1080a7fe-4a9c-4b95-c83d-08da43e6f1f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 15:54:00.6505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9MF71m1y+SYBhL7wjpWKYksvf2AT2ZkBOjFjIRBmyeMZBco4Rj7jkEFqqBhcNejgVg1fwL+qFS0WSCSbY5pBkKJRvCfAqc7YLnOUrHwBFh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3473
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA2LzIwMjIgw6AgMTY6MzEsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gS0FTQU4gY2F1c2VzIGluY3JlYXNlZCBzdGFjayB1c2FnZSwgd2hpY2ggY2FuIGxlYWQgdG8g
c3RhY2sgb3ZlcmZsb3dzLg0KPiANCj4gVGhlIGxvZ2ljIGluIEtjb25maWcgdG8gc3VnZ2VzdCBh
IGxhcmdlciBkZWZhdWx0IGRvZXNuJ3Qgd29yayBpZiBhIHVzZXINCj4gaGFzIENPTkZJR19FWFBF
UlQgZW5hYmxlZCBhbmQgaGFzIGFuIGV4aXN0aW5nIC5jb25maWcgd2l0aCBhIHNtYWxsZXINCj4g
dmFsdWUuDQo+IA0KPiBGb2xsb3cgdGhlIGxlYWQgb2YgeDg2IGFuZCBhcm02NCwgYW5kIGZvcmNl
IHRoZSB0aHJlYWQgc2l6ZSB0byBiZQ0KPiBpbmNyZWFzZWQgd2hlbiBLQVNBTiBpcyBlbmFibGVk
Lg0KPiANCj4gVGhhdCBhbHNvIGhhcyB0aGUgZWZmZWN0IG9mIGVubGFyZ2luZyB0aGUgc3RhY2sg
Zm9yIDY0LWJpdCBLQVNBTiBidWlsZHMsDQo+IHdoaWNoIGlzIGFsc28gZGVzaXJhYmxlLg0KPiAN
Cj4gRml4ZXM6IGVkYmFkYWYwNjcxMCAoInBvd2VycGMva2FzYW46IEZpeCBzdGFjayBvdmVyZmxv
dyBieSBpbmNyZWFzaW5nIFRIUkVBRF9TSElGVCIpDQo+IFJlcG9ydGVkLWJ5OiBFcmhhcmQgRnVy
dG5lciA8ZXJoYXJkX2ZAbWFpbGJveC5vcmc+DQo+IFJlcG9ydGVkLWJ5OiBDaHJpc3RvcGhlIExl
cm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBj
L0tjb25maWcgICAgICAgICAgICAgICAgICAgfCAxIC0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vdGhyZWFkX2luZm8uaCB8IDkgKysrKysrKy0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiBpbmRleCA1NGRiYmIxZDRi
MzYuLmIxNzYwZDYxNWJiNyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4g
KysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gQEAgLTc5MCw3ICs3OTAsNiBAQCBjb25maWcg
VEhSRUFEX1NISUZUDQo+ICAgCXJhbmdlIDEzIDE1DQo+ICAgCWRlZmF1bHQgIjE1IiBpZiBQUENf
MjU2S19QQUdFUw0KPiAgIAlkZWZhdWx0ICIxNCIgaWYgUFBDNjQNCj4gLQlkZWZhdWx0ICIxNCIg
aWYgS0FTQU4NCj4gICAJZGVmYXVsdCAiMTMiDQo+ICAgCWhlbHANCj4gICAJICBVc2VkIHRvIGRl
ZmluZSB0aGUgc3RhY2sgc2l6ZS4gVGhlIGRlZmF1bHQgaXMgYWxtb3N0IGFsd2F5cyB3aGF0IHlv
dQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgg
Yi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaA0KPiBpbmRleCAxMjUzMjhk
MWI5ODAuLmM5NzM1ZjkzZjhlNiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL3RocmVhZF9pbmZvLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3RocmVh
ZF9pbmZvLmgNCj4gQEAgLTE0LDEyICsxNCwxNyBAQA0KPiAgIA0KPiAgICNpZmRlZiBfX0tFUk5F
TF9fDQo+ICAgDQo+IC0jaWYgZGVmaW5lZChDT05GSUdfVk1BUF9TVEFDSykgJiYgQ09ORklHX1RI
UkVBRF9TSElGVCA8IFBBR0VfU0hJRlQNCj4gLSNkZWZpbmUgVEhSRUFEX1NISUZUCQlQQUdFX1NI
SUZUDQo+ICsjaWZkZWYgQ09ORklHX0tBU0FODQo+ICsjZGVmaW5lIFRIUkVBRF9TSElGVAkJKENP
TkZJR19USFJFQURfU0hJRlQgKyAxKQ0KPiAgICNlbHNlDQo+ICAgI2RlZmluZSBUSFJFQURfU0hJ
RlQJCUNPTkZJR19USFJFQURfU0hJRlQNCj4gICAjZW5kaWYNCj4gICANCj4gKyNpZiBkZWZpbmVk
KENPTkZJR19WTUFQX1NUQUNLKSAmJiBUSFJFQURfU0hJRlQgPCBQQUdFX1NISUZUDQo+ICsjdW5k
ZWYgVEhSRUFEX1NISUZUDQoNCkkgZGlzbGlrZSB0aGlzIHVuZGVmLg0KDQpJIHdvdWxkIHdhcyBk
b25lDQoNCiNpZmRlZiBDT05GSUdfS0FTQU4NCiNkZWZpbmUgTUlOX1RIUkVBRF9TSElGVAkoQ09O
RklHX1RIUkVBRF9TSElGVCArIDEpDQojZWxzZQ0KI2RlZmluZSBNSU5fVEhSRUFEX1NISUZUCUNP
TkZJR19USFJFQURfU0hJRlQNCiNlbmRpZg0KDQojaWYgZGVmaW5lZChDT05GSUdfVk1BUF9TVEFD
SykgJiYgTUlOX1RIUkVBRF9TSElGVCA8IFBBR0VfU0hJRlQNCiNkZWZpbmUgVEhSRUFEX1NISUZU
CQlQQUdFX1NISUZUDQojZWxzZQ0KI2RlZmluZSBUSFJFQURfU0hJRlQJCU1JTl9USFJFQURfU0hJ
RlQNCiNlbmRpZg0KDQoNCj4gKyNkZWZpbmUgVEhSRUFEX1NISUZUCQlQQUdFX1NISUZUDQo+ICsj
ZW5kaWYNCj4gKw0KPiAgICNkZWZpbmUgVEhSRUFEX1NJWkUJCSgxIDw8IFRIUkVBRF9TSElGVCkN
Cj4gICANCj4gICAvKg==
