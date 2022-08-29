Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C5E5A4B02
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 14:05:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGTfY1p5Tz3c4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 22:05:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=eHd2QHsK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=eHd2QHsK;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGTdr6Wn0z3bYk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 22:05:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qcOOGcUR+Q47tfc7ZQUsunuQSihKNR/YxuJlx8zxYMI=; b=eHd2QHsK8dfIVJ5r+QNtVVQPkH
	oqFlf9a9fWdDPCXSn7g7aVnwrNDPzUAnqC9EZquRyFPItExfd/d+RYfnOUS3WgkurtCKVAKDhZRI9
	59Ts7WhPLbpu5gK/OkXTr3DTnsIPiwBBBK/FPUgXfRwbe26LSUWrFC6TFXi+CS0uxa0L+J2IzPFBy
	FWNSoqp6ziWeIvIOihGWJKh5sgbwSgMcEvshuPFkLI25/uwcePeGFopw1jf9SYLuSMTGFZ+KgEvOH
	LFFdjw1I7Bz/kSoeQTWtWV6/O1IKnGJB77atySc0cJc9yd3jlB0xeraP+q48fn5mB4wiHj3kGsgdY
	TMhDfvBw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSdVM-0034ba-RJ; Mon, 29 Aug 2022 12:04:36 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E8BCA3002FE;
	Mon, 29 Aug 2022 14:04:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id CE6E020715121; Mon, 29 Aug 2022 14:04:33 +0200 (CEST)
Date: Mon, 29 Aug 2022 14:04:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@amd.com>
Subject: Re: [PATCH] perf: Rewrite core context handling
Message-ID: <YwyrUYS30gVbxc2D@hirez.programming.kicks-ass.net>
References: <20220829113347.295-1-ravi.bangoria@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829113347.295-1-ravi.bangoria@amd.com>
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

On Mon, Aug 29, 2022 at 05:03:47PM +0530, Ravi Bangoria wrote:
> @@ -12598,6 +12590,7 @@ EXPORT_SYMBOL_GPL(perf_event_create_kernel_counter);
>  
>  void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu)
>  {
> +#if 0 // XXX buggered - cpu hotplug, who cares
>  	struct perf_event_context *src_ctx;
>  	struct perf_event_context *dst_ctx;
>  	struct perf_event *event, *tmp;
> @@ -12658,6 +12651,7 @@ void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu)
>  	}
>  	mutex_unlock(&dst_ctx->mutex);
>  	mutex_unlock(&src_ctx->mutex);
> +#endif
>  }
>  EXPORT_SYMBOL_GPL(perf_pmu_migrate_context);
>  

Note to self; fix this :-) I'll see if I have time for that later today.
