Return-Path: <linuxppc-dev+bounces-14810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C387FCC3AD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 15:43:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW06024rLz2yDY;
	Wed, 17 Dec 2025 01:43:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765896184;
	cv=none; b=eUoRETjJcAQhTfQaVW4a8MMQaCoSwGlAMDkInkRnn18Ps5suIKciqfPqGTZ91j5CB+dzTT6SvKNAsyUcyyZrsDAN0HLCeP6ozemLFvv/Tqq0b8NN9Wwb2quAe3rWDvTFvewXI8fjQy/ALUrzXK1FGTz4xmOIwlB/aBTWHXyNZFVzMrbblrxLDzVknQyaGpzUmQeKBdDx1UE1+z+XbPYuMmJTO5id5+YGi06MaSUXzp4mX8pAaF6mPhP8P0IJT8kIdSnAL+xEGhr3QzW4jaXuEb5JXM6u7UqRA/XDk2EouftLMF8Np9rdyuOnzRGTcpjme018xoIfcxdmkuwZ+XReSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765896184; c=relaxed/relaxed;
	bh=y0oNyoHx5MrEqswbHRCKSh8ZceJBKkuGaNlD5ECeAjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4O1n9iOT1UFsLP+pH55iWaw/UdocaMUt+uF1rjgkHB3+X9ADvybsUYl6Fx2o+NzJleWLao9k5fsBUR/0XJPCCHCAy+lIzCdd6CMMLRvkCwc7tgUoQv/tlrHc07AOZEwndPZbz/EohsdEDSiYSlvpC9jecWcyBb2vFPqITPfR0Jjt/A7T5zeEIJtZeiRZxiHTBvgrdzR3qEn90K9gZ2J/yhavdF5VEVoV8MMdL7yHDTn/nsZapxEQdtVjsVnQrgjLIMm/hsalY3EflpntxlUZ6VdIJNSuEPrkatH6Pd1KxP9W+ESnQvx+DO34+r1r+KOBuh5CJgKZK7FgkQ4yTVrpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p5OEeHXI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p5OEeHXI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW05z0f5Rz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 01:43:02 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGBxPD1015930;
	Tue, 16 Dec 2025 14:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=y0oNyo
	Hx5MrEqswbHRCKSh8ZceJBKkuGaNlD5ECeAjI=; b=p5OEeHXI6JfldaO9OO4LFQ
	1pCk/GdixT+nZpAS6piBCwcXLrv81shii2TL7cG1LrHTJXzi7GDCidMuQFTuXXSm
	Rol3VLKrAz4GKo8f/vi5w36BavkUV3perxWIa9tnczoqYXlbMfyOLSf2n1/jo3fD
	SPjMbD63jRg2+lk5XtcaecOSe8qhVnSss6gNrOUEfEcIs2dxtWOf2pTEap+W1f6p
	mfUgMBlygeRs6ra0tJwyxAG8dQ3BM0vmqILgb0Q3rnuyVeJiSRAwED6rBKE9xniD
	onnenw8h2gfYbRueSYslv9Itm4qrlV4Nt02Vz/s3+XOO804wdw2Uh3BqF62l9g+g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt1evut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 14:42:23 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BGET5P5018791;
	Tue, 16 Dec 2025 14:42:23 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt1evun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 14:42:23 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGE7ZsY003049;
	Tue, 16 Dec 2025 14:42:22 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kfn4je5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 14:42:22 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BGEgIeX48890320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 14:42:18 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 654AC20043;
	Tue, 16 Dec 2025 14:42:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1647520040;
	Tue, 16 Dec 2025 14:42:12 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.210.89])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Dec 2025 14:42:11 +0000 (GMT)
Date: Tue, 16 Dec 2025 20:12:09 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
        wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
        sshegde@linux.ibm.com, charlie@rivosinc.com, macro@orcam.me.uk,
        akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
        ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] powerpc: Prepare to build with generic entry/exit
 framework
Message-ID: <qulxc3toxkjsiljvwz23hixlxe4qrnbzekv4oqtmuch5kgzsaj@xv6oqpmhbi5w>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-3-mkchauras@linux.ibm.com>
 <cddd0a2c-10e1-493a-9a02-521a1770c675@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cddd0a2c-10e1-493a-9a02-521a1770c675@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MPwlXQCVxN96z8wko7ucw_a9fMIDFaaP
X-Proofpoint-ORIG-GUID: 5-lmX_IHyD68zJQY_kS5I9cs4k_Z1M3E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfXwrmL/h7AW3nK
 nVZ3NArck2ztHKXKI1YzHs+afOovCrjxlFkskoumznmmOulC6VBNnHIBCeU+sSSyAHurk6+vWbx
 am9HrMccZQaS9KZQ46yWSPWjI9YeaIl5KnvHo6DS0wJje+R9huapw9U6LR1HW10yrF26avur7L8
 k6os8UwnKpk9QzajWjmMuEwY0RQChFJhLQH2d2Z8h3LkEWWXdxydNQ19n0ZwK+SDqiyNDWF5aZg
 hmVB6897YykZljyezCU3KSwzlEU4T1LubaUDh10zTcR5HXIV9GAd8o3+b6rlvpDzkhZaWIr1A8P
 bhexF/3xJgAakj7agc+ME+m6y+14Vs+kkq5nATBmbGHG+fkUg1B8UC8siBp/1/hVDUZA5qsPnpW
 QscXaQLqwmWKfE1Q8IaxAP/8TlDEiQ==
X-Authority-Analysis: v=2.4 cv=L/MQguT8 c=1 sm=1 tr=0 ts=69416fcf cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=8M7aN9AZkhnCfIqxXbEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 10:27:55AM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> > From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > 
> > This patch introduces preparatory changes needed to support building
> > PowerPC with the generic entry/exit (irqentry) framework.
> > 
> > The following infrastructure updates are added:
> >   - Add a syscall_work field to struct thread_info to hold SYSCALL_WORK_* flags.
> >   - Provide a stub implementation of arch_syscall_is_vdso_sigreturn(),
> >     returning false for now.
> >   - Introduce on_thread_stack() helper to detect if the current stack pointer
> >     lies within the task’s kernel stack.
> > 
> > These additions enable later integration with the generic entry/exit
> > infrastructure while keeping existing PowerPC behavior unchanged.
> > 
> > No functional change is intended in this patch.
> > 
> > Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > ---
> >   arch/powerpc/include/asm/entry-common.h | 11 +++++++++++
> >   arch/powerpc/include/asm/stacktrace.h   |  6 ++++++
> >   arch/powerpc/include/asm/syscall.h      |  5 +++++
> >   arch/powerpc/include/asm/thread_info.h  |  1 +
> >   4 files changed, 23 insertions(+)
> >   create mode 100644 arch/powerpc/include/asm/entry-common.h
> > 
> > diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> > new file mode 100644
> > index 000000000000..3af16d821d07
> > --- /dev/null
> > +++ b/arch/powerpc/include/asm/entry-common.h
> > @@ -0,0 +1,11 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef _ASM_PPC_ENTRY_COMMON_H
> > +#define _ASM_PPC_ENTRY_COMMON_H
> > +
> > +#ifdef CONFIG_GENERIC_IRQ_ENTRY
> 
> Why do you need this #ifdef ? I see no reason, the build works well without
> this #ifdef.
> 
> At the time being, CONFIG_GENERIC_IRQ_ENTRY is never selected by powerpc,
> meaning you are introducing dead code. If really needed it would be more
> explicit to add a "#if 0"
> 
Yes you are correct. I intended it to be a dead code till we introduce
the implementation. I'll remove this in next iteration.
> > +
> > +#include <asm/stacktrace.h>
> > +
> > +#endif /* CONFIG_GENERIC_IRQ_ENTRY */
> > +#endif /* _ASM_PPC_ENTRY_COMMON_H */
> > diff --git a/arch/powerpc/include/asm/stacktrace.h b/arch/powerpc/include/asm/stacktrace.h
> > index 6149b53b3bc8..a81a9373d723 100644
> > --- a/arch/powerpc/include/asm/stacktrace.h
> > +++ b/arch/powerpc/include/asm/stacktrace.h
> > @@ -10,4 +10,10 @@
> >   void show_user_instructions(struct pt_regs *regs);
> > +static inline bool on_thread_stack(void)
> 
> Shouldn't it be __always_inline ?
> 
Yes it should. Will fix this too.
> > +{
> > +	return !(((unsigned long)(current->stack) ^ current_stack_pointer)
> > +			& ~(THREAD_SIZE - 1));
> > +}
> > +
> >   #endif /* _ASM_POWERPC_STACKTRACE_H */
> > diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> > index 4b3c52ed6e9d..834fcc4f7b54 100644
> > --- a/arch/powerpc/include/asm/syscall.h
> > +++ b/arch/powerpc/include/asm/syscall.h
> > @@ -139,4 +139,9 @@ static inline int syscall_get_arch(struct task_struct *task)
> >   	else
> >   		return AUDIT_ARCH_PPC64;
> >   }
> > +
> > +static inline bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
> > +{
> > +	return false;
> > +}
> >   #endif	/* _ASM_SYSCALL_H */
> > diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> > index b0f200aba2b3..9c8270354f0b 100644
> > --- a/arch/powerpc/include/asm/thread_info.h
> > +++ b/arch/powerpc/include/asm/thread_info.h
> > @@ -57,6 +57,7 @@ struct thread_info {
> >   #ifdef CONFIG_SMP
> >   	unsigned int	cpu;
> >   #endif
> > +	unsigned long	syscall_work;		/* SYSCALL_WORK_ flags */
> 
> This is not used, why add it here ?
> 
I wanted it to be in a separate patch from where it's used coz if there
are any cache alignment issues, during the bisect we can be sure that
it's introduced by this variable not due to any implementation.
Do you think it should be along with the implementation?

I appreciate the review.

Regards,
Mukesh

> >   	unsigned long	local_flags;		/* private flags for thread */
> >   #ifdef CONFIG_LIVEPATCH_64
> >   	unsigned long *livepatch_sp;
> 

