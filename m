Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF8B60635C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 16:42:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtVg95FCnz3drr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 01:42:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=TxFdT5Sh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=TxFdT5Sh;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtVdn5KbCz3drb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 01:41:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6sKArn3fl5+ouv8EYn7A1qXEQs1M7gQhoItikJI0JG8=; b=TxFdT5ShdrFFI1JVzL+bFVTMWP
	/9do5iqXYdMe5lUBOiGbBhoWfJuI0R+/+7if2AvKoB2Kzh5GjErgTwgPQDe1Px8JrQV1QFep4L2+E
	UeUevas2gpKatqsafsmX7JPRqhQ7AIGor6/rd23cHSAKEhk3pcieKGKEcoMnHFqr2WNAuH3BpfFBU
	WmVi8lK7BHvpDHcviVSnt/N6Hxiq4Rpc7sLKL8qirXDNDR/JDWWQJUFkUsN4noEtnzkpcHbxwGy2/
	jidGIha3Zg+HAvYGbFHdkXPzukCLpWeh+8vDlfEveauyRs9Wb2uO2R+aEWSbu7UhiCZ8IALdv85XH
	FL8SVRuw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWiz-00CRqm-3Q; Thu, 20 Oct 2022 14:40:45 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5B03C300209;
	Thu, 20 Oct 2022 16:40:39 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 335682BF40BC0; Thu, 20 Oct 2022 16:40:39 +0200 (CEST)
Date: Thu, 20 Oct 2022 16:40:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH] [perf/core: Update sample_flags for raw_data in
 perf_output_sample
Message-ID: <Y1Fd57P5I+aSNT/V@hirez.programming.kicks-ass.net>
References: <20221020070657.21571-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020070657.21571-1-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org, acme@kernel.org, linux-perf-users@vger.kernel.org, james.clark@arm.com, jolsa@kernel.org, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 20, 2022 at 12:36:56PM +0530, Athira Rajeev wrote:
> commit 838d9bb62d13 ("perf: Use sample_flags for raw_data")
> added check for PERF_SAMPLE_RAW in sample_flags in
> perf_prepare_sample(). But while copying the sample in memory,
> the check for sample_flags is not added in perf_output_sample().
> Fix adds the same in perf_output_sample as well.
> 
> Fixes: 838d9bb62d13 ("perf: Use sample_flags for raw_data")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
>  kernel/events/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 4ec3717003d5..daf387c75d33 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7099,7 +7099,7 @@ void perf_output_sample(struct perf_output_handle *handle,
>  	if (sample_type & PERF_SAMPLE_RAW) {
>  		struct perf_raw_record *raw = data->raw;
>  
> -		if (raw) {
> +		if (raw && (data->sample_flags & PERF_SAMPLE_RAW)) {
>  			struct perf_raw_frag *frag = &raw->frag;
>  
>  			perf_output_put(handle, raw->size);

Urgh.. something smells here. We already did a PERF_SAMPLE_RAW test.

And perf_prepare_sample() explicitly makes data->raw be NULL when not
set earlier.

So what's going wrong?

