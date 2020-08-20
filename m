Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F4624AE77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 07:33:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXCwn27jdzDr31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 15:33:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YO1RTJtd; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXCtw4BxyzDr0p
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 15:31:36 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07K53Nbc057041; Thu, 20 Aug 2020 01:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=LOYHGYMb6qvWX92c0Ht8OlRJ0y4zsEww5uRoKc6vS8w=;
 b=YO1RTJtdeIp8fWtHe1ifB2EIdKnTD/aL6qNPkW+1uDFfsq82Hh1JM8s/BPTHAaqQekcn
 U1OMpaePrjdXVeGJg0f9VmkJBk3BfQDe1nsU8bM5ZWKXi41P1AVaWlatZcdMjW3LSLJH
 huHefSl3CwQI0gc4SfrTcNk5bNmjaHmVs+uY/Q/gfKdWc9rTr6OnvFsH9htlGbQDuY42
 M4PbR6eKM4GsxRDWL3kNBjZMbj7Mg3BycEGiNE8yZ6rv89gD9V8FjxerJjQR1QNtCQsp
 TOrtfzH+iHfuEqb0gH4BRG5AJqgMmedx+wK7DNcM2t0n+m6A4jxKGm75F2785bpVVzzE iA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304r566ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 01:31:21 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07K5FS72004983;
 Thu, 20 Aug 2020 05:31:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3304ccx5d4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 05:31:20 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07K5VGec51511730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Aug 2020 05:31:17 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9809E6E04E;
 Thu, 20 Aug 2020 05:31:19 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA5EC6E04C;
 Thu, 20 Aug 2020 05:31:16 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.103.86])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 20 Aug 2020 05:31:16 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: kernel test robot <lkp@intel.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Subject: Re: [PATCH v2 04/13] mm/debug_vm_pgtables/hugevmap: Use the arch
 helper to identify huge vmap support.
In-Reply-To: <202008200034.CGkDyB26%lkp@intel.com>
References: <20200819130107.478414-5-aneesh.kumar@linux.ibm.com>
 <202008200034.CGkDyB26%lkp@intel.com>
Date: Thu, 20 Aug 2020 11:01:13 +0530
Message-ID: <871rk1opcu.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_13:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008200044
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
Cc: kbuild-all@lists.01.org, linuxppc-dev@lists.ozlabs.org,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kernel test robot <lkp@intel.com> writes:

> Hi "Aneesh,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on hnaz-linux-mm/master]
> [also build test ERROR on powerpc/next linus/master v5.9-rc1 next-20200819]
> [cannot apply to mmotm/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Aneesh-Kumar-K-V/mm-debug_vm_pgtable-fixes/20200819-213446
> base:   https://github.com/hnaz/linux-mm master
> config: i386-randconfig-s002-20200818 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.2-183-gaa6ede3b-dirty
>         # save the attached .config to linux build tree
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=i386 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> arch/x86/mm/ioremap.c:484:12: error: redefinition of 'arch_ioremap_p4d_supported'
>      484 | int __init arch_ioremap_p4d_supported(void)
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from arch/x86/mm/ioremap.c:12:
>    include/linux/io.h:41:19: note: previous definition of 'arch_ioremap_p4d_supported' was here
>       41 | static inline int arch_ioremap_p4d_supported(void)
>          |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~

I guess trying to work this out without using #ifdef is complex. I ended
up with the below

1 file changed, 12 insertions(+), 2 deletions(-)
mm/debug_vm_pgtable.c | 14 ++++++++++++--

modified   mm/debug_vm_pgtable.c
@@ -202,11 +202,12 @@ static void __init pmd_leaf_tests(unsigned long pfn, pgprot_t prot)
 	WARN_ON(!pmd_leaf(pmd));
 }
 
+#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
 static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
 {
 	pmd_t pmd;
 
-	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+	if (!arch_ioremap_pmd_supported())
 		return;
 
 	pr_debug("Validating PMD huge\n");
@@ -220,6 +221,10 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
 	pmd = READ_ONCE(*pmdp);
 	WARN_ON(!pmd_none(pmd));
 }
+#else /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
+static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot) { }
+#endif /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
+
 
 static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
 {
@@ -316,11 +321,12 @@ static void __init pud_leaf_tests(unsigned long pfn, pgprot_t prot)
 	WARN_ON(!pud_leaf(pud));
 }
 
+#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
 static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot)
 {
 	pud_t pud;
 
-	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+	if (!arch_ioremap_pud_supported())
 		return;
 
 	pr_debug("Validating PUD huge\n");
@@ -334,6 +340,10 @@ static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot)
 	pud = READ_ONCE(*pudp);
 	WARN_ON(!pud_none(pud));
 }
+#else /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
+static void __init pud_huge_tests(pud_t *pudp, unsigned long pfn, pgprot_t prot) { }
+#endif /* !CONFIG_HAVE_ARCH_HUGE_VMAP */
+
 #else  /* !CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
 static void __init pud_advanced_tests(struct mm_struct *mm,
