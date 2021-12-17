Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D177B478900
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:33:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFlhP5Cjsz3fN5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:33:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62c;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlZ75fCWz3cPk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:28:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyNkiVRke2J1xKlBnHOKZw3/92E1Hko9kPm5Bchy9eJP4AU7/hy5Kdg77FqNJkWGJD8gU0kKSHjPnyvh9hnou1zOot63MVf10utrZGCTdKl8D2aDsaALBab9kAEzUbRvkEg03Bq09gBsOfZ2GZd85OTA2G4vbyq4xyxzoGE9STQQ42hk/ijJj56SZq8RtmvAznd8tNJA9vrbCZ9hNpevfPv1lQS/lWqRsypAfla5uqo/dVgfYyLFimMCuxf5rv0HzO/us1bMMaWoMV+dekvyo1HnTfGtYCho4Fz+MNzD3eEcKLdjU82kla437TRFIjj1WjYspoyXzBlaa0vougdvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM1tsV2E7+/dx7vpR2aV9rqndz5KU8OyEwLYpGyZ5i4=;
 b=Fb71TIPa4s5aUA+ZwwH7Gy4PWjgftazMb7MRrkfGw7iOrPBlIZqx2/qn4bpQsR95ITF8GIVSjVKmbrUIVLR/04y4NHrs1TSR5kUQXQsnx2PV+ghjAPL8yH4byhiVOJcav+80ZZRP1V2cbZZN6TPhEfDIwEm2K/IDc8g+lyeyqHKZtrJMRIAE80QqqrlkRdQZvghZtRuhHzddICxz3sd4kPWJ1BqDSYnkKClEKnUUBYQ5F+NB2lRrvBXRUwt37RTLM++yE9S7i9L7fSO2hDu4t8ezBwKtOMN9o4tn0aloEhJJCkE5QCXMqx/N2QHYfG4utsd5bwl3GLYSSbAnZFiYRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:28:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:28:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 12/14] powerpc/mm: Enable full randomisation of memory
 mappings
Thread-Topic: [PATCH v6 12/14] powerpc/mm: Enable full randomisation of memory
 mappings
Thread-Index: AQHX8zDLLCiS7XjV0k2/ODdJkMHmPg==
Date: Fri, 17 Dec 2021 10:28:12 +0000
Message-ID: <a31ea02c499098c3a4dd3ef226d75b37a7b48edf.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 522cd451-6b85-45f7-5c94-08d9c147edea
x-ms-traffictypediagnostic: MR2P264MB0146:EE_
x-microsoft-antispam-prvs: <MR2P264MB01463AB562806254A15D3933ED789@MR2P264MB0146.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LnsmmboUaiK9s/wOIRSLQAfAV7zRsFWHVe1lNvsf8iKPWgwVdAeTGsYODfR0KZh4X0IHBiWX+Jm/rQKDcINm8JHsHaisZmCc5UBf4xc1VSXoMCwVNbyAaavcQhTN53qP9bC7qi4AFCEnjEvSezmlk1zd5wRGCS/UJwcMWWW5C+DWa/07g52JIVkT6lLUHorjfnR6icGqVzA/AboWCeS0LmgDqktNw7LbOYN9YBNjrd5bFfnv/d8tFIaO8KxY/dUGiRP8fWeNPSSJtklbC1CMzk9g5h0M3GVr3w+yn9/LSy7iBzRpaK3ylVL9nzLvxnfOybdGTeWZCbUzoIL+mdMo8aLkkjOrQjinVvENhkn+N2idR9fxUnRHnD4qo2FKl1Zk0871ZvXo7oyfoT6Mk+7P30nGuIEcfYij8fufZRMHvRgbO+gE/q8strvsBvSpxu5jgPjHXbLrFYqfEuvTKw+AsMOWeAmC1lIKqXq77fsjWJFwgKopOEiar8m39FBdWE++8scY3BBbomMpPPyH0kaQhLUURA1K3uDMDj7/vz8i+1NGzZ34G8vBQiZtcmxcDVehYfdTQ5+E8aOz+bw0tmefN2E1hzwcFQNHWN5/+Ek8pXJN8VF5rM67LF3qyQz0qk43m1QpufSMYe9Fpfex0ZomyO6oH+FVxExyEhEeAlNnKKAR51QW3aH69Btyaku2TK98XV/k5Q4nCm8X8VQgroB+gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(91956017)(71200400001)(86362001)(83380400001)(66476007)(66556008)(66446008)(2906002)(64756008)(38070700005)(7416002)(44832011)(6506007)(76116006)(4326008)(36756003)(26005)(2616005)(5660300002)(122000001)(8936002)(38100700002)(508600001)(6486002)(54906003)(110136005)(66946007)(8676002)(316002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?EK+Qv0TpiNOrqIL/pQsYenp/vFBKv+6z9YyxcR0CGrTUu144keSw5RWe3N?=
 =?iso-8859-1?Q?seLp3O+8tQTjCD9rTCItafofl2ywimy5km7YXSa1vliwlmfdKreaor8q08?=
 =?iso-8859-1?Q?+ewBjv7K9A2E2TUsKHG0FQF0YyIaEBY7KpxmZKnmR5lTbSVy0I88sh8u89?=
 =?iso-8859-1?Q?5jikXBUjzRAYnYL3AAIGxwjAPrmJ+4qku+ekAhwy6k798A0n0CznqAGtPa?=
 =?iso-8859-1?Q?sTRFQ/s7aJZr4YG9e/ljt7gpx0mlp7pKwgMcO5KgxjP1EyRG9Hl/hd8Uyt?=
 =?iso-8859-1?Q?hBMKyH6O9YW2DTYykUrWkjKt66d9WDO1Xw3UhfQvfrBwf3hHfeHrpS9+Dl?=
 =?iso-8859-1?Q?Vwt4o3E9SpVJFnqdCnNDYCerVbnYONlMscSmia1/DFDK1tlW7uHraI034f?=
 =?iso-8859-1?Q?TAbPOKc+uib0rRAuXYpH/nJFBajIofUmhfbw5HoxWrJIcUnEufZ0QJusbQ?=
 =?iso-8859-1?Q?vJY9nQwBwmTsTmTXoWh1etYX37EU2X4yqnPIc4OaOYgVuyt/vJ3u8upXyp?=
 =?iso-8859-1?Q?ozDLEnHkF7VXPmFTM4lBDVnm8125kcheZPEDZUjGM+RgOjQwmga/ywzlip?=
 =?iso-8859-1?Q?D09D10fgLj/NDFZ+ISwkSNkVtBvY3MLRMO0sE/1Pw8vLq8dXAz3gpj3Bsi?=
 =?iso-8859-1?Q?5rhz5y+3qJwZm7Mc2YFqSBLeIGIIr5ioqUfBYQJPzFPAcmZIElL0/dPmJO?=
 =?iso-8859-1?Q?hVorhRVzhxEomIAENsCmUTNwoQb66DSKWDzdukZwv6RyIpsnxZ5Ks99Ah/?=
 =?iso-8859-1?Q?HqiDhJrc5MdjLS6RRJwgOtLy7F8FZsWlQPmWFg15uik+bGjvLLuAVOdilL?=
 =?iso-8859-1?Q?83gjWRyFIDEEMCOGeK8/b3LCSoseMDp/q0YgAOOiTa8L1NrymqH1rMBqkD?=
 =?iso-8859-1?Q?8J2P7dqdS22sXPS89Hlj4mOyj8fSLz3+SBfmACwWr5ucgh61qoKS4Z+xrO?=
 =?iso-8859-1?Q?Ga2WGVIhs80D7ktKnjvNN+d7lW0susFtsmjNJPYwE6yg1vUFzJ/WG2iTqD?=
 =?iso-8859-1?Q?9v+GHrf+U5kQoic8Lmzg7UQm2bgNNJy2aHSzKOpM78dLdI0ZqDdfZ+l3hS?=
 =?iso-8859-1?Q?J6fHoy5IGnqRtkFojAHYHG5sfX51wsIbWm2E9M64ZBb2WWBd+Z08kfy62r?=
 =?iso-8859-1?Q?2ACM1nrlBV/Y9NiL7VRoTr6p2q2gorn3CGbq8VuQlHb52t2GrV0jV1f1fW?=
 =?iso-8859-1?Q?Bf9dLcPY293Kl787VejWV6h+tSkBCiyHGSL5nKBmm4Jk25inGT0eO43R8w?=
 =?iso-8859-1?Q?GN++Aq2wuIeVwzC8jjlB+oAXvX5JuLO8Zr/y+1FiPs8yOapkE0o45fH1RC?=
 =?iso-8859-1?Q?+tGSs7U7Q4L1yRBtczM04Q7VlJMt3p9TcKC/hqv0i9m4eD6fYFhKsWDuMC?=
 =?iso-8859-1?Q?9ivUFq/LCynmxzcAs7nod2vLUxeuH0TabrBRzGWCIF5MscNqMgFjUa0Ajy?=
 =?iso-8859-1?Q?hggW2DpL9BgQt2Ai8efnJRFb8kVJ66KEFd7yqr3T04fjfSKNYqPxV54/zw?=
 =?iso-8859-1?Q?CSXjhSzSrKgEAVG66I240skCFDmW+l5yjApleSGyKcGcQb8n1tUG5ZEvJg?=
 =?iso-8859-1?Q?T1WbCkJ9F09zXQCchIl+xKlTUL0bbVgEXp80mhi7D/5zz2CEIYtHBZr7Nf?=
 =?iso-8859-1?Q?gAy9ZiVHIp8A+yUL5Ohw2GvTL76WsENVrbKkyYDJT72x4DiJIRYabeDQ46?=
 =?iso-8859-1?Q?RdXzrRq4S8A7BAu/LM1pwzIbJdv7Z86tPX5dwvND6BZR0eFVQtlzP8xkwz?=
 =?iso-8859-1?Q?r9OarP6lNZxSVEK6KETZAf3b8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 522cd451-6b85-45f7-5c94-08d9c147edea
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:28:12.7252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pa4WcehptrpkrFq8k/qD8f3psE3PYPFbGGiqOXxobK+zXURVkNme9OFbw5YUmlEkhnKQvzluoN36PkpPE4ggHbnSquPqR8EgWoubqghviiM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0146
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
Cc: "will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Do like most other architectures and provide randomisation also to
"legacy" memory mappings, by adding the random factor to
mm->mmap_base in arch_pick_mmap_layout().

See commit 8b8addf891de ("x86/mm/32: Enable full randomization on
i386 and X86_32") for all explanations and benefits of that mmap
randomisation.

At the moment, slice_find_area_bottomup() doesn't use mm->mmap_base
but uses the fixed TASK_UNMAPPED_BASE instead.
slice_find_area_bottomup() being used as a fallback to
slice_find_area_topdown(), it can't use mm->mmap_base
directly.

Instead of always using TASK_UNMAPPED_BASE as base address, leave
it to the caller. When called from slice_find_area_topdown()
TASK_UNMAPPED_BASE is used. Otherwise mm->mmap_base is used.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/book3s64/slice.c | 18 +++++++-----------
 arch/powerpc/mm/mmap.c           |  2 +-
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/sl=
ice.c
index 03681042b807..c0b58afb9a47 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -276,20 +276,18 @@ static bool slice_scan_available(unsigned long addr,
 }
=20
 static unsigned long slice_find_area_bottomup(struct mm_struct *mm,
-					      unsigned long len,
+					      unsigned long addr, unsigned long len,
 					      const struct slice_mask *available,
 					      int psize, unsigned long high_limit)
 {
 	int pshift =3D max_t(int, mmu_psize_defs[psize].shift, PAGE_SHIFT);
-	unsigned long addr, found, next_end;
+	unsigned long found, next_end;
 	struct vm_unmapped_area_info info;
=20
 	info.flags =3D 0;
 	info.length =3D len;
 	info.align_mask =3D PAGE_MASK & ((1ul << pshift) - 1);
 	info.align_offset =3D 0;
-
-	addr =3D TASK_UNMAPPED_BASE;
 	/*
 	 * Check till the allow max value for this mmap request
 	 */
@@ -322,12 +320,12 @@ static unsigned long slice_find_area_bottomup(struct =
mm_struct *mm,
 }
=20
 static unsigned long slice_find_area_topdown(struct mm_struct *mm,
-					     unsigned long len,
+					     unsigned long addr, unsigned long len,
 					     const struct slice_mask *available,
 					     int psize, unsigned long high_limit)
 {
 	int pshift =3D max_t(int, mmu_psize_defs[psize].shift, PAGE_SHIFT);
-	unsigned long addr, found, prev;
+	unsigned long found, prev;
 	struct vm_unmapped_area_info info;
 	unsigned long min_addr =3D max(PAGE_SIZE, mmap_min_addr);
=20
@@ -335,8 +333,6 @@ static unsigned long slice_find_area_topdown(struct mm_=
struct *mm,
 	info.length =3D len;
 	info.align_mask =3D PAGE_MASK & ((1ul << pshift) - 1);
 	info.align_offset =3D 0;
-
-	addr =3D mm->mmap_base;
 	/*
 	 * If we are trying to allocate above DEFAULT_MAP_WINDOW
 	 * Add the different to the mmap_base.
@@ -377,7 +373,7 @@ static unsigned long slice_find_area_topdown(struct mm_=
struct *mm,
 	 * can happen with large stack limits and large mmap()
 	 * allocations.
 	 */
-	return slice_find_area_bottomup(mm, len, available, psize, high_limit);
+	return slice_find_area_bottomup(mm, TASK_UNMAPPED_BASE, len, available, p=
size, high_limit);
 }
=20
=20
@@ -386,9 +382,9 @@ static unsigned long slice_find_area(struct mm_struct *=
mm, unsigned long len,
 				     int topdown, unsigned long high_limit)
 {
 	if (topdown)
-		return slice_find_area_topdown(mm, len, mask, psize, high_limit);
+		return slice_find_area_topdown(mm, mm->mmap_base, len, mask, psize, high=
_limit);
 	else
-		return slice_find_area_bottomup(mm, len, mask, psize, high_limit);
+		return slice_find_area_bottomup(mm, mm->mmap_base, len, mask, psize, hig=
h_limit);
 }
=20
 static inline void slice_copy_mask(struct slice_mask *dst,
diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
index 5972d619d274..d9eae456558a 100644
--- a/arch/powerpc/mm/mmap.c
+++ b/arch/powerpc/mm/mmap.c
@@ -96,7 +96,7 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct r=
limit *rlim_stack)
 	 * bit is set, or if the expected stack growth is unlimited:
 	 */
 	if (mmap_is_legacy(rlim_stack)) {
-		mm->mmap_base =3D TASK_UNMAPPED_BASE;
+		mm->mmap_base =3D TASK_UNMAPPED_BASE + random_factor;
 		mm->get_unmapped_area =3D arch_get_unmapped_area;
 	} else {
 		mm->mmap_base =3D mmap_base(random_factor, rlim_stack);
--=20
2.33.1
