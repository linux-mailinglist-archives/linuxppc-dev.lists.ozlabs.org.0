Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F2F827CB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 01:07:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462YMM58xNzDqbB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 09:07:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462YKQ3nrMzDqMM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 09:06:01 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x75N2wvB144249
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 5 Aug 2019 19:05:57 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u6u1wduaw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Aug 2019 19:05:57 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <tyreld@linux.ibm.com>;
 Tue, 6 Aug 2019 00:05:56 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 6 Aug 2019 00:05:54 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x75N5r8e52232676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Aug 2019 23:05:53 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDD64AC05E;
 Mon,  5 Aug 2019 23:05:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8143FAC059;
 Mon,  5 Aug 2019 23:05:53 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.70.82.25])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  5 Aug 2019 23:05:53 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] powerpc/rtas: use device model APIs and
 serialization during LPM
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20190802192926.19277-1-nathanl@linux.ibm.com>
 <20190802192926.19277-2-nathanl@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Date: Mon, 5 Aug 2019 16:05:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190802192926.19277-2-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19080523-0072-0000-0000-000004509070
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011557; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01242630; UDB=6.00655452; IPR=6.01024087; 
 MB=3.00028057; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-05 23:05:55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080523-0073-0000-0000-00004CC19545
Message-Id: <5e98c3c9-eab0-b08a-50ee-b8bb9b9ad2dd@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-05_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908050232
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/2/19 12:29 PM, Nathan Lynch wrote:
> The LPAR migration implementation and userspace-initiated cpu hotplug
> can interleave their executions like so:
> 
> 1. Set cpu 7 offline via sysfs.
> 
> 2. Begin a partition migration, whose implementation requires the OS
>    to ensure all present cpus are online; cpu 7 is onlined:
> 
>      rtas_ibm_suspend_me -> rtas_online_cpus_mask -> cpu_up
> 
>    This sets cpu 7 online in all respects except for the cpu's
>    corresponding struct device; dev->offline remains true.
> 
> 3. Set cpu 7 online via sysfs. _cpu_up() determines that cpu 7 is
>    already online and returns success. The driver core (device_online)
>    sets dev->offline = false.
> 
> 4. The migration completes and restores cpu 7 to offline state:
> 
>      rtas_ibm_suspend_me -> rtas_offline_cpus_mask -> cpu_down
> 
> This leaves cpu7 in a state where the driver core considers the cpu
> device online, but in all other respects it is offline and
> unused. Attempts to online the cpu via sysfs appear to succeed but the
> driver core actually does not pass the request to the lower-level
> cpuhp support code. This makes the cpu unusable until the cpu device
> is manually set offline and then online again via sysfs.
> 
> Instead of directly calling cpu_up/cpu_down, the migration code should
> use the higher-level device core APIs to maintain consistent state and
> serialize operations.
> 
> Fixes: 120496ac2d2d ("powerpc: Bring all threads online prior to migration/hibernation")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 5faf0a64c92b..05824eb4323b 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -871,15 +871,17 @@ static int rtas_cpu_state_change_mask(enum rtas_cpu_state state,
>  		return 0;
> 
>  	for_each_cpu(cpu, cpus) {
> +		struct device *dev = get_cpu_device(cpu);
> +
>  		switch (state) {
>  		case DOWN:
> -			cpuret = cpu_down(cpu);
> +			cpuret = device_offline(dev);
>  			break;
>  		case UP:
> -			cpuret = cpu_up(cpu);
> +			cpuret = device_online(dev);

Not that I have a problem with using the core device api, but as an FYI we had
discussed in the past introducing one shot functions in kernel/cpu.c for doing
our take down, bring up where cpu_update_maps() can be held for the whole
process. The thought was maybe it would be useful generically being able to
online/offline a bulk subset.

>  			break;
>  		}
> -		if (cpuret) {
> +		if (cpuret < 0) {
>  			pr_debug("%s: cpu_%s for cpu#%d returned %d.\n",
>  					__func__,
>  					((state == UP) ? "up" : "down"),
> @@ -968,6 +970,8 @@ int rtas_ibm_suspend_me(u64 handle)
>  	data.token = rtas_token("ibm,suspend-me");
>  	data.complete = &done;
> 
> +	lock_device_hotplug();
> +

Does taking the device hotplug lock suffice to prevent races with sysfs attempts
to hotplug (on/off) cpus? And if so we can strip out the code that checks the
mask to see if we raced, correct?

-Tyrel

>  	/* All present CPUs must be online */
>  	cpumask_andnot(offline_mask, cpu_present_mask, cpu_online_mask);
>  	cpuret = rtas_online_cpus_mask(offline_mask);
> @@ -1006,6 +1010,7 @@ int rtas_ibm_suspend_me(u64 handle)
>  				__func__);
> 
>  out:
> +	unlock_device_hotplug();
>  	free_cpumask_var(offline_mask);
>  	return atomic_read(&data.error);
>  }
> 

