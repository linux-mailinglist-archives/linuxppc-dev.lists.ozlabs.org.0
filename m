Return-Path: <linuxppc-dev+bounces-14819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF02CC3D7E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 16:14:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW0p84wPBz2yDY;
	Wed, 17 Dec 2025 02:14:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765898064;
	cv=none; b=BoBd2iTAdFXNnn8VaifNSIwxvcTsagTa+SG175AFbFGu2TxwzjrbJbjZUINKtsJwf9tJczUMzk1g2DmXBhFu5YL+wOUM1V2C6s+FmuWBJOao7gJdC5RQSXjNqJoRJs7LwKtxPjdqpB/NDvgslmAde3DefIGkfiNFurEv6xcj0YxPrjeYIpua3j3DK9N3sjX0Uvmxwd5oTOn2p1TnbOkVzASDPlFus8aL7ahuRg0JDtVKbBIUc4Y8B7z5iEBpkRIvQqFMIirQiALYpvI1ysJmnJmSCwHik2LOBKDgrJDn4GxLxZzqBhylav2mDKYoD0a6Uf76oDkvHB4P/iJRK6N98w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765898064; c=relaxed/relaxed;
	bh=dyyTzLmmjZjZzbozQCSONkvcQSowdLoOuMJTsyNKeP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ws+UB63t5Vi1nK9pVKM6JnrPNwS598+eCPK6jstNAGkyj/l4101+SY3+ltazorWC/IyOKyDeIbFLLlvnE19vrFsPJNFc27YQ6J+Jc4Z/H/GrKFilgXCU4PdlXYG8fS++LcEqiMma+pqZPqQP9hSSuOfARh9sdH1hREjO0+7p5o3ALPIZmrc2RqafCmOZtAUEpQrbAiFP/5otj9aY34oL91v7SpXWftiq0J3WPzN8yvBJ21LnRGizS3eDTIWYP38gqw6eFNpiXYT3FI4yX6GPRmCo87LcM1XDFmzPXN+BNsuE4wHlnQMueda15TKZw5NB36LKOSYtackWd2ol5w8YlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YdBfdrj9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YdBfdrj9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW0p74KR8z2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 02:14:23 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGEhleb001615;
	Tue, 16 Dec 2025 15:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dyyTzL
	mmjZjZzbozQCSONkvcQSowdLoOuMJTsyNKeP8=; b=YdBfdrj97HGgC/sYuFskV6
	Hlr9qrZHVL49qqIyOgnYjgeOkCYqht82iiEsaYwtD5gHEBuZBCYm2N7teYt+Ukub
	KBS29q9WW2xTAZDvca8XCEPut4A/wAdtGgaNlr8mniem/4a0pfyV2OyUryywQPAw
	PRgPS3x9qRz25wuvIHj1HDnpRv2didYNPxIkHbg3BuhCb/4ZQ3DQl8CcROlshGYT
	oczvQeYqBJUjh/HLfNsm1YcW4dKUz0vqFZx1uQtjwh+Idqyu+CWtF8OTNX/aKsf1
	MAuH2OL97aOxMYP/yljHFWQICjYvkzHJMYIRHDYvRB9Gu7qq9ciE7wCfo97wxklQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0ytv7rad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:13:59 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BGEvSju021763;
	Tue, 16 Dec 2025 15:13:59 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0ytv7ra5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:13:59 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BGFDXq1005675;
	Tue, 16 Dec 2025 15:13:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1tgnude4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:13:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BGFDrxk13238754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Dec 2025 15:13:53 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 362372004B;
	Tue, 16 Dec 2025 15:13:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 06E0020040;
	Tue, 16 Dec 2025 15:13:47 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.210.89])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 16 Dec 2025 15:13:46 +0000 (GMT)
Date: Tue, 16 Dec 2025 20:43:44 +0530
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
Subject: Re: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
Message-ID: <7sjlrtnf3jut5v3evkiqcfxrmckulslrp67b4vc2klgrxzxq3v@uarefmnd4wvk>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-9-mkchauras@linux.ibm.com>
 <a406618d-641e-4e8c-afc5-7c4f0db42b1f@kernel.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a406618d-641e-4e8c-afc5-7c4f0db42b1f@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX4FOj/HAc7xGv
 XwuCCrd6MoEKvxoFD1rvXg6F9C4rtSrkiqGH90J04H2p5nvzagZLchjzuhC0xSrHPLJ57CzTLRa
 HXTjZs6MjjtL9K/+ikP0Ti0HSPrJ41JN6E2NnacWhyfz87lBKOnnFwNgIW6IQTuCyfYYevZVnsX
 dMhXLzRBVdFZIkHSpJBrw4NwDqz4OvbIWM2LaKHwo8h+ubFkf/vuugaH8mKlQByugPf0WNtoqMp
 /0Hofu01HBpop5u9CpRDdXHTkT5bY0h9jIK1A/pD6kZySBhcTWYk/eoBFu20r4DfTNlBQsUmYDJ
 MFyyWRFJXIBp1d0UeQMVmgyAzu/jDUVX2MWFMfU6weYn1WycQwSzOLP1SBbT6N/6NdMbw2cfBtx
 YdyOKCIncfsIzDSTI5YmLmMpZ8sUAQ==
X-Proofpoint-ORIG-GUID: iM-esRE8chlQQxqRPeaUaj3XMRFkCl2u
X-Authority-Analysis: v=2.4 cv=QtRTHFyd c=1 sm=1 tr=0 ts=69417737 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=uHXInHZQNVT4hycORv0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: aq3xil1JXgxaoh8Z4MTwuvGbx7fmgjbh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 12:01:32PM +0100, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> > From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > 
> > Convert the PowerPC syscall entry and exit paths to use the generic
> > entry/exit framework by selecting GENERIC_ENTRY and integrating with
> > the common syscall handling routines.
> > 
> > This change transitions PowerPC away from its custom syscall entry and
> > exit code to use the generic helpers such as:
> >   - syscall_enter_from_user_mode()
> >   - syscall_exit_to_user_mode()
> > 
> > As part of this migration:
> >   - The architecture now selects GENERIC_ENTRY in Kconfig.
> >   - Old tracing, seccomp, and audit handling in ptrace.c is removed in
> >     favor of generic entry infrastructure.
> >   - interrupt.c and syscall.c are simplified to delegate context
> >     management and user exit handling to the generic entry path.
> >   - The new pt_regs field `exit_flags` introduced earlier is now used
> >     to carry per-syscall exit state flags (e.g. _TIF_RESTOREALL).
> > 
> > This aligns PowerPC with the common entry code used by other
> > architectures and reduces duplicated logic around syscall tracing,
> > context tracking, and signal handling.
> > 
> > The performance benchmarks from perf bench basic syscall are below:
> > 
> > perf bench syscall usec/op
> > 
> > | Test            | With Patch | Without Patch | % Change |
> > | --------------- | ---------- | ------------- | -------- |
> > | getppid usec/op | 0.207795   | 0.210373      | -1.22%   |
> > | getpgid usec/op | 0.206282   | 0.211676      | -2.55%   |
> > | fork usec/op    | 833.986    | 814.809       | +2.35%   |
> > | execve usec/op  | 360.939    | 365.168       | -1.16%   |
> > 
> > perf bench syscall ops/sec
> > 
> > | Test            | With Patch | Without Patch | % Change |
> > | --------------- | ---------- | ------------- | -------- |
> > | getppid ops/sec | 48,12,433  | 47,53,459     | +1.24%   |
> > | getpgid ops/sec | 48,47,744  | 47,24,192     | +2.61%   |
> > | fork ops/sec    | 1,199      | 1,227         | -2.28%   |
> > | execve ops/sec  | 2,770      | 2,738         | +1.16%   |
> > 
> > IPI latency benchmark
> > 
> > | Metric                  | With Patch       | Without Patch    | % Change |
> > | ----------------------- | ---------------- | ---------------- | -------- |
> > | Dry-run (ns)            | 206,675.81       | 206,719.36       | -0.02%   |
> > | Self-IPI avg (ns)       | 1,939,991.00     | 1,976,116.15     | -1.83%   |
> > | Self-IPI max (ns)       | 3,533,718.93     | 3,582,650.33     | -1.37%   |
> > | Normal IPI avg (ns)     | 111,110,034.23   | 110,513,373.51   | +0.54%   |
> > | Normal IPI max (ns)     | 150,393,442.64   | 149,669,477.89   | +0.48%   |
> > | Broadcast IPI max (ns)  | 3,978,231,022.96 | 4,359,916,859.46 | -8.73%   |
> > | Broadcast lock max (ns) | 4,025,425,714.49 | 4,384,956,730.83 | -8.20%   |
> > 
> > Thats very close to performance earlier with arch specific handling.
> > 
> > Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> > ---
> >   arch/powerpc/Kconfig                    |   1 +
> >   arch/powerpc/include/asm/entry-common.h |   5 +-
> >   arch/powerpc/kernel/interrupt.c         | 139 +++++++----------------
> >   arch/powerpc/kernel/ptrace/ptrace.c     | 141 ------------------------
> >   arch/powerpc/kernel/signal.c            |  10 +-
> >   arch/powerpc/kernel/syscall.c           | 119 +-------------------
> >   6 files changed, 49 insertions(+), 366 deletions(-)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index b0c602c3bbe1..a4330775b254 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -203,6 +203,7 @@ config PPC
> >   	select GENERIC_CPU_AUTOPROBE
> >   	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
> >   	select GENERIC_EARLY_IOREMAP
> > +	select GENERIC_ENTRY
> >   	select GENERIC_GETTIMEOFDAY
> >   	select GENERIC_IDLE_POLL_SETUP
> >   	select GENERIC_IOREMAP
> > diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> > index e2ae7416dee1..77129174f882 100644
> > --- a/arch/powerpc/include/asm/entry-common.h
> > +++ b/arch/powerpc/include/asm/entry-common.h
> > @@ -3,7 +3,7 @@
> >   #ifndef _ASM_PPC_ENTRY_COMMON_H
> >   #define _ASM_PPC_ENTRY_COMMON_H
> > -#ifdef CONFIG_GENERIC_IRQ_ENTRY
> > +#ifdef CONFIG_GENERIC_ENTRY
> 
> Powerpc now selected this inconditionaly. Why is this #ifdef needed ?
> 
Will remove this.
> 
> >   #include <asm/cputime.h>
> >   #include <asm/interrupt.h>
> > @@ -217,9 +217,6 @@ static inline void arch_interrupt_enter_prepare(struct pt_regs *regs)
> >   	if (user_mode(regs)) {
> >   		kuap_lock();
> > -		CT_WARN_ON(ct_state() != CT_STATE_USER);
> > -		user_exit_irqoff();
> > -
> >   		account_cpu_user_entry();
> >   		account_stolen_time();
> >   	} else {
> > diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> > index 7f67f0b9d627..7d5cd4b5a610 100644
> > --- a/arch/powerpc/kernel/interrupt.c
> > +++ b/arch/powerpc/kernel/interrupt.c
> > @@ -1,6 +1,7 @@
> >   // SPDX-License-Identifier: GPL-2.0-or-later
> >   #include <linux/context_tracking.h>
> > +#include <linux/entry-common.h>
> >   #include <linux/err.h>
> >   #include <linux/compat.h>
> >   #include <linux/rseq.h>
> > @@ -73,79 +74,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
> >   	return true;
> >   }
> > -static notrace unsigned long
> > -interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
> > -{
> > -	unsigned long ti_flags;
> > -
> > -again:
> > -	ti_flags = read_thread_flags();
> > -	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
> > -		local_irq_enable();
> > -		if (ti_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
> > -			schedule();
> > -		} else {
> > -			/*
> > -			 * SIGPENDING must restore signal handler function
> > -			 * argument GPRs, and some non-volatiles (e.g., r1).
> > -			 * Restore all for now. This could be made lighter.
> > -			 */
> > -			if (ti_flags & _TIF_SIGPENDING)
> > -				ret |= _TIF_RESTOREALL;
> > -			do_notify_resume(regs, ti_flags);
> 
> do_notify_resume() has no caller anymore, should be removed from
> arch/powerpc/include/asm/signal.h and arch/powerpc/kernel/signal.c
> 
> 
> 
Oh yeah, will remove this.
> > -		}
> > -		local_irq_disable();
> > -		ti_flags = read_thread_flags();
> > -	}
> > -
> > -	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
> > -		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
> > -				unlikely((ti_flags & _TIF_RESTORE_TM))) {
> > -			restore_tm_state(regs);
> > -		} else {
> > -			unsigned long mathflags = MSR_FP;
> > -
> > -			if (cpu_has_feature(CPU_FTR_VSX))
> > -				mathflags |= MSR_VEC | MSR_VSX;
> > -			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
> > -				mathflags |= MSR_VEC;
> > -
> > -			/*
> > -			 * If userspace MSR has all available FP bits set,
> > -			 * then they are live and no need to restore. If not,
> > -			 * it means the regs were given up and restore_math
> > -			 * may decide to restore them (to avoid taking an FP
> > -			 * fault).
> > -			 */
> > -			if ((regs->msr & mathflags) != mathflags)
> > -				restore_math(regs);
> > -		}
> > -	}
> > -
> > -	check_return_regs_valid(regs);
> > -
> > -	user_enter_irqoff();
> > -	if (!prep_irq_for_enabled_exit(true)) {
> > -		user_exit_irqoff();
> > -		local_irq_enable();
> > -		local_irq_disable();
> > -		goto again;
> > -	}
> > -
> > -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> > -	local_paca->tm_scratch = regs->msr;
> > -#endif
> > -
> > -	booke_load_dbcr0();
> > -
> > -	account_cpu_user_exit();
> > -
> > -	/* Restore user access locks last */
> > -	kuap_user_restore(regs);
> > -
> > -	return ret;
> > -}
> > -
> >   /*
> >    * This should be called after a syscall returns, with r3 the return value
> >    * from the syscall. If this function returns non-zero, the system call
> > @@ -160,17 +88,12 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
> >   					   long scv)
> >   {
> >   	unsigned long ti_flags;
> > -	unsigned long ret = 0;
> >   	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
> > -	CT_WARN_ON(ct_state() == CT_STATE_USER);
> > -
> >   	kuap_assert_locked();
> >   	regs->result = r3;
> > -
> > -	/* Check whether the syscall is issued inside a restartable sequence */
> > -	rseq_syscall(regs);
> > +	regs->exit_flags = 0;
> >   	ti_flags = read_thread_flags();
> > @@ -183,7 +106,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
> >   	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
> >   		if (ti_flags & _TIF_RESTOREALL)
> > -			ret = _TIF_RESTOREALL;
> > +			regs->exit_flags = _TIF_RESTOREALL;
> >   		else
> >   			regs->gpr[3] = r3;
> >   		clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
> > @@ -192,18 +115,28 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
> >   	}
> >   	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> > -		do_syscall_trace_leave(regs);
> > -		ret |= _TIF_RESTOREALL;
> > +		regs->exit_flags |= _TIF_RESTOREALL;
> >   	}
> > -	local_irq_disable();
> > -	ret = interrupt_exit_user_prepare_main(ret, regs);
> > +	syscall_exit_to_user_mode(regs);
> > +
> > +again:
> > +	user_enter_irqoff();
> > +	if (!prep_irq_for_enabled_exit(true)) {
> > +		user_exit_irqoff();
> > +		local_irq_enable();
> > +		local_irq_disable();
> > +		goto again;
> > +	}
> > +
> > +	/* Restore user access locks last */
> > +	kuap_user_restore(regs);
> >   #ifdef CONFIG_PPC64
> > -	regs->exit_result = ret;
> > +	regs->exit_result = regs->exit_flags;
> >   #endif
> > -	return ret;
> > +	return regs->exit_flags;
> >   }
> >   #ifdef CONFIG_PPC64
> > @@ -223,13 +156,16 @@ notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *reg
> >   	set_kuap(AMR_KUAP_BLOCKED);
> >   #endif
> > -	trace_hardirqs_off();
> > -	user_exit_irqoff();
> > -	account_cpu_user_entry();
> > -
> > -	BUG_ON(!user_mode(regs));
> > +again:
> > +	user_enter_irqoff();
> > +	if (!prep_irq_for_enabled_exit(true)) {
> > +		user_exit_irqoff();
> > +		local_irq_enable();
> > +		local_irq_disable();
> > +		goto again;
> > +	}
> > -	regs->exit_result = interrupt_exit_user_prepare_main(regs->exit_result, regs);
> > +	regs->exit_result |= regs->exit_flags;
> >   	return regs->exit_result;
> >   }
> > @@ -241,7 +177,6 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
> >   	BUG_ON(regs_is_unrecoverable(regs));
> >   	BUG_ON(regs_irqs_disabled(regs));
> > -	CT_WARN_ON(ct_state() == CT_STATE_USER);
> >   	/*
> >   	 * We don't need to restore AMR on the way back to userspace for KUAP.
> > @@ -250,8 +185,21 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
> >   	kuap_assert_locked();
> >   	local_irq_disable();
> > +	regs->exit_flags = 0;
> > +again:
> > +	check_return_regs_valid(regs);
> > +	user_enter_irqoff();
> > +	if (!prep_irq_for_enabled_exit(true)) {
> > +		user_exit_irqoff();
> > +		local_irq_enable();
> > +		local_irq_disable();
> > +		goto again;
> > +	}
> > +
> > +	/* Restore user access locks last */
> > +	kuap_user_restore(regs);
> > -	ret = interrupt_exit_user_prepare_main(0, regs);
> > +	ret = regs->exit_flags;
> >   #ifdef CONFIG_PPC64
> >   	regs->exit_result = ret;
> > @@ -293,8 +241,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
> >   		/* Returning to a kernel context with local irqs enabled. */
> >   		WARN_ON_ONCE(!(regs->msr & MSR_EE));
> >   again:
> > -		if (need_irq_preemption())
> > -			irqentry_exit_cond_resched();
> >   		check_return_regs_valid(regs);
> > @@ -364,7 +310,6 @@ notrace unsigned long interrupt_exit_user_restart(struct pt_regs *regs)
> >   #endif
> >   	trace_hardirqs_off();
> > -	user_exit_irqoff();
> >   	account_cpu_user_entry();
> >   	BUG_ON(!user_mode(regs));
> > diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> > index 2134b6d155ff..316d4f5ead8e 100644
> > --- a/arch/powerpc/kernel/ptrace/ptrace.c
> > +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> > @@ -21,9 +21,6 @@
> >   #include <asm/switch_to.h>
> >   #include <asm/debug.h>
> > -#define CREATE_TRACE_POINTS
> > -#include <trace/events/syscalls.h>
> > -
> >   #include "ptrace-decl.h"
> >   /*
> > @@ -195,144 +192,6 @@ long arch_ptrace(struct task_struct *child, long request,
> >   	return ret;
> >   }
> > -#ifdef CONFIG_SECCOMP
> > -static int do_seccomp(struct pt_regs *regs)
> > -{
> > -	if (!test_thread_flag(TIF_SECCOMP))
> > -		return 0;
> > -
> > -	/*
> > -	 * The ABI we present to seccomp tracers is that r3 contains
> > -	 * the syscall return value and orig_gpr3 contains the first
> > -	 * syscall parameter. This is different to the ptrace ABI where
> > -	 * both r3 and orig_gpr3 contain the first syscall parameter.
> > -	 */
> > -	regs->gpr[3] = -ENOSYS;
> > -
> > -	/*
> > -	 * We use the __ version here because we have already checked
> > -	 * TIF_SECCOMP. If this fails, there is nothing left to do, we
> > -	 * have already loaded -ENOSYS into r3, or seccomp has put
> > -	 * something else in r3 (via SECCOMP_RET_ERRNO/TRACE).
> > -	 */
> > -	if (__secure_computing())
> > -		return -1;
> > -
> > -	/*
> > -	 * The syscall was allowed by seccomp, restore the register
> > -	 * state to what audit expects.
> > -	 * Note that we use orig_gpr3, which means a seccomp tracer can
> > -	 * modify the first syscall parameter (in orig_gpr3) and also
> > -	 * allow the syscall to proceed.
> > -	 */
> > -	regs->gpr[3] = regs->orig_gpr3;
> > -
> > -	return 0;
> > -}
> > -#else
> > -static inline int do_seccomp(struct pt_regs *regs) { return 0; }
> > -#endif /* CONFIG_SECCOMP */
> > -
> > -/**
> > - * do_syscall_trace_enter() - Do syscall tracing on kernel entry.
> > - * @regs: the pt_regs of the task to trace (current)
> > - *
> > - * Performs various types of tracing on syscall entry. This includes seccomp,
> > - * ptrace, syscall tracepoints and audit.
> > - *
> > - * The pt_regs are potentially visible to userspace via ptrace, so their
> > - * contents is ABI.
> > - *
> > - * One or more of the tracers may modify the contents of pt_regs, in particular
> > - * to modify arguments or even the syscall number itself.
> > - *
> > - * It's also possible that a tracer can choose to reject the system call. In
> > - * that case this function will return an illegal syscall number, and will put
> > - * an appropriate return value in regs->r3.
> > - *
> > - * Return: the (possibly changed) syscall number.
> > - */
> > -long do_syscall_trace_enter(struct pt_regs *regs)
> 
> Remove prototype from arch/powerpc/include/asm/ptrace.h
> 
Sure will do.
> > -{
> > -	u32 flags;
> > -
> > -	flags = read_thread_flags() & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE);
> > -
> > -	if (flags) {
> > -		int rc = ptrace_report_syscall_entry(regs);
> > -
> > -		if (unlikely(flags & _TIF_SYSCALL_EMU)) {
> > -			/*
> > -			 * A nonzero return code from
> > -			 * ptrace_report_syscall_entry() tells us to prevent
> > -			 * the syscall execution, but we are not going to
> > -			 * execute it anyway.
> > -			 *
> > -			 * Returning -1 will skip the syscall execution. We want
> > -			 * to avoid clobbering any registers, so we don't goto
> > -			 * the skip label below.
> > -			 */
> > -			return -1;
> > -		}
> > -
> > -		if (rc) {
> > -			/*
> > -			 * The tracer decided to abort the syscall. Note that
> > -			 * the tracer may also just change regs->gpr[0] to an
> > -			 * invalid syscall number, that is handled below on the
> > -			 * exit path.
> > -			 */
> > -			goto skip;
> > -		}
> > -	}
> > -
> > -	/* Run seccomp after ptrace; allow it to set gpr[3]. */
> > -	if (do_seccomp(regs))
> > -		return -1;
> > -
> > -	/* Avoid trace and audit when syscall is invalid. */
> > -	if (regs->gpr[0] >= NR_syscalls)
> > -		goto skip;
> > -
> > -	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
> > -		trace_sys_enter(regs, regs->gpr[0]);
> > -
> > -	if (!is_32bit_task())
> > -		audit_syscall_entry(regs->gpr[0], regs->gpr[3], regs->gpr[4],
> > -				    regs->gpr[5], regs->gpr[6]);
> > -	else
> > -		audit_syscall_entry(regs->gpr[0],
> > -				    regs->gpr[3] & 0xffffffff,
> > -				    regs->gpr[4] & 0xffffffff,
> > -				    regs->gpr[5] & 0xffffffff,
> > -				    regs->gpr[6] & 0xffffffff);
> > -
> > -	/* Return the possibly modified but valid syscall number */
> > -	return regs->gpr[0];
> > -
> > -skip:
> > -	/*
> > -	 * If we are aborting explicitly, or if the syscall number is
> > -	 * now invalid, set the return value to -ENOSYS.
> > -	 */
> > -	regs->gpr[3] = -ENOSYS;
> > -	return -1;
> > -}
> > -
> > -void do_syscall_trace_leave(struct pt_regs *regs)
> > -{
> > -	int step;
> > -
> > -	audit_syscall_exit(regs);
> > -
> > -	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
> > -		trace_sys_exit(regs, regs->result);
> > -
> > -	step = test_thread_flag(TIF_SINGLESTEP);
> > -	if (step || test_thread_flag(TIF_SYSCALL_TRACE))
> > -		ptrace_report_syscall_exit(regs, step);
> > -}
> > -
> >   void __init pt_regs_check(void);
> >   /*
> > diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> > index 719930cf4ae1..9f1847b4742e 100644
> > --- a/arch/powerpc/kernel/signal.c
> > +++ b/arch/powerpc/kernel/signal.c
> > @@ -6,6 +6,7 @@
> >    *    Extracted from signal_32.c and signal_64.c
> >    */
> > +#include <linux/entry-common.h>
> >   #include <linux/resume_user_mode.h>
> >   #include <linux/signal.h>
> >   #include <linux/uprobes.h>
> > @@ -22,11 +23,6 @@
> >   #include "signal.h"
> > -/* This will be removed */
> > -#ifdef CONFIG_GENERIC_ENTRY
> > -#include <linux/entry-common.h>
> > -#endif /* CONFIG_GENERIC_ENTRY */
> > -
> 
> Until now CONFIG_GENERIC_ENTRY was not defined.
> 
> Now that it is defined, we remove the entire block ?
> 
> Then why has it been added at all ?
> 
I wanted all this to be a dead code till we enable the config. I kept
the name as CONFIG_GENERIC_ENTRY so that it would be explanatory why
it's dead.

> >   #ifdef CONFIG_VSX
> >   unsigned long copy_fpr_to_user(void __user *to,
> >   			       struct task_struct *task)
> > @@ -374,11 +370,9 @@ void signal_fault(struct task_struct *tsk, struct pt_regs *regs,
> >   				   task_pid_nr(tsk), where, ptr, regs->nip, regs->link);
> >   }
> > -#ifdef CONFIG_GENERIC_ENTRY
> >   void arch_do_signal_or_restart(struct pt_regs *regs)
> >   {
> >   	BUG_ON(regs != current->thread.regs);
> > -	local_paca->generic_fw_flags |= GFW_RESTORE_ALL;
> 
> Why was that there ? I thought it was preparatory, then you remove it before
> even using it ?
> 
This should have been removed earlier. Will fix this in next revision.

I appreciate a detailed review. Thanks :).

Regards,
Mukesh
> > +	regs->exit_flags |= _TIF_RESTOREALL;
> >   	do_signal(current);
> >   }
> > -#endif /* CONFIG_GENERIC_ENTRY */

