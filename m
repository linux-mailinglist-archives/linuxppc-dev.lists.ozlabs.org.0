Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CEE34928E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 14:02:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5lcY722fz3bqf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 00:02:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ju/qHmlr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ju/qHmlr; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5lc52Phbz2yxf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 00:01:41 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C087961A11;
 Thu, 25 Mar 2021 13:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616677298;
 bh=VVzdacZ5WDveyzy7D1c2EKGI2GCUWsmL2zx+5NzF7+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ju/qHmlr9oR4lpvM/NzvZFrmuzz3uVjdkKZWi5R31vC8OJbG8FAiNU2GIWtx3KKSx
 R48ajxWLNWLzqyIZzu5s6gNlae9LD+BC4PNLZsUA+sWoMhGpW839bLqoXQ8gwdSJ45
 2nA1gYQSG7LEfdi5yO80kSNL9pTbyuR6xdyCGBkQRe0Lx48FOonJYWFjLppY72kJi/
 rtg4CUIzPigSDE/oBZ3/IpnwffM/cV73cd+u3JsOvCGJhXraOsFWAoodBOnGn65G6f
 AQsNtDonMCyIMvNguvwqBxeP58Rqdd2rVN+jgCQAgZDSqoaR6OhujeOR3gZRdKNAfQ
 W+0XHVJnnTVBA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id CA3D740647; Thu, 25 Mar 2021 10:01:35 -0300 (-03)
Date: Thu, 25 Mar 2021 10:01:35 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH V2 1/5] powerpc/perf: Expose processor pipeline stage
 cycles using PERF_SAMPLE_WEIGHT_STRUCT
Message-ID: <YFyJr+R24TlrMNrC@kernel.org>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1616425047-1666-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <d7dd633b-e28a-155a-a8e2-0e5a83b4eead@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7dd633b-e28a-155a-a8e2-0e5a83b4eead@linux.ibm.com>
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
Cc: ravi.bangoria@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 peterz@infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Wed, Mar 24, 2021 at 10:05:23AM +0530, Madhavan Srinivasan escreveu:
> 
> On 3/22/21 8:27 PM, Athira Rajeev wrote:
> > Performance Monitoring Unit (PMU) registers in powerpc provides
> > information on cycles elapsed between different stages in the
> > pipeline. This can be used for application tuning. On ISA v3.1
> > platform, this information is exposed by sampling registers.
> > Patch adds kernel support to capture two of the cycle counters
> > as part of perf sample using the sample type:
> > PERF_SAMPLE_WEIGHT_STRUCT.
> > 
> > The power PMU function 'get_mem_weight' currently uses 64 bit weight
> > field of perf_sample_data to capture memory latency. But following the
> > introduction of PERF_SAMPLE_WEIGHT_TYPE, weight field could contain
> > 64-bit or 32-bit value depending on the architexture support for
> > PERF_SAMPLE_WEIGHT_STRUCT. Patches uses WEIGHT_STRUCT to expose the
> > pipeline stage cycles info. Hence update the ppmu functions to work for
> > 64-bit and 32-bit weight values.
> > 
> > If the sample type is PERF_SAMPLE_WEIGHT, use the 64-bit weight field.
> > if the sample type is PERF_SAMPLE_WEIGHT_STRUCT, memory subsystem
> > latency is stored in the low 32bits of perf_sample_weight structure.
> > Also for CPU_FTR_ARCH_31, capture the two cycle counter information in
> > two 16 bit fields of perf_sample_weight structure.
> 
> Changes looks fine to me.
> 
> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>

So who will process the kernel bits? I'm merging the tooling parts,

Thanks,

- Arnaldo
 
> 
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > ---
> >   arch/powerpc/include/asm/perf_event_server.h |  2 +-
> >   arch/powerpc/perf/core-book3s.c              |  4 ++--
> >   arch/powerpc/perf/isa207-common.c            | 29 +++++++++++++++++++++++++---
> >   arch/powerpc/perf/isa207-common.h            |  6 +++++-
> >   4 files changed, 34 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
> > index 00e7e671bb4b..112cf092d7b3 100644
> > --- a/arch/powerpc/include/asm/perf_event_server.h
> > +++ b/arch/powerpc/include/asm/perf_event_server.h
> > @@ -43,7 +43,7 @@ struct power_pmu {
> >   				u64 alt[]);
> >   	void		(*get_mem_data_src)(union perf_mem_data_src *dsrc,
> >   				u32 flags, struct pt_regs *regs);
> > -	void		(*get_mem_weight)(u64 *weight);
> > +	void		(*get_mem_weight)(u64 *weight, u64 type);
> >   	unsigned long	group_constraint_mask;
> >   	unsigned long	group_constraint_val;
> >   	u64             (*bhrb_filter_map)(u64 branch_sample_type);
> > diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> > index 766f064f00fb..6936763246bd 100644
> > --- a/arch/powerpc/perf/core-book3s.c
> > +++ b/arch/powerpc/perf/core-book3s.c
> > @@ -2206,9 +2206,9 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
> >   						ppmu->get_mem_data_src)
> >   			ppmu->get_mem_data_src(&data.data_src, ppmu->flags, regs);
> > -		if (event->attr.sample_type & PERF_SAMPLE_WEIGHT &&
> > +		if (event->attr.sample_type & PERF_SAMPLE_WEIGHT_TYPE &&
> >   						ppmu->get_mem_weight)
> > -			ppmu->get_mem_weight(&data.weight.full);
> > +			ppmu->get_mem_weight(&data.weight.full, event->attr.sample_type);
> >   		if (perf_event_overflow(event, &data, regs))
> >   			power_pmu_stop(event, 0);
> > diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
> > index e4f577da33d8..5dcbdbd54598 100644
> > --- a/arch/powerpc/perf/isa207-common.c
> > +++ b/arch/powerpc/perf/isa207-common.c
> > @@ -284,8 +284,10 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
> >   	}
> >   }
> > -void isa207_get_mem_weight(u64 *weight)
> > +void isa207_get_mem_weight(u64 *weight, u64 type)
> >   {
> > +	union perf_sample_weight *weight_fields;
> > +	u64 weight_lat;
> >   	u64 mmcra = mfspr(SPRN_MMCRA);
> >   	u64 exp = MMCRA_THR_CTR_EXP(mmcra);
> >   	u64 mantissa = MMCRA_THR_CTR_MANT(mmcra);
> > @@ -296,9 +298,30 @@ void isa207_get_mem_weight(u64 *weight)
> >   		mantissa = P10_MMCRA_THR_CTR_MANT(mmcra);
> >   	if (val == 0 || val == 7)
> > -		*weight = 0;
> > +		weight_lat = 0;
> >   	else
> > -		*weight = mantissa << (2 * exp);
> > +		weight_lat = mantissa << (2 * exp);
> > +
> > +	/*
> > +	 * Use 64 bit weight field (full) if sample type is
> > +	 * WEIGHT.
> > +	 *
> > +	 * if sample type is WEIGHT_STRUCT:
> > +	 * - store memory latency in the lower 32 bits.
> > +	 * - For ISA v3.1, use remaining two 16 bit fields of
> > +	 *   perf_sample_weight to store cycle counter values
> > +	 *   from sier2.
> > +	 */
> > +	weight_fields = (union perf_sample_weight *)weight;
> > +	if (type & PERF_SAMPLE_WEIGHT)
> > +		weight_fields->full = weight_lat;
> > +	else {
> > +		weight_fields->var1_dw = (u32)weight_lat;
> > +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
> > +			weight_fields->var2_w = P10_SIER2_FINISH_CYC(mfspr(SPRN_SIER2));
> > +			weight_fields->var3_w = P10_SIER2_DISPATCH_CYC(mfspr(SPRN_SIER2));
> > +		}
> > +	}
> >   }
> >   int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp, u64 event_config1)
> > diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
> > index 1af0e8c97ac7..fc30d43c4d0c 100644
> > --- a/arch/powerpc/perf/isa207-common.h
> > +++ b/arch/powerpc/perf/isa207-common.h
> > @@ -265,6 +265,10 @@
> >   #define ISA207_SIER_DATA_SRC_SHIFT	53
> >   #define ISA207_SIER_DATA_SRC_MASK	(0x7ull << ISA207_SIER_DATA_SRC_SHIFT)
> > +/* Bits in SIER2/SIER3 for Power10 */
> > +#define P10_SIER2_FINISH_CYC(sier2)	(((sier2) >> (63 - 37)) & 0x7fful)
> > +#define P10_SIER2_DISPATCH_CYC(sier2)	(((sier2) >> (63 - 13)) & 0x7fful)
> > +
> >   #define P(a, b)				PERF_MEM_S(a, b)
> >   #define PH(a, b)			(P(LVL, HIT) | P(a, b))
> >   #define PM(a, b)			(P(LVL, MISS) | P(a, b))
> > @@ -278,6 +282,6 @@ int isa207_get_alternatives(u64 event, u64 alt[], int size, unsigned int flags,
> >   					const unsigned int ev_alt[][MAX_ALT]);
> >   void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
> >   							struct pt_regs *regs);
> > -void isa207_get_mem_weight(u64 *weight);
> > +void isa207_get_mem_weight(u64 *weight, u64 type);
> >   #endif

-- 

- Arnaldo
