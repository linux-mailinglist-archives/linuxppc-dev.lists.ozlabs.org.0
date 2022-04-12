Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEFF4FDFB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 14:29:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd4mb5vnTz3c92
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 22:29:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::601;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd4m75t56z2ywH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 22:29:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bd/7TuJYuTzplXgndVe528USL9/YyBa4TI0kQuoYpbV2dmROlhvBw5hYkM5/fcOoN+/oQWxdE9+v7eIK3qhTSP1WVmdHNRoPfjC0PkBtqmeokDE89xiR0Qyru2pwiId5e3O4g5BodX4t3zkKqPK0Ry6Y1KCL81pnIvwJCxiMEoEJ1v+dtsZFaDJlbf22+CPlibwsm0EuYsZsiGRXFajrKA/Fy9i0VNBn5xeuN5EYCqFC4RXjXKtSF0GzPqw/uIyImvY2h0qaelFDP4oXjT6yq5Jj3XRmf2vCycyXHExjiHQJVO+32vAqa01vAdSWw7MgFpyyGZUK6bu8f1VS4frCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPpZErIugdgb2KWlfh1A6xotEEecLtilGqXHUwdPA2g=;
 b=A2+oMVr/5I4qdTFDbaRLh8uB1UzIoXPWQc5CLLOUylQ74xUJpA/A8f246pn38kH/YAiZjpGqLWL3yiHl2/qWGR01vGOvLDQvDiP/oBJL4N3eJ+rTpnto5ojzYasw2rPDSKtpk0bD6k10RolF18CyTS8iREHJVFM6qQfRiXcEKmNS4ZR7OjXcviemfdrxW6MAAgvfp2HJuoE038hasbEnDL/0EwQxc8Azt1tbL+EPbvnMfxzCiolrYLz71lwMREvXEWf+icOcP0SERkXV4ctGF7qRNO9L2RT/S0Zq21hVT+7MyN03V9L3O1o/qNi9OP0CCklecGWcIVTRjoB9WeLm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2357.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 12:29:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%9]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 12:29:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH V5 6/7] mm/mmap: Drop arch_filter_pgprot()
Thread-Topic: [PATCH V5 6/7] mm/mmap: Drop arch_filter_pgprot()
Thread-Index: AQHYTic4ZmcQDqllX0eUBZCDoRgFdazsNX+A
Date: Tue, 12 Apr 2022 12:29:08 +0000
Message-ID: <71fe7ac2-0b10-56a5-e530-3bcbc60f0e63@csgroup.eu>
References: <20220412043848.80464-1-anshuman.khandual@arm.com>
 <20220412043848.80464-7-anshuman.khandual@arm.com>
In-Reply-To: <20220412043848.80464-7-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e1f6d80-f870-4a5b-e4c0-08da1c800a8c
x-ms-traffictypediagnostic: PR0P264MB2357:EE_
x-microsoft-antispam-prvs: <PR0P264MB2357E34F9A1C17739AD95F01EDED9@PR0P264MB2357.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m/vEhlltbKml0WYoSndunxlYXTSErw7oq81PCcMfJMi2LcYk93zo9ZEmo32WzM32Wddd6iQavch5PGDP7I0qHm+usfil2m+wEOfGaktExeBklAESBBP9TmgBrjP781eB9d1+5MEUR/hJpAWUGZ/5JwQPmPRDoYpD3CwK4y5YuqkvxSOCDPq5BnxzUEyrhEF5Ly7ztgfEuDrL4WLGLFxXd0gTvBLzlBO0g5bCDlbHSphuymfdGd49XEvzqQr9UtT+MTxywGu4u/C2eOm69TvD7e4DvQ9ZjGFCzMFD07xXOMUpLz+8Ka6uxHDpApmc9NsTKIJlFInDHM9xW3nlBP6L+coGge38lddoR+cFZOuXZSd+D8Vw91reHKHaE/tSZu+cN58BL9nVnn1XakD1s8LgV1H/bjp3s/pXOt+/iU+4d4v9lVJzGtmJwCCyPlet1USHuCvZQXgnih18Y3iTvlLKALvOmlSzhLkiNxsCqJ9AFl9F+0rbpuldTEdQ+cAR3Dq7HJioOQdhp+h4sSIZIGUhRgHFbN9p1Ge+vhqa1iv5j4dEfFqW1Jzx+4NQ6o79Gl5nPFpdrK6fD2uPklxomqr0wfYGzUd4z9+gQ0i77as7gJoD5HWAPgUvVIJIwQrb1KC0nGCRXJdqLLqlXsdXDIQz2gKobZanEDkLR6eYmADt5pScE/CwnanWikEPPkkwH7ZFPjHO29RksmHmwpBOqAdsF0TbapHNao5sVO+Yiu2NyOVNKLlvudcYfTC1Su/M8FWR8fAlB4PRWN1yQVuI4ByL+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(186003)(26005)(86362001)(38070700005)(44832011)(6512007)(5660300002)(71200400001)(316002)(2616005)(64756008)(76116006)(66476007)(66946007)(6506007)(66556008)(66446008)(7416002)(8676002)(6486002)(8936002)(91956017)(4326008)(38100700002)(110136005)(31686004)(36756003)(54906003)(83380400001)(508600001)(122000001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elBIZWg1UUF5eENjcXFKUUxSTTRLY0x1VWFzUzJjMDVIRWVaTHM3UEVEQTRp?=
 =?utf-8?B?VWtFZ0xEZUU0a1FGK0JyQTNsd0pJZVpvcll3R0ZyZzhRVFR4WVJqKy9Qd2FF?=
 =?utf-8?B?cERQbm4vcWtad1daZ2pxRUNKVCtDRGZhTVhWdkhaemlCcGd5d2ppNzNLQktT?=
 =?utf-8?B?Ym1VSGNJOUhnV043TDRaMlZLc1FraTJCYlpEb3R6V3AvNnhXYi9ueE1YNlRv?=
 =?utf-8?B?L1VIeUpwSnFEOW05K3JhSEVMWkJlOGRoOURyWS9rYnRWc29xYjJ1cG1VYzM5?=
 =?utf-8?B?TWVrajdqSkpSdk9zaVRDV2pnUFA1Wld4T0ZmNEtVaGJ1SHhDd3dIWjdvWDRB?=
 =?utf-8?B?YzlLaUF4Q2Jyam03Sm1sTStoMVhscjJTQS9Cb3V0aVJ4M3RxT3RLblBwWkxo?=
 =?utf-8?B?Q3UxWmkxRFJNRGRQckJxR1pFcW1uMGV1cHB3U2lmNTRNQm9VYlVOVFdhQ3k3?=
 =?utf-8?B?WXN2MWpjR2YvajRtbU5Pakw2YXdPeXV0VFQyOU5WNnIyY2hkbG9mSkZGdERI?=
 =?utf-8?B?bm1oaFpjdFhDVm13UVNHRGpXUVMzSHNkVVFqU2s1blVHbm5RZGk4a3FMbUt1?=
 =?utf-8?B?STdWdENoaE9MdmZpRDNtQTl3TFRBQWF1blEwWVh2UFE5bWF1TGNCRUd5dXZ5?=
 =?utf-8?B?Y1R4RW82L25oWmpYYzlDcFBDajB5VG5TQWpCa0FwYzVMZC96RVM1T29xZzI1?=
 =?utf-8?B?SjVMV3JhOUJSbmZWYUZkaTZOdE9XVnltMXFGYm9Yb3JicVBxdzFnOThQbWZn?=
 =?utf-8?B?cXBSaEVCUFRIalZudUE2OEN4RmM1SnoyT0VGVkVZMU16STN0VmRpWGgxTXNI?=
 =?utf-8?B?VlBWSVEyeCsyQmozc3JVMUoycXdVWTZkcEJtN2FyUytuNnQ4VWJyUkRlMzMy?=
 =?utf-8?B?aG5rU2lLdVZXTzNDN2NkbU9CSDN0QVZLMC9XUUNjUzlVZUVVY1ljT2NFdlVh?=
 =?utf-8?B?YWtpSS9hZ29VSTMrWVlscXF3NEVvMVpUbkl3VVRoZm1pVUp3amcrci9vVkw5?=
 =?utf-8?B?NDg0S1ZheXpqam04ZkVCa3JudmZjL1Nxd3hSMm5pajk0ZDBIQk41SHNUSUxQ?=
 =?utf-8?B?aEQxeHY3SnpobWhCQzA2NmM3a2JpLy9wbmhqNzNVYlBaQ3dFNTVyUEdaeFht?=
 =?utf-8?B?R295bEtHSHplRTlmYlZsTm43OUNVUVZrcUF5TUp4T3lFb2pMdnZuellpNW1y?=
 =?utf-8?B?OEQxMTF5aFVTZGdvcW13ajFzM3lpb3Q1Tk9PelBzOGFKTWN4K29ScmxWNlpG?=
 =?utf-8?B?OFNJWTN5dE4yOFZxOEZVaXVUL3dmR0J2N1FvYmVBajFMeCsrV2FXQzd6Tm85?=
 =?utf-8?B?SGF4RS82Und6K0FOb3RURHBYaTkyRWdsNDFUdGp1bm4ySnE2VS9EZlAveXhN?=
 =?utf-8?B?ZWRJbzVYQVRlb25lNTltdzB5OHVBYlNVQnlkVk1ZbnZVUFMyQmdrZnh5VEUr?=
 =?utf-8?B?S0VzcUdPUy9pQVhhWUhvL1RPc0lyTldmdmEwWk5meXZXTEpXd3pENTBqSUlP?=
 =?utf-8?B?WGs5MzJ1SHlGeDhLdHVKUFd0Q3R1WFpCL0NGc1h1YTFiNUJiaitLQnByNU9T?=
 =?utf-8?B?ak5hVmM0UVJDSjJVemxPQXBZbWtTZEhSenBYMkU0U0NXWGlvNDRlR0ZISEhF?=
 =?utf-8?B?NWtLWUVOMHUzeDVNempYT2djeWdnYmxWNVgzZVA3QlBaTVdDYlllWjRYSGFJ?=
 =?utf-8?B?bEJkdmpLcUZTRnV0cGNNbVQxYWg4dnJWUmRCOFhSMU4zenJzRXVJbWY5T2RB?=
 =?utf-8?B?UkNSRlo0djVQVDZGaXM5azJpaGlZVlVoL05ocWx4MkFKT09ZUStsQ0xTNmRh?=
 =?utf-8?B?K2FtUmd3UEdjRDJMVkQwMlVqVWN5VWJsTUVTdE5FUHRwNVJNMkFrdzFhMnB6?=
 =?utf-8?B?QWM0cW9WNzVwdnR3b0VXMnVkZjA1QVR4THJ1QXFnenNJTUk3NXlpUGNkc2lr?=
 =?utf-8?B?UW5GeGs0dXJUR2pKNGdlRE5mZm15RG1aa0NybEo1b0FFMkJIWEt2Zkx4dVg4?=
 =?utf-8?B?Um1GYUFoNGVQT3ZvUFV6cHYzV2NCK3YwWEdGcFZneFZoQnB4QUFJNldGSk12?=
 =?utf-8?B?U0NWaXVhTDBDK2I5OHhZcWR4aEJ3eEc4SkRGcGNmSFAwSnJXOFZ4VXZYdTNW?=
 =?utf-8?B?S2FZVE81QVhYcG95MFMxWmV0VWJUYjAwYW41YnZCZUtiaml5SVdSYk8yZyti?=
 =?utf-8?B?ejlVQVE1MFRsejZ2TGZRMUdSdm1zbFUzNUdTVkJaTVlUdTlrcHY5M1psQlhM?=
 =?utf-8?B?ZGhkTjNWMlF0ZEZnaVM2eGZQRGhVdzAzbmNqU3MxU2R1RWJVZTkvUWk4eWw3?=
 =?utf-8?B?cDVJTGZMalc0Mld0VUVTWXVDSE5rR2ZxNDRnKzU2dkM5NkVrM3kzTXU4MElC?=
 =?utf-8?Q?T7zMfNkqDzwWEAP1zaKZKo5/7P8VQeIPcdajA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3F768B5F684264AA4D124409D77F328@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1f6d80-f870-4a5b-e4c0-08da1c800a8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 12:29:08.3650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z22l85sSPJXH9LpWUiZbhEbmy89D5jNE2AWIvvoHegP7rYzjcrFHahlQEy2KL5ohcf43jxedb7MuFN6vnDSA6+t95a3eigbFnJ5v+VBZ1EI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2357
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEyLzA0LzIwMjIgw6AgMDY6MzgsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IFRoZXJlIGFyZSBubyBwbGF0Zm9ybXMgbGVmdCB3aGljaCBzdWJzY3JpYmUgQVJDSF9IQVNf
RklMVEVSX1BHUFJPVC4gSGVuY2UNCj4gZHJvcCBnZW5lcmljIGFyY2hfZmlsdGVyX3BncHJvdCgp
IGFuZCBhbHNvIGNvbmZpZyBBUkNIX0hBU19GSUxURVJfUEdQUk9ULg0KPiANCj4gQ2M6IEFuZHJl
dyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC1tbUBrdmFj
ay5vcmcNCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gUmV2aWV3ZWQtYnk6
IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IEFuc2h1bWFuIEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPg0KPiAtLS0N
Cj4gICBtbS9LY29uZmlnIHwgMyAtLS0NCj4gICBtbS9tbWFwLmMgIHwgOSArLS0tLS0tLS0NCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9tbS9LY29uZmlnIGIvbW0vS2NvbmZpZw0KPiBpbmRleCBiMWY3NjI0Mjc2
ZjguLjNmN2I2ZDdiNjlkZiAxMDA2NDQNCj4gLS0tIGEvbW0vS2NvbmZpZw0KPiArKysgYi9tbS9L
Y29uZmlnDQo+IEBAIC03NjIsOSArNzYyLDYgQEAgY29uZmlnIEFSQ0hfSEFTX0NVUlJFTlRfU1RB
Q0tfUE9JTlRFUg0KPiAgIAkgIHJlZ2lzdGVyIGFsaWFzIG5hbWVkICJjdXJyZW50X3N0YWNrX3Bv
aW50ZXIiLCB0aGlzIGNvbmZpZyBjYW4gYmUNCj4gICAJICBzZWxlY3RlZC4NCj4gICANCj4gLWNv
bmZpZyBBUkNIX0hBU19GSUxURVJfUEdQUk9UDQo+IC0JYm9vbA0KPiAtDQo+ICAgY29uZmlnIEFS
Q0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QNCj4gICAJYm9vbA0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEv
bW0vbW1hcC5jIGIvbW0vbW1hcC5jDQo+IGluZGV4IDg3Y2IyZWFmN2UxYS4uZWRmMmE1ZTM4ZjRk
IDEwMDY0NA0KPiAtLS0gYS9tbS9tbWFwLmMNCj4gKysrIGIvbW0vbW1hcC5jDQo+IEBAIC0xMDcs
MjAgKzEwNywxMyBAQCBwZ3Byb3RfdCBwcm90ZWN0aW9uX21hcFsxNl0gX19yb19hZnRlcl9pbml0
ID0gew0KPiAgIH07DQo+ICAgDQo+ICAgI2lmbmRlZiBDT05GSUdfQVJDSF9IQVNfVk1fR0VUX1BB
R0VfUFJPVA0KPiAtI2lmbmRlZiBDT05GSUdfQVJDSF9IQVNfRklMVEVSX1BHUFJPVA0KPiAtc3Rh
dGljIGlubGluZSBwZ3Byb3RfdCBhcmNoX2ZpbHRlcl9wZ3Byb3QocGdwcm90X3QgcHJvdCkNCj4g
LXsNCj4gLQlyZXR1cm4gcHJvdDsNCj4gLX0NCj4gLSNlbmRpZg0KPiAtDQo+ICAgcGdwcm90X3Qg
dm1fZ2V0X3BhZ2VfcHJvdCh1bnNpZ25lZCBsb25nIHZtX2ZsYWdzKQ0KPiAgIHsNCj4gICAJcGdw
cm90X3QgcmV0ID0gX19wZ3Byb3QocGdwcm90X3ZhbChwcm90ZWN0aW9uX21hcFt2bV9mbGFncyAm
DQo+ICAgCQkJCShWTV9SRUFEfFZNX1dSSVRFfFZNX0VYRUN8Vk1fU0hBUkVEKV0pIHwNCj4gICAJ
CQlwZ3Byb3RfdmFsKGFyY2hfdm1fZ2V0X3BhZ2VfcHJvdCh2bV9mbGFncykpKTsNCj4gICANCj4g
LQlyZXR1cm4gYXJjaF9maWx0ZXJfcGdwcm90KHJldCk7DQo+ICsJcmV0dXJuIHJldDsNCg0KWW91
IGNhbiBkcm9wICdyZXQnIGFuZCBkaXJlY3RseSBkbzoNCg0KCXJldHVybiAgX19wZ3Byb3QocGdw
cm90X3ZhbChwcm90ZWN0aW9uX21hcFt2bV9mbGFncyAmDQoJCQkoVk1fUkVBRHxWTV9XUklURXxW
TV9FWEVDfFZNX1NIQVJFRCldKSB8DQoJCQlwZ3Byb3RfdmFsKGFyY2hfdm1fZ2V0X3BhZ2VfcHJv
dCh2bV9mbGFncykpKTsNCg0KDQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1CT0wodm1fZ2V0X3BhZ2Vf
cHJvdCk7DQo+ICAgI2VuZGlmCS8qIENPTkZJR19BUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UICov
