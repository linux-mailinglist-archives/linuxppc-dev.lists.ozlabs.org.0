Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6044E5A4F7B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 16:41:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGY6n2wMyz3c2d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:41:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NM3GMWCM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NM3GMWCM;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGY674GZKz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 00:41:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lJS+pLAi5sb8pBgmQuEnoBizzRdmvXfzdL3MQDy3a/M=; b=NM3GMWCME6KcxUES8h8nuw3Jtz
	yT8WFtLWcEFeiCptFrBzQYF9ZbcPj3SDgh98MFhThfzLX37DexiocmtuU+cxLlRsbdW8387JE0Agf
	HIlNlSSGWkMm/dINC2uaBkERa9wUQ8JKJrn0gyLkCvqClWMMKOFuJUa1Mptrpq80QfIz+aK6tM4QI
	eA326NpyLe5tsWtX+rGIsq1AznuDhNH2OD3I7GweQIRMWnkWWJyS+DiE3qcrYas70B6NTF83GL/0J
	zqfmKrkAN3qPClkCvr1Rg4TuSPP+RHm6+RILfx08k1isT9Nmcpp8B46YGomKVod6QKVLGSEdrf6Nk
	0fv3StdA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSfwh-003ATB-Re; Mon, 29 Aug 2022 14:40:59 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BFBE23002FE;
	Mon, 29 Aug 2022 16:40:56 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9992D2097DAD1; Mon, 29 Aug 2022 16:40:56 +0200 (CEST)
Date: Mon, 29 Aug 2022 16:40:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@amd.com>
Subject: Re: [PATCH] perf: Rewrite core context handling
Message-ID: <YwzP+AFWCx4Ni/kx@hirez.programming.kicks-ass.net>
References: <20220829113347.295-1-ravi.bangoria@amd.com>
 <YwyrUYS30gVbxc2D@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwyrUYS30gVbxc2D@hirez.programming.kicks-ass.net>
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
Cc: mark.rutland@arm.com, irogers@google.com, songliubraving@fb.com, sandipan.das@amd.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, eranian@google.com, kim.phillips@amd.com, will@kernel.org, robh@kernel.org, ak@linux.intel.com, jolsa@redhat.com, mingo@redhat.com, linux-s390@vger.kernel.org, frederic@kernel.org, acme@kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ananth.narayan@amd.com, linuxppc-dev@lists.ozlabs.org, santosh.shukla@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 29, 2022 at 02:04:33PM +0200, Peter Zijlstra wrote:
> On Mon, Aug 29, 2022 at 05:03:47PM +0530, Ravi Bangoria wrote:
> > @@ -12598,6 +12590,7 @@ EXPORT_SYMBOL_GPL(perf_event_create_kernel_counter);
> >  
> >  void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu)
> >  {
> > +#if 0 // XXX buggered - cpu hotplug, who cares
> >  	struct perf_event_context *src_ctx;
> >  	struct perf_event_context *dst_ctx;
> >  	struct perf_event *event, *tmp;
> > @@ -12658,6 +12651,7 @@ void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu)
> >  	}
> >  	mutex_unlock(&dst_ctx->mutex);
> >  	mutex_unlock(&src_ctx->mutex);
> > +#endif
> >  }
> >  EXPORT_SYMBOL_GPL(perf_pmu_migrate_context);
> >  
> 
> Note to self; fix this :-) I'll see if I have time for that later today.

Urgh, while going through that it appears the whole refcounting thing
isn't fully done either.
