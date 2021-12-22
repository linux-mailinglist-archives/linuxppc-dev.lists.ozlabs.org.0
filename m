Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F3F47D1D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 13:37:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJtBq5HP0z3002
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 23:37:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GY70V05O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GY70V05O; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJtB45m1Nz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 23:37:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 25A0EB81C48;
 Wed, 22 Dec 2021 12:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF05EC36AE8;
 Wed, 22 Dec 2021 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640176615;
 bh=qGl8dUD8CJWsNsQWAUSoBTpV2v/CDrYNgJo4cg1vapM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GY70V05Ou21b3HPsS6FkVNh1AdjRnP7ZgxsaRp9EnTrqbKW6B9XBbmPilVMw8Id+3
 jOA4LaFiz0x+5IUKkf/UKFpm1g7BbE9jl96i50PWj/2gp5OZwlWGT0647JLYsalHgx
 Y5x62AahXIlrUOTKBKR4kWp9cSTox/7kdQG1UhHsLCRVBaA5KJG07cUPHmUZ+ulktX
 yry0SJm76Oj94QSNdDDaKTz+aRAijivpXn6s2Y0e0XRhhocH0H6gAbO5kOZqDv5BLU
 UNMmCiB5J/OrnVRGVjGd78kYvhRkvmJy20QovxDNHKAfCyWa+llrkP/TxEGSEFyC1j
 ebucyUoBzhbTQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 36DA340B92; Wed, 22 Dec 2021 09:36:53 -0300 (-03)
Date: Wed, 22 Dec 2021 09:36:53 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH 2/4] tools/perf: Add new macros for mem_hops field
Message-ID: <YcMb5bUOW8BYw9fP@kernel.org>
References: <20211206091749.87585-1-kjain@linux.ibm.com>
 <20211206091749.87585-3-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206091749.87585-3-kjain@linux.ibm.com>
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
Cc: mark.rutland@arm.com, atrajeev@linux.vnet.ibm.com, ak@linux.intel.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, ast@kernel.org, linux-perf-users@vger.kernel.org,
 alexander.shishkin@linux.intel.com, yao.jin@linux.intel.com, mingo@redhat.com,
 paulus@samba.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org,
 songliubraving@fb.com, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Dec 06, 2021 at 02:47:47PM +0530, Kajol Jain escreveu:
> Add new macros for mem_hops field which can be used to
> represent remote-node, socket and board level details.
> 
> Currently the code had macro for HOPS_0 which, corresponds
> to data coming from another core but same node.
> Add new macros for HOPS_1 to HOPS_3 to represent
> remote-node, socket and board level data.
> 
> Also add corresponding strings in the mem_hops array to
> represent mem_hop field data in perf_mem__lvl_scnprintf function
> 
> Incase mem_hops field is used, PERF_MEM_LVLNUM field also need
> to be set inorder to represent the data source. Hence printing
> data source via PERF_MEM_LVL field can be skip in that scenario.
> 
> For ex: Encodings for mem_hops fields with L2 cache:

Thanks, applied.

- Arnaldo

 
> L2                      - local L2
> L2 | REMOTE | HOPS_0    - remote core, same node L2
> L2 | REMOTE | HOPS_1    - remote node, same socket L2
> L2 | REMOTE | HOPS_2    - remote socket, same board L2
> L2 | REMOTE | HOPS_3    - remote board L2
> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  tools/include/uapi/linux/perf_event.h |  5 ++++-
>  tools/perf/util/mem-events.c          | 29 +++++++++++++++++----------
>  2 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
> index bd8860eeb291..4cd39aaccbe7 100644
> --- a/tools/include/uapi/linux/perf_event.h
> +++ b/tools/include/uapi/linux/perf_event.h
> @@ -1332,7 +1332,10 @@ union perf_mem_data_src {
>  
>  /* hop level */
>  #define PERF_MEM_HOPS_0		0x01 /* remote core, same node */
> -/* 2-7 available */
> +#define PERF_MEM_HOPS_1         0x02 /* remote node, same socket */
> +#define PERF_MEM_HOPS_2         0x03 /* remote socket, same board */
> +#define PERF_MEM_HOPS_3         0x04 /* remote board */
> +/* 5-7 available */
>  #define PERF_MEM_HOPS_SHIFT	43
>  
>  #define PERF_MEM_S(a, s) \
> diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
> index 3167b4628b6d..ed0ab838bcc5 100644
> --- a/tools/perf/util/mem-events.c
> +++ b/tools/perf/util/mem-events.c
> @@ -309,6 +309,9 @@ static const char * const mem_hops[] = {
>  	 * to be set with mem_hops field.
>  	 */
>  	"core, same node",
> +	"node, same socket",
> +	"socket, same board",
> +	"board",
>  };
>  
>  int perf_mem__lvl_scnprintf(char *out, size_t sz, struct mem_info *mem_info)
> @@ -316,7 +319,7 @@ int perf_mem__lvl_scnprintf(char *out, size_t sz, struct mem_info *mem_info)
>  	size_t i, l = 0;
>  	u64 m =  PERF_MEM_LVL_NA;
>  	u64 hit, miss;
> -	int printed;
> +	int printed = 0;
>  
>  	if (mem_info)
>  		m  = mem_info->data_src.mem_lvl;
> @@ -335,18 +338,22 @@ int perf_mem__lvl_scnprintf(char *out, size_t sz, struct mem_info *mem_info)
>  		l += 7;
>  	}
>  
> -	if (mem_info && mem_info->data_src.mem_hops)
> +	/*
> +	 * Incase mem_hops field is set, we can skip printing data source via
> +	 * PERF_MEM_LVL namespace.
> +	 */
> +	if (mem_info && mem_info->data_src.mem_hops) {
>  		l += scnprintf(out + l, sz - l, "%s ", mem_hops[mem_info->data_src.mem_hops]);
> -
> -	printed = 0;
> -	for (i = 0; m && i < ARRAY_SIZE(mem_lvl); i++, m >>= 1) {
> -		if (!(m & 0x1))
> -			continue;
> -		if (printed++) {
> -			strcat(out, " or ");
> -			l += 4;
> +	} else {
> +		for (i = 0; m && i < ARRAY_SIZE(mem_lvl); i++, m >>= 1) {
> +			if (!(m & 0x1))
> +				continue;
> +			if (printed++) {
> +				strcat(out, " or ");
> +				l += 4;
> +			}
> +			l += scnprintf(out + l, sz - l, mem_lvl[i]);
>  		}
> -		l += scnprintf(out + l, sz - l, mem_lvl[i]);
>  	}
>  
>  	if (mem_info && mem_info->data_src.mem_lvl_num) {
> -- 
> 2.27.0

-- 

- Arnaldo
