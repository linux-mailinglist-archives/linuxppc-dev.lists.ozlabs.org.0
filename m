Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7259D414E32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 18:34:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF3mR2VXwz302D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 02:34:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KeR6LnCY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KeR6LnCY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF3lb4r9tz2yP3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 02:34:02 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18MFVCvH010392
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 12:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=AgdUYsal7sJkhd6dph81Ck0eONPaurQVwqNBeXugRo0=;
 b=KeR6LnCYk2sPW/AZ2YS/+jA6mR11TU8YZL5btHwsziGkVUZqjIRFnONM7ocZAg+YW408
 xL0IZmv4bRDqeOOxsklvvUL5f+U+IrJt7Ch9bxT7mdH3PCHZggt75mSR6O41vtTdE8m0
 Ld96JUoK2kH91mMqCPoHUNQuIRdeot7ShhsATM9sbBEoHDUGigSqa6jLlL+6Nc55dWe6
 lSR/Uudc5TGqFeNzLdF7KrB23k3qvczbu2WfRea9pjx517bTCRNbk9gErAc/Pu9nklbA
 fOjBTdkUMRGWLRBPYw4YN+zv1PRp639FWdMvc8+DvITOIVGr1Io9/KYnI6GKPgRvzIb6 wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b876psk28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 12:33:59 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18MFdllQ011062
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 12:33:59 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b876psk1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 12:33:59 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18MGRw7F032174;
 Wed, 22 Sep 2021 16:33:57 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3b7q6ps631-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 16:33:56 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18MGXsT566781498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Sep 2021 16:33:54 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D99AA4054;
 Wed, 22 Sep 2021 16:33:54 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38C0CA405F;
 Wed, 22 Sep 2021 16:33:53 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Sep 2021 16:33:53 +0000 (GMT)
Date: Wed, 22 Sep 2021 22:03:51 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/paravirt: correct preempt debug splat in
 vcpu_is_preempted()
Message-ID: <20210922163351.GB2004@linux.vnet.ibm.com>
References: <20210921031213.2029824-1-nathanl@linux.ibm.com>
 <20210922075718.GA2004@linux.vnet.ibm.com>
 <87ee9gob07.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87ee9gob07.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aGptHBu72SSwnoxZx9xSAFg1P20b0yrx
X-Proofpoint-ORIG-GUID: T6o19Uw_vAQlFl9Nowy6g0sCzQM1pFRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_06,2021-09-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=789 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220112
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

* Nathan Lynch <nathanl@linux.ibm.com> [2021-09-22 11:01:12]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > * Nathan Lynch <nathanl@linux.ibm.com> [2021-09-20 22:12:13]:
> >
> >> vcpu_is_preempted() can be used outside of preempt-disabled critical
> >> sections, yielding warnings such as:
> >> 
> >> BUG: using smp_processor_id() in preemptible [00000000] code: systemd-udevd/185
> >> caller is rwsem_spin_on_owner+0x1cc/0x2d0
> >> CPU: 1 PID: 185 Comm: systemd-udevd Not tainted 5.15.0-rc2+ #33
> >> Call Trace:
> >> [c000000012907ac0] [c000000000aa30a8] dump_stack_lvl+0xac/0x108 (unreliable)
> >> [c000000012907b00] [c000000001371f70] check_preemption_disabled+0x150/0x160
> >> [c000000012907b90] [c0000000001e0e8c] rwsem_spin_on_owner+0x1cc/0x2d0
> >> [c000000012907be0] [c0000000001e1408] rwsem_down_write_slowpath+0x478/0x9a0
> >> [c000000012907ca0] [c000000000576cf4] filename_create+0x94/0x1e0
> >> [c000000012907d10] [c00000000057ac08] do_symlinkat+0x68/0x1a0
> >> [c000000012907d70] [c00000000057ae18] sys_symlink+0x58/0x70
> >> [c000000012907da0] [c00000000002e448] system_call_exception+0x198/0x3c0
> >> [c000000012907e10] [c00000000000c54c] system_call_common+0xec/0x250
> >> 
> >> The result of vcpu_is_preempted() is always subject to invalidation by
> >> events inside and outside of Linux; it's just a best guess at a point in
> >> time. Use raw_smp_processor_id() to avoid such warnings.
> >
> > Typically smp_processor_id() and raw_smp_processor_id() except for the
> > CONFIG_DEBUG_PREEMPT.
> 
> Sorry, I don't follow...

I meant, Unless CONFIG_DEBUG_PREEMPT, smp_processor_id() is defined as
raw_processor_id().

> 
> > In the CONFIG_DEBUG_PREEMPT case, smp_processor_id()
> > is actually debug_smp_processor_id(), which does all the checks.
> 
> Yes, OK.
> 
> > I believe these checks in debug_smp_processor_id() are only valid for x86
> > case (aka cases were they have __smp_processor_id() defined.)
> 
> Hmm, I am under the impression that the checks in
> debug_smp_processor_id() are valid regardless of whether the arch
> overrides __smp_processor_id().

From include/linux/smp.h

/*
 * Allow the architecture to differentiate between a stable and unstable read.
 * For example, x86 uses an IRQ-safe asm-volatile read for the unstable but a
 * regular asm read for the stable.
 */
#ifndef __smp_processor_id
#define __smp_processor_id(x) raw_smp_processor_id(x)
#endif

As far as I see, only x86 has a definition of __smp_processor_id.
So for archs like Powerpc, __smp_processor_id(), is always
defined as raw_smp_processor_id(). Right?

I would think debug_smp_processor_id() would be useful if __smp_processor_id()
is different from raw_smp_processor_id(). Do note debug_smp_processor_id() 
calls raw_smp_processor_id().

Or can I understand how debug_smp_processor_id() is useful if
__smp_processor_id() is defined as raw_smp_processor_id()?

> I think the stack trace here correctly identifies an incorrect use of
> smp_processor_id(), and the call site needs to be changed. Do you
> disagree?

Yes the stack_trace shows that debug_smp_processor_id(). However what I want 
to understand is why should we even call debug_smp_processor_id(), when our
__smp_processor_id() is defined as raw_smp_processor_id().

-- 
Thanks and Regards
Srikar Dronamraju
