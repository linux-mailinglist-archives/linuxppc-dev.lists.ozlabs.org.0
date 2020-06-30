Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C31420ED16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 07:03:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wsgr3yKGzDqgN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 15:03:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wsf832ZMzDqfK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 15:01:52 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U43dWf101562; Tue, 30 Jun 2020 01:01:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ydmr4pvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 01:01:42 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05U4mkgW076536;
 Tue, 30 Jun 2020 01:01:40 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ydmr4puw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 01:01:40 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05U50J0b019195;
 Tue, 30 Jun 2020 05:01:39 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 31wwr8jkef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 05:01:39 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05U51Z0h32178536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 05:01:35 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E64556E050;
 Tue, 30 Jun 2020 05:01:37 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2D926E04E;
 Tue, 30 Jun 2020 05:01:34 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.48.28])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 30 Jun 2020 05:01:34 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH updated] libnvdimm/nvdimm/flush: Allow architecture to
 override the flush barrier
In-Reply-To: <CAPcyv4hgjH4We9Th2oir3NxpJEhFuLnQeCrF8auwNfF+5av8jQ@mail.gmail.com>
References: <20200629135722.73558-5-aneesh.kumar@linux.ibm.com>
 <20200629202901.83516-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4hgjH4We9Th2oir3NxpJEhFuLnQeCrF8auwNfF+5av8jQ@mail.gmail.com>
Date: Tue, 30 Jun 2020 10:31:31 +0530
Message-ID: <87imf9gn9w.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-29_21:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006300028
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> On Mon, Jun 29, 2020 at 1:29 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> Architectures like ppc64 provide persistent memory specific barriers
>> that will ensure that all stores for which the modifications are
>> written to persistent storage by preceding dcbfps and dcbstps
>> instructions have updated persistent storage before any data
>> access or data transfer caused by subsequent instructions is initiated.
>> This is in addition to the ordering done by wmb()
>>
>> Update nvdimm core such that architecture can use barriers other than
>> wmb to ensure all previous writes are architecturally visible for
>> the platform buffer flush.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  drivers/md/dm-writecache.c   | 2 +-
>>  drivers/nvdimm/region_devs.c | 8 ++++----
>>  include/linux/libnvdimm.h    | 4 ++++
>>  3 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
>> index 74f3c506f084..8c6b6dce64e2 100644
>> --- a/drivers/md/dm-writecache.c
>> +++ b/drivers/md/dm-writecache.c
>> @@ -536,7 +536,7 @@ static void ssd_commit_superblock(struct dm_writecache *wc)
>>  static void writecache_commit_flushed(struct dm_writecache *wc, bool wait_for_ios)
>>  {
>>         if (WC_MODE_PMEM(wc))
>> -               wmb();
>> +               arch_pmem_flush_barrier();
>>         else
>>                 ssd_commit_flushed(wc, wait_for_ios);
>>  }
>> diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
>> index 4502f9c4708d..b308ad09b63d 100644
>> --- a/drivers/nvdimm/region_devs.c
>> +++ b/drivers/nvdimm/region_devs.c
>> @@ -1206,13 +1206,13 @@ int generic_nvdimm_flush(struct nd_region *nd_region)
>>         idx = this_cpu_add_return(flush_idx, hash_32(current->pid + idx, 8));
>>
>>         /*
>> -        * The first wmb() is needed to 'sfence' all previous writes
>> -        * such that they are architecturally visible for the platform
>> -        * buffer flush.  Note that we've already arranged for pmem
>> +        * The first arch_pmem_flush_barrier() is needed to 'sfence' all
>> +        * previous writes such that they are architecturally visible for
>> +        * the platform buffer flush. Note that we've already arranged for pmem
>>          * writes to avoid the cache via memcpy_flushcache().  The final
>>          * wmb() ensures ordering for the NVDIMM flush write.
>>          */
>> -       wmb();
>> +       arch_pmem_flush_barrier();
>>         for (i = 0; i < nd_region->ndr_mappings; i++)
>>                 if (ndrd_get_flush_wpq(ndrd, i, 0))
>>                         writeq(1, ndrd_get_flush_wpq(ndrd, i, idx));
>> diff --git a/include/linux/libnvdimm.h b/include/linux/libnvdimm.h
>> index 18da4059be09..66f6c65bd789 100644
>> --- a/include/linux/libnvdimm.h
>> +++ b/include/linux/libnvdimm.h
>> @@ -286,4 +286,8 @@ static inline void arch_invalidate_pmem(void *addr, size_t size)
>>  }
>>  #endif
>>
>> +#ifndef arch_pmem_flush_barrier
>> +#define arch_pmem_flush_barrier() wmb()
>> +#endif
>
> I think it is out of place to define this in libnvdimm.h and it is odd
> to give it such a long name. The other pmem api helpers like
> arch_wb_cache_pmem() and arch_invalidate_pmem() are function calls for
> libnvdimm driver operations, this barrier is just an instruction and
> is closer to wmb() than the pmem api routine.
>
> Since it is a store fence for pmem, so let's just call it pmem_wmb()
> and define the generic version in include/linux/compiler.h. It should
> probably also be documented alongside dma_wmb() in
> Documentation/memory-barriers.txt about why code would use it over
> wmb(), and why a symmetric pmem_rmb() is not needed.

How about the below? I used pmem_barrier() instead of pmem_wmb(). I
guess we wanted this to order() any data access not jus the following
stores to persistent storage? W.r.t why a symmetric pmem_rmb() is not
needed I was not sure how to explain that. Are you suggesting to explain
why a read/load from persistent storage don't want to wait for
pmem_barrier() ?

modified   Documentation/memory-barriers.txt
@@ -1935,6 +1935,16 @@ There are some more advanced barrier functions:
      relaxed I/O accessors and the Documentation/DMA-API.txt file for more
      information on consistent memory.
 
+ (*) pmem_barrier();
+
+     These are for use with persistent memory to esure the ordering of stores
+     to persistent memory region.
+
+     For example, after a non temporal write to persistent storage we use pmem_barrier()
+     to ensures that stores have updated the persistent storage before
+     any data access or data transfer caused by subsequent instructions is initiated.
+
 
 ===============================
 IMPLICIT KERNEL MEMORY BARRIERS
modified   arch/powerpc/include/asm/barrier.h
@@ -97,6 +97,19 @@ do {									\
 #define barrier_nospec()
 #endif /* CONFIG_PPC_BARRIER_NOSPEC */
 
+/*
+ * pmem_barrier() ensures that all stores for which the modification
+ * are written to persistent storage by preceding dcbfps/dcbstps
+ * instructions have updated persistent storage before any data
+ * access or data transfer caused by subsequent instructions is
+ * initiated.
+ */
+#define pmem_barrier pmem_barrier
+static inline void pmem_barrier(void)
+{
+	asm volatile(PPC_PHWSYNC ::: "memory");
+}
+
 #include <asm-generic/barrier.h>
 
 #endif /* _ASM_POWERPC_BARRIER_H */
modified   include/asm-generic/barrier.h
@@ -257,5 +257,16 @@ do {									\
 })
 #endif
 
+/*
+ * pmem_barrier() ensures that all stores for which the modification
+ * are written to persistent storage by preceding instructions have
+ * updated persistent storage before any data  access or data transfer
+ * caused by subsequent instructions is
+ * initiated.
+ */
+#ifndef pmem_barrier
+#define pmem_barrier  wmb()
+#endif
+
 #endif /* !__ASSEMBLY__ */
 #endif /* __ASM_GENERIC_BARRIER_H */

