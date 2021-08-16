Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B873ED07A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 10:42:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp72r6HWfz3cRr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 18:42:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SpOe/sdz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SpOe/sdz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp7235CRvz2yLN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 18:42:03 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17G8YSMH066124; Mon, 16 Aug 2021 04:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=496GxUYXXrdMWsxa5chADq56D/jc92bevVrZUqoa8W8=;
 b=SpOe/sdzOW7iDnKxAKxdgbZbzy8oAZxHUyZFRwrfovCant26mxVyw54Qs0eRE2EXPmym
 hU7RMJfXNHJIy0nBTMj20+BZaDhZhH9atum2xV+Ptl6kR6jdzvNGsQFY6oWPFsefa9mK
 Rs+TkNfFMywNj9ysKxCD51ynMJI/VYfCEzJg5B+DmcpxNqLfZ7AsbqiYxIM8KFhyStMf
 N7saTg6S8k6FqZCSrWCLrr7u5z8NvkBch+lFCWFFs/Q6E6OjmqQC30ByOYXmvjWXyLMY
 8qtvNH/PsrFLnrQA8WZz7+X2b9a6Bm/1Oi+CzJX1YqJjrBbpU0IirIOy8yeFvZ6KhxHp uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aetwb8drp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 04:42:00 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17G8YW3R066504;
 Mon, 16 Aug 2021 04:42:00 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aetwb8dq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 04:42:00 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17G8auoC006592;
 Mon, 16 Aug 2021 08:41:58 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3ae5f8tdxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Aug 2021 08:41:57 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17G8cUuV55509254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 08:38:30 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F1C552120;
 Mon, 16 Aug 2021 08:41:55 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.177.240])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 0873552128;
 Mon, 16 Aug 2021 08:41:53 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 00/60] KVM: PPC: Book3S HV P9: entry/exit optimisations
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
Date: Mon, 16 Aug 2021 14:11:51 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <0A4942B1-94BE-4FF1-B434-05C8159966B0@linux.vnet.ibm.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UAhAo1bg0cAEPlYuDDM5Jw1BHfNWYkrx
X-Proofpoint-ORIG-GUID: 1Rs8_hLabV9fqdkwbHWgissQjwP-ZmOH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-16_02:2021-08-13,
 2021-08-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108160054
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 11-Aug-2021, at 9:30 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
> 
> This reduces radix guest full entry/exit latency on POWER9 and POWER10
> by 2x.
> 
> Nested HV guests should see smaller improvements in their L1 entry/exit,
> but this is also combined with most L0 speedups also applying to nested
> entry. nginx localhost throughput test in a SMP nested guest is improved
> about 10% (in a direct guest it doesn't change much because it uses XIVE
> for IPIs) when L0 and L1 are patched.
> 
> It does this in several main ways:
> 
> - Rearrange code to optimise SPR accesses. Mainly, avoid scoreboard
>  stalls.
> 
> - Test SPR values to avoid mtSPRs where possible. mtSPRs are expensive.
> 
> - Reduce mftb. mftb is expensive.
> 
> - Demand fault certain facilities to avoid saving and/or restoring them
>  (at the cost of fault when they are used, but this is mitigated over
>  a number of entries, like the facilities when context switching 
>  processes). PM, TM, and EBB so far.
> 
> - Defer some sequences that are made just in case a guest is interrupted
>  in the middle of a critical section to the case where the guest is
>  scheduled on a different CPU, rather than every time (at the cost of
>  an extra IPI in this case). Namely the tlbsync sequence for radix with
>  GTSE, which is very expensive.
> 
> - Reduce locking, barriers, atomics related to the vcpus-per-vcore > 1
>  handling that the P9 path does not require.
> 
> Changes since v1:
> - Verified DPDES changes still work with msgsndp SMT emulation.
> - Fixed HMI handling bug.
> - Split softpatch handling fixes into smaller pieces.
> - Rebased with Fabiano's latest HV sanitising patches.
> - Fix TM demand faulting bug causing nested guest TM tests to TM Bad
>  Thing the host in rare cases.
> - Re-name new "pmu=" command line option to "pmu_override=" and update
>  documentation wording.

Hi Nick,

For the PMU related changes,

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira
> - Add default=y config option rather than unconditionally removing the
>  L0 nested PMU workaround.
> - Remove unnecessary MSR[RI] updates in entry/exit. Down to about 4700
>  cycles now.
> - Another bugfix from Alexey's testing.
> 
> Changes since RFC:
> - Rebased with Fabiano's HV sanitising patches at the front.
> - Several demand faulting bug fixes mostly relating to nested guests.
> - Removed facility demand-faulting from L0 nested entry/exit handler.
>  Demand faulting is still done in the L1, but not the L0. The reason
>  is to reduce complexity (although it's only a small amount of
>  complexity), reduce demand faulting overhead that may require several
> 
> Fabiano Rosas (3):
>  KVM: PPC: Book3S HV Nested: Sanitise vcpu registers
>  KVM: PPC: Book3S HV Nested: Stop forwarding all HFUs to L1
>  KVM: PPC: Book3S HV Nested: save_hv_return_state does not require trap
>    argument
> 
> Nicholas Piggin (57):
>  KVM: PPC: Book3S HV: Initialise vcpu MSR with MSR_ME
>  KVM: PPC: Book3S HV: Remove TM emulation from POWER7/8 path
>  KVM: PPC: Book3S HV P9: Fixes for TM softpatch interrupt NIP
>  KVM: PPC: Book3S HV Nested: Fix TM softpatch HFAC interrupt emulation
>  KVM: PPC: Book3S HV Nested: Make nested HFSCR state accessible
>  KVM: PPC: Book3S HV Nested: Reflect guest PMU in-use to L0 when guest
>    SPRs are live
>  powerpc/64s: Remove WORT SPR from POWER9/10
>  KMV: PPC: Book3S HV P9: Use set_dec to set decrementer to host
>  KVM: PPC: Book3S HV P9: Use host timer accounting to avoid decrementer
>    read
>  KVM: PPC: Book3S HV P9: Use large decrementer for HDEC
>  KVM: PPC: Book3S HV P9: Reduce mftb per guest entry/exit
>  powerpc/time: add API for KVM to re-arm the host timer/decrementer
>  KVM: PPC: Book3S HV: POWER10 enable HAIL when running radix guests
>  powerpc/64s: Keep AMOR SPR a constant ~0 at runtime
>  KVM: PPC: Book3S HV: Don't always save PMU for guest capable of
>    nesting
>  powerpc/64s: Always set PMU control registers to frozen/disabled when
>    not in use
>  powerpc/64s: Implement PMU override command line option
>  KVM: PPC: Book3S HV P9: Implement PMU save/restore in C
>  KVM: PPC: Book3S HV P9: Factor PMU save/load into context switch
>    functions
>  KVM: PPC: Book3S HV P9: Demand fault PMU SPRs when marked not inuse
>  KVM: PPC: Book3S HV P9: Factor out yield_count increment
>  KVM: PPC: Book3S HV: CTRL SPR does not require read-modify-write
>  KVM: PPC: Book3S HV P9: Move SPRG restore to restore_p9_host_os_sprs
>  KVM: PPC: Book3S HV P9: Reduce mtmsrd instructions required to save
>    host SPRs
>  KVM: PPC: Book3S HV P9: Improve mtmsrd scheduling by delaying MSR[EE]
>    disable
>  KVM: PPC: Book3S HV P9: Add kvmppc_stop_thread to match
>    kvmppc_start_thread
>  KVM: PPC: Book3S HV: Change dec_expires to be relative to guest
>    timebase
>  KVM: PPC: Book3S HV P9: Move TB updates
>  KVM: PPC: Book3S HV P9: Optimise timebase reads
>  KVM: PPC: Book3S HV P9: Avoid SPR scoreboard stalls
>  KVM: PPC: Book3S HV P9: Only execute mtSPR if the value changed
>  KVM: PPC: Book3S HV P9: Juggle SPR switching around
>  KVM: PPC: Book3S HV P9: Move vcpu register save/restore into functions
>  KVM: PPC: Book3S HV P9: Move host OS save/restore functions to
>    built-in
>  KVM: PPC: Book3S HV P9: Move nested guest entry into its own function
>  KVM: PPC: Book3S HV P9: Move remaining SPR and MSR access into low
>    level entry
>  KVM: PPC: Book3S HV P9: Implement TM fastpath for guest entry/exit
>  KVM: PPC: Book3S HV P9: Switch PMU to guest as late as possible
>  KVM: PPC: Book3S HV P9: Restrict DSISR canary workaround to processors
>    that require it
>  KVM: PPC: Book3S HV P9: More SPR speed improvements
>  KVM: PPC: Book3S HV P9: Demand fault EBB facility registers
>  KVM: PPC: Book3S HV P9: Demand fault TM facility registers
>  KVM: PPC: Book3S HV P9: Use Linux SPR save/restore to manage some host
>    SPRs
>  KVM: PPC: Book3S HV P9: Comment and fix MMU context switching code
>  KVM: PPC: Book3S HV P9: Test dawr_enabled() before saving host DAWR
>    SPRs
>  KVM: PPC: Book3S HV P9: Don't restore PSSCR if not needed
>  KVM: PPC: Book3S HV P9: Avoid tlbsync sequence on radix guest exit
>  KVM: PPC: Book3S HV Nested: Avoid extra mftb() in nested entry
>  KVM: PPC: Book3S HV P9: Improve mfmsr performance on entry
>  KVM: PPC: Book3S HV P9: Optimise hash guest SLB saving
>  KVM: PPC: Book3S HV P9: Avoid changing MSR[RI] in entry and exit
>  KVM: PPC: Book3S HV P9: Add unlikely annotation for !mmu_ready
>  KVM: PPC: Book3S HV P9: Avoid cpu_in_guest atomics on entry and exit
>  KVM: PPC: Book3S HV P9: Remove most of the vcore logic
>  KVM: PPC: Book3S HV P9: Tidy kvmppc_create_dtl_entry
>  KVM: PPC: Book3S HV P9: Stop using vc->dpdes
>  KVM: PPC: Book3S HV P9: Remove subcore HMI handling
> 
> .../admin-guide/kernel-parameters.txt         |   8 +
> arch/powerpc/include/asm/asm-prototypes.h     |   5 -
> arch/powerpc/include/asm/kvm_asm.h            |   1 +
> arch/powerpc/include/asm/kvm_book3s.h         |   6 +
> arch/powerpc/include/asm/kvm_book3s_64.h      |   6 +-
> arch/powerpc/include/asm/kvm_host.h           |   7 +-
> arch/powerpc/include/asm/kvm_ppc.h            |   1 +
> arch/powerpc/include/asm/pmc.h                |   7 +
> arch/powerpc/include/asm/reg.h                |   3 +-
> arch/powerpc/include/asm/switch_to.h          |   2 +
> arch/powerpc/include/asm/time.h               |  19 +-
> arch/powerpc/kernel/cpu_setup_power.c         |  12 +-
> arch/powerpc/kernel/dt_cpu_ftrs.c             |   8 +-
> arch/powerpc/kernel/process.c                 |  32 +
> arch/powerpc/kernel/time.c                    |  54 +-
> arch/powerpc/kvm/Kconfig                      |  15 +
> arch/powerpc/kvm/book3s_64_mmu_radix.c        |   4 +
> arch/powerpc/kvm/book3s_hv.c                  | 890 ++++++++++--------
> arch/powerpc/kvm/book3s_hv.h                  |  41 +
> arch/powerpc/kvm/book3s_hv_builtin.c          |   2 +
> arch/powerpc/kvm/book3s_hv_hmi.c              |   7 +-
> arch/powerpc/kvm/book3s_hv_interrupts.S       |  13 +-
> arch/powerpc/kvm/book3s_hv_nested.c           | 109 ++-
> arch/powerpc/kvm/book3s_hv_p9_entry.c         | 817 +++++++++++++---
> arch/powerpc/kvm/book3s_hv_ras.c              |  54 ++
> arch/powerpc/kvm/book3s_hv_rmhandlers.S       | 115 +--
> arch/powerpc/kvm/book3s_hv_tm.c               |  61 +-
> arch/powerpc/mm/book3s64/radix_pgtable.c      |  15 -
> arch/powerpc/perf/core-book3s.c               |  35 +
> arch/powerpc/platforms/powernv/idle.c         |  10 +-
> 30 files changed, 1589 insertions(+), 770 deletions(-)
> create mode 100644 arch/powerpc/kvm/book3s_hv.h
> 
> -- 
> 2.23.0
> 

