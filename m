Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAA64A6BA5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 07:26:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpWyz4T6Qz3cQN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 17:26:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::615;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpWyV2SP3z2yJV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 17:25:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1PwV6gCpTnP2GRki0sSxhZLcDIiPnv90HgT0Dm6szobuR0v6ffrIiLxIjS9Gg29CW4T4L/7yYreBRDgcViiLORnvqUXLXzzfgmJvhzD4ioGFoiZp8UIyVIHby965j6UKBvlx/sn1zVdzg7H5sH6xK15sifZPE4EYCEycbKglOgrt6QGNOJXnvaLzTae1qF3dKEWeLIb+iAI8HrWLlSPSGqK2pJHkMuV3OW4L4t7WgYdyLSJZnRrCvNOXC0WZXuLZ3wCdSBmW8oZJgWjL+B5U7IDv20f2Aet4W/lDRPEaJi3WSvVaX0mo650Armv4/ew28mDzVTntDo4afiyiuzSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZKyj7+ZpoEJJX9GPItWsnH+BpgTPeAkuzBp2GnzMfI=;
 b=KwGo/9x4h1tnxiF4CaRa1UArA+UfJq/IolSgkfsLqIV9Jkpy3G0blksBnmkc5pSXqIzd/a3qVvovjE470uAhLwXS/zI5uNhe95M4vmVtCBjL4eAkuLnAZ7rfxImL25XVH7d/Nq9D5V2YZQdmhfv/kmHt8TlVfOZIQIJfB0kzwBKqwa59fPxtupToZVTDHyKmKppkVqT8rEeQSD7bYsOdtiERqlaZrE5MNEkhVhkRAnqdX5sB0cUaqTvkRFyrIVvN8432o5OHtgk+irGRbfq2dhBHTkluvrp0ZSg8FhtjVntW8Nz1EyaPZ6NyQa8F80Mf8ZN1bOiR+A/I2EnlmxUXPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB1430.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:120::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 2 Feb
 2022 06:25:31 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%9]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 06:25:31 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mike Rapoport <rppt@kernel.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>
Subject: Re: [PATCH] mm: Merge pte_mkhuge() call into arch_make_huge_pte()
Thread-Topic: [PATCH] mm: Merge pte_mkhuge() call into arch_make_huge_pte()
Thread-Index: AQHYF/dYV4AUAj+Hv022zLzZ8RKrYKx/yWuAgAACAYA=
Date: Wed, 2 Feb 2022 06:25:31 +0000
Message-ID: <76605ef1-f2fe-8682-1eb7-2323f0b9bbaa@csgroup.eu>
References: <1643780286-18798-1-git-send-email-anshuman.khandual@arm.com>
 <YfoiLdboxJAxKi6Y@kernel.org>
In-Reply-To: <YfoiLdboxJAxKi6Y@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b03d4f1-66e9-4984-cce8-08d9e614d029
x-ms-traffictypediagnostic: PAZP264MB1430:EE_
x-microsoft-antispam-prvs: <PAZP264MB14309631BE9A7B3B89A6CCF3ED279@PAZP264MB1430.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ichr0D1Gj6sALIpgUrhzp1UVIaYogd2uk6925MP351va5buBVOd6g7+xnDR0X+SZRDUeAXoxCMd5hZw7bAWQx1QFEtmvHtz6iplAzIX27kfvYDxTShxFEi+kQJqJXljF4nZCE2NpTwLt2PC/EoBYYhb8V6gcPs4QHx72nXPKF4kBXGU1TlYW3PN/4JI95KYh9/S6NwNfzI4irQqKm3Mgh/YVMcqy2mkOacow1zNnfkWfeSUvUYIFH5rCIRZFJualKVtGVfXqPv8mDPXngcv8Yuk8Vm6ymVH23lHsFXAbTb3IndT/MwfZuSgKxrgn3NkpxU70b97OvoN2EDiFWHTYPUaR6/biJdxaK+Ti0FOEs4J3e95T26WZab5BX8MWqon6ye+Ll6by4Gi24iL9+r5Wf0WhNPT238zzfofnXAo6HoP5bQjGNqU9JOmwuy+GzkvIL+H5fcTcDfz8Vn+b9c14PlhCl/xMbL5DqkJZzwBr9DMBmo80S3x4xtgokIoU55aeCJ8Wvlv43jN1p6nBzmfFVOBj81tR/5mhoy0KNKO4/THRN+S5ylKnzpXE/YDu9StS8X235gbqQVCrCv5PkM20Lm+lUb90MCIYOq9xIkBfXbcOc/RSoi+a5qoaY/os3ZikZ4yimgSFcgKVHrZFhTF+NRgGg8hX/zvqgg1R1ts6fEmDvK4TUM14md3gfRxDKm/GlF1elZNXBBJKrtNM4cmfml7XkBwpZ40szskRfHEreDiimCTYDLG1J/va7jolWX2wYMbi2uPy5IhbVveOzYbi+k/A5ILbKKw5eNlWUP4lyOc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(4744005)(26005)(186003)(2616005)(5660300002)(7416002)(2906002)(44832011)(38070700005)(4326008)(122000001)(86362001)(83380400001)(31696002)(316002)(76116006)(91956017)(71200400001)(31686004)(8936002)(66556008)(66946007)(66476007)(6486002)(8676002)(54906003)(110136005)(64756008)(66446008)(508600001)(38100700002)(36756003)(14583001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTdBTG1GVGZQWUQ5ZXI3M2docDZTcGRJZGQvV01oaWM3b096cE1QazhoQW1T?=
 =?utf-8?B?SXJXejJvcVdTYzhUR1RXdE9IS2g1ZzJyQllsaUl3VzdWT2FLTDlYQUVLT3V5?=
 =?utf-8?B?NFBFVThXNkdkaW5PeWh2MW0yamRhRk1qdnNzMEZJdjlOZVEzN2dCbDhkZ0FW?=
 =?utf-8?B?LzFJMTc3SmpyanoxSEw5ZCs1Z1V3TGNtblhkVlQwTCt3MWY1TE1HK2F3L0Z3?=
 =?utf-8?B?ajE1U2Z5WHZSUzVaRUx2bXRTc1BLQmNzamFzSjVYR1Vyc0p0dmJkejQvcUln?=
 =?utf-8?B?bkR1bi94UWljQzZ0dDQzWU1nZjA4dGhRVTV2cHQ1di9rVUdRTVk1TzNiN3lu?=
 =?utf-8?B?RHNoQW00enR5N3N4K1QyTElUZGc2dnNHTmVTKzBBbCtwYlprRm4zZG5OeVlL?=
 =?utf-8?B?K3pISmg0QlplZm44WXlHcnZ0MGxqRjhNbnFGN2FRS1dqUVNRMWtkSXl0VW9a?=
 =?utf-8?B?MDFFMVRvcmRpMXV5eWJkbkFhVzVreW5RU3NXdVQvK1R5QlRGamVWam1wdHpE?=
 =?utf-8?B?ZDBzK0o2dFNEd2FiWTg5NGo0Wk5ZT0dKWndrN0xEbE03Z1dFdGFZZWF3Vy9v?=
 =?utf-8?B?Ly93WEFSeHRqWGVzRXFoVlRoY1hsVFVvTk9Sc2FlV2kvaEZObEIwR3U4NUo2?=
 =?utf-8?B?cmdscjYxZ2diTjBYZ3Y4UWgwdm4zSFdsQy9lUmRocU5YZm9BWGg2bEhCZVBB?=
 =?utf-8?B?cnFaYi9CdUxuSkNzZkNkOXJzeWhrU2V2NmJxUlJIWlEwRHdzZ0JDb3h5V2lz?=
 =?utf-8?B?NE1XUUZUR2FVQ0V2MEw3WVNpRUtneDJwWkY3bXExRFBOUlk4TFNnZzA5YkVL?=
 =?utf-8?B?ckpaOWx0YWJuUnhUcngwLzN0T1ozNzBYNlMwbkpqNGcvc2wrV2JNU1hIUlhS?=
 =?utf-8?B?WGdtb3g3OTFpM0VxY2xFRHVQL1F4RnJWMkl4elNPZ2pzUG55TnpNYXpYMTlX?=
 =?utf-8?B?SHlOZlQ1c1BoZXlqUmd3elRIM2RJUFNKeldnbTN1UndLNjVOT3NvYjhJQ1g2?=
 =?utf-8?B?cXhCa3hIWGdIdmRPbGFpRDh1UFB6TTZYOVdQQ0RyVXpWdDU3dFpFMUV3bllD?=
 =?utf-8?B?bFVrYVhzSzVGTGJuc0R3SUV5RGpQTzZXNW9SUFNCTjZpYXFaTkp1eCtqaGZ5?=
 =?utf-8?B?Z0ptUk9TdzR6UGZUUjltY0t4UGJpM0RiY3RmbEtINmRYQ2JseVFvT29PSGVD?=
 =?utf-8?B?SjI3S25FaU54MGdxZktUM2hseUhhbFYwOGxGbzlMd2tHcVFvTFVXTUdpWFRu?=
 =?utf-8?B?dS93NVJnZDFqRzBIdWV6aG11ZTVrUVUvSjdEajZ1eUJNUWc3RVpiYm9EL1Bh?=
 =?utf-8?B?cXFlb3Nxc3U4SHB3QmRTa295aUovOG04RWo0RTFjak80MEoyZkFXYld0THI3?=
 =?utf-8?B?dWtrejVtTkxpMC9DeVcwSjBKRVhxaHBFcytMb2FsNmhLNVk5S1pIV0xXMVFy?=
 =?utf-8?B?c1ZZVWpwKzk2RHNNbHpnNlcrcSszU2xNbk56TG96SmNlbXNCelJHQ3NPaVhW?=
 =?utf-8?B?QytJbk9tNkFQc00yK2VKajNLZUhRUXJTb2s0TUt2T0tGNW5aNGE2VmRla3Z6?=
 =?utf-8?B?VW1QLzN5N2VkL3dJNHJ5QWNSdW5FbndXaGptWkhya3UyRk10L1psdE9DSGd4?=
 =?utf-8?B?anNiem1xRW5xb1V3TzcyYnVyc1NDVjhLemVVdjV5SGVTNU9Lc0dFT3JHd2h3?=
 =?utf-8?B?c091WVN5cmZCelZnQzJoNDI1dlkvR0FiazlWMU1JTGxCRWpzVlRnMXZLN0Ix?=
 =?utf-8?B?TzRQeTloTGN1SE54TFBxYVZPNnlVb0xJVDA2UGhnU3U4Qkdpc0FWdmMxMlVz?=
 =?utf-8?B?WlFBZFBwK1hhUFJuRVc1dEdVWW1YYTl1NWYwcVBOc0x4L1ZxMzRCekNuUkxt?=
 =?utf-8?B?bFlZOURhak9zY0FiOU9FQ2RETGs1b0JlVXdCMFhpOEpKQTBBZnp5ZVNiRnJx?=
 =?utf-8?B?dER2RFBmbnJQZnpzSmJlektlQUVmK2dQdWFXdHh6ODdZbkY4U1RrYlJEV2ZN?=
 =?utf-8?B?Mnd1eFQyVzRqamFUVTJTV00rSjdDdWp4dXorTFhiNEM3WFpZN05UREFmN09B?=
 =?utf-8?B?TDlxU25MWXdkbm1qb2k0VXFBMlc0SWZncEdYNk1Na0prRUVFeXU3c0szV1Vu?=
 =?utf-8?B?QjA3UzkwNnExOVhpOVU1VEdvNTN3VVBPZDFUYThzL0kxdGhrSjJuZTROcjBB?=
 =?utf-8?B?aGxvSktkSkwzZ01xbm01ZEN5K1pCSmtlK0hSdUpCTzJOaTFraXFTbjFuRVV1?=
 =?utf-8?Q?/O6uUg5/RFpx196XS1EI4kVAZ/RilUxbHlv9pk6V0Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CD2515B7B8B7D4AA7DCF8CA5F3C6976@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b03d4f1-66e9-4984-cce8-08d9e614d029
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 06:25:31.5301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UdwLi/VWg70i2qtyMWwEhyWcsWu1o7lBZCLzjirsJaZU+CO+FKCtIypKUz0WE/EyfK2n13aKpAiX7y98fOjMz/P1adcJO68CfKlx8iRBjmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB1430
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
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzAyLzIwMjIgw6AgMDc6MTgsIE1pa2UgUmFwb3BvcnQgYSDDqWNyaXTCoDoNCj4g
T24gV2VkLCBGZWIgMDIsIDIwMjIgYXQgMTE6MDg6MDZBTSArMDUzMCwgQW5zaHVtYW4gS2hhbmR1
YWwgd3JvdGU6DQo+PiBFYWNoIGNhbGwgaW50byBwdGVfbWtodWdlKCkgaXMgaW52YXJpYWJseSBm
b2xsb3dlZCBieSBhcmNoX21ha2VfaHVnZV9wdGUoKS4NCj4+IEluc3RlYWQgYXJjaF9tYWtlX2h1
Z2VfcHRlKCkgY2FuIGFjY29tbW9kYXRlIHB0ZV9ta2h1Z2UoKSBhdCB0aGUgYmVnaW5uaW5nLg0K
Pj4gVGhpcyB1cGRhdGVzIGdlbmVyaWMgZmFsbGJhY2sgc3R1YiBmb3IgYXJjaF9tYWtlX2h1Z2Vf
cHRlKCkgYW5kIGF2YWlsYWJsZQ0KPj4gcGxhdGZvcm1zIGRlZmluaXRpb25zLiBUaGlzIG1ha2Vz
IGh1Z2UgcHRlIGNyZWF0aW9uIG11Y2ggY2xlYW5lciBhbmQgZWFzaWVyDQo+PiB0byBmb2xsb3cu
DQo+IA0KPiBXb24ndCBpdCBicmVhayBhcmNoaXRlY3R1cmVzIHRoYXQgZG9uJ3QgZGVmaW5lIGFy
Y2hfbWFrZV9odWdlX3B0ZSgpPw0KDQpJdCBzaG91bGRuJ3QsIHNlZSBiZWxvdw0KDQo+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9odWdldGxiLmggYi9pbmNsdWRlL2xpbnV4L2h1Z2V0bGIu
aA0KPj4gaW5kZXggZDE4OTdhNjljNTQwLi41MmM0NjIzOTBhZWUgMTAwNjQ0DQo+PiAtLS0gYS9p
bmNsdWRlL2xpbnV4L2h1Z2V0bGIuaA0KPj4gKysrIGIvaW5jbHVkZS9saW51eC9odWdldGxiLmgN
Cj4+IEBAIC03NTQsNyArNzU0LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGFyY2hfY2xlYXJfaHVn
ZXBhZ2VfZmxhZ3Moc3RydWN0IHBhZ2UgKnBhZ2UpIHsgfQ0KPj4gICBzdGF0aWMgaW5saW5lIHB0
ZV90IGFyY2hfbWFrZV9odWdlX3B0ZShwdGVfdCBlbnRyeSwgdW5zaWduZWQgaW50IHNoaWZ0LA0K
Pj4gICAJCQkJICAgICAgIHZtX2ZsYWdzX3QgZmxhZ3MpDQo+PiAgIHsNCj4+IC0JcmV0dXJuIGVu
dHJ5Ow0KPj4gKwlyZXR1cm4gcHRlX21raHVnZShlbnRyeSk7DQo+PiAgIH0NCj4+ICAgI2VuZGlm
DQo+PiAgIA==
