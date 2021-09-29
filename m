Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F052241BFF6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 09:31:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HK7Nh5xkBz3bXR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 17:31:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a0bct6qS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a0bct6qS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HK7MX5YM0z30Hj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 17:30:48 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T70RRm024894; 
 Wed, 29 Sep 2021 03:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=JqhpbbHOmdnqkip5sOdgoe5dcpB1zw/9oXqEPqvJ/Xc=;
 b=a0bct6qSm/9dlksFC6bJwWu+19VnpB0+IgoHPJf9GsBrwCh4sjyr5tcRkPg7fnm/PwUQ
 990Fk2Hxbh5VYcbbCwolofwPV30GWCJKH5BXQfPZmcSAzCnK8/kEEPE2/FtvBMpvUBZv
 56KYOLzbj6vct2jji2ldcD8yn8TD6O1s9rxiq9OCvV1jeifSDZcb+0OFaZYeswf5iwEl
 3SWicDRE5qytUfO3RCWYXxnP+y+L1rp8oMaLPx0Uzfg8m85gN2WxiZg6TVRrh8bONWl6
 RSDkWXuC+ZFroocBwoY7jcJlUDRJK/VwdQkc1n5xlzULHWatE/vOIU3KKWLu2qhgFE4U fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bckcj0naa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 03:30:44 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18T71G9m030625;
 Wed, 29 Sep 2021 03:30:44 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bckcj0n9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 03:30:44 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18T7C1tK003404;
 Wed, 29 Sep 2021 07:30:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3b9uda4v3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 07:30:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18T7Pa9t54919628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Sep 2021 07:25:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7321A4062;
 Wed, 29 Sep 2021 07:30:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A1E9A4072;
 Wed, 29 Sep 2021 07:30:37 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 29 Sep 2021 07:30:37 +0000 (GMT)
Date: Wed, 29 Sep 2021 13:00:36 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] powerpc/paravirt: correct preempt debug splat in
 vcpu_is_preempted()
Message-ID: <20210929073036.GG2004@linux.vnet.ibm.com>
References: <20210928214147.312412-1-nathanl@linux.ibm.com>
 <20210928214147.312412-3-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210928214147.312412-3-nathanl@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wObYIvn84P737sd0B9c164X1Mibqe6yJ
X-Proofpoint-ORIG-GUID: KePodetO-n8PMeKevSnQ2ghtg58EcLY7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_02,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290041
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

* Nathan Lynch <nathanl@linux.ibm.com> [2021-09-28 16:41:47]:

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
> The result of vcpu_is_preempted() is always used speculatively, and the
> function does not access per-cpu resources in a (Linux) preempt-unsafe way.
> Use raw_smp_processor_id() to avoid such warnings, adding explanatory
> comments.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: ca3f969dcb11 ("powerpc/paravirt: Use is_kvm_guest() in vcpu_is_preempted()")

Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

> ---
>  arch/powerpc/include/asm/paravirt.h | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index 39f173961f6a..eb7df559ae74 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -110,7 +110,23 @@ static inline bool vcpu_is_preempted(int cpu)
> 
>  #ifdef CONFIG_PPC_SPLPAR
>  	if (!is_kvm_guest()) {
> -		int first_cpu = cpu_first_thread_sibling(smp_processor_id());
> +		int first_cpu;
> +
> +		/*
> +		 * The result of vcpu_is_preempted() is used in a
> +		 * speculative way, and is always subject to invalidation
> +		 * by events internal and external to Linux. While we can
> +		 * be called in preemptable context (in the Linux sense),
> +		 * we're not accessing per-cpu resources in a way that can
> +		 * race destructively with Linux scheduler preemption and
> +		 * migration, and callers can tolerate the potential for
> +		 * error introduced by sampling the CPU index without
> +		 * pinning the task to it. So it is permissible to use
> +		 * raw_smp_processor_id() here to defeat the preempt debug
> +		 * warnings that can arise from using smp_processor_id()
> +		 * in arbitrary contexts.
> +		 */
> +		first_cpu = cpu_first_thread_sibling(raw_smp_processor_id());
> 
>  		/*
>  		 * The PowerVM hypervisor dispatches VMs on a whole core
> -- 
> 2.31.1
> 

-- 
Thanks and Regards
Srikar Dronamraju
