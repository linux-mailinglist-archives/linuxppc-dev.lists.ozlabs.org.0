Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCED46177D1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 08:41:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2wgk433yz3cLx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:41:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xqZvAIQw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.42; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=xqZvAIQw;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120042.outbound.protection.outlook.com [40.107.12.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2wfm3s5Vz2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 18:41:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmVLoRPfJbN8p+aAFH72wY9IRyE+TON9JeMUOVElztU3+8QocLTWOZ7064avF9M7ZU5YjjeVZl+w3G9aCJMKSbGhjdNvRIV1GqJB3dSmzIuGF64PD/DL0X7aCZTbORgBZXEg/qIxR5qpRwHvLsOMRNy+SUFFV4l6vF6iy0ZwrW/8cIRQJeR9sgqumHIWR/LDinK4fOZyUqhlrEPSE6EYacFiwxOc7FYA6XscX36RS/XbdJKWXuS8lI4wBNCOBn6mHVcDh2qP+a8cGjpxZPs8LEd/5EqDB51a0wAJk2IYzRboNNMGz6k+za+rWP/szOxZU35n7vKzte/B+1zsovnyZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qnGvTGzB2WBtLO+riOzlatqGx1cqUdcLdj5glxQi34=;
 b=bBJKzRuPwchF3GTiU3ltEBAvOiuNvahOaCl1tQJDAGPMiRtOZpbPPFHFfW2pSbj+YBT+sFpM8QPe1WUyMs06ycGkgrXa/5McR5v/oO5nBP4yYqLfYhk1sX41T6qgSlU82hmRmrWkBr+cuQFg3AS51gej8mAy5dWC6Zg+l6D+rXu4jsRz36AQ+9Te8EdXxwz2w40hQJ5l4+LWIuJJGrMTIkIe981pduX4KNo50Uy39f59h9OFhYY8B6bXwP6Rh33bjE4lc14laW6XNLT8yY3Eq4Z/cSYngQ9tfL6wPj2m+/xUCMEsluD3wYYYzGG5dXuqKMEPT/65WSu9VvpkyNeb1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qnGvTGzB2WBtLO+riOzlatqGx1cqUdcLdj5glxQi34=;
 b=xqZvAIQw/d5sOsktUDU/D540lgOtpowX+gSOjokQGb7+vbPZVseXa6dY8I2pm4BA7xM7zhvbdykE56ARc4Qyvp+yPn+3IQU2ils1ytSBAycREeaNCRw61Aq/2CF2WhkZx/jh/loDxkf1AIC4U0yYa51WczrQAIvn/mgcgWp6Xl1riob8uEdBVYwmYH99JRoXGx+JOkBgD49VHtrhAql4C4nUgnmh+FBtlUZzcFJPOkK09X/ID8dBj5WZGZS7I4XrFYSlY/r99hbTORUrjLwNjattq/O4NoHB5WE/RaiNZDlgvCNFt8vhKAiD93WTxKAeqGP9F5dyYxzIaO37b+Ov7w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2202.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 07:40:45 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 07:40:45 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: wangjianli <wangjianli@cdjrlc.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/kernel: fix repeated words in comments
Thread-Topic: [PATCH] powerpc/kernel: fix repeated words in comments
Thread-Index: AQHY5dXaa29CQM/ddkC7kLSe4nETaa4s43SA
Date: Thu, 3 Nov 2022 07:40:45 +0000
Message-ID: <30acd155-963b-b8c1-a555-dec017c8af74@csgroup.eu>
References: <20221022051247.64377-1-wangjianli@cdjrlc.com>
In-Reply-To: <20221022051247.64377-1-wangjianli@cdjrlc.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2202:EE_
x-ms-office365-filtering-correlation-id: 57c586a3-44dd-434c-551b-08dabd6eb7e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  OBf1gqEEjBcPfAHHith+wfrYSXj/VwnCXY591L//mEd63cYDuEjgVqxHwGyqqh7U9aAulC4n8fsUYGWn/7ADZ1xF5Sta3WOEEiA6vQb0cVlq0jqzxU1twBJeQM4m0utr76tE23Qm/5Xk3IbwYcYs88t3IfvvPuD29bHM5DP7YEdw+mbfDYCg8U+Qviq70LMEEaL76kPU5xfwwv3sdFxINPYCIOwPgJbd7nWiYAHUQKIxUvHmpo3nPkpHTfBnXCo6OyKNZ96hFwaMqZLvcsnstO7FOZ2BmtXu8XnAQM2AojJO3bcvS2zULfVMb9LSRLit1yNvYVasnMQtSuMSKo4beJHUhI+fHHFlzEXRIt5R0OuCxzh8iWQu61r3m5BYuKloky2nABjIe6XqURcf5jLEQU1umU/FlJN+HB3dCLZNgnU9j+DAcnaidrCryUTpQT8irsp/I6Ne8dqkNoHXsOfc9s2w5Ft6//hwgT55coPSf31N5n29avx0axCR2yyX5sbrtP+TE9Ls5vSFgKjPQ8injfL4avILbyJltpbAJmMu0pvUELs+glk6ppLGesS6u8dCNRaRUnR5fMWydDG56EFH2S7khvVT38VzNbavuvS4VSykhFvntIGDcCFdSiI4Q1PEUAHlGqQjGvOphmsJ+hjqOu/DyQw8/3rJCWnBLUCjA9VdQ5yq5Q3meTxSIywRlSpKce8yaM57dF8PyWcAjDGjWkZYhvPAAljUOVQSpGA2z2OeUoSz2Xu08yAqMKT7tuKIt8m5R58pW0cwFAh7CZmCsAcVGHGfHDQjsGYVPQLFVmbpq0rWNK9UyfazrkIGha7jlJ/bS7hd6IkzcDIpL7SzIQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(366004)(136003)(376002)(396003)(451199015)(71200400001)(2906002)(31686004)(316002)(6486002)(54906003)(478600001)(110136005)(6506007)(38070700005)(76116006)(66946007)(8936002)(41300700001)(66556008)(66446008)(66476007)(91956017)(36756003)(8676002)(26005)(4326008)(64756008)(6512007)(186003)(5660300002)(2616005)(44832011)(38100700002)(4744005)(66574015)(83380400001)(31696002)(86362001)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VEp1TGJvdFZPZ0grNngvRjN6MnBlOUF6ZGM0N1RUMVMzbE1sWU5hSnhkTHhx?=
 =?utf-8?B?VHRMME5aOExsYnl6OTdNdUNsNVZkM3ZaYkJKb3d2aGlPNUdtL3N5QjNYZG5X?=
 =?utf-8?B?TGRCYmNkdlRacENnUU42RTJwMWpVRWVRaTdRQTNONnk3WGZwbUlPV2YzTVBl?=
 =?utf-8?B?TklRd0E3cDgwVDd0NVhTcVFOdVRiWDhFQVZhdVY3Y250cVJlOEJBcnYwK0k4?=
 =?utf-8?B?c01GNlhPQ1NEVzdQVlpYSVMwbXMrd3J6VlA1TWNQY3pFYkFVNE1ocUxnQjF0?=
 =?utf-8?B?ZlllMi9PSWJOL3JCYVlEREJ2MG5qdVRyZkh6bzFGZ0E0K25pS2VCclI0Wmdq?=
 =?utf-8?B?RGFkN1RydC8ybThBdHh2YlJvYy9zV0h1RzFMZ2VFL2llQzRWbGlreFRVdmV3?=
 =?utf-8?B?QkUyQlYxVVlHa1JodWZ3L3czazB4eDdpdHJPT3ZDQWRqc2w1cXVPbUpyYWNV?=
 =?utf-8?B?WmZaYTBYNlBmdUppNFYzSHF2dUpDclpBeWJEQ0RaQ3ZsaDdXYmM4MmVyT0lW?=
 =?utf-8?B?eERrMTNmNnV4ZEYyK3ZiVGxGQ0QrUlBIcFFMTjZoSGFCYytSYWgyM0I0ZE5K?=
 =?utf-8?B?ak5ZaDhYS1Y3UTFxcGdTY0xueE04QUZCQnBwVU16TzQxN0VjdGthNW5iTjNH?=
 =?utf-8?B?VGh0UWxTUHdRY1RJNWZxTmdVc3J5UEQ4VTdjWGd5Y244WXlJRHN1UzFZbUNM?=
 =?utf-8?B?ZlRBa2lubXJ1NTJ1QUx1WDRXQ0VtcGRkOFlIMHp0UDRqT1lwalFndGpIOG4r?=
 =?utf-8?B?bGY5M2dwL1FvL3dlQzRMbmozZVNDajBtQ3A2bTZIMWxjclBjSmx4RFNWbGto?=
 =?utf-8?B?bHlDNVRPbGRwUVVKbmRQUXNYQ3NGaTdYODA0Z0Q5bndTZXlHTWIreFpjWHpv?=
 =?utf-8?B?S3pVUHJwWlJnZ2lyd2RjZmF6b2FodnoyWkhuL2libTdOWEpSd2hndmFidm5Y?=
 =?utf-8?B?ektZT3dCODYvMFN3UjJDSFd5UzNIRDRNYkFGZ2R2UHdoNFNnUk91MnpnazAx?=
 =?utf-8?B?Rm9YeGkyOWw2TDRZdWE5c0pGQUd3VlVZNUdEU0duQVR1dzh1YUxVRTlaVGNQ?=
 =?utf-8?B?UU1qdVZHV0d4ODJ3bnlUU2h3YXAzWE92Tmw5UGRUemtwUkNmeGRSZjFkd1Yw?=
 =?utf-8?B?NTUxandMOHFlVTQ4T0plMWZXK1FWZzVYL2pncmtITFBMVHpNdTlvL0NBR1Fl?=
 =?utf-8?B?Mlh2cm9BNUdxTXh5bk8yR3JmazB3SVBSaDdXbWYweEMxZ2x4ajdyT3gxQ283?=
 =?utf-8?B?NEZkbHBzL3RMa0ZHZ3Z2L2JyU2xmR3kyQndWRTI3UHdsVEpTcXB4b2ppbG5a?=
 =?utf-8?B?VGIyS2x4VVVSeUVtaEVBQi9PNysvUEVtVWV3OVFFV1k3UHZManZDV2dza3VT?=
 =?utf-8?B?RmR1bzFDZ3FhWnJmNXFjZlJYemsrVHlDN1RZbCs5VDBWaFlHK2llY2xsejAv?=
 =?utf-8?B?Q00zcitqMUZHOVVPUU5hZzlodkFVd1RYWUowQnFGQ1h2YjdQSStMTU5GdVV5?=
 =?utf-8?B?L0s5Y2NlL3Y4NlZTY0hYSlFmdGk4WmhxanRNSHNwUSt6c1JIaVlFS0k1T1J3?=
 =?utf-8?B?ZGJtM25MZ2hxdWs3UnZra2RKZjRtci9tSEt1emNqWEVFVTlxS09YMjBZb01O?=
 =?utf-8?B?K053ejJLNGZLTXdKdEdRRXZXaWU3dEtMdTBSaGNXTG1VTG9GbTAyMWF6eTkx?=
 =?utf-8?B?RWFGUFk3Nzg2WVJBZU81NjJ2aVBQaG5GcXI4blRtWmphdnJlUng3bEdWK3JU?=
 =?utf-8?B?ZDZtbDB6Y0FZK2pMYnY1OFlxK3BhUzVySXpSOCtxTzR5WmxUZm9nZEtiQytM?=
 =?utf-8?B?Q2lPaC9taVZtSTV6d1F3eU1MeFNQRlNndk9kRWdxTmpXOXlnRVlHbFF4TnFj?=
 =?utf-8?B?T0V1L0svdlI3QUpWdW9aYUFSV1F0bkFSUERxWjR2VE5Jb3B0R3FreC9CQ01a?=
 =?utf-8?B?K1QzTXh1eGY0eGV5bEVUaytUcFNmajArYm40cEJWTFZpa1gzNFk0QzlxWDY1?=
 =?utf-8?B?OFc0VHFjTzRSK0ZLNVh1WDhSR3VtRnJ1WCtieHpia2lFbFQzNldUVFRlWDdP?=
 =?utf-8?B?Y0cxYXNGNkljcVhHS2dTbmE2SUpqVC9aNUpNM1hzaHhmSEdtNWFlS3VpMjlT?=
 =?utf-8?B?ZTIyWDRaODhXN280bGxHUk9WMkRjdk9EVkd4RnpBTThEL0ZsdmsxV0Y4dkVw?=
 =?utf-8?Q?cVGNqDWc9XkWX+qrgDvRdUI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34AFCE607CB3144A9CDAB16D0635FBDC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57c586a3-44dd-434c-551b-08dabd6eb7e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 07:40:45.5084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5pYpsHJ38I214jNabXxynDu4SdwosWROwD1t4slJ4+zFoysPc0Evh5AES5pyzFFGoMjwVq4Y0sj3KYKKLdH+j+qQNI5y00l4hHAgTF68HQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2202
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

DQoNCkxlIDIyLzEwLzIwMjIgw6AgMDc6MTIsIHdhbmdqaWFubGkgYSDDqWNyaXTCoDoNCj4gRGVs
ZXRlIHRoZSByZWR1bmRhbnQgd29yZCAndGhlJy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IHdhbmdq
aWFubGkgPHdhbmdqaWFubGlAY2RqcmxjLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tl
cm5lbC9wcm9jZXNzLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9w
cm9jZXNzLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYw0KPiBpbmRleCBlZTA0MzM4
MDk2MjEuLmFiNzg2ZGE4YzMwYiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9w
cm9jZXNzLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMNCj4gQEAgLTE3
Myw3ICsxNzMsNyBAQCB2b2lkIGdpdmV1cF9mcHUoc3RydWN0IHRhc2tfc3RydWN0ICp0c2spDQo+
ICAgRVhQT1JUX1NZTUJPTChnaXZldXBfZnB1KTsNCj4gICANCj4gICAvKg0KPiAtICogTWFrZSBz
dXJlIHRoZSBmbG9hdGluZy1wb2ludCByZWdpc3RlciBzdGF0ZSBpbiB0aGUNCj4gKyAqIE1ha2Ug
c3VyZSB0aGUgZmxvYXRpbmctcG9pbnQgcmVnaXN0ZXIgc3RhdGUgaW4NCj4gICAgKiB0aGUgdGhy
ZWFkX3N0cnVjdCBpcyB1cCB0byBkYXRlIGZvciB0YXNrIHRzay4NCg0KSSB0aGluayBhbGwgInRo
ZSIgY2FuIGZseSBhd2F5IDoNCg0KCU1ha2Ugc3VyZSBmbG9hdGluZy1wb2ludCByZWdpc3RlciBz
dGF0ZSBpbiB0aHJlYWRfc3RydWN0IGlzIHVwIHRvIGRhdGUgDQpmb3IgdGFzayB0c2suDQoNCg0K
PiAgICAqLw0KPiAgIHZvaWQgZmx1c2hfZnBfdG9fdGhyZWFkKHN0cnVjdCB0YXNrX3N0cnVjdCAq
dHNrKQ==
