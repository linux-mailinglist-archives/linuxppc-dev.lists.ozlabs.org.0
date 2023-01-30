Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB33680B9C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 12:07:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P55484R4yz3ccl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 22:07:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fLcucfLr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fLcucfLr;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P553B5G6xz3c4w
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 22:06:29 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30UACoBa001696;
	Mon, 30 Jan 2023 11:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Lw3EWnXcBXwkKzIC3dNF6o/WHsfx4BxFNPvSZeia8EA=;
 b=fLcucfLrRL3mzYcYzrKpIaiEfJDknAGUV8xYehdTBSR+4WIp9jBoIhCxk79monQn5MYt
 jrLv/x7l+CNT2okmoAKEueejwjakJGke4Tp8JNIOCyCDg9hQML4y3EaeJuQuGDymKPEm
 p8xnxVI1yH8I6ZvdaUPVNEmn2iSIYe9q/NbZheRPN7W0FYYh44Fjm817boe9MJX8IC7B
 9T2ST3IDWUOse8DWxjEY3E3GlBFpF80txSjNIAVeURlmGgvt29kqxJTp1L/1s6D6UbPo
 zFJ1Pxdc/nAcaFA/CXTkXkWrcJNB20zp3lf7k4BmAFuhje3Gdr7nZAv4kjOm1+brxfRm hQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nebxesa14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 11:06:24 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30T8KLqW026078;
	Mon, 30 Jan 2023 11:06:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3ndn6u8sf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 11:06:22 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30UB6IBV45744622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jan 2023 11:06:18 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FBB52004E;
	Mon, 30 Jan 2023 11:06:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA17F2004B;
	Mon, 30 Jan 2023 11:06:17 +0000 (GMT)
Received: from [9.43.118.213] (unknown [9.43.118.213])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Jan 2023 11:06:17 +0000 (GMT)
Message-ID: <267cdc83-8f9b-7288-45e5-88465354e486@linux.ibm.com>
Date: Mon, 30 Jan 2023 16:36:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] powerpc/imc-pmu: Revert nest_init_lock to being a mutex
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20230130014401.540543-1-mpe@ellerman.id.au>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <20230130014401.540543-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H-gRkAI-r8QmJWeXHPUvDg5s2B03igcd
X-Proofpoint-ORIG-GUID: H-gRkAI-r8QmJWeXHPUvDg5s2B03igcd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_10,2023-01-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300106
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/30/23 07:14, Michael Ellerman wrote:
> The recent commit 76d588dddc45 ("powerpc/imc-pmu: Fix use of mutex in
> IRQs disabled section") fixed warnings (and possible deadlocks) in the
> IMC PMU driver by converting the locking to use spinlocks.
> 
> It also converted the init-time nest_init_lock to a spinlock, even
> though it's not used at runtime in IRQ disabled sections or while
> holding other spinlocks.
> 
> This leads to warnings such as:
> 
>   BUG: sleeping function called from invalid context at include/linux/percpu-rwsem.h:49
>   in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper/0
>   preempt_count: 1, expected: 0
>   CPU: 7 PID: 1 Comm: swapper/0 Not tainted 6.2.0-rc2-14719-gf12cd06109f4-dirty #1
>   Hardware name: Mambo,Simulated-System POWER9 0x4e1203 opal:v6.6.6 PowerNV
>   Call Trace:
>     dump_stack_lvl+0x74/0xa8 (unreliable)
>     __might_resched+0x178/0x1a0
>     __cpuhp_setup_state+0x64/0x1e0
>     init_imc_pmu+0xe48/0x1250
>     opal_imc_counters_probe+0x30c/0x6a0
>     platform_probe+0x78/0x110
>     really_probe+0x104/0x420
>     __driver_probe_device+0xb0/0x170
>     driver_probe_device+0x58/0x180
>     __driver_attach+0xd8/0x250
>     bus_for_each_dev+0xb4/0x140
>     driver_attach+0x34/0x50
>     bus_add_driver+0x1e8/0x2d0
>     driver_register+0xb4/0x1c0
>     __platform_driver_register+0x38/0x50
>     opal_imc_driver_init+0x2c/0x40
>     do_one_initcall+0x80/0x360
>     kernel_init_freeable+0x310/0x3b8
>     kernel_init+0x30/0x1a0
>     ret_from_kernel_thread+0x5c/0x64
> 
> Fix it by converting nest_init_lock back to a mutex, so that we can call
> sleeping functions while holding it. There is no interaction between
> nest_init_lock and the runtime spinlocks used by the actual PMU routines.

Thanks for the patch. Patch looks good to me.

Reviewed-by: Kajol Jain<kjain@linux.ibm.com>
Tested-by: Kajol Jain<kjain@linux.ibm.com>

Thanks,
Kajol Jain
> 
> Fixes: 76d588dddc45 ("powerpc/imc-pmu: Fix use of mutex in IRQs disabled section")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/perf/imc-pmu.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
> index 100e97daf76b..9d229ef7f86e 100644
> --- a/arch/powerpc/perf/imc-pmu.c
> +++ b/arch/powerpc/perf/imc-pmu.c
> @@ -22,7 +22,7 @@
>   * Used to avoid races in counting the nest-pmu units during hotplug
>   * register and unregister
>   */
> -static DEFINE_SPINLOCK(nest_init_lock);
> +static DEFINE_MUTEX(nest_init_lock);
>  static DEFINE_PER_CPU(struct imc_pmu_ref *, local_nest_imc_refc);
>  static struct imc_pmu **per_nest_pmu_arr;
>  static cpumask_t nest_imc_cpumask;
> @@ -1629,7 +1629,7 @@ static void imc_common_mem_free(struct imc_pmu *pmu_ptr)
>  static void imc_common_cpuhp_mem_free(struct imc_pmu *pmu_ptr)
>  {
>  	if (pmu_ptr->domain == IMC_DOMAIN_NEST) {
> -		spin_lock(&nest_init_lock);
> +		mutex_lock(&nest_init_lock);
>  		if (nest_pmus == 1) {
>  			cpuhp_remove_state(CPUHP_AP_PERF_POWERPC_NEST_IMC_ONLINE);
>  			kfree(nest_imc_refc);
> @@ -1639,7 +1639,7 @@ static void imc_common_cpuhp_mem_free(struct imc_pmu *pmu_ptr)
>  
>  		if (nest_pmus > 0)
>  			nest_pmus--;
> -		spin_unlock(&nest_init_lock);
> +		mutex_unlock(&nest_init_lock);
>  	}
>  
>  	/* Free core_imc memory */
> @@ -1796,11 +1796,11 @@ int init_imc_pmu(struct device_node *parent, struct imc_pmu *pmu_ptr, int pmu_id
>  		* rest. To handle the cpuhotplug callback unregister, we track
>  		* the number of nest pmus in "nest_pmus".
>  		*/
> -		spin_lock(&nest_init_lock);
> +		mutex_lock(&nest_init_lock);
>  		if (nest_pmus == 0) {
>  			ret = init_nest_pmu_ref();
>  			if (ret) {
> -				spin_unlock(&nest_init_lock);
> +				mutex_unlock(&nest_init_lock);
>  				kfree(per_nest_pmu_arr);
>  				per_nest_pmu_arr = NULL;
>  				goto err_free_mem;
> @@ -1808,7 +1808,7 @@ int init_imc_pmu(struct device_node *parent, struct imc_pmu *pmu_ptr, int pmu_id
>  			/* Register for cpu hotplug notification. */
>  			ret = nest_pmu_cpumask_init();
>  			if (ret) {
> -				spin_unlock(&nest_init_lock);
> +				mutex_unlock(&nest_init_lock);
>  				kfree(nest_imc_refc);
>  				kfree(per_nest_pmu_arr);
>  				per_nest_pmu_arr = NULL;
> @@ -1816,7 +1816,7 @@ int init_imc_pmu(struct device_node *parent, struct imc_pmu *pmu_ptr, int pmu_id
>  			}
>  		}
>  		nest_pmus++;
> -		spin_unlock(&nest_init_lock);
> +		mutex_unlock(&nest_init_lock);
>  		break;
>  	case IMC_DOMAIN_CORE:
>  		ret = core_imc_pmu_cpumask_init();
