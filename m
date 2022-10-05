Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F285F5A92
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 21:23:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjPd42gBwz3dq5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 06:23:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=oN1rTUHx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.50; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=oN1rTUHx;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120050.outbound.protection.outlook.com [40.107.12.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjPbD221gz3bmK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 06:22:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwaG+xr4L4h2G41xThT1KDR9ZAk4AIl16ZyBjUoq2OHI0cOlQXBPDvFf7uPxqXGAmPQ/ulPawKRJqTUvf5dsLR4PECspAf8K2Qs1FDgBX86JC7nsALumQEnjIfEvcrG6OC8dDZsUOVbZB7M75ryZ77Q8ukCUHwQnjUYrV2RO4+Z0nrElQ98g+tqrHhYF0SQwXIk6FPEWjalf4ZbnmDT9JautfjJDSsK10t5aqQM+IRVipbXL+bCbvmZivpVRmny9swUmnIqgyHMMbv79g7Pe9yffvjsfDDvFp8vg1Nvizm7qM62qVvh5OQCnyNm4R4JqWgMB3s/t2v8wN+Rm5/cyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za4Oe4jWmMWIvm3YOSDRyaF+wtYJMZEXMoGSiVuSI0c=;
 b=Vss7kaUoiG425x0JrGePEKDRVr8QKnpzLVh4tByPBUFJJ0QzMXc2VH9vRQIzoB/+jUDvCYdqCAKUfOs0g6bNWuoQA2AXG0CoTVI7HMhCU+Es5gWRLN/GWdpFNgNa8kEErHkrGl1biElwPFcP6yprnRc1DQm8+WuDAGW5YEWdB2QPBarg2bXPitgnLuEseKS4H7UVdef3TgglPaWmhG+ISNKj1muOwlg1Zj2Zr1OU1P609iGcIv66wvgFyoriksKk2WQVXB0UOuBF9Baobbaq6cw0psYZg2tnu7tqRiCE9EmY90xRgdNhCD+SvwfrgdivZd5lRvzdvqRU6v38V2nmUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=za4Oe4jWmMWIvm3YOSDRyaF+wtYJMZEXMoGSiVuSI0c=;
 b=oN1rTUHxmeN9+ykTztyW+tfEEnqQEcxbVHPAxeXtWqYhi0ji/ukQZqA2P5psH63qjHtp4qxSLLDu8/2iZYQRV2lmc2lq20Ms9QaE/UWpyLH8fBJLhKMWFoRscfTp1THDVcx9v4FxXPa1Y0Idxz4P34tFltjOyGpx3xwRsZAfNUWy6FS8BBSR3P1GJnIOZ6ZWNHiJ0Vja3ZTKmlPIfnq2o0pCUe2fe9MTv1bXC7ULISGTJq9hbsrKRKCCBYO3WYYI9iTCy/9VJMTLjEpeT8yJoymxhSpQr14W2jgPEiVrqpw5jTpFBj32Pbw4hLcYY4AKfQTCM02AiYYSpkGXIEOhow==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1604.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Wed, 5 Oct
 2022 19:22:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 19:22:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 4/6] static_call: Move static call selftest to
 static_call_selftest.c
Thread-Topic: [PATCH v3 4/6] static_call: Move static call selftest to
 static_call_selftest.c
Thread-Index: AQHY2HvvCmdj8/3baUOhYWgLGuVtr64ALpCA
Date: Wed, 5 Oct 2022 19:22:12 +0000
Message-ID: <30336ef7-14c8-b455-25b8-ce67ddd0d46f@csgroup.eu>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
 <20221005053234.29312-5-bgray@linux.ibm.com>
In-Reply-To: <20221005053234.29312-5-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1604:EE_
x-ms-office365-filtering-correlation-id: 932ea5bb-54e4-41c8-3fcb-08daa706e7da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3XFYSjg+1/kxJoKr2EZOsh9RnPt5Os4gE1R6fvK1zRApkdNxbhwlbSFYTV8w/NyJaRa0rf/XYvj+e/kRbHWG5V7APHk3ke1W1nV/iBT1BplcMabi5ls+42VfAYs9tYZsjxUgt+TBBFprBVPCVlU383YBihAzSxIl2hPcfMj4SyUY6yt7wwGHV6rBQ8XVzTkMy+NmfKEH1aYg07+gFFvJpRanHf2zIt0v+aPYUq+VdPK/N7i03rvkZ1XiK8Am6FM7Ct+ADdyJeGeLH88kizuTZCubkpCXOnlBbT3DJL6Cy+rviXfx7fMR8i6gns3G48+GUZe4gOr6suFoV7aSqZwDNkg9rGWNb7YV8YxPQjmMbmenXUr93EwUNQF7w3YnRw300oFCS77hxxI30kG+69of0Ez4jvGMewIhZr594jduJSaWYbpGHc8TWipgPvDy0btsK+4RmjLXpZovfqYPsXJ+R4Z4quI0IIHIxxApZj+vB+uO/ZjzsKylB3mJbBH5uHDyFZUWJRJYdh7D0sGMYe3pOEmtiY5SmF9+gPIBqKh3ZQtsVydyg2LDudj9uERLHGaP87nD8Hw6TCzG863bQs7IW/bgUnU4RaCWavLbqs7cs9oYW9FaIAvXoUfOM1vygDSiMDCAFaZ1EYmMNSxK8xRM1Q90faO2xZPUnwW24yQJ80VF/pKvssrNRFn+3YRoXgv1sBlZl01Ib9a3YNVbZMpZ/o64KFeS9fnqTWXNdJBmLhxFvFl1VZ3+Em7jmHlJTPLsdD26TCiDQKWl1ygtx3Mh7wfIYnJ3GACUznCEHJgu4nXm5t780H9b7e/6uwUoGp43tBZJuXYa6Aqte/BQ1aQClQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199015)(8676002)(41300700001)(54906003)(71200400001)(110136005)(66946007)(478600001)(6486002)(44832011)(36756003)(66556008)(66476007)(66446008)(64756008)(4326008)(91956017)(8936002)(76116006)(316002)(5660300002)(7416002)(38100700002)(38070700005)(122000001)(6512007)(26005)(31696002)(2616005)(6506007)(86362001)(83380400001)(186003)(66574015)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ekh6SjczQTNEeTdNR0RtR3lFdG5SaWZTajJwZHVLQWhsTVJjOHpaQm5OR09n?=
 =?utf-8?B?WFNNVDFQR294NmcyaU44dmo3UG8zQ2ViWjgxekNYdG0zRjJEeWZTUnp0V2dq?=
 =?utf-8?B?Qk5PYmZEVG82elo2M3RoZVBTUnVmS2J1UGk2YU1vT2ZVZlNQeVJnNW84TVZT?=
 =?utf-8?B?Vzh4aXRGNmNza0hSbGp4dmhBRlgvcDliTE5IQWtRbEpmS1Z2RWxBUi9zUHNB?=
 =?utf-8?B?N3c2dUJ4dlZBZ0RUa214MDFqKzMyNHIwdUhnSkpvUllHeURpemM1TUhwazBY?=
 =?utf-8?B?OVpTYTZNVUpVNktEZVNxWktjdWY0R2NIS2RjcGlKZWJrWkM2YUZ5QUFuaGZL?=
 =?utf-8?B?VERLYWx1ZXZVQlh0dUhHU3VKb3Jad2JUczlHMjByVDRFVVVsVmFJU1NSVUpV?=
 =?utf-8?B?RmR0emlWL1pyVVBUYVJwSFZFZUh5c25JY29NaHBpQVBPSW5YdTdZMFhUcmpN?=
 =?utf-8?B?Wm1QbThUWjhvWEUzVXZJNDlxR3JCUHducU1sQlpHR1VZaGFjTUpKQTVJcGps?=
 =?utf-8?B?WHZPbUVwSUgvVzB1MnBJRElKbERkdzdHUy9OWGRDOU42OHNmd0h6Q2lHRnBa?=
 =?utf-8?B?SXhsRFBrNXN0dTZacmM5V3pWV1pObHg4cFBpR24xb1NVQjJtRFVyMThMU1pE?=
 =?utf-8?B?d2NOY2pEYUR6MTJqaThvQ3dLblRJdVVJY051bmM2SWtjaVdhOUNRSGNBQXBW?=
 =?utf-8?B?K1FCU25mZzVEdCswY0NDSzBoaDgyNlVvSlhMVm5QdlNWYS9nTnNLZXlsVnlI?=
 =?utf-8?B?T2JMaXZjRGhmREdpZi9mNHY1cVh6VlJnYUFYclZrVm9OVjlJWnltOGQwQTIv?=
 =?utf-8?B?aDVXS0VPLzcwTUUxQ2Y4MG9jajJHak92YS9VUWN1Y2tmdUk3YzNNelJCbndG?=
 =?utf-8?B?MUFadWYyQ2RXODFyQkt5Ti94MUZCL24wYkRaaTZLb21BM3BMR2xOZHYvek5P?=
 =?utf-8?B?MFhLbDIxNWxTMlNhTlYvNDdmVnhjazBMQU5JRytzOUNWaGpBVXhINFFnTDBy?=
 =?utf-8?B?cnZuU1NWOXpjK3V5VTFmRm1EbjZuV05XT0lOVHNqN2dtYzY5Tzc0bTBBVGNu?=
 =?utf-8?B?UEFzY2tmKzZnUVZlc21YT0w4aGRFWUVoMnJpdVNia3llWFdaYis3TkZ1R1h6?=
 =?utf-8?B?ZFFMUzk4NTV2YjVxeDJRK1kwdlFrd25laENaVHA1czE1OVcxbHJWSzRiY2hU?=
 =?utf-8?B?dmxLZVpvOWpGdFJyUXkra09BMy95MTlNd3FtS2s4WlBVeXZxSkUzZzBTMWlQ?=
 =?utf-8?B?WXQ2eDBQV3VMU1o5eGs4cnJzL1lvWTZubTRaV0F4R3llODBkNURtSkZSZ0dV?=
 =?utf-8?B?ZU0vR2tVUVNFajFZTFE5Z0hlUGN6ZTJXQkJoWUtVbGtsNFFOd3hTWGozM254?=
 =?utf-8?B?LzlMRWMwSU9abjFsaEwzYlBrUU11aXdEWDdSTThUS1AyYjF0dXo1TVNRSUlP?=
 =?utf-8?B?QVZsbXJoeWUyRUdWL1lVZ3hOV2d1TUN4NitiUVJOU2xlWEZYQUNoTWhZcGJX?=
 =?utf-8?B?NjdCMGxLYlJEWkVTUHQzdittY1BoQ2xLRmcxUVN5NmVmNkNKTnpoaHdMZW1j?=
 =?utf-8?B?cFZOVWw4MGpLT25nM3A3K2o2blBrRlpzd2xES1pqbUludmY2bmJLaUtmNC9x?=
 =?utf-8?B?ak5vS0lzbFRKK2EyQ1czU1l1UzhXT1JLWG11QVorb3Q5bTVIYVllWGx0WWh6?=
 =?utf-8?B?UlpkZUFYa01aNHZFKzlPU1dtek9EaEhVcnB0VVpWN3lGbHFKQVI2L2ZOQUVR?=
 =?utf-8?B?OEg4dkY3QlNoV05VTFY2eThLMzA3YnBFdUFDcXR5blRHcmhyTnlyaSt2ZG9z?=
 =?utf-8?B?bGJBZnVxSy9JblB1dmFycU4rRS9nQSs5d3NUbm5hQ2hHQWZteUZWZm1iTnA2?=
 =?utf-8?B?QVpoMUtmSUt1U3JVS3JncURONjRuSW1uMEh1a25EbFRZMnRLdXlsa0gxa2hX?=
 =?utf-8?B?VlRPZ2dXaDRMSkxCKzdxNEphY01WanF6TnhTQTZYODBRQUxkdjF1ajlUZ1do?=
 =?utf-8?B?bzRGcmFxWWh3RzFaOGdMV2o3L1hDbUJHMjRydkN0R2pRNEJmcXFPendNZWdT?=
 =?utf-8?B?YkVmU0t0a0hybzdjbkxFcVNuNnVWZW5BYTkyNDEvTDgxZ3lJT0l6dnBmYlNV?=
 =?utf-8?B?dXlOLzNvVjcvQlpaN0lPbGRPbEtPSVlKM3NmMzRGemx4UFVlRTZ2enZHUjIz?=
 =?utf-8?Q?cO7GvMbHIw+fo7RNgcCKyQk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82C7B5CBE02C4041B1412A3FE99DAF6D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 932ea5bb-54e4-41c8-3fcb-08daa706e7da
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 19:22:12.7204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8zPrRj41xhsxeeVatXt1xXPvB9x0HZK7g3yDI7KueXaU7d3tKLWI5y/LU6C1FQwl8+ZXT9Qdbcs4O2JQMR0yR+Bq5q3WuFA2Ctr7Qb3AtkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1604
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzEwLzIwMjIgw6AgMDc6MzIsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlc2UgdGVzdHMgYXJlIG91dC1vZi1saW5lIG9ubHksIHNvIG1vdmluZyB0aGVtIHRvIHRoZQ0K
PiB0aGVpciBvd24gZmlsZSBhbGxvd3MgdGhlbSB0byBiZSBydW4gd2hlbiBhbiBhcmNoIGRvZXMN
Cj4gbm90IGltcGxlbWVudCBpbmxpbmUgc3RhdGljIGNhbGxzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQmVuamFtaW4gR3JheSA8YmdyYXlAbGludXguaWJtLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEFu
ZHJldyBEb25uZWxsYW4gPGFqZEBsaW51eC5pYm0uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0
b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGtl
cm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgIGtlcm5lbC9zdGF0aWNfY2Fs
bF9pbmxpbmUuYyAgIHwgNDMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4g
ICBrZXJuZWwvc3RhdGljX2NhbGxfc2VsZnRlc3QuYyB8IDQxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgNDMg
ZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGtlcm5lbC9zdGF0aWNfY2FsbF9z
ZWxmdGVzdC5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEva2VybmVsL01ha2VmaWxlIGIva2VybmVsL01h
a2VmaWxlDQo+IGluZGV4IDMxODc4OWM3MjhkMy4uOGNlOGJlYWEzY2MwIDEwMDY0NA0KPiAtLS0g
YS9rZXJuZWwvTWFrZWZpbGUNCj4gKysrIGIva2VybmVsL01ha2VmaWxlDQo+IEBAIC0xMTMsNiAr
MTEzLDcgQEAgb2JqLSQoQ09ORklHX0tDU0FOKSArPSBrY3Nhbi8NCj4gICBvYmotJChDT05GSUdf
U0hBRE9XX0NBTExfU1RBQ0spICs9IHNjcy5vDQo+ICAgb2JqLSQoQ09ORklHX0hBVkVfU1RBVElD
X0NBTEwpICs9IHN0YXRpY19jYWxsLm8NCj4gICBvYmotJChDT05GSUdfSEFWRV9TVEFUSUNfQ0FM
TF9JTkxJTkUpICs9IHN0YXRpY19jYWxsX2lubGluZS5vDQo+ICtvYmotJChDT05GSUdfU1RBVElD
X0NBTExfU0VMRlRFU1QpICs9IHN0YXRpY19jYWxsX3NlbGZ0ZXN0Lm8NCj4gICBvYmotJChDT05G
SUdfQ0ZJX0NMQU5HKSArPSBjZmkubw0KPiAgIA0KPiAgIG9iai0kKENPTkZJR19QRVJGX0VWRU5U
UykgKz0gZXZlbnRzLw0KPiBkaWZmIC0tZ2l0IGEva2VybmVsL3N0YXRpY19jYWxsX2lubGluZS5j
IGIva2VybmVsL3N0YXRpY19jYWxsX2lubGluZS5jDQo+IGluZGV4IGRjNTY2NWI2MjgxNC4uNjRk
MDRkMDU0Njk4IDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwvc3RhdGljX2NhbGxfaW5saW5lLmMNCj4g
KysrIGIva2VybmVsL3N0YXRpY19jYWxsX2lubGluZS5jDQo+IEBAIC00OTgsNDYgKzQ5OCwzIEBA
IGludCBfX2luaXQgc3RhdGljX2NhbGxfaW5pdCh2b2lkKQ0KPiAgIAlyZXR1cm4gMDsNCj4gICB9
DQo+ICAgZWFybHlfaW5pdGNhbGwoc3RhdGljX2NhbGxfaW5pdCk7DQo+IC0NCj4gLSNpZmRlZiBD
T05GSUdfU1RBVElDX0NBTExfU0VMRlRFU1QNCj4gLQ0KPiAtc3RhdGljIGludCBmdW5jX2EoaW50
IHgpDQo+IC17DQo+IC0JcmV0dXJuIHgrMTsNCj4gLX0NCj4gLQ0KPiAtc3RhdGljIGludCBmdW5j
X2IoaW50IHgpDQo+IC17DQo+IC0JcmV0dXJuIHgrMjsNCj4gLX0NCj4gLQ0KPiAtREVGSU5FX1NU
QVRJQ19DQUxMKHNjX3NlbGZ0ZXN0LCBmdW5jX2EpOw0KPiAtDQo+IC1zdGF0aWMgc3RydWN0IHN0
YXRpY19jYWxsX2RhdGEgew0KPiAtICAgICAgaW50ICgqZnVuYykoaW50KTsNCj4gLSAgICAgIGlu
dCB2YWw7DQo+IC0gICAgICBpbnQgZXhwZWN0Ow0KPiAtfSBzdGF0aWNfY2FsbF9kYXRhIFtdIF9f
aW5pdGRhdGEgPSB7DQo+IC0gICAgICB7IE5VTEwsICAgMiwgMyB9LA0KPiAtICAgICAgeyBmdW5j
X2IsIDIsIDQgfSwNCj4gLSAgICAgIHsgZnVuY19hLCAyLCAzIH0NCj4gLX07DQo+IC0NCj4gLXN0
YXRpYyBpbnQgX19pbml0IHRlc3Rfc3RhdGljX2NhbGxfaW5pdCh2b2lkKQ0KPiAtew0KPiAtICAg
ICAgaW50IGk7DQo+IC0NCj4gLSAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHN0YXRp
Y19jYWxsX2RhdGEpOyBpKysgKSB7DQo+IC0JICAgICAgc3RydWN0IHN0YXRpY19jYWxsX2RhdGEg
KnNjZCA9ICZzdGF0aWNfY2FsbF9kYXRhW2ldOw0KPiAtDQo+IC0gICAgICAgICAgICAgIGlmIChz
Y2QtPmZ1bmMpDQo+IC0gICAgICAgICAgICAgICAgICAgICAgc3RhdGljX2NhbGxfdXBkYXRlKHNj
X3NlbGZ0ZXN0LCBzY2QtPmZ1bmMpOw0KPiAtDQo+IC0gICAgICAgICAgICAgIFdBUk5fT04oc3Rh
dGljX2NhbGwoc2Nfc2VsZnRlc3QpKHNjZC0+dmFsKSAhPSBzY2QtPmV4cGVjdCk7DQo+IC0gICAg
ICB9DQo+IC0NCj4gLSAgICAgIHJldHVybiAwOw0KPiAtfQ0KPiAtZWFybHlfaW5pdGNhbGwodGVz
dF9zdGF0aWNfY2FsbF9pbml0KTsNCj4gLQ0KPiAtI2VuZGlmIC8qIENPTkZJR19TVEFUSUNfQ0FM
TF9TRUxGVEVTVCAqLw0KPiBkaWZmIC0tZ2l0IGEva2VybmVsL3N0YXRpY19jYWxsX3NlbGZ0ZXN0
LmMgYi9rZXJuZWwvc3RhdGljX2NhbGxfc2VsZnRlc3QuYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjI0NmFkODlmNjRlYg0KPiAtLS0gL2Rldi9udWxsDQo+
ICsrKyBiL2tlcm5lbC9zdGF0aWNfY2FsbF9zZWxmdGVzdC5jDQo+IEBAIC0wLDAgKzEsNDEgQEAN
Cj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsjaW5jbHVkZSA8bGlu
dXgvc3RhdGljX2NhbGwuaD4NCj4gKw0KPiArc3RhdGljIGludCBmdW5jX2EoaW50IHgpDQo+ICt7
DQo+ICsJcmV0dXJuIHgrMTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBmdW5jX2IoaW50IHgp
DQo+ICt7DQo+ICsJcmV0dXJuIHgrMjsNCj4gK30NCj4gKw0KPiArREVGSU5FX1NUQVRJQ19DQUxM
KHNjX3NlbGZ0ZXN0LCBmdW5jX2EpOw0KPiArDQo+ICtzdGF0aWMgc3RydWN0IHN0YXRpY19jYWxs
X2RhdGEgew0KPiArCWludCAoKmZ1bmMpKGludCk7DQo+ICsJaW50IHZhbDsNCj4gKwlpbnQgZXhw
ZWN0Ow0KPiArfSBzdGF0aWNfY2FsbF9kYXRhIFtdIF9faW5pdGRhdGEgPSB7DQo+ICsJeyBOVUxM
LCAgIDIsIDMgfSwNCj4gKwl7IGZ1bmNfYiwgMiwgNCB9LA0KPiArCXsgZnVuY19hLCAyLCAzIH0N
Cj4gK307DQo+ICsNCj4gK3N0YXRpYyBpbnQgX19pbml0IHRlc3Rfc3RhdGljX2NhbGxfaW5pdCh2
b2lkKQ0KPiArew0KPiArCWludCBpOw0KPiArDQo+ICsJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJ
WkUoc3RhdGljX2NhbGxfZGF0YSk7IGkrKyApIHsNCj4gKwkJc3RydWN0IHN0YXRpY19jYWxsX2Rh
dGEgKnNjZCA9ICZzdGF0aWNfY2FsbF9kYXRhW2ldOw0KPiArDQo+ICsJCWlmIChzY2QtPmZ1bmMp
DQo+ICsJCQlzdGF0aWNfY2FsbF91cGRhdGUoc2Nfc2VsZnRlc3QsIHNjZC0+ZnVuYyk7DQo+ICsN
Cj4gKwkJV0FSTl9PTihzdGF0aWNfY2FsbChzY19zZWxmdGVzdCkoc2NkLT52YWwpICE9IHNjZC0+
ZXhwZWN0KTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gK2Vhcmx5X2luaXRj
YWxsKHRlc3Rfc3RhdGljX2NhbGxfaW5pdCk7
