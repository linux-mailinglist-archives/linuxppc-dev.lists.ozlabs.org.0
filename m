Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5664D60CE43
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 16:03:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxYZN17wPz3cC0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 01:03:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nec.com header.i=@nec.com header.a=rsa-sha256 header.s=selector1 header.b=FCdznO4i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nec.com (client-ip=40.107.114.56; helo=jpn01-tyc-obe.outbound.protection.outlook.com; envelope-from=naoya.horiguchi@nec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nec.com header.i=@nec.com header.a=rsa-sha256 header.s=selector1 header.b=FCdznO4i;
	dkim-atps=neutral
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2056.outbound.protection.outlook.com [40.107.114.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxLXd2Vhxz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 16:46:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yv+EcXx92DzoYKbSuf98Zgrjn8yqRJKGlfRzWLygl/57GLPL4o4dnzCaSDkg7dyuyA48oLR2JyOclf8HISPInUGRoZAgfx+mWSWGTnNim7j2fVa/Toz082CrPVfd+PZVtd3VcHWd/RlPXT2PVRfj/lC63+2T/hVnm53ZP7z0UnebTlN1RS8trFJ2cwnUyVm0sMll2/x11rZUGaHiqxvO2Wt9P3+tIfMjJhqpJj/+ANet7IWl5pKewHCOiNF9/jdS5X/w0TjaZRuYhLtVbsu6p+6JqakMBjYA66UdKEofn+Ta/5SIjt3Uv+7X8vx3Ne/H/jUKJfAWGXZ0hci3Mlzd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CN3XB0szcBvfdJX51zMMFDQlsgA1zRnlB8ULuMj2HQQ=;
 b=DCNJ2h47HKDfhV0MpzAPZS9OrwiBavBC593RXvTfnA+BGU+wIZOYYTiz9rboPkp7csh5JFWmFS82zzSF/E9/uDt6X3h5VAKJL41Cx6+bBduUpw6HjJsyowDeGkGTloXvibxoYJHyZbnPbePcNLtxc4dozUsC+Pq6iPQLSKLRDKx1HkY1bNxhubsl2jr102OoFUbdJWWnoarWDEt/v4NJJu02qxgcYE+/rDnNr/muB+8Dxks5r4gS9yN3nIWgDfeyR8xL2qFAN0+Sqf5DyBsDewbpsuomhZWJlogOhyAVz6cM7T2+ClYA40SkJnBYJa8f4d5prkCTpu1q0EO+SBhTZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nec.com; dmarc=pass action=none header.from=nec.com; dkim=pass
 header.d=nec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nec.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CN3XB0szcBvfdJX51zMMFDQlsgA1zRnlB8ULuMj2HQQ=;
 b=FCdznO4i9xVLOk9/cMx8wJOhGzUc/oLq48sPqRH9YhAhvn1FZLTWjr/491X+o6mu0GvxwjB9b5O8i9oVp1fDG7PYpFRHvkpCEfQ1yUzkAxHfunaq0LAScjcdG0XyTvP9p2oDvbFhwLZr/ZMfZQ8tH6iupdsxMbMVVTmTM4pSjzI=
Received: from TYWPR01MB8591.jpnprd01.prod.outlook.com (2603:1096:400:13c::10)
 by OSYPR01MB5478.jpnprd01.prod.outlook.com (2603:1096:604:8b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 05:46:02 +0000
Received: from TYWPR01MB8591.jpnprd01.prod.outlook.com
 ([fe80::9f34:8082:cd2f:589c]) by TYWPR01MB8591.jpnprd01.prod.outlook.com
 ([fe80::9f34:8082:cd2f:589c%9]) with mapi id 15.20.5746.025; Tue, 25 Oct 2022
 05:46:02 +0000
From: =?utf-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPo+OAgOebtOS5nyk=?=
	<naoya.horiguchi@nec.com>
To: Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v3 1/2] mm, hwpoison: Try to recover from copy-on write
 faults
Thread-Topic: [PATCH v3 1/2] mm, hwpoison: Try to recover from copy-on write
 faults
Thread-Index: AQHY5YfuqnTlA9XAIkuqDDkdUh6m9q4enw6A
Date: Tue, 25 Oct 2022 05:46:01 +0000
Message-ID: <20221025054559.GA4093658@hori.linux.bs1.fc.nec.co.jp>
References: <20221019170835.155381-1-tony.luck@intel.com>
 <20221021200120.175753-1-tony.luck@intel.com>
 <20221021200120.175753-2-tony.luck@intel.com>
In-Reply-To: <20221021200120.175753-2-tony.luck@intel.com>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB8591:EE_|OSYPR01MB5478:EE_
x-ms-office365-filtering-correlation-id: fdaf64b7-9ebf-47ff-7fb8-08dab64c3377
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  BnrIKCaK2d1ZNKWw+/ajmkCNImy9MeNIwyONEfrTnCI6jwgySUGYW3D9qOHoWZqNY13zruMD5ybhXebZ+Hveb3rYBn+c+HCd8hSIy7XBqS1Wm53AJu/rVnurXijckGtxMzVPXNqqYHgZxJUTtOGYnmOYJ07vgFZJBX9krUcYXa4zV8N8vfTuDAcTZ9vxsb6uZemQmO3ZlCfgy/HNhmjth6paV8Qmcqec96RhLtMstT5LeMHap/KZHuIASElPy8LODLkH4YoIg5jhHGJpS2e0RoLfnkLUuo2gjeQ7q1BVuVAllCo6zF9NSem3w7u8q7qyEZLwkOzoKx4P3RnRFIvftM75d8nkWdaoY9kp2P15yhl06Nc2NWYnMskfzeaNrgg0F7aMvEQjvaaUC5Y4Zfja1oSZBru0SAv9UwU3x5jx//llETyqZMyP+CYxnMBC+aZAVhJ86JBxpLj42Mph4RVyXM6EoKih40TJfX8SmOz6K67kTDYFYL66T885EGHzsx48Wx0LmFDGGrpSLcGskpEHRTYkNbJmpxpmlNcUHYPT3NbSCCK/XZNV+yfb+LBVpAEY+OAyeqGvXyqmA6su7GAeea63o6I3EoddLKOJGoct7+wQDX+CMHFS05IJ+0ntJWC+/J6FMCr2uQJtteAOu1U8/J2KMJeRhQm2EryQCtTrTtGJbEmzgsGJwvqIbdyITN8wXUd1wVPrHqXxASV9s5pNRxlLLHj94xb7h3eAvyFzLc5AfPKBV6wnz2tWp4OMy2aJvb9qD3jlRl2qmjisGfcBsg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB8591.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(451199015)(41300700001)(316002)(66556008)(66946007)(76116006)(54906003)(6916009)(7416002)(8676002)(8936002)(5660300002)(66899015)(64756008)(66446008)(66476007)(4326008)(2906002)(38100700002)(82960400001)(71200400001)(6486002)(478600001)(6506007)(85182001)(6512007)(9686003)(26005)(1076003)(186003)(33656002)(86362001)(122000001)(83380400001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NitjMXZaZzhHRHZ2SlRTYjRzaGF1bjBucy84SFRhZDROMHpWZWFFMWQ1Nmor?=
 =?utf-8?B?bnNZTld4eWNPS211S0NpdmUzbzJEaUt2clF1Y1dvdjliYVR0WEdmbUdMNTdO?=
 =?utf-8?B?UHVjbmViMFRNODkwVTdyVHJUcHJUV1BTMFFZbTBHQ1pTdlN6VlcvYVVLN0J2?=
 =?utf-8?B?cU5KeXgxSU56S2hTNktnUlpaY2daQTh3K3lxWFVXcWVUdVlYMXNsSnhqZXFN?=
 =?utf-8?B?Qjkzc0E3OUJpZy9BenN0dERSYUdjenJqbldzK1pvVCtLeVZUaUhkcWtTUE00?=
 =?utf-8?B?VExEZXZncitQbjgzL3lEMEt6ZmVtcmFsazNDM1hJbVE2M1QrTFU1TTljMjFP?=
 =?utf-8?B?aUFhV1UrcHZudWxzYjNMMGx4Tm5oUnYwZTJjS1BjbDlLSGo5M1JBdGozY3NY?=
 =?utf-8?B?d1dza3JwN2R1enhsR3o0V3EvdE5TWTA4MkUzOFZhZGp0TjR2cFBSbkFCZ01L?=
 =?utf-8?B?QjBBczF5UlA0Smlqd0tOMGtGUE1LT3pLb3F2WjYyRG03MnptaEU0UDBGOVpx?=
 =?utf-8?B?QUZ2T08vbWs5QlpNaWlqL0RFZE9BWnFZVC9BQjlkaGw1ckQ1VzdEeGVHb1dt?=
 =?utf-8?B?ZE5oWWhCeW4rVS9sUktkZnJDUDJpMkFoRDVZVkg3QVdwVlZ1ckxVaUdnZysw?=
 =?utf-8?B?MURGOXMrc1VmL2k5RytNNmNrK2I1clBJelR1TXJ3VmN3U28zNmJwdGxFTTJ0?=
 =?utf-8?B?MFcydTVtbURXQXo4ekRvQ0xIQVp2VHpwdUFxUmJIQWhrdWN0MkgwVnlOYWNl?=
 =?utf-8?B?bUdBNlJmZnN0eHpxWHNUcW5qUGRRUEJMNlczQVNQa1B0Tnk5TzRlODZOSGNr?=
 =?utf-8?B?YU1CQU1BWW5tdFovZEZXVEhxNE40RDY2MExLNCtzOWlOeEoxK2hJSURhMUpo?=
 =?utf-8?B?MUNWTkR2K01zcXNYd3lEYmg5THhwWno0VGNEMnEyM3BmL2QzMDBkaTBVNnBo?=
 =?utf-8?B?RDNQYkNUUTQ5aFhuanFaRHU3aXg1b1VzK2U1ZXJWeFFpYTMvanJKS2xNRUxZ?=
 =?utf-8?B?T2pyUFlxTFlKcW5kT2x1MXFvOC84elRHcDk2d0RQRy9Vem80OEZad0h4dGN6?=
 =?utf-8?B?MzJldnpibVl4emZvVGpJaW1mU2x3WHFKajRtd1JnY0xOSTd6a2lCU202UnFB?=
 =?utf-8?B?aDljamxyUGJqclAyeCszVFZVWCtuaXRKemg3SkFuQnJ2UHV3RHQ5Q0U3Y1Fn?=
 =?utf-8?B?aHhyLzhUOVBnS0xLdlZQamVHb29pcnJ0TjlMZ0h2dFY3VnV3YmREbm9vZWk3?=
 =?utf-8?B?Zm1vMnlZSGorNHRpZFp5NTQxTUpCaWdNTmwyQzdKR3JSVXA4U0duemJqNi9p?=
 =?utf-8?B?N3hkcmNVV3Jzb1hUbEVUV1VCVzZqZjRLVTM4aTI4YUJxNGNCWHpKSG1HdWVh?=
 =?utf-8?B?bEplSHJyL2Nja0tCdUN3QkFwcEpYa0lQelhXRWwwb1M1ZzJFNE5FYzJuVmtB?=
 =?utf-8?B?UzJsRXllUTFUR3VFeU53a1EwRVoyVndOdm5ra2RCQlU5TFdMV21WdWFXUGtp?=
 =?utf-8?B?WEhkSGYzQlIrdzRDQTl2Z2ZYMVBta3NUNWU0b0dwODA3bDFwbEJnRG9yR0Zr?=
 =?utf-8?B?MXpUSmhBN3RMOXgyamNYUUxaeW81THgyYThXMUJnT1RFdC9MS3Rid2pXMlhW?=
 =?utf-8?B?Z1pFYUs4K1IrK3dPQlRYbERGMVYvZUdPdEhlZFlmNXJwN29pYlp0TXlPdDVD?=
 =?utf-8?B?dEJKWnlxUkdpSm1aR0dJMittQVZYS3N0QjBiUEhQWHBCVHREa0FXSHBMbGwr?=
 =?utf-8?B?S29qQUJTTmxBY1p0TDI4Tzdldnh1SHJXTjRnd2QzZzBpQXBvWGZVRXZ2TjZa?=
 =?utf-8?B?VzZCeUV5RUw5Tk9BZ0VyYjJBY05CMktpQVJhaFR4TDVxNEVMN3Rxa2x0VFpK?=
 =?utf-8?B?aGZULzgyMnU2Qjg3MktRWm42L282RWFJbDBDLy8rQWh0d2c4R2FOU0pMV0FE?=
 =?utf-8?B?SXlxOW9QUFhueGpQaDdhdE1ZanArUCtyRXBURVNHM0dwaWdkV3pxOHBubHEz?=
 =?utf-8?B?UFpyL0tKcmM2azR1VjdLVUs3Y3FFVXcwTzFiTEhqMEJEL2ZRejcvdTRncGV2?=
 =?utf-8?B?Znc4QzRUeGwvQmR5UkRwMGtrbWhCaENOdVhVaFcrOFg0Q3oxY0hObjZqaUI2?=
 =?utf-8?B?S1J0eVAzaWxSVnkweWM2R0RSOXNMV0tqbUFTQXhEWkNYZGprVm9yS1RrR2N1?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DE2D02488DDE742A5D112EF3350D2B8@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB8591.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdaf64b7-9ebf-47ff-7fb8-08dab64c3377
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2022 05:46:02.2960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e67df547-9d0d-4f4d-9161-51c6ed1f7d11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thcaCTEcX8JDGIkWg0Z4A1tbcC2aA7bEBWpZFS77Q556fHg/k5HzEF+3U++X2fqZ/mpsh5AaXCMYIIcwUsUa5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5478
X-Mailman-Approved-At: Wed, 26 Oct 2022 01:02:51 +1100
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Shuai Xue <xueshuai@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCBPY3QgMjEsIDIwMjIgYXQgMDE6MDE6MTlQTSAtMDcwMCwgVG9ueSBMdWNrIHdyb3Rl
Og0KPiBJZiB0aGUga2VybmVsIGlzIGNvcHlpbmcgYSBwYWdlIGFzIHRoZSByZXN1bHQgb2YgYSBj
b3B5LW9uLXdyaXRlDQo+IGZhdWx0IGFuZCBydW5zIGludG8gYW4gdW5jb3JyZWN0YWJsZSBlcnJv
ciwgTGludXggd2lsbCBjcmFzaCBiZWNhdXNlDQo+IGl0IGRvZXMgbm90IGhhdmUgcmVjb3Zlcnkg
Y29kZSBmb3IgdGhpcyBjYXNlIHdoZXJlIHBvaXNvbiBpcyBjb25zdW1lZA0KPiBieSB0aGUga2Vy
bmVsLg0KPiANCj4gSXQgaXMgZWFzeSB0byBzZXQgdXAgYSB0ZXN0IGNhc2UuIEp1c3QgaW5qZWN0
IGFuIGVycm9yIGludG8gYSBwcml2YXRlDQo+IHBhZ2UsIGZvcmsoMiksIGFuZCBoYXZlIHRoZSBj
aGlsZCBwcm9jZXNzIHdyaXRlIHRvIHRoZSBwYWdlLg0KPiANCj4gSSB3cmFwcGVkIHRoYXQgbmVh
dGx5IGludG8gYSB0ZXN0IGF0Og0KPiANCj4gICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvYWVnbC9yYXMtdG9vbHMuZ2l0DQo+IA0KPiBqdXN0IGVuYWJsZSBB
Q1BJIGVycm9yIGluamVjdGlvbiBhbmQgcnVuOg0KPiANCj4gICAjIC4vZWlual9tZW0tdWMgLWYg
Y29weS1vbi13cml0ZQ0KPiANCj4gQWRkIGEgbmV3IGNvcHlfdXNlcl9oaWdocGFnZV9tYygpIGZ1
bmN0aW9uIHRoYXQgdXNlcyBjb3B5X21jX3RvX2tlcm5lbCgpDQo+IG9uIGFyY2hpdGVjdHVyZXMg
d2hlcmUgdGhhdCBpcyBhdmFpbGFibGUgKGN1cnJlbnRseSB4ODYgYW5kIHBvd2VycGMpLg0KPiBX
aGVuIGFuIGVycm9yIGlzIGRldGVjdGVkIGR1cmluZyB0aGUgcGFnZSBjb3B5LCByZXR1cm4gVk1f
RkFVTFRfSFdQT0lTT04NCj4gdG8gY2FsbGVyIG9mIHdwX3BhZ2VfY29weSgpLiBUaGlzIHByb3Bh
Z2F0ZXMgdXAgdGhlIGNhbGwgc3RhY2suIEJvdGggeDg2DQo+IGFuZCBwb3dlcnBjIGhhdmUgY29k
ZSBpbiB0aGVpciBmYXVsdCBoYW5kbGVyIHRvIGRlYWwgd2l0aCB0aGlzIGNvZGUgYnkNCj4gc2Vu
ZGluZyBhIFNJR0JVUyB0byB0aGUgYXBwbGljYXRpb24uDQo+IA0KPiBOb3RlIHRoYXQgdGhpcyBw
YXRjaCBhdm9pZHMgYSBzeXN0ZW0gY3Jhc2ggYW5kIHNpZ25hbHMgdGhlIHByb2Nlc3MgdGhhdA0K
PiB0cmlnZ2VyZWQgdGhlIGNvcHktb24td3JpdGUgYWN0aW9uLiBJdCBkb2VzIG5vdCB0YWtlIGFu
eSBhY3Rpb24gZm9yIHRoZQ0KPiBtZW1vcnkgZXJyb3IgdGhhdCBpcyBzdGlsbCBpbiB0aGUgc2hh
cmVkIHBhZ2UuIFRvIGhhbmRsZSB0aGF0IGEgY2FsbCB0bw0KPiBtZW1vcnlfZmFpbHVyZSgpIGlz
IG5lZWRlZC4gQnV0IHRoaXMgY2Fubm90IGJlIGRvbmUgZnJvbSB3cF9wYWdlX2NvcHkoKQ0KPiBi
ZWNhdXNlIGl0IGhvbGRzIG1tYXBfbG9jaygpLiBQZXJoYXBzIHRoZSBhcmNoaXRlY3R1cmUgZmF1
bHQgaGFuZGxlcnMNCj4gY2FuIGRlYWwgd2l0aCB0aGlzIGxvb3NlIGVuZCBpbiBhIHN1YnNlcXVl
bnQgcGF0Y2g/DQo+IA0KPiBPbiBJbnRlbC94ODYgdGhpcyBsb29zZSBlbmQgd2lsbCBvZnRlbiBi
ZSBoYW5kbGVkIGF1dG9tYXRpY2FsbHkgYmVjYXVzZQ0KPiB0aGUgbWVtb3J5IGNvbnRyb2xsZXIg
cHJvdmlkZXMgYW4gYWRkaXRpb25hbCBub3RpZmljYXRpb24gb2YgdGhlIGgvdw0KPiBwb2lzb24g
aW4gbWVtb3J5LCB0aGUgaGFuZGxlciBmb3IgdGhpcyB3aWxsIGNhbGwgbWVtb3J5X2ZhaWx1cmUo
KS4gVGhpcw0KPiBpc24ndCBhIDEwMCUgc29sdXRpb24uIElmIHRoZXJlIGFyZSBtdWx0aXBsZSBl
cnJvcnMsIG5vdCBhbGwgbWF5IGJlDQo+IGxvZ2dlZCBpbiB0aGlzIHdheS4NCj4gDQo+IFJldmll
d2VkLWJ5OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogVG9ueSBMdWNrIDx0b255Lmx1Y2tAaW50ZWwuY29tPg0KDQpUaGFuayB5b3UgZm9y
IHRoZSB1cGRhdGUuIExvb2tzIGdvb2QgdG8gbWUuDQoNClJldmlld2VkLWJ5OiBOYW95YSBIb3Jp
Z3VjaGkgPG5hb3lhLmhvcmlndWNoaUBuZWMuY29tPg==
