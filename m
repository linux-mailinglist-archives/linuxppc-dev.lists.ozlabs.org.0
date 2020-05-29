Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5F21E7B07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 12:57:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YM3H5ww5zDqfp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 20:57:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YM1Q5NxMzDqc6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 20:55:54 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04TAVnYf082301; Fri, 29 May 2020 06:55:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31as1dn09j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 06:55:45 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04TAiMrZ150546;
 Fri, 29 May 2020 06:55:45 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31as1dn091-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 06:55:44 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04TAthcT029895;
 Fri, 29 May 2020 10:55:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 316uf93sqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 10:55:42 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04TAteen45744268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 May 2020 10:55:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B823C11C054;
 Fri, 29 May 2020 10:55:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BBAE11C052;
 Fri, 29 May 2020 10:55:36 +0000 (GMT)
Received: from [9.85.84.128] (unknown [9.85.84.128])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 May 2020 10:55:35 +0000 (GMT)
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
To: Jan Kara <jack@suse.cz>
References: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
 <20200529093310.GL25173@kitsune.suse.cz>
 <6183cf4a-d134-99e5-936e-ef35f530c2ec@linux.ibm.com>
 <20200529095250.GP14550@quack2.suse.cz>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <7e8ee9e3-4d4d-e4b9-913b-1c2448adc62a@linux.ibm.com>
Date: Fri, 29 May 2020 16:25:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529095250.GP14550@quack2.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_02:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 cotscore=-2147483648 phishscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290080
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

On 5/29/20 3:22 PM, Jan Kara wrote:
> Hi!
> 
> On Fri 29-05-20 15:07:31, Aneesh Kumar K.V wrote:
>> Thanks Michal. I also missed Jeff in this email thread.
> 
> And I think you'll also need some of the sched maintainers for the prctl
> bits...
> 
>> On 5/29/20 3:03 PM, Michal Suchánek wrote:
>>> Adding Jan
>>>
>>> On Fri, May 29, 2020 at 11:11:39AM +0530, Aneesh Kumar K.V wrote:
>>>> With POWER10, architecture is adding new pmem flush and sync instructions.
>>>> The kernel should prevent the usage of MAP_SYNC if applications are not using
>>>> the new instructions on newer hardware.
>>>>
>>>> This patch adds a prctl option MAP_SYNC_ENABLE that can be used to enable
>>>> the usage of MAP_SYNC. The kernel config option is added to allow the user
>>>> to control whether MAP_SYNC should be enabled by default or not.
>>>>
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ...
>>>> diff --git a/kernel/fork.c b/kernel/fork.c
>>>> index 8c700f881d92..d5a9a363e81e 100644
>>>> --- a/kernel/fork.c
>>>> +++ b/kernel/fork.c
>>>> @@ -963,6 +963,12 @@ __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
>>>>    static unsigned long default_dump_filter = MMF_DUMP_FILTER_DEFAULT;
>>>> +#ifdef CONFIG_ARCH_MAP_SYNC_DISABLE
>>>> +unsigned long default_map_sync_mask = MMF_DISABLE_MAP_SYNC_MASK;
>>>> +#else
>>>> +unsigned long default_map_sync_mask = 0;
>>>> +#endif
>>>> +
> 
> I'm not sure CONFIG is really the right approach here. For a distro that would
> basically mean to disable MAP_SYNC for all PPC kernels unless application
> explicitly uses the right prctl. Shouldn't we rather initialize
> default_map_sync_mask on boot based on whether the CPU we run on requires
> new flush instructions or not? Otherwise the patch looks sensible.
> 

yes that is correct. We ideally want to deny MAP_SYNC only w.r.t 
POWER10. But on a virtualized platform there is no easy way to detect 
that. We could ideally hook this into the nvdimm driver where we look at 
the new compat string ibm,persistent-memory-v2 and then disable MAP_SYNC
if we find a device with the specific value.

BTW with the recent changes I posted for the nvdimm driver, older kernel 
won't initialize persistent memory device on newer hardware. Newer 
hardware will present the device to OS with a different device tree 
compat string.

My expectation  w.r.t this patch was, Distro would want to  mark
CONFIG_ARCH_MAP_SYNC_DISABLE=n based on the different application 
certification.  Otherwise application will have to end up calling the 
prctl(MMF_DISABLE_MAP_SYNC, 0) any way. If that is the case, should this
be dependent on P10?

With that I am wondering should we even have this patch? Can we expect 
userspace get updated to use new instruction?.

With ppc64 we never had a real persistent memory device available for 
end user to try. The available persistent memory stack was using vPMEM 
which was presented as a volatile memory region for which there is no 
need to use any of the flush instructions. We could safely assume that 
as we get applications certified/verified for working with pmem device 
on ppc64, they would all be using the new instructions?


-aneesh



