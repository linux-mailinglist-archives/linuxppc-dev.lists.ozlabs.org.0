Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907769B3C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 21:20:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJNVB6n5Rz3f8M
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 07:20:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZAtVCPSW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZAtVCPSW;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJNTF3K76z3c3G
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 07:19:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBAAD61FB9;
	Fri, 17 Feb 2023 20:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C517C433D2;
	Fri, 17 Feb 2023 20:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676665181;
	bh=dbB6CcifEQa8Ji/ciEHNfB6bXYW8j5MS0/6hgubfde0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZAtVCPSW/8iMRPPOnUI/NurcKSXtzlP/M6HiyWMQ+79cplQq08Rk3gkdl5oLSnIoa
	 x3dLOL/lqqqUl7Au1JEwQqP0lWLcO1L3kpdUmnocg3DJgtlAlwFLfjrvUK2o0RDxrt
	 5UBLpRI1vFpGpvwonMsd4QxzDPqETYhtkqkwjjjhgM7Lmrk8onxOfnIynQGJM+L/8i
	 JD/UY/6O0Oi8IB8k8vRkb6wi4vcnJbY7UdjK3mpjOrQEfPnhV3T47ZKpRAiDG4DQi4
	 qUjFGF/pBj6E9a/geHyXln+OrLaYw4EAUu6tOb+o6uLNFNDZ5ScXFMuNQFyyqFBe6C
	 lR6JvPDrOuznw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 9D0A040025; Fri, 17 Feb 2023 17:19:38 -0300 (-03)
Date: Fri, 17 Feb 2023 17:19:38 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Subject: Re: [PATCH] powerpc/perf: Add json metric events to present CPI
 stall cycles in powerpc
Message-ID: <Y+/hWuRFPZwjcIxh@kernel.org>
References: <20230216061240.18067-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fWBb2=g82uVTkUbENThsnZyhzU+BHWVpuM7iYWDuA_TqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fWBb2=g82uVTkUbENThsnZyhzU+BHWVpuM7iYWDuA_TqA@mail.gmail.com>
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
Cc: ak@linux.intel.com, rnsastry@linux.ibm.com, maddy@linux.vnet.ibm.com, linux-perf-users@vger.kernel.org, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, james.clark@arm.com, jolsa@kernel.org, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, Feb 16, 2023 at 10:10:05AM -0800, Ian Rogers escreveu:
> On Wed, Feb 15, 2023 at 10:12 PM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
> >
> > Power10 Performance Monitoring Unit (PMU) provides events
> > to understand stall cycles of different pipeline stages.
> > These events along with completed instructions provides
> > useful metrics for application tuning.
> >
> > Patch implements the json changes to collect counter statistics
> > to present the high level CPI stall breakdown metrics. New metric
> > group is named as "CPI_STALL_RATIO" and this new metric group
> > presents these stall metrics:
> > - DISPATCHED_CPI ( Dispatch stall cycles per insn )
> > - ISSUE_STALL_CPI ( Issue stall cycles per insn )
> > - EXECUTION_STALL_CPI ( Execution stall cycles per insn )
> > - COMPLETION_STALL_CPI ( Completition stall cycles per insn )
> >
> > To avoid multipling of events, PM_RUN_INST_CMPL event has been
> > modified to use PMC5(performance monitoring counter5) instead
> > of PMC4. This change is needed, since completion stall event
> > is using PMC4.
> >
> > Usage example:
> >
> >  ./perf stat --metric-no-group -M CPI_STALL_RATIO <workload>
> >
> >  Performance counter stats for 'workload':
> >
> >     63,056,817,982      PM_CMPL_STALL                    #     0.28 COMPLETION_STALL_CPI
> >  1,743,988,038,896      PM_ISSUE_STALL                   #     7.73 ISSUE_STALL_CPI
> >    225,597,495,030      PM_RUN_INST_CMPL                 #     6.18 DISPATCHED_CPI
> >                                                   #    37.48 EXECUTION_STALL_CPI
> >  1,393,916,546,654      PM_DISP_STALL_CYC
> >  8,455,376,836,463      PM_EXEC_STALL
> >
> > "--metric-no-group" is used for forcing PM_RUN_INST_CMPL to be scheduled
> > in all group for more accuracy.
> >
> > Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> 
> Acked-by: Ian Rogers <irogers@google.com>

Thanks, applied.

- Arnaldo

