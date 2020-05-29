Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 651111E798E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 11:39:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YKJs57ngzDqfq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 19:39:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YKHF4jnPzDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 19:37:45 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04T9WvOC009538; Fri, 29 May 2020 05:37:39 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31as1bu4v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 05:37:39 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04T9aFad024099;
 Fri, 29 May 2020 05:37:38 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31as1bu4tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 05:37:38 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04T9ZbDf019231;
 Fri, 29 May 2020 09:37:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 316uf93ns9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 09:37:36 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04T9aKgi63504852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 May 2020 09:36:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 243A611C058;
 Fri, 29 May 2020 09:37:34 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4912F11C05C;
 Fri, 29 May 2020 09:37:32 +0000 (GMT)
Received: from [9.85.84.128] (unknown [9.85.84.128])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 May 2020 09:37:32 +0000 (GMT)
Subject: Re: [RFC PATCH 1/2] libnvdimm: Add prctl control for disabling
 synchronous fault support.
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>, jack@suse.de
References: <20200529054141.156384-1-aneesh.kumar@linux.ibm.com>
 <20200529093310.GL25173@kitsune.suse.cz>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <6183cf4a-d134-99e5-936e-ef35f530c2ec@linux.ibm.com>
Date: Fri, 29 May 2020 15:07:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529093310.GL25173@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-29_02:2020-05-28,
 2020-05-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 cotscore=-2147483648 lowpriorityscore=0 clxscore=1011 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290075
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
Cc: linux-nvdimm@lists.01.org, Jeff Moyer <jmoyer@redhat.com>, oohall@gmail.com,
 dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,


Thanks Michal. I also missed Jeff in this email thread.

-aneesh

On 5/29/20 3:03 PM, Michal Suchánek wrote:
> Adding Jan
> 
> On Fri, May 29, 2020 at 11:11:39AM +0530, Aneesh Kumar K.V wrote:
>> With POWER10, architecture is adding new pmem flush and sync instructions.
>> The kernel should prevent the usage of MAP_SYNC if applications are not using
>> the new instructions on newer hardware.
>>
>> This patch adds a prctl option MAP_SYNC_ENABLE that can be used to enable
>> the usage of MAP_SYNC. The kernel config option is added to allow the user
>> to control whether MAP_SYNC should be enabled by default or not.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   include/linux/sched/coredump.h | 13 ++++++++++---
>>   include/uapi/linux/prctl.h     |  3 +++
>>   kernel/fork.c                  |  8 +++++++-
>>   kernel/sys.c                   | 18 ++++++++++++++++++
>>   mm/Kconfig                     |  3 +++
>>   mm/mmap.c                      |  4 ++++
>>   6 files changed, 45 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/sched/coredump.h b/include/linux/sched/coredump.h
>> index ecdc6542070f..9ba6b3d5f991 100644
>> --- a/include/linux/sched/coredump.h
>> +++ b/include/linux/sched/coredump.h
>> @@ -72,9 +72,16 @@ static inline int get_dumpable(struct mm_struct *mm)
>>   #define MMF_DISABLE_THP		24	/* disable THP for all VMAs */
>>   #define MMF_OOM_VICTIM		25	/* mm is the oom victim */
>>   #define MMF_OOM_REAP_QUEUED	26	/* mm was queued for oom_reaper */
>> -#define MMF_DISABLE_THP_MASK	(1 << MMF_DISABLE_THP)
>> +#define MMF_DISABLE_MAP_SYNC	27	/* disable THP for all VMAs */
>> +#define MMF_DISABLE_THP_MASK		(1 << MMF_DISABLE_THP)
>> +#define MMF_DISABLE_MAP_SYNC_MASK	(1 << MMF_DISABLE_MAP_SYNC)
>>   
>> -#define MMF_INIT_MASK		(MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK |\
>> -				 MMF_DISABLE_THP_MASK)
>> +#define MMF_INIT_MASK		(MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK | \
>> +			MMF_DISABLE_THP_MASK | MMF_DISABLE_MAP_SYNC_MASK)
>> +
>> +static inline bool map_sync_enabled(struct mm_struct *mm)
>> +{
>> +	return !(mm->flags & MMF_DISABLE_MAP_SYNC_MASK);
>> +}
>>   
>>   #endif /* _LINUX_SCHED_COREDUMP_H */
>> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
>> index 07b4f8131e36..ee4cde32d5cf 100644
>> --- a/include/uapi/linux/prctl.h
>> +++ b/include/uapi/linux/prctl.h
>> @@ -238,4 +238,7 @@ struct prctl_mm_map {
>>   #define PR_SET_IO_FLUSHER		57
>>   #define PR_GET_IO_FLUSHER		58
>>   
>> +#define PR_SET_MAP_SYNC_ENABLE		59
>> +#define PR_GET_MAP_SYNC_ENABLE		60
>> +
>>   #endif /* _LINUX_PRCTL_H */
>> diff --git a/kernel/fork.c b/kernel/fork.c
>> index 8c700f881d92..d5a9a363e81e 100644
>> --- a/kernel/fork.c
>> +++ b/kernel/fork.c
>> @@ -963,6 +963,12 @@ __cacheline_aligned_in_smp DEFINE_SPINLOCK(mmlist_lock);
>>   
>>   static unsigned long default_dump_filter = MMF_DUMP_FILTER_DEFAULT;
>>   
>> +#ifdef CONFIG_ARCH_MAP_SYNC_DISABLE
>> +unsigned long default_map_sync_mask = MMF_DISABLE_MAP_SYNC_MASK;
>> +#else
>> +unsigned long default_map_sync_mask = 0;
>> +#endif
>> +
>>   static int __init coredump_filter_setup(char *s)
>>   {
>>   	default_dump_filter =
>> @@ -1039,7 +1045,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>>   		mm->flags = current->mm->flags & MMF_INIT_MASK;
>>   		mm->def_flags = current->mm->def_flags & VM_INIT_DEF_MASK;
>>   	} else {
>> -		mm->flags = default_dump_filter;
>> +		mm->flags = default_dump_filter | default_map_sync_mask;
>>   		mm->def_flags = 0;
>>   	}
>>   
>> diff --git a/kernel/sys.c b/kernel/sys.c
>> index d325f3ab624a..f6127cf4128b 100644
>> --- a/kernel/sys.c
>> +++ b/kernel/sys.c
>> @@ -2450,6 +2450,24 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>>   			clear_bit(MMF_DISABLE_THP, &me->mm->flags);
>>   		up_write(&me->mm->mmap_sem);
>>   		break;
>> +
>> +	case PR_GET_MAP_SYNC_ENABLE:
>> +		if (arg2 || arg3 || arg4 || arg5)
>> +			return -EINVAL;
>> +		error = !test_bit(MMF_DISABLE_MAP_SYNC, &me->mm->flags);
>> +		break;
>> +	case PR_SET_MAP_SYNC_ENABLE:
>> +		if (arg3 || arg4 || arg5)
>> +			return -EINVAL;
>> +		if (down_write_killable(&me->mm->mmap_sem))
>> +			return -EINTR;
>> +		if (arg2)
>> +			clear_bit(MMF_DISABLE_MAP_SYNC, &me->mm->flags);
>> +		else
>> +			set_bit(MMF_DISABLE_MAP_SYNC, &me->mm->flags);
>> +		up_write(&me->mm->mmap_sem);
>> +		break;
>> +
>>   	case PR_MPX_ENABLE_MANAGEMENT:
>>   	case PR_MPX_DISABLE_MANAGEMENT:
>>   		/* No longer implemented: */
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index c1acc34c1c35..38fd7cfbfca8 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -867,4 +867,7 @@ config ARCH_HAS_HUGEPD
>>   config MAPPING_DIRTY_HELPERS
>>           bool
>>   
>> +config ARCH_MAP_SYNC_DISABLE
>> +	bool
>> +
>>   endmenu
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index f609e9ec4a25..613e5894f178 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -1464,6 +1464,10 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
>>   		case MAP_SHARED_VALIDATE:
>>   			if (flags & ~flags_mask)
>>   				return -EOPNOTSUPP;
>> +
>> +			if ((flags & MAP_SYNC)  && !map_sync_enabled(mm))
>> +				return -EOPNOTSUPP;
>> +
>>   			if (prot & PROT_WRITE) {
>>   				if (!(file->f_mode & FMODE_WRITE))
>>   					return -EACCES;
>> -- 
>> 2.26.2
>>

