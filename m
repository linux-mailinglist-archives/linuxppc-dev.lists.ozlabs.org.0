Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F65495C2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:43:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgCb667sdz3ck3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:43:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::618;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::618])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCYX6kXGz2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:42:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fx7X4RfbgFSoq9NN+EkRvB1bRYOb9ClD/rB6Q7uE2+n+U12s6qxTDszX3kRFG2EBAaHa7rTMU+/+GabMLY9KV70OqEOhrJSYvGEZWNlhMw54MVaG4QasqiNWf30S8IzctFvzl0cchxJhxKZNlF3JihTgLFE05QQ5rjAwxpE0wgG56l58AArT0laT1AdOag2FYmyp0HWhXvpykmTkjngIYf/PEpU87GjGq46qbiytwymtFLvYliELdfzAD1wJYEif3Rek26yGOp0rmCHUhywoeyf9pjJEWiv45wIoaaP7u3zftyipY9PPIjAQ8e6PQ6jZGzDrrGF/ifLjFeqvmX9F7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuKZ8Pp5OoKCaatHC4wZ7EyUM5TYF66Dvkuh8U4yTxw=;
 b=Ki2qGt88FUPX/PLoRfc+4e7yDtX0kvwALKB9Ok4nhvmA4IXzfnMV2rsOAq0nyS78M5Fn68M6DMIeP6DLb3kocr0byJnGi+A2uj+GU/vkdP9GTmSJjiHrqhRgdDGC1l1+ncYsXTbO4Vw/YwttMQb50J0xPFlX9mmeDR2rNrmUTt10GTj6uSuugCVKlGS8IDOiJGTIobX5PWz+XyzVDtJqgWI1Y8iACtQHOQqX/u28fi0l+3z40+h7HSYrRXzcXMW1Ksjqm+AVDt8WW4njWvI4qJZYp+n9SLsfeDssvBiV2jpXx5gzOxkN7s1c/2A6SAN39cfYLLUTfvruBOwsh9g/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2206.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 08:42:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 08:42:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v7 02/14] mm, hugetlbfs: Allow an arch to always use generic
 versions of get_unmapped_area functions
Thread-Topic: [PATCH v7 02/14] mm, hugetlbfs: Allow an arch to always use
 generic versions of get_unmapped_area functions
Thread-Index: AQHYDqLI8PiIHuofe0mRvh3Qj48ibw==
Date: Fri, 21 Jan 2022 08:42:12 +0000
Message-ID: <a2da430c521ff6a6254f17623f2610ff4f1866e4.1642752946.git.christophe.leroy@csgroup.eu>
References: <cover.1642752946.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1642752946.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57eafa50-bcc8-444d-c766-08d9dcb9eb89
x-ms-traffictypediagnostic: PR1P264MB2206:EE_
x-microsoft-antispam-prvs: <PR1P264MB220645FBCB49F0036565B634ED5B9@PR1P264MB2206.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TAvQlp9jXWfZtjGEw3f5SmHbXCG7EWZiOxKeMYJHjPDGGhgxsHBhmtSH7hp1o6z/hBCh9+lvpZKcdAw+pJJXg91TQYroEuxgnluYI5j+1vxlS8vUq8XaU1PCJ+fr3/GGPsLXIL/Se2kogVFtIARsUoM5QLZwLVihKSAXVD5Pfe70TKWA32l//Ef3MQtUz1FQuFPO+fYJgtNsCXvRsDy2WON2EgsqeQ3eeHRMFMbKaDwsNqnQkQ1v/0Ia0aXgTYeFPho2Uxjexzvy2GRxC6Hx3T9G5Zgtxx2f2ID7Q+NlR+GBrgwafKVYoa+DvzYdesRBmzyUKzqBeUeEm/p0vVMyQhpnLbquo6RQKIQXEOlOIrcHbaxPVp0TwtdztK7WQlSI/ElGfnndCm8QxuhkiMKoDL6SB03omof/5oIJcZWgDLAYFpkQIH4i/s22BE1ggPBkrE1eVa5CDJP1ExNcm9fU0hZxSZR5CBPJg3f48qN1XF3oGRwSOXPmMHoVW4onaiBbjdDP3sUZrV3NRhRnTcp0Td9QBoKSO4ubVmbEWlkQF/fHb/OPBDsidJIXHk0I4uNhFCjpHki8ITkqtZO7/0Jdg5CW7rYvyGQb4L6hwFeX6bls1/tsAbIwdo/BvZo0y9jJqRqdo888adJoX9xwFMDvfEJ4/NBtX/WQaaT4oe13LIIZ/oOdeeEBScq9zChQjWs/AU2qlmcF3hNo9DLYkfuQ+oeZVty0ihbX6mKGDQzUWSU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(316002)(54906003)(38070700005)(2906002)(6512007)(8936002)(6486002)(86362001)(186003)(2616005)(83380400001)(7416002)(110136005)(26005)(66476007)(66556008)(64756008)(91956017)(36756003)(66946007)(44832011)(76116006)(66446008)(38100700002)(508600001)(5660300002)(8676002)(4326008)(122000001)(6506007)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2o92+MeuBvMs7us7YKe/bire//kfV0lc4DJrTBtmP3CAvIlgbY0vG5lJ9U?=
 =?iso-8859-1?Q?LXBVMw8NBTtBh9wPUmYaJo2GUpTDFFREPsJ02ekznF1hDfV8MX1GVfZrag?=
 =?iso-8859-1?Q?OYKzyD9Tae4dRvSdb6fIpBEr2VcSVx6sER7jM4dSK7ICqUXvVAN1JRzUrp?=
 =?iso-8859-1?Q?BEkMwxafTcgbbQumL0r5K0xh37hmkhwJ79jbkzLanJgIWAFpOFGY9YhPxO?=
 =?iso-8859-1?Q?AqGdWkJwxsm2AHPkGV+R1qftj2dIjtnyPx3QklyN7Z1KOFmCL7aXSX9nFb?=
 =?iso-8859-1?Q?OBUC9O79c4TQQwidXSDrShfFpzOIh45n1FdwTayjxwd/SQbmVPo23Rdp70?=
 =?iso-8859-1?Q?EQCYWB+kSFVO3euIO8OpQ1zLp+Ow7ocUfGdFKny3x4UAG3VPk82BALpZB2?=
 =?iso-8859-1?Q?SyhEgsg3zxRL0mrNmmd8ROFHlCXgZqTRwOACPoP1raq133RarK2qJw9WIh?=
 =?iso-8859-1?Q?Tp4QTUEfGM5Om19qxWousd64o0pqIGu/mhwc99r/JNBw3ltYlcylrpeB4Z?=
 =?iso-8859-1?Q?BmTbcAXdyXoQIoSuMsBgKi9SN3yBSSEdu2q0x+IdL4aeQAsyKM5htF8qEC?=
 =?iso-8859-1?Q?CDktEMB9u9tMbTxOcBvrYkBe02+QMiZ6mBPFdStxUgUMYaVekT6b1w7S/I?=
 =?iso-8859-1?Q?2ehGKNP7e+yOeCmoBY5kskm/Nupi1p2W2ujcxKZ4e0Wz3fgdfB+/ziugTC?=
 =?iso-8859-1?Q?08hLWwwSqvBl0G/p5g5c/M3xzuemMwSjsclnmcS14/txKUKfXjnCegp3jj?=
 =?iso-8859-1?Q?FiBx4aNlR3UEtXTzNCWbR7Ra+Jm8LYzLsvJd2LbNGmpLuix+7Mf4yzimYu?=
 =?iso-8859-1?Q?k9q+10heSFkGRdb2o2w4tkewTvHAFI+qD6tXYW7/Hcj/w2gtckwWm4Q2I+?=
 =?iso-8859-1?Q?cLhwjdLa//aUznm3CcZR08CC1kHG7t4KcIH0Cq3g4PDYMTOsfMpYFMgFEA?=
 =?iso-8859-1?Q?3mqc3Wwj65FHMq1+HIU9pV38jEa7pnMSPYYocWg5rsCr4yW9JlJy0uh2Ss?=
 =?iso-8859-1?Q?ABjveTnXEcisE0e5/Ulr5q3MFLWa6fr2xq8F77cBoVzG9l0vVKjRj/qjFq?=
 =?iso-8859-1?Q?WPrqYlF2L5x6hmEhBxc3IolbrncptUBwdTf/N/3Wjs/UYEI4tDlJo1yepw?=
 =?iso-8859-1?Q?V8nxRos+/HTbaQ2BLSpMD+4pESwC8ac2GADC3MHi7mGTgL9CxA/1DDqyMF?=
 =?iso-8859-1?Q?V5e7vYt2AtApzQd8BzHC0TErOFSFkjQ//rLTwLFlXMgIe5VDM5fdYjxRd2?=
 =?iso-8859-1?Q?/V+zPX90ZjTT8IO1rfdaKmmWolyYghcvYsEBoWIjK9gvJ3Nm+DKGNzXYr6?=
 =?iso-8859-1?Q?1kXX8hZ7aJO27pYskqBeNSY2oph7KIo8JcDcwvtFNwzXOaSPeN4d7s4gh9?=
 =?iso-8859-1?Q?Xr4KuZHv1ox3u2kDLUbqNZD1WlszuEyraRB1oOA1YFMrBUVk7Ym9STQzh8?=
 =?iso-8859-1?Q?caeBBS3BhdSszo6eA9nEZMjs8kBI3vyZl080yOzBM1CN+99UIsVgdyWi1A?=
 =?iso-8859-1?Q?frMmMGKJ+xrZJEsKPcCuQ5HCnuUglpWWbQ05aTUQe0v9cDu9Gtd3X9845e?=
 =?iso-8859-1?Q?9TD1742f/dW5olcHtg2aImP0MYVAuevwM+ZS+o4U0PJN2WYtv/v9HlRR9x?=
 =?iso-8859-1?Q?nCVzicl7QjBzLM2CcU6dm4uhDI9dMf5kzGAg+g0CEOxmMYT0JXtY5BQF7A?=
 =?iso-8859-1?Q?6yzuB931453uFLjPBYu5OXQE8A0dRRa6iZbGWTdlvWRpuvL6d40GGxknj1?=
 =?iso-8859-1?Q?8rlNrsZ0ah/a/TNbkRxESng7A=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57eafa50-bcc8-444d-c766-08d9dcb9eb89
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 08:42:12.2735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HFe/eTZZ1QvSleibJVPrR2MmakL2oY1U+8PVoloOl+QCPIBBB6wIdupS28Em7xwkiHdDEpdhdOSrDxQuQ4lk6MvHPQPft/CipKUE1At01HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2206
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unlike most architectures, powerpc can only define at runtime
if it is going to use the generic arch_get_unmapped_area() or not.

Today, powerpc has a copy of the generic arch_get_unmapped_area()
because when selection HAVE_ARCH_UNMAPPED_AREA the generic
arch_get_unmapped_area() is not available.

Rename it generic_get_unmapped_area() and make it independent of
HAVE_ARCH_UNMAPPED_AREA.

Do the same for arch_get_unmapped_area_topdown() versus
HAVE_ARCH_UNMAPPED_AREA_TOPDOWN.

Do the same for hugetlb_get_unmapped_area() versus
HAVE_ARCH_HUGETLB_UNMAPPED_AREA.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 fs/hugetlbfs/inode.c     | 17 +++++++++++++----
 include/linux/hugetlb.h  |  5 +++++
 include/linux/sched/mm.h |  9 +++++++++
 mm/mmap.c                | 31 ++++++++++++++++++++++++-------
 4 files changed, 51 insertions(+), 11 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 49d2e686be74..c7cde4e5924d 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -195,7 +195,6 @@ static int hugetlbfs_file_mmap(struct file *file, struc=
t vm_area_struct *vma)
  * Called under mmap_write_lock(mm).
  */
=20
-#ifndef HAVE_ARCH_HUGETLB_UNMAPPED_AREA
 static unsigned long
 hugetlb_get_unmapped_area_bottomup(struct file *file, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags)
@@ -244,9 +243,10 @@ hugetlb_get_unmapped_area_topdown(struct file *file, u=
nsigned long addr,
 	return addr;
 }
=20
-static unsigned long
-hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags)
+unsigned long
+generic_hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
+				  unsigned long len, unsigned long pgoff,
+				  unsigned long flags)
 {
 	struct mm_struct *mm =3D current->mm;
 	struct vm_area_struct *vma;
@@ -282,6 +282,15 @@ hugetlb_get_unmapped_area(struct file *file, unsigned =
long addr,
 	return hugetlb_get_unmapped_area_bottomup(file, addr, len,
 			pgoff, flags);
 }
+
+#ifndef HAVE_ARCH_HUGETLB_UNMAPPED_AREA
+static unsigned long
+hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
+			  unsigned long len, unsigned long pgoff,
+			  unsigned long flags)
+{
+	return generic_hugetlb_get_unmapped_area(file, addr, len, pgoff, flags);
+}
 #endif
=20
 static size_t
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 00351ccb49a3..df899d1937ff 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -513,6 +513,11 @@ unsigned long hugetlb_get_unmapped_area(struct file *f=
ile, unsigned long addr,
 					unsigned long flags);
 #endif /* HAVE_ARCH_HUGETLB_UNMAPPED_AREA */
=20
+unsigned long
+generic_hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
+				  unsigned long len, unsigned long pgoff,
+				  unsigned long flags);
+
 /*
  * huegtlb page specific state flags.  These flags are located in page.pri=
vate
  * of the hugetlb head page.  Functions created via the below macros shoul=
d be
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index aca874d33fe6..2584f7c13f69 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -144,6 +144,15 @@ extern unsigned long
 arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
 			  unsigned long flags);
+
+unsigned long
+generic_get_unmapped_area(struct file *filp, unsigned long addr,
+			  unsigned long len, unsigned long pgoff,
+			  unsigned long flags);
+unsigned long
+generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
+				  unsigned long len, unsigned long pgoff,
+				  unsigned long flags);
 #else
 static inline void arch_pick_mmap_layout(struct mm_struct *mm,
 					 struct rlimit *rlim_stack) {}
diff --git a/mm/mmap.c b/mm/mmap.c
index bfb0ea164a90..7ac6a07ff382 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2131,10 +2131,10 @@ unsigned long vm_unmapped_area(struct vm_unmapped_a=
rea_info *info)
  *
  * This function "knows" that -ENOMEM has the bits set.
  */
-#ifndef HAVE_ARCH_UNMAPPED_AREA
 unsigned long
-arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags)
+generic_get_unmapped_area(struct file *filp, unsigned long addr,
+			  unsigned long len, unsigned long pgoff,
+			  unsigned long flags)
 {
 	struct mm_struct *mm =3D current->mm;
 	struct vm_area_struct *vma, *prev;
@@ -2164,17 +2164,25 @@ arch_get_unmapped_area(struct file *filp, unsigned =
long addr,
 	info.align_offset =3D 0;
 	return vm_unmapped_area(&info);
 }
+
+#ifndef HAVE_ARCH_UNMAPPED_AREA
+unsigned long
+arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		       unsigned long len, unsigned long pgoff,
+		       unsigned long flags)
+{
+	return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
+}
 #endif
=20
 /*
  * This mmap-allocator allocates new areas top-down from below the
  * stack's low limit (the base):
  */
-#ifndef HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
 unsigned long
-arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
-			  unsigned long len, unsigned long pgoff,
-			  unsigned long flags)
+generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
+				  unsigned long len, unsigned long pgoff,
+				  unsigned long flags)
 {
 	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm =3D current->mm;
@@ -2222,6 +2230,15 @@ arch_get_unmapped_area_topdown(struct file *filp, un=
signed long addr,
=20
 	return addr;
 }
+
+#ifndef HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+unsigned long
+arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
+			       unsigned long len, unsigned long pgoff,
+			       unsigned long flags)
+{
+	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags);
+}
 #endif
=20
 unsigned long
--=20
2.33.1
