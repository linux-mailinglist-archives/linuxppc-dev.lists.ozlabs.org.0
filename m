Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B5C176A10
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 02:35:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WfhM5bbQzDqSp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 12:34:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ak@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wffp04vJzDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 12:33:33 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 17:33:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,509,1574150400"; d="scan'208";a="233416585"
Received: from tassilo.jf.intel.com (HELO tassilo.localdomain) ([10.7.201.21])
 by orsmga008.jf.intel.com with ESMTP; 02 Mar 2020 17:33:29 -0800
Received: by tassilo.localdomain (Postfix, from userid 1000)
 id 899533011B1; Mon,  2 Mar 2020 17:33:29 -0800 (PST)
Date: Mon, 2 Mar 2020 17:33:29 -0800
From: Andi Kleen <ak@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC 00/11] perf: Enhancing perf to export processor hazard
 information
Message-ID: <20200303013329.GB1319864@tassilo.jf.intel.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
 <20200302101332.GS18400@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302101332.GS18400@hirez.programming.kicks-ass.net>
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
Cc: mark.rutland@arm.com, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 maddy@linux.ibm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 linux-kernel@vger.kernel.org, eranian@google.com, adrian.hunter@intel.com,
 robert.richter@amd.com, yao.jin@linux.intel.com, mingo@redhat.com,
 paulus@samba.org, acme@kernel.org, namhyung@kernel.org, kim.phillips@amd.com,
 linuxppc-dev@lists.ozlabs.org, alexey.budankov@linux.intel.com,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 02, 2020 at 11:13:32AM +0100, Peter Zijlstra wrote:
> On Mon, Mar 02, 2020 at 10:53:44AM +0530, Ravi Bangoria wrote:
> > Modern processors export such hazard data in Performance
> > Monitoring Unit (PMU) registers. Ex, 'Sampled Instruction Event
> > Register' on IBM PowerPC[1][2] and 'Instruction-Based Sampling' on
> > AMD[3] provides similar information.
> > 
> > Implementation detail:
> > 
> > A new sample_type called PERF_SAMPLE_PIPELINE_HAZ is introduced.
> > If it's set, kernel converts arch specific hazard information
> > into generic format:
> > 
> >   struct perf_pipeline_haz_data {
> >          /* Instruction/Opcode type: Load, Store, Branch .... */
> >          __u8    itype;
> >          /* Instruction Cache source */
> >          __u8    icache;
> >          /* Instruction suffered hazard in pipeline stage */
> >          __u8    hazard_stage;
> >          /* Hazard reason */
> >          __u8    hazard_reason;
> >          /* Instruction suffered stall in pipeline stage */
> >          __u8    stall_stage;
> >          /* Stall reason */
> >          __u8    stall_reason;
> >          __u16   pad;
> >   };
> 
> Kim, does this format indeed work for AMD IBS?

Intel PEBS has a similar concept for annotation of memory accesses,
which is already exported through perf_mem_data_src. This is essentially
an extension. It would be better to have something unified here. 
Right now it seems to duplicate at least part of the PEBS facility.

-Andi

