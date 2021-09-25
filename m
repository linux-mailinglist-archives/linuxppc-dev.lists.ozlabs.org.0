Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C13C0417E8E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 02:10:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGTnr4m3sz30JT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 10:10:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a3C1lS1x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a3C1lS1x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGTn40wgqz2yPj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Sep 2021 10:10:15 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ONdMSA006024; 
 Fri, 24 Sep 2021 20:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=SZgwi4Qbs5knRIpuI+lxKMhCO8MYHBQOg+HE2jxYuX4=;
 b=a3C1lS1xcuL1PeliM9SJECsYUduIJPWUbfryIx7My30xw6BF9MxzOZAOtl9c53ojjqF3
 Ev93NJ9gXhOZZuO5xIUbwAvhe7XFrrBQohSIJT3SHzkBxqye52TJ6XIfk8rvp/26zwty
 +9sZ7qE0YLXXKzN9kHmkkMgfptsY1ZESimQnoO8b9pnWbTtMtHLmwrbEqBX41QHMso3l
 fIO2Zb9LkUYYmF7wvxXlQv0fllqe7b/8mUb60Hg5G4r3nQL0KFeaVIJGRD1WIvnDsiSI
 tABtl4vL7oBWF7E/AlevCLyFaG7/s84C7vVTKjJFEC/VcBnhGPlCRe04TD5xbqvbuQzY AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b9knf5s1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 20:10:06 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18ONmfdj000476;
 Fri, 24 Sep 2021 20:10:06 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b9knf5s1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 20:10:06 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18P028Ak016191;
 Sat, 25 Sep 2021 00:10:05 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 3b93g9q1s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Sep 2021 00:10:05 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18P0A3YV17760520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 25 Sep 2021 00:10:04 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBC5A6A06B;
 Sat, 25 Sep 2021 00:10:03 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA67F6A067;
 Sat, 25 Sep 2021 00:10:03 +0000 (GMT)
Received: from localhost (unknown [9.211.135.102])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 25 Sep 2021 00:10:03 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Srikar Dronamraju
 <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/paravirt: correct preempt debug splat in
 vcpu_is_preempted()
In-Reply-To: <87pmsylli8.fsf@mpe.ellerman.id.au>
References: <20210921031213.2029824-1-nathanl@linux.ibm.com>
 <20210922075718.GA2004@linux.vnet.ibm.com> <87ee9gob07.fsf@linux.ibm.com>
 <20210922163351.GB2004@linux.vnet.ibm.com> <87bl4ko1cp.fsf@linux.ibm.com>
 <874kabn40z.fsf@mpe.ellerman.id.au>
 <20210923180224.GD2004@linux.vnet.ibm.com>
 <87pmsylli8.fsf@mpe.ellerman.id.au>
Date: Fri, 24 Sep 2021 19:10:03 -0500
Message-ID: <878rzlplb8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: F70uDIZBePtlGs2FxmWmASKJLLt4F98e
X-Proofpoint-GUID: JCxhnoqCCCcLyBO5AzNtv2n7YWMdYq48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_05,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109240147
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>> * Michael Ellerman <mpe@ellerman.id.au> [2021-09-23 17:29:32]:
>>
>>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> > Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>>> >
>>> >> * Nathan Lynch <nathanl@linux.ibm.com> [2021-09-22 11:01:12]:
>>> >>
>>> >>> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> ...
>>> >> Or can I understand how debug_smp_processor_id() is useful if
>>> >> __smp_processor_id() is defined as raw_smp_processor_id()?
>>> 
>>> debug_smp_processor_id() is useful on powerpc, as well as other arches,
>>> because it checks that we're in a context where the processor id won't
>>> change out from under us.
>>> 
>>> eg. something like this is unsafe:
>>> 
>>>   int counts[NR_CPUS];
>>>   int tmp, cpu;
>>>   
>>>   cpu = smp_processor_id();
>>>   tmp = counts[cpu];
>>>   				<- preempted here and migrated to another CPU
>>>   counts[cpu] = tmp + 1;
>>> 
>>
>> If lets say the above call was replaced by raw_smp_processor_id(), how would
>> it avoid the preemption / migration to another CPU?
>>
>> Replacing it with raw_smp_processor_id() may avoid, the debug splat but the
>> underlying issue would still remain as is. No?
>
> Correct.
>
> Using raw_smp_processor_id() is generally the wrong answer. For this
> example the correct fix is to disable preemption around the code, eg:
>
>    int counts[NR_CPUS];
>    int tmp, cpu;
>    
>    preempt_disable()
>
>    cpu = smp_processor_id();
>    tmp = counts[cpu];
>    counts[cpu] = tmp + 1;
>
>    preempt_enable();
>
>
> For the original issue I think it is OK to use raw_smp_processor_id(),
> because we're already doing a racy check of whether another CPU has been
> preempted by the hypervisor.
>
>         if (!is_kvm_guest()) {
>                 int first_cpu = cpu_first_thread_sibling(smp_processor_id());
>
>                 if (cpu_first_thread_sibling(cpu) == first_cpu)
>                         return false;
>         }
>
> We could disable preemption around that, eg:
>
>         if (!is_kvm_guest()) {
>                 int first_cpu;
>                 bool is_sibling;
>
>                 preempt_disable();
>                 first_cpu = cpu_first_thread_sibling(smp_processor_id());
>                 is_sibling = (cpu_first_thread_sibling(cpu) == first_cpu)
>                 preempt_enable();
>
>                 // Can be preempted here
>
>                 if (is_sibling)
>                     return false;
>         }
>
> But before we return we could be preempted, and then is_sibling is no
> longer necessarily correct. So that doesn't really gain us anything.
>
> The only way to make that result stable is to disable preemption in the
> caller, but most callers don't want to AFAICS, because they know they're
> doing a racy check to begin with.

I'll add that one way I think about this is that when I choose
smp_processor_id(), I am making a claim about the context in which it is
used, and when I use raw_smp_processor_id() I am making a different
claim.

smp_processor_id() => I am sampling the CPU index in a critical section
where the result equals the CPU that executes the entire critical
section, and I am relying on that property for the section's
correctness. This claim is verified by debug_smp_processor_id() when
DEBUG_PREEMPT=y.

raw_smp_processor_id() => I am sampling the CPU index and using the
result in a way that is safe even if it differs from the CPU(s) on which
the surrounding code actually executes.

This framing doesn't cover all situations, but I've found it to be
generally useful.
