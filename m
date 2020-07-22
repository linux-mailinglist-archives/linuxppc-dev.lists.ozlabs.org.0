Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA176229057
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 08:08:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBQ522hNQzDr0f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 16:08:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBQ1G48FmzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:05:22 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M61WTk097858; Wed, 22 Jul 2020 02:05:14 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e92ks8d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 02:05:14 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M61BEE000636;
 Wed, 22 Jul 2020 06:05:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 32brbgtbpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 06:05:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M659f031719862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 06:05:09 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5A744204C;
 Wed, 22 Jul 2020 06:05:09 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A113142042;
 Wed, 22 Jul 2020 06:05:08 +0000 (GMT)
Received: from in.ibm.com (unknown [9.102.3.172])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 22 Jul 2020 06:05:08 +0000 (GMT)
Date: Wed, 22 Jul 2020 11:35:06 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 0/4] powerpc/mm/radix: Memory unplug fixes
Message-ID: <20200722060506.GO7902@in.ibm.com>
References: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
 <87r1tb1rw2.fsf@linux.ibm.com> <87tuy1sksv.fsf@mpe.ellerman.id.au>
 <20200721032959.GN7902@in.ibm.com>
 <87ft9lrr55.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ft9lrr55.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_02:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=1
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220040
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
Reply-To: bharata@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 10:25:58PM +1000, Michael Ellerman wrote:
> Bharata B Rao <bharata@linux.ibm.com> writes:
> > On Tue, Jul 21, 2020 at 11:45:20AM +1000, Michael Ellerman wrote:
> >> Nathan Lynch <nathanl@linux.ibm.com> writes:
> >> > "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> >> >> This is the next version of the fixes for memory unplug on radix.
> >> >> The issues and the fix are described in the actual patches.
> >> >
> >> > I guess this isn't actually causing problems at runtime right now, but I
> >> > notice calls to resize_hpt_for_hotplug() from arch_add_memory() and
> >> > arch_remove_memory(), which ought to be mmu-agnostic:
> >> >
> >> > int __ref arch_add_memory(int nid, u64 start, u64 size,
> >> > 			  struct mhp_params *params)
> >> > {
> >> > 	unsigned long start_pfn = start >> PAGE_SHIFT;
> >> > 	unsigned long nr_pages = size >> PAGE_SHIFT;
> >> > 	int rc;
> >> >
> >> > 	resize_hpt_for_hotplug(memblock_phys_mem_size());
> >> >
> >> > 	start = (unsigned long)__va(start);
> >> > 	rc = create_section_mapping(start, start + size, nid,
> >> > 				    params->pgprot);
> >> > ...
> >> 
> >> Hmm well spotted.
> >> 
> >> That does return early if the ops are not setup:
> >> 
> >> int resize_hpt_for_hotplug(unsigned long new_mem_size)
> >> {
> >> 	unsigned target_hpt_shift;
> >> 
> >> 	if (!mmu_hash_ops.resize_hpt)
> >> 		return 0;
> >> 
> >> 
> >> And:
> >> 
> >> void __init hpte_init_pseries(void)
> >> {
> >> 	...
> >> 	if (firmware_has_feature(FW_FEATURE_HPT_RESIZE))
> >> 		mmu_hash_ops.resize_hpt = pseries_lpar_resize_hpt;
> >> 
> >> And that comes in via ibm,hypertas-functions:
> >> 
> >> 	{FW_FEATURE_HPT_RESIZE,		"hcall-hpt-resize"},
> >> 
> >> 
> >> But firmware is not necessarily going to add/remove that call based on
> >> whether we're using hash/radix.
> >
> > Correct but hpte_init_pseries() will not be called for radix guests.
> 
> Yeah, duh. You'd think the function name would have been a sufficient
> clue for me :)
> 
> >> So I think a follow-up patch is needed to make this more robust.
> >> 
> >> Aneesh/Bharata what platform did you test this series on? I'm curious
> >> how this didn't break.
> >
> > I have tested memory hotplug/unplug for radix guest on zz platform and
> > sanity-tested this for hash guest on P8.
> >
> > As noted above, mmu_hash_ops.resize_hpt will not be set for radix
> > guest and hence we won't see any breakage.
> 
> OK.
> 
> That's probably fine as it is then. Or maybe just a comment in
> resize_hpt_for_hotplug() pointing out that resize_hpt will be NULL if
> we're using radix.

Or we could move these calls to hpt-only routines like below?

David - Do you remember if there was any particular reason to have
these two hpt-resize calls within powerpc-generic memory hotplug code?

diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/asm/sparsemem.h
index c89b32443cff..1e6fa371cc38 100644
--- a/arch/powerpc/include/asm/sparsemem.h
+++ b/arch/powerpc/include/asm/sparsemem.h
@@ -17,12 +17,6 @@ extern int create_section_mapping(unsigned long start, unsigned long end,
 				  int nid, pgprot_t prot);
 extern int remove_section_mapping(unsigned long start, unsigned long end);
 
-#ifdef CONFIG_PPC_BOOK3S_64
-extern int resize_hpt_for_hotplug(unsigned long new_mem_size);
-#else
-static inline int resize_hpt_for_hotplug(unsigned long new_mem_size) { return 0; }
-#endif
-
 #ifdef CONFIG_NUMA
 extern int hot_add_scn_to_nid(unsigned long scn_addr);
 #else
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index eec6f4e5e481..5daf53ec7600 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -787,7 +787,7 @@ static unsigned long __init htab_get_table_size(void)
 }
 
 #ifdef CONFIG_MEMORY_HOTPLUG
-int resize_hpt_for_hotplug(unsigned long new_mem_size)
+static int resize_hpt_for_hotplug(unsigned long new_mem_size)
 {
 	unsigned target_hpt_shift;
 
@@ -821,6 +821,8 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
 		return -1;
 	}
 
+	resize_hpt_for_hotplug(memblock_phys_mem_size());
+
 	rc = htab_bolt_mapping(start, end, __pa(start),
 			       pgprot_val(prot), mmu_linear_psize,
 			       mmu_kernel_ssize);
@@ -838,6 +840,10 @@ int hash__remove_section_mapping(unsigned long start, unsigned long end)
 	int rc = htab_remove_mapping(start, end, mmu_linear_psize,
 				     mmu_kernel_ssize);
 	WARN_ON(rc < 0);
+
+	if (resize_hpt_for_hotplug(memblock_phys_mem_size()) == -ENOSPC)
+		pr_warn("Hash collision while resizing HPT\n");
+
 	return rc;
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index c2c11eb8dcfc..9dafc636588f 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -127,8 +127,6 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
 	unsigned long nr_pages = size >> PAGE_SHIFT;
 	int rc;
 
-	resize_hpt_for_hotplug(memblock_phys_mem_size());
-
 	start = (unsigned long)__va(start);
 	rc = create_section_mapping(start, start + size, nid,
 				    params->pgprot);
@@ -161,9 +159,6 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
 	 * hit that section of memory
 	 */
 	vm_unmap_aliases();
-
-	if (resize_hpt_for_hotplug(memblock_phys_mem_size()) == -ENOSPC)
-		pr_warn("Hash collision while resizing HPT\n");
 }
 #endif
 
-- 
2.26.2

