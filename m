Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 050DD4164CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 20:08:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFjnn64V5z2ymx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 04:08:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QUvHQqmA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QUvHQqmA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFjn62mrqz2ybC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 04:07:37 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NHgxD3007990; 
 Thu, 23 Sep 2021 14:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=z5s7dzr+PRlJsiCbsJostju2qEbcfwMzYkWfC8lyxD4=;
 b=QUvHQqmAl0qJQkvzJZG1N5nz8zTjA/SJ0/KH5axuGHoFEyG6OuTgxxAeivTmuevZLwqM
 phkFkkGDzCybivtcZVI0u+wc3LvHchFeLKC8Vm+fvifkdU2o0/SFWvBz44vnsqtB1z03
 yHgmb/IE9njEDWXdidEx9B2eghsQA0aP9NDQkddNLhMtODph/vXAGqYPXJnMyFsW0v75
 +jbmqzNDFRhKKV9xsQV8QphRRfFCqxwh6oDxRt4D3LO4ISsJFQrDbvemM8Xqa0+bAd5G
 MkrN3sXcU67qau2ArUJEXzKkxjxMflGuMU8VqQZG0Z8xRHxRS7PklIwxufpkqaeqWVXS qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b8pr1dtyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 14:07:32 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18NHRnWP029684;
 Thu, 23 Sep 2021 14:07:32 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b8pr1dtxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 14:07:31 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18NHq8jH023002;
 Thu, 23 Sep 2021 18:02:29 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3b7q6rde91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 18:02:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18NI2Q0U41026026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Sep 2021 18:02:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFEC9A4064;
 Thu, 23 Sep 2021 18:02:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BD3DA406F;
 Thu, 23 Sep 2021 18:02:25 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 23 Sep 2021 18:02:25 +0000 (GMT)
Date: Thu, 23 Sep 2021 23:32:24 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/paravirt: correct preempt debug splat in
 vcpu_is_preempted()
Message-ID: <20210923180224.GD2004@linux.vnet.ibm.com>
References: <20210921031213.2029824-1-nathanl@linux.ibm.com>
 <20210922075718.GA2004@linux.vnet.ibm.com>
 <87ee9gob07.fsf@linux.ibm.com>
 <20210922163351.GB2004@linux.vnet.ibm.com>
 <87bl4ko1cp.fsf@linux.ibm.com> <874kabn40z.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <874kabn40z.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vXhiBjYJuBxeXtJ-YngKsw83A77rJWC-
X-Proofpoint-GUID: rGU4z-1GRnzLzP37SPqrWLHNuBpY7nfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_05,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=947 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109230107
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [2021-09-23 17:29:32]:

> Nathan Lynch <nathanl@linux.ibm.com> writes:
> > Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> >
> >> * Nathan Lynch <nathanl@linux.ibm.com> [2021-09-22 11:01:12]:
> >>
> >>> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> >>> > * Nathan Lynch <nathanl@linux.ibm.com> [2021-09-20 22:12:13]:
> >>> >
> >>> >> vcpu_is_preempted() can be used outside of preempt-disabled critical
> >>> >> sections, yielding warnings such as:
> >>> >> 
> >>> >> BUG: using smp_processor_id() in preemptible [00000000] code: systemd-udevd/185
> >>> >> caller is rwsem_spin_on_owner+0x1cc/0x2d0
> >>> >> CPU: 1 PID: 185 Comm: systemd-udevd Not tainted 5.15.0-rc2+ #33
> >>> >> Call Trace:
> >>> >> [c000000012907ac0] [c000000000aa30a8] dump_stack_lvl+0xac/0x108 (unreliable)
> >>> >> [c000000012907b00] [c000000001371f70] check_preemption_disabled+0x150/0x160
> >>> >> [c000000012907b90] [c0000000001e0e8c] rwsem_spin_on_owner+0x1cc/0x2d0
> >>> >> [c000000012907be0] [c0000000001e1408] rwsem_down_write_slowpath+0x478/0x9a0
> >>> >> [c000000012907ca0] [c000000000576cf4] filename_create+0x94/0x1e0
> >>> >> [c000000012907d10] [c00000000057ac08] do_symlinkat+0x68/0x1a0
> >>> >> [c000000012907d70] [c00000000057ae18] sys_symlink+0x58/0x70
> >>> >> [c000000012907da0] [c00000000002e448] system_call_exception+0x198/0x3c0
> >>> >> [c000000012907e10] [c00000000000c54c] system_call_common+0xec/0x250
> >>> >> 
> >>> >> The result of vcpu_is_preempted() is always subject to invalidation by
> >>> >> events inside and outside of Linux; it's just a best guess at a point in
> >>> >> time. Use raw_smp_processor_id() to avoid such warnings.
> >>> >
> >>> > Typically smp_processor_id() and raw_smp_processor_id() except for the
> >>> > CONFIG_DEBUG_PREEMPT.
> >>> 
> >>> Sorry, I don't follow...
> >>
> >> I meant, Unless CONFIG_DEBUG_PREEMPT, smp_processor_id() is defined as
> >> raw_processor_id().
> >>
> >>> 
> >>> > In the CONFIG_DEBUG_PREEMPT case, smp_processor_id()
> >>> > is actually debug_smp_processor_id(), which does all the checks.
> >>> 
> >>> Yes, OK.
> >>> 
> >>> > I believe these checks in debug_smp_processor_id() are only valid for x86
> >>> > case (aka cases were they have __smp_processor_id() defined.)
> >>> 
> >>> Hmm, I am under the impression that the checks in
> >>> debug_smp_processor_id() are valid regardless of whether the arch
> >>> overrides __smp_processor_id().
> >>
> >> From include/linux/smp.h
> >>
> >> /*
> >>  * Allow the architecture to differentiate between a stable and unstable read.
> >>  * For example, x86 uses an IRQ-safe asm-volatile read for the unstable but a
> >>  * regular asm read for the stable.
> >>  */
> >> #ifndef __smp_processor_id
> >> #define __smp_processor_id(x) raw_smp_processor_id(x)
> >> #endif
> >>
> >> As far as I see, only x86 has a definition of __smp_processor_id.
> >> So for archs like Powerpc, __smp_processor_id(), is always
> >> defined as raw_smp_processor_id(). Right?
> >
> > Sure, yes.
> >
> >> I would think debug_smp_processor_id() would be useful if __smp_processor_id()
> >> is different from raw_smp_processor_id(). Do note debug_smp_processor_id() 
> >> calls raw_smp_processor_id().
> 
> Agree.
> 
> > I do not think the utility of debug_smp_processor_id() is related to
> > whether the arch defines __smp_processor_id().
> >
> >> Or can I understand how debug_smp_processor_id() is useful if
> >> __smp_processor_id() is defined as raw_smp_processor_id()?
> 
> debug_smp_processor_id() is useful on powerpc, as well as other arches,
> because it checks that we're in a context where the processor id won't
> change out from under us.
> 
> eg. something like this is unsafe:
> 
>   int counts[NR_CPUS];
>   int tmp, cpu;
>   
>   cpu = smp_processor_id();
>   tmp = counts[cpu];
>   				<- preempted here and migrated to another CPU
>   counts[cpu] = tmp + 1;
> 

If lets say the above call was replaced by raw_smp_processor_id(), how would
it avoid the preemption / migration to another CPU?

Replacing it with raw_smp_processor_id() may avoid, the debug splat but the
underlying issue would still remain as is. No?

> 
> > So, for powerpc with DEBUG_PREEMPT unset, a call to smp_procesor_id()
> > expands to __smp_processor_id() which expands to raw_smp_processor_id(),
> > avoiding the preempt safety checks. This is working as intended.
> >
> > For powerpc with DEBUG_PREEMPT=y, a call to smp_processor_id() expands
> > to the out of line call to debug_smp_processor_id(), which calls
> > raw_smp_processor_id() and performs the checks, warning if called in an
> > inappropriate context, as seen here. Also working as intended.
> >
> > AFAICT __smp_processor_id() is a performance/codegen-oriented hook, and
> > not really related to the debug facility. Please see 9ed7d75b2f09d
> > ("x86/percpu: Relax smp_processor_id()").
> 
> Yeah good find.
> 
> cheers

-- 
Thanks and Regards
Srikar Dronamraju
