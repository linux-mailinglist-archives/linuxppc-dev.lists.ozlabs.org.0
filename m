Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D7A300AC8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 19:15:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMnVT0YvHzDrqc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jan 2021 05:15:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=raoni@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dqJBpCoY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMnSj6wPqzDqBL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jan 2021 05:13:37 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10MI1qkG173612; Fri, 22 Jan 2021 13:13:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=U39dKNINpnszgtsPTvaqB2w1RkgTyKzE9aUcGPHcAis=;
 b=dqJBpCoYDvcGmOq+YwIRsloxnfwgO/fTlaj6tZNzyTAzey5twN/pQc/Pb/1biPB20sJ7
 29OIwfuYaceRSgo6SveHHb8i/wmNM87CIQpls70/AE/+WGVKTT9MH8eNhlzfWT3by8v8
 /BRIta9eJiS2xVTPcb7ALoWnhUKKK1elloWWkKjYzNMrVSY8c298Wdzc3ADUlxBbSWYS
 SOPudhlTmr4t5kCxWFvmLUiqQTK/n65wjcA26sRBl+xxXqchf1iLObJxZoJ7AFqY2oWn
 Lc+J56O2vXlQxWpW9JKDxECSVp7KarrYkoqpjKgcpicx8ZvANVGj6ze3H/Y0iio2xSmp 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3682jgtkuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 13:13:20 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10MI26T1174721;
 Fri, 22 Jan 2021 13:13:20 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3682jgtkuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 13:13:20 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10MI9LPc001056;
 Fri, 22 Jan 2021 18:13:19 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 367k0mnrne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 18:13:19 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10MIDIgi24445316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 18:13:18 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 796CEBE04F;
 Fri, 22 Jan 2021 18:13:18 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D4B8BE056;
 Fri, 22 Jan 2021 18:13:16 +0000 (GMT)
Received: from work-tp (unknown [9.65.209.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 22 Jan 2021 18:13:16 +0000 (GMT)
Date: Fri, 22 Jan 2021 15:13:13 -0300
From: Raoni Fassina Firmino <raoni@linux.ibm.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH v2] powerpc/64/signal: balance return predictor stack in
 signal trampoline
Message-ID: <20210122181313.nk7ttzjujyqwjmpe@work-tp>
Mail-Followup-To: Florian Weimer <fweimer@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, musl@lists.openwall.com,
 libc-alpha@sourceware.org, linuxppc-dev@lists.ozlabs.org,
 Alan Modra <amodra@gmail.com>
References: <20200511101952.1463138-1-npiggin@gmail.com>
 <87im7pp5yl.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87im7pp5yl.fsf@oldenburg.str.redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_13:2021-01-22,
 2021-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220091
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
Cc: libc-alpha@sourceware.org, musl@lists.openwall.com,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 22, 2021 at 12:27:14PM +0100, AL glibc-alpha wrote:
> * Nicholas Piggin:
> 
> > diff --git a/arch/powerpc/kernel/vdso64/sigtramp.S b/arch/powerpc/kernel/vdso64/sigtramp.S
> > index a8cc0409d7d2..bbf68cd01088 100644
> > --- a/arch/powerpc/kernel/vdso64/sigtramp.S
> > +++ b/arch/powerpc/kernel/vdso64/sigtramp.S
> > @@ -6,6 +6,7 @@
> >   * Copyright (C) 2004 Benjamin Herrenschmuidt (benh@kernel.crashing.org), IBM Corp.
> >   * Copyright (C) 2004 Alan Modra (amodra@au.ibm.com)), IBM Corp.
> >   */
> > +#include <asm/cache.h>		/* IFETCH_ALIGN_BYTES */
> >  #include <asm/processor.h>
> >  #include <asm/ppc_asm.h>
> >  #include <asm/unistd.h>
> > @@ -14,21 +15,17 @@
> >  
> >  	.text
> >  
> > -/* The nop here is a hack.  The dwarf2 unwind routines subtract 1 from
> > -   the return address to get an address in the middle of the presumed
> > -   call instruction.  Since we don't have a call here, we artificially
> > -   extend the range covered by the unwind info by padding before the
> > -   real start.  */
> > -	nop
> >  	.balign 8
> > +	.balign IFETCH_ALIGN_BYTES
> >  V_FUNCTION_BEGIN(__kernel_sigtramp_rt64)
> > -.Lsigrt_start = . - 4
> > +.Lsigrt_start:
> > +	bctrl	/* call the handler */
> >  	addi	r1, r1, __SIGNAL_FRAMESIZE
> >  	li	r0,__NR_rt_sigreturn
> >  	sc
> >  .Lsigrt_end:
> >  V_FUNCTION_END(__kernel_sigtramp_rt64)
> > -/* The ".balign 8" above and the following zeros mimic the old stack
> > +/* The .balign 8 above and the following zeros mimic the old stack
> >     trampoline layout.  The last magic value is the ucontext pointer,
> >     chosen in such a way that older libgcc unwind code returns a zero
> >     for a sigcontext pointer.  */
> 
> As far as I understand it, this breaks cancellation handling on musl and
> future glibc because it is necessary to look at the signal delivery
> location to see if a system call sequence has result in an action, and
> that location is no longer in user code after this change.
> 
> We have a glibc test in preparation of our change, and it started
> failing:
> 
>   Linux 5.10 breaks sigcontext_get_pc on powerpc64
>   <https://sourceware.org/bugzilla/show_bug.cgi?id=27223>
> 
> Isn't it possible to avoid the return predictor desynchronization by
> adding the appropriate hint?

I also caught this regression, I believe it was introduced in the kernel
5.9.

I don't know enough to comment on Florian suggestion, but I am working
on some possible fixes:

On the kernel side we can keep `__kernel_sigtramp_rt64` in the original
place after `bctrl` and add a new symbol so the kernel can jump to the
right place before `bctrl`.  This would ensure backward compatibility.

On the other side, this change exposed how fragile `backtrace()` is to
any changes in the trampoline code, which the libc has no control over
in this case. So maybe there is something that can be improved in how
backtrace decides that the return-address is to the trampoline. My fist
option is to test a range, after `__kernel_sigtramp_rt64` so see if the
address is inside the routine. This would be better if we can know the
size of the function, I know that the vdso.so has this info in the elf
but I don't know if it is exposed to the glibc.

As Nicholas mentioned in his patch, GDB seems to keep working just fine,
it is seems that GDB uses some heuristics to match the surround code of
the return address to identify that it is the trampoline code. So maybe
other option is to do something similar.


o/
Raoni Fassina
