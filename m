Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF24349450
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 15:40:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5nns5q1gz3bwG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 01:40:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=f9Z3n8d4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=f9Z3n8d4; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5nnM6SlPz2yyF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 01:39:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=03Sfa8ytglLlN13ZxnR+Q00mzR+WY66jFRqGNPbAZSA=; b=f9Z3n8d4kjN4SVMwGULXWANrw/
 CUHwQZQbYJjoYZi2BkET3nr9wT+yE7CBb6ZH4xsnNPN38BwnOB2XtxcxBfYDjC9TW9fihC8AfMRNJ
 iKgU9JKfO1Eh/z39sKzRDL5ndpE8HtdkVIP5LBMevSrLzw+eCYXlACSAThKeuZQ6JND4ugMlreg8s
 tMIVXbP80pPnz4Q9RcMjWtCLusUw8eMrLORpxtEFEJIJVpzlbXtDf8szfZoaWQMde4GODjwUK9679
 CqmvhTRfAJmrN3wrA5+QddCAEBgithqMxT3NKaaf3B/uBq5hDhAXZxzfnXtO1Y6GaNe/BifhYr4B8
 IxvQIZNQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lPR7d-00D5Wx-54; Thu, 25 Mar 2021 14:38:33 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D64DF3060C5;
 Thu, 25 Mar 2021 15:38:02 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id F0CA72CBFC94A; Thu, 25 Mar 2021 15:38:01 +0100 (CET)
Date: Thu, 25 Mar 2021 15:38:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH V2 1/5] powerpc/perf: Expose processor pipeline stage
 cycles using PERF_SAMPLE_WEIGHT_STRUCT
Message-ID: <YFygSdFOT5B0DwRU@hirez.programming.kicks-ass.net>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1616425047-1666-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <d7dd633b-e28a-155a-a8e2-0e5a83b4eead@linux.ibm.com>
 <YFyJr+R24TlrMNrC@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFyJr+R24TlrMNrC@kernel.org>
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
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, jolsa@kernel.org,
 kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 25, 2021 at 10:01:35AM -0300, Arnaldo Carvalho de Melo wrote:
> Em Wed, Mar 24, 2021 at 10:05:23AM +0530, Madhavan Srinivasan escreveu:
> > 
> > On 3/22/21 8:27 PM, Athira Rajeev wrote:
> > > Performance Monitoring Unit (PMU) registers in powerpc provides
> > > information on cycles elapsed between different stages in the
> > > pipeline. This can be used for application tuning. On ISA v3.1
> > > platform, this information is exposed by sampling registers.
> > > Patch adds kernel support to capture two of the cycle counters
> > > as part of perf sample using the sample type:
> > > PERF_SAMPLE_WEIGHT_STRUCT.
> > > 
> > > The power PMU function 'get_mem_weight' currently uses 64 bit weight
> > > field of perf_sample_data to capture memory latency. But following the
> > > introduction of PERF_SAMPLE_WEIGHT_TYPE, weight field could contain
> > > 64-bit or 32-bit value depending on the architexture support for
> > > PERF_SAMPLE_WEIGHT_STRUCT. Patches uses WEIGHT_STRUCT to expose the
> > > pipeline stage cycles info. Hence update the ppmu functions to work for
> > > 64-bit and 32-bit weight values.
> > > 
> > > If the sample type is PERF_SAMPLE_WEIGHT, use the 64-bit weight field.
> > > if the sample type is PERF_SAMPLE_WEIGHT_STRUCT, memory subsystem
> > > latency is stored in the low 32bits of perf_sample_weight structure.
> > > Also for CPU_FTR_ARCH_31, capture the two cycle counter information in
> > > two 16 bit fields of perf_sample_weight structure.
> > 
> > Changes looks fine to me.
> > 
> > Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> 
> So who will process the kernel bits? I'm merging the tooling parts,

I was sorta expecting these to go through the powerpc tree. Let me know
if you want them in tip/perf/core instead.
