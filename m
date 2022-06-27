Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 539C655B7D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 07:53:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWcMh1xpLz3f2l
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 15:53:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=EMML1SVx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.54; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=EMML1SVx;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120054.outbound.protection.outlook.com [40.107.12.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWcHt28bvz3dpf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:49:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tz/qp7RQiB3e90hwpAnuhSWZJCdwuwFcvesH5J3G1N8ZxeVOY1gyuWZUPKo9To9OJvi7tE5upsKU/MPYXp7S2Xb8+/NiX9PoJ5NHjCw9tz+ptfrt4nk//FmYMUW51dtReW/pRwdmfL7qIFI+YJMnYN6cHHengNxHhrVSNfaQeZIBo3PBaC1WtDECagV+8DYD3oHfcu7Qea7H+jux0x/S8s6p225ILvHmt0duxsqTDrYf8Gg0UZSPl/jWKH1dkGsavir9EZ3/efN5CgQNqDoGew015+70pcHVN50HHgWldE4ovj8Wfo6f6YMYhqHl8KFw2glWlipaa+2ldB5d8yPDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVJGyw2LHjEItORcouG1RHmxCbyHtCprrecTAdfWzJ0=;
 b=PgXCDaDfjj/XTwC54vp8RBV3/ityX38IF3sRxY+YkyC8Xqru+ZyOsKRLvKWrpYyv1/ZaPT69hUH40fi/j1xN/pBYtS7iGRaojjmx62Py09RIXPzU1FZ3IH1L852zUKDuqR9aGQuTE7U/lHtal87a7a3/4CJgX1L0Z1aMhTjd/d0j52hJFVxTIbAMzsFhzgW25ho6xEyd40ZhZUeSgrQKrswO35hv5IXepZzJUfAdWEjqTJQYuiejsz4+X7UjaW91KSa55HYgkUQ+wc+7b9oLKvUHKOfyGHA/1v2hIRpJ58PnieSg5KbU6icg4s6PeJAaUgjfAGOwy1M6wTI0qPCwAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVJGyw2LHjEItORcouG1RHmxCbyHtCprrecTAdfWzJ0=;
 b=EMML1SVxEMDo8C17wW3TbkGsEldXc3dw5R+uwD3PrJcsOLj+8goK1g0ibYPc78MaIAMZwPWi/4tDQu+vTZ6tv4HioNqh0N6LnH9SyRfxKGr4kQ6vOHBZYQFoR/aDmyVK/8HU78WcYYLL7y8PuvRC7vpdmBeQ65JgeZ/3Sr+oK13qFqZvvvbRJwWR1sFyw2sFWUD+HfuJGJKU7SUo9Omv9htFC++kD7eLj5I5b6VsjfxilU2q/FOo3925KoqO4eolfCb6qsqpyV3h5h/xx5eza4bQ+xvCLbxvAFf0FhLQrLu4N/21Cn/vSYOR765EeTiZZ+LIZQZZJ5OEAftn2pEhiw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2736.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 05:49:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 05:49:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V5 02/26] mm/mmap: Define DECLARE_VM_GET_PAGE_PROT
Thread-Topic: [PATCH V5 02/26] mm/mmap: Define DECLARE_VM_GET_PAGE_PROT
Thread-Index: AQHYieKjW/CNrIHFI0izFhfOoI2Npq1iv5eA
Date: Mon, 27 Jun 2022 05:49:35 +0000
Message-ID: <ebbd557e-b31a-0f56-1225-e8940b63d64b@csgroup.eu>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
 <20220627045833.1590055-3-anshuman.khandual@arm.com>
In-Reply-To: <20220627045833.1590055-3-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4ba4e24-62d9-4948-4e0d-08da5800d131
x-ms-traffictypediagnostic: PAZP264MB2736:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ExBhcM58xWpxcjdMrQR9AygLIhQMAQIqNViSg43ba4HYQM0UF2UKrGrShnsF2smS0PhYn/oxXeWyllZsIwMenAzNuYU9yRXKmiSTZ3gTPVwizZPDcMNWIO0SRInD4khBp7kUM0fuKcBurGp/IAbmpFihMNR9Z0VYxW7DCQsI25c/ue/e+XpWFbi3BDsHQ1BXWnwVDZFBbbkRWY78xZiGlwqg24AXg4gvhIxt0voJ5hBHioeblVdjBoPhor0ptjuvCeCbn/c6dtWf834zAwWuRaTcHdCu33n1EfGvALvpDLcKMlpjCcztnJLLWoLR4IbW23BST5QFw5iN9GKHAhiOaubVK0ZFwS2BY5BAG/m4wZ4bzRbup4yL5h0P0DwFk3DNA7MayWiK6Pp6VN5UwMcVP3DwqZgxONOLe7FVuV1+UyZbrZEfl3Zk8KHUUOFfW4Ch4d9icGWxl/0vhwyId7QPBsTRP42gW+UhblBUYICCQEsbG/XjGGYiIQ0eRIQnsJLaRQ4LVIqtwxdIUmZjDMjfbKGeFngOvRlAc+rVFtsuEvq2yc9fnSmtQV0qE7yt++exgwMtJ3Xuiq74hnPzYbclmd75g+VjxwgCgKvwcEMtKgqsIRHkfVtT3Xh9TNbXmVljoCtMIBF01bS/woZb1hDK6WC/XUUTN93sZIXjPAxs7/cUWsC9B/LTFIoGZJcJbv2i284NPCP4j9Uoqvb2YVf89m1h5lxgwKmWXcwINWYXVLFTJcVbizU60QjkctXwp38OsvbMGHMzYlJgZM3f6SfckMh/BG/9SyOZbVI02iSv8ngslGjQCBkrLJixdZCjWaCJCnn9c9lTSmIz5i/bZAya/5YX+ig6l3T8IB954NRWt14=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(39850400004)(136003)(8676002)(44832011)(4326008)(91956017)(83380400001)(6512007)(2616005)(5660300002)(66476007)(76116006)(66946007)(66556008)(66446008)(64756008)(6486002)(8936002)(478600001)(26005)(71200400001)(66574015)(7416002)(36756003)(122000001)(186003)(2906002)(110136005)(6506007)(54906003)(38100700002)(41300700001)(86362001)(316002)(38070700005)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dW9weWFEdDVib1VUanpqY2p5bWxqUExlS1FGSko0TE5OUzdPUFRlbmd5d3Rp?=
 =?utf-8?B?M05tMUxidmsyV2t6b2VkRFovRHZHcWV1VkZ3UEhKeG1LR2JkMDZtUGRGUGZm?=
 =?utf-8?B?QW5EZTNDMWJsSGZ3ajdzZTZRcEpRdk1mWDRCV1NEcVNvT2JDTHlwQkFxTFBC?=
 =?utf-8?B?czg5T3BsOW1VV2Vhb0Y5UnIzN2p1cTJ2UU1pOXZKZktIMHBYMmluV2hucmw4?=
 =?utf-8?B?WGxuNzVhVy9tc2JvandDNjNwU1RFdUd3NXBnZ2dnaTY4azdnTUJjY2s3dTBa?=
 =?utf-8?B?Z1hndmwrU3ZVdHZXdXV1QUJBZ1B5NXdwcGlCQm9Wc0FQd2tsVXNGNzllSVR6?=
 =?utf-8?B?ajd6MmJmelowbmh5U3ZQNUwwSkp1eURDQ2VkR0xPeVdiZnlLOG0rSkpwYVR1?=
 =?utf-8?B?WWkrT09KU2QvUTdFVHcrYmdBYTkvbmUzVUQxUUNOdW0rQ2ZBNDVORWRXSytv?=
 =?utf-8?B?ZUJFWGdqZ1F0eFJ2RnpUVHpSQ1BtUEFtR3NuMGZZcG5rYlhCdDk3bXp0UFFx?=
 =?utf-8?B?bWUzRURQTStkbk5rTDVQZmJpU0VoUUZTUjJKRVpwdko5VGJFUGxUN2FuV2U5?=
 =?utf-8?B?cVE2S1FCTTBQK3VodW1kN1MrdVIvd0QrdGo1ZG8wbk1lMnBaTGtBZElZRm5l?=
 =?utf-8?B?d0YvVllVT2lMMzlmMkRObmJtSENyazcwMitqWW90ZWJlazlzVkJpODJqaW1N?=
 =?utf-8?B?d050YVplK1gzUHB1TmttWUtDaGhVblFsVUV5QXgrNlhhNTgvRTlsSUFXWDkx?=
 =?utf-8?B?V2tUOXh2ZWhBR3lmY2hMTllqY211aUJQTTgyaFBBRkl5R1hkejJwMm1vQWE0?=
 =?utf-8?B?anVma0k3bFF2dzI2RVVpcDhVV3JiMVYxMHV0WmxwOHAzUm9Eb2c3QlU3MTFQ?=
 =?utf-8?B?ZVpOeUNXQlJJbHo0TnJkSjVBd1ZVQk1QRTRPNDhROWJUTnlwaWczZy8rVWlK?=
 =?utf-8?B?WlllZ0FEN1YvWUpRaDNCQnBWZjV2bGVyby8xa0o1cm1COG45dVprTGNEbGRS?=
 =?utf-8?B?MWUxSVNHem9PYkIwSGxGcGpndkpTVGFSY0x0blNBeVM0LytpVUNxMTRETWo3?=
 =?utf-8?B?R3dvM3FLRkEvMWRtcHlIYnNaaVkxcTFKZ1ZScnk4YktEZnlPa01lZ3owYVVK?=
 =?utf-8?B?UCtVODJHSmpHM1dDYUV5WXNOTm9WcWh1RytDM1dvNmVaZ3d3MmRaVlBpV0U3?=
 =?utf-8?B?d1h6c2RhLzlOWTc3R08vdFBYM09oV3dNSmhEdTZjbm9TL1pVZkM0RFpGYldI?=
 =?utf-8?B?alN6OCthZk9PNnJaZXFZbHRqcDJ4bEJWUGREdEVUWWZmWnFZZ2V4Rkc1aStZ?=
 =?utf-8?B?bktTM0dMbkg2TE9oeTZud3hreUt5NytVTTFKVHNTdk0yLzNDcWl0MWUrZ0J1?=
 =?utf-8?B?QlhkSVlkU0RLUnVMd1hPb3ByMG5uaEZkeDJCOWUyc1gzeFRnSi9hbXNGZEhh?=
 =?utf-8?B?eXlla2FhTXVNOFl1elV1VWFHaHhqVXVGRTIxMVJsWW9DKzZCWE5aZkozR05x?=
 =?utf-8?B?c3B4MmdlSnhBQnBBNVhaZEZ5Qk54YjY2V001L1hSN3kxdituZDI3WndaMmk4?=
 =?utf-8?B?cDlHaWEyaUlPUmxYaklZMXp1R3ZMWlRPUHM4NnQ5N1N5QzNUSXhVdk1aM0R2?=
 =?utf-8?B?aUlSWmFLQTFUekVNQmNXbDFjSzZXck16aWlQRnJRRW9xeVUvUEZhRWtPcVdV?=
 =?utf-8?B?K0xRek9FRGVOSFl5Q2hwNlAyeXN1THZsS2RGOGc0ZWdnZExPSC84U3lQbUNK?=
 =?utf-8?B?UGx6N2ZqSHlFcWkvRXpISU5Gem1rb041d0w2bW1QcGJjMURCMTRFV2ptMGsr?=
 =?utf-8?B?dnk4dHVQVXpEYnpRY2h0cERHbjZyd1NiOTQwcUtTQ0FPb1dVN3RoTlN6SWhn?=
 =?utf-8?B?T3JzYTM2emdna0dXL2Eyai8yNFFFMnd1NmJKdGhHZk9nOHVxRzEzUG81ditN?=
 =?utf-8?B?cVpRZUZYRE80b1QxR3pxYVMxaWxzVTArbFo1clMySlRrbHpnVjdMbmFYQi9J?=
 =?utf-8?B?UkYxeEdPQXBTNEZKUmo2RFhzK05PRUFpaXc1c2dtNytaRk43TVdkM3NvanRG?=
 =?utf-8?B?dWRzV2NwN0N6TTNMN3hXNXNKQk5XZkgvS1lxMkhEVXdYQ2tDTDhtUi9ydm53?=
 =?utf-8?B?UW1FSldLdlcxZFBCU1MrT3hkc2RaVEgxU2VJMW5GQkxPQXdIOEhYTGJrZjdn?=
 =?utf-8?Q?Sr2BKTFvMV5eIxLxBABbqm0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4774B7B89CD4747A3F3BB229952EBCD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ba4e24-62d9-4948-4e0d-08da5800d131
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 05:49:35.8791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qTQYiS73nVmU8LDnE8/MhbIWwdqEdFt1YVJYDU4DVCddfzQkVKXvDzQEACtgUzIDi6+zTJe0v6Nr2mADSlC/XT82F7HUAS6++/7eIPJogTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2736
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
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linux-snps
 -arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzA2LzIwMjIgw6AgMDY6NTgsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IFRoaXMganVzdCBjb252ZXJ0cyB0aGUgZ2VuZXJpYyB2bV9nZXRfcGFnZV9wcm90KCkgaW1w
bGVtZW50YXRpb24gaW50byBhIG5ldw0KPiBtYWNybyBpLmUgREVDTEFSRV9WTV9HRVRfUEFHRV9Q
Uk9UIHdoaWNoIGxhdGVyIGNhbiBiZSB1c2VkIGFjcm9zcyBwbGF0Zm9ybXMNCj4gd2hlbiBlbmFi
bGluZyB0aGVtIHdpdGggQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVC4gVGhpcyBkb2VzIG5vdCBj
cmVhdGUgYW55DQo+IGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiANCj4gQ2M6IEFuZHJldyBNb3J0b24g
PGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcNCj4g
Q2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3VnZ2VzdGVkLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFu
IEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hy
aXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAg
IGluY2x1ZGUvbGludXgvcGd0YWJsZS5oIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiAgIG1tL21tYXAuYyAgICAgICAgICAgICAgIHwgMjYgKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oIGIvaW5jbHVk
ZS9saW51eC9wZ3RhYmxlLmgNCj4gaW5kZXggM2NkYzE2Y2ZkODY3Li4wMTRlZThmMGZiYWEgMTAw
NjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvcGd0YWJsZS5oDQo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvcGd0YWJsZS5oDQo+IEBAIC0xNjg5LDQgKzE2ODksMzIgQEAgdHlwZWRlZiB1bnNpZ25lZCBp
bnQgcGd0YmxfbW9kX21hc2s7DQo+ICAgI2RlZmluZSBNQVhfUFRSU19QRVJfUDREIFBUUlNfUEVS
X1A0RA0KPiAgICNlbmRpZg0KPiAgIA0KPiArLyogZGVzY3JpcHRpb24gb2YgZWZmZWN0cyBvZiBt
YXBwaW5nIHR5cGUgYW5kIHByb3QgaW4gY3VycmVudCBpbXBsZW1lbnRhdGlvbi4NCj4gKyAqIHRo
aXMgaXMgZHVlIHRvIHRoZSBsaW1pdGVkIHg4NiBwYWdlIHByb3RlY3Rpb24gaGFyZHdhcmUuICBU
aGUgZXhwZWN0ZWQNCj4gKyAqIGJlaGF2aW9yIGlzIGluIHBhcmVuczoNCj4gKyAqDQo+ICsgKiBt
YXBfdHlwZQlwcm90DQo+ICsgKgkJUFJPVF9OT05FCVBST1RfUkVBRAlQUk9UX1dSSVRFCVBST1Rf
RVhFQw0KPiArICogTUFQX1NIQVJFRAlyOiAobm8pIG5vCXI6ICh5ZXMpIHllcwlyOiAobm8pIHll
cwlyOiAobm8pIHllcw0KPiArICoJCXc6IChubykgbm8JdzogKG5vKSBubwl3OiAoeWVzKSB5ZXMJ
dzogKG5vKSBubw0KPiArICoJCXg6IChubykgbm8JeDogKG5vKSB5ZXMJeDogKG5vKSB5ZXMJeDog
KHllcykgeWVzDQo+ICsgKg0KPiArICogTUFQX1BSSVZBVEUJcjogKG5vKSBubwlyOiAoeWVzKSB5
ZXMJcjogKG5vKSB5ZXMJcjogKG5vKSB5ZXMNCj4gKyAqCQl3OiAobm8pIG5vCXc6IChubykgbm8J
dzogKGNvcHkpIGNvcHkJdzogKG5vKSBubw0KPiArICoJCXg6IChubykgbm8JeDogKG5vKSB5ZXMJ
eDogKG5vKSB5ZXMJeDogKHllcykgeWVzDQo+ICsgKg0KPiArICogT24gYXJtNjQsIFBST1RfRVhF
QyBoYXMgdGhlIGZvbGxvd2luZyBiZWhhdmlvdXIgZm9yIGJvdGggTUFQX1NIQVJFRCBhbmQNCj4g
KyAqIE1BUF9QUklWQVRFICh3aXRoIEVuaGFuY2VkIFBBTiBzdXBwb3J0ZWQpOg0KPiArICoJCQkJ
CQkJCXI6IChubykgbm8NCj4gKyAqCQkJCQkJCQl3OiAobm8pIG5vDQo+ICsgKgkJCQkJCQkJeDog
KHllcykgeWVzDQo+ICsgKi8NCj4gKyNkZWZpbmUgREVDTEFSRV9WTV9HRVRfUEFHRV9QUk9UCQkJ
CQlcDQo+ICtwZ3Byb3RfdCB2bV9nZXRfcGFnZV9wcm90KHVuc2lnbmVkIGxvbmcgdm1fZmxhZ3Mp
CQkJXA0KPiArewkJCQkJCQkJCVwNCj4gKwkJcmV0dXJuIHByb3RlY3Rpb25fbWFwW3ZtX2ZsYWdz
ICYJCQlcDQo+ICsJCQkoVk1fUkVBRCB8IFZNX1dSSVRFIHwgVk1fRVhFQyB8IFZNX1NIQVJFRCld
OwlcDQo+ICt9CQkJCQkJCQkJXA0KPiArRVhQT1JUX1NZTUJPTCh2bV9nZXRfcGFnZV9wcm90KTsN
Cj4gKw0KPiAgICNlbmRpZiAvKiBfTElOVVhfUEdUQUJMRV9IICovDQo+IGRpZmYgLS1naXQgYS9t
bS9tbWFwLmMgYi9tbS9tbWFwLmMNCj4gaW5kZXggYjAxZjAyODBiZGEyLi5iNDZkNWU5MzFiYjMg
MTAwNjQ0DQo+IC0tLSBhL21tL21tYXAuYw0KPiArKysgYi9tbS9tbWFwLmMNCj4gQEAgLTgxLDI2
ICs4MSw2IEBAIHN0YXRpYyB2b2lkIHVubWFwX3JlZ2lvbihzdHJ1Y3QgbW1fc3RydWN0ICptbSwN
Cj4gICAJCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnByZXYsDQo+ICAgCQl1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCk7DQo+
ICAgDQo+IC0vKiBkZXNjcmlwdGlvbiBvZiBlZmZlY3RzIG9mIG1hcHBpbmcgdHlwZSBhbmQgcHJv
dCBpbiBjdXJyZW50IGltcGxlbWVudGF0aW9uLg0KPiAtICogdGhpcyBpcyBkdWUgdG8gdGhlIGxp
bWl0ZWQgeDg2IHBhZ2UgcHJvdGVjdGlvbiBoYXJkd2FyZS4gIFRoZSBleHBlY3RlZA0KPiAtICog
YmVoYXZpb3IgaXMgaW4gcGFyZW5zOg0KPiAtICoNCj4gLSAqIG1hcF90eXBlCXByb3QNCj4gLSAq
CQlQUk9UX05PTkUJUFJPVF9SRUFECVBST1RfV1JJVEUJUFJPVF9FWEVDDQo+IC0gKiBNQVBfU0hB
UkVECXI6IChubykgbm8JcjogKHllcykgeWVzCXI6IChubykgeWVzCXI6IChubykgeWVzDQo+IC0g
KgkJdzogKG5vKSBubwl3OiAobm8pIG5vCXc6ICh5ZXMpIHllcwl3OiAobm8pIG5vDQo+IC0gKgkJ
eDogKG5vKSBubwl4OiAobm8pIHllcwl4OiAobm8pIHllcwl4OiAoeWVzKSB5ZXMNCj4gLSAqDQo+
IC0gKiBNQVBfUFJJVkFURQlyOiAobm8pIG5vCXI6ICh5ZXMpIHllcwlyOiAobm8pIHllcwlyOiAo
bm8pIHllcw0KPiAtICoJCXc6IChubykgbm8JdzogKG5vKSBubwl3OiAoY29weSkgY29weQl3OiAo
bm8pIG5vDQo+IC0gKgkJeDogKG5vKSBubwl4OiAobm8pIHllcwl4OiAobm8pIHllcwl4OiAoeWVz
KSB5ZXMNCj4gLSAqDQo+IC0gKiBPbiBhcm02NCwgUFJPVF9FWEVDIGhhcyB0aGUgZm9sbG93aW5n
IGJlaGF2aW91ciBmb3IgYm90aCBNQVBfU0hBUkVEIGFuZA0KPiAtICogTUFQX1BSSVZBVEUgKHdp
dGggRW5oYW5jZWQgUEFOIHN1cHBvcnRlZCk6DQo+IC0gKgkJCQkJCQkJcjogKG5vKSBubw0KPiAt
ICoJCQkJCQkJCXc6IChubykgbm8NCj4gLSAqCQkJCQkJCQl4OiAoeWVzKSB5ZXMNCj4gLSAqLw0K
PiAgICNpZmRlZiBfX1AwMDANCj4gICBwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsxNl0gX19yb19h
ZnRlcl9pbml0ID0gew0KPiAgIAlbVk1fTk9ORV0JCQkJCT0gX19QMDAwLA0KPiBAQCAtMTIzLDEx
ICsxMDMsNyBAQCBwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsxNl0gX19yb19hZnRlcl9pbml0ID0g
ew0KPiAgICNlbmRpZg0KPiAgIA0KPiAgICNpZm5kZWYgQ09ORklHX0FSQ0hfSEFTX1ZNX0dFVF9Q
QUdFX1BST1QNCj4gLXBncHJvdF90IHZtX2dldF9wYWdlX3Byb3QodW5zaWduZWQgbG9uZyB2bV9m
bGFncykNCj4gLXsNCj4gLQlyZXR1cm4gcHJvdGVjdGlvbl9tYXBbdm1fZmxhZ3MgJiAoVk1fUkVB
RHxWTV9XUklURXxWTV9FWEVDfFZNX1NIQVJFRCldOw0KPiAtfQ0KPiAtRVhQT1JUX1NZTUJPTCh2
bV9nZXRfcGFnZV9wcm90KTsNCj4gK0RFQ0xBUkVfVk1fR0VUX1BBR0VfUFJPVA0KPiAgICNlbmRp
ZgkvKiBDT05GSUdfQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVCAqLw0KPiAgIA0KPiAgIHN0YXRp
YyBwZ3Byb3RfdCB2bV9wZ3Byb3RfbW9kaWZ5KHBncHJvdF90IG9sZHByb3QsIHVuc2lnbmVkIGxv
bmcgdm1fZmxhZ3Mp
