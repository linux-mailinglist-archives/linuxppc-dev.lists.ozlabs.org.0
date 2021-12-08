Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BA746D98C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 18:21:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8P8F0RgYz3dfp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 04:21:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8P5g4cMQz2yZ6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 04:18:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXQNO7tgokw4+yMdFmKjXAubANMaKTZX1DeW1QGWvlrlnLsOdz6jqplL4fUIgfALNnthcRN8nFUc6IlYhcWJS1EbSV3NV8Vi3pVONpeGxlFowioA3e4Jwfu3tYaN1+3nA7Yxj3aQNHfUybF1dzLktcNDJWCeIT7lWts8KZRmNs0NEadGHrUP8JYO6KTC6USPEGCG/Ujy6e2a2L9DWh53vl6H/Xg+szVdC2bl2sw7k9qxtlMbX28RAdhHb3oMdwWbuwECsXAvZyyfVJD1bRaEAN2ZwX+0z8ysVBhTmah6SYL92k4iQsed2pHG1fC3v160B4XwhGLKVpwI2dvDuJlSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YWvRbBjf4U0kCRDlH8pY/8azmVLOnn0S8nZTqPpHvk=;
 b=gY3Mvt2CbKn/bvHtnnm8H5k04uzK67OZBUGKtyintisXRvNRM6uxO5N46IMAH/Zb7ZqZowzp9Co8Y1sc4suW9c8+LdiQdN293iKwnzETPo1QIUXr5U8DU1E/ExKhhQz1+osNenqVcM55EwNV3xN5dpdniWFEU2k4haJ+k6YK2hsJpvHbPXVEKeTv2H2XPyCtWqmjjVaHUC77XMbaLABnQ41kBudOS1IJvNOvZmPXg4P2bymd9lM4HsmgKlyTkHoVlB+cDZUTXfVi8zKWEEh0+oeiAhMRsx2e3x1q0pgIjMjNRnGe0Jwvtr4lprDy7+N27uGg1VWPeT8PAazBTWUK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0228.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 17:18:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 17:18:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v4 02/10] mm, hugetlbfs: Allow an arch to always use generic
 versions of get_unmapped_area functions
Thread-Topic: [PATCH v4 02/10] mm, hugetlbfs: Allow an arch to always use
 generic versions of get_unmapped_area functions
Thread-Index: AQHX7FeXC+bo9wFWa0ylx4DmOTaxMg==
Date: Wed, 8 Dec 2021 17:18:18 +0000
Message-ID: <52eb6d66c41f1165c88a0b0da08ae190c0b95a59.1638976229.git.christophe.leroy@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1638976228.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 663d94f9-e49d-41cd-58b5-08d9ba6eba39
x-ms-traffictypediagnostic: MR2P264MB0228:EE_
x-microsoft-antispam-prvs: <MR2P264MB02280BF647383F31D7F15F81ED6F9@MR2P264MB0228.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gKKhevcMkmUToTHKkxJrf/+v/OlqVftIpwxxclDTtrWddplZmqRDnzfnqlfqgjQcsftA2ndI5nG3KxgwUL/fpAKnyGCvCsyel/NJseGz2oGYs68G0SpYrQ4dczs1PJaYQyzhJt3YtYwSoujrdqxJ9ZA4AFMFJ+XLrnwgozh71pnkWVbtvNsrykjsMas2p46wetA2oX71Rqs/sOu5n7earHY0NlIvIuBbBH3iZfv0mObYObhFbSrQtbzebrXYmcxrK+13v5JwwCgOX5qJmey3XwgpuBVLDyPje6+8Npvx3FfaMbseL1SiJPxtY3p0LwqTwTfkhIcb3Qsy1kpgIsIKi8YhCIHBU+Qc/7N4BRWNz5lwthew+UqVRaQTSEWP5nkfxn1fYpugZqz2mTLH8WWTIW8pXgBCi3IrPN1pQdcpb8rGn+LO7MrzNumdTuNdIXr9xOObsYmLFA4ZhPThAGLtkGxhOOw/aD32P+RCKQo/k9HX1oWNLe6EH6gype857Txi+s4QPOH1kqQccVyVdguCmL7FVKBW088iKlS31fX0HgXhCRGyOuekMBbWmDo9/DPOyrDqy1Tn46tK2LUujbs5qhZIbqqgc5hH4Mva/ynDTi7SPacvZCWuWD+S6/0s9yRtAFRHBXU04QyfF/79Jwps+R/Tn2hrkRAVfyL+LuPE7ZaLQQeyCgHKT4+az2/tnfnt9hVpwKFeTzgDxawzc49O9BSxfTz3IXZEsPMkaN+K8yo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(91956017)(76116006)(66946007)(122000001)(5660300002)(38100700002)(66476007)(44832011)(6512007)(64756008)(66446008)(6486002)(66556008)(8676002)(86362001)(4326008)(8936002)(54906003)(508600001)(36756003)(71200400001)(38070700005)(316002)(83380400001)(26005)(110136005)(6506007)(2906002)(186003)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?U/95AweVdvyItBy5oWdOwaiuty2qiKat6/t4XTVN0/skRNtNJbnIDHbjPo?=
 =?iso-8859-1?Q?TF0IN3IrSvgJuXiXSn5EZgsTYCk+kLa/vx7+uPP0R3aikSF7pfpiclPgnY?=
 =?iso-8859-1?Q?XdNHqoY8jdYcHKVgKsQ1t+sg0K+xLpoHW13fVSMobcVCsxhCG2GfbuKCxS?=
 =?iso-8859-1?Q?RFIip9hDpOkUYCFtBsLRJubtAWxXMARnAMAfIGDCn371TMCMGhpxea/GZ0?=
 =?iso-8859-1?Q?HtU33ntGxl1xAtUn9i9eusNSWqsbJhveQWk99Lug9h6KKUVk02u6jYEsZa?=
 =?iso-8859-1?Q?sr4WflewPHW+watjz5fpLU4RVxDenuqaCuahaQU/Kg5ELOEjYgdkksrzQd?=
 =?iso-8859-1?Q?V0w7rlMUywsCZ95ouSOtThLbwiWa/w4HzxyN+gxsYP6H0SRXjzCRwEsQNI?=
 =?iso-8859-1?Q?GISMnzmVYsGs58MNSkxws5IzOrXfqcc8XA3Qkp5x5uokyCiJlDb80+6U14?=
 =?iso-8859-1?Q?aDPNOnNQMIkXI+9H6OgKqjjMwoVH/hRo8gU+sKex5Kiipz2k4qTM0nBzm3?=
 =?iso-8859-1?Q?MDkhGLZFeHLHB+XS0OfheMPdK2MBOrg/d6EOoSS53NT0bo7+QfC3OgXZOs?=
 =?iso-8859-1?Q?TjdkZRQaJOH6I6ZbHwmAWju8V0mbMG2ZcizpQ1baYnW7IF8DNyrcH5lme/?=
 =?iso-8859-1?Q?CCKCIGG4P0IiojL21xohlrbTg/vHY5Bla/3L5BhfAXBSGCFALy3QlsIAU3?=
 =?iso-8859-1?Q?lIz6tDBOIvyH+9oWq4cjfGq7NW22hjeZUxmzJi8xKWpauJXnkml3VFt62U?=
 =?iso-8859-1?Q?fKHOkIHLqHJMoa/xv/AaWQPpsHCntMGGUEWRlbcxJW8pbFATbqb6BmlB9E?=
 =?iso-8859-1?Q?TKQUcojdDnx49oTGRmnuLMEUaarEKOVVA8ZL1MeQsBtZ8XLvZe48IhISnH?=
 =?iso-8859-1?Q?w5KbzfDUMOG6DyY38ZIrDDNDx0mK2XdT7/YKNwawgJEfxQC5yO9t17/Mou?=
 =?iso-8859-1?Q?eJspMJlsMycEsT2WFsXZn8iw3ipGzVyfC/u4MbRrIrwOWxFv2Hp+QOQcev?=
 =?iso-8859-1?Q?zw2/Lc9RjTKp/2wMlL4KAsdYfajOado/qV/Oj4AQT9pO85xSd5TgUFUwtU?=
 =?iso-8859-1?Q?MUkLW363HpnQsjLH3Rwln51aKo4usSXytigU3wBc5Y8oAnor2mGW1N772D?=
 =?iso-8859-1?Q?v9mzejSMEJD0M8oloFnW6gJUBDpzV/NEfMDRSeyC2YiDWsuD15CFuNG629?=
 =?iso-8859-1?Q?RanAR3nSI3yCePwcRKYr9n6coGWpOL3hN3vM2bdT6kwBHWu6ZlOcwFpLf0?=
 =?iso-8859-1?Q?apseMQBoscEOlmxsbOmObpS9XreA+jwwkjI9nsjEU7wcEMvaZg4lPpCQEG?=
 =?iso-8859-1?Q?jH8JdojxK13TVsWwgzvMKbAW3bFc/cuTsTOPIWzIi98qWWWSddaVxT/rRG?=
 =?iso-8859-1?Q?vdqvwhbJIaT4ylSdvc6zndimoDMeEj13Bm4ivM428/qH6eyP4v62Ps6ItZ?=
 =?iso-8859-1?Q?KU+oF4CHtfAheQqS66kYMCH575wTyREENr+Otz8k4UfNDRGxzISVmFGGib?=
 =?iso-8859-1?Q?u26+0T4BoIIj3EbROeOPlBCol0MBUqLxAi3llqBV4/RELC0h3eX7jPumcM?=
 =?iso-8859-1?Q?ZNJw2IMXuWwZYyyXfRmRjRsTnKDrHZcCkwW0IZbRyob9iWLlB2uA/XeuCU?=
 =?iso-8859-1?Q?jwv6XpclhvMwI8zuFhnXjjsbqCWIxejQhI2NV6FT3xkvMmNmIMrL/OkAwj?=
 =?iso-8859-1?Q?pBAA5bH0gSiHE3/S3GMJTro4DcXMMkTbdbxVgEl2yroy4aMY1gdQxMd+jy?=
 =?iso-8859-1?Q?5oYUsc8jiOTYkMGDNNkr9ZLaI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 663d94f9-e49d-41cd-58b5-08d9ba6eba39
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 17:18:18.2039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /1voBmP0delN+x4XvdKUxqrrkdCJkerOk8/kplN8lncTlt2MtRz77pU0C7Z6y7aPaboKrYdoon441i6dGVvy4mkeNdGO6jut4O2xWdH7Y2s=
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
