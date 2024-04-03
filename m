Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A966896ED9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 14:27:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=MWar+xjC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8kXz1PPYz3vsG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 23:27:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=MWar+xjC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8kXD3tyxz3c1g
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 23:27:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpBDJF7Iw01xIY1mBZAGoxoDay5lCJKYtVUsWUfxKc65N66OE0+SYXUe4orGa3Yo1c8YJh9tQJfZawkxG7lAIVM20B4r/w9B2SpAOYFmpNKQWjheBWW3pn5VfGenkB52GiwCBJtWUu+wtVLjkvMWEJCMjy+4MK9SbSo9v+2QD+cT9KmTmA5/Ya9mEGFi2rNmzYRD1pWVEvPNFvJct0DKjsT1RTI0Ai16NFdIGS7Jc3JKeAv7XZZm845feH8zQARvVuGG7/Uj8meCweHuLTgvEJo91JQnlcHMP5oYvTI3GKToeLMdctG1JU8t9hG9zsnAKl/EgBLXSUkvmUWAThnkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNMP8xsf/49PjaNFXUlopq9topuQEHi9aik1dDT6FZs=;
 b=ew7hSjdrlyn4pSOFt5JJ9L4bEEBPz7N22lRXu9/QTYZUyIUPVuzTmARZA66wHigXUJ0fSlF9J2agL7pZMIAEiRcjgoS1E5CM4nxJTj3o8yQk0uUgcRRd0bYhyGzisPd/kLeSAwEG9KImP46Q8/OkOZ9Xurv80c+bTNs3ocgw5tZkbUOcTaio5A3sVrnZnPDhV+7kk+IZoRHs/VftE+aZdvyxSAk9+W9hUxZuOiY81BGS3oFuPqVpARu5Q0+3wuysL59yOH/p4CeYATBRgYRRMplIq4pDDDmrQ9NXuHnVQQaj6DfpSqLRIWTXiABSybnkxjrUzMzO+ETLwGUQwG7/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNMP8xsf/49PjaNFXUlopq9topuQEHi9aik1dDT6FZs=;
 b=MWar+xjCtWntf24f1qGYBl4jOD5xf7VkoxrLaUI3UyQcElBYsCyJvHp/j5GObYzfq/j9hVZjrDzYPOvowBcwEOrmucZI/QpBzZc7VpQiDoW71f/8/3p2uXobxkKZ0bHIfW1maVcBWH22KpeLZepmkKJItwD2uF5kL7DeaHGVU58cdiyNe7KIsOC6PbF/UbCt3ljbWJhpXP3RtJsf/dxMrqdjQ6oLTHXFCgBQF7EAs9WK/oT38VWT5ZR7jKxU2JNwyCeGVreKHbIyFhZyp30ypQ5qrNbGAE2htGJ4mKax6LV7+cjNLd7WN5Nj5dus1SVaf0AZx4E7WkEvPcCRhxfarw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1755.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:167::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 12:26:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 12:26:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jason Gunthorpe <jgg@nvidia.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Thread-Topic: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Thread-Index:  AQHagFrF+NhtRwW1WEuV4j/Hb81merFVYNaAgAA88QCAAAKgAIAAC9qAgADSXoCAAAUJAA==
Date: Wed, 3 Apr 2024 12:26:43 +0000
Message-ID: <3da59746-8acc-4a91-a19d-79a37ac75a8e@csgroup.eu>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X> <ZgyKLLVZ4vN56uZE@x1n>
 <20240402225320.GU946323@nvidia.com> <ZgyWUYVdUsAiXCC4@xz-m1.local>
 <20240403120841.GB1723999@nvidia.com>
In-Reply-To: <20240403120841.GB1723999@nvidia.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1755:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  044G/mYFN4LjcYkLSjcxkduIJ7XxPQhG/u6HVQeo+UXQr5zCOg7F7riaOAEka7itJqNRoK8WcDuLyNQwdMKUsAp0bqPW3Dh217UW9UtMkVhMkU82+zh9u32UmclD52uPtem2Edx6B1Y7OSxaJKbac/8yENDxwOLqtbLh1vZtDWyAsJEjYAGpQ0fPDdCEWRZnZxGXBlYPm/6RdXG5g4J7WTTxK9NxstAmEm4V+YZqmriKG2QoHs6AvYS4dQTbY6Vw/QPprZRnoU2/UOXlILVvzmGiPcfaOX5BC3eukrNx+YJZEdoOBH8ldlAR1DLbM78LV87NEotqSb3xpO6EfxE6yiYGmAJSc6tocg3IP1rB8WGU2fHSQnxUhYPBZDoRxz4ji0T8fQ4TrIbBp5s9NQRNiVU7975wD0VaW0r4JKBOSoUHo6fbuf+lVCxig3Pslf7hhxYLw7C3e8wk33YBo29VdtJz9+ZnnhFPLECrDyPWnJxBLb3uZDEZ3MmWpsaYTgUY51d9hWVqZn/ZzbiAai18uguiQqCGOrUvtvUvfgSPDtsTW+8wymXJF/NnxgMmJjiXKKJniHjINxJVeQ8+vKLQelcLofPJPAcdsJTkTR/TySbXW+YGwoNwSP9zwiQzimMfJtN1HiM47fVySkSI8idWnfchCX8SCfAjSQ7xHVwiDcU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SVdzcEdFcWo4R2pxbm5KNW5ESWlldjA1STBjU3gxZW1GcDNHNEZjdmFJcHNP?=
 =?utf-8?B?ZDVLR05CSHBHYTJMZDNoUGdvWVRMbFYwTDQ3NzBIV3JrTis2SE4vMFVBUFpC?=
 =?utf-8?B?bmRza2RydWcrYktaaVk1eVBwWWxIekVMQktFbXlRdFIwTldpRzltVU8vckwv?=
 =?utf-8?B?L0VzVjdDN1NUZCtzZVlTcEpGWkFhNGYrTHFyMzJydUE0VE1DRU1KOTBOaUZJ?=
 =?utf-8?B?UFZEVGlBRGVOdEsyOUY0MzFNU2xDK1l3YjE5SytPMDVleDNzajB1akhSaXYz?=
 =?utf-8?B?cU5zYVlIWjRRaWhySTE5anVCRFViVkhUZXFTKzUvOExFdmtvQnhLNFk2Rkdi?=
 =?utf-8?B?M1RXRFBpZUY2UnRDUS9SSHlPNUwrRG5tWVBPcU5vRmluRmdlQWlOTUtWRXpY?=
 =?utf-8?B?eGlmZFVhTjJhcEI5N2d6bExkUi9oZDY1dlNNZkFFMGhXZnUyYVJSTTJuUGxk?=
 =?utf-8?B?TU9IRk11WTNsSkZJRVZGQjVoQ1VLcm0yR1dMYUNDNko5OFJicVhwZ0xpWU9Q?=
 =?utf-8?B?M0F5bDlNajNyWnlIZzF0bjlrM1VSczBqbFNFYlBOM0xObnBDM0YyeTZzUThI?=
 =?utf-8?B?MFJmMVZpUUtkc1VaYkZYS2hXT0RMNTl2RmcwaWp4VmQwKzk1ZGEwM0pRRnZt?=
 =?utf-8?B?WnhCakpDUmMvS2xyR1Q4VFRiSmdoQ0lxVndLWk5DR1VHbjIraklwcE9mQmVn?=
 =?utf-8?B?VmNiMVQ4aTB4WVJnWDRoWWpHMWFNNEJLOG1vT0V3aFdFOVgwcHVEdHduMUN5?=
 =?utf-8?B?aFVDOHhmL1RMbG1GaHU5WGo0MDk2a1NHUjZZRXZKdTcvOEorU0c0aGI1UlBP?=
 =?utf-8?B?bEtQaWNCTXF2NVM4OVBweGtVRTB3aG4zNllVZVlEZkJVQ0FuSmNpMzFsOFNB?=
 =?utf-8?B?U0paTHZNS3E1MGNEaXVOV0lZM1RrSTNMRElkWFdYRlRJSkxhVEZGRVM1VUdn?=
 =?utf-8?B?UktjUGN0d1ZadjNhNGUrdWZTb3lNajhRYTZkRHFlV1lYNXdxTTd2ckkwQWhK?=
 =?utf-8?B?eURjWHgyYWVXSGo5ZGsvMEF0NnJzVndqNFl5bVhISVJjeFFXbjhrZ0ZNRDVR?=
 =?utf-8?B?M1ljdFJPWjAyNzNnbjhJNTQzZ2tkRERnZWl5SlJ2emc4cGZMZFhIZzR3WDla?=
 =?utf-8?B?ekNzMm50UFpFMGM3eDlDSmJLK2gwNVhybFE5ME5rbDl1NlZjbFdpV0duYnBu?=
 =?utf-8?B?VTFQMTFDdHhjOFJRd0hJOTZKUnBXbjArcjUyZEpaUWJpL1VkR3IyTUQ0dHZh?=
 =?utf-8?B?M0ZIT1pxeG9LU0FaZWhnSEROVm8zZGIvRzdwbi9QZTY3M1dSQXBiRFZOcG5K?=
 =?utf-8?B?TUU4TmthbTRUcXpuZHdmVU5Za282V2Fud2ZKWTVIVjJpWTdRMWhQNVhMRGtD?=
 =?utf-8?B?OHRaZjNSMVJCbENMT0ZpZTRmbXMzNGU1S25GRzFXWVh3Ry8yR2xMT1hEbEhX?=
 =?utf-8?B?UExHUW54a1JqSnd3djdiM0ZNT1A2M2Q5OFk1Q0hpS0QydjZIalY5T3VEQXB3?=
 =?utf-8?B?cEgwZG1uUldnWkJLeVdLSzJEK0NOZ0JIVnBGTHZZNE9scXExazAyMGRJc3RV?=
 =?utf-8?B?YXVKZzRRQ1VkS3B3bUlmMVYrVkIyQnljUEppczAxM1pHU29kZW13bjFKUG9D?=
 =?utf-8?B?SmVHYm5ZREcvcnRzV2FhT0syb3Y0OUJhWVk0VUVSaXdxdHBremZtRC9MY0cx?=
 =?utf-8?B?ZmhGdWJQcmpRNUV2RGZmVktuTkd5Y3h6UDNaVWlxM08rMzl3UkVsRXFCcHZE?=
 =?utf-8?B?cnB0eWd2dmJ3YnpMbDNuVnhqaXZlSVZyOXJPMUt4dXJ5TU13QzRscUNIK1Iz?=
 =?utf-8?B?RUsyamlBZlJuU3NWcTdadmIzR0djeVVkbzRNRVFadmM4OEZCZ2ZITXhtOFVD?=
 =?utf-8?B?TkkyRDdNOGRab1RocXVCOVY3bFZlcDYydXg4ODlUblBvaWFRbTRxWHBna1o4?=
 =?utf-8?B?Z04rZGptbW8zSkJJdGY0ODNIY1lpbDM1NGNWOXJJQWNsNWJManNJZytxMlgz?=
 =?utf-8?B?a25YZkUrVENVN0ZWR0tnN0xyRUgyNmVrTUUvblViUG91bmJMRzVFZ2p6bW80?=
 =?utf-8?B?ZC9RUlMrdzJyVHFacDdTejVzS0cxTjFjeXdNYmVCUDZ4ZjZURnZ3UzhBdnNU?=
 =?utf-8?Q?rGCHHhSFFJ18qZmWrKGY9DhTi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFE4D54AC1F41148839EE1022A702C8A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e031c8e-c7ad-41ce-19e4-08dc53d95267
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 12:26:43.4690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1MWiAK3MJW0ChY/kLFJ1yclPgoSjCad3wRrp4K79UhHfWaxvEzAxz1RvMELApdc0rzjWXeFI//7OVQggBLo9VQzl+R1OPgw7+Kmw080cpls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1755
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, WANG Xuerui <kernel@xen0n.name>, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K
 . V" <aneesh.kumar@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, Nathan Chancellor <nathan@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "Kirill A .
 Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA0LzIwMjQgw6AgMTQ6MDgsIEphc29uIEd1bnRob3JwZSBhIMOpY3JpdMKgOg0K
PiBPbiBUdWUsIEFwciAwMiwgMjAyNCBhdCAwNzozNTo0NVBNIC0wNDAwLCBQZXRlciBYdSB3cm90
ZToNCj4+IE9uIFR1ZSwgQXByIDAyLCAyMDI0IGF0IDA3OjUzOjIwUE0gLTAzMDAsIEphc29uIEd1
bnRob3JwZSB3cm90ZToNCj4+PiBPbiBUdWUsIEFwciAwMiwgMjAyNCBhdCAwNjo0Mzo1NlBNIC0w
NDAwLCBQZXRlciBYdSB3cm90ZToNCj4+Pg0KPj4+PiBJIGFjdHVhbGx5IHRlc3RlZCB0aGlzIHdp
dGhvdXQgaGl0dGluZyB0aGUgaXNzdWUgKGV2ZW4gdGhvdWdoIEkgZGlkbid0DQo+Pj4+IG1lbnRp
b24gaXQgaW4gdGhlIGNvdmVyIGxldHRlci4uKS4gIEkgcmUta2lja2VkIHRoZSBidWlsZCB0ZXN0
LCBpdCB0dXJucw0KPj4+PiBvdXQgbXkgIm1ha2UgYWxsZGVmY29uZmlnIiBvbiBsb29uZ2FyY2gg
d2lsbCBnZW5lcmF0ZSBhIGNvbmZpZyB3aXRoIGJvdGgNCj4+Pj4gSFVHRVRMQj1uICYmIFRIUD1u
LCB3aGlsZSBhcmNoL2xvb25nYXJjaC9jb25maWdzL2xvb25nc29uM19kZWZjb25maWcgaGFzDQo+
Pj4+IFRIUD15ICh3aGljaCBJIGFzc3VtZSB3YXMgdGhlIG9uZSBhYm92ZSBidWlsZCB1c2VkKS4g
IEkgZGlkbid0IGZ1cnRoZXINCj4+Pj4gY2hlY2sgaG93ICJtYWtlIGFsbGRlZmNvbmZpZyIgZ2Vu
ZXJhdGVkIHRoZSBjb25maWc7IGEgYml0IHN1cnByaXNpbmcgdGhhdA0KPj4+PiBpdCBkaWRuJ3Qg
ZmV0Y2ggZnJvbSB0aGVyZS4NCj4+Pg0KPj4+IEkgc3VzcGVjdCBpdCBpcyB3ZWlyZCBjb21waWxl
ciB2YXJpYXRpb25zLi4gTWF5YmUgc29tZXRoaW5nIGlzIG5vdA0KPj4+IGJlaW5nIGlubGluZWQu
DQo+Pj4NCj4+Pj4gKGFuZCBpdCBhbHNvIHN1cnByaXNlcyBtZSB0aGF0IHRoaXMgQlVJTERfQlVH
IGNhbiB0cmlnZ2VyLi4gSSB1c2VkIHRvIHRyeQ0KPj4+PiAgIHRyaWdnZXJpbmcgaXQgZWxzZXdo
ZXJlIGJ1dCBmYWlsZWQuLikNCj4+Pg0KPj4+IEFzIHRoZSBwdWRfbGVhZigpID09IEZBTFNFIHNo
b3VsZCByZXN1bHQgaW4gdGhlIEJVSUxEX0JVRyBuZXZlciBiZWluZw0KPj4+IGNhbGxlZCBhbmQg
dGhlIG9wdGltaXplciByZW1vdmluZyBpdC4NCj4+DQo+PiBHb29kIHBvaW50LCBmb3Igc29tZSBy
ZWFzb24gbG9vbmdhcmNoIGRlZmluZWQgcHVkX2xlYWYoKSB3aXRob3V0IGRlZmluaW5nDQo+PiBw
dWRfcGZuKCksIHdoaWNoIGRvZXMgbG9vayBzdHJhbmdlLg0KPj4NCj4+ICNkZWZpbmUgcHVkX2xl
YWYocHVkKQkJKChwdWRfdmFsKHB1ZCkgJiBfUEFHRV9IVUdFKSAhPSAwKQ0KPj4NCj4+IEJ1dCBJ
IG5vdGljZWQgYXQgbGVhc3QgTUlQUyBhbHNvIGRvZXMgaXQuLiAgTG9naWNhbGx5IEkgdGhpbmsg
b25lIGFyY2gNCj4+IHNob3VsZCBkZWZpbmUgZWl0aGVyIG5vbmUgb2YgYm90aC4NCj4gDQo+IFdv
dywgdGhpcyBpcyBkZWZpbmF0ZWx5IGFuIGFyY2ggaXNzdWUuIFlvdSBjYW4ndCBkZWZpbmUgcHVk
X2xlYWYoKSBhbmQNCj4gbm90IGhhdmUgYSBwdWRfcGZuKCkuIEl0IG1ha2VzIG5vIHNlbnNlIGF0
IGFsbC4uDQo+IA0KPiBJJ2Qgc2F5IHRoZSBCVUlMRF9CVUcgaGFzIGRvbmUgaXQncyBqb2IgYW5k
IGZvdW5kIGFuIGlzc3VlLCBmaXggaXQgYnkNCj4gbm90IGRlZmluaW5nIHB1ZF9sZWFmPyBJIGRv
bid0IHNlZSBhbnkgY2FsbHMgdG8gcHVkX2xlYWYgaW4gbG9vbmdhcmNoDQo+IGF0IGxlYXN0DQoN
CkFzIGZhciBhcyBJIGNhbiBzZWUgaXQgd2FzIGFkZGVkIGJ5IGNvbW1pdCAzMDNiZTRiMzM1NjIg
KCJMb29uZ0FyY2g6IG1tOiANCkFkZCBwP2RfbGVhZigpIGRlZmluaXRpb25zIikuDQoNCk5vdCBz
dXJlIGl0IHdhcyBhZGRlZCBmb3IgYSBnb29kIHJlYXNvbiwgYW5kIEknbSBub3Qgc3VyZSB3aGF0
IHdhcyBhZGRlZCANCmlzIGNvcnJlY3QgYmVjYXVzZSBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLWJpdHMuaCBoYXM6DQoNCiNkZWZpbmUJX1BBR0VfSFVHRV9TSElGVAk2ICAvKiBI
VUdFIGlzIGEgUE1EIGJpdCAqLw0KDQpTbyBJJ20gbm90IHN1cmUgaXQgaXMgY29ycmVjdCB0byB1
c2UgdGhhdCBiaXQgZm9yIFBVRCwgaXMgaXQgPw0KDQpQcm9iYWJseSBwdWRfbGVhZigpIHNob3Vs
ZCBhbHdheXMgcmV0dXJuIGZhbHNlLg0KDQpDaHJpc3RvcGhlDQo=
