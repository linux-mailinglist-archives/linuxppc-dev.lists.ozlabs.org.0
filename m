Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF37D475319
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:46:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDQkv5MwVz3cb7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:46:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::622;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDQjt2C7dz303F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:45:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L26RWQ+lQWj4Uf6msk2qFfZ1efxYSq1bJwBJcxe2/9pPL6S4K6kSczaZesZL+mWEPgTMgXHKwfEh7d9XL/deUnIHGVpUXztiFBc3UhEAi9SWp21QUj3RVqlJvABb1jB8b0o7/D3uO+9WSiHv0Vb69BWgKhxI+D8VsvWTi32byMYBzUK2NkbbyDmgnBWGDEBpQj5Rx4/wCFyh3R/YjI+Myes3mnoxu/BmbetbSNSucqw32mfQB+KeDuPiwCaZ96yqtDIkhm3Vnb2vNnGU9DpbdbxfV74wWCaNgzGeLP0rwTIzrhTVUkcc/XXtV38I/ViNSe3zt67aL9YedeoZ+I2OGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuKZ8Pp5OoKCaatHC4wZ7EyUM5TYF66Dvkuh8U4yTxw=;
 b=KWYJKaLMIi+Tr8qVHZilElbLcrcJdFvThP0bc3kcyTJUno0ndLrkqX3hEgv7Q0RfqIR8VC83PVOtP4zJF07Ertmg/xJVWcO/oStPf39UZ7JFgL68//de/WMht+Q4Dxh70HsizGTyJTCj/DT/QyywgyvAJgQyUH3jQKkpr82xvEbIBeBnCAOj5EY89s8mzMA5vKD19HetsZB295ICSDLlrmqCjIVYqgdJFvytqMb50haAR0Am0H6OFsJiIehnZznhb/cPOAhJbAHeKj+hZJU0sQjfT3FgG9tGtyrN6tfUY2ZGmCOKH0lw46lZFgfQZMzo5OpvR0CT/3jDFs4wwGlPbg==
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
Subject: [PATCH v5 02/11] mm, hugetlbfs: Allow an arch to always use generic
 versions of get_unmapped_area functions
Thread-Topic: [PATCH v5 02/11] mm, hugetlbfs: Allow an arch to always use
 generic versions of get_unmapped_area functions
Thread-Index: AQHX8X9OFivBvoz9ekm2yhHkjqMGSA==
Date: Wed, 15 Dec 2021 06:45:11 +0000
Message-ID: <50d176dcf3942894a8dcbc42b7b767b065df9af0.1639550392.git.christophe.leroy@csgroup.eu>
References: <cover.1639550392.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639550392.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 890d07ad-38aa-498e-e067-08d9bf96716f
x-ms-traffictypediagnostic: MR1P264MB2147:EE_
x-microsoft-antispam-prvs: <MR1P264MB214792F75AE27BBDC596640EED769@MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JuLIPca/In4EmZzAm9LN26YXx0hCc+rrT7QWQfWK5ICRyHg0u8TcuC4iBFZ+Pv/9I/y4s53EFYqYdiEqLyUoJOR6g8u013ThutLoI1v+orSk4Xy0yhG5lSigtAWlOHnrxhPl4a6ekc1iz/98EOFMoxmzhrFDr5MUNXMvwPmH7No+Le9w4UhRzL2WWIXqNMWLA+RgoZ5rJt/8Sj0+Zhcn/Y6iq7HWJKPU/H7Vno2ZEycKPNUPgxV0i9wbrTN2GsWgqTOhTxCLrb5xCbQSMJJ/kaHn2LTNmLLzjj4YUQRTR/rf6WSmb//U1d7VoUHifvQhTYI4UH40AvLl3cpvS6Pagc9xFJ8FCR9pCoj9r42ivDD1AVbaDjXb9vn1EAkTkFrXFjXdT7BV5JatVKgFZ0HCu8TrWWYo86RkJXHCqm7DKycYgHGJ0CjwqclbB2ATcDHodUd+V4nV3mDpgcX6fMfcPnN+Xa5hdfPwh6InrSCRS/ew7Lr50N6VORIyF9uHRmAp09QMwhdxaYq/lY1mKspzNZVydNrNh2NKFyj0y2ob8/jH4e8zTvnDptUrT+QoCv/Cr8mJxrYesv6FYgeqG79JItg50QbR7mSTQsXCPMdLGfo98DMTKzcMRu6T75ke3mz66MDS2Yzrehf6ExYoCWJYKtfFu0o0Ls4bI8DuKwqWVLiohhkmGsdO7uxbSYMLDsgTbHdTlVZTwxs2MQt2lrYS/XzGtqREeW8SIhKYut/5xQY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(36756003)(6486002)(2906002)(86362001)(5660300002)(508600001)(26005)(186003)(38100700002)(8936002)(44832011)(54906003)(316002)(66556008)(66446008)(66476007)(64756008)(6506007)(76116006)(91956017)(8676002)(66946007)(4326008)(2616005)(122000001)(83380400001)(6512007)(71200400001)(38070700005)(7416002)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?9WpF00yis3ZLCq3rB3Sd8JsaXgR5VFp5U6svB/ofSrDDJpsHWe+WxoRIm0?=
 =?iso-8859-1?Q?C/LTeEfsw4sCI+8+r4QezgxJ3a5WxzO7u0LQUgLONX4H6V8/YMSQtpch2V?=
 =?iso-8859-1?Q?yb+cwVVjBKMQI3ukY5b6dK/XkD2djlUZg/DGYr8j7XTglcUQIws4zDT5kd?=
 =?iso-8859-1?Q?SqEjdR+KC/fsmsSUIqBMRpmKLbo73ucuUkG6CLyLHLMkiExtv/RL9md8uV?=
 =?iso-8859-1?Q?mO5XPS5A84LSfCQp8vzP0Rb4TsteIaaLoA/YOXXP8fz8rTxrXrPUFFzWgZ?=
 =?iso-8859-1?Q?tMrgJpubT+c513z7oAQQahCD3v7An2FxJzNi1oKudNaHsifVCzybhWS2B6?=
 =?iso-8859-1?Q?aIq+KNn2RkOOYZdAzksg0/IioNyeBkalxvzXROdT0ecTXOn2gbxf85RaAr?=
 =?iso-8859-1?Q?XIE06k/juDz4mfox2OISTjfSCqiO96a8zP5dLjTElcDd0dNamaA7Gv7cG/?=
 =?iso-8859-1?Q?hiJ96GfNS5+YFAf66UMbV1BCA56Pwpw/qXB9s30jKVMBlYZUAdPJ8uKtCt?=
 =?iso-8859-1?Q?ZsJvoAYhK6dlgrvRy5CD0uMGch5kBowST1bfc1nT69WHG3CgSNX7zriAwa?=
 =?iso-8859-1?Q?KZw8indy+aDtEtFBFI2cYjZtsgkUiryr1Jon9Z/bvKE7rQzPb5O+JCdwwD?=
 =?iso-8859-1?Q?ry1yxuBgChDeg9hKviDkNEfahkP6bGoZ2wK7KVFY/DKumyFtUmiRVdghjA?=
 =?iso-8859-1?Q?XEZS8PPX+rhQspVbMxTfq8aXct9KvezTHDx4s24YTV0iC2q0C765CxrPIR?=
 =?iso-8859-1?Q?9XBkyztlsCmDDpoz+vk3HvGfxJIreFPFRpbHkU9vJ+zQ1U5xh7XUfXc3ih?=
 =?iso-8859-1?Q?eqU2a/pU3AEKyOSxkoAZU3gj04shQvLd2LWBAu4ODDQel40Vbizr+MlxMU?=
 =?iso-8859-1?Q?K4ze2z3aJZLIYb0tRU4UfO+xre4LiR/HRDhtJl+4OTzpRb5aJ/SICIsYi7?=
 =?iso-8859-1?Q?zhVH0ewGFPHbqEcXUDKv5vjvxyfAnJG5OXLfZ+V3Y/Id0z/0vx1Hwhi1VL?=
 =?iso-8859-1?Q?7VGwFbwFDQFXb6WXojif+98xAkifwsSZAWr74FuOr3D1PrVYBGh65Tybvt?=
 =?iso-8859-1?Q?ORH41xzY9p/zgpGPeFZuZ9tl4zmIe0VONHiwvIlE68eFq3YPE7bE4waMqC?=
 =?iso-8859-1?Q?Qr6PN1zJ9shozRP8PcA3TRrdtCT7/hwvO3S6Djy+syWLJKk9nceITRWwqH?=
 =?iso-8859-1?Q?N4lTzHH9uIsHOSr1EKgdrienNrL6557J2L6W3qu1veF8Oc2Ov6MSN9dbTy?=
 =?iso-8859-1?Q?brwvGIUxHUMR28YjiiUPRgklJciV5EmP/gZCAPL0dxN95+6plNNx8PFwnA?=
 =?iso-8859-1?Q?cVRFwzvz41aFpUCUhcuWu/lXX9pazXQ3LYuo7ZHsbZPPCGbvn0apMYI+SG?=
 =?iso-8859-1?Q?8guR9Tb8EMbSFQk0yNXN39WKZuOsSe9LzkV/Nqzz+w3WDK7htwbFZLBkzp?=
 =?iso-8859-1?Q?YXHX0Yz1q84v4I7TJUh50P/uLFhLB0Hmh7HqJjTHa4r22a0rleSwupACSw?=
 =?iso-8859-1?Q?j8k1JUjSLD+UahpvhF2YYHmPZgT3yL2+d1iIVmUHo+O5smGqlwfwR5pBfh?=
 =?iso-8859-1?Q?kVJMl2fKLSK0PfxiGdSzPMsLWaahxWpJRzsIrqd+Bhqal6nouNPbUXAoG0?=
 =?iso-8859-1?Q?m5eRYM7L0MwrxjAvLTPirN5J2zAhFttUL+OcPA/3l6uo3FTP6z4rA3do7H?=
 =?iso-8859-1?Q?AtDUyInvHxkWmLdIKKCNEh+D52fHsh7mnTF9fHzAKunZtigG28ZM9xgBPK?=
 =?iso-8859-1?Q?Zk5efZXeksoaQJqbLBporSPTU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 890d07ad-38aa-498e-e067-08d9bf96716f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:45:11.5387 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GtL1reS3uDvvkTRL5y04udJbcv6GijHyRkvexwyJPsR0Jlqe69MnRxHaBIhnIxJvvdedDuD3kH8tEwmdoMeTYnmM6Wg5vOa9fy0J1WWVLI=
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
