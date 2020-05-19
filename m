Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D611D8F3A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 07:32:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R4Jd6XT0zDqvn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 15:32:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R4Gr5YlhzDqrC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 15:30:44 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04J53kJm159211; Tue, 19 May 2020 01:30:35 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312c8np914-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 01:30:35 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04J5TNrc026327;
 Tue, 19 May 2020 05:30:33 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 313wne301c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 05:30:33 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04J5UXx452822474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2020 05:30:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CB22AC05E;
 Tue, 19 May 2020 05:30:33 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35B25AC05F;
 Tue, 19 May 2020 05:30:31 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.81.200])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 19 May 2020 05:30:30 +0000 (GMT)
X-Mailer: emacs 27.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 3/5] libnvdimm/nvdimm/flush: Allow architecture to
 override the flush barrier
In-Reply-To: <CAPcyv4iAdrdMiSzVr1UL9Naya+Rq70WVuKqCCNFHe1C4n+E6Tw@mail.gmail.com>
References: <20200513034705.172983-1-aneesh.kumar@linux.ibm.com>
 <20200513034705.172983-3-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iAdrdMiSzVr1UL9Naya+Rq70WVuKqCCNFHe1C4n+E6Tw@mail.gmail.com>
Date: Tue, 19 May 2020 11:00:26 +0530
Message-ID: <87v9kspk3x.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-19_01:2020-05-15,
 2020-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0
 lowpriorityscore=0 cotscore=-2147483648 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005190044
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


Hi Dan,

Apologies for the delay in response. I was waiting for feedback from
hardware team before responding to this email.


Dan Williams <dan.j.williams@intel.com> writes:

> On Tue, May 12, 2020 at 8:47 PM Aneesh Kumar K.V
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
>
> This seems like an exceedingly bad idea, maybe I'm missing something.
> This implies that the deployed base of DAX applications using the old
> instruction sequence are going to regress on new hardware that
> requires the new instructions to be deployed.


pmdk support for ppc64 is still work in progress and there is pull
request to switch pmdk to use new instruction.

https://github.com/tuliom/pmdk/commit/fix-flush

All userspace applications will be switched to use the new
instructions. The new instructions are designed such that when running on P8
and P9 they behave as 'dcbf' and 'hwsync'.

Applications using new instructions will behave as expected when running
on P8 and P9. Only future hardware will differentiate between 'dcbf' and
'dcbfps' 

> I'm thinking the kernel
> should go as far as to disable DAX operation by default on new
> hardware until userspace asserts that it is prepared to switch to the
> new implementation. Is there any other way to ensure the forward
> compatibility of deployed ppc64 DAX applications?

AFAIU there is no released persistent memory hardware on ppc64 platform
and we need to make sure before applications get enabled to use these
persistent memory devices, they should switch to use the new
instruction?


>
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  drivers/nvdimm/region_devs.c | 8 ++++----
>>  include/linux/libnvdimm.h    | 4 ++++
>>  2 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
>> index ccbb5b43b8b2..88ea34a9c7fd 100644
>> --- a/drivers/nvdimm/region_devs.c
>> +++ b/drivers/nvdimm/region_devs.c
>> @@ -1216,13 +1216,13 @@ int generic_nvdimm_flush(struct nd_region *nd_region)
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
>> +
>>  #endif /* __LIBNVDIMM_H__ */
>> --
>> 2.26.2
>>
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org
