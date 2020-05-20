Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE51DBD43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 20:49:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S1xS66hHzDqfB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 04:49:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S1qc55hHzDqkC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 04:43:56 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04KIXWji045846; Wed, 20 May 2020 14:43:49 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312cqpq830-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 14:43:49 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04KIeKVc032672;
 Wed, 20 May 2020 18:43:48 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 313x17d2n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 18:43:48 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04KIhlr326673650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 18:43:47 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39533136053;
 Wed, 20 May 2020 18:43:47 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09569136051;
 Wed, 20 May 2020 18:43:44 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.71.64])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 20 May 2020 18:43:44 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 3/5] libnvdimm/nvdimm/flush: Allow architecture to
 override the flush barrier
In-Reply-To: <CAPcyv4jZhYXEmYGzqGPjPtq9ZWJNtQyszN0V0Xcv0qtByK_KCw@mail.gmail.com>
References: <20200513034705.172983-1-aneesh.kumar@linux.ibm.com>
 <20200513034705.172983-3-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iAdrdMiSzVr1UL9Naya+Rq70WVuKqCCNFHe1C4n+E6Tw@mail.gmail.com>
 <87v9kspk3x.fsf@linux.ibm.com>
 <CAPcyv4g+oE305Q5bYWkNBKFifB9c0TZo6+hqFQnqiFqU5QFrhQ@mail.gmail.com>
 <87d070f2vs.fsf@linux.ibm.com>
 <CAPcyv4jZhYXEmYGzqGPjPtq9ZWJNtQyszN0V0Xcv0qtByK_KCw@mail.gmail.com>
Date: Thu, 21 May 2020 00:13:42 +0530
Message-ID: <87v9kqqwf5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-20_13:2020-05-20,
 2020-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 cotscore=-2147483648
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005200147
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
Cc: alistair@popple.id.au, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> On Tue, May 19, 2020 at 6:53 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> Dan Williams <dan.j.williams@intel.com> writes:
>>
>> > On Mon, May 18, 2020 at 10:30 PM Aneesh Kumar K.V
>> > <aneesh.kumar@linux.ibm.com> wrote:
>>
>> ...
>>
>> >> Applications using new instructions will behave as expected when running
>> >> on P8 and P9. Only future hardware will differentiate between 'dcbf' and
>> >> 'dcbfps'
>> >
>> > Right, this is the problem. Applications using new instructions behave
>> > as expected, the kernel has been shipping of_pmem and papr_scm for
>> > several cycles now, you're saying that the DAX applications written
>> > against those platforms are going to be broken on P8 and P9?
>>
>> The expecation is that both kernel and userspace would get upgraded to
>> use the new instruction before actual persistent memory devices are
>> made available.
>>
>> >
>> >> > I'm thinking the kernel
>> >> > should go as far as to disable DAX operation by default on new
>> >> > hardware until userspace asserts that it is prepared to switch to the
>> >> > new implementation. Is there any other way to ensure the forward
>> >> > compatibility of deployed ppc64 DAX applications?
>> >>
>> >> AFAIU there is no released persistent memory hardware on ppc64 platform
>> >> and we need to make sure before applications get enabled to use these
>> >> persistent memory devices, they should switch to use the new
>> >> instruction?
>> >
>> > Right, I want the kernel to offer some level of safety here because
>> > everything you are describing sounds like a flag day conversion. Am I
>> > misreading? Is there some other gate that prevents existing users of
>> > of_pmem and papr_scm from having their expectations violated when
>> > running on P8 / P9 hardware? Maybe there's tighter ecosystem control
>> > that I'm just not familiar with, I'm only going off the fact that the
>> > kernel has shipped a non-zero number of NVDIMM drivers that build with
>> > ARCH=ppc64 for several cycles.
>>
>> If we are looking at adding changes to kernel that will prevent a kernel
>> from running on newer hardware in a specific case, we could as well take
>> the changes to get the kernel use the newer instructions right?
>
> Oh, no, I'm not talking about stopping the kernel from running. I'm
> simply recommending that support for MAP_SYNC mappings (userspace
> managed flushing) be disabled by default on PPC with either a
> compile-time or run-time default to assert that userspace has been
> audited for legacy applications or that the platform owner is
> otherwise willing to take the risk.
>
>> But I agree with your concern that if we have older kernel/applications
>> that continue to use `dcbf` on future hardware we will end up
>> having issues w.r.t powerfail consistency. The plan is what you outlined
>> above as tighter ecosystem control. Considering we don't have a pmem
>> device generally available, we get both kernel and userspace upgraded
>> to use these new instructions before such a device is made available.
>
> Ok, I think a compile time kernel option with a runtime override
> satisfies my concern. Does that work for you?

something like below? But this still won't handle devdax mmap right?

diff --git a/arch/arm64/include/asm/libnvdimm.h b/arch/arm64/include/asm/libnvdimm.h
new file mode 100644
index 000000000000..aee697a72537
--- /dev/null
+++ b/arch/arm64/include/asm/libnvdimm.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ARCH_LIBNVDIMM_H__
+#define __ARCH_LIBNVDIMM_H__
+
+#endif /* __ARCH_LIBNVDIMM_H__  */
diff --git a/arch/powerpc/include/asm/libnvdimm.h b/arch/powerpc/include/asm/libnvdimm.h
new file mode 100644
index 000000000000..da479200bfb8
--- /dev/null
+++ b/arch/powerpc/include/asm/libnvdimm.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ARCH_LIBNVDIMM_H__
+#define __ARCH_LIBNVDIMM_H__
+
+#define arch_disable_sync_nvdimm arch_disable_sync_nvdimm
+extern bool arch_disable_sync_nvdimm(void);
+
+#endif /* __ARCH_LIBNVDIMM_H__  */
diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
index 0666a8d29596..3ce4fb4f167b 100644
--- a/arch/powerpc/lib/pmem.c
+++ b/arch/powerpc/lib/pmem.c
@@ -9,6 +9,8 @@
 
 #include <asm/cacheflush.h>
 
+
+static bool sync_fault = IS_ENABLED(CONFIG_PPC_NVDIMM_SYNC_FAULT);
 /*
  * CONFIG_ARCH_HAS_PMEM_API symbols
  */
@@ -57,3 +59,16 @@ void memcpy_page_flushcache(char *to, struct page *page, size_t offset,
 	memcpy_flushcache(to, page_to_virt(page) + offset, len);
 }
 EXPORT_SYMBOL(memcpy_page_flushcache);
+
+bool arch_disable_sync_nvdimm(void)
+{
+	return !sync_fault;
+}
+
+static int __init parse_sync_fault(char *p)
+{
+	sync_fault = true;
+	return 0;
+}
+early_param("enable_sync_fault", parse_sync_fault);
+
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 27a81c291be8..dde11d75a746 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -383,6 +383,15 @@ config PPC_KUEP
 
 	  If you're unsure, say Y.
 
+config PPC_NVDIMM_SYNC_FAULT
+	bool "Synchronous fault support (MAP_SYNC)"
+	default n
+	help
+	  Enable support for synchronous fault with nvdimm namespaces.
+
+	  If you're unsure, say N.
+
+
 config PPC_HAVE_KUAP
 	bool
 
diff --git a/arch/x86/include/asm/libnvdimm.h b/arch/x86/include/asm/libnvdimm.h
new file mode 100644
index 000000000000..aee697a72537
--- /dev/null
+++ b/arch/x86/include/asm/libnvdimm.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ARCH_LIBNVDIMM_H__
+#define __ARCH_LIBNVDIMM_H__
+
+#endif /* __ARCH_LIBNVDIMM_H__  */
diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
index ccbb5b43b8b2..74a0809491af 100644
--- a/drivers/nvdimm/region_devs.c
+++ b/drivers/nvdimm/region_devs.c
@@ -1278,6 +1278,13 @@ bool is_nvdimm_sync(struct nd_region *nd_region)
 	if (is_nd_volatile(&nd_region->dev))
 		return true;
 
+	/*
+	 * If arch is forcing a synchronous fault
+	 * disable.
+	 */
+	if (arch_disable_sync_nvdimm())
+		return false;
+
 	return is_nd_pmem(&nd_region->dev) &&
 		!test_bit(ND_REGION_ASYNC, &nd_region->flags);
 }
diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
index 18da4059be09..891449aebe91 100644
--- a/include/linux/libnvdimm.h
+++ b/include/linux/libnvdimm.h
@@ -13,6 +13,8 @@
 #include <linux/spinlock.h>
 #include <linux/bio.h>
 
+#include <asm/libnvdimm.h>
+
 struct badrange_entry {
 	u64 start;
 	u64 length;
@@ -286,4 +288,12 @@ static inline void arch_invalidate_pmem(void *addr, size_t size)
 }
 #endif
 
+#ifndef arch_disable_sync_nvdimm
+#define arch_disable_sync_nvdimm arch_disable_sync_nvdimm
+static inline bool arch_disable_sync_nvdimm()
+{
+	return false;
+}
+#endif
+
 #endif /* __LIBNVDIMM_H__ */
