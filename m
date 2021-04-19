Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FB63648A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 18:57:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPCfs3zntz304j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 02:57:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mNRBxdRl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mNRBxdRl; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPCfN5S8Gz2xZc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 02:57:16 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E2B761104;
 Mon, 19 Apr 2021 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618851433;
 bh=1RuFY0AT0pR8AsEj0Tm6ofcFvBwcEzWLkdnE6Pjgra0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mNRBxdRlYzhDcs+LV9TB96CNyOkNUGPhhCMZzAjpY3flKpRetPSRzoSULTGIcSoKT
 JgSMkCaL+08BoMWLE6vM2PWHKR8I3NMqFdZoHixyHud85kYWdWP6GHkGXrEMqvk7Ol
 A/StqhB+F6Rhs5q2bzz4HyDBxTOakHhXqwHbfeRLVfyYBE4iL8M/++u6sNX/pKpNHb
 wFALenG/c6BIS080v6DAhWsxT1TJfrQ8Js2Wnc0zFTqBS8L08tGO35ya11BKwTpItq
 Ufj04iMgHVAB6HVocNjdDJIsRx0eDOMa6nkQKXp1i6Gnh6Qyf/ZbVs6wTPdKTNdWeq
 Pq3JGihnr2/Dg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 87D6940647; Mon, 19 Apr 2021 13:57:09 -0300 (-03)
Date: Mon, 19 Apr 2021 13:57:09 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] perf vendor events: Initial json/events list for
 power10 platform
Message-ID: <YH22ZWvgG0QyAcAB@kernel.org>
References: <20210419112001.71466-1-kjain@linux.ibm.com>
 <871rb6e9ex.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871rb6e9ex.fsf@mpe.ellerman.id.au>
X-Url: http://acmel.wordpress.com
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
Cc: ravi.bangoria@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 maddy@linux.vnet.ibm.com, pc@us.ibm.com, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Apr 19, 2021 at 10:38:46PM +1000, Michael Ellerman escreveu:
> Kajol Jain <kjain@linux.ibm.com> writes:
> > Patch adds initial json/events for POWER10.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks, applied.

- Arnaldo

 
> cheers
> 
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> > Tested-by: Paul A. Clarke <pc@us.ibm.com>
> > Reviewed-by: Paul A. Clarke <pc@us.ibm.com>
> > ---
> >  .../perf/pmu-events/arch/powerpc/mapfile.csv  |   1 +
> >  .../arch/powerpc/power10/cache.json           |  47 +++
> >  .../arch/powerpc/power10/floating_point.json  |   7 +
> >  .../arch/powerpc/power10/frontend.json        | 217 +++++++++++++
> >  .../arch/powerpc/power10/locks.json           |  12 +
> >  .../arch/powerpc/power10/marked.json          | 147 +++++++++
> >  .../arch/powerpc/power10/memory.json          | 192 +++++++++++
> >  .../arch/powerpc/power10/others.json          | 297 ++++++++++++++++++
> >  .../arch/powerpc/power10/pipeline.json        | 297 ++++++++++++++++++
> >  .../pmu-events/arch/powerpc/power10/pmc.json  |  22 ++
> >  .../arch/powerpc/power10/translation.json     |  57 ++++
> >  11 files changed, 1296 insertions(+)
> >  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/cache.json
> >  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/floating_point.json
> >  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/frontend.json
> >  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/locks.json
> >  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/marked.json
> >  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/memory.json
> >  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/others.json
> >  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
> >  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/pmc.json
> >  create mode 100644 tools/perf/pmu-events/arch/powerpc/power10/translation.json
> >
> > ---
> > Changelog:
> > v1 -> v2
> > - Removed inconsistencies in "BriefDescription" field and make sure
> >   it will end with period without any space at the end.
> >   Suggested by : Paul A. Clarke  
> > - Added Tested-by and Reviewed-by tag.
> > ---
> > diff --git a/tools/perf/pmu-events/arch/powerpc/mapfile.csv b/tools/perf/pmu-events/arch/powerpc/mapfile.csv
> > index 229150e7ab7d..4abdfc3f9692 100644
> > --- a/tools/perf/pmu-events/arch/powerpc/mapfile.csv
> > +++ b/tools/perf/pmu-events/arch/powerpc/mapfile.csv
> > @@ -15,3 +15,4 @@
> >  # Power8 entries
> >  004[bcd][[:xdigit:]]{4},1,power8,core
> >  004e[[:xdigit:]]{4},1,power9,core
> > +0080[[:xdigit:]]{4},1,power10,core
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/cache.json b/tools/perf/pmu-events/arch/powerpc/power10/cache.json
> > new file mode 100644
> > index 000000000000..95e33531fbc6
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/cache.json
> > @@ -0,0 +1,47 @@
> > +[
> > +  {
> > +    "EventCode": "1003C",
> > +    "EventName": "PM_EXEC_STALL_DMISS_L2L3",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from either the local L2 or local L3."
> > +  },
> > +  {
> > +    "EventCode": "34056",
> > +    "EventName": "PM_EXEC_STALL_LOAD_FINISH",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was finishing a load after its data was reloaded from a data source beyond the local L1; cycles in which the LSU was processing an L1-hit; cycles in which the NTF instruction merged with another load in the LMQ."
> > +  },
> > +  {
> > +    "EventCode": "3006C",
> > +    "EventName": "PM_RUN_CYC_SMT2_MODE",
> > +    "BriefDescription": "Cycles when this thread's run latch is set and the core is in SMT2 mode."
> > +  },
> > +  {
> > +    "EventCode": "300F4",
> > +    "EventName": "PM_RUN_INST_CMPL_CONC",
> > +    "BriefDescription": "PowerPC instructions completed by this thread when all threads in the core had the run-latch set."
> > +  },
> > +  {
> > +    "EventCode": "4C016",
> > +    "EventName": "PM_EXEC_STALL_DMISS_L2L3_CONFLICT",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from the local L2 or local L3, with a dispatch conflict."
> > +  },
> > +  {
> > +    "EventCode": "4D014",
> > +    "EventName": "PM_EXEC_STALL_LOAD",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a load instruction executing in the Load Store Unit."
> > +  },
> > +  {
> > +    "EventCode": "4D016",
> > +    "EventName": "PM_EXEC_STALL_PTESYNC",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a PTESYNC instruction executing in the Load Store Unit."
> > +  },
> > +  {
> > +    "EventCode": "401EA",
> > +    "EventName": "PM_THRESH_EXC_128",
> > +    "BriefDescription": "Threshold counter exceeded a value of 128."
> > +  },
> > +  {
> > +    "EventCode": "400F6",
> > +    "EventName": "PM_BR_MPRED_CMPL",
> > +    "BriefDescription": "A mispredicted branch completed. Includes direction and target."
> > +  }
> > +]
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/floating_point.json b/tools/perf/pmu-events/arch/powerpc/power10/floating_point.json
> > new file mode 100644
> > index 000000000000..e9b92f282d3c
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/floating_point.json
> > @@ -0,0 +1,7 @@
> > +[
> > +  {
> > +    "EventCode": "4016E",
> > +    "EventName": "PM_THRESH_NOT_MET",
> > +    "BriefDescription": "Threshold counter did not meet threshold."
> > +  }
> > +]
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
> > new file mode 100644
> > index 000000000000..aebaf94bfdfe
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
> > @@ -0,0 +1,217 @@
> > +[
> > +  {
> > +    "EventCode": "10004",
> > +    "EventName": "PM_EXEC_STALL_TRANSLATION",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline suffered a TLB miss or ERAT miss and waited for it to resolve."
> > +  },
> > +  {
> > +    "EventCode": "10010",
> > +    "EventName": "PM_PMC4_OVERFLOW",
> > +    "BriefDescription": "The event selected for PMC4 caused the event counter to overflow."
> > +  },
> > +  {
> > +    "EventCode": "10020",
> > +    "EventName": "PM_PMC4_REWIND",
> > +    "BriefDescription": "The speculative event selected for PMC4 rewinds and the counter for PMC4 is not charged."
> > +  },
> > +  {
> > +    "EventCode": "10038",
> > +    "EventName": "PM_DISP_STALL_TRANSLATION",
> > +    "BriefDescription": "Cycles when dispatch was stalled for this thread because the MMU was handling a translation miss."
> > +  },
> > +  {
> > +    "EventCode": "1003A",
> > +    "EventName": "PM_DISP_STALL_BR_MPRED_IC_L2",
> > +    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L2 after suffering a branch mispredict."
> > +  },
> > +  {
> > +    "EventCode": "1E050",
> > +    "EventName": "PM_DISP_STALL_HELD_STF_MAPPER_CYC",
> > +    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch because the STF mapper/SRB was full. Includes GPR (count, link, tar), VSR, VMR, FPR."
> > +  },
> > +  {
> > +    "EventCode": "1F054",
> > +    "EventName": "PM_DTLB_HIT",
> > +    "BriefDescription": "The PTE required by the instruction was resident in the TLB (data TLB access). When MMCR1[16]=0 this event counts only demand hits. When MMCR1[16]=1 this event includes demand and prefetch. Applies to both HPT and RPT."
> > +  },
> > +  {
> > +    "EventCode": "101E8",
> > +    "EventName": "PM_THRESH_EXC_256",
> > +    "BriefDescription": "Threshold counter exceeded a count of 256."
> > +  },
> > +  {
> > +    "EventCode": "101EC",
> > +    "EventName": "PM_THRESH_MET",
> > +    "BriefDescription": "Threshold exceeded."
> > +  },
> > +  {
> > +    "EventCode": "100F2",
> > +    "EventName": "PM_1PLUS_PPC_CMPL",
> > +    "BriefDescription": "Cycles in which at least one instruction is completed by this thread."
> > +  },
> > +  {
> > +    "EventCode": "100F6",
> > +    "EventName": "PM_IERAT_MISS",
> > +    "BriefDescription": "IERAT Reloaded to satisfy an IERAT miss. All page sizes are counted by this event."
> > +  },
> > +  {
> > +    "EventCode": "100F8",
> > +    "EventName": "PM_DISP_STALL_CYC",
> > +    "BriefDescription": "Cycles the ICT has no itags assigned to this thread (no instructions were dispatched during these cycles)."
> > +  },
> > +  {
> > +    "EventCode": "20114",
> > +    "EventName": "PM_MRK_L2_RC_DISP",
> > +    "BriefDescription": "Marked instruction RC dispatched in L2."
> > +  },
> > +  {
> > +    "EventCode": "2C010",
> > +    "EventName": "PM_EXEC_STALL_LSU",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in the Load Store Unit. This does not include simple fixed point instructions."
> > +  },
> > +  {
> > +    "EventCode": "2C016",
> > +    "EventName": "PM_DISP_STALL_IERAT_ONLY_MISS",
> > +    "BriefDescription": "Cycles when dispatch was stalled while waiting to resolve an instruction ERAT miss."
> > +  },
> > +  {
> > +    "EventCode": "2C01E",
> > +    "EventName": "PM_DISP_STALL_BR_MPRED_IC_L3",
> > +    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L3 after suffering a branch mispredict."
> > +  },
> > +  {
> > +    "EventCode": "2D01A",
> > +    "EventName": "PM_DISP_STALL_IC_MISS",
> > +    "BriefDescription": "Cycles when dispatch was stalled for this thread due to an Icache Miss."
> > +  },
> > +  {
> > +    "EventCode": "2D01C",
> > +    "EventName": "PM_CMPL_STALL_STCX",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a stcx waiting for resolution from the nest before completing."
> > +  },
> > +  {
> > +    "EventCode": "2E018",
> > +    "EventName": "PM_DISP_STALL_FETCH",
> > +    "BriefDescription": "Cycles when dispatch was stalled for this thread because Fetch was being held."
> > +  },
> > +  {
> > +    "EventCode": "2E01A",
> > +    "EventName": "PM_DISP_STALL_HELD_XVFC_MAPPER_CYC",
> > +    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch because the XVFC mapper/SRB was full."
> > +  },
> > +  {
> > +    "EventCode": "2C142",
> > +    "EventName": "PM_MRK_XFER_FROM_SRC_PMC2",
> > +    "BriefDescription": "For a marked data transfer instruction, the processor's L1 data cache was reloaded from the source specified in MMCR3[15:27]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
> > +  },
> > +  {
> > +    "EventCode": "24050",
> > +    "EventName": "PM_IOPS_DISP",
> > +    "BriefDescription": "Internal Operations dispatched. PM_IOPS_DISP / PM_INST_DISP will show the average number of internal operations per PowerPC instruction."
> > +  },
> > +  {
> > +    "EventCode": "2405E",
> > +    "EventName": "PM_ISSUE_CANCEL",
> > +    "BriefDescription": "An instruction issued and the issue was later cancelled. Only one cancel per PowerPC instruction."
> > +  },
> > +  {
> > +    "EventCode": "200FA",
> > +    "EventName": "PM_BR_TAKEN_CMPL",
> > +    "BriefDescription": "Branch Taken instruction completed."
> > +  },
> > +  {
> > +    "EventCode": "30012",
> > +    "EventName": "PM_FLUSH_COMPLETION",
> > +    "BriefDescription": "The instruction that was next to complete (oldest in the pipeline) did not complete because it suffered a flush."
> > +  },
> > +  {
> > +    "EventCode": "30014",
> > +    "EventName": "PM_EXEC_STALL_STORE",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a store instruction executing in the Load Store Unit."
> > +  },
> > +  {
> > +    "EventCode": "30018",
> > +    "EventName": "PM_DISP_STALL_HELD_SCOREBOARD_CYC",
> > +    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch while waiting on the Scoreboard. This event combines VSCR and FPSCR together."
> > +  },
> > +  {
> > +    "EventCode": "30026",
> > +    "EventName": "PM_EXEC_STALL_STORE_MISS",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a store whose cache line was not resident in the L1 and was waiting for allocation of the missing line into the L1."
> > +  },
> > +  {
> > +    "EventCode": "3012A",
> > +    "EventName": "PM_MRK_L2_RC_DONE",
> > +    "BriefDescription": "L2 RC machine completed the transaction for the marked instruction."
> > +  },
> > +  {
> > +    "EventCode": "3F046",
> > +    "EventName": "PM_ITLB_HIT_1G",
> > +    "BriefDescription": "Instruction TLB hit (IERAT reload) page size 1G, which implies Radix Page Table translation is in use. When MMCR1[17]=0 this event counts only for demand misses. When MMCR1[17]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "34058",
> > +    "EventName": "PM_DISP_STALL_BR_MPRED_ICMISS",
> > +    "BriefDescription": "Cycles when dispatch was stalled after a mispredicted branch resulted in an instruction cache miss."
> > +  },
> > +  {
> > +    "EventCode": "3D05C",
> > +    "EventName": "PM_DISP_STALL_HELD_RENAME_CYC",
> > +    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch because the mapper/SRB was full. Includes GPR (count, link, tar), VSR, VMR, FPR and XVFC."
> > +  },
> > +  {
> > +    "EventCode": "3E052",
> > +    "EventName": "PM_DISP_STALL_IC_L3",
> > +    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L3."
> > +  },
> > +  {
> > +    "EventCode": "3E054",
> > +    "EventName": "PM_LD_MISS_L1",
> > +    "BriefDescription": "Load Missed L1, counted at execution time (can be greater than loads finished). LMQ merges are not included in this count. i.e. if a load instruction misses on an address that is already allocated on the LMQ, this event will not increment for that load). Note that this count is per slice, so if a load spans multiple slices this event will increment multiple times for a single load."
> > +  },
> > +  {
> > +    "EventCode": "301EA",
> > +    "EventName": "PM_THRESH_EXC_1024",
> > +    "BriefDescription": "Threshold counter exceeded a value of 1024."
> > +  },
> > +  {
> > +    "EventCode": "300FA",
> > +    "EventName": "PM_INST_FROM_L3MISS",
> > +    "BriefDescription": "The processor's instruction cache was reloaded from a source other than the local core's L1, L2, or L3 due to a demand miss."
> > +  },
> > +  {
> > +    "EventCode": "40006",
> > +    "EventName": "PM_ISSUE_KILL",
> > +    "BriefDescription": "Cycles in which an instruction or group of instructions were cancelled after being issued. This event increments once per occurrence, regardless of how many instructions are included in the issue group."
> > +  },
> > +  {
> > +    "EventCode": "40116",
> > +    "EventName": "PM_MRK_LARX_FIN",
> > +    "BriefDescription": "Marked load and reserve instruction (LARX) finished. LARX and STCX are instructions used to acquire a lock."
> > +  },
> > +  {
> > +    "EventCode": "4C010",
> > +    "EventName": "PM_DISP_STALL_BR_MPRED_IC_L3MISS",
> > +    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from sources beyond the local L3 after suffering a mispredicted branch."
> > +  },
> > +  {
> > +    "EventCode": "4D01E",
> > +    "EventName": "PM_DISP_STALL_BR_MPRED",
> > +    "BriefDescription": "Cycles when dispatch was stalled for this thread due to a mispredicted branch."
> > +  },
> > +  {
> > +    "EventCode": "4E010",
> > +    "EventName": "PM_DISP_STALL_IC_L3MISS",
> > +    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from any source beyond the local L3."
> > +  },
> > +  {
> > +    "EventCode": "4E01A",
> > +    "EventName": "PM_DISP_STALL_HELD_CYC",
> > +    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch for any reason."
> > +  },
> > +  {
> > +    "EventCode": "44056",
> > +    "EventName": "PM_VECTOR_ST_CMPL",
> > +    "BriefDescription": "Vector store instructions completed."
> > +  }
> > +]
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/locks.json b/tools/perf/pmu-events/arch/powerpc/power10/locks.json
> > new file mode 100644
> > index 000000000000..fa81b470d21f
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/locks.json
> > @@ -0,0 +1,12 @@
> > +[
> > +  {
> > +    "EventCode": "1E058",
> > +    "EventName": "PM_STCX_FAIL_FIN",
> > +    "BriefDescription": "Conditional store instruction (STCX) failed. LARX and STCX are instructions used to acquire a lock."
> > +  },
> > +  {
> > +    "EventCode": "4E050",
> > +    "EventName": "PM_STCX_PASS_FIN",
> > +    "BriefDescription": "Conditional store instruction (STCX) passed. LARX and STCX are instructions used to acquire a lock."
> > +  }
> > +]
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/marked.json b/tools/perf/pmu-events/arch/powerpc/power10/marked.json
> > new file mode 100644
> > index 000000000000..ffe38525b18b
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/marked.json
> > @@ -0,0 +1,147 @@
> > +[
> > +  {
> > +    "EventCode": "1002C",
> > +    "EventName": "PM_LD_PREFETCH_CACHE_LINE_MISS",
> > +    "BriefDescription": "The L1 cache was reloaded with a line that fulfills a prefetch request."
> > +  },
> > +  {
> > +    "EventCode": "10132",
> > +    "EventName": "PM_MRK_INST_ISSUED",
> > +    "BriefDescription": "Marked instruction issued. Note that stores always get issued twice, the address gets issued to the LSU and the data gets issued to the VSU. Also, issues can sometimes get killed/cancelled and cause multiple sequential issues for the same instruction."
> > +  },
> > +  {
> > +    "EventCode": "101E0",
> > +    "EventName": "PM_MRK_INST_DISP",
> > +    "BriefDescription": "The thread has dispatched a randomly sampled marked instruction."
> > +  },
> > +  {
> > +    "EventCode": "101E2",
> > +    "EventName": "PM_MRK_BR_TAKEN_CMPL",
> > +    "BriefDescription": "Marked Branch Taken instruction completed."
> > +  },
> > +  {
> > +    "EventCode": "20112",
> > +    "EventName": "PM_MRK_NTF_FIN",
> > +    "BriefDescription": "The marked instruction became the oldest in the pipeline before it finished. It excludes instructions that finish at dispatch."
> > +  },
> > +  {
> > +    "EventCode": "2C01C",
> > +    "EventName": "PM_EXEC_STALL_DMISS_OFF_CHIP",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from a remote chip."
> > +  },
> > +  {
> > +    "EventCode": "20138",
> > +    "EventName": "PM_MRK_ST_NEST",
> > +    "BriefDescription": "A store has been sampled/marked and is at the point of execution where it has completed in the core and can no longer be flushed. At this point the store is sent to the L2."
> > +  },
> > +  {
> > +    "EventCode": "2013A",
> > +    "EventName": "PM_MRK_BRU_FIN",
> > +    "BriefDescription": "Marked Branch instruction finished."
> > +  },
> > +  {
> > +    "EventCode": "2C144",
> > +    "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC2",
> > +    "BriefDescription": "Cycles taken for a marked demand miss to reload a line from the source specified in MMCR3[15:27]."
> > +  },
> > +  {
> > +    "EventCode": "24156",
> > +    "EventName": "PM_MRK_STCX_FIN",
> > +    "BriefDescription": "Marked conditional store instruction (STCX) finished. LARX and STCX are instructions used to acquire a lock."
> > +  },
> > +  {
> > +    "EventCode": "24158",
> > +    "EventName": "PM_MRK_INST",
> > +    "BriefDescription": "An instruction was marked. Includes both Random Instruction Sampling (RIS) at decode time and Random Event Sampling (RES) at the time the configured event happens."
> > +  },
> > +  {
> > +    "EventCode": "2415C",
> > +    "EventName": "PM_MRK_BR_CMPL",
> > +    "BriefDescription": "A marked branch completed. All branches are included."
> > +  },
> > +  {
> > +    "EventCode": "200FD",
> > +    "EventName": "PM_L1_ICACHE_MISS",
> > +    "BriefDescription": "Demand iCache Miss."
> > +  },
> > +  {
> > +    "EventCode": "30130",
> > +    "EventName": "PM_MRK_INST_FIN",
> > +    "BriefDescription": "marked instruction finished. Excludes instructions that finish at dispatch. Note that stores always finish twice since the address gets issued to the LSU and the data gets issued to the VSU."
> > +  },
> > +  {
> > +    "EventCode": "34146",
> > +    "EventName": "PM_MRK_LD_CMPL",
> > +    "BriefDescription": "Marked loads completed."
> > +  },
> > +  {
> > +    "EventCode": "3E158",
> > +    "EventName": "PM_MRK_STCX_FAIL",
> > +    "BriefDescription": "Marked conditional store instruction (STCX) failed. LARX and STCX are instructions used to acquire a lock."
> > +  },
> > +  {
> > +    "EventCode": "3E15A",
> > +    "EventName": "PM_MRK_ST_FIN",
> > +    "BriefDescription": "The marked instruction was a store of any kind."
> > +  },
> > +  {
> > +    "EventCode": "30068",
> > +    "EventName": "PM_L1_ICACHE_RELOADED_PREF",
> > +    "BriefDescription": "Counts all Icache prefetch reloads ( includes demand turned into prefetch)."
> > +  },
> > +  {
> > +    "EventCode": "301E4",
> > +    "EventName": "PM_MRK_BR_MPRED_CMPL",
> > +    "BriefDescription": "Marked Branch Mispredicted. Includes direction and target."
> > +  },
> > +  {
> > +    "EventCode": "300F6",
> > +    "EventName": "PM_LD_DEMAND_MISS_L1",
> > +    "BriefDescription": "The L1 cache was reloaded with a line that fulfills a demand miss request. Counted at reload time, before finish."
> > +  },
> > +  {
> > +    "EventCode": "300FE",
> > +    "EventName": "PM_DATA_FROM_L3MISS",
> > +    "BriefDescription": "The processor's data cache was reloaded from a source other than the local core's L1, L2, or L3 due to a demand miss."
> > +  },
> > +  {
> > +    "EventCode": "40012",
> > +    "EventName": "PM_L1_ICACHE_RELOADED_ALL",
> > +    "BriefDescription": "Counts all Icache reloads includes demand, prefetch, prefetch turned into demand and demand turned into prefetch."
> > +  },
> > +  {
> > +    "EventCode": "40134",
> > +    "EventName": "PM_MRK_INST_TIMEO",
> > +    "BriefDescription": "Marked instruction finish timeout (instruction was lost)."
> > +  },
> > +  {
> > +    "EventCode": "4003C",
> > +    "EventName": "PM_DISP_STALL_HELD_SYNC_CYC",
> > +    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch because of a synchronizing instruction that requires the ICT to be empty before dispatch."
> > +  },
> > +  {
> > +    "EventCode": "4505A",
> > +    "EventName": "PM_SP_FLOP_CMPL",
> > +    "BriefDescription": "Single Precision floating point instructions completed."
> > +  },
> > +  {
> > +    "EventCode": "4D058",
> > +    "EventName": "PM_VECTOR_FLOP_CMPL",
> > +    "BriefDescription": "Vector floating point instructions completed."
> > +  },
> > +  {
> > +    "EventCode": "4D05A",
> > +    "EventName": "PM_NON_MATH_FLOP_CMPL",
> > +    "BriefDescription": "Non Math instructions completed."
> > +  },
> > +  {
> > +    "EventCode": "401E0",
> > +    "EventName": "PM_MRK_INST_CMPL",
> > +    "BriefDescription": "marked instruction completed."
> > +  },
> > +  {
> > +    "EventCode": "400FE",
> > +    "EventName": "PM_DATA_FROM_MEMORY",
> > +    "BriefDescription": "The processor's data cache was reloaded from local, remote, or distant memory due to a demand miss."
> > +  }
> > +]
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/memory.json b/tools/perf/pmu-events/arch/powerpc/power10/memory.json
> > new file mode 100644
> > index 000000000000..6e47b96e2d66
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/memory.json
> > @@ -0,0 +1,192 @@
> > +[
> > +  {
> > +    "EventCode": "1000A",
> > +    "EventName": "PM_PMC3_REWIND",
> > +    "BriefDescription": "The speculative event selected for PMC3 rewinds and the counter for PMC3 is not charged."
> > +  },
> > +  {
> > +    "EventCode": "1C040",
> > +    "EventName": "PM_XFER_FROM_SRC_PMC1",
> > +    "BriefDescription": "The processor's L1 data cache was reloaded from the source specified in MMCR3[0:12]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
> > +  },
> > +  {
> > +    "EventCode": "1C142",
> > +    "EventName": "PM_MRK_XFER_FROM_SRC_PMC1",
> > +    "BriefDescription": "For a marked data transfer instruction, the processor's L1 data cache was reloaded from the source specified in MMCR3[0:12]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
> > +  },
> > +  {
> > +    "EventCode": "1C144",
> > +    "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC1",
> > +    "BriefDescription": "Cycles taken for a marked demand miss to reload a line from the source specified in MMCR3[0:12]."
> > +  },
> > +  {
> > +    "EventCode": "1C056",
> > +    "EventName": "PM_DERAT_MISS_4K",
> > +    "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 4K. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "1C058",
> > +    "EventName": "PM_DTLB_MISS_16G",
> > +    "BriefDescription": "Data TLB reload (after a miss) page size 16G. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "1C05C",
> > +    "EventName": "PM_DTLB_MISS_2M",
> > +    "BriefDescription": "Data TLB reload (after a miss) page size 2M. Implies radix translation was used. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "1E056",
> > +    "EventName": "PM_EXEC_STALL_STORE_PIPE",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in the store unit. This does not include cycles spent handling store misses, PTESYNC instructions or TLBIE instructions."
> > +  },
> > +  {
> > +    "EventCode": "1F150",
> > +    "EventName": "PM_MRK_ST_L2_CYC",
> > +    "BriefDescription": "Cycles from L2 RC dispatch to L2 RC completion."
> > +  },
> > +  {
> > +    "EventCode": "10062",
> > +    "EventName": "PM_LD_L3MISS_PEND_CYC",
> > +    "BriefDescription": "Cycles L3 miss was pending for this thread."
> > +  },
> > +  {
> > +    "EventCode": "20010",
> > +    "EventName": "PM_PMC1_OVERFLOW",
> > +    "BriefDescription": "The event selected for PMC1 caused the event counter to overflow."
> > +  },
> > +  {
> > +    "EventCode": "2001A",
> > +    "EventName": "PM_ITLB_HIT",
> > +    "BriefDescription": "The PTE required to translate the instruction address was resident in the TLB (instruction TLB access/IERAT reload). Applies to both HPT and RPT. When MMCR1[17]=0 this event counts only for demand misses. When MMCR1[17]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "2003E",
> > +    "EventName": "PM_PTESYNC_FIN",
> > +    "BriefDescription": "Ptesync instruction finished in the store unit. Only one ptesync can finish at a time."
> > +  },
> > +  {
> > +    "EventCode": "2C040",
> > +    "EventName": "PM_XFER_FROM_SRC_PMC2",
> > +    "BriefDescription": "The processor's L1 data cache was reloaded from the source specified in MMCR3[15:27]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
> > +  },
> > +  {
> > +    "EventCode": "2C054",
> > +    "EventName": "PM_DERAT_MISS_64K",
> > +    "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 64K. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "2C056",
> > +    "EventName": "PM_DTLB_MISS_4K",
> > +    "BriefDescription": "Data TLB reload (after a miss) page size 4K. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "2D154",
> > +    "EventName": "PM_MRK_DERAT_MISS_64K",
> > +    "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 64K for a marked instruction. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "200F6",
> > +    "EventName": "PM_DERAT_MISS",
> > +    "BriefDescription": "DERAT Reloaded to satisfy a DERAT miss. All page sizes are counted by this event. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "3000A",
> > +    "EventName": "PM_DISP_STALL_ITLB_MISS",
> > +    "BriefDescription": "Cycles when dispatch was stalled while waiting to resolve an instruction TLB miss."
> > +  },
> > +  {
> > +    "EventCode": "30016",
> > +    "EventName": "PM_EXEC_STALL_DERAT_DTLB_MISS",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline suffered a TLB miss and waited for it resolve."
> > +  },
> > +  {
> > +    "EventCode": "3C040",
> > +    "EventName": "PM_XFER_FROM_SRC_PMC3",
> > +    "BriefDescription": "The processor's L1 data cache was reloaded from the source specified in MMCR3[30:42]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
> > +  },
> > +  {
> > +    "EventCode": "3C142",
> > +    "EventName": "PM_MRK_XFER_FROM_SRC_PMC3",
> > +    "BriefDescription": "For a marked data transfer instruction, the processor's L1 data cache was reloaded from the source specified in MMCR3[30:42]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
> > +  },
> > +  {
> > +    "EventCode": "3C144",
> > +    "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC3",
> > +    "BriefDescription": "Cycles taken for a marked demand miss to reload a line from the source specified in MMCR3[30:42]."
> > +  },
> > +  {
> > +    "EventCode": "3C054",
> > +    "EventName": "PM_DERAT_MISS_16M",
> > +    "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 16M. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "3C056",
> > +    "EventName": "PM_DTLB_MISS_64K",
> > +    "BriefDescription": "Data TLB reload (after a miss) page size 64K. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "3C058",
> > +    "EventName": "PM_LARX_FIN",
> > +    "BriefDescription": "Load and reserve instruction (LARX) finished. LARX and STCX are instructions used to acquire a lock."
> > +  },
> > +  {
> > +    "EventCode": "301E2",
> > +    "EventName": "PM_MRK_ST_CMPL",
> > +    "BriefDescription": "Marked store completed and sent to nest. Note that this count excludes cache-inhibited stores."
> > +  },
> > +  {
> > +    "EventCode": "300FC",
> > +    "EventName": "PM_DTLB_MISS",
> > +    "BriefDescription": "The DPTEG required for the load/store instruction in execution was missing from the TLB. It includes pages of all sizes for demand and prefetch activity."
> > +  },
> > +  {
> > +    "EventCode": "4D02C",
> > +    "EventName": "PM_PMC1_REWIND",
> > +    "BriefDescription": "The speculative event selected for PMC1 rewinds and the counter for PMC1 is not charged."
> > +  },
> > +  {
> > +    "EventCode": "4003E",
> > +    "EventName": "PM_LD_CMPL",
> > +    "BriefDescription": "Loads completed."
> > +  },
> > +  {
> > +    "EventCode": "4C040",
> > +    "EventName": "PM_XFER_FROM_SRC_PMC4",
> > +    "BriefDescription": "The processor's L1 data cache was reloaded from the source specified in MMCR3[45:57]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
> > +  },
> > +  {
> > +    "EventCode": "4C142",
> > +    "EventName": "PM_MRK_XFER_FROM_SRC_PMC4",
> > +    "BriefDescription": "For a marked data transfer instruction, the processor's L1 data cache was reloaded from the source specified in MMCR3[45:57]. If MMCR1[16|17] is 0 (default), this count includes only lines that were reloaded to satisfy a demand miss. If MMCR1[16|17] is 1, this count includes both demand misses and prefetch reloads."
> > +  },
> > +  {
> > +    "EventCode": "4C144",
> > +    "EventName": "PM_MRK_XFER_FROM_SRC_CYC_PMC4",
> > +    "BriefDescription": "Cycles taken for a marked demand miss to reload a line from the source specified in MMCR3[45:57]."
> > +  },
> > +  {
> > +    "EventCode": "4C056",
> > +    "EventName": "PM_DTLB_MISS_16M",
> > +    "BriefDescription": "Data TLB reload (after a miss) page size 16M. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "4C05A",
> > +    "EventName": "PM_DTLB_MISS_1G",
> > +    "BriefDescription": "Data TLB reload (after a miss) page size 1G. Implies radix translation was used. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "4C15E",
> > +    "EventName": "PM_MRK_DTLB_MISS_64K",
> > +    "BriefDescription": "Marked Data TLB reload (after a miss) page size 64K. When MMCR1[16]=0 this event counts only for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "4D056",
> > +    "EventName": "PM_NON_FMA_FLOP_CMPL",
> > +    "BriefDescription": "Non FMA instruction completed."
> > +  },
> > +  {
> > +    "EventCode": "40164",
> > +    "EventName": "PM_MRK_DERAT_MISS_2M",
> > +    "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 2M for a marked instruction. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  }
> > +]
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
> > new file mode 100644
> > index 000000000000..2992f7961134
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
> > @@ -0,0 +1,297 @@
> > +[
> > +  {
> > +    "EventCode": "10016",
> > +    "EventName": "PM_VSU0_ISSUE",
> > +    "BriefDescription": "VSU instructions issued to VSU pipe 0."
> > +  },
> > +  {
> > +    "EventCode": "1001C",
> > +    "EventName": "PM_ULTRAVISOR_INST_CMPL",
> > +    "BriefDescription": "PowerPC instructions that completed while the thread was in ultravisor state."
> > +  },
> > +  {
> > +    "EventCode": "100F0",
> > +    "EventName": "PM_CYC",
> > +    "BriefDescription": "Processor cycles."
> > +  },
> > +  {
> > +    "EventCode": "10134",
> > +    "EventName": "PM_MRK_ST_DONE_L2",
> > +    "BriefDescription": "Marked stores completed in L2 (RC machine done)."
> > +  },
> > +  {
> > +    "EventCode": "1505E",
> > +    "EventName": "PM_LD_HIT_L1",
> > +    "BriefDescription": "Loads that finished without experiencing an L1 miss."
> > +  },
> > +  {
> > +    "EventCode": "1D05E",
> > +    "EventName": "PM_DISP_STALL_HELD_HALT_CYC",
> > +    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch because of power management."
> > +  },
> > +  {
> > +    "EventCode": "1E054",
> > +    "EventName": "PM_EXEC_STALL_DMISS_L21_L31",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from another core's L2 or L3 on the same chip."
> > +  },
> > +  {
> > +    "EventCode": "1E05A",
> > +    "EventName": "PM_CMPL_STALL_LWSYNC",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a lwsync waiting to complete."
> > +  },
> > +  {
> > +    "EventCode": "1F056",
> > +    "EventName": "PM_DISP_SS0_2_INSTR_CYC",
> > +    "BriefDescription": "Cycles in which Superslice 0 dispatches either 1 or 2 instructions."
> > +  },
> > +  {
> > +    "EventCode": "1F15C",
> > +    "EventName": "PM_MRK_STCX_L2_CYC",
> > +    "BriefDescription": "Cycles spent in the nest portion of a marked Stcx instruction. It starts counting when the operation starts to drain to the L2 and it stops counting when the instruction retires from the Instruction Completion Table (ICT) in the Instruction Sequencing Unit (ISU)."
> > +  },
> > +  {
> > +    "EventCode": "10066",
> > +    "EventName": "PM_ADJUNCT_CYC",
> > +    "BriefDescription": "Cycles in which the thread is in Adjunct state. MSR[S HV PR] bits = 011."
> > +  },
> > +  {
> > +    "EventCode": "101E4",
> > +    "EventName": "PM_MRK_L1_ICACHE_MISS",
> > +    "BriefDescription": "Marked Instruction suffered an icache Miss."
> > +  },
> > +  {
> > +    "EventCode": "101EA",
> > +    "EventName": "PM_MRK_L1_RELOAD_VALID",
> > +    "BriefDescription": "Marked demand reload."
> > +  },
> > +  {
> > +    "EventCode": "100F4",
> > +    "EventName": "PM_FLOP_CMPL",
> > +    "BriefDescription": "Floating Point Operations Completed. Includes any type. It counts once for each 1, 2, 4 or 8 flop instruction. Use PM_1|2|4|8_FLOP_CMPL events to count flops."
> > +  },
> > +  {
> > +    "EventCode": "100FA",
> > +    "EventName": "PM_RUN_LATCH_ANY_THREAD_CYC",
> > +    "BriefDescription": "Cycles when at least one thread has the run latch set."
> > +  },
> > +  {
> > +    "EventCode": "100FC",
> > +    "EventName": "PM_LD_REF_L1",
> > +    "BriefDescription": "All L1 D cache load references counted at finish, gated by reject. In P9 and earlier this event counted only cacheable loads but in P10 both cacheable and non-cacheable loads are included."
> > +  },
> > +  {
> > +    "EventCode": "20006",
> > +    "EventName": "PM_DISP_STALL_HELD_ISSQ_FULL_CYC",
> > +    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch due to Issue queue full. Includes issue queue and branch queue."
> > +  },
> > +  {
> > +    "EventCode": "2000C",
> > +    "EventName": "PM_RUN_LATCH_ALL_THREADS_CYC",
> > +    "BriefDescription": "Cycles when the run latch is set for all threads."
> > +  },
> > +  {
> > +    "EventCode": "2E010",
> > +    "EventName": "PM_ADJUNCT_INST_CMPL",
> > +    "BriefDescription": "PowerPC instructions that completed while the thread is in Adjunct state."
> > +  },
> > +  {
> > +    "EventCode": "2E014",
> > +    "EventName": "PM_STCX_FIN",
> > +    "BriefDescription": "Conditional store instruction (STCX) finished. LARX and STCX are instructions used to acquire a lock."
> > +  },
> > +  {
> > +    "EventCode": "20130",
> > +    "EventName": "PM_MRK_INST_DECODED",
> > +    "BriefDescription": "An instruction was marked at decode time. Random Instruction Sampling (RIS) only."
> > +  },
> > +  {
> > +    "EventCode": "20132",
> > +    "EventName": "PM_MRK_DFU_ISSUE",
> > +    "BriefDescription": "The marked instruction was a decimal floating point operation issued to the VSU. Measured at issue time."
> > +  },
> > +  {
> > +    "EventCode": "20134",
> > +    "EventName": "PM_MRK_FXU_ISSUE",
> > +    "BriefDescription": "The marked instruction was a fixed point operation issued to the VSU. Measured at issue time."
> > +  },
> > +  {
> > +    "EventCode": "2505C",
> > +    "EventName": "PM_VSU_ISSUE",
> > +    "BriefDescription": "At least one VSU instruction was issued to one of the VSU pipes. Up to 4 per cycle. Includes fixed point operations."
> > +  },
> > +  {
> > +    "EventCode": "2F054",
> > +    "EventName": "PM_DISP_SS1_2_INSTR_CYC",
> > +    "BriefDescription": "Cycles in which Superslice 1 dispatches either 1 or 2 instructions."
> > +  },
> > +  {
> > +    "EventCode": "2F056",
> > +    "EventName": "PM_DISP_SS1_4_INSTR_CYC",
> > +    "BriefDescription": "Cycles in which Superslice 1 dispatches either 3 or 4 instructions."
> > +  },
> > +  {
> > +    "EventCode": "2006C",
> > +    "EventName": "PM_RUN_CYC_SMT4_MODE",
> > +    "BriefDescription": "Cycles when this thread's run latch is set and the core is in SMT4 mode."
> > +  },
> > +  {
> > +    "EventCode": "201E0",
> > +    "EventName": "PM_MRK_DATA_FROM_MEMORY",
> > +    "BriefDescription": "The processor's data cache was reloaded from local, remote, or distant memory due to a demand miss for a marked load."
> > +  },
> > +  {
> > +    "EventCode": "201E4",
> > +    "EventName": "PM_MRK_DATA_FROM_L3MISS",
> > +    "BriefDescription": "The processor's data cache was reloaded from a source other than the local core's L1, L2, or L3 due to a demand miss for a marked load."
> > +  },
> > +  {
> > +    "EventCode": "201E8",
> > +    "EventName": "PM_THRESH_EXC_512",
> > +    "BriefDescription": "Threshold counter exceeded a value of 512."
> > +  },
> > +  {
> > +    "EventCode": "200F2",
> > +    "EventName": "PM_INST_DISP",
> > +    "BriefDescription": "PowerPC instructions dispatched."
> > +  },
> > +  {
> > +    "EventCode": "30132",
> > +    "EventName": "PM_MRK_VSU_FIN",
> > +    "BriefDescription": "VSU marked instructions finished. Excludes simple FX instructions issued to the Store Unit."
> > +  },
> > +  {
> > +    "EventCode": "30038",
> > +    "EventName": "PM_EXEC_STALL_DMISS_LMEM",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from the local memory, local OpenCapp cache, or local OpenCapp memory."
> > +  },
> > +  {
> > +    "EventCode": "3F04A",
> > +    "EventName": "PM_LSU_ST5_FIN",
> > +    "BriefDescription": "LSU Finished an internal operation in ST2 port."
> > +  },
> > +  {
> > +    "EventCode": "34054",
> > +    "EventName": "PM_EXEC_STALL_DMISS_L2L3_NOCONFLICT",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from the local L2 or local L3, without a dispatch conflict."
> > +  },
> > +  {
> > +    "EventCode": "3405A",
> > +    "EventName": "PM_PRIVILEGED_INST_CMPL",
> > +    "BriefDescription": "PowerPC Instructions that completed while the thread is in Privileged state."
> > +  },
> > +  {
> > +    "EventCode": "3F150",
> > +    "EventName": "PM_MRK_ST_DRAIN_CYC",
> > +    "BriefDescription": "cycles to drain st from core to L2."
> > +  },
> > +  {
> > +    "EventCode": "3F054",
> > +    "EventName": "PM_DISP_SS0_4_INSTR_CYC",
> > +    "BriefDescription": "Cycles in which Superslice 0 dispatches either 3 or 4 instructions."
> > +  },
> > +  {
> > +    "EventCode": "3F056",
> > +    "EventName": "PM_DISP_SS0_8_INSTR_CYC",
> > +    "BriefDescription": "Cycles in which Superslice 0 dispatches either 5, 6, 7 or 8 instructions."
> > +  },
> > +  {
> > +    "EventCode": "30162",
> > +    "EventName": "PM_MRK_ISSUE_DEPENDENT_LOAD",
> > +    "BriefDescription": "The marked instruction was dependent on a load. It is eligible for issue kill."
> > +  },
> > +  {
> > +    "EventCode": "40114",
> > +    "EventName": "PM_MRK_START_PROBE_NOP_DISP",
> > +    "BriefDescription": "Marked Start probe nop dispatched. Instruction AND R0,R0,R0."
> > +  },
> > +  {
> > +    "EventCode": "4001C",
> > +    "EventName": "PM_VSU_FIN",
> > +    "BriefDescription": "VSU instructions finished."
> > +  },
> > +  {
> > +    "EventCode": "4C01A",
> > +    "EventName": "PM_EXEC_STALL_DMISS_OFF_NODE",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from a distant chip."
> > +  },
> > +  {
> > +    "EventCode": "4D012",
> > +    "EventName": "PM_PMC3_SAVED",
> > +    "BriefDescription": "The conditions for the speculative event selected for PMC3 are met and PMC3 is charged."
> > +  },
> > +  {
> > +    "EventCode": "4D022",
> > +    "EventName": "PM_HYPERVISOR_INST_CMPL",
> > +    "BriefDescription": "PowerPC instructions that completed while the thread is in hypervisor state."
> > +  },
> > +  {
> > +    "EventCode": "4D026",
> > +    "EventName": "PM_ULTRAVISOR_CYC",
> > +    "BriefDescription": "Cycles when the thread is in Ultravisor state. MSR[S HV PR]=110."
> > +  },
> > +  {
> > +    "EventCode": "4D028",
> > +    "EventName": "PM_PRIVILEGED_CYC",
> > +    "BriefDescription": "Cycles when the thread is in Privileged state. MSR[S HV PR]=x00."
> > +  },
> > +  {
> > +    "EventCode": "40030",
> > +    "EventName": "PM_INST_FIN",
> > +    "BriefDescription": "Instructions finished."
> > +  },
> > +  {
> > +    "EventCode": "44146",
> > +    "EventName": "PM_MRK_STCX_CORE_CYC",
> > +    "BriefDescription": "Cycles spent in the core portion of a marked Stcx instruction. It starts counting when the instruction is decoded and stops counting when it drains into the L2."
> > +  },
> > +  {
> > +    "EventCode": "44054",
> > +    "EventName": "PM_VECTOR_LD_CMPL",
> > +    "BriefDescription": "Vector load instructions completed."
> > +  },
> > +  {
> > +    "EventCode": "45054",
> > +    "EventName": "PM_FMA_CMPL",
> > +    "BriefDescription": "Two floating point instructions completed (FMA class of instructions: fmadd, fnmadd, fmsub, fnmsub). Scalar instructions only."
> > +  },
> > +  {
> > +    "EventCode": "45056",
> > +    "EventName": "PM_SCALAR_FLOP_CMPL",
> > +    "BriefDescription": "Scalar floating point instructions completed."
> > +  },
> > +  {
> > +    "EventCode": "4505C",
> > +    "EventName": "PM_MATH_FLOP_CMPL",
> > +    "BriefDescription": "Math floating point instructions completed."
> > +  },
> > +  {
> > +    "EventCode": "4D05E",
> > +    "EventName": "PM_BR_CMPL",
> > +    "BriefDescription": "A branch completed. All branches are included."
> > +  },
> > +  {
> > +    "EventCode": "4E15E",
> > +    "EventName": "PM_MRK_INST_FLUSHED",
> > +    "BriefDescription": "The marked instruction was flushed."
> > +  },
> > +  {
> > +    "EventCode": "401E6",
> > +    "EventName": "PM_MRK_INST_FROM_L3MISS",
> > +    "BriefDescription": "The processor's instruction cache was reloaded from a source other than the local core's L1, L2, or L3 due to a demand miss for a marked instruction."
> > +  },
> > +  {
> > +    "EventCode": "401E8",
> > +    "EventName": "PM_MRK_DATA_FROM_L2MISS",
> > +    "BriefDescription": "The processor's data cache was reloaded from a source other than the local core's L1 or L2 due to a demand miss for a marked load."
> > +  },
> > +  {
> > +    "EventCode": "400F0",
> > +    "EventName": "PM_LD_DEMAND_MISS_L1_FIN",
> > +    "BriefDescription": "Load Missed L1, counted at finish time."
> > +  },
> > +  {
> > +    "EventCode": "400FA",
> > +    "EventName": "PM_RUN_INST_CMPL",
> > +    "BriefDescription": "Completed PowerPC instructions gated by the run latch."
> > +  }
> > +]
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json b/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
> > new file mode 100644
> > index 000000000000..33c1c39ea323
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/pipeline.json
> > @@ -0,0 +1,297 @@
> > +[
> > +  {
> > +    "EventCode": "100FE",
> > +    "EventName": "PM_INST_CMPL",
> > +    "BriefDescription": "PowerPC instructions completed."
> > +  },
> > +  {
> > +    "EventCode": "10006",
> > +    "EventName": "PM_DISP_STALL_HELD_OTHER_CYC",
> > +    "BriefDescription": "Cycles in which the NTC instruction is held at dispatch for any other reason."
> > +  },
> > +  {
> > +    "EventCode": "1000C",
> > +    "EventName": "PM_LSU_LD0_FIN",
> > +    "BriefDescription": "LSU Finished an internal operation in LD0 port."
> > +  },
> > +  {
> > +    "EventCode": "1000E",
> > +    "EventName": "PM_MMA_ISSUED",
> > +    "BriefDescription": "MMA instructions issued."
> > +  },
> > +  {
> > +    "EventCode": "10012",
> > +    "EventName": "PM_LSU_ST0_FIN",
> > +    "BriefDescription": "LSU Finished an internal operation in ST0 port."
> > +  },
> > +  {
> > +    "EventCode": "10014",
> > +    "EventName": "PM_LSU_ST4_FIN",
> > +    "BriefDescription": "LSU Finished an internal operation in ST4 port."
> > +  },
> > +  {
> > +    "EventCode": "10018",
> > +    "EventName": "PM_IC_DEMAND_CYC",
> > +    "BriefDescription": "Cycles in which an instruction reload is pending to satisfy a demand miss."
> > +  },
> > +  {
> > +    "EventCode": "10022",
> > +    "EventName": "PM_PMC2_SAVED",
> > +    "BriefDescription": "The conditions for the speculative event selected for PMC2 are met and PMC2 is charged."
> > +  },
> > +  {
> > +    "EventCode": "10024",
> > +    "EventName": "PM_PMC5_OVERFLOW",
> > +    "BriefDescription": "The event selected for PMC5 caused the event counter to overflow."
> > +  },
> > +  {
> > +    "EventCode": "10058",
> > +    "EventName": "PM_EXEC_STALL_FIN_AT_DISP",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline finished at dispatch and did not require execution in the LSU, BRU or VSU."
> > +  },
> > +  {
> > +    "EventCode": "1005A",
> > +    "EventName": "PM_FLUSH_MPRED",
> > +    "BriefDescription": "A flush occurred due to a mispredicted branch. Includes target and direction."
> > +  },
> > +  {
> > +    "EventCode": "1C05A",
> > +    "EventName": "PM_DERAT_MISS_2M",
> > +    "BriefDescription": "Data ERAT Miss (Data TLB Access) page size 2M. Implies radix translation. When MMCR1[16]=0 this event counts only DERAT reloads for demand misses. When MMCR1[16]=1 this event includes demand misses and prefetches."
> > +  },
> > +  {
> > +    "EventCode": "10064",
> > +    "EventName": "PM_DISP_STALL_IC_L2",
> > +    "BriefDescription": "Cycles when dispatch was stalled while the instruction was fetched from the local L2."
> > +  },
> > +  {
> > +    "EventCode": "10068",
> > +    "EventName": "PM_BR_FIN",
> > +    "BriefDescription": "A branch instruction finished. Includes predicted/mispredicted/unconditional."
> > +  },
> > +  {
> > +    "EventCode": "1006A",
> > +    "EventName": "PM_FX_LSU_FIN",
> > +    "BriefDescription": "Simple fixed point instruction issued to the store unit. Measured at finish time."
> > +  },
> > +  {
> > +    "EventCode": "1006C",
> > +    "EventName": "PM_RUN_CYC_ST_MODE",
> > +    "BriefDescription": "Cycles when the run latch is set and the core is in ST mode."
> > +  },
> > +  {
> > +    "EventCode": "20004",
> > +    "EventName": "PM_ISSUE_STALL",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was dispatched but not issued yet."
> > +  },
> > +  {
> > +    "EventCode": "2000A",
> > +    "EventName": "PM_HYPERVISOR_CYC",
> > +    "BriefDescription": "Cycles when the thread is in Hypervisor state. MSR[S HV PR]=010."
> > +  },
> > +  {
> > +    "EventCode": "2000E",
> > +    "EventName": "PM_LSU_LD1_FIN",
> > +    "BriefDescription": "LSU Finished an internal operation in LD1 port."
> > +  },
> > +  {
> > +    "EventCode": "2C014",
> > +    "EventName": "PM_CMPL_STALL_SPECIAL",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline required special handling before completing."
> > +  },
> > +  {
> > +    "EventCode": "2C018",
> > +    "EventName": "PM_EXEC_STALL_DMISS_L3MISS",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for a load miss to resolve from a source beyond the local L2 or local L3."
> > +  },
> > +  {
> > +    "EventCode": "2D010",
> > +    "EventName": "PM_LSU_ST1_FIN",
> > +    "BriefDescription": "LSU Finished an internal operation in ST1 port."
> > +  },
> > +  {
> > +    "EventCode": "2D012",
> > +    "EventName": "PM_VSU1_ISSUE",
> > +    "BriefDescription": "VSU instructions issued to VSU pipe 1."
> > +  },
> > +  {
> > +    "EventCode": "2D018",
> > +    "EventName": "PM_EXEC_STALL_VSU",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in the VSU (includes FXU, VSU, CRU)."
> > +  },
> > +  {
> > +    "EventCode": "2E01E",
> > +    "EventName": "PM_EXEC_STALL_NTC_FLUSH",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in any unit before it was flushed. Note that if the flush of the oldest instruction happens after finish, the cycles from dispatch to issue will be included in PM_DISP_STALL and the cycles from issue to finish will be included in PM_EXEC_STALL and its corresponding children."
> > +  },
> > +  {
> > +    "EventCode": "2013C",
> > +    "EventName": "PM_MRK_FX_LSU_FIN",
> > +    "BriefDescription": "The marked instruction was simple fixed point that was issued to the store unit. Measured at finish time."
> > +  },
> > +  {
> > +    "EventCode": "2405A",
> > +    "EventName": "PM_NTC_FIN",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline (NTC) finishes. Note that instructions can finish out of order, therefore not all the instructions that finish have a Next-to-complete status."
> > +  },
> > +  {
> > +    "EventCode": "201E2",
> > +    "EventName": "PM_MRK_LD_MISS_L1",
> > +    "BriefDescription": "Marked DL1 Demand Miss counted at finish time."
> > +  },
> > +  {
> > +    "EventCode": "200F4",
> > +    "EventName": "PM_RUN_CYC",
> > +    "BriefDescription": "Processor cycles gated by the run latch."
> > +  },
> > +  {
> > +    "EventCode": "30004",
> > +    "EventName": "PM_DISP_STALL_FLUSH",
> > +    "BriefDescription": "Cycles when dispatch was stalled because of a flush that happened to an instruction(s) that was not yet NTC. PM_EXEC_STALL_NTC_FLUSH only includes instructions that were flushed after becoming NTC."
> > +  },
> > +  {
> > +    "EventCode": "30008",
> > +    "EventName": "PM_EXEC_STALL",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting to finish in one of the execution units (BRU, LSU, VSU). Only cycles between issue and finish are counted in this category."
> > +  },
> > +  {
> > +    "EventCode": "3001A",
> > +    "EventName": "PM_LSU_ST2_FIN",
> > +    "BriefDescription": "LSU Finished an internal operation in ST2 port."
> > +  },
> > +  {
> > +    "EventCode": "30020",
> > +    "EventName": "PM_PMC2_REWIND",
> > +    "BriefDescription": "The speculative event selected for PMC2 rewinds and the counter for PMC2 is not charged."
> > +  },
> > +  {
> > +    "EventCode": "30022",
> > +    "EventName": "PM_PMC4_SAVED",
> > +    "BriefDescription": "The conditions for the speculative event selected for PMC4 are met and PMC4 is charged."
> > +  },
> > +  {
> > +    "EventCode": "30024",
> > +    "EventName": "PM_PMC6_OVERFLOW",
> > +    "BriefDescription": "The event selected for PMC6 caused the event counter to overflow."
> > +  },
> > +  {
> > +    "EventCode": "30028",
> > +    "EventName": "PM_CMPL_STALL_MEM_ECC",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was waiting for the non-speculative finish of either a stcx waiting for its result or a load waiting for non-critical sectors of data and ECC."
> > +  },
> > +  {
> > +    "EventCode": "30036",
> > +    "EventName": "PM_EXEC_STALL_SIMPLE_FX",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a simple fixed point instruction executing in the Load Store Unit."
> > +  },
> > +  {
> > +    "EventCode": "3003A",
> > +    "EventName": "PM_CMPL_STALL_EXCEPTION",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was not allowed to complete because it was interrupted by ANY exception, which has to be serviced before the instruction can complete."
> > +  },
> > +  {
> > +    "EventCode": "3F044",
> > +    "EventName": "PM_VSU2_ISSUE",
> > +    "BriefDescription": "VSU instructions issued to VSU pipe 2."
> > +  },
> > +  {
> > +    "EventCode": "30058",
> > +    "EventName": "PM_TLBIE_FIN",
> > +    "BriefDescription": "TLBIE instructions finished in the LSU. Two TLBIEs can finish each cycle. All will be counted."
> > +  },
> > +  {
> > +    "EventCode": "3D058",
> > +    "EventName": "PM_SCALAR_FSQRT_FDIV_ISSUE",
> > +    "BriefDescription": "Scalar versions of four floating point operations: fdiv,fsqrt (xvdivdp, xvdivsp, xvsqrtdp, xvsqrtsp)."
> > +  },
> > +  {
> > +    "EventCode": "30066",
> > +    "EventName": "PM_LSU_FIN",
> > +    "BriefDescription": "LSU Finished an internal operation (up to 4 per cycle)."
> > +  },
> > +  {
> > +    "EventCode": "40004",
> > +    "EventName": "PM_FXU_ISSUE",
> > +    "BriefDescription": "A fixed point instruction was issued to the VSU."
> > +  },
> > +  {
> > +    "EventCode": "40008",
> > +    "EventName": "PM_NTC_ALL_FIN",
> > +    "BriefDescription": "Cycles in which both instructions in the ICT entry pair show as finished. These are the cycles between finish and completion for the oldest pair of instructions in the pipeline."
> > +  },
> > +  {
> > +    "EventCode": "40010",
> > +    "EventName": "PM_PMC3_OVERFLOW",
> > +    "BriefDescription": "The event selected for PMC3 caused the event counter to overflow."
> > +  },
> > +  {
> > +    "EventCode": "4C012",
> > +    "EventName": "PM_EXEC_STALL_DERAT_ONLY_MISS",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline suffered an ERAT miss and waited for it resolve."
> > +  },
> > +  {
> > +    "EventCode": "4C018",
> > +    "EventName": "PM_CMPL_STALL",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline cannot complete because the thread was blocked for any reason."
> > +  },
> > +  {
> > +    "EventCode": "4C01E",
> > +    "EventName": "PM_LSU_ST3_FIN",
> > +    "BriefDescription": "LSU Finished an internal operation in ST3 port."
> > +  },
> > +  {
> > +    "EventCode": "4D018",
> > +    "EventName": "PM_EXEC_STALL_BRU",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was executing in the Branch unit."
> > +  },
> > +  {
> > +    "EventCode": "4D01A",
> > +    "EventName": "PM_CMPL_STALL_HWSYNC",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a hwsync waiting for response from L2 before completing."
> > +  },
> > +  {
> > +    "EventCode": "4D01C",
> > +    "EventName": "PM_EXEC_STALL_TLBIEL",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a TLBIEL instruction executing in the Load Store Unit. TLBIEL instructions have lower overhead than TLBIE instructions because they don't get set to the nest."
> > +  },
> > +  {
> > +    "EventCode": "4E012",
> > +    "EventName": "PM_EXEC_STALL_UNKNOWN",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline completed without an ntf_type pulse. The ntf_pulse was missed by the ISU because the NTF finishes and completions came too close together."
> > +  },
> > +  {
> > +    "EventCode": "4D020",
> > +    "EventName": "PM_VSU3_ISSUE",
> > +    "BriefDescription": "VSU instruction was issued to VSU pipe 3."
> > +  },
> > +  {
> > +    "EventCode": "40132",
> > +    "EventName": "PM_MRK_LSU_FIN",
> > +    "BriefDescription": "LSU marked instruction finish."
> > +  },
> > +  {
> > +    "EventCode": "45058",
> > +    "EventName": "PM_IC_MISS_CMPL",
> > +    "BriefDescription": "Non-speculative icache miss, counted at completion."
> > +  },
> > +  {
> > +    "EventCode": "4D050",
> > +    "EventName": "PM_VSU_NON_FLOP_CMPL",
> > +    "BriefDescription": "Non-floating point VSU instructions completed."
> > +  },
> > +  {
> > +    "EventCode": "4D052",
> > +    "EventName": "PM_2FLOP_CMPL",
> > +    "BriefDescription": "Double Precision vector version of fmul, fsub, fcmp, fsel, fabs, fnabs, fres, fsqrte, fneg completed."
> > +  },
> > +  {
> > +    "EventCode": "400F2",
> > +    "EventName": "PM_1PLUS_PPC_DISP",
> > +    "BriefDescription": "Cycles at least one Instr Dispatched."
> > +  },
> > +  {
> > +    "EventCode": "400F8",
> > +    "EventName": "PM_FLUSH",
> > +    "BriefDescription": "Flush (any type)."
> > +  }
> > +]
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/pmc.json b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
> > new file mode 100644
> > index 000000000000..60a0100ee996
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/pmc.json
> > @@ -0,0 +1,22 @@
> > +[
> > +  {
> > +    "EventCode": "301E8",
> > +    "EventName": "PM_THRESH_EXC_64",
> > +    "BriefDescription": "Threshold counter exceeded a value of 64."
> > +  },
> > +  {
> > +    "EventCode": "45050",
> > +    "EventName": "PM_1FLOP_CMPL",
> > +    "BriefDescription": "One floating point instruction completed (fadd, fmul, fsub, fcmp, fsel, fabs, fnabs, fres, fsqrte, fneg)."
> > +  },
> > +  {
> > +    "EventCode": "45052",
> > +    "EventName": "PM_4FLOP_CMPL",
> > +    "BriefDescription": "Four floating point instructions completed (fadd, fmul, fsub, fcmp, fsel, fabs, fnabs, fres, fsqrte, fneg)."
> > +  },
> > +  {
> > +    "EventCode": "4D054",
> > +    "EventName": "PM_8FLOP_CMPL",
> > +    "BriefDescription": "Four Double Precision vector instructions completed."
> > +  }
> > +]
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/translation.json b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
> > new file mode 100644
> > index 000000000000..da44d4ca6ef3
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/translation.json
> > @@ -0,0 +1,57 @@
> > +[
> > +  {
> > +    "EventCode": "1F15E",
> > +    "EventName": "PM_MRK_START_PROBE_NOP_CMPL",
> > +    "BriefDescription": "Marked Start probe nop (AND R0,R0,R0) completed."
> > +  },
> > +  {
> > +    "EventCode": "20016",
> > +    "EventName": "PM_ST_FIN",
> > +    "BriefDescription": "Store finish count. Includes speculative activity."
> > +  },
> > +  {
> > +    "EventCode": "20018",
> > +    "EventName": "PM_ST_FWD",
> > +    "BriefDescription": "Store forwards that finished."
> > +  },
> > +  {
> > +    "EventCode": "2011C",
> > +    "EventName": "PM_MRK_NTF_CYC",
> > +    "BriefDescription": "Cycles during which the marked instruction is the oldest in the pipeline (NTF or NTC)."
> > +  },
> > +  {
> > +    "EventCode": "2E01C",
> > +    "EventName": "PM_EXEC_STALL_TLBIE",
> > +    "BriefDescription": "Cycles in which the oldest instruction in the pipeline was a TLBIE instruction executing in the Load Store Unit."
> > +  },
> > +  {
> > +    "EventCode": "201E6",
> > +    "EventName": "PM_THRESH_EXC_32",
> > +    "BriefDescription": "Threshold counter exceeded a value of 32."
> > +  },
> > +  {
> > +    "EventCode": "200F0",
> > +    "EventName": "PM_ST_CMPL",
> > +    "BriefDescription": "Stores completed from S2Q (2nd-level store queue). This event includes regular stores, stcx and cache inhibited stores. The following operations are excluded (pteupdate, snoop tlbie complete, store atomics, miso, load atomic payloads, tlbie, tlbsync, slbieg, isync, msgsnd, slbiag, cpabort, copy, tcheck, tend, stsync, dcbst, icbi, dcbf, hwsync, lwsync, ptesync, eieio, msgsync)."
> > +  },
> > +  {
> > +    "EventCode": "200FE",
> > +    "EventName": "PM_DATA_FROM_L2MISS",
> > +    "BriefDescription": "The processor's data cache was reloaded from a source other than the local core's L1 or L2 due to a demand miss."
> > +  },
> > +  {
> > +    "EventCode": "30010",
> > +    "EventName": "PM_PMC2_OVERFLOW",
> > +    "BriefDescription": "The event selected for PMC2 caused the event counter to overflow."
> > +  },
> > +  {
> > +    "EventCode": "4D010",
> > +    "EventName": "PM_PMC1_SAVED",
> > +    "BriefDescription": "The conditions for the speculative event selected for PMC1 are met and PMC1 is charged."
> > +  },
> > +  {
> > +    "EventCode": "4D05C",
> > +    "EventName": "PM_DPP_FLOP_CMPL",
> > +    "BriefDescription": "Double-Precision or Quad-Precision instructions completed."
> > +  }
> > +]
> > -- 
> > 2.27.0

-- 

- Arnaldo
