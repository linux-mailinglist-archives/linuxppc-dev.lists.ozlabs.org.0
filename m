Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E15620F17B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 11:22:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wzR74GDfzDqXl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 19:22:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wzP437D7zDqdc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 19:20:56 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U92HgL045577; Tue, 30 Jun 2020 05:20:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ybnut460-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 05:20:41 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05U92OqP046379;
 Tue, 30 Jun 2020 05:20:40 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ybnut459-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 05:20:40 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05U9Gun0008352;
 Tue, 30 Jun 2020 09:20:39 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 31wwcgsm4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 09:20:38 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05U9JGwg57475430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 09:19:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 981E04C052;
 Tue, 30 Jun 2020 09:20:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9777A4C04A;
 Tue, 30 Jun 2020 09:20:34 +0000 (GMT)
Received: from [9.199.48.28] (unknown [9.199.48.28])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Jun 2020 09:20:34 +0000 (GMT)
Subject: Re: [PATCH v6 6/8] powerpc/pmem: Avoid the barrier in flush routines
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Dan Williams <dan.j.williams@intel.com>
References: <20200629135722.73558-1-aneesh.kumar@linux.ibm.com>
 <20200629135722.73558-7-aneesh.kumar@linux.ibm.com>
 <20200629160940.GU21462@kitsune.suse.cz> <87lfk5hahc.fsf@linux.ibm.com>
 <CAPcyv4hEV=Ps=t=3qsFq3Ob1jzf=ptoZmYTDkgr8D_G0op8uvQ@mail.gmail.com>
 <20200630085413.GW21462@kitsune.suse.cz>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <9204289b-2274-b5c1-2cd5-8ed5ce28efb4@linux.ibm.com>
Date: Tue, 30 Jun 2020 14:50:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630085413.GW21462@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-30_02:2020-06-30,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006300062
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/30/20 2:24 PM, Michal Suchánek wrote:
> On Mon, Jun 29, 2020 at 06:50:15PM -0700, Dan Williams wrote:
>> On Mon, Jun 29, 2020 at 1:41 PM Aneesh Kumar K.V
>> <aneesh.kumar@linux.ibm.com> wrote:
>>>
>>> Michal Suchánek <msuchanek@suse.de> writes:
>>>
>>>> Hello,
>>>>
>>>> On Mon, Jun 29, 2020 at 07:27:20PM +0530, Aneesh Kumar K.V wrote:
>>>>> nvdimm expect the flush routines to just mark the cache clean. The barrier
>>>>> that mark the store globally visible is done in nvdimm_flush().
>>>>>
>>>>> Update the papr_scm driver to a simplified nvdim_flush callback that do
>>>>> only the required barrier.
>>>>>
>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>> ---
>>>>>   arch/powerpc/lib/pmem.c                   |  6 ------
>>>>>   arch/powerpc/platforms/pseries/papr_scm.c | 13 +++++++++++++
>>>>>   2 files changed, 13 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
>>>>> index 5a61aaeb6930..21210fa676e5 100644
>>>>> --- a/arch/powerpc/lib/pmem.c
>>>>> +++ b/arch/powerpc/lib/pmem.c
>>>>> @@ -19,9 +19,6 @@ static inline void __clean_pmem_range(unsigned long start, unsigned long stop)
>>>>>
>>>>>       for (i = 0; i < size >> shift; i++, addr += bytes)
>>>>>               asm volatile(PPC_DCBSTPS(%0, %1): :"i"(0), "r"(addr): "memory");
>>>>> -
>>>>> -
>>>>> -    asm volatile(PPC_PHWSYNC ::: "memory");
>>>>>   }
>>>>>
>>>>>   static inline void __flush_pmem_range(unsigned long start, unsigned long stop)
>>>>> @@ -34,9 +31,6 @@ static inline void __flush_pmem_range(unsigned long start, unsigned long stop)
>>>>>
>>>>>       for (i = 0; i < size >> shift; i++, addr += bytes)
>>>>>               asm volatile(PPC_DCBFPS(%0, %1): :"i"(0), "r"(addr): "memory");
>>>>> -
>>>>> -
>>>>> -    asm volatile(PPC_PHWSYNC ::: "memory");
>>>>>   }
>>>>>
>>>>>   static inline void clean_pmem_range(unsigned long start, unsigned long stop)
>>>>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>>>>> index 9c569078a09f..9a9a0766f8b6 100644
>>>>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>>>>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>>>>> @@ -630,6 +630,18 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>>>>>
>>>>>       return 0;
>>>>>   }
>>>>> +/*
>>>>> + * We have made sure the pmem writes are done such that before calling this
>>>>> + * all the caches are flushed/clean. We use dcbf/dcbfps to ensure this. Here
>>>>> + * we just need to add the necessary barrier to make sure the above flushes
>>>>> + * are have updated persistent storage before any data access or data transfer
>>>>> + * caused by subsequent instructions is initiated.
>>>>> + */
>>>>> +static int papr_scm_flush_sync(struct nd_region *nd_region, struct bio *bio)
>>>>> +{
>>>>> +    arch_pmem_flush_barrier();
>>>>> +    return 0;
>>>>> +}
>>>>>
>>>>>   static ssize_t flags_show(struct device *dev,
>>>>>                         struct device_attribute *attr, char *buf)
>>>>> @@ -743,6 +755,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>>>>>       ndr_desc.mapping = &mapping;
>>>>>       ndr_desc.num_mappings = 1;
>>>>>       ndr_desc.nd_set = &p->nd_set;
>>>>> +    ndr_desc.flush = papr_scm_flush_sync;
>>>>
>>>> AFAICT currently the only device that implements flush is virtio_pmem.
>>>> How does the nfit driver get away without implementing flush?
>>>
>>> generic_nvdimm_flush does the required barrier for nfit. The reason for
>>> adding ndr_desc.flush call back for papr_scm was to avoid the usage
>>> of iomem based deep flushing (ndr_region_data.flush_wpq) which is not
>>> supported by papr_scm.
>>>
>>> BTW we do return NULL for ndrd_get_flush_wpq() on power. So the upstream
>>> code also does the same thing, but in a different way.
>>>
>>>
>>>> Also the flush takes arguments that are completely unused but a user of
>>>> the pmem region must assume they are used, and call flush() on the
>>>> region rather than arch_pmem_flush_barrier() directly.
>>>
>>> The bio argument can help a pmem driver to do range based flushing in
>>> case of pmem_make_request. If bio is null then we must assume a full
>>> device flush.
>>
>> The bio argument isn't for range based flushing, it is for flush
>> operations that need to complete asynchronously.
> How does the block layer determine that the pmem device needs
> asynchronous fushing?
> 

	set_bit(ND_REGION_ASYNC, &ndr_desc.flags);
	
and dax_synchronous(dev)

> The flush() was designed for the purpose with the bio argument and only
> virtio_pmem which is fulshed asynchronously used it. Now that papr_scm
> resuses it fir different purpose how do you tell?
> 

-aneesh
