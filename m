Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2124607A1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 17:37:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Dfz3Yjkz3cPp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 03:37:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ywh814uD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qd5U4t2i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ywh814uD; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qd5U4t2i; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Df91mZVz2ypZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 03:37:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638117421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u0WPuZI03sGDlrZl0+AEkcj4kDjxnWzt/i4KWwzVe9o=;
 b=Ywh814uDr5dZ+sQGFFzbe+8O1S/PhKqv4kfklRn8a2CBjrorKk4y50XoCizYfpYFXq+jtK
 5JDVGSYdlk/tEok+cVcb7Eap3011uTBzKtLOvoBSF19Xc8pQqXNlcHOkqYIYfOBisYUhb0
 23nVzbqRFWMym5rffwy6KRG/8vW3UFE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638117422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u0WPuZI03sGDlrZl0+AEkcj4kDjxnWzt/i4KWwzVe9o=;
 b=Qd5U4t2ihHHH/ejDwTDY2Lm27PAQSzx0dhsoDU6oItGl+M0V0U0II1xaw7k522tWugFT0M
 3ktrp0MFJW5jeUFynRX7yR2ai0gUjJQPER8VdJM7dEFRuhoQLRdMzua0+uN/fZ+7g4Il1L
 SYTV0PAfPKcRysgM6nm+KHnS7fR0CFk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-OqFKqsCXNWia-0aJGRViAA-1; Sun, 28 Nov 2021 11:35:00 -0500
X-MC-Unique: OqFKqsCXNWia-0aJGRViAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so9054922wmr.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 08:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u0WPuZI03sGDlrZl0+AEkcj4kDjxnWzt/i4KWwzVe9o=;
 b=Kc4WhRHaQK51pvhTdBBRSj0nkqU89za3ZrZnqWFlRV/SQnqzZfmZV2zpT05RFD7/y0
 dVgsl1KarEHA7/hfPRMbSXVgtGSeCOx0AR9mk2yIogcNU8Ch7mJMm3hTa/czigU5HPaY
 LCk7E3SGB56P3DxZRW+u1jzlcUNcBlOFHfEa276leeOoshK01QyOQE6VDXZPdMaT1pPL
 jHwhjtw0Mtn0B9OcgWOpITwC2o9vySRCqy/y8wCmG6C/pXm5saqlkhReipxRn6ouRZdw
 /vDfiG/TAtBxW8fk4yZ9QN/hhjQJsXrgZn3PQbTXElKuSdiqGg5jct4Z4i/mISYCWXJm
 J1FA==
X-Gm-Message-State: AOAM533d77pFOKU7epgbRkpFeo6c1ZaHy9VS1dt3BArpsnRhyQJDOKSV
 BkFkVelo4X8rxL8FXsHslKEeAT+Oqt7qaDTPZVlbxarKwXc2dJ4x8u1Zs0DH/427f5sE/IxLNBy
 HJXoCaN0WXC03IxvpM8O1vdCPuA==
X-Received: by 2002:a7b:c008:: with SMTP id c8mr29691470wmb.87.1638117298965; 
 Sun, 28 Nov 2021 08:34:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5P9GnGdwAy0/ojmvNAW+hWNTvpo6486QdE0YrLbmC7PJ9DePf+HWFFV/x9KAiHv1LGL6pqA==
X-Received: by 2002:a7b:c008:: with SMTP id c8mr29691434wmb.87.1638117298695; 
 Sun, 28 Nov 2021 08:34:58 -0800 (PST)
Received: from krava (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id m9sm13461067wmq.1.2021.11.28.08.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 08:34:58 -0800 (PST)
Date: Sun, 28 Nov 2021 17:34:56 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] tools/perf: Include global and local variants for
 p_stage_cyc sort key
Message-ID: <YaOvsDAnuS+mXnrf@krava>
References: <20211125024851.22895-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211125024851.22895-1-atrajeev@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jolsa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 namhyung@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 25, 2021 at 08:18:50AM +0530, Athira Rajeev wrote:
> Sort key p_stage_cyc is used to present the latency
> cycles spend in pipeline stages. perf tool has local
> p_stage_cyc sort key to display this info. There is no
> global variant available for this sort key. local variant
> shows latency in a sinlge sample, whereas, global value
> will be useful to present the total latency (sum of
> latencies) in the hist entry. It represents latency
> number multiplied by the number of samples.
> 
> Add global (p_stage_cyc) and local variant
> (local_p_stage_cyc) for this sort key. Use the
> local_p_stage_cyc as default option for "mem" sort mode.
> Also add this to list of dynamic sort keys.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> Reported-by: Namhyung Kim <namhyung@kernel.org>

I can't apply this to Arnaldo's perf/core, could you please rebase?

patching file util/hist.c
patching file util/hist.h
patching file util/sort.c
Hunk #3 FAILED at 1392.
Hunk #4 succeeded at 1878 (offset 20 lines).
1 out of 4 hunks FAILED -- saving rejects to file util/sort.c.rej
patching file util/sort.h

thanks,
jirka

> ---
>  tools/perf/util/hist.c |  4 +++-
>  tools/perf/util/hist.h |  3 ++-
>  tools/perf/util/sort.c | 34 +++++++++++++++++++++++++---------
>  tools/perf/util/sort.h |  3 ++-
>  4 files changed, 32 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
> index b776465e04ef..0a8033b09e28 100644
> --- a/tools/perf/util/hist.c
> +++ b/tools/perf/util/hist.c
> @@ -211,7 +211,9 @@ void hists__calc_col_len(struct hists *hists, struct hist_entry *h)
>  	hists__new_col_len(hists, HISTC_MEM_BLOCKED, 10);
>  	hists__new_col_len(hists, HISTC_LOCAL_INS_LAT, 13);
>  	hists__new_col_len(hists, HISTC_GLOBAL_INS_LAT, 13);
> -	hists__new_col_len(hists, HISTC_P_STAGE_CYC, 13);
> +	hists__new_col_len(hists, HISTC_LOCAL_P_STAGE_CYC, 13);
> +	hists__new_col_len(hists, HISTC_GLOBAL_P_STAGE_CYC, 13);
> +
>  	if (symbol_conf.nanosecs)
>  		hists__new_col_len(hists, HISTC_TIME, 16);
>  	else
> diff --git a/tools/perf/util/hist.h b/tools/perf/util/hist.h
> index 5343b62476e6..2752ce681108 100644
> --- a/tools/perf/util/hist.h
> +++ b/tools/perf/util/hist.h
> @@ -75,7 +75,8 @@ enum hist_column {
>  	HISTC_MEM_BLOCKED,
>  	HISTC_LOCAL_INS_LAT,
>  	HISTC_GLOBAL_INS_LAT,
> -	HISTC_P_STAGE_CYC,
> +	HISTC_LOCAL_P_STAGE_CYC,
> +	HISTC_GLOBAL_P_STAGE_CYC,
>  	HISTC_NR_COLS, /* Last entry */
>  };
>  
> diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
> index e9216a292a04..e978f7883e07 100644
> --- a/tools/perf/util/sort.c
> +++ b/tools/perf/util/sort.c
> @@ -37,7 +37,7 @@ const char	default_parent_pattern[] = "^sys_|^do_page_fault";
>  const char	*parent_pattern = default_parent_pattern;
>  const char	*default_sort_order = "comm,dso,symbol";
>  const char	default_branch_sort_order[] = "comm,dso_from,symbol_from,symbol_to,cycles";
> -const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat,p_stage_cyc";
> +const char	default_mem_sort_order[] = "local_weight,mem,sym,dso,symbol_daddr,dso_daddr,snoop,tlb,locked,blocked,local_ins_lat,local_p_stage_cyc";
>  const char	default_top_sort_order[] = "dso,symbol";
>  const char	default_diff_sort_order[] = "dso,symbol";
>  const char	default_tracepoint_sort_order[] = "trace";
> @@ -46,8 +46,8 @@ const char	*field_order;
>  regex_t		ignore_callees_regex;
>  int		have_ignore_callees = 0;
>  enum sort_mode	sort__mode = SORT_MODE__NORMAL;
> -const char	*dynamic_headers[] = {"local_ins_lat", "p_stage_cyc"};
> -const char	*arch_specific_sort_keys[] = {"p_stage_cyc"};
> +const char	*dynamic_headers[] = {"local_ins_lat", "ins_lat", "local_p_stage_cyc", "p_stage_cyc"};
> +const char	*arch_specific_sort_keys[] = {"local_p_stage_cyc", "p_stage_cyc"};
>  
>  /*
>   * Replaces all occurrences of a char used with the:
> @@ -1392,22 +1392,37 @@ struct sort_entry sort_global_ins_lat = {
>  };
>  
>  static int64_t
> -sort__global_p_stage_cyc_cmp(struct hist_entry *left, struct hist_entry *right)
> +sort__p_stage_cyc_cmp(struct hist_entry *left, struct hist_entry *right)
>  {
>  	return left->p_stage_cyc - right->p_stage_cyc;
>  }
>  
> +static int hist_entry__global_p_stage_cyc_snprintf(struct hist_entry *he, char *bf,
> +					size_t size, unsigned int width)
> +{
> +	return repsep_snprintf(bf, size, "%-*u", width,
> +			he->p_stage_cyc * he->stat.nr_events);
> +}
> +
> +
>  static int hist_entry__p_stage_cyc_snprintf(struct hist_entry *he, char *bf,
>  					size_t size, unsigned int width)
>  {
>  	return repsep_snprintf(bf, size, "%-*u", width, he->p_stage_cyc);
>  }
>  
> -struct sort_entry sort_p_stage_cyc = {
> -	.se_header      = "Pipeline Stage Cycle",
> -	.se_cmp         = sort__global_p_stage_cyc_cmp,
> +struct sort_entry sort_local_p_stage_cyc = {
> +	.se_header      = "Local Pipeline Stage Cycle",
> +	.se_cmp         = sort__p_stage_cyc_cmp,
>  	.se_snprintf	= hist_entry__p_stage_cyc_snprintf,
> -	.se_width_idx	= HISTC_P_STAGE_CYC,
> +	.se_width_idx	= HISTC_LOCAL_P_STAGE_CYC,
> +};
> +
> +struct sort_entry sort_global_p_stage_cyc = {
> +	.se_header      = "Pipeline Stage Cycle",
> +	.se_cmp         = sort__p_stage_cyc_cmp,
> +	.se_snprintf    = hist_entry__global_p_stage_cyc_snprintf,
> +	.se_width_idx   = HISTC_GLOBAL_P_STAGE_CYC,
>  };
>  
>  struct sort_entry sort_mem_daddr_sym = {
> @@ -1858,7 +1873,8 @@ static struct sort_dimension common_sort_dimensions[] = {
>  	DIM(SORT_CODE_PAGE_SIZE, "code_page_size", sort_code_page_size),
>  	DIM(SORT_LOCAL_INS_LAT, "local_ins_lat", sort_local_ins_lat),
>  	DIM(SORT_GLOBAL_INS_LAT, "ins_lat", sort_global_ins_lat),
> -	DIM(SORT_PIPELINE_STAGE_CYC, "p_stage_cyc", sort_p_stage_cyc),
> +	DIM(SORT_LOCAL_PIPELINE_STAGE_CYC, "local_p_stage_cyc", sort_local_p_stage_cyc),
> +	DIM(SORT_GLOBAL_PIPELINE_STAGE_CYC, "p_stage_cyc", sort_global_p_stage_cyc),
>  };
>  
>  #undef DIM
> diff --git a/tools/perf/util/sort.h b/tools/perf/util/sort.h
> index 3c7518378d62..83abe5e6812a 100644
> --- a/tools/perf/util/sort.h
> +++ b/tools/perf/util/sort.h
> @@ -235,7 +235,8 @@ enum sort_type {
>  	SORT_CODE_PAGE_SIZE,
>  	SORT_LOCAL_INS_LAT,
>  	SORT_GLOBAL_INS_LAT,
> -	SORT_PIPELINE_STAGE_CYC,
> +	SORT_LOCAL_PIPELINE_STAGE_CYC,
> +	SORT_GLOBAL_PIPELINE_STAGE_CYC,
>  
>  	/* branch stack specific sort keys */
>  	__SORT_BRANCH_STACK,
> -- 
> 2.27.0
> 

