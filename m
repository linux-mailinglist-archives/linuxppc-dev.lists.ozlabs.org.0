Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA49475322
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:48:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDQn13TScz3dnl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:48:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::623;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDQjv3LzMz305B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:45:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVJiRoDuvbRKQgnhb96j/RhmFn2uSQvKKrEGcRWlvqW83AlEUuzEp5hDeT16+Fec/12wL3dMRAidkyhvkiwX5Q/0TZFblrB6CNigd7CUslcF368DOdmEOCHGFy+ekWy++EXyeVGpne5/1TzUuMXSySUyAsqbjFWbskc4DOuS2u0pcyRAk2LwvT0xueovl6uZ6Oa3K6bWa1vhF3X0PNlpfCjTmQqnzZ2KCynbxihmrmhZNjQ9wMoPsFIee9wfTrL1gmvdbhUIuD3DSUEeJLlNnpZXTQpbj6po32sbFBxLS6ctChAa6qquTYIfaXCwoHUDkjnmdZJRqoeMmfXdyQr5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM1tsV2E7+/dx7vpR2aV9rqndz5KU8OyEwLYpGyZ5i4=;
 b=nvxAdtQAfV5kPmXU3syupgoCOyvAeaitVIJCGmRdUhnQAQR4le0qKG0qlfKBhjM+CVe3BubeMXI7KOWvaW5YePw6wTPxcIb0Mu9CSACIf8gGtpYwg+obMJHC5mrB4fcdAQF41HyXR0hv+2wN9lBUuDLqmXFr9M4bS4YBPomG9C3gFXQkCkSYbJcCXtjxlueVsi3DEiVrVR06ncDilG/4gQ4TvRJq0MJeAJ8AU+tT8/wRr/7JmN4BTJjkXO8ErV9kbxC2yICgJJBGmf1QK+5U0rmc6pjVT0gD6kH3aBrUMTHaXjJq1SQfuPbiZ3FzsX/H+k+NVnNnim6/bn1jDvIpYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRXP264MB0311.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 06:45:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 06:45:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v5 10/11] powerpc/mm: Enable full randomisation of memory
 mappings
Thread-Topic: [PATCH v5 10/11] powerpc/mm: Enable full randomisation of memory
 mappings
Thread-Index: AQHX8X9Q/ktb5Z47sk+j8B+lW3TmEg==
Date: Wed, 15 Dec 2021 06:45:13 +0000
Message-ID: <b8936a0cfe109601e56b84480e54721be9303e64.1639550392.git.christophe.leroy@csgroup.eu>
References: <cover.1639550392.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639550392.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46991725-e54b-4a25-67a2-08d9bf9672be
x-ms-traffictypediagnostic: MRXP264MB0311:EE_
x-microsoft-antispam-prvs: <MRXP264MB0311C374F175C8EEF523EE1AED769@MRXP264MB0311.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: APjQCZUAx+4k8+S2Ysp2JKvpCrg8eitzmjHZ68o8qERFCSWbXiEt3pgxbc2M5h4K4BntTugHmObYAYaM2ums9jYX3AlSFiecLuZRaOQiSk1v0yXDsqAzw4g7oLrM2iPQjuTq0/RgR5BGNS4pOL9GMZgFye9tZUjLuM71RTEOx2ME7fF7q7MMmYxjh0GWR0xPzsqrBX9ON2stOoKkbWwLerOvNDatX6LRk7holw/BsvD6/3lA0GcKT0yP05rwVuXDfAc2QJRNaABK9fmilEYHoCBkjopmdJ0nVcpQJeQfwbkAPaU1XHaxX7XkbvU0ArXnGHPVUG/I/zaeOKo6n0skVgEVF+yTTZAvL5yWZb6+sUbuely6zh4Gy0r7SyeV2PaVzvHPVNMDaFicalVt1RWPfb6xCZWQdY5gNbMuRcLiamgd0Yo9pkO6Gy/ACERDc2MR338zbsUrggvfKi25/ibcqoAiccR6ylHjvcTmYX+veOHAjUsZ+MDqZwOOdAbhqp6LLyXBZkTyi/9LCMT7OYN0aL18Vm61stS4EXQbiJcaP/b6FssqZKjuVmv3TL92K256Cy1XgyrHGXKkKcT909A+t/CpDcoiK2oN8tVN6yL4SCYWhNxaK/z373BNeGHpf7PvZ2QWHrCGX7retG6ctSGDYKkbWZcs/Uh+gKQcWqukDKgxKi+JqZdZ72Feq7E0g6sw3MjChTILeIejTcaRjfygwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(36756003)(86362001)(6512007)(83380400001)(2616005)(26005)(76116006)(8936002)(71200400001)(66556008)(66476007)(66946007)(64756008)(66446008)(38070700005)(186003)(110136005)(122000001)(38100700002)(316002)(8676002)(6506007)(7416002)(5660300002)(91956017)(508600001)(2906002)(6486002)(4326008)(44832011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?G+gTTL/FOFvJOnvwsfRxT8tCTYSYW5qcSMLyPEUaOHDcQHeOc1EyzFnSrY?=
 =?iso-8859-1?Q?dyxMgIXfBq5kUgNJZt16eeHa+FuuzW1Cs3OZH1haeNUghpXUZodRAgH7ww?=
 =?iso-8859-1?Q?0pKqRvDeXe1Xo9JEyFTHhgoQ8nDf3J8t7L5V2wXK+q9Sxc7WvqwVRX2vW5?=
 =?iso-8859-1?Q?0AtkZX7bvKiUHdrGk/Q0KLIw3kSzuQ6rs2xOEGZWtcoNimnYlHAC2TdDK6?=
 =?iso-8859-1?Q?H8qp33X/yd4GGX/0mHvIUaiEd2srjcbBHNZ8Hs9C59MzOl8v7mqRxM4ALC?=
 =?iso-8859-1?Q?S9aYiJdABz62uaNPCUalXOEKhiWp35bmd88b+sopOHmHM8mteLKbNWMBBZ?=
 =?iso-8859-1?Q?IatPSksMM4Z6NsSgrRaU7eEDvtUs7+3bB1Pi19QKb/bAu29+xhYxjlMJi6?=
 =?iso-8859-1?Q?E8wzxflojiffVJ0cjiEIKZ6AFc8WrhM+VaHPuVujcS9zamcl74++yj37uq?=
 =?iso-8859-1?Q?/Wk6ZIGbb/zNxdSkoM/j70cgstTbepvGTjsnK1LZMeACcek4n5p5wM8ARt?=
 =?iso-8859-1?Q?15r3YzRWaKTwTZzyNj5uCxKQce1vPuh/1oJQMnNzqSsnVz509e/aQdkFLh?=
 =?iso-8859-1?Q?MrT6GbKOlgZCJWK8ktH/CF8Lpmdx20NxheDVNIC9g0OIQVDZSBuDc0TRJ7?=
 =?iso-8859-1?Q?1t3CFXM7hUvUYIyEScOCosH3XuMSGzS9VNBtat4bqGEDi4YGC5xFMpz18w?=
 =?iso-8859-1?Q?Jq3I3re6Hd+WOywhoWzRS7OGS1SCNgBuWar+8oEk0kriBwQ/BbVSbBNIPJ?=
 =?iso-8859-1?Q?SXAvaWa9HzMX/1IYDQwJw/RUIeP4nrp3gkEO/32ddMNBb2ikCBodzZtNJe?=
 =?iso-8859-1?Q?gXm65HdoxwoQNvkgPBqsE1jre/AwHAuHptxcFwrlZmsdziOaqS2VsdoeqY?=
 =?iso-8859-1?Q?pKAc5HoROrVWoKktj0kIKSg9gAHM/6jbXa9qQOFzNwQvApaT+ADoQjL8JF?=
 =?iso-8859-1?Q?hvd+kb6SgWHJdn2v8VlZi85fd3ktg6dKArHgTCkwMI3V+g/0R6KTwZdyPD?=
 =?iso-8859-1?Q?DJzcSc4LXIBM9/P/bx4XPQmU/Y56QyYWGHnxwtseIHdYhypWXZyOwMjykb?=
 =?iso-8859-1?Q?wGvnrYi91VITEYcTij/6w2hwwD/fSAHdWVLh25Lkn0b3/r1HpgYnWEZr+N?=
 =?iso-8859-1?Q?azp5xKP/gl25aHH8HSQLwyTM0NMNLfqg1WXMbRGeuhIntA3VgOrhWxkpQg?=
 =?iso-8859-1?Q?H6yHBByRQko+oaHHIZJ6q+gY1hAn6b5NQKdKYrSh96k32dsN73j2w1p0pM?=
 =?iso-8859-1?Q?xvTyta2DKIg2AlgR21vYpwdwEcAdC5TOIE2uVFpYJE2bDcOg07rwiIGcnS?=
 =?iso-8859-1?Q?hpkfr9Rx6v0xOgAjj2Mp7rItLP+Ha4yvJZSebzS3la6tqrQKadiiGhiBtd?=
 =?iso-8859-1?Q?iOvHdQacEQE+DsPqvco5Bbu/WwtoV+tvc5a75Fps1jFLgwu5rVAT29s3uq?=
 =?iso-8859-1?Q?XT3ZohTfeIzitdm9bs4oji4S3zFPEorx44rzoaPq+wSQMfd4kBeq2qHaYO?=
 =?iso-8859-1?Q?k5YhlAHLPQ0+ret2rR/Mih6tRprfM9nGtXhcvt3SY5T2hMQAlbDWRVWgPJ?=
 =?iso-8859-1?Q?9oqSR/M8wgFffO/EvgGWPfRjQViaYctgK0t22IcmeQN9mUevrKDQGWPoFJ?=
 =?iso-8859-1?Q?1D4AUDEhuAwUvFveo4V/ZJDFctDbUhaNznlergW0P2MwQA1hngOqhp3//O?=
 =?iso-8859-1?Q?fGTg4vjuj/6rAmZX5WcMBqaTHTMeP6TgUEB9QuJGu5Wgk0NpnBMvE47H00?=
 =?iso-8859-1?Q?eBmQijJlfjAI5O4dTT6NEPQNU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46991725-e54b-4a25-67a2-08d9bf9672be
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:45:13.8078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8jUx6jihDYYSolgj3DQntJZqryL6G7io7CAwKOZSyoYZuAIIFDd36nzMgrjedNR64hJ6n5lJ97JnRRGZJ1YIOh4Tl6nz1Z2998YsM/u5C3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRXP264MB0311
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
