Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FBA1EA3CD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 14:23:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bDqJ0P10zDqGB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 22:23:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bDm84cRrzDqCY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jun 2020 22:20:56 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 051C2Opx116343; Mon, 1 Jun 2020 08:20:48 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31bkg7wjg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 08:20:48 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 051C2YZF117320;
 Mon, 1 Jun 2020 08:20:47 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31bkg7wjf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 08:20:47 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 051CFl2T011348;
 Mon, 1 Jun 2020 12:20:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 31bf47v21y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 12:20:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 051CKh3M66257150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jun 2020 12:20:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBADF4203F;
 Mon,  1 Jun 2020 12:20:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DDC942047;
 Mon,  1 Jun 2020 12:20:41 +0000 (GMT)
Received: from [9.85.99.223] (unknown [9.85.99.223])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jun 2020 12:20:41 +0000 (GMT)
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
 <20200529093310.GL25173@kitsune.suse.cz>
 <6183cf4a-d134-99e5-936e-ef35f530c2ec@linux.ibm.com>
 <20200529095250.GP14550@quack2.suse.cz>
 <7e8ee9e3-4d4d-e4b9-913b-1c2448adc62a@linux.ibm.com>
 <20200601100925.GC3960@quack2.suse.cz>
 <2bf026cc-2ed0-70b6-bf99-ecfd0fa3dac4@linux.ibm.com>
 <20200601120705.GQ25173@kitsune.suse.cz>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <af150987-156f-71dc-a4cd-e6f8e670839a@linux.ibm.com>
Date: Mon, 1 Jun 2020 17:50:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601120705.GQ25173@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-01_07:2020-06-01,
 2020-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 cotscore=-2147483648 phishscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006010087
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm@lists.01.org, jack@suse.de,
 Jeff Moyer <jmoyer@redhat.com>, oohall@gmail.com, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/1/20 5:37 PM, Michal Suchánek wrote:
> On Mon, Jun 01, 2020 at 05:31:50PM +0530, Aneesh Kumar K.V wrote:
>> On 6/1/20 3:39 PM, Jan Kara wrote:
>>> On Fri 29-05-20 16:25:35, Aneesh Kumar K.V wrote:
>>>> On 5/29/20 3:22 PM, Jan Kara wrote:
>>>>> On Fri 29-05-20 15:07:31, Aneesh Kumar K.V wrote:
>>>>>> Thanks Michal. I also missed Jeff in this email thread.
>>>>>
>>>>> And I think you'll also need some of the sched maintainers for the prctl
>>>>> bits...
>>>>>
>>>>>> On 5/29/20 3:03 PM, Michal Suchánek wrote:
>>>>>>> Adding Jan
>>>>>>>
>>>>>>> On Fri, May 29, 2020 at 11:11:39AM +0530, Aneesh Kumar K.V wrote:
>>>>>>>> With POWER10, architecture is adding new pmem flush and sync instructions.
>>>>>>>> The kernel should prevent the usage of MAP_SYNC if applications are not using
>>>>>>>> the new instructions on newer hardware.
>>>>>>>>
>>>>>>>> This patch adds a prctl option MAP_SYNC_ENABLE that can be used to enable
>>>>>>>> the usage of MAP_SYNC. The kernel config option is added to allow the user
>>>>>>>> to control whether MAP_SYNC should be enabled by default or not.
>>>>>>>>
>>>>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>>> ...
>>>>>>>> diff --git a/kernel/fork.c b/kernel/fork.c
>>>>>>>> index 8c700f881d92..d5a9a363e81e 100644
>>>>>>>> --- a/kernel/fork.c
>>>>>>>> +++ b/kernel/fork.c
>>>>>>>> @@ -963,6 +963,12 @@ __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
>>>>>>>>      static unsigned long default_dump_filter = MMF_DUMP_FILTER_DEFAULT;
>>>>>>>> +#ifdef CONFIG_ARCH_MAP_SYNC_DISABLE
>>>>>>>> +unsigned long default_map_sync_mask = MMF_DISABLE_MAP_SYNC_MASK;
>>>>>>>> +#else
>>>>>>>> +unsigned long default_map_sync_mask = 0;
>>>>>>>> +#endif
>>>>>>>> +
>>>>>
>>>>> I'm not sure CONFIG is really the right approach here. For a distro that would
>>>>> basically mean to disable MAP_SYNC for all PPC kernels unless application
>>>>> explicitly uses the right prctl. Shouldn't we rather initialize
>>>>> default_map_sync_mask on boot based on whether the CPU we run on requires
>>>>> new flush instructions or not? Otherwise the patch looks sensible.
>>>>>
>>>>
>>>> yes that is correct. We ideally want to deny MAP_SYNC only w.r.t POWER10.
>>>> But on a virtualized platform there is no easy way to detect that. We could
>>>> ideally hook this into the nvdimm driver where we look at the new compat
>>>> string ibm,persistent-memory-v2 and then disable MAP_SYNC
>>>> if we find a device with the specific value.
>>>
>>> Hum, couldn't we set some flag for nvdimm devices with
>>> "ibm,persistent-memory-v2" property and then check it during mmap(2) time
>>> and when the device has this propery and the mmap(2) caller doesn't have
>>> the prctl set, we'd disallow MAP_SYNC? That should make things mostly
>>> seamless, shouldn't it? Only apps that want to use MAP_SYNC on these
>>> devices would need to use prctl(MMF_DISABLE_MAP_SYNC, 0) but then these
>>> applications need to be aware of new instructions so this isn't that much
>>> additional burden...
>>
>> I am not sure application would want to add that much details/knowledge
>> about a platform in their code. I was expecting application to do
>>
>> #ifdef __ppc64__
>>          prctl(MAP_SYNC_ENABLE, 1, 0, 0, 0));
>> #endif
>>          a = mmap(NULL, PAGE_SIZE, PROT_READ|PROT_WRITE,
>>                          MAP_SHARED_VALIDATE | MAP_SYNC, fd, 0);
>>
>>
>> For that code all the complexity that we add w.r.t ibm,persistent-memory-v2
>> is not useful. Do you see a value in making all these device specific rather
>> than a conditional on  __ppc64__?

> If the vpmem devices continue to work with the old instruction on
> POWER10 then it makes sense to make this per-device.

vPMEM doesn't have write_cache and hence it is synchronous even without 
using any specific flush instruction. The question is do we want to have
different programming steps when running on vPMEM vs a persistent PMEM 
device on ppc64.

I will work on the device specific ENABLE flag and then we can compare 
the kernel complexity against the added benefit.


-aneesh
