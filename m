Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7451D46D988
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 18:19:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8P6j2HMNz3bhl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 04:19:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::630;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [IPv6:2a01:111:f400:7e18::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8P5g0kK7z2xB9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 04:18:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvfIuj6XLntxsQhUMOwcqc8s7Vo12YjsGFO7wxtVGUqHeSUsHdbkJCt1/fSO4XBHFYxWZUBc7A8SlzAjop1c6rJvKIr1AupAxrW3RGlSFb4ujZogLUG+pFNiGif7Ep1OnkZgz3XtoCwZN4iSMybd1auAp9Bjh8yk3xzVqBUi7UIU7BlxKBPRKga1IUuoHR+gy9qpvQ1Rot3uBEDiIt2s8cj8z5uPqsONKVBtNcvUsIquZI9ggxyQu6OMss0e8VA3231zx92BjutVAqbnYgm+Bs82qssbWqedijs5w+ou3kcdKToX0ZEBc/oUWD7rYhm5e2X0f1KVImX5NTG52a36vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vbiVBTJEobY9e+IVs/nlsYXfKIAmFcHorRmD9PDUls=;
 b=XnqL+8k6Skj8XgsH1T9rDT7YMvgFQ2cboj1kyu0xfnYHEzibvCN8uJE8kGhrBrr58Pt7kxxUcMDMFDf90+G9XcoJzKzFZ+gKQulTOtgfqbjC9pQEiIILqohEdrVxnsNQQNmEeEKbMMScNOWxxHYBgViWkb4+DGdzstCQ16Longy3yzacsKF4wK5sxWcJTXqaOpDDOSlucgIaFvzLgnY2rH6MejTznQH2QtFvGJFOVi9G+L1O7jQuSFcP3xXWKaMdjuxoCH/+ZsCUco1GL2TP9gKobbD66BLFU2oRK/3lPP5/0uAS7bTugwWnp0S8Bzv9Ccab09EYyCXoGbQ70b7V8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0228.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 17:18:17 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 17:18:17 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v4 00/10] Convert powerpc to default topdown mmap layout
Thread-Topic: [PATCH v4 00/10] Convert powerpc to default topdown mmap layout
Thread-Index: AQHX7FeWpNWmw2j+bkaG2xB080sVTg==
Date: Wed, 8 Dec 2021 17:18:17 +0000
Message-ID: <cover.1638976228.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f696c67b-593d-462d-b02e-08d9ba6eb986
x-ms-traffictypediagnostic: MR2P264MB0228:EE_
x-microsoft-antispam-prvs: <MR2P264MB02283C6FE4223A96CB8DD636ED6F9@MR2P264MB0228.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cQKnLdfVn0tNemabxQPa/lKC7jCpvkp63sHjJ/mao2UHOnpei0fXOWRKOceTHZr0b2zHR7jkLbQIQV2eEXfRgVh8QGrZEPMNBv/toKoGi3BxlTitHXdlWiWua6BwD9o72lMyvKzkS/co/3l0c2pt3iKMjMnEXlouC5YkMzNPGVYfaqhelVW7+y+DzDW0lGpa5f3dmwIXxL4k5BMHkXQiId8KJc1JmMAD4aCeP7Dl0RSWcIu2QdIA068n+5MKKedxeB14j0iK9mjWPyQ7TfzoyVDqITo8jJifC8A0K3ZNWllAkp10864NxKDGS5sIGbLkb1ZONXmA25BYgrFhQ+P2RJruc3ZUSpfCI5yxiRKw+PkXoJdgM/s9KcfitXUjRudyr+/a/o165uzgGKwRWgyJpsX/Okaw7zyle286LkmOOx66VQZof12k/P5VOlNJYsF8yrsHr9qB8mYEv3bUI+VhpcP46+EvO/GN2vF7O92htlufzQKbbp35JhapwlKrOGNfCNTi5xdKgxO8ZXIWYgYY7ie1yfWuPJeG1F4yMl6x+KjiRL/sGKuVC09VTHv8eIaYKH8AylBBkDrrOeHixp12Lom8WNZ7onAie+IhYQ4HFsOgXsHoTJ7bomBj1ogSPI4MPh8n6RW4rYv+768bRZzqe/pkssX3lZYFCOOH1/oQdV2dnD8Vcl3ieI9t1k3mQ94FkP4gfjAIdU+kN56yibjl8g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(91956017)(76116006)(66946007)(122000001)(5660300002)(38100700002)(66476007)(44832011)(6512007)(64756008)(66446008)(6486002)(66556008)(8676002)(86362001)(4326008)(8936002)(54906003)(508600001)(36756003)(71200400001)(38070700005)(316002)(83380400001)(26005)(110136005)(6506007)(2906002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?A0F/Qd0nfiJCMuIy5Wtj7uZ9WyHpiUZ+giW00ZNlG8lDgXqr3GjK1SZItt?=
 =?iso-8859-1?Q?ZUnX72CsATmg56NRS357RIvGAtTwVbtQkYgECmjWbnKUQF5x1nwuSDbYtW?=
 =?iso-8859-1?Q?Zwu/verLhjDWu1i5ibBgH1Hy4xGPjgzGUT/HRSeLLc0Hm6ZyOMqPhF0cd4?=
 =?iso-8859-1?Q?OEdC6Rs8dhX2dTBA51ilpn+q47kzXaxaOkJAVKB/25HPBtEbHbDz0w2B+Y?=
 =?iso-8859-1?Q?u5I3as3aTLAefW8f2bUK6h2FHlb/NgGd6oqLVubU3Ceglvge4lX/sqe5gP?=
 =?iso-8859-1?Q?X1/7YjUADoa08DyKGkzFZv/mEKv6JoBvKr0NJQEhM16nIPcaEDRsmpBwMe?=
 =?iso-8859-1?Q?Nab7A8DOmL+DXQ0MYGEoLBnayjO0q5spmVxVg4eVwDRo+YmaNRo0K6xdA0?=
 =?iso-8859-1?Q?QNVtxsYqu0fkxKMenYVmoDF6952u/S2FUpLLMTASzGd/yjAj3qJvgb5CuM?=
 =?iso-8859-1?Q?6IvrYsLJLSHbV9TekQnG8vqo70OcWKm3lC7AHrip/5JG3UvW8t77xtHFCA?=
 =?iso-8859-1?Q?AwoNz2IlQnSzd/OllAlEsi+UrVt69pzfla601PY2TImKsiD3rd3sgePSsW?=
 =?iso-8859-1?Q?BH8QntjxszHFgzxf1dDOQ+5xKYvGtIpMA63rK2kMchkVc5akellZhtGKR/?=
 =?iso-8859-1?Q?JNI6aO9nd66mKoTsnLbwgajoqFoMI0ZglXVBusbW/4/3oSOeeUNU6XtrDd?=
 =?iso-8859-1?Q?SYbDLntFsFGMo7r8leF5/pIES9qI9ZTWXs5rOWYM29PbCXXmsmpFPpBqx8?=
 =?iso-8859-1?Q?DzxJXosFXn7hGgb5tqWsvAZBumAbG9WuXPmfaK1p//k3KV8YcpwTvqmIuv?=
 =?iso-8859-1?Q?k+f9dysGT9saSvUBhKoJ90wubsvzUMBMkiEKH1hy2JGzDVlhY7L/C0JBAc?=
 =?iso-8859-1?Q?RecUQE5naGL9Mn6561uUlDc5v6RNDbDSru71wfb34ElOCIJgwMgr39LAl1?=
 =?iso-8859-1?Q?Rm4gNZU++oOfREZm6VBH4a6KzuuGGh3d5fzpg1AvVpuJP2OARR0iMzZgaG?=
 =?iso-8859-1?Q?5inHKBYK733GG75ge7LS0uB3/vjwLfOICAB6+XpUxnCFQB+L/ZnP5WKp1A?=
 =?iso-8859-1?Q?Epzyd5/bLiEaKkesuYUprJJERXvQJz1OsV7yKhesGF+eAA8AFtMawrzZMF?=
 =?iso-8859-1?Q?bfwGqtyVi/VZE+eYINuUQ6cY54QIcB6UibOyJH8b+OOc0mqfpYt4QZTxqa?=
 =?iso-8859-1?Q?wJEaHPIN3vzXjwLxQ2i+eMn5LonLfHFQ7XJhWH7ty73EygaeM/wjgZCLjg?=
 =?iso-8859-1?Q?iebWcOAVTq6jwjBc590f3U7pqG0QN2j77H1Zwb6HGg/AuEhHidn5cm0l42?=
 =?iso-8859-1?Q?vONLoRAp681ZnZ7fM8YYFlV9UmcN8w7Qq4L4C1XPw0+iDiN+UmlMqt4UNz?=
 =?iso-8859-1?Q?K5Vy2CFgZtmSz0xfwjErsHY3fNLB+4WzhFjEwgg2aS1qO8ifR7MwjGHT/v?=
 =?iso-8859-1?Q?Prd//f/ki07oCJPbL+/YQZyp7SpRw8TL/RQ1E+OOsnQcAn3AP6JB0kYASM?=
 =?iso-8859-1?Q?Hg2zxUVwDtlqZX20ZgqwbjvlmXFvpvGxMQcfHoNzEPqsdxbRk/uPwaa+oQ?=
 =?iso-8859-1?Q?5u/SWBG7snp+N4rWP2bdpjgO7HakZCwV5IoU9s0E5SUpjEyTP+nBDmnE0f?=
 =?iso-8859-1?Q?8299jO8CvOS1QyXIh1wIvmuNzZMDO8QBG31/CfZU9Z8xlBVD3Pq6gC3jE2?=
 =?iso-8859-1?Q?Auzu2gurV8erYVIjGwvLGVL6eLcDzOwsqsadJixVRHphRuDvolnZzWzbSt?=
 =?iso-8859-1?Q?2ChEE8LXuQ0Imdyfb/vm42Wuw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f696c67b-593d-462d-b02e-08d9ba6eb986
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 17:18:17.0540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkGnQDKXslgBy5m0aaC0dXUkkDKF/YGs+9O7f2SHtNXYGJLoCMD42ReOh6DJdpUQwzpfTjWoUvZ3sddxrvaTgdDKFiMvUwnUjud6/821f/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0228
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rebased on top of Nic's series "powerpc: Make hash MMU code build configura=
ble" in today's powerpc/merge-test on github

This series converts powerpc to default topdown mmap layout.

powerpc requires its own arch_get_unmapped_area() only when
slices are needed, which is only for book3s/64. First part of
the series moves slices into book3s/64 specific directories
and cleans up other subarchitectures.

Last part converts to default topdown mmap layout.

A small modification is done to core mm to allow
powerpc to still provide its own arch_randomize_brk()

Another modification is done to core mm to allow powerpc
to use generic versions of get_unmapped_area functions for Radix
while still providing its own implementation for Hash, the
selection between Radix and Hash being doing at runtime.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Changes in v4:
- Move arch_randomize_brk() simplification out of this series
- Add a change to core mm to enable using generic implementation
while providing arch specific one at the same time.
- Reworked radix get_unmapped_area to use generic implementation
- Rebase on top of Nic's series v6

Changes in v3:
- Fixed missing <linux/elf-randomize.h> in last patch
- Added a patch to move SZ_1T out of drivers/pci/controller/pci-xgene.c

Changes in v2:
- Moved patch 4 before patch 2
- Make generic arch_randomize_brk() __weak
- Added patch 9

Christophe Leroy (10):
  mm: Allow arch specific arch_randomize_brk() with
    CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
  mm, hugetlbfs: Allow an arch to always use generic versions of
    get_unmapped_area functions
  powerpc/mm: Move vma_mmu_pagesize()
  powerpc/mm: Make slice specific to book3s/64
  powerpc/mm: Remove CONFIG_PPC_MM_SLICES
  powerpc/mm: Use generic_get_unmapped_area() and call it from
    arch_get_unmapped_area()
  powerpc/mm: Use generic_hugetlb_get_unmapped_area()
  powerpc/mm: Move get_unmapped_area functions to slice.c
  powerpc/mm: Convert to default topdown mmap layout
  powerpc/mm: Properly randomise mmap with slices

 arch/powerpc/Kconfig                          |   2 +-
 arch/powerpc/include/asm/book3s/64/hugetlb.h  |   4 -
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
 arch/powerpc/include/asm/book3s/64/mmu.h      |   6 -
 arch/powerpc/include/asm/book3s/64/slice.h    |  24 ++
 arch/powerpc/include/asm/hugetlb.h            |   2 +-
 arch/powerpc/include/asm/paca.h               |   7 -
 arch/powerpc/include/asm/page.h               |   1 -
 arch/powerpc/include/asm/processor.h          |   2 -
 arch/powerpc/include/asm/slice.h              |  46 ----
 arch/powerpc/kernel/paca.c                    |   5 -
 arch/powerpc/mm/Makefile                      |   3 +-
 arch/powerpc/mm/book3s64/Makefile             |   2 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  14 -
 arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  55 ----
 arch/powerpc/mm/{ =3D> book3s64}/slice.c        |  71 ++++-
 arch/powerpc/mm/hugetlbpage.c                 |  34 ---
 arch/powerpc/mm/mmap.c                        | 256 ------------------
 arch/powerpc/mm/nohash/mmu_context.c          |   9 -
 arch/powerpc/mm/nohash/tlb.c                  |   4 -
 arch/powerpc/platforms/Kconfig.cputype        |   4 -
 fs/hugetlbfs/inode.c                          |  17 +-
 include/linux/hugetlb.h                       |   5 +
 include/linux/sched/mm.h                      |   9 +
 mm/mmap.c                                     |  31 ++-
 mm/util.c                                     |   2 +-
 26 files changed, 139 insertions(+), 477 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/slice.h
 rename arch/powerpc/mm/{ =3D> book3s64}/slice.c (91%)
 delete mode 100644 arch/powerpc/mm/mmap.c

--=20
2.33.1
