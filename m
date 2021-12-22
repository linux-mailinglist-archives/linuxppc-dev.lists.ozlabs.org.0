Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7406347D1D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 13:39:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJtDn3Fj0z3c6Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 23:39:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iFjruRml;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iFjruRml; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJtD70W5gz2xBL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 23:38:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86A76B81C44;
 Wed, 22 Dec 2021 12:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B360C36AE8;
 Wed, 22 Dec 2021 12:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640176721;
 bh=X8gLiOeS8xcQpW3Bzr7sZmDeDrVppwivKHavSRcmzyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iFjruRml9EO3pMNur2FASpJ4o+gW2lWmEQogerntqYvoH7jQ/6QWHG/v3S/MWucDA
 3N/zIgbXQzDcK6Fyfr/E8cEYZBjSYbcofp+43Xlyat6wwX/y2wMGvctK21Zw7BQK4p
 Be/0662LbC7U8v19NASy1D5W86JGH+cXDPFk0iDjYUZstOYQ57DOiA61feYj7LHGS7
 Yjjnx4vDpVHEgzINXXQ3tJ3aPcUSKCZfyKERk8eRpmhVw5kuTi+7U2v1aCeCjhiqnc
 lGhn+VsSpnYNYSCou5hIqdhADvPD+aqOfYbos6q7exEazXF9Krvb3FC4oU5hSR2THK
 vCKY1YhC/ycIg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 70F8940B92; Wed, 22 Dec 2021 09:38:39 -0300 (-03)
Date: Wed, 22 Dec 2021 09:38:39 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH 3/4] powerpc/perf: Add encodings to represent data based
 on newer composite PERF_MEM_LVLNUM* fields
Message-ID: <YcMcT5gbv+3E7LGr@kernel.org>
References: <20211206091749.87585-1-kjain@linux.ibm.com>
 <20211206091749.87585-4-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206091749.87585-4-kjain@linux.ibm.com>
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

Em Mon, Dec 06, 2021 at 02:47:48PM +0530, Kajol Jain escreveu:
> The code represent data coming from L1/L2/L3 cache hits based on
> PERF_MEM_LVL_* namespace, which is in the process of deprecation in
> the favour of newer composite PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_,HOPS_}
> fields.

Thanks, applied.

- Arnaldo

 
> Add data source encodings to represent L1/L2/L3 cache hits based on
> newer composite PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_,HOPS_} fields for
> power10 and older platforms
> 
> Result in power9 system without patch changes:
> 
> localhost:# ./perf mem report --sort="mem,sym,dso" --stdio
>  # Overhead       Samples  Memory access             Symbol                             Shared Object
>  # ........  ............  ........................  .................................  ................
>  #
>     29.51%             1  L2 hit                    [k] perf_event_exec                [kernel.vmlinux]
>     27.05%             1  L1 hit                    [k] perf_ctx_unlock                [kernel.vmlinux]
>     13.93%             1  L1 hit                    [k] vtime_delta                    [kernel.vmlinux]
>     13.11%             1  L1 hit                    [k] prepend_path.isra.11           [kernel.vmlinux]
>      8.20%             1  L1 hit                    [.] 00000038.plt_call.__GI_strlen  libc-2.28.so
>      8.20%             1  L1 hit                    [k] perf_event_interrupt           [kernel.vmlinux]
> 
> Result in power9 system with patch changes:
> 
> localhost:# ./perf mem report --sort="mem,sym,dso" --stdio
>  # Overhead       Samples  Memory access             Symbol                      Shared Object
>  # ........  ............  ........................  ..........................  ................
>  #
>     36.63%             1  L2 or L2 hit              [k] perf_event_exec         [kernel.vmlinux]
>     25.50%             1  L1 or L1 hit              [k] vtime_delta             [kernel.vmlinux]
>     13.12%             1  L1 or L1 hit              [k] unmap_region            [kernel.vmlinux]
>     12.62%             1  L1 or L1 hit              [k] perf_sample_event_took  [kernel.vmlinux]
>      6.93%             1  L1 or L1 hit              [k] perf_ctx_unlock         [kernel.vmlinux]
>      5.20%             1  L1 or L1 hit              [.] __memcpy_power7         libc-2.28.so
> 
> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/perf/isa207-common.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
> index 7ea873ab2e6f..6c6bc8b7d887 100644
> --- a/arch/powerpc/perf/isa207-common.c
> +++ b/arch/powerpc/perf/isa207-common.c
> @@ -220,13 +220,13 @@ static inline u64 isa207_find_source(u64 idx, u32 sub_idx)
>  		/* Nothing to do */
>  		break;
>  	case 1:
> -		ret = PH(LVL, L1);
> +		ret = PH(LVL, L1) | LEVEL(L1) | P(SNOOP, HIT);
>  		break;
>  	case 2:
> -		ret = PH(LVL, L2);
> +		ret = PH(LVL, L2) | LEVEL(L2) | P(SNOOP, HIT);
>  		break;
>  	case 3:
> -		ret = PH(LVL, L3);
> +		ret = PH(LVL, L3) | LEVEL(L3) | P(SNOOP, HIT);
>  		break;
>  	case 4:
>  		if (sub_idx <= 1)
> -- 
> 2.27.0

-- 

- Arnaldo
