Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E59F749A7D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 13:20:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxYwx2p3zz3c47
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 21:20:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 494 seconds by postgrey-1.37 at boromir; Thu, 06 Jul 2023 21:20:08 AEST
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxYwS0cN9z3bbt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 21:20:06 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7020F1480;
	Thu,  6 Jul 2023 04:12:01 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 532253F663;
	Thu,  6 Jul 2023 04:11:17 -0700 (PDT)
Message-ID: <8a5eff5e-4184-958a-17d8-b551e7efc784@arm.com>
Date: Thu, 6 Jul 2023 13:11:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 0/1] sched/fair: Consider asymmetric scheduler groups in
 load balancer
Content-Language: en-US
To: Tobias Huschle <huschle@linux.ibm.com>
References: <20230515114601.12737-1-huschle@linux.ibm.com>
 <26fe6dc1-33c5-b825-c019-b346e8bedc0a@arm.com>
 <4c28b46b59bcc083956757074d1fe059@linux.ibm.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <4c28b46b59bcc083956757074d1fe059@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, bristot@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/07/2023 11:11, Tobias Huschle wrote:
> On 2023-05-16 18:35, Dietmar Eggemann wrote:
>> On 15/05/2023 13:46, Tobias Huschle wrote:
>>> The current load balancer implementation implies that scheduler groups,
>>> within the same scheduler domain, all host the same number of CPUs.
>>>
>>> This appears to be valid for non-s390 architectures. Nevertheless, s390
>>> can actually have scheduler groups of unequal size.
>>
>> Arm (classical) big.Little had this for years before we switched to flat
>> scheduling (only MC sched domain) over CPU capacity boundaries for Arm
>> DynamIQ.
>>
>> Arm64 Juno platform in mainline:
>>
>> root@juno:~# cat /sys/devices/system/cpu/cpu*/topology/cluster_cpus_list
>> 0,3-5
>> 1-2
>> 1-2
>> 0,3-5
>> 0,3-5
>> 0,3-5
>>
>> root@juno:~# cat /proc/schedstat | grep ^domain | awk '{print $1, $2}'
>>
>> domain0 39 <--
>> domain1 3f
>> domain0 06 <--
>> domain1 3f
>> domain0 06
>> domain1 3f
>> domain0 39
>> domain1 3f
>> domain0 39
>> domain1 3f
>> domain0 39
>> domain1 3f
>>
>> root@juno:~# cat /sys/kernel/debug/sched/domains/cpu0/domain*/name
>> MC
>> DIE
>>
>> But we don't have SMT on the mobile processors.
>>
>> It looks like you are only interested to get group_weight dependency
>> into this 'prefer_sibling' condition of find_busiest_group()?
>>
> Sorry, looks like your reply hit some bad filter of my mail program.
> Let me answer, although it's a bit late.
> 
> Yes, I would like to get the group_weight into the prefer_sibling path.
> Unfortunately, we cannot go for a flat hierarchy as the s390 hardware
> allows to have CPUs to be pretty far apart (cache-wise), which means,
> the load balancer should avoid to move tasks back and forth between
> those CPUs if possible.
> 
> We can't remove SD_PREFER_SIBLING either, as this would cause the load
> balancer to aim for having the same number of idle CPUs in all groups,
> which is a problem as well in asymmetric groups, for example:
> 
> With SD_PREFER_SIBLING, aiming for same number of non-idle CPUs
> 00 01 02 03 04 05 06 07 08 09 10 11  || 12 13 14 15
>                 x     x     x     x      x  x  x  x
> 
> Without SD_PREFER_SIBLING, aiming for the same number of idle CPUs
> 00 01 02 03 04 05 06 07 08 09 10 11  || 12 13 14 15
>     x  x  x     x  x     x     x  x
> 
> 
> Hence the idea to add the group_weight to the prefer_sibling path.
> 
> I was wondering if this would be the right place to address this issue
> or if I should go down another route.

Yes, it's the right place to fix it for you. IMHO, there is still some
discussion needed about the correct condition and changes in
calculate_imbalance() for your case if I read the comments on this
thread correctly.

Arm64 big.Little wouldn't be affected since we explicitly remove
SD_PREFER_SIBLING on MC for our legacy MC,DIE setups to avoid spreading
tasks across DIE sched groups holding CPUs with different capacities.

[...]
