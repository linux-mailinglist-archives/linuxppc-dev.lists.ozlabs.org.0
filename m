Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD451984BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 21:43:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rjYS4rwvzDqG0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 06:43:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PP5mXLwU; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rjQR1HJMzDqhS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 06:37:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585597020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VMrAn+2AU3YZEvi8AOg4wFePm1q87LPUIBfyZojfJ/Y=;
 b=PP5mXLwUa9mkVlRbQ/ffRSM6Q2404cEQ0aVbzd1jvqlOnVZwcPOuBBA80ppMS1SGKCRC+0
 saMESzu3VrcFWVPi0O1bz7To/uiRIbrfVszdG0kKEWS7XyRJ50kfeMxbO1BFwvZO9iGiUA
 PcTv8iOx+ztZq+iYcKjPNIbYw/NNMZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-vVzSU9jBPeC0dNoiHIxE8w-1; Mon, 30 Mar 2020 15:36:56 -0400
X-MC-Unique: vVzSU9jBPeC0dNoiHIxE8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A786C107ACC4;
 Mon, 30 Mar 2020 19:36:53 +0000 (UTC)
Received: from krava (unknown [10.40.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 336525D9E2;
 Mon, 30 Mar 2020 19:36:47 +0000 (UTC)
Date: Mon, 30 Mar 2020 21:36:44 +0200
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v7 3/6] perf/tools: Refactoring metricgroup__add_metric
 function
Message-ID: <20200330193644.GF2490231@krava>
References: <20200327102528.4267-1-kjain@linux.ibm.com>
 <20200327102528.4267-4-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327102528.4267-4-kjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 sukadev@linux.vnet.ibm.com, ravi.bangoria@linux.ibm.com, acme@kernel.org,
 jmario@redhat.com, namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 27, 2020 at 03:55:25PM +0530, Kajol Jain wrote:

SNIP

> +	eg->ids = ids;
> +	eg->idnum = idnum;
> +	eg->metric_name = pe->metric_name;
> +	eg->metric_expr = pe->metric_expr;
> +	eg->metric_unit = pe->unit;
> +	list_add_tail(&eg->nd, group_list);
> +
> +	return 0;
> +}
> +
>  static int metricgroup__add_metric(const char *metric, struct strbuf *events,
>  				   struct list_head *group_list)
>  {
> @@ -504,35 +538,12 @@ static int metricgroup__add_metric(const char *metric, struct strbuf *events,
>  			continue;
>  		if (match_metric(pe->metric_group, metric) ||
>  		    match_metric(pe->metric_name, metric)) {
> -			const char **ids;
> -			int idnum;
> -			struct egroup *eg;
>  
>  			pr_debug("metric expr %s for %s\n", pe->metric_expr, pe->metric_name);
>  
> -			if (expr__find_other(pe->metric_expr,
> -					     NULL, &ids, &idnum) < 0)
> +			ret = __metricgroup__add_metric(events,	group_list, pe);
> +			if (ret == -EINVAL || !ret)
>  				continue;

what's the point of continue in here? it's end of the loop..

jirka

