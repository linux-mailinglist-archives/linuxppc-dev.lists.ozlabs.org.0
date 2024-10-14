Return-Path: <linuxppc-dev+bounces-2237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A239D99D594
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 19:27:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS40j264Rz3c18;
	Tue, 15 Oct 2024 04:27:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728926821;
	cv=none; b=mP7Wy4zZ5bZ+WMspL6yLnfk7MlfMA1CEaWnhuxMMNJgMO92+Y6zXiC+suKvDW8WVFdddx2l6yedGvf/n4DwJwYwySOLTDx4ASPmzppJAl6ZzTtrMu0G6MHX6Dmw+SIvNsg5APIu8xRJ7tdsHHSSVQdBZzEGHdKghfeAUzZm2LPbbj/ny3v0g48ULAJUTsUTYQnv9Pc2aRfPoIK5j+fZKrMnURjvxxWkmIIjsrB8dDKoTQrUzTMlkboSh19BIQgKF6GG7AjygXVFgi32iZVjpb9lEGVx10iUeiQvDucucy0gCGR6+WHI5PLbys0tpdAJJat17sMF5Z2/mA56WwoXKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728926821; c=relaxed/relaxed;
	bh=vb6CC0ATnnDCQ5hVpBzxWHXpS31cQUxBty8pdMJW5uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Og4hFb9Afr8e2NclgCQM/7GCFvkF13VExOhyao2iYstP68FgEK/wTDxQHVTgHa8m+gxb9pX5miGt0TCjH89r+E1tTvNvSp8tir2qW4smZl+QsrCHfBrMLoBN5KOPyjPqF/9sAjUmz/OzKMpEaMRJ4SBT0yDSuCiY+QTh3PkkVTvm1F7eFaEL5EuwHFaAsIbsyAprr2zinOM7MzJUH8RCFvZ3JTau9raZBWFEQF6ER7Npza2lXCFsvZTqDAYXKfz8bNtif8cdwLEPfwzN9HpFr87uWpwrSLaotzLCK+zIhMc1cQE8VXZeZJcUrCPPIk57Kp8skLspN9JJgPeZXl+7Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f7O31Ti9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f7O31Ti9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS40h02r6z3byF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 04:26:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5577DA4266B;
	Mon, 14 Oct 2024 17:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A484C4CEC3;
	Mon, 14 Oct 2024 17:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728926814;
	bh=o1rjkEu1OGNo0DCwbiGzMRnRqL92c2F6IPRuk5P+kYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7O31Ti9eMr88M6/7zPqFgYBm5yjpoanS9A0kpH2OjmlW5H2jGTFzE4ls51BY8bpw
	 v2NQIb60Ht9p/NfWK68TPNYK8XGZ0RjUSnvnM8NrFd1aNHPfdp05RAq354w+IGBQ0p
	 6ul39tDy02EYi7JaF0d0WFVWgecvBIlqutqi7Y2HnYxFoTPtBQOJJY1ZUTylva1HUm
	 XIfHhYJbw/fzpxxFwkEmbWgtyi8d2+qcoHLbGgQNs2UXXEmDINkuGzHgat1rdTfTb5
	 XI+uPb0vBxnQWgVc7ujGG0+xTXfRwexaUTDnHH8vpj+HUB5MK67a2p38rkQY0Zzori
	 QI3vM3BRRmG9A==
Date: Mon, 14 Oct 2024 10:26:53 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
	irogers@google.com, linux-perf-users@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, akanksha@linux.ibm.com,
	maddy@linux.ibm.com, kjain@linux.ibm.com,
	disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: Re: [PATCH] tools/perf/tests: Fix compilation error with strncpy in
 tests/tool_pmu
Message-ID: <Zw1UXbWTS9Gk3lmw@google.com>
References: <20241013173742.71882-1-atrajeev@linux.vnet.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241013173742.71882-1-atrajeev@linux.vnet.ibm.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Athira,

On Sun, Oct 13, 2024 at 11:07:42PM +0530, Athira Rajeev wrote:
> perf fails to compile on systems with GCC version11
> as below:
> 
> In file included from /usr/include/string.h:519,
>                  from /home/athir/perf-tools-next/tools/include/linux/bitmap.h:5,
>                  from /home/athir/perf-tools-next/tools/perf/util/pmu.h:5,
>                  from /home/athir/perf-tools-next/tools/perf/util/evsel.h:14,
>                  from /home/athir/perf-tools-next/tools/perf/util/evlist.h:14,
>                  from tests/tool_pmu.c:3:
> In function ‘strncpy’,
>     inlined from ‘do_test’ at tests/tool_pmu.c:25:3:
> /usr/include/bits/string_fortified.h:95:10: error: ‘__builtin_strncpy’ specified bound 128 equals destination size [-Werror=stringop-truncation]
>    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    96 |                                   __glibc_objsize (__dest));
>       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The compile error is from strncpy refernce in do_test:
> 	strncpy(str, tool_pmu__event_to_str(ev), sizeof(str));
> 
> This behaviour is not observed with GCC version 8, but observed
> with GCC version 11 . This is message from gcc for detecting
> truncation while using strncpu. Use snprintf instead of strncpy
> here to be safe.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

I found this issue now and thanks for the quick fix.  I will push to
perf-tools-next soon.

Thanks,
Namhyung

> ---
>  tools/perf/tests/tool_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/tool_pmu.c b/tools/perf/tests/tool_pmu.c
> index 94d0dd8fd3cb..297cc8c55579 100644
> --- a/tools/perf/tests/tool_pmu.c
> +++ b/tools/perf/tests/tool_pmu.c
> @@ -22,7 +22,7 @@ static int do_test(enum tool_pmu_event ev, bool with_pmu)
>  	if (with_pmu)
>  		snprintf(str, sizeof(str), "tool/%s/", tool_pmu__event_to_str(ev));
>  	else
> -		strncpy(str, tool_pmu__event_to_str(ev), sizeof(str));
> +		snprintf(str, sizeof(str), "%s", tool_pmu__event_to_str(ev));
>  
>  	parse_events_error__init(&err);
>  	ret = parse_events(evlist, str, &err);
> -- 
> 2.43.5
> 

