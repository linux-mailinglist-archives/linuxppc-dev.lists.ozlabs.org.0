Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA1B47531F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:47:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDQly3W9pz3cSZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:47:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61c;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDQjt757Dz3051
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:45:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTUDdb+u71wh+aLGW3mGLRleQKf6CG3xrp4ZxI9QAtYWpwOzTHACizxUTxMfWgCDuj8aQ7kxRnBob/S1qjFEAvJT79QhdBpw9Xre2elHRbX5Rj13dDoI5pzvzLfOIOSA4J5THMSniPzH3i3kqOBBCD3g06Qrnc48dRZFwrOclZkoBvSjr7rfSWemMvwKl9RDfFLCg0N3WloA2U9rGpDiYLVMSjIiRTK5EzvYBCvXD407PGH/jFJa1XIlspjYzWq0Nkz1DKbVlRP7U5Vy9rMwztzeQmVL1At+TYoQgB8H2E6mK+enbWCKhHOqYkwQ6XoytPUJmwMLefCT2N6AFp/x7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pqu5t7ZEZ75ytmq48ajhVuqgPowqyRBUVN8Qaoy7bhY=;
 b=YxN5OzpO9ZXVjqThApDuyQYW+3g1rIRNr2FDertCO/IyJ2mbV7rOxnfzIhjN2NBzwJgqOfAWz7WszrpEMn/z5hQfl3+B8/LQ5dg3BLaYIHd3oP7kLlvAU/2fLs+GBdKwCecnMLjgnDkShu+x8fzXiHLHZJbwid3Abael8mSiJes3+XaiR/6k5i0gw5WbBDACzh9tBlEbAHNqHFDugIdAQ/EWdskJ3rtWguMkSjR4voPUr9DsDnnV43Wfi3JqZSJQXlWj03/3RxTGNDlWqOtvKpOz8GIZPH9rQx7qzXmZ/NwOhvVBF798OLSx3tUb1xY0+t0igLn0QTkGR+CXOBMjWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 06:45:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 06:45:11 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v5 00/11] Convert powerpc to default topdown mmap layout
Thread-Topic: [PATCH v5 00/11] Convert powerpc to default topdown mmap layout
Thread-Index: AQHX8X9OSW2wRX7ASUO4LGtq8Gx6qg==
Date: Wed, 15 Dec 2021 06:45:10 +0000
Message-ID: <cover.1639550392.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2595facb-d1a3-4fb8-578b-08d9bf967102
x-ms-traffictypediagnostic: MR1P264MB2147:EE_
x-microsoft-antispam-prvs: <MR1P264MB214714266DECE4B50B015F44ED769@MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mfQILF/pzbSUvQT+GMeMJfYYaYKkVIMnh0e0Er3LHHgJ/htpCm7o0xnGN7zMGc1PW1Tb6VIuXhcFR03DkNp+EdQtkXWWzewdx7ywtdH5bdfr20Ujha6s96COKAXWLcpyUkMJthzW+awhjV6H23ARkJ0uYXOnNjHbn0hipNhHIjUFs/gdRAKA/FaCu08Y1YHWrDxjbyoeWXle0maGjm+qFoLPO3XI+DXQ7GAOAsmluJF6fEdXlHztiiYlcI1tnXzZr5evFUVjnuqTeLjodlivEgDBlrPs8RWg68mU3Ds1uyDWH1vh+zzAxs/L8sVBjOAjPZl4bFi64mr7eOZcuXNfuZK4WcbGezpD4ilP6xxDzJdKKrQyxUjyDCgdwps5CxsifSsItuU0T4Hz4RJjuMyTjTqWJhQO5dMFn1XE10FFYO/drrxMTGbDt+9Vmnq4cQlwBH0YmUqja+XzivLeSk4CTHsLWQoLjNSOpJ2eiIhMcmGvDG/7Fx08VSDJeiNy9bDLb/2VP7tIeAntTKaQgKZMIJUKfPg6Fjt001eFXCOxB3jKIMLSoxMn5Rqth8217UwVkAEKPCl9hyppOOgLiH5s/O7+2e9KZykiYX0iUHZui8bhaNgmO5t25HIqCLzPO5JDfRryfCYJicKHo4yb58P6t3jPhI/jr/kDvt+Jwgzf8rgfxHn60fxkUf62BPqmSDneeJtCDu76bSAxTx1hA+St+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(36756003)(6486002)(2906002)(86362001)(5660300002)(508600001)(26005)(186003)(38100700002)(8936002)(44832011)(54906003)(316002)(66556008)(66446008)(66476007)(64756008)(6506007)(76116006)(91956017)(8676002)(66946007)(4326008)(2616005)(122000001)(83380400001)(6512007)(71200400001)(38070700005)(7416002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KUeyBv6FmqiHVQV7gmP5zPzUyLMirC4HLMDJyZ9uDGzB8WGpYD+UdeAUIh?=
 =?iso-8859-1?Q?hhP1iUXb+avpOIzDYNXGocYl/8jN/MvQvDt41e4WiA/PwlLkuo4R1/nAkJ?=
 =?iso-8859-1?Q?dYBx/S8EwJQR/F67tkS6dXtKvxZgdwjWdJwbJqLm+65KRivxUznH3+XgFo?=
 =?iso-8859-1?Q?EuTQg2XsTCLDU8e6hyZdYTqryIa6TWeVuaFy/bEKm79GpEjj20gR83R7RU?=
 =?iso-8859-1?Q?gqp6pf6LlN3hCKds9f3f2ar1MTxqsBHnVHOwyySi4KNG8QCv6xJnhrLAW/?=
 =?iso-8859-1?Q?gNoS3k+1O+zLdflqvtWQrLE0HNyRw8aMk6hUuqp5uOCGLSFfEikDnO6V/r?=
 =?iso-8859-1?Q?cdaCHo8ncj77Is+d9PPFweF16HqywAp0leEOhX0eZp0r0Lap0vmIs7V5Ii?=
 =?iso-8859-1?Q?lW3w2tuO5QMiNi5TFO+JjUfCLiF9Cmrj5AfmJ/oxymb0enfzhpY77oD2f6?=
 =?iso-8859-1?Q?GZWdUZ+z2iHRGVWpouBVdoTLmPzddQg7QarRkxTHzZGphXwE8XaxqpcpB0?=
 =?iso-8859-1?Q?8AhVFRcSbRX1KAfHIBkdXeNQB2D3oNaJegktLv96vy7f1XDlx/ETQKEEIw?=
 =?iso-8859-1?Q?BMoL0jsETMgqQXZWpxYvH/ViK/XlUt9gMkruVV/Uc2lFHWYwFCqgoWSgQo?=
 =?iso-8859-1?Q?9GJo3m+PcCO/uScxSoIDslZruekRNyAVbfynGfKAsjoo2F2m3AF7SeCgSe?=
 =?iso-8859-1?Q?3baT2qu/u0XniT/UyJKhreEnK2YPqfOL5hXWP5x5uhU5+BrLYthJqAehcV?=
 =?iso-8859-1?Q?RID/JqZmRaUi46t6+Bi3kQZ3gB1ULGYbec4RJ9vV8IK9WBowxYqRdiexsf?=
 =?iso-8859-1?Q?1+g0a7aPAh5unGTu9/Z4672TPxbDprFi0+bXU1ZpIFI1AE0pEYWsQEVD2d?=
 =?iso-8859-1?Q?1QP3ba8OTHUVvg6vfHgi0Sa1DO7CosxanN7Vi/mMzEgxTGZ61VpP2vmyJf?=
 =?iso-8859-1?Q?F+Iu1Ex87UNNwlIqFkvu9zF3M6Fvpmt+Iopm1zohio/3T1fNEBKTZGrxyx?=
 =?iso-8859-1?Q?i26a+TIb6mTYOMx5XeOF8gRicx6bVhekGFiDxR2yR0cjmonY5VaqIbUrcN?=
 =?iso-8859-1?Q?GXygC1iiPHZ4Grh5/WLPmzbeOAtSqJuzVszmfscdlm2McrVM8VqHeiOwNr?=
 =?iso-8859-1?Q?hostThZu+nsD9mPNj7l3pbfxJJsS35L+9/HBjFz2l48SdmDYnFJGaP7iJS?=
 =?iso-8859-1?Q?DzMUoeAo7I8sI+GBPUrKrUnGXQOfQR7A2TbcAPFTf32DtAk0Ce466DRj+q?=
 =?iso-8859-1?Q?JQ8fybagXM3hgLUTB5I/5i57j9n2SI1OsGFVGM70QAXsDGgNhWDDQjef2Y?=
 =?iso-8859-1?Q?t/ji3B4cgxYLf4kmXHPWXX8WciYuo6aeAnyi14OaHXDWZkDQinQNMxaB10?=
 =?iso-8859-1?Q?WjgCdWqCjBrDReC/1Gy6EqbpD7dJqVFf6OFf59i2FLF9Cb1jXVLQ2wLlSQ?=
 =?iso-8859-1?Q?COa3cJzT403TisGSn9katacJC5muBQWuVFl35XoSijDMKPkX8F8A5jGeDA?=
 =?iso-8859-1?Q?L4GQTdx69vrdgZDDw9CsVGljN0QqWkPZmdCX06BoktIJlluAzoVDH/YpVb?=
 =?iso-8859-1?Q?eKliupJ4krWoRnDBwrMQcikAU/+4tOQEjfMgT4sfOGQ9A7ZLKofCRIerB+?=
 =?iso-8859-1?Q?MTqaeKAUicqFH6TY1cEaJrHa94lJ+BKuTod8oE4qDmUr5M/GpnY5/vj1tx?=
 =?iso-8859-1?Q?Jcr3NVxu1wsPpyvjcnPwR2DHspWfaSTScBV4pZG0+pMul+F38MsY6m/3qQ?=
 =?iso-8859-1?Q?tPepcqMgl4w8u3asEQ0RwStoE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2595facb-d1a3-4fb8-578b-08d9bf967102
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:45:11.0250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fJGbtJcun1jftXUfS+saOaAnu26d2ZGJxmljyr4PiApGrH22UhNwOMyd44We1F8L6o4rjzYeWEcpB46zaxw7XwZU1sH6+jMuZogPXIUga94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2147
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

Rebased on top of powerpc/next branch

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

Last modification to core mm is to give len and flags to
arch_get_mmap_end().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Changes in v5:
- Added patch 3
- Added arch_get_mmap_base() and arch_get_mmap_end() to patch 7 to better m=
atch original powerpc behaviour
- Switched patched 10 and 11 and performed full randomisation in patch 10 j=
ust before switching to default implementation, as suggested by Nic.

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

Christophe Leroy (11):
  mm: Allow arch specific arch_randomize_brk() with
    CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
  mm, hugetlbfs: Allow an arch to always use generic versions of
    get_unmapped_area functions
  mm: Add len and flags parameters to arch_get_mmap_end()
  powerpc/mm: Move vma_mmu_pagesize()
  powerpc/mm: Make slice specific to book3s/64
  powerpc/mm: Remove CONFIG_PPC_MM_SLICES
  powerpc/mm: Use generic_get_unmapped_area() and call it from
    arch_get_unmapped_area()
  powerpc/mm: Use generic_hugetlb_get_unmapped_area()
  powerpc/mm: Move get_unmapped_area functions to slice.c
  powerpc/mm: Enable full randomisation of memory mappings
  powerpc/mm: Convert to default topdown mmap layout

 arch/arm64/include/asm/processor.h            |   4 +-
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
 arch/powerpc/include/asm/task_size_64.h       |   8 +
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
 mm/mmap.c                                     |  37 ++-
 mm/util.c                                     |   2 +-
 28 files changed, 152 insertions(+), 482 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/slice.h
 rename arch/powerpc/mm/{ =3D> book3s64}/slice.c (91%)
 delete mode 100644 arch/powerpc/mm/mmap.c

--=20
2.33.1
