Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAA8812B9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 10:28:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=MkLdPBCa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrRqG5D65z3w7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 20:28:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=MkLdPBCa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61c; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrRpT5VsWz3w56
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 20:27:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbHrzHCC79E2++YWFTyK8F3KVY0+2p50SLNR85qV04Dx5V/QTJzK+V8yhxERpVUl0RLGB+mJbadFZBh4Gr383zqraGhz7IRWDzTz6YVUOeNu+cRN0Y/g3gC0EEdCxQwdXq0qNxdd2GFOcLhJoDDUQFM1z5Q0sLa6ogHu652hp1TfQaiqnyCw2tvjQnKJr1PNBlwcgI86YpI8X9FBaIuq5ugqt2effrnhcc2TAwfCj4cJFEs+R/OIw8ocued6lMvMyjWGGMAoesCdeV8TOg+NRYo1zNSf4HzYrvAtYvh95rPOSQ71oSgH7GJsXv3jOEqxi7WJARf2w+yKhZwubfTQkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jq6dUynZLM/DYs1PNsFstHof4JImW6mSe1PVvXI3EJ0=;
 b=R2WQkutVOz7ZEq7M+H14o/5ZW2F+JWkpm6G2hGGUq/xvI/gUisCdjsLaOhDOJrQ6F9snp1bpox3NQCU7ctl8+fyw1lla6ag11NEq1VhkT3qNL757ieVopDJUVe0R/0hSWIQFcrty1LLyBdoISgI6oc3GgVeuDn8YOJOfB/OBdFxDn954ghFo5onbRjNcLA+hvtwu3SdH3f1lG5/1etx+FYdzoYFPfINx6JTjH7eo6o5e/+y1ODKA4VQ19y8ww89DD5DmZfB0jyo6UDRf5CUh+y8r32EE4iPys7/E8MOIrQN+moup/aDupxjvy5RNIP0Br35my5CPXmIhBdOnxCnCGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jq6dUynZLM/DYs1PNsFstHof4JImW6mSe1PVvXI3EJ0=;
 b=MkLdPBCaPE8rUHY6Ce96HJiFxBZAq3FTfo0PoLD13dGbhPf7nZYLMZ+KqRj+ix1rbKFaeSbYYsEQ+t3H0+V+dqW65IOlWfTHVHyazGBHShUJMt2DY6cbUgATp2EbMR4rN0z0QrUqNVfGn3g1zV7NthCQVxx2LCuEbqVx79zbnl8xsTMSJGcIHH9JSdN+T9D3GwJ/1UUgBQIAdqUqMu3qgNfzdwqWXvf83qTyE4QIkxC4zuk2AqING06Y/fN5nzzXzySMzXDiTFZAFooj1mXKOj0uCYw6XsSdc0n+XPzRK+AmfaX/nA8WBImHE6VPhbr6oX5si4o3WX/sQV/1GtEm9Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3294.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Thu, 14 Dec
 2023 09:27:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f788:32b4:1c5e:f264%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 09:27:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, "glider@google.com"
	<glider@google.com>, "elver@google.com" <elver@google.com>,
	"dvyukov@google.com" <dvyukov@google.com>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH 13/13] powerpc: Enable KMSAN on powerpc
Thread-Topic: [PATCH 13/13] powerpc: Enable KMSAN on powerpc
Thread-Index: AQHaLlJKFt27m+mMQUKs0pZ7BCJjwLCogtWA
Date: Thu, 14 Dec 2023 09:27:22 +0000
Message-ID: <e51947db-747b-4b97-afee-198934c16ee6@csgroup.eu>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
 <20231214055539.9420-14-nicholas@linux.ibm.com>
In-Reply-To: <20231214055539.9420-14-nicholas@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3294:EE_
x-ms-office365-filtering-correlation-id: 09574041-9e0e-4b22-617a-08dbfc86e0c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5dPPt/UKh03RLfEWhAoaFRJ2eXewupvP/1lpy7xVrHAiJFMdgKfAmBTL+ReG4DqfB6UFEsspswdnMjLhOniAMgXDg0FogHJt+BsaeO8UpcmJvrOLSeDXySNN9gLSS7fhKxGPx3XwDCdz7NSaI0M3NuyVtZ2ZaYX8Ej9qCbekYnQ+rQWNZLepsaA01qmrHE8yQuhmhS1zAgdX09Z4Q56AAidkaLl1DwRS/50/+s6qUoIAnMA8W9GNDVaYawWq6QjVdiL6f9uOrvt5LQiWYoQ9LEXI97+JYHi/L6E82qRQey04x0XZDO+kCdKnTPBzs1wnKh1IfXEzyidCkA5xUrGJxV1lugHFr3OLeZsaKMeOf351TeOcStb7RF7uFwGrabhFbDSsUpMstHvPNS7KC3+6F3yJANFUUOoojmLG4/u9E1HzIKUY59L+K0C5B0bWzDjyws5UmvK3V6oCGcFCbAJbKODKzM/y5zXmAEz2+iglpuspEtc1OhlCHiKiienBZOCArNqYUGtp+Fk3o8L78bqa3mm/oKZn5omhCXwZWb7N8820DIXuXpVap+yy5eW8xyqY7lqf/on/gg801zbO9ys2fknWA1BDTHidK/MNe87Gg+i3Q/I0OOOyI6opkZjn3UQG2+KIjzQrUBNYCTVejmFOd5+ruWqqmE4dElyAaZq0FGV/MBoFCjFl758tyNFX8nEg
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(136003)(39850400004)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(31686004)(6486002)(478600001)(6512007)(26005)(71200400001)(6506007)(2616005)(122000001)(38100700002)(38070700009)(31696002)(86362001)(36756003)(44832011)(91956017)(76116006)(64756008)(66556008)(54906003)(66446008)(2906002)(66476007)(41300700001)(4744005)(7416002)(316002)(66946007)(5660300002)(4326008)(8676002)(110136005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TkxNeUo0YW5xUTFlZGdrVllQSVVVSFdkTHB5VnlaU3huekxMQ2oxNzR5dkVX?=
 =?utf-8?B?QlpEVkVHNUVuZ0oyOEc0bWVIbUpTWUREaitKT01GUW00b0I1Q1JZeWptS2dE?=
 =?utf-8?B?RXZzT2ljMHRpV3ExbHBBQXJyUjhEOTVwK3lTbFlObkRJQlhhZkZLZS9LY3Nr?=
 =?utf-8?B?Q2d1MGg1bWYwVFpJcnBZaVkvZ1BrdWxJcmZRK1V4emdsREtMamdNSndEUDZx?=
 =?utf-8?B?Tm1nT1JmVVFFVkY5R2p3NjRGZHJJUlhsZWErYWZ5L1FEOHdURHIwbVk0SlNW?=
 =?utf-8?B?NVZzR3hKZ2k5ZVE3NEZ0SFppSEZVcWVGNWk4UTBwbW5GOFIvNXhWMXhVUFB5?=
 =?utf-8?B?TWNjZDh5aDFUT3RxN2toTHhMcE1qc0dIdUlIUzNIWENteU5odzhwVXJkYXA2?=
 =?utf-8?B?ZktPeTJnVERFSjBQMCtKMisyQmprUmlITU1OMWRXTWtYTFpxM1R6QjVaTENT?=
 =?utf-8?B?WFN2UjdEWWtZKzNNZnRlYlJBTEdSUURTajVzd0hJSTRnT2NLY3dUek5oWGEy?=
 =?utf-8?B?cU1sUVk5THhUYzNmajRxcGJXSlo5VEd3cUVrcjVIV2NqdmdybndJTkM0RXBy?=
 =?utf-8?B?b1ZhVTNjKzJDaFd5RzFVd3RUT1lpZ0I5VnFaVzBwNnUwaVNCaC9aeS9wN1Va?=
 =?utf-8?B?WDN4N0VkNmhpcWR2OW1BYWxnc0Q1ZGFVMnpyLzVLRDNOYzFveE1FQ0x4TDBm?=
 =?utf-8?B?SUdHditlWVZwZktwcmZtUThsOEl2VkZTNHlWNXpQWkpFaHpvKzBBT2UzUElm?=
 =?utf-8?B?VXA4ckN2ZGxTSmFUekM2cWRMT0czaUEzc2pyV2tKaGdKSnl5OGFHNytzTFph?=
 =?utf-8?B?WnNqNWRqWlpUSVFsTVRkaFI3Vm1TOFQrNFVPaCtmZDl6eU1QdjdXQmJ1TGU5?=
 =?utf-8?B?UkNudEM5V01vRkJnQ29WcnRRalNkUFUrY0haeTU4WTM2aS9KdGROeEIzTUZP?=
 =?utf-8?B?VTZEdDFPbk5WUUJmMWFCNTZjOVpjWEdjZjFSN2ZKWUNRZjdEckNJZmZBK2xY?=
 =?utf-8?B?eDZtWGFuQ3FrV2lzamg5Qmx6R0dQT0V5WjF6MzA0cDVCK05IL2QrbkF2eHRX?=
 =?utf-8?B?RXlhUGJPdjhIYTltMGpsT0pCSmNxYkRsenFocnZuSTU0TlZJaWxXcWZZQ05w?=
 =?utf-8?B?czdvZHpUS21sekRyL1FaOVI1anM2Tk53enRCbWtZR0U2bWZHWnhDdUhLR3BG?=
 =?utf-8?B?WXhDNlpWWEFJSmkyNnRSQzFDZzFFT2FWdnFEVmM0S2V5YVRaV0hFblNncXFX?=
 =?utf-8?B?dk1LQnlRd1ZPalVZMDl5TWZ0eDBTR0s3TFJlRjc2QXpGZ2tXaW1RQnRRcVo2?=
 =?utf-8?B?WllFOXkzMno3bi8yZW9tb1NGTFFEeTlwNFFGUnRBUlJ4dlpOWk5aVklJUUph?=
 =?utf-8?B?TVVxY3Q4c2NCM1Axb3g1UDdZSlFjUHBlTjVOQ3lJUEpFK1ZmeXAyVGxFNVl4?=
 =?utf-8?B?ZCtvbHpsSU1XN0tob3NHNjdyUnhMWTI5cm84RlpOY0JkOWhXeWlveE9zcTlL?=
 =?utf-8?B?MTl4aWlIc2cwWWNZelpDSjZlOVMyeGZ2TXpyaE5QRjA1ZmJNYUdxVXVVczU0?=
 =?utf-8?B?Syt4TVg3N3BzZ3Y3aVVySVJzYk9qZVhyMFJJSzNySGdRN2NIY05sRnNOcEdG?=
 =?utf-8?B?UzBiQUVXZkxhRkNKUW1UYUplanVJSjNoOFJicnB3UGYzQXNNQ0ljRmIvcnUx?=
 =?utf-8?B?azZCdmRtNHczSFg3VUlsNXE3bE9sanlNcWFPdVZVVDVRYmY0OHFXZmFtbDhY?=
 =?utf-8?B?S0FtNzNjeDlHeGVNcXNyS3V1Ymt1MG5BbFd1NjhlYUJQcG12UFlnUDVMcmFU?=
 =?utf-8?B?VUlUMUdaM2lNZ0NOVUViVHVYdVhMbEdrVkx5YVJFOHNiUUdLcDJpTjRKU3px?=
 =?utf-8?B?cWtkVjZDTjJ6TjRjaEdkd09tbHhYNENzVytzeDUwaDVnVXRac3ViZDNZeWd5?=
 =?utf-8?B?WVhuNTlRQk5GRVg0U2NvWC9ISVNvb1NJWU5HbzdWU1hLUE1YQ3hmdS93UWRx?=
 =?utf-8?B?Z2wvSkU2dk9TYjU0Qmpadjd6QlhYdTZHUEZyQU5RY3FoKzBseExtTHd6U3Fh?=
 =?utf-8?B?M3JEK3RucVd6SkZLRDBnSFhyeTNWSkJCeEdaTHpUSjlZdXRwUVN0SFdaQlk3?=
 =?utf-8?Q?IC6w+JnbvRbD8QAKZEDniq1ZG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FBB2617CD3A1B44B9387CBEA20E848C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 09574041-9e0e-4b22-617a-08dbfc86e0c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 09:27:22.8953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FM+VNAw/ny2SPc6CJfGyuQIUUMHZiInZbcbmN+GzRRScCgbp8wGtiPDZ1v72vQ0PVS9LZVQMCU3v6Jk0Po7sQrXiK74DLQwoLI7Xc/akl1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3294
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "iii@linux.ibm.com" <iii@linux.ibm.com>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjMgw6AgMDY6NTUsIE5pY2hvbGFzIE1pZWhsYnJhZHQgYSDDqWNyaXTC
oDoNCj4gRW5hYmxlIEtNU0FOIGluIHRoZSBLY29uZmlnLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
TmljaG9sYXMgTWllaGxicmFkdCA8bmljaG9sYXNAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAg
YXJjaC9wb3dlcnBjL0tjb25maWcgfCAxICsNCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93
ZXJwYy9LY29uZmlnDQo+IGluZGV4IGUzM2UzMjUwYzQ3OC4uNzFjYzdkMmEwYTcyIDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiArKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZp
Zw0KPiBAQCAtMjE3LDYgKzIxNyw3IEBAIGNvbmZpZyBQUEMNCj4gICAJc2VsZWN0IEhBVkVfQVJD
SF9LQVNBTl9WTUFMTE9DCQlpZiBIQVZFX0FSQ0hfS0FTQU4NCj4gICAJc2VsZWN0IEhBVkVfQVJD
SF9LQ1NBTg0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0tGRU5DRQkJCWlmIEFSQ0hfU1VQUE9SVFNf
REVCVUdfUEFHRUFMTE9DDQo+ICsgICAgICAgIHNlbGVjdCBIQVZFX0FSQ0hfS01TQU4gICAgICAg
ICAgICAgICAgICBpZiBQUEM2NA0KDQpZb3Ugc2FpZCBpbiBjb3ZlciBsZXR0ZXIgeW91IGFyZSBk
b2luZyBpdCBmb3IgInBzZXJpZXMgbGUgZ3Vlc3RzIi4NCg0KV2lsbCBpdCBhbHNvIHdvcmsgb24g
QkUgYW5kIGFsc28gb24gbm9oYXNoLzY0ID8NCg0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX1JBTkRP
TUlaRV9LU1RBQ0tfT0ZGU0VUDQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfV0lUSElOX1NUQUNLX0ZS
QU1FUw0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0tHREINCg==
