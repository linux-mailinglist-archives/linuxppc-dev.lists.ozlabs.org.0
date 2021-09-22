Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFA341431B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 09:58:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDrJH30r7z2ynq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 17:58:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PTWpsXzK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PTWpsXzK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDrHZ45zHz2yKK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 17:57:29 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18M6CI3R002279
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 03:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=VQCyiYH9ei+W0WAzeYPJgzxa7mu1s55FLbRHwDOE9Es=;
 b=PTWpsXzKQNHtjQhH01PFGnAXSFGZrpxnu1nua6ycD+xmQ0wVa8bH+4zHvHbDMWTjtaT/
 wQCqZ/F0V0cGiJKH6MnvIGa1rRrcpYQxRv3Si7k94z+w4XDejxzxuNS0nn5cyxh/PMp5
 Qak2IPEiqV15792y/DX/GN8Wd4tbaGFQTyPF9KHAN+HCznLPXKxpUAwE+MGsKxmIOB9H
 5sPL4kAFpYxLobffOWAy8/059ORoemWDecCJmBIdTRvgg2B5ZOpgoYuFL6d1KHME2oPu
 jp0g+HCxz6Rs0s6aImGP2CZdAJutE14nxpMQCx9+IULqSzwB9uo0LHS7W6MLcakMMSoT vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b7y0t230t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 03:57:26 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18M7oKag024913
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 03:57:26 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b7y0t2308-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 03:57:26 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18M7m0sQ026042;
 Wed, 22 Sep 2021 07:57:24 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3b7q6quv8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 07:57:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18M7qVmM34013460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 07:52:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DE64AE053;
 Wed, 22 Sep 2021 07:57:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF5FCAE063;
 Wed, 22 Sep 2021 07:57:19 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Sep 2021 07:57:19 +0000 (GMT)
Date: Wed, 22 Sep 2021 13:27:18 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/paravirt: correct preempt debug splat in
 vcpu_is_preempted()
Message-ID: <20210922075718.GA2004@linux.vnet.ibm.com>
References: <20210921031213.2029824-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210921031213.2029824-1-nathanl@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lnYNZIPub06sGV5PBOSDZ037jyuFF5ul
X-Proofpoint-ORIG-GUID: 30covYLPOMs0shHZlrl4iOnfHtwfS5wo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_02,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220051
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nathan Lynch <nathanl@linux.ibm.com> [2021-09-20 22:12:13]:

> vcpu_is_preempted() can be used outside of preempt-disabled critical
> sections, yielding warnings such as:
> 
> BUG: using smp_processor_id() in preemptible [00000000] code: systemd-udevd/185
> caller is rwsem_spin_on_owner+0x1cc/0x2d0
> CPU: 1 PID: 185 Comm: systemd-udevd Not tainted 5.15.0-rc2+ #33
> Call Trace:
> [c000000012907ac0] [c000000000aa30a8] dump_stack_lvl+0xac/0x108 (unreliable)
> [c000000012907b00] [c000000001371f70] check_preemption_disabled+0x150/0x160
> [c000000012907b90] [c0000000001e0e8c] rwsem_spin_on_owner+0x1cc/0x2d0
> [c000000012907be0] [c0000000001e1408] rwsem_down_write_slowpath+0x478/0x9a0
> [c000000012907ca0] [c000000000576cf4] filename_create+0x94/0x1e0
> [c000000012907d10] [c00000000057ac08] do_symlinkat+0x68/0x1a0
> [c000000012907d70] [c00000000057ae18] sys_symlink+0x58/0x70
> [c000000012907da0] [c00000000002e448] system_call_exception+0x198/0x3c0
> [c000000012907e10] [c00000000000c54c] system_call_common+0xec/0x250
> 
> The result of vcpu_is_preempted() is always subject to invalidation by
> events inside and outside of Linux; it's just a best guess at a point in
> time. Use raw_smp_processor_id() to avoid such warnings.

Typically smp_processor_id() and raw_smp_processor_id() except for the
CONFIG_DEBUG_PREEMPT. In the CONFIG_DEBUG_PREEMPT case, smp_processor_id()
is actually debug_smp_processor_id(), which does all the checks.

I believe these checks in debug_smp_processor_id() are only valid for x86
case (aka cases were they have __smp_processor_id() defined.)
i.e x86 has a different implementation of _smp_processor_id() for stable and
unstable

> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: ca3f969dcb11 ("powerpc/paravirt: Use is_kvm_guest() in vcpu_is_preempted()")
> ---
>  arch/powerpc/include/asm/paravirt.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index bcb7b5f917be..e429aca566de 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -97,7 +97,14 @@ static inline bool vcpu_is_preempted(int cpu)
> 
>  #ifdef CONFIG_PPC_SPLPAR
>  	if (!is_kvm_guest()) {
> -		int first_cpu = cpu_first_thread_sibling(smp_processor_id());
> +		int first_cpu;
> +
> +		/*
> +		 * This is only a guess at best, and this function may be
> +		 * called with preemption enabled. Using raw_smp_processor_id()
> +		 * does not damage accuracy.
> +		 */
> +		first_cpu = cpu_first_thread_sibling(raw_smp_processor_id());
> 
>  		/*
>  		 * Preemption can only happen at core granularity. This CPU
> -- 
> 2.31.1
> 

How about something like the below?

diff --git a/include/linux/smp.h b/include/linux/smp.h
index 510519e8a1eb..8c669e8ceb73 100644
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -256,12 +256,14 @@ static inline int get_boot_cpu_id(void)
  */
 #ifndef __smp_processor_id
 #define __smp_processor_id(x) raw_smp_processor_id(x)
-#endif
-
+#else
 #ifdef CONFIG_DEBUG_PREEMPT
   extern unsigned int debug_smp_processor_id(void);
 # define smp_processor_id() debug_smp_processor_id()
-#else
+#endif
+#endif
+
+#ifndef smp_processor_id
 # define smp_processor_id() __smp_processor_id()
 #endif
 

-- 
Thanks and Regards
Srikar Dronamraju
