Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 601A0220D34
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 14:44:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6HCR4LF3zDqld
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 22:44:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6H8w56kCzDqfs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 22:42:40 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06FCWENv060760; Wed, 15 Jul 2020 08:42:32 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32792w548d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 08:42:32 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06FCYeln017281;
 Wed, 15 Jul 2020 12:42:30 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 327urssfe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 12:42:30 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06FCgT5W37224734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 12:42:29 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A76CBE04F;
 Wed, 15 Jul 2020 12:42:29 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D0C8BE051;
 Wed, 15 Jul 2020 12:42:27 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.79.214.100])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jul 2020 12:42:27 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Anton Blanchard <anton@ozlabs.org>, benh@kernel.crashing.org,
 paulus@samba.org, mpe@ellerman.id.au, nathanl@linux.ibm.com
Subject: Re: [PATCH] pseries: Fix 64 bit logical memory block panic
In-Reply-To: <20200715000820.1255764-1-anton@ozlabs.org>
References: <20200715000820.1255764-1-anton@ozlabs.org>
Date: Wed, 15 Jul 2020 18:12:25 +0530
Message-ID: <87d04x3q6m.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_10:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150102
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Anton Blanchard <anton@ozlabs.org> writes:

> Booting with a 4GB LMB size causes us to panic:
>
>   qemu-system-ppc64: OS terminated: OS panic:
>       Memory block size not suitable: 0x0
>
> Fix pseries_memory_block_size() to handle 64 bit LMBs.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Anton Blanchard <anton@ozlabs.org>
> ---
>  arch/powerpc/platforms/pseries/hotplug-memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 5ace2f9a277e..6574ac33e887 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -27,7 +27,7 @@ static bool rtas_hp_event;
>  unsigned long pseries_memory_block_size(void)
>  {
>  	struct device_node *np;
> -	unsigned int memblock_size = MIN_MEMORY_BLOCK_SIZE;
> +	uint64_t memblock_size = MIN_MEMORY_BLOCK_SIZE;
>  	struct resource r;
>  
>  	np = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");

We need similar changes at more places?

modified   arch/powerpc/include/asm/book3s/64/mmu.h
@@ -85,7 +85,7 @@ extern unsigned int mmu_base_pid;
 /*
  * memory block size used with radix translation.
  */
-extern unsigned int __ro_after_init radix_mem_block_size;
+extern unsigned long __ro_after_init radix_mem_block_size;
 
 #define PRTB_SIZE_SHIFT	(mmu_pid_bits + 4)
 #define PRTB_ENTRIES	(1ul << mmu_pid_bits)
modified   arch/powerpc/include/asm/drmem.h
@@ -21,7 +21,7 @@ struct drmem_lmb {
 struct drmem_lmb_info {
 	struct drmem_lmb        *lmbs;
 	int                     n_lmbs;
-	u32                     lmb_size;
+	u64                     lmb_size;
 };
 
 extern struct drmem_lmb_info *drmem_info;
modified   arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -34,7 +34,7 @@
 
 unsigned int mmu_pid_bits;
 unsigned int mmu_base_pid;
-unsigned int radix_mem_block_size __ro_after_init;
+unsigned long radix_mem_block_size __ro_after_init;
 
 static __ref void *early_alloc_pgtable(unsigned long size, int nid,
 			unsigned long region_start, unsigned long region_end)
modified   arch/powerpc/mm/drmem.c
@@ -268,14 +268,15 @@ static void __init __walk_drmem_v2_lmbs(const __be32 *prop, const __be32 *usm,
 void __init walk_drmem_lmbs_early(unsigned long node,
 			void (*func)(struct drmem_lmb *, const __be32 **))
 {
+	const __be64 *lmb_prop;
 	const __be32 *prop, *usm;
 	int len;
 
-	prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
-	if (!prop || len < dt_root_size_cells * sizeof(__be32))
+	lmb_prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
+	if (!lmb_prop || len < sizeof(__be64))
 		return;
 
-	drmem_info->lmb_size = dt_mem_next_cell(dt_root_size_cells, &prop);
+	drmem_info->lmb_size = be64_to_cpup(lmb_prop);
 
 	usm = of_get_flat_dt_prop(node, "linux,drconf-usable-memory", &len);
 
@@ -296,19 +297,19 @@ void __init walk_drmem_lmbs_early(unsigned long node,
 
 static int __init init_drmem_lmb_size(struct device_node *dn)
 {
-	const __be32 *prop;
+	const __be64 *prop;
 	int len;
 
 	if (drmem_info->lmb_size)
 		return 0;
 
 	prop = of_get_property(dn, "ibm,lmb-size", &len);
-	if (!prop || len < dt_root_size_cells * sizeof(__be32)) {
+	if (!prop || len < sizeof(__be64)) {
 		pr_info("Could not determine LMB size\n");
 		return -1;
 	}
 
-	drmem_info->lmb_size = dt_mem_next_cell(dt_root_size_cells, &prop);
+	drmem_info->lmb_size = be64_to_cpup(prop);
 	return 0;
 }
 
modified   arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -27,7 +27,7 @@ static bool rtas_hp_event;
 unsigned long pseries_memory_block_size(void)
 {
 	struct device_node *np;
-	unsigned int memblock_size = MIN_MEMORY_BLOCK_SIZE;
+	unsigned long memblock_size = MIN_MEMORY_BLOCK_SIZE;
 	struct resource r;
 
 	np = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
