Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 112C793D4C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 16:09:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UVAjqh3P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVqPp05q9z3dLh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 00:09:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UVAjqh3P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVqP54Y3lz3dHm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 00:08:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 27E91CE1780;
	Fri, 26 Jul 2024 14:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E1FC32782;
	Fri, 26 Jul 2024 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722002935;
	bh=DniVSvs2EQarAaQhXsat423CggEHBH8c/V0HDSY9H2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVAjqh3PNdscJcN0OvKtzOOXeZw9OgwPemDolAj3VVS2L06SDAfHPJs4CB2Lvlhge
	 oefyqVEJDRScC8DWQE+4Y6LpG32GZwAIfkRS5edR5MhJ1EX0V4k4Zvo2Gu8TVOFNpW
	 RwM8QJKlzE5Lgba8cv5juKUVEHcRzKyDYCLPIYlREDV5dzR2WmL0my65dFWt+9jUI7
	 NMrThY5xLKhvu7uXWxy9W99n/9Y7E3wicEktr4xIupHAi6UQjJGWXevfCXT1Y1Sp3a
	 mOrU0M8RDdrk1vC4sjpszksXPx25xrfWQx6PUVccBV2k1aOvhLkutaSvV2WxJnumkj
	 3qeilc8YniCKg==
Date: Fri, 26 Jul 2024 11:08:52 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH] perf vendor events power10: Update JSON/events
Message-ID: <ZqOt9G9e-AIN6hY-@x1>
References: <20240723052154.96202-1-kjain@linux.ibm.com>
 <CAP-5=fWsQbA-h=_Y_q7z1E7GjCkHE3w-9h-OXu4jLBM3Fag6ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fWsQbA-h=_Y_q7z1E7GjCkHE3w-9h-OXu4jLBM3Fag6ag@mail.gmail.com>
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
Cc: maddy@linux.ibm.com, Kajol Jain <kjain@linux.ibm.com>, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 23, 2024 at 09:02:23AM -0700, Ian Rogers wrote:
> On Mon, Jul 22, 2024 at 10:27 PM Kajol Jain <kjain@linux.ibm.com> wrote:
> >
> > Update JSON/events for power10 platform with additional events.
> > Also move PM_VECTOR_LD_CMPL event from others.json to
> > frontend.json file.
> >
> > Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> 
> Reviewed-by: Ian Rogers <irogers@google.com>

Thanks, applied to tmp.perf-tools-next,

- Arnaldo
 
> > ---
> >  .../arch/powerpc/power10/frontend.json        |   5 +
> >  .../arch/powerpc/power10/others.json          | 100 +++++++++++++++++-
> >  2 files changed, 100 insertions(+), 5 deletions(-)
> >
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
> > index 5977f5e64212..53660c279286 100644
> > --- a/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/frontend.json
> > @@ -74,6 +74,11 @@
> >      "EventName": "PM_ISSUE_KILL",
> >      "BriefDescription": "Cycles in which an instruction or group of instructions were cancelled after being issued. This event increments once per occurrence, regardless of how many instructions are included in the issue group."
> >    },
> > +  {
> > +    "EventCode": "0x44054",
> > +    "EventName": "PM_VECTOR_LD_CMPL",
> > +    "BriefDescription": "Vector load instruction completed."
> > +  },
> >    {
> >      "EventCode": "0x44056",
> >      "EventName": "PM_VECTOR_ST_CMPL",
> > diff --git a/tools/perf/pmu-events/arch/powerpc/power10/others.json b/tools/perf/pmu-events/arch/powerpc/power10/others.json
> > index fcf8a8ebe7bd..53ca610152fa 100644
> > --- a/tools/perf/pmu-events/arch/powerpc/power10/others.json
> > +++ b/tools/perf/pmu-events/arch/powerpc/power10/others.json
> 
> The "topic" of an event is taken from the filename, here the topic
> will be "others".
> 
> > @@ -94,11 +94,6 @@
> >      "EventName": "PM_L1_ICACHE_RELOADED_ALL",
> >      "BriefDescription": "Counts all instruction cache reloads includes demand, prefetch, prefetch turned into demand and demand turned into prefetch."
> >    },
> > -  {
> > -    "EventCode": "0x44054",
> > -    "EventName": "PM_VECTOR_LD_CMPL",
> > -    "BriefDescription": "Vector load instruction completed."
> > -  },
> >    {
> >      "EventCode": "0x4D05E",
> >      "EventName": "PM_BR_CMPL",
> > @@ -108,5 +103,100 @@
> >      "EventCode": "0x400F0",
> >      "EventName": "PM_LD_DEMAND_MISS_L1_FIN",
> >      "BriefDescription": "Load missed L1, counted at finish time."
> > +  },
> > +  {
> > +    "EventCode": "0x00000038BC",
> > +    "EventName": "PM_ISYNC_CMPL",
> > +    "BriefDescription": "Isync completion count per thread."
> > +  },
> > +  {
> > +    "EventCode": "0x000000C088",
> > +    "EventName": "PM_LD0_32B_FIN",
> > +    "BriefDescription": "256-bit load finished in the LD0 load execution unit."
> > +  },
> > +  {
> > +    "EventCode": "0x000000C888",
> > +    "EventName": "PM_LD1_32B_FIN",
> > +    "BriefDescription": "256-bit load finished in the LD1 load execution unit."
> > +  },
> > +  {
> > +    "EventCode": "0x000000C090",
> > +    "EventName": "PM_LD0_UNALIGNED_FIN",
> > +    "BriefDescription": "Load instructions in LD0 port that are either unaligned, or treated as unaligned and require an additional recycle through the pipeline using the load gather buffer. This typically adds about 10 cycles to the latency of the instruction. This includes loads that cross the 128 byte boundary, octword loads that are not aligned, and a special forward progress case of a load that does not hit in the L1 and crosses the 32 byte boundary and is launched NTC. Counted at finish time."
> > +  },
> > +  {
> > +    "EventCode": "0x000000C890",
> > +    "EventName": "PM_LD1_UNALIGNED_FIN",
> > +    "BriefDescription": "Load instructions in LD1 port that are either unaligned, or treated as unaligned and require an additional recycle through the pipeline using the load gather buffer. This typically adds about 10 cycles to the latency of the instruction. This includes loads that cross the 128 byte boundary, octword loads that are not aligned, and a special forward progress case of a load that does not hit in the L1 and crosses the 32 byte boundary and is launched NTC. Counted at finish time."
> > +  },
> > +  {
> > +    "EventCode": "0x000000C0A4",
> > +    "EventName": "PM_ST0_UNALIGNED_FIN",
> > +    "BriefDescription": "Store instructions in ST0 port that are either unaligned, or treated as unaligned and require an additional recycle through the pipeline. This typically adds about 10 cycles to the latency of the instruction. This only includes stores that cross the 128 byte boundary. Counted at finish time."
> > +  },
> > +  {
> > +    "EventCode": "0x000000C8A4",
> > +    "EventName": "PM_ST1_UNALIGNED_FIN",
> > +    "BriefDescription": "Store instructions in ST1 port that are either unaligned, or treated as unaligned and require an additional recycle through the pipeline. This typically adds about 10 cycles to the latency of the instruction. This only includes stores that cross the 128 byte boundary. Counted at finish time."
> > +  },
> > +  {
> > +    "EventCode": "0x000000C8B8",
> > +    "EventName": "PM_STCX_SUCCESS_CMPL",
> > +    "BriefDescription": "STCX instructions that completed successfully. Specifically, counts only when a pass status is returned from the nest."
> > +  },
> > +  {
> > +    "EventCode": "0x000000D0B4",
> > +    "EventName": "PM_DC_PREF_STRIDED_CONF",
> > +    "BriefDescription": "A demand load referenced a line in an active strided prefetch stream. The stream could have been allocated through the hardware prefetch mechanism or through software."
> > +  },
> > +  {
> > +    "EventCode": "0x000000F880",
> > +    "EventName": "PM_SNOOP_TLBIE_CYC",
> > +    "BriefDescription": "Cycles in which TLBIE snoops are executed in the LSU."
> > +  },
> 
> Perhaps the topics here should be memory or translation?
> 
> > +  {
> > +    "EventCode": "0x000000F084",
> > +    "EventName": "PM_SNOOP_TLBIE_CACHE_WALK_CYC",
> > +    "BriefDescription": "TLBIE snoop cycles in which the data cache is being walked."
> > +  },
> > +  {
> > +    "EventCode": "0x000000F884",
> > +    "EventName": "PM_SNOOP_TLBIE_WAIT_ST_CYC",
> > +    "BriefDescription": "TLBIE snoop cycles in which older stores are still draining."
> > +  },
> > +  {
> > +    "EventCode": "0x000000F088",
> > +    "EventName": "PM_SNOOP_TLBIE_WAIT_LD_CYC",
> > +    "BriefDescription": "TLBIE snoop cycles in which older loads are still draining."
> > +  },
> > +  {
> > +    "EventCode": "0x000000F08C",
> > +    "EventName": "PM_SNOOP_TLBIE_WAIT_MMU_CYC",
> > +    "BriefDescription": "TLBIE snoop cycles in which the Load-Store unit is waiting for the MMU to finish invalidation."
> > +  },
> > +  {
> > +    "EventCode": "0x0000004884",
> > +    "EventName": "PM_NO_FETCH_IBUF_FULL_CYC",
> > +    "BriefDescription": "Cycles in which no instructions are fetched because there is no room in the instruction buffers."
> > +  },
> > +  {
> > +    "EventCode": "0x00000048B4",
> > +    "EventName": "PM_BR_TKN_UNCOND_FIN",
> > +    "BriefDescription": "An unconditional branch finished. All unconditional branches are taken."
> 
> I see PM_BR_TAKEN_CMPL in
> tools/perf/pmu-events/arch/powerpc/power10/frontend.json, so maybe it
> makes sense to put this event in that topic?
> 
> Thanks,
> Ian
> 
> > +  },
> > +  {
> > +    "EventCode": "0x0B0000016080",
> > +    "EventName": "PM_L2_TLBIE_SLBIE_START",
> > +    "BriefDescription": "NCU Master received a TLBIE/SLBIEG/SLBIAG operation from the core. Event count should be multiplied by 2 since the data is coming from a 2:1 clock domain and the data is time sliced across all 4 threads."
> > +  },
> > +  {
> > +    "EventCode": "0x0B0000016880",
> > +    "EventName": "PM_L2_TLBIE_SLBIE_DELAY",
> > +    "BriefDescription": "Cycles when a TLBIE/SLBIEG/SLBIAG command was held in a hottemp condition by the NCU Master. Multiply this count by 1000 to obtain the total number of cycles. This can be divided by PM_L2_TLBIE_SLBIE_SENT to obtain the average time a TLBIE/SLBIEG/SLBIAG command was held. Event count should be multiplied by 2 since the data is coming from a 2:1 clock domain and the data is time sliced across all 4 threads."
> > +  },
> > +  {
> > +    "EventCode": "0x0B0000026880",
> > +    "EventName": "PM_L2_SNP_TLBIE_SLBIE_DELAY",
> > +    "BriefDescription": "Cycles when a TLBIE/SLBIEG/SLBIAG that targets this thread's LPAR was in flight while in a hottemp condition. Multiply this count by 1000 to obtain the total number of cycles. This can be divided by PM_L2_SNP_TLBIE_SLBIE_START to obtain the overall efficiency. Note: ’inflight’ means SnpTLB has been sent to core(ie doesn’t include when SnpTLB is in NCU waiting to be launched serially behind different SnpTLB). The NCU Snooper gets in a ’hottemp’ delay window when it detects it is above its TLBIE/SLBIE threshold for process SnpTLBIE/SLBIE with this core. Event count should be multiplied by 2 since the data is coming from a 2:1 clock domain and the data is time sliced across all 4 threads."
> >    }
> >  ]
> > --
> > 2.43.0
> >
