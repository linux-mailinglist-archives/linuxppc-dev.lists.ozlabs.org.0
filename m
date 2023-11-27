Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 411AC7F9854
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 05:31:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UJADP+j5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sdt2P6Y7hz3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 15:31:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UJADP+j5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sdt1X572yz3cLN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 15:30:40 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR3FqwB008872;
	Mon, 27 Nov 2023 04:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4PpYBJBU3+3xf/h6OTnt72r3nrwL0BEUTTLKHmzC7Do=;
 b=UJADP+j5ET72ECJx0X+qCO5lx6BWuWWKipG8fCraS+XQ8dYV2BM4WBMxcRgcATr8yhHR
 3uCbhMXJ7XSmMc8ywaDlCt4qob+/z7yXAJiUFzbQKDUZyN05tXAiNuDuQ2NlkYYBEON7
 XwZfrBCQXf/AkOLBWts92EvlgO3HFGrNL5sHBItwzV0V12Mvh9CrnMNwMF7OqbhqI8Yz
 Hc6QJxdDfPr6mJ+jbLsVbR9Agv/DajPfWPj8QZA+96rG5fFnvgZlHtsyIFdy7DanguGe
 TNIqCw65yZVn7U0GP7Vx+PhrNwDJc7GonmiBJsn2s+uHQhFbneR/sZqI3TWeYLEX8ccl cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3umdd2q3jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 04:30:22 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AR4ULYi004454;
	Mon, 27 Nov 2023 04:30:22 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3umdd2q3hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 04:30:21 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR446Of030534;
	Mon, 27 Nov 2023 04:30:20 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukv8n69u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 04:30:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AR4UHM736700742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Nov 2023 04:30:17 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AA6220040;
	Mon, 27 Nov 2023 04:30:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39CA12004B;
	Mon, 27 Nov 2023 04:30:15 +0000 (GMT)
Received: from [9.203.106.137] (unknown [9.203.106.137])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Nov 2023 04:30:15 +0000 (GMT)
Message-ID: <40ab9119-fa6c-4211-98b8-478a84d46e64@linux.ibm.com>
Date: Mon, 27 Nov 2023 10:00:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv9 2/2] powerpc/setup: Loosen the mapping between cpu
 logical id and its seq in dt
From: Hari Bathini <hbathini@linux.ibm.com>
To: Pingfan Liu <piliu@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20231017022806.4523-1-piliu@redhat.com>
 <20231017022806.4523-3-piliu@redhat.com>
 <064ae2ee-ad15-c0ab-f78b-7b3e7dc6612d@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <064ae2ee-ad15-c0ab-f78b-7b3e7dc6612d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qKsw2bWhvDDWdtZ-GLpdToBaBe6805DW
X-Proofpoint-ORIG-GUID: r70ka0NtWTUna9HtX85HKiVMhMF0sGVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_01,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270032
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pingfan, Michael,

On 17/10/23 4:03 pm, Hari Bathini wrote:
> 
> 
> On 17/10/23 7:58 am, Pingfan Liu wrote:
>> *** Idea ***
>> For kexec -p, the boot cpu can be not the cpu0, this causes the problem
>> of allocating memory for paca_ptrs[]. However, in theory, there is no
>> requirement to assign cpu's logical id as its present sequence in the
>> device tree. But there is something like cpu_first_thread_sibling(),
>> which makes assumption on the mapping inside a core. Hence partially
>> loosening the mapping, i.e. unbind the mapping of core while keep the
>> mapping inside a core.
>>
>> *** Implement ***
>> At this early stage, there are plenty of memory to utilize. Hence, this
>> patch allocates interim memory to link the cpu info on a list, then
>> reorder cpus by changing the list head. As a result, there is a rotate
>> shift between the sequence number in dt and the cpu logical number.
>>
>> *** Result ***
>> After this patch, a boot-cpu's logical id will always be mapped into the
>> range [0,threads_per_core).
>>
>> Besides this, at this phase, all threads in the boot core are forced to
>> be onlined. This restriction will be lifted in a later patch with
>> extra effort.
>>
>> Signed-off-by: Pingfan Liu <piliu@redhat.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Wen Xiong <wenxiong@us.ibm.com>
>> Cc: Baoquan He <bhe@redhat.com>
>> Cc: Ming Lei <ming.lei@redhat.com>
>> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: kexec@lists.infradead.org
>> To: linuxppc-dev@lists.ozlabs.org
> 
> Thanks for working on this, Pingfan.
> Looks good to me.
> 
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
> 

On second thoughts, probably better off with no impact for
bootcpu < nr_cpu_ids case and changing only two cores logical
numbering otherwise. Something like the below (Please share
your thoughts):

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index ec82f5bda908..78a8312aa8c4 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -76,7 +76,9 @@ u64 ppc64_rma_size;
  unsigned int boot_cpu_node_count __ro_after_init;
  #endif
  static phys_addr_t first_memblock_size;
+#ifdef CONFIG_SMP
  static int __initdata boot_cpu_count;
+#endif

  static int __init early_parse_mem(char *p)
  {
@@ -357,6 +359,25 @@ static int __init early_init_dt_scan_cpus(unsigned 
long node,
  			fdt_boot_cpuid_phys(initial_boot_params)) {
  			found = boot_cpu_count;
  			found_thread = i;
+			/*
+			 * Map boot-cpu logical id into the range
+			 * of [0, thread_per_core) if it can't be
+			 * accommodated within nr_cpu_ids.
+			 */
+			if (i != boot_cpu_count && boot_cpu_count >= nr_cpu_ids) {
+				boot_cpuid = i;
+				DBG("Logical CPU number for boot CPU changed from %d to %d\n",
+				    boot_cpu_count, i);
+			} else {
+				boot_cpuid = boot_cpu_count;
+			}
+
+			/* Ensure boot thread is acconted for in nr_cpu_ids */
+			if (boot_cpuid >= nr_cpu_ids) {
+				set_nr_cpu_ids(boot_cpuid + 1);
+				DBG("Adjusted nr_cpu_ids to %u, to include boot CPU.\n",
+				    nr_cpu_ids);
+			}
  		}
  #ifdef CONFIG_SMP
  		/* logical cpu id is always 0 on UP kernels */
@@ -368,9 +389,8 @@ static int __init early_init_dt_scan_cpus(unsigned 
long node,
  	if (found < 0)
  		return 0;

-	DBG("boot cpu: logical %d physical %d\n", found,
+	DBG("boot cpu: logical %d physical %d\n", boot_cpuid,
  	    be32_to_cpu(intserv[found_thread]));
-	boot_cpuid = found;

  	boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);

diff --git a/arch/powerpc/kernel/setup-common.c 
b/arch/powerpc/kernel/setup-common.c
index b7b733474b60..f7179525c774 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -409,6 +409,12 @@ static void __init cpu_init_thread_core_maps(int tpc)

  u32 *cpu_to_phys_id = NULL;

+struct interrupt_server_node {
+	bool	avail;
+	int	len;
+	__be32 intserv[];
+};
+
  /**
   * setup_cpu_maps - initialize the following cpu maps:
   *                  cpu_possible_mask
@@ -429,9 +435,13 @@ u32 *cpu_to_phys_id = NULL;
   */
  void __init smp_setup_cpu_maps(void)
  {
+	struct interrupt_server_node *core0_node = NULL, *bt_node = NULL;
+	int orig_boot_cpu = -1, orig_boot_thread = -1;
+	bool found_boot_cpu = false;
  	struct device_node *dn;
-	int cpu = 0;
  	int nthreads = 1;
+	int cpu = 0;
+	int j, len;

  	DBG("smp_setup_cpu_maps()\n");

@@ -442,9 +452,9 @@ void __init smp_setup_cpu_maps(void)
  		      __func__, nr_cpu_ids * sizeof(u32), __alignof__(u32));

  	for_each_node_by_type(dn, "cpu") {
+		bool avail, skip = false;
  		const __be32 *intserv;
  		__be32 cpu_be;
-		int j, len;

  		DBG("  * %pOF...\n", dn);

@@ -466,29 +476,121 @@ void __init smp_setup_cpu_maps(void)

  		nthreads = len / sizeof(int);

-		for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
-			bool avail;
+		avail = of_device_is_available(dn);
+		if (!avail)
+			avail = !of_property_match_string(dn,
+					"enable-method", "spin-table");
+
+		for (j = 0; (cpu == 0 || !found_boot_cpu) && j < nthreads; j++) {
+			if (be32_to_cpu(intserv[j]) == boot_cpu_hwid) {
+				found_boot_cpu = true;
+				if (cpu == 0)
+					break;
+
+				/* Original logical CPU number of thread0 in boot core */
+				orig_boot_cpu = cpu;
+				orig_boot_thread = j;
+				bt_node = memblock_alloc(sizeof(struct interrupt_server_node) + len,
+						__alignof__(u32));
+				if (!bt_node)
+					panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
+						__func__,
+						sizeof(struct interrupt_server_node) + len,
+						__alignof__(u32));
+				bt_node->len = len;
+				memcpy(bt_node->intserv, intserv, len);
+				bt_node->avail = avail;
+				skip = true;
+				break;
+			}
+		}

+		/*
+		 * Boot CPU not on core0.
+		 * Hold off adding core0 until boot core is found as core0
+		 * may have to be replaced with boot core if boot core can
+		 * not be accommodated within nr_cpu_ids with its original
+		 * logical CPU numbering.
+		 */
+		if (cpu == 0 && !found_boot_cpu) {
+			core0_node = memblock_alloc(sizeof(struct interrupt_server_node) + len,
+					__alignof__(u32));
+			if (!core0_node)
+				panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
+					__func__,
+					sizeof(struct interrupt_server_node) + len,
+					__alignof__(u32));
+			core0_node->len = len;
+			memcpy(core0_node->intserv, intserv, len);
+			core0_node->avail = avail;
+			skip = true;
+		}
+
+		if (skip) {
+			/* Assumes same number of threads for all cores */
+			cpu += nthreads;
+			continue;
+		}
+
+		for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
  			DBG("    thread %d -> cpu %d (hard id %d)\n",
  			    j, cpu, be32_to_cpu(intserv[j]));

-			avail = of_device_is_available(dn);
-			if (!avail)
-				avail = !of_property_match_string(dn,
-						"enable-method", "spin-table");
-
  			set_cpu_present(cpu, avail);
  			set_cpu_possible(cpu, true);
  			cpu_to_phys_id[cpu] = be32_to_cpu(intserv[j]);
  			cpu++;
  		}

-		if (cpu >= nr_cpu_ids) {
+		if (found_boot_cpu && cpu >= nr_cpu_ids) {
  			of_node_put(dn);
  			break;
  		}
  	}

+	/*
+	 * Boot CPU not on core0.
+	 *
+	 * If nr_cpu_ids does not accommodate the original logical CPU 
numbering for
+	 * boot CPU core, use logical CPU numbers 0 to nthreads for boot CPU core.
+	 * Note that boot cpu is already assigned with logical CPU number 
somewhere
+	 * between 0 to nthreads (depending on the boot thread within the core) in
+	 * early_init_dt_scan_cpus() for this case.
+	 *
+	 * Otherwise, stick with the original logical CPU numbering.
+	 */
+	if (bt_node) {
+		int core0_cpu;
+
+		if (orig_boot_cpu + orig_boot_thread >= nr_cpu_ids) {
+			cpu = 0;
+			core0_cpu = orig_boot_cpu;
+		} else {
+			cpu = orig_boot_cpu;
+			core0_cpu = 0;
+		}
+
+		for (j = 0; j < nthreads && core0_cpu < nr_cpu_ids; j++) {
+			DBG("    thread %d -> cpu %d (hard id %d)\n",
+			    j, core0_cpu, be32_to_cpu(core0_node->intserv[j]));
+
+			set_cpu_present(core0_cpu, core0_node->avail);
+			set_cpu_possible(core0_cpu, true);
+			cpu_to_phys_id[core0_cpu] = be32_to_cpu(core0_node->intserv[j]);
+			core0_cpu++;
+		}
+
+		for (j = 0; j < nthreads && cpu < nr_cpu_ids; j++) {
+			DBG("    thread %d -> cpu %d (hard id %d)\n",
+			    j, cpu, be32_to_cpu(bt_node->intserv[j]));
+
+			set_cpu_present(cpu, bt_node->avail);
+			set_cpu_possible(cpu, true);
+			cpu_to_phys_id[cpu] = be32_to_cpu(bt_node->intserv[j]);
+			cpu++;
+		}
+	}
+
  	/* If no SMT supported, nthreads is forced to 1 */
  	if (!cpu_has_feature(CPU_FTR_SMT)) {
  		DBG("  SMT disabled ! nthreads forced to 1\n");
