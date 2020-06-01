Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E551EA361
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 14:04:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bDNk0R8xzDqMm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 22:04:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bDLn2HyJzDqGL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jun 2020 22:02:25 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 051C2HaN104327; Mon, 1 Jun 2020 08:02:18 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31bm15df89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 08:02:18 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 051C2Grt104255;
 Mon, 1 Jun 2020 08:02:17 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31bm15df00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 08:02:16 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 051C05cT013598;
 Mon, 1 Jun 2020 12:01:56 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 31bf47v1b9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jun 2020 12:01:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 051C1rAW43057400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jun 2020 12:01:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCD514204B;
 Mon,  1 Jun 2020 12:01:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEDF64204C;
 Mon,  1 Jun 2020 12:01:51 +0000 (GMT)
Received: from [9.85.99.223] (unknown [9.85.99.223])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jun 2020 12:01:51 +0000 (GMT)
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
To: Jan Kara <jack@suse.cz>
References: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
 <20200529093310.GL25173@kitsune.suse.cz>
 <6183cf4a-d134-99e5-936e-ef35f530c2ec@linux.ibm.com>
 <20200529095250.GP14550@quack2.suse.cz>
 <7e8ee9e3-4d4d-e4b9-913b-1c2448adc62a@linux.ibm.com>
 <20200601100925.GC3960@quack2.suse.cz>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <2bf026cc-2ed0-70b6-bf99-ecfd0fa3dac4@linux.ibm.com>
Date: Mon, 1 Jun 2020 17:31:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601100925.GC3960@quack2.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-01_07:2020-06-01,
 2020-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 suspectscore=0 cotscore=-2147483648 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
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
Cc: linux-nvdimm@lists.01.org, jack@suse.de, Jeff Moyer <jmoyer@redhat.com>,
 oohall@gmail.com, dan.j.williams@intel.com,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/1/20 3:39 PM, Jan Kara wrote:
> On Fri 29-05-20 16:25:35, Aneesh Kumar K.V wrote:
>> On 5/29/20 3:22 PM, Jan Kara wrote:
>>> On Fri 29-05-20 15:07:31, Aneesh Kumar K.V wrote:
>>>> Thanks Michal. I also missed Jeff in this email thread.
>>>
>>> And I think you'll also need some of the sched maintainers for the prctl
>>> bits...
>>>
>>>> On 5/29/20 3:03 PM, Michal Suchánek wrote:
>>>>> Adding Jan
>>>>>
>>>>> On Fri, May 29, 2020 at 11:11:39AM +0530, Aneesh Kumar K.V wrote:
>>>>>> With POWER10, architecture is adding new pmem flush and sync instructions.
>>>>>> The kernel should prevent the usage of MAP_SYNC if applications are not using
>>>>>> the new instructions on newer hardware.
>>>>>>
>>>>>> This patch adds a prctl option MAP_SYNC_ENABLE that can be used to enable
>>>>>> the usage of MAP_SYNC. The kernel config option is added to allow the user
>>>>>> to control whether MAP_SYNC should be enabled by default or not.
>>>>>>
>>>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ...
>>>>>> diff --git a/kernel/fork.c b/kernel/fork.c
>>>>>> index 8c700f881d92..d5a9a363e81e 100644
>>>>>> --- a/kernel/fork.c
>>>>>> +++ b/kernel/fork.c
>>>>>> @@ -963,6 +963,12 @@ __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
>>>>>>     static unsigned long default_dump_filter = MMF_DUMP_FILTER_DEFAULT;
>>>>>> +#ifdef CONFIG_ARCH_MAP_SYNC_DISABLE
>>>>>> +unsigned long default_map_sync_mask = MMF_DISABLE_MAP_SYNC_MASK;
>>>>>> +#else
>>>>>> +unsigned long default_map_sync_mask = 0;
>>>>>> +#endif
>>>>>> +
>>>
>>> I'm not sure CONFIG is really the right approach here. For a distro that would
>>> basically mean to disable MAP_SYNC for all PPC kernels unless application
>>> explicitly uses the right prctl. Shouldn't we rather initialize
>>> default_map_sync_mask on boot based on whether the CPU we run on requires
>>> new flush instructions or not? Otherwise the patch looks sensible.
>>>
>>
>> yes that is correct. We ideally want to deny MAP_SYNC only w.r.t POWER10.
>> But on a virtualized platform there is no easy way to detect that. We could
>> ideally hook this into the nvdimm driver where we look at the new compat
>> string ibm,persistent-memory-v2 and then disable MAP_SYNC
>> if we find a device with the specific value.
> 
> Hum, couldn't we set some flag for nvdimm devices with
> "ibm,persistent-memory-v2" property and then check it during mmap(2) time
> and when the device has this propery and the mmap(2) caller doesn't have
> the prctl set, we'd disallow MAP_SYNC? That should make things mostly
> seamless, shouldn't it? Only apps that want to use MAP_SYNC on these
> devices would need to use prctl(MMF_DISABLE_MAP_SYNC, 0) but then these
> applications need to be aware of new instructions so this isn't that much
> additional burden...

I am not sure application would want to add that much details/knowledge 
about a platform in their code. I was expecting application to do

#ifdef __ppc64__
         prctl(MAP_SYNC_ENABLE, 1, 0, 0, 0));
#endif
         a = mmap(NULL, PAGE_SIZE, PROT_READ|PROT_WRITE,
                         MAP_SHARED_VALIDATE | MAP_SYNC, fd, 0);


For that code all the complexity that we add w.r.t 
ibm,persistent-memory-v2 is not useful. Do you see a value in making all 
these device specific rather than a conditional on  __ppc64__?


> 
>> With that I am wondering should we even have this patch? Can we expect
>> userspace get updated to use new instruction?.
>>
>> With ppc64 we never had a real persistent memory device available for end
>> user to try. The available persistent memory stack was using vPMEM which was
>> presented as a volatile memory region for which there is no need to use any
>> of the flush instructions. We could safely assume that as we get
>> applications certified/verified for working with pmem device on ppc64, they
>> would all be using the new instructions?
> 
> This is a bit of a gamble... I don't have too much trust in certification /
> verification because only the "big players" may do powerfail testing
> throughout enough that they'd uncover these problems. So the question
> really is: How many apps are out there using MAP_SYNC on ppc64? Hopefully
> not many given the HW didn't ship yet as you wrote but I have no real clue.
> Similarly there's a question: How many app writers will read manual for
> older ppc64 architecture and write apps that won't work reliably on
> POWER10? Again, I have no idea.
> 
> So the prctl would be IMHO a nice safety belt but I'm not 100% certain it
> will be needed...
> 
>

-aneesh
