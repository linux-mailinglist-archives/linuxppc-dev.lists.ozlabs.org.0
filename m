Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EFE705405
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 18:36:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLMLm3GkNz3fK2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 02:36:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dietmar.eggemann@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLMLH4YXxz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 02:35:49 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2F071FB;
	Tue, 16 May 2023 09:36:00 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FED73F7BD;
	Tue, 16 May 2023 09:35:14 -0700 (PDT)
Message-ID: <26fe6dc1-33c5-b825-c019-b346e8bedc0a@arm.com>
Date: Tue, 16 May 2023 18:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC 0/1] sched/fair: Consider asymmetric scheduler groups in
 load balancer
Content-Language: en-US
To: Tobias Huschle <huschle@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20230515114601.12737-1-huschle@linux.ibm.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20230515114601.12737-1-huschle@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, bristot@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/05/2023 13:46, Tobias Huschle wrote:
> The current load balancer implementation implies that scheduler groups,
> within the same scheduler domain, all host the same number of CPUs. 
> 
> This appears to be valid for non-s390 architectures. Nevertheless, s390
> can actually have scheduler groups of unequal size.

Arm (classical) big.Little had this for years before we switched to flat
scheduling (only MC sched domain) over CPU capacity boundaries for Arm
DynamIQ.

Arm64 Juno platform in mainline:

root@juno:~# cat /sys/devices/system/cpu/cpu*/topology/cluster_cpus_list
0,3-5
1-2
1-2
0,3-5
0,3-5
0,3-5

root@juno:~# cat /proc/schedstat | grep ^domain | awk '{print $1, $2}'

domain0 39 <--
domain1 3f
domain0 06 <--
domain1 3f
domain0 06
domain1 3f
domain0 39
domain1 3f
domain0 39
domain1 3f
domain0 39
domain1 3f

root@juno:~# cat /sys/kernel/debug/sched/domains/cpu0/domain*/name
MC
DIE

But we don't have SMT on the mobile processors.

It looks like you are only interested to get group_weight dependency
into this 'prefer_sibling' condition of find_busiest_group()?

We in (classical) big.LITTLE (sd flag SD_ASYM_CPUCAPACITY) remove
SD_PREFER_SIBLING from sd->child so we don't run this condition.

> The current scheduler behavior causes some s390 configs to use SMT
> while some cores are still idle, leading to a performance degredation 
> under certain levels of workload.
> 
> Please refer to the patch's commit message for more details and an
> example. This patch is a proposal on how to integrate the size of
> scheduler groups into the decision process.
> 
> This patch is the most basic approach to address this issue and does 
> not claim to be perfect as-is.
> 
> Other ideas that also proved to address the problem but are more 
> complex but also potentially more precise:
>   1. On scheduler group building, count the number of CPUs within each 
>      group that are first in their sibling mask. This represents the 
>      number of CPUs that can be used before running into SMT. This 
>      should be slightly more accurate than using the full group weight 
>      if the number of available SMT threads per core varies.
>   2. Introduce a new scheduler group classification (smt_busy) in
>      between of fully_busy and has_spare. This classification would  
>      indicate that a group still has spare capacity, but will run 
>      into SMT when using that capacity. This would make the load 
>      balancer prefer groups with fully idle CPUs over ones that are 
>      about to run into SMT.
> 
> Feedback would be greatly appreciated.
> 
> Tobias Huschle (1):
>   sched/fair: Consider asymmetric scheduler groups in load balancer
> 
>  kernel/sched/fair.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

