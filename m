Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025EC88A58B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 15:59:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Rfxhp1aZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3GLd5Tt2z3vgJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 01:59:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Rfxhp1aZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3GHX3Hrzz3vXf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 01:57:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zl5nzCvrDIxeO2oHUBJMWe8hxdj55kYCMWS4jtu2c64+8x1Keo72MZN570QzMCJnTY2alpFtLV3oYOVTRxBk8eoOLi7R/LAc2jU5UMt28If53RwN+XlAu53H9bhrKNF/sJGZHcEy6nzY9Ba4N2ejIBVJzt2nw++C32lEckdfO9rer5T+bMymTnwtv3jcI7C+AmYCkHXxTBuvRJI9GwsaNPotN055k4bA1UYgYDqtjoEagDtDwDNJLIOrlI8X2S78oVsqhuDnHfhCmpF0IVvzLVTroYDvyMyYy+CAGUHPy6W7/2rZ+TJH1EmPx5feZDQnwdOpvBy0hGZ1T2tOxXuFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84QreFtl67XEre9tK3mbjyI4ckcEdK2lj3Aj53UAl64=;
 b=Hj4/jrDgQrRtbmh8zkAptO1dRtpSCBo0JDkK1EehSib5VHecm4VNRjma7WWYi5VGHlIfZCdz5l3FeSUDn8Fi8i9nOg/CIoCkVmntiCvlzq3jvdGc1DjvtJ1G9fmjRNrvMOAoGtMFXvnCKD1yD2hVtwX2Ba49NncGrDaAUyhpShtumE7PLUqhDCfjDn5fHf8IJTyuFLgFtK8iYqfipO98W53ErwtzAzkQCe/6Pj1r5+LU87yUfi3p4P1ZdykEqCpnO0Nsec3dyKOQUf3A8YEslz3hC+NDSIQQuOF9JuXKx8cqW44Q5DrIOuF1efgh/6tJAW5quIH+Ix4K32uotX/srA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84QreFtl67XEre9tK3mbjyI4ckcEdK2lj3Aj53UAl64=;
 b=Rfxhp1aZLyChmrUo7oatyXT1JOPW8joUov7ZyK1q89zw/M/8G76wih53ZKaD9XFAT2l6N9sEdev9OYErOcviRrz/urCvWPZQzpW8do38LrCouurUrCRAmQ787SSp9FaJ4iIg3bPdPXim9N1wXnZWK2L/6ysknhVciZlAns5yTgn/3eaElepcrSgO6LH6d4zuX9D+ox1AES2CYrdtleKpFmEVhwYYQVbWHdu8UKtizIhmj0yMLFX/SgUlhEB44KXAgm3bnsUa9O7LZKUOvLHCQlcT/MOTP04fDgRbvIPM5yQXUZBB80iQDt/URU1TNVAMvkw3zTh1EgBCWhUPmcwfgA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2119.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:16::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.26; Mon, 25 Mar
 2024 14:56:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 14:56:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "peterx@redhat.com" <peterx@redhat.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Thread-Topic: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Thread-Index: AQHae9xDtU7RU0MVOUS5yg8mgl66VrFIkZAA
Date: Mon, 25 Mar 2024 14:56:41 +0000
Message-ID: <e0c324e1-8dd1-4329-bcf4-56f7311aedcc@csgroup.eu>
References: <20240321220802.679544-1-peterx@redhat.com>
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2119:EE_
x-ms-office365-filtering-correlation-id: 2edb1832-5f40-4620-d25d-08dc4cdbc7bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  LAff8YclOzufNx59qTRC014qcoIC3u1+7MjSxd+oGhaNaplBq0vU12ZPc76p3IJPgCSwKVUr2BsXSRtDrXwHI2oCOZuqkJHjqu5z1/Y90IRrIumA528uvjiY1tBWsQVTLu8hlq8FGeXWRYW2h6dE9kyzTss42QiuvRhquptAGjhym6nTHxMLJNsotmQdP1kKor2g5PtdFrEGN/N2za6qIQ/Mq6b3Z7nuXZpR/X3NM4LXzvSTIPh2vQnYU/WrQKdudbQLuKNKRDi3Wr3ViTWH2hQWxxdpSL2WNqLcQPRYCKM7G4ZN6wimjiwE0RDhasurXJodIrTjEGdd5IEKJNLpl2I/HnddCeTovsmw8UXrIf5KbmJ3BflJYpfdw4bcaO3VJsNlK2XvG4pPmaHrWQboaSYG0iu8om/X/HQj0bEzvnZoN8PK/fVmjWJSOOosgpfGLvncub7ccD17oUBdun/FSvcjiwIYrGQecm5eUn+Fz/64KGJozvCGcaftXlKQn+3vdp8yODPUNaJEGO8x1TlRahJj/dgJp7yIyod+S0TLTwuOWvxDzIBlxY1fNROZi64wpTRfgV64ffq+aWM2z9oJALIH5Z2Q4pHMJ9WPWHz7j4hk8qW7Nil7ii0spDzf1QaRMAiFtxJckXQiRPE7qKgiMhNZwjNxdPpSWVJvywdDvYw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bG1hZi90ajBVQTIxdStUMlJhQWczOHY2VGVLYmFrMCtIRmVPQTQ5aHBCRXQ1?=
 =?utf-8?B?cFRCa3g4UlBVMitJeGdUd1ZrMGhrNkcySDRHaDZMMnkzaG9RSy9TS3FpWmV5?=
 =?utf-8?B?SFdSUXhQMDBjMUh3K1dQOTFNT1FjZjliMUtzWFB3WlBTT01wZmJtbXV0cElC?=
 =?utf-8?B?T2JwbGV3TmlvV0dlWXlnNFJsdGZPRUlYQ0taWkdwTEVzMldDemNzdTBaai9N?=
 =?utf-8?B?L1NzTnJ1SG43amYzdFlHelM5ckU0MXhiOFYwYnFWTXdKWVJDNFRRem01UFpw?=
 =?utf-8?B?Y2NJQVA0UGdkaFdnOEl3dUdaTTV5MjRFM0o1MHlaKzdsekpBL0ozTG1seDcy?=
 =?utf-8?B?NVhjd01mai9OUHlXKzhUNmxBczVPZmN4SE84WTVVUmxFNE5WZXpTNEFhQnhz?=
 =?utf-8?B?Y21LVFE2NW80c0s0dFRqeFR5MHdWUHJPck9TWnFRSFVOVzVOQUE2cnRjVmlm?=
 =?utf-8?B?M2tNZW96OGdodHl3L0sySUNGMDFkWFRVais2Y0ZzZkxnc0ZZditBM2tFNFd5?=
 =?utf-8?B?Vm1lYUpuY2pUOTRVOWxsZGpEZzFic0VDVFdpbS9wZTh3VWJuMjNmRFR4aHZu?=
 =?utf-8?B?dWhYRlVDOGRDQmlYeVpRZzdwRXFsQzN4eFk4aUN4dTRob1dIMHRyY3ZzTGRq?=
 =?utf-8?B?N2ErSmtja1ZBclBIZXd2RnI1SUxZV0NiTmJ6YkxEdWJjSURxYVhIdCtGT0pq?=
 =?utf-8?B?WWpvMlR5N0VxSTN6Ynh4ZWFFL0thUTNOWVlkaW9SUW1TbXgyT2dEK1FMN1Ax?=
 =?utf-8?B?VVVGK1BpWlhVUm1QWnhENW1GTWFWeUJvUFBCVmpDYjVtU1ZPcEJ3bUJEeXU5?=
 =?utf-8?B?ZUdaYmZacG1nREJNT1RsUWh5UDJzVDNhOHBERjF6c1pPUXlWa3Y3Qjc0NHp4?=
 =?utf-8?B?bklTL0RhcDlLVjkzMFZpWVJwNHZqKzBmYS9IQWMyU1VndjhqTWh3a0EvV2M0?=
 =?utf-8?B?V3d6TUlOVlZKVEh3YnZjOW1pSXV2OER5dTZlZzZTb05lZk1vR2tONVFrWndR?=
 =?utf-8?B?dXhYQ2NPdEh1YzRPK0NJalJiN0UrdzZPcERTSHRlNjJzWUhPa1FNLzNBbTZS?=
 =?utf-8?B?WU4xYnFjSFNURFIvSW1jalRHaTNSeStvS0ZTRHRnNVdMa2RUWTB0V1lBMEdB?=
 =?utf-8?B?K1pWMGlwd2tWVW9KbWYvRHdyL2l0NjNrOWFCSW52STR6eE9RWmhucHdrTWRL?=
 =?utf-8?B?ZzZRbUlYRDlNSndXU2d4V002cDB2eExsRFBMTHVMVFJTRW1XRS9NMWlTK0h1?=
 =?utf-8?B?VGtHR2JSbzVnb1RmZU5SZ1dWYm1EUStRMlhoZUFWMnAzSjg3aFgyVVViODFj?=
 =?utf-8?B?ajBHQ2hnSGVxQ0hhbHAwaTBCRHdNU1RwYjBtVy9IalM3ZDltODJMK211OWk1?=
 =?utf-8?B?SUhiSzc2cGlWeU5HV0I1RHg1VEJETDNzSXZ1cC9xZ2hZdFpOVFRJNE9sZHJF?=
 =?utf-8?B?YWdETDg2alhOWjQwTUhpRTJvc2dQdHA5d1NYaUlyQ1k0bElNNTRYWVpwUFB1?=
 =?utf-8?B?V29ZaTlZelpnbDl1Um93K3J3R2tBek05aGYzc3k5YVo4L0xpbDNiZFd4b0Fw?=
 =?utf-8?B?b2hCWGdLY296Z0xYdURWdWJIcEhONUs1N2lZT20wQUJKTVh5UUdBWVhNaHU4?=
 =?utf-8?B?Sm5vQWZWSnVjZVFWZk1mME5DYWlkcjJjL2NUeWhNYVd4OFJVN2tIOTlxTDNp?=
 =?utf-8?B?TklNdWtmZkR3ZXVmaTVmcVNELzQwMDZnbm8wajB6YTZQdTFhNjhqTU05YTR6?=
 =?utf-8?B?NTZHb0wyaWk4K1BwbWtJa2s4UW4rYk90UzRHSVVjTlVraHlHVm5WZDc0Znpm?=
 =?utf-8?B?bk9yaUNJNWVRbU1mQUVNZHZMdlYreGIrK0MxRDdOY2lMSnk1ZmY3VXFNUHNW?=
 =?utf-8?B?NCt5WE14OFAvdVc2WVJVNWFvb2RoM1l5TitBWjlUcm1LQVJrQ1d5bDZUd3RH?=
 =?utf-8?B?blU3NVRydnNuckcwbmpNTVhMUXp1c0p5UStLQkh2c3o0WHpmTVlmVVAwcVE2?=
 =?utf-8?B?VkhtaHBiV0lHNGZLQTc2VVJ6RVZ0MlJTMlhVZDZ1UVJlWUJnT2ttZmdMakc4?=
 =?utf-8?B?RkdLcm5UeDJBbTZIb2JhWmd6cGhrZWl5STFnbjZkQmpEcnZXei9DbzRCcFhn?=
 =?utf-8?Q?nUtAdiaBCxR4WVBnJoYI6ofim?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B86BBE6BD33F746B834A46846225D70@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edb1832-5f40-4620-d25d-08dc4cdbc7bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 14:56:41.2322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3zy08NPZ3RXM3q2fWs9MDKWepfpjo9wDFyRhpelhyT/KS82o/G8kLnpxUy7XVT4P6p3G2+st5FGLpMY3iI+AdLLfiBfZHXxrpZJg16HcI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2119
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAzLzIwMjQgw6AgMjM6MDcsIHBldGVyeEByZWRoYXQuY29tIGEgw6ljcml0wqA6
DQo+IEZyb206IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4NCj4gDQo+IHYzOg0KPiAtIFJl
YmFzZWQgdG8gbGF0ZXN0IG1tLXVuc3RhbGJlIChhODI0ODMxYTA4MmYsIG9mIE1hcmNoIDIxdGgp
DQo+IC0gRHJvcHBlZCBwYXRjaCB0byBpbnRyb2R1Y2UgcG1kX3RocF9vcl9odWdlKCksIHJlcGxh
Y2Ugc3VjaCB1c2VzIChhbmQgYWxzbw0KPiAgICBwWGRfaHVnZSgpIHVzZXJzKSB3aXRoIHBYZF9s
ZWFmKCkgW0phc29uXQ0KPiAtIEFkZCBhIGNvbW1lbnQgZm9yIENPTkZJR19QR1RBQkxFX0hBU19I
VUdFX0xFQVZFUyBbSmFzb25dDQo+IC0gVXNlIElTX0VOQUJMRUQoKSBpbiBmb2xsb3dfaHVnZV9w
dWQoKSBbSmFzb25dDQo+IC0gUmVtb3ZlIHJlZHVuZGFudCBub25lIHB1ZCBjaGVjayBpbiBmb2xs
b3dfcHVkX21hc2soKSBbSmFzb25dDQo+IA0KPiByZmM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyMzExMTYwMTI5MDguMzkyMDc3LTEtcGV0ZXJ4QHJlZGhhdC5jb20NCj4gdjE6ICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMxMjE5MDc1NTM4LjQxNDcwOC0xLXBldGVyeEByZWRo
YXQuY29tDQo+IHYyOiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDEwMzA5MTQyMy40
MDAyOTQtMS1wZXRlcnhAcmVkaGF0LmNvbQ0KPiANCj4gVGhlIHNlcmllcyByZW1vdmVzIHRoZSBo
dWdldGxiIHNsb3cgZ3VwIHBhdGggYWZ0ZXIgYSBwcmV2aW91cyByZWZhY3RvciB3b3JrDQo+IFsx
XSwgc28gdGhhdCBzbG93IGd1cCBub3cgdXNlcyB0aGUgZXhhY3Qgc2FtZSBwYXRoIHRvIHByb2Nl
c3MgYWxsIGtpbmRzIG9mDQo+IG1lbW9yeSBpbmNsdWRpbmcgaHVnZXRsYi4NCj4gDQo+IEZvciB0
aGUgbG9uZyB0ZXJtLCB3ZSBtYXkgd2FudCB0byByZW1vdmUgbW9zdCwgaWYgbm90IGFsbCwgY2Fs
bCBzaXRlcyBvZg0KPiBodWdlX3B0ZV9vZmZzZXQoKS4gIEl0J2xsIGJlIGlkZWFsIGlmIHRoYXQg
QVBJIGNhbiBiZSBjb21wbGV0ZWx5IGRyb3BwZWQNCj4gZnJvbSBhcmNoIGh1Z2V0bGIgQVBJLiAg
VGhpcyBzZXJpZXMgaXMgb25lIHNtYWxsIHN0ZXAgdG93YXJkcyBtZXJnaW5nDQo+IGh1Z2V0bGIg
c3BlY2lmaWMgY29kZXMgaW50byBnZW5lcmljIG1tIHBhdGhzLiAgRnJvbSB0aGF0IFBPViwgdGhp
cyBzZXJpZXMNCj4gcmVtb3ZlcyBvbmUgcmVmZXJlbmNlIHRvIGh1Z2VfcHRlX29mZnNldCgpIG91
dCBvZiBtYW55IG90aGVycy4NCj4gDQo+IE9uZSBnb2FsIG9mIHN1Y2ggYSByb3V0ZSBpcyB0aGF0
IHdlIGNhbiByZWNvbnNpZGVyIG1lcmdpbmcgaHVnZXRsYiBmZWF0dXJlcw0KPiBsaWtlIEhpZ2gg
R3JhbnVsYXJpdHkgTWFwcGluZyAoSEdNKS4gIEl0IHdhcyBub3QgYWNjZXB0ZWQgaW4gdGhlIHBh
c3QNCj4gYmVjYXVzZSBpdCBtYXkgYWRkIGxvdHMgb2YgaHVnZXRsYiBzcGVjaWZpYyBjb2RlcyBh
bmQgbWFrZSB0aGUgbW0gY29kZSBldmVuDQo+IGhhcmRlciB0byBtYWludGFpbi4gIFdpdGggYSBt
ZXJnZWQgY29kZXNldCwgZmVhdHVyZXMgbGlrZSBIR00gY2FuIGhvcGVmdWxseQ0KPiBzaGFyZSBz
b21lIGNvZGUgd2l0aCBUSFAsIGxlZ2FjeSAoUE1EKykgb3IgbW9kZXJuIChjb250aW51b3VzIFBU
RXMpLg0KPiANCj4gVG8gbWFrZSBpdCB3b3JrLCB0aGUgZ2VuZXJpYyBzbG93IGd1cCBjb2RlIHdp
bGwgbmVlZCB0byBhdCBsZWFzdCB1bmRlcnN0YW5kDQo+IGh1Z2VwZCwgd2hpY2ggaXMgYWxyZWFk
eSBkb25lIGxpa2Ugc28gaW4gZmFzdC1ndXAuICBEdWUgdG8gdGhlIHNwZWNpYWx0eSBvZg0KPiBo
dWdlcGQgdG8gYmUgc29mdHdhcmUtb25seSBzb2x1dGlvbiAobm8gaGFyZHdhcmUgcmVjb2duaXpl
cyB0aGUgaHVnZXBkDQo+IGZvcm1hdCwgc28gaXQncyBwdXJlbHkgYXJ0aWZpY2lhbCBzdHJ1Y3R1
cmVzKSwgdGhlcmUncyBjaGFuY2Ugd2UgY2FuIG1lcmdlDQo+IHNvbWUgb3IgYWxsIGh1Z2VwZCBm
b3JtYXRzIHdpdGggY29udF9wdGUgaW4gdGhlIGZ1dHVyZS4gIFRoYXQgcXVlc3Rpb24gaXMNCj4g
eWV0IHVuc2V0dGxlZCBmcm9tIFBvd2VyIHNpZGUgdG8gaGF2ZSBhbiBhY2tub3dsZWRnZW1lbnQu
ICBBcyBvZiBub3cgZm9yDQo+IHRoaXMgc2VyaWVzLCBJIGtlcHQgdGhlIGh1Z2VwZCBoYW5kbGlu
ZyBiZWNhdXNlIHdlIG1heSBzdGlsbCBuZWVkIHRvIGRvIHNvDQo+IGJlZm9yZSBnZXR0aW5nIGEg
Y2xlYXJlciBwaWN0dXJlIG9mIHRoZSBmdXR1cmUgb2YgaHVnZXBkLiAgVGhlIG90aGVyIHJlYXNv
bg0KPiBpcyBzaW1wbHkgdGhhdCB3ZSBkaWQgaXQgYWxyZWFkeSBmb3IgZmFzdC1ndXAgYW5kIG1v
c3QgY29kZXMgYXJlIHN0aWxsDQo+IGFyb3VuZCB0byBiZSByZXVzZWQuICBJdCdsbCBtYWtlIG1v
cmUgc2Vuc2UgdG8ga2VlcCBzbG93L2Zhc3QgZ3VwIGJlaGF2ZQ0KPiB0aGUgc2FtZSBiZWZvcmUg
YSBkZWNpc2lvbiBpcyBtYWRlIHRvIHJlbW92ZSBodWdlcGQuDQo+IA0KDQpJdCBpcyBub3QgdHJ1
ZSB0aGF0IGh1Z2VwZCBpcyBhIHNvZnR3YXJlLW9ubHkgc29sdXRpb24uIFBvd2VycGMgOHh4IEhX
IA0KbWF0Y2hlcyB0aGUgaHVnZXBkIHRvcG9sb2d5IGZvciA4TSBwYWdlcy4NCg0KQ2hyaXN0b3Bo
ZQ0KDQoNCg0K
