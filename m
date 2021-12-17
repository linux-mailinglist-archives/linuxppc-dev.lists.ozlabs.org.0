Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D3F4788CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:28:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFlZZ3ZTNz3dcm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:28:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::626;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlY256yYz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:27:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jc0o0rlZBnEh4OldiuB3/oaQMFZSrXbG0Z4A+7WszpAgagKCyxWMJXmaE2ybFprAcmihjowWmgFz3OTgzJuuUUW6Ka+/QUu3oY9e6uBEaGEiTuOp9KgNZgvfT4dMwGyTYGluMu4F8YCZ6luYNhg2TZKsxAhCaaOI5rSWAI2tpWlHmue0oyIVgD6oUFe+q0uSuFg8Bcy2NR3uGzpVB9ra14CwQwn2LtBu5A1vSdsgysOWTVpI0NUoqRIju8pn/0LXH7Rlh2RXf20jmNn/IxLAL7odlIb8zDEaElvF+om2Fa00bda5JEysmB+nA29tzRW9ytTECTfQnARG2TfFrWATWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuKZ8Pp5OoKCaatHC4wZ7EyUM5TYF66Dvkuh8U4yTxw=;
 b=CjgyxoZzCVVda1+ATmsdDDbfBY/WNZabqirdxkFby7NGCabd3SjBUMaXGDcksE8y33eGsEoYE0xww0HWXHo92Yh5OEkl2KDVDQs7KUAEDSQBfbrOGalLrAGll5FMTRi3GSTncyw3PnPBmISFXijIaOwouO2SF6gyTWim5GGkm/UzrT4ve1997KFigzJOMG+081IkDRYUv4Z3FyaT667eO/Br6nj3aELudbmV9RTyoTggvpAs2QcejefPyjfi5fPkW3N+HE3Z31PsctabbJLjtDbJ4s+yQ58P14cZA5oWDLXhc5vDq9LnXD/qbUU2QVOLvRcQ8YL8rt8ao9of+P5M9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:27:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:27:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 02/14] mm, hugetlbfs: Allow an arch to always use generic
 versions of get_unmapped_area functions
Thread-Topic: [PATCH v6 02/14] mm, hugetlbfs: Allow an arch to always use
 generic versions of get_unmapped_area functions
Thread-Index: AQHX8zCrhoAF34Ujr0eqThlZaaakHg==
Date: Fri, 17 Dec 2021 10:27:19 +0000
Message-ID: <50d176dcf3942894a8dcbc42b7b767b065df9af0.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5cfc7cf-13bb-4047-43db-08d9c147ce32
x-ms-traffictypediagnostic: MR1P264MB1650:EE_
x-microsoft-antispam-prvs: <MR1P264MB1650C8321ADC0F37903B14F6ED789@MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eEo1TeUDHpAIwUtuH8cwgQuR2Rtk0Q6UbsXFm8deBpD4b2LvUSjxZ38ZlmeocwZwci9rZZ9Fjz9U4gRAmt8mAk6A2ZYvD/lqUDwoDsOCUmBEalRZXtyh1BGg67391WiQy1RehqWntwKIXMD8KOkWc+03BnlCBVEDt430Vxq4G1OtDdjh4qSPOBF6+6pRQ0ZfFsf07I/UVIAwOhQQlM7b1rGLNjaPeW7VZHRWAxDds/vB8fkJFXot6T/aaa2f1UzOpB4fYJL5Oyvf7496b2OXnDZNxOum9g2MEPTnC4JFrpBQ8Oj8cbvCY2+ZCo2hPizvZZcEHhf0SZwBtDNhvsbUchHIfkZBcvIWhlWe6SQmwziGLe26JrR5ugsZhPNkOLgpOHNOo1sTE8Od9OGGP/VMNc3Frg8PgRloMENcog28tbIf+lm5wuXCBTg+kz1qsGLlFyWibE3Tj43eDu55DHci5mRlCTSzUnOdumMKXXljMzbsfptFzouSrLwCtIWpzMmoFP9fLtOL9O0u9Y3HuYu7LUadRvS9EphmhXIiq1SYnAIQ7m8GoEeEM5iDPRcbJCQlsB/vBpsGB20sRfEPNNfby1Xa7yjVdgq5RJCCWU+b9/JnUxhIvjbKt4HiPctXssn7N1XwS8qfdiXnMhFgEjvsqTKC2DlmTu0QzAzxpnkNjqptdUsIbK39p2E6p/5RZpiRzW1W1KR9EMOE/vfjiw7f6J+0hGuBG2/bqKdashtfJUI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(2906002)(6486002)(6512007)(8676002)(83380400001)(122000001)(36756003)(6506007)(186003)(86362001)(26005)(38070700005)(44832011)(76116006)(66476007)(64756008)(66556008)(5660300002)(38100700002)(66446008)(2616005)(91956017)(66946007)(4326008)(508600001)(316002)(71200400001)(54906003)(7416002)(110136005)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Teh8ijjSw3AO7mYFAP+TYs2rt2zpOns0WKL7/quKLiU+U/FwwuZCMdYgLQ?=
 =?iso-8859-1?Q?Jumr+vAlZrOlInROQSS1RAT5CjYGrXZxA4WufVos3qyVvnsSMwcTJeoN8C?=
 =?iso-8859-1?Q?FGAwTqVq/DnUZKhMWVVdzrVVlvu++vaFiw2VDKSKGEgciqK8gB2AA6BI60?=
 =?iso-8859-1?Q?pvEV4B31iFE5ebq+C/uHwOVaQT+5RKWLc9sGmumNjtEQ+ydMZhZZX6lr8r?=
 =?iso-8859-1?Q?fHgYy5B1cW25ILgcEsCwMrAMKUQUEDOm2xKfNX16Z0ASvTn0Vix3r82c5O?=
 =?iso-8859-1?Q?eLcrW9Bgpy3i7ASI1y86dWQ2Lcv/b9MyQ41dtH2kU85GtR8S3aiKbd7H7u?=
 =?iso-8859-1?Q?Vu5hHNUWTGG+siBV8esPcyj8+r9K3nHg3aldQEdoDNDOwyRtC9OsI1py3X?=
 =?iso-8859-1?Q?9CG8HoVauuhyePikDh60LjKr2Q3XYFDIc6k35lsMYUpNz+AT+uxorr9p3i?=
 =?iso-8859-1?Q?WJoTXNcwoZIakT6f5HufRmjxjibT8JNSZye5z+9ujdq2WI8h/l9a2DkQNp?=
 =?iso-8859-1?Q?sMXRrAJDLWR+2IPVCM9mhD70nXLXx/jxXz7EI+XdRhX2xGyfQXJaYmmr//?=
 =?iso-8859-1?Q?NUHvU4VS9DF35tLqCIyTq4OpO3GtCLBRrT4cpsn5VcHT9GVjuQyQK9o8zy?=
 =?iso-8859-1?Q?8DHM7OUx4l5TFzTyaZdEjbHpKYtHHbC4arYp11SsViLCbB2f7wFLtS0AbX?=
 =?iso-8859-1?Q?ciT/CO+PA/QQ9chY7R7xy2ka+2MyT85udBs+nvLpBdY8Lva/z39Ui0Ep4o?=
 =?iso-8859-1?Q?RqvOZ15ODfXjKIyMxMg7qyqH+InzWZdHFOjwokzc4tlrmQQSBhAsQPK/7H?=
 =?iso-8859-1?Q?GrP6tGM6qLor1m9V0BC0ZlwZHcdlbsBCctIfwfnR/NSDohT8yo7UNWuW7v?=
 =?iso-8859-1?Q?mvFn1K6aYbVNUrI48NSvmyHO/XrQQC2lxjkf+VkjKifVlrNCDIdZc+Rl5j?=
 =?iso-8859-1?Q?6RHuKgZ6sBYqjzKSiFcBRkaZF055TdV0F9jHU32O2gEy04DKpO2U4ALUm7?=
 =?iso-8859-1?Q?OJ+y4ArzSl/fbfY04np9uL0jBX0t9R2+hLpE7Lzryv00mMonyBOU1ZkQq9?=
 =?iso-8859-1?Q?0dSlMj13etIH8ayz3mMP6+gVA+kvvxQYUbfOZK0xpT3e/8xO8AjQAD7I67?=
 =?iso-8859-1?Q?dKudBH9EitLeWhXYsmz/i6BBTQRFEDVPdkQ7GhlP2GF/L8Pk7az/p8Lx3d?=
 =?iso-8859-1?Q?0fx6/NQpIeemf2SeOsBBMPbktxvEeyd7nYb8Bk0cjBOo2Wm7CgCv5AiXAd?=
 =?iso-8859-1?Q?VqaYlD7/U0WSnuXPlUhEWr4vDibkqLHyrN3PlT1bRsODKDYmcKvM7WKOnX?=
 =?iso-8859-1?Q?AlBxaZWcn1/btXYKtu0KP7kgFx7cuiDxn8j+TE5TMHEql/4gkZ+GzgPvbz?=
 =?iso-8859-1?Q?c3k/p59imPGWSnmT/I+r1HDwR/NYDN+2QFC1XCvxgez9XBN8+rfmywjSRA?=
 =?iso-8859-1?Q?kEqfcU82C1y/BZV2AK8d44MKV//mQcbOrZo29UwXlwd9Q8uYqb5qmlx9pt?=
 =?iso-8859-1?Q?5ZatiItnK9SbtVs8iJlYW233b0u9Sy3yV594Zn+iLgHfqeqceh7ZzsVC3G?=
 =?iso-8859-1?Q?JXoSOnWMaZlEtr8nOrjbihN056Eu2eL3cjnFCBghRwKVOhNZHSUXc1Yal9?=
 =?iso-8859-1?Q?dtjhrRGcE9tYZkDtYyJZI7m3lbxVsZrBxObe2byqyrVXQYP/IO4tzjp5A7?=
 =?iso-8859-1?Q?cVZ83T+05TXNnJJRUx24TJiQHQnY+8CZt4m1oCpl20JKTjCsRkTBf7o2r5?=
 =?iso-8859-1?Q?MoAvuwTm7FvJ3HvBY5/qOhZqc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cfc7cf-13bb-4047-43db-08d9c147ce32
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:27:19.4481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /fi2vfcEAMS3PzO0LMFBm5eH6xx3kn/RMwJItDqWqVo7osGRcTSc/tWcStb7iI+3wPlxmqJGghalBmFdbLKn4h5lw4chGXIjbEC5Yf8Yo9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1650
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
