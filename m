Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E39426A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 08:27:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B9VxfqA1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYhwj61LBz3d9G
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 16:27:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B9VxfqA1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYhvc3T9Bz3clp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 16:26:52 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V4SsQ6011474;
	Wed, 31 Jul 2024 06:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	4OG35NXvwNMhLy4X5REoSl5JzXhObMRFRGyHbuE3FKg=; b=B9VxfqA1ucXxgs0U
	EW24btUzGGNRbZiMcaY7Bxc/WcqPvjcwfJl7Q4k+G4kuYVCwOIlU4BQFs9zFDGzi
	Z2k2PRq4fGbClSACYdeV+Mr3wHTMSjzvDz6oQwG12IUVEfb1Rt0d9CBpSj//kPu9
	VD0qKP0jrK2Gya7gIDt98kDGSX875d1bXgj96YkkmnyjlnFmd58Q4ou9QjIgLffT
	mgQS05P8NA5ETQ6LfIQQDjSGuRGpFe1q/BKG1lpke1n5QWfm0Aee+Gw+bGjbC3M3
	XrKCYkKytu85ejkRJV+/YLH2jZdzI2Saf73n+DhiPlnkEd2yxEzKv+g4QcU1atg5
	5JdX5w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40qe9eg6jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:26:18 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46V6QI8o008660;
	Wed, 31 Jul 2024 06:26:18 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40qe9eg6jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:26:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46V5h5oj029094;
	Wed, 31 Jul 2024 06:26:17 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40nbm0swr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:26:17 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46V6QETD18874998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Jul 2024 06:26:16 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1E5B58068;
	Wed, 31 Jul 2024 06:26:13 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B74D258061;
	Wed, 31 Jul 2024 06:26:08 +0000 (GMT)
Received: from [9.124.31.50] (unknown [9.124.31.50])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 31 Jul 2024 06:26:08 +0000 (GMT)
Message-ID: <23b30f0a-866a-4c45-aa71-f0df1c2935b3@linux.ibm.com>
Date: Wed, 31 Jul 2024 11:56:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] cpu/SMT: Enable SMT only if a core is online
To: "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>
References: <20240731030126.956210-1-nysal@linux.ibm.com>
 <20240731030126.956210-2-nysal@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20240731030126.956210-2-nysal@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XYVIPhVIS1GljyGJt_5lHf8NHF04FgP-
X-Proofpoint-ORIG-GUID: pCGvPoIspIlCKu4_987p3P7y-eSCJ4Ac
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_03,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310046
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Laurent Dufour <ldufour@linux.ibm.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/31/24 8:31 AM, Nysal Jan K.A. wrote:
> From: "Nysal Jan K.A" <nysal@linux.ibm.com>
> 
> If a core is offline then enabling SMT should not online CPUs of
> this core. By enabling SMT, what is intended is either changing the SMT
> value from "off" to "on" or setting the SMT level (threads per core) from a
> lower to higher value.
> 
> On PowerPC the ppc64_cpu utility can be used, among other things, to
> perform the following functions:
> 
> ppc64_cpu --cores-on                # Get the number of online cores
> ppc64_cpu --cores-on=X              # Put exactly X cores online
> ppc64_cpu --offline-cores=X[,Y,...] # Put specified cores offline
> ppc64_cpu --smt={on|off|value}      # Enable, disable or change SMT level
> 
> If the user has decided to offline certain cores, enabling SMT should
> not online CPUs in those cores. This patch fixes the issue and changes
> the behaviour as described, by introducing an arch specific function
> topology_is_core_online(). It is currently implemented only for PowerPC.
> 
> Fixes: 73c58e7e1412 ("powerpc: Add HOTPLUG_SMT support")
> Reported-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> Closes: https://groups.google.com/g/powerpc-utils-devel/c/wrwVzAAnRlI/m/5KJSoqP4BAAJ
> Signed-off-by: Nysal Jan K.A <nysal@linux.ibm.com>
> ---
>  Documentation/ABI/testing/sysfs-devices-system-cpu |  3 ++-
>  kernel/cpu.c                                       | 12 +++++++++++-
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> index 325873385b71..de725ca3be82 100644
> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> @@ -562,7 +562,8 @@ Description:	Control Symmetric Multi Threading (SMT)
>  			 ================ =========================================
>  
>  			 If control status is "forceoff" or "notsupported" writes
> -			 are rejected.
> +			 are rejected. Note that enabling SMT on PowerPC skips
> +			 offline cores.
>  
>  What:		/sys/devices/system/cpu/cpuX/power/energy_perf_bias
>  Date:		March 2019
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index 1209ddaec026..b1fd2a3db91a 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -2689,6 +2689,16 @@ int cpuhp_smt_disable(enum cpuhp_smt_control ctrlval)
>  	return ret;
>  }
>  
> +/**
> + * Check if the core a CPU belongs to is online
> + */
> +#if !defined(topology_is_core_online)
> +static inline bool topology_is_core_online(unsigned int cpu)
> +{
> +	return true;
> +}
> +#endif
> +
>  int cpuhp_smt_enable(void)
>  {
>  	int cpu, ret = 0;
> @@ -2699,7 +2709,7 @@ int cpuhp_smt_enable(void)
>  		/* Skip online CPUs and CPUs on offline nodes */
>  		if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
>  			continue;
> -		if (!cpu_smt_thread_allowed(cpu))
> +		if (!cpu_smt_thread_allowed(cpu) || !topology_is_core_online(cpu))
>  			continue;
>  		ret = _cpu_up(cpu, 0, CPUHP_ONLINE);
>  		if (ret)

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
