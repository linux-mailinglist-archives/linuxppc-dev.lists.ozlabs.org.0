Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D3F7472ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 15:41:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ox7WX9yA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwP8V2Q2lz3bx2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 23:41:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ox7WX9yA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwP7Y36xTz2yKy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 23:40:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RsWQRKx/OeoTvY5pK5rxepY6U2b9R4mbMkfTJjNifSQ=; b=ox7WX9yAj0+KCrkHFWSZls1lw9
	5lO8dOaMK8RFQVwX0rg6uyhtB0ar8HB/GXCZPoKD/XWiUp8PetmGlgb+ru6qImq81dOFAO1vxUcyn
	niUt1MKSeWx5GV9NjTC0hsfbFwb/uNcCM0BU3lPHuMwio93tNfUSHyYW088OtobYwzxrGSqtn5Qf8
	Wc12zi9UEZlMnrbVjY+td3Nt0dKQbTRMaGlz1T6+SsKsCnTtWGo0v2QNsTDJAnBFXduHFUPAc5RRH
	dDp5E3i8sTNmdBN2Fjz99Ez0sYLoDsuNtn+R0dQgx+0zt7uW8M9/GAYoxKMU6VqiyDCtYCWogedF4
	LUEkSGiw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgGX-00AvzF-2N;
	Tue, 04 Jul 2023 13:40:26 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 148373001CD;
	Tue,  4 Jul 2023 15:40:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id E92912028FBD7; Tue,  4 Jul 2023 15:40:24 +0200 (CEST)
Date: Tue, 4 Jul 2023 15:40:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tobias Huschle <huschle@linux.ibm.com>
Subject: Re: [RFC 1/1] sched/fair: Consider asymmetric scheduler groups in
 load balancer
Message-ID: <20230704134024.GV4253@hirez.programming.kicks-ass.net>
References: <20230515114601.12737-1-huschle@linux.ibm.com>
 <20230515114601.12737-2-huschle@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515114601.12737-2-huschle@linux.ibm.com>
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 15, 2023 at 01:46:01PM +0200, Tobias Huschle wrote:
> The current load balancer implementation implies that scheduler groups,
> within the same domain, all host the same number of CPUs. This is
> reflected in the condition, that a scheduler group, which is load
> balancing and classified as having spare capacity, should pull work
> from the busiest group, if the local group runs less processes than
> the busiest one. This implies that these two groups should run the
> same number of processes, which is problematic if the groups are not 
> of the same size.
> 
> The assumption that scheduler groups within the same scheduler domain
> host the same number of CPUs appears to be true for non-s390 
> architectures.

Mostly; there's historically the cpuset case where we can create
lopsided groups like that. And today we're growing all these hybrid
things that will also tickle this, except they're looking towards
different balancer extentions to deal with the IPC difference so might
not be immediately caring about this here issue.


> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
> ---
>  kernel/sched/fair.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 48b6f0ca13ac..b1307d7e4065 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10426,7 +10426,8 @@ static struct sched_group *find_busiest_group(struct lb_env *env)
>  	 * group's child domain.
>  	 */
>  	if (sds.prefer_sibling && local->group_type == group_has_spare &&
> -	    busiest->sum_nr_running > local->sum_nr_running + 1)
> +	    busiest->sum_nr_running * local->group_weight >
> +			local->sum_nr_running * busiest->group_weight + 1)

Should that not be: busiest->group_weight * (local->sum_nr_running + 1) ?

I'm not opposed to this -- it seems fairly straight forward.

>  		goto force_balance;
>  
>  	if (busiest->group_type != group_overloaded) {
> -- 
> 2.34.1
> 
