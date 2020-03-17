Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E431889E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 17:11:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hdSm1f2dzDqYd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 03:11:04 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=eRomreOF; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hc3M4P6WzDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 02:07:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584457643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EO6KQuA127O5XZwuqvLGhbQe2uTfyPpCExwjf2857y0=;
 b=eRomreOFTohOM8ntNr395DAKqztWOQjQwisZVVqF5IMq6yOOk9Vp+S41qDgJs0mNddFxcN
 /S9LqLQJLFhygUPMwhbwDmHgdTUV2N5q6Ed6vheMUKGXrPZmvVVNbo1Ttw0bVwgucMqf8N
 rn3xw9VfaWHrf7BSJz7kIFLvtjzaFCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-sJ61PwVKPvCDsPCkPWqb7w-1; Tue, 17 Mar 2020 11:07:18 -0400
X-MC-Unique: sJ61PwVKPvCDsPCkPWqb7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B66CD107B789;
 Tue, 17 Mar 2020 15:06:58 +0000 (UTC)
Received: from krava (unknown [10.40.195.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3DB60BF3;
 Tue, 17 Mar 2020 15:06:53 +0000 (UTC)
Date: Tue, 17 Mar 2020 16:06:47 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v5 09/11] perf/tools: Enhance JSON/metric infrastructure
 to handle "?"
Message-ID: <20200317150647.GA757893@krava>
References: <20200317062333.14555-1-kjain@linux.ibm.com>
 <20200317062333.14555-10-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317062333.14555-10-kjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Tue, Mar 17, 2020 at 11:53:31AM +0530, Kajol Jain wrote:

SNIP

> diff --git a/tools/perf/util/expr.h b/tools/perf/util/expr.h
> index 0938ad166ece..7786829b048b 100644
> --- a/tools/perf/util/expr.h
> +++ b/tools/perf/util/expr.h
> @@ -17,12 +17,13 @@ struct expr_parse_ctx {
>  
>  struct expr_scanner_ctx {
>  	int start_token;
> +	int expr__runtimeparam;

no need for expr__ prefix in here.. jsut runtime_param

> diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
> index 402af3e8d287..85ac6d913782 100644
> --- a/tools/perf/util/stat-shadow.c
> +++ b/tools/perf/util/stat-shadow.c
> @@ -336,7 +336,7 @@ void perf_stat__collect_metric_expr(struct evlist *evsel_list)
>  		metric_events = counter->metric_events;
>  		if (!metric_events) {
>  			if (expr__find_other(counter->metric_expr, counter->name,
> -						&metric_names, &num_metric_names) < 0)
> +						&metric_names, &num_metric_names, 1) < 0)
>  				continue;
>  
>  			metric_events = calloc(sizeof(struct evsel *),
> @@ -777,7 +777,15 @@ static void generic_metric(struct perf_stat_config *config,
>  	}
>  
>  	if (!metric_events[i]) {
> -		if (expr__parse(&ratio, &pctx, metric_expr) == 0) {
> +		int param = 1;
> +		if (strstr(metric_expr, "?")) {
> +			char *tmp = strrchr(metric_name, '_');
> +
> +			tmp++;
> +			param = strtol(tmp, &tmp, 10);
> +		}

so, if metric_expr contains '?' you go and search metric_name for '_'
and use the number after '_' ... ugh.. what's the logic? 

I understand you create as many metrics as the magic runtime param
tells you.. but what's the connection to this?

could you please outline in the changelog or comment the whole scheme
of how this all should work? like step by step on some simple example?

thanks,
jirka

