Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D94248F645
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 11:07:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbYkF2qwCz3bV4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 21:07:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::615;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbYj96Xnwz2y7J
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 21:06:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpBFyt8sk/OprAiZhXKKyCLe5LT8NugRQvJN1lfuXDgOA/r1gwqH6u8OOjev1PNdxAWVt1ynCCgO8aiSuojv/kRlI+ndAj8XAtOk2JD0Bjwf7wXLkNScbtWYvzdVm5lm+1yZmQ2Q71nFqcYM/kHpMTFtVbS76rxSG43MCwbjC3RzTcq2MVKTSueg/xV8AxoyZ/ofe/TomhpEhQy/8cSZ4Q+Ybygu+eSZssXg9/qKLT09Stc6Fhu8anJXfiWs1WBDhvW+HBcGxEzxGTZhkMD5/5gWbzAoZWvMeb/F5714olBNlxZrqQ+T/dmUXWlt/i4iX+aBQsFYH1+GmMdx8dt10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tu60CJaPC4rdLntCn5c0odaHEseXBKKeLWZ9RUHaFhM=;
 b=aehKLLZ8QgJzIG7iv5e78qxvGLlyFlQZ9FuoDkJQ9iMukVG7j+qsoObyV7/IHRPNBeAL7rB68xXR2LAqdNhFynmwKzEBTektOAtvfdz+7CTZuYg8Qncfz3+15IkKlzF7R9OutaayoKaGhFpEx8Xy1dYERxOHA+r7ChyJRVGxabRxVNv5X9MIdrDV5DpDQUCjpwdk7oFvrp8W/rQhdofcrCjQYdbokuma19HF5Fuk2a7skpB2dGZ//wY9KhU8cZ2ej7cGSOHGkm/pawY1vhI1qwflXRfjfUiUzOombfcLNS/5RN/pAf5Nbgw6xOWWTUVUPghP3aRu/6e7v338xOY91g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MRXP264MB0263.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1f::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Sat, 15 Jan 2022 10:06:18 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8%2]) with mapi id 15.20.4888.012; Sat, 15 Jan 2022
 10:06:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Jonathan Corbet
 <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "x86@kernel.org" <x86@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 3/3] x86: Support huge vmalloc mappings
Thread-Topic: [PATCH v2 3/3] x86: Support huge vmalloc mappings
Thread-Index: AQHX+zD/hWUWAcg7A0O0lNZsb1MJ4Kxj+LCA
Date: Sat, 15 Jan 2022 10:06:18 +0000
Message-ID: <0b9dd629-6a2b-0bad-11e4-c49ea1abd223@csgroup.eu>
References: <20211227145903.187152-1-wangkefeng.wang@huawei.com>
 <20211227145903.187152-4-wangkefeng.wang@huawei.com>
In-Reply-To: <20211227145903.187152-4-wangkefeng.wang@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d247b6f5-8d2f-4498-b216-08d9d80eac65
x-ms-traffictypediagnostic: MRXP264MB0263:EE_
x-microsoft-antispam-prvs: <MRXP264MB02636DFAB3DD042B1B733217ED559@MRXP264MB0263.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:94;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jBwQ+4nxJlaEoU2G2f69mNkl8aHscSv/+OUsI8s/WyYuerFd/mFtQ62xtFQJkuOIQZOW9u7AfMUP5zyi+LHPdwTtCSfjUaB9k0Z3WzdY6yNFDEzvVv+5DtLXhsBMEoncxqzbezmVMjjlKNgPu/lnECXNW0m6ButPAQ0/rvkKPt2ZIFvQzega80K+HonbsT0CoxcZAc6ynSD1D5g1pmzgUr232RPMYTmqgbBPcYI1UwTrTgokStYJua322u4hddfQMXP3tdml6TBUPWi5DrXp14N/gIvDOPG7EkenEojP13CxXPDg9q8iepWQtoO22rtZpSxsRcYDlb/8g35uwbXrKMXc4FWWWxgZkC0jqZCPWyshtcCg3yDuEQ7DAOpnubngZkeF6ttdstyLYhDu2mEvPBtK9EkZKBJdeu8zc7zUZn7CJv2KBD4xc32qOdAHmT2w/CcOW9fbpGUkGHiPENBOWSeacZY/O0hu9uCAXlS0z4ibr7t7e+MPDhdzxviNeMYX9+7isi14pBBSaZ0lP74VnzBO4RoGnm1C3U2A9wLd52ncYcXrYZ0arMYDY8OhjyapMSroJvC30aAFaW0N767WUuMtQtD/Hy4OGsE4cCouf6mOWJzWxXDIbbHBkEcKp9sD83SmZtnSBzNzGKRwYWqhbb0jIoYAe9BepNyUrWvO1d0Bt/+hTyhWbYa+3HtWL0o6o0qtJdpL3liJ4caSh8x/U7a6lCC7DQeQsE5jv+14/t9HcQXtDe2bUH3jL69ozrHRFwcNRpUZKsAI0duBvWpKUwnqgQFmoGF1DP3ViTqOZxk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(38070700005)(31686004)(6512007)(76116006)(64756008)(186003)(8936002)(26005)(71200400001)(6506007)(66556008)(2906002)(86362001)(36756003)(31696002)(2616005)(8676002)(6486002)(5660300002)(7416002)(83380400001)(38100700002)(4326008)(316002)(110136005)(54906003)(91956017)(66946007)(44832011)(66446008)(66476007)(122000001)(14583001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnhzUUw1WklkZ2c2TnF5VXR4Qm1zRkloOXJOelF0SC95dHVLd1dhcXJ0YTlz?=
 =?utf-8?B?YThqU205MDMwVTF5by9vMktWMlUzSHN3aHoybXkzNFFNWWZ6VU0zSkNqZWV5?=
 =?utf-8?B?KzFUaFRSK2R2STNDb3NSYmVmWnVnVzJlQzhlN0k2d0JEMlhIMndaOGVFNHJZ?=
 =?utf-8?B?Q21UM3Jpc2hFc2p2Z3ppY0NlUDBqelZNMmZ1VTdhUEthN3REYzR2NVFLQ2Y2?=
 =?utf-8?B?bEF3SmRvVFN6NURoN0libWlFbHZUZHhGUm13K0s1enRxVGZZQXF5dmppUDBY?=
 =?utf-8?B?bDM3ajVoTlFDK0xZL2JYS285eDBpK1lzZGN5Z0Y0Nm91MU5ET21CZE5QcHVV?=
 =?utf-8?B?TGxEaGtJNHFWT280Z1lidVJwWjlTcjdaVWk3Mm5iN2hDdDN2dnI2TlhEU3gr?=
 =?utf-8?B?RDB3RXAxY213MzVOSG9WeFQvc252RFo1bUljdTZoRVVoMUtiajZRRUpXQ2Jo?=
 =?utf-8?B?NndFTG80T3FhOFV2YjZ5OHZCQjNFZ0ZiU3B4WkpwMCtObWZkRFIyd1VNRWE2?=
 =?utf-8?B?L3A3LzV6ZGFsNU1MZlMvTFdMVmQ1bkZwMU5aZ1BpTmJUSWpMUldieFdySGFF?=
 =?utf-8?B?b0RSdnd2dU14MnFXLzBORGM5WnFFcnJoeUx3aU9JNEtBSDFVMmpLajVEQmcy?=
 =?utf-8?B?bTROTk41SVErU0hVZ0xhZTg4Uld4QUNvMHBSSGJxYXMrWkgwa2ZiSU5YRWJw?=
 =?utf-8?B?OU5BSm1vOVNrSUlycGVrbmJmWVEyNnhqS2plcTZrdnhWTmYzSXkzTHBXdVNw?=
 =?utf-8?B?UWhHUFFFUWpkUlZTTDA0TzJ2b3lEOU9RVFJDWWlzZmNLVDBrdlYvb05mNHN2?=
 =?utf-8?B?cThyL3g1aHB0cWFOQlNzM1JRbTB1R2crTnhBb1NHUy9SU1BVZEpIRzl3TWxR?=
 =?utf-8?B?YzA0VlNyTXRnQWc1aktpSG9OUDlMT0FHdWNnL3ZoNjZBM0w1eVZQM0tJYUhn?=
 =?utf-8?B?MXBzcm9WY1NUNW92T2MwNWZ6Z2JKUjZRZU5obUQyaUF1YU1VRmI0blVIKzhq?=
 =?utf-8?B?QXpuNi9mUkdXREZQUCtDTGdjYkk3VVNlRU5nR0VuNXNodzI0cHQwYVRsdHh1?=
 =?utf-8?B?cWZNVmRRdHo5YzJEcnErS0tTOFVPRFNwS2E5UmJLcHpYYzlhWTFkRUhiZm40?=
 =?utf-8?B?YkhqUlRybyt2MmJsTzhQZmZmdTZlaDhhemtEamVveGxnUkJDOGprU3hVT0Ew?=
 =?utf-8?B?VkhhL3hZVUZjNnVTOW14YTlYcWJxUEJWTXpiay9Ya2xSWThEL2h6aVBYZUg2?=
 =?utf-8?B?M1ZtcjdCdkI1YStCdHNNMGt0L3dKNFVVYVk5ZnYrZzE3Q0pzYTkrdEY2RVdy?=
 =?utf-8?B?SWdkTVBtbzlaUEtwNU5wV3haYWVNUnB6YnUreHpnalBJYkM3MWpPUS93RlpF?=
 =?utf-8?B?d3FGdXVZS1hYTnE5cDl2MnRra2NnQ0pqMThDeWh1NFFMZThTbXJpeWI3Y0pn?=
 =?utf-8?B?ZXl4UkpoZVJjYWNmbWh5cjR4OVh6cU1iZmJLVUpiZG9TZnN1SENYSUZzaE1a?=
 =?utf-8?B?cm9HOWQ1VGQ3RG50MnZkZlZuNXZRVmU5bmxIcUZ3cGxqeTNOSWpuU1MvWnpG?=
 =?utf-8?B?dFBiMktoSnl4TXhpMDM3cUxXaVBXb2ZOdDlTTExlMXRibVEzeEthQzVFV3Bm?=
 =?utf-8?B?UUVCdG0wWGRnam8waFFVanc3enhRVWphekI4c2Z0K1NzbW9DY0tFc3VlZTg1?=
 =?utf-8?B?UVZxcVVmMy8zbS9Uc1dXbTNxd1grZXF3VjVPeTgvV1FqZlB2blByeURWSkdV?=
 =?utf-8?B?SnI1dTRyUXhGRUF5WnRWYUpabFlRTUtnTVBLbStwQUc5eE1ETGJDQlB0Vmxx?=
 =?utf-8?B?Z3RpbXVyUklRL2pDdmFRTFYyRW00clZYV29wYWloR01GZUJxb1hGM2ZNOXdZ?=
 =?utf-8?B?TkYzR1M5MXhYUmxUTkxXQ3NuWXhjWTVhdStDcDM0b01nTzdSaTlPYWhHRGJr?=
 =?utf-8?B?OXAzWTQzN2U1SUw3bW9mb0x1NUFZRE9kY3BzQ1lveGlZZWJUWkthYzd4YzFV?=
 =?utf-8?B?dEI4YlNwOWhIQk1rbEQxKyt3U084WC9YS0tpSHZXZFZKc1VXNVd1c01RcTN0?=
 =?utf-8?B?ckZyMjBxVHlaeXl0VXpRRENIN29XSzZSVWpoTk53TXI3TGlWWmQ5Qy9vb29X?=
 =?utf-8?B?aWhhTzFYbEJQRHBQNUtrdjB3dmJCaUJ5WTY2ajhMaFVxSk1idllOc2hVL2M1?=
 =?utf-8?B?WHVWeU1TM1IxVTFUdWRIeVA5aHFPTEVNT3BJU0phdHE0UXdaOVZUUDlSYVdG?=
 =?utf-8?Q?zKzSld4e9N49irsGUOjOr6OSNslOGx+/rVVcoSOX6k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3971D25A5F11764F981FB0B9C479FC41@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d247b6f5-8d2f-4498-b216-08d9d80eac65
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2022 10:06:18.2446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rweOJl2UbDIyEVpolXCbamhEEbhfLAVqRxHssGlqwGq4cql30GdsC2rxDEHzEIeW76VahrVvzNyl65J3kx8Jz43DErMwmstbknnIAr+L1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0263
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
Cc: Matthew Wilcox <willy@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzEyLzIwMjEgw6AgMTU6NTksIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IFRo
aXMgcGF0Y2ggc2VsZWN0IEhBVkVfQVJDSF9IVUdFX1ZNQUxMT0MgdG8gbGV0IFg4Nl82NCBhbmQg
WDg2X1BBRQ0KPiBzdXBwb3J0IGh1Z2Ugdm1hbGxvYyBtYXBwaW5ncy4NCj4gDQo+IENjOiBUaG9t
YXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4NCj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5n
b0ByZWRoYXQuY29tPg0KPiBDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+DQo+IENj
OiBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPg0KPiBDYzogIkguIFBl
dGVyIEFudmluIiA8aHBhQHp5dG9yLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogS2VmZW5nIFdhbmcg
PHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPg0KPiAtLS0NCj4gICBEb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCB8IDQgKystLQ0KPiAgIGFyY2gveDg2L0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSArDQo+ICAgYXJjaC94ODYv
a2VybmVsL21vZHVsZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0NCj4gICAzIGZp
bGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCBi
L0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0DQo+IGluZGV4
IGUzZjlmZDdlYzEwNi4uZmZjZTY1OTFhZTY0IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiArKysgYi9Eb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiBAQCAtMTYzOSw3ICsxNjM5LDcg
QEANCj4gICAJCQlwcmVjZWRlbmNlIG92ZXIgbWVtb3J5X2hvdHBsdWcubWVtbWFwX29uX21lbW9y
eS4NCj4gICANCj4gICANCj4gLQlodWdldm1hbGxvYz0JW0tOTCxQUEMsQVJNNjRdIFJlZ3VpcmVz
IENPTkZJR19IQVZFX0FSQ0hfSFVHRV9WTUFMTE9DDQo+ICsJaHVnZXZtYWxsb2M9CVtLTkwsUFBD
LEFSTTY0LFg4Nl0gUmVndWlyZXMgQ09ORklHX0hBVkVfQVJDSF9IVUdFX1ZNQUxMT0MNCj4gICAJ
CQlGb3JtYXQ6IHsgb24gfCBvZmYgfQ0KPiAgIAkJCURlZmF1bHQgc2V0IGJ5IENPTkZJR19IVUdF
X1ZNQUxMT0NfREVGQVVMVF9FTkFCTEVELg0KPiAgIA0KPiBAQCAtMzQyNCw3ICszNDI0LDcgQEAN
Cj4gICANCj4gICAJbm9odWdlaW9tYXAJW0tOTCxYODYsUFBDLEFSTTY0XSBEaXNhYmxlIGtlcm5l
bCBodWdlIEkvTyBtYXBwaW5ncy4NCj4gICANCj4gLQlub2h1Z2V2bWFsbG9jCVtLTkwsUFBDLEFS
TTY0XSBEaXNhYmxlIGtlcm5lbCBodWdlIHZtYWxsb2MgbWFwcGluZ3MuDQo+ICsJbm9odWdldm1h
bGxvYwlbS05MLFBQQyxBUk02NCxYODZdIERpc2FibGUga2VybmVsIGh1Z2Ugdm1hbGxvYyBtYXBw
aW5ncy4NCj4gICANCj4gICAJbm9zbXQJCVtLTkwsUzM5MF0gRGlzYWJsZSBzeW1tZXRyaWMgbXVs
dGl0aHJlYWRpbmcgKFNNVCkuDQo+ICAgCQkJRXF1aXZhbGVudCB0byBzbXQ9MS4NCj4gZGlmZiAt
LWdpdCBhL2FyY2gveDg2L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnDQo+IGluZGV4IGViZThm
Yzc2OTQ5YS4uZjZiZjY2NzViYmU3IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnDQo+
ICsrKyBiL2FyY2gveDg2L0tjb25maWcNCj4gQEAgLTE1Nyw2ICsxNTcsNyBAQCBjb25maWcgWDg2
DQo+ICAgCXNlbGVjdCBIQVZFX0FDUElfQVBFSV9OTUkJCWlmIEFDUEkNCj4gICAJc2VsZWN0IEhB
VkVfQUxJR05FRF9TVFJVQ1RfUEFHRQkJaWYgU0xVQg0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0FV
RElUU1lTQ0FMTA0KPiArCXNlbGVjdCBIQVZFX0FSQ0hfSFVHRV9WTUFMTE9DCQlpZiBIQVZFX0FS
Q0hfSFVHRV9WTUFQDQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfSFVHRV9WTUFQCQlpZiBYODZfNjQg
fHwgWDg2X1BBRQ0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0pVTVBfTEFCRUwNCj4gICAJc2VsZWN0
IEhBVkVfQVJDSF9KVU1QX0xBQkVMX1JFTEFUSVZFDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9r
ZXJuZWwvbW9kdWxlLmMgYi9hcmNoL3g4Ni9rZXJuZWwvbW9kdWxlLmMNCj4gaW5kZXggOTVmYTc0
NWUzMTBhLi42YmY1Y2I3ZDg3NmEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9tb2R1
bGUuYw0KPiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvbW9kdWxlLmMNCj4gQEAgLTc1LDggKzc1LDgg
QEAgdm9pZCAqbW9kdWxlX2FsbG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSkNCj4gICANCj4gICAJcCA9
IF9fdm1hbGxvY19ub2RlX3JhbmdlKHNpemUsIE1PRFVMRV9BTElHTiwNCj4gICAJCQkJICAgIE1P
RFVMRVNfVkFERFIgKyBnZXRfbW9kdWxlX2xvYWRfb2Zmc2V0KCksDQo+IC0JCQkJICAgIE1PRFVM
RVNfRU5ELCBnZnBfbWFzaywNCj4gLQkJCQkgICAgUEFHRV9LRVJORUwsIFZNX0RFRkVSX0tNRU1M
RUFLLCBOVU1BX05PX05PREUsDQo+ICsJCQkJICAgIE1PRFVMRVNfRU5ELCBnZnBfbWFzaywgUEFH
RV9LRVJORUwsDQo+ICsJCQkJICAgIFZNX0RFRkVSX0tNRU1MRUFLIHwgVk1fTk9fSFVHRV9WTUFQ
LCBOVU1BX05PX05PREUsDQoNCnlvdSBzaG91bGQgYWRkIGEgY29tbWVudCBsaWtlIHBvd2VycGMg
KGNvbW1pdCA4YWJkZGQ5NjhhMzAgDQooInBvd2VycGMvNjRzL3JhZGl4OiBFbmFibGUgaHVnZSB2
bWFsbG9jIG1hcHBpbmdzIikpIHRvIGV4cGxhaW4gd2h5IHRoaXMgDQpyZXF1aXJlcyBWTV9OT19I
VUdFX1ZNQVANCg0KPiAgIAkJCQkgICAgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApKTsNCj4g
ICAJaWYgKHAgJiYgKGthc2FuX21vZHVsZV9hbGxvYyhwLCBzaXplLCBnZnBfbWFzaykgPCAwKSkg
ew0KPiAgIAkJdmZyZWUocCk7
