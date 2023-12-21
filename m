Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD7E81BB63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 16:56:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mnHjE07U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sww5m6JPMz3cGb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 02:56:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mnHjE07U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sww4v4wk4z30P0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 02:55:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D375619E2;
	Thu, 21 Dec 2023 15:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C32DC433C9;
	Thu, 21 Dec 2023 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703174140;
	bh=oYeU6vuYtU1xXqhDf4oLE8y9AeEh1sjx1Oz8lnC92vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnHjE07UhFwc1hEL4I5XEOg7CsoeSyJveoyJZMzxO2vop/iaZvDtejcVqxhqQ7qQG
	 R1yDpgSBLVtz+Fz7Mgfzwzkn9qIEoGy0Xwrcj4qbRAgykP0v4dZxZ6lfk7lBlyOrzJ
	 C/Swfws8TeaOWJ5qiOB6eHcB1/Cu3P8MFUs6VNr5d03x50BvM/wxY3Imj+UYfeAtiD
	 FCKO9sN7DZq2EEpgHj015kRSdDB4PoIAbQw9Vb3pJJGoZobisBwGqDztuxhVqFfisG
	 dY/7Vmj1h/dAARIi4V2oycBQ24VshUH8Q3josZz9l0A/Ef6BT+B0L2saEKBzHoA2nO
	 Jf1XPqpG/Phiw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id B1233403EF; Thu, 21 Dec 2023 12:55:37 -0300 (-03)
Date: Thu, 21 Dec 2023 12:55:37 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Jing Zhang <renyu.zj@linux.alibaba.com>
Subject: Re: [PATCH] perf vendor events: Remove UTF-8 characters from cmn.json
Message-ID: <ZYRf-ZYIifg8InFJ@kernel.org>
References: <1703138593-50486-1-git-send-email-renyu.zj@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1703138593-50486-1-git-send-email-renyu.zj@linux.alibaba.com>
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
Cc: Ian Rogers <irogers@google.com>, kajoljain <kjain@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Thu, Dec 21, 2023 at 02:03:13PM +0800, Jing Zhang escreveu:
> cmn.json contains UTF-8 characters in brief description which
> could break the perf build on some distros.
> 
> Fix this issue by removing the UTF-8 characters from cmn.json.
> 
> without the fix:
> $find tools/perf/pmu-events/ -name "*.json" | xargs file -i | grep -v us-ascii
> tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json:                   application/json; charset=utf-8
> 
> with the fix:
> $file -i tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json
> tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json: text/plain; charset=us-ascii

Thanks, applied!

- Arnaldo
 
> Fixes: 0b4de7bdf46c5215 ("perf jevents: Add support for Arm CMN PMU aliasing")
> Reported-by: Arnaldo Carvalho de Melo <acme@kernel.com>
> Signed-off-by: Jing Zhang <renyu.zj@linux.alibaba.com>
> ---
>  tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json b/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json
> index 428605c..5ec157c 100644
> --- a/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json
> +++ b/tools/perf/pmu-events/arch/arm64/arm/cmn/sys/cmn.json
> @@ -107,7 +107,7 @@
>  		"EventName": "hnf_qos_hh_retry",
>  		"EventidCode": "0xe",
>  		"NodeType": "0x5",
> -		"BriefDescription": "Counts number of times a HighHigh priority request is protocolretried at the HN‑F.",
> +		"BriefDescription": "Counts number of times a HighHigh priority request is protocolretried at the HN-F.",
>  		"Unit": "arm_cmn",
>  		"Compat": "(434|436|43c|43a).*"
>  	},
> -- 
> 1.8.3.1
> 

-- 

- Arnaldo
