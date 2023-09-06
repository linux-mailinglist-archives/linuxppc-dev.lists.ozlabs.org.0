Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1684B793EF8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 16:34:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bh0xq67h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RglJ66wWPz309t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 00:34:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bh0xq67h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 467 seconds by postgrey-1.37 at boromir; Thu, 07 Sep 2023 00:33:41 AEST
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RglH9749Hz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 00:33:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 60DDFB81AD4;
	Wed,  6 Sep 2023 14:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F7BC433C7;
	Wed,  6 Sep 2023 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694010349;
	bh=nVDm2AyYvaQbo3PRlV0G+GBs6l+8eMaPhB03AuB8jZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bh0xq67h0mgqBtftvVvet5zgYBcjsoif2YEUIDBqEnntIB72Ju/43RCNtpmpg1Wr9
	 cvma8uNoI0qBMUv42+Smi41MKF2TARtkR6DQUgE0S+zb/DtGg73CrxI+LobKLMPn8Y
	 hb4pjA91yvLVDx0dlFdzNBPsJif8rHp9ZDyHDIwcWTVbb7oUQaEednR2PMrykA1g9I
	 PRRRwE/w+kxK3K3O0xGFGIch0HTWHf47UtGj9XWGtkJSG2hi8eQMvuciXjCZVAUTtq
	 puLVtWm7fdvG8Bf4ii6YaCMO+utSq44+sb2Vc+AfqSkNDaDrrGbT0MrsWU+U47PuWd
	 UZmrF8aNYlKBw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 3AC39403F4; Wed,  6 Sep 2023 11:25:46 -0300 (-03)
Date: Wed, 6 Sep 2023 11:25:46 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v2 2/3] perf vendor events: Update JSON/events for
 power10 platform
Message-ID: <ZPiL6u+cJAkf6WoX@kernel.org>
References: <20230905114039.176645-1-kjain@linux.ibm.com>
 <20230905114039.176645-2-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905114039.176645-2-kjain@linux.ibm.com>
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
Cc: atrajeev@linux.vnet.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Tue, Sep 05, 2023 at 05:10:38PM +0530, Kajol Jain escreveu:
> Update JSON/Events list with additional data-source events
> for power10 platform.

I changed the cset title to:

"perf vendor events power10: Add extra data-source events"

As it was exactly the same as the first, so when someone does a 'git log
--oneline' it looks like a straight dup.

Please try to provide descriptive subjects.

- Arnaldo
 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  .../arch/powerpc/power10/datasource.json      | 505 ++++++++++++++++++
>  1 file changed, 505 insertions(+)
> 
> diff --git a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
> index 12cfb9785433..6b0356f2d301 100644
> --- a/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
> +++ b/tools/perf/pmu-events/arch/powerpc/power10/datasource.json
> @@ -1278,5 +1278,510 @@
>      "EventCode": "0x0A4240000000C142",
>      "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3_MOD",
>      "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0A4240000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3_MOD_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0A0300000000C142",
> +    "EventName": "PM_MRK_INST_FROM_NON_REGENT_L2L3",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0A0340000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0A0300000010C142",
> +    "EventName": "PM_MRK_INST_FROM_NON_REGENT_L2L3_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0A0340000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_NON_REGENT_L2L3_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 on the same chip in a different regent due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x094100000000C142",
> +    "EventName": "PM_MRK_INST_FROM_LMEM",
> +    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's memory due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x094040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_LMEM",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's memory due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x094100000010C142",
> +    "EventName": "PM_MRK_INST_FROM_LMEM_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's memory due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x094040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_LMEM_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's memory due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x098040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_L_OC_CACHE",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x098040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_L_OC_CACHE_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x09C040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_L_OC_MEM",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI memory due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x09C040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_L_OC_MEM_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI memory due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x098100000000C142",
> +    "EventName": "PM_MRK_INST_FROM_L_OC_ANY",
> +    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x098140000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_L_OC_ANY",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x098100000010C142",
> +    "EventName": "PM_MRK_INST_FROM_L_OC_ANY_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x098140000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_L_OC_ANY_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from the local chip's OpenCAPI cache or memory due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL2_SHR",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL2_SHR_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C4040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL2_MOD",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C4040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL2_MOD_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0100000000C142",
> +    "EventName": "PM_MRK_INST_FROM_RL2",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a remote chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0140000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL2",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a remote chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0100000010C142",
> +    "EventName": "PM_MRK_INST_FROM_RL2_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0140000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL2_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C8040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL3_SHR",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C8040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL3_SHR_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0CC040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL3_MOD",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0CC040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL3_MOD_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C8100000000C142",
> +    "EventName": "PM_MRK_INST_FROM_RL3",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a remote chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C8140000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL3",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a remote chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C8100000010C142",
> +    "EventName": "PM_MRK_INST_FROM_RL3_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C8140000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL3_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0240000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL2L3_SHR",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0240000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL2L3_SHR_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C4240000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL2L3_MOD",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C4240000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL2L3_MOD_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0300000000C142",
> +    "EventName": "PM_MRK_INST_FROM_RL2L3",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0340000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL2L3",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0300000010C142",
> +    "EventName": "PM_MRK_INST_FROM_RL2L3_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0340000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_RL2L3_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a remote chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0D4100000000C142",
> +    "EventName": "PM_MRK_INST_FROM_RMEM",
> +    "BriefDescription": "The processor's instruction cache was reloaded from remote memory (MC slow) due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0D4040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_RMEM",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from remote memory (MC slow) due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0D4100000010C142",
> +    "EventName": "PM_MRK_INST_FROM_RMEM_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from remote memory (MC slow) due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0D4040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_RMEM_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from remote memory (MC slow) due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0D8040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_R_OC_CACHE",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0D8040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_R_OC_CACHE_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0DC040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_R_OC_MEM",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI memory due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0DC040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_R_OC_MEM_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI memory due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0D8100000000C142",
> +    "EventName": "PM_MRK_INST_FROM_R_OC_ANY",
> +    "BriefDescription": "The processor's instruction cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0D8140000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_R_OC_ANY",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0D8100000010C142",
> +    "EventName": "PM_MRK_INST_FROM_R_OC_ANY_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0D8140000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_R_OC_ANY_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a remote chip's OpenCAPI cache or memory due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E0040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL2_SHR",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E0040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL2_SHR_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E4040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL2_MOD",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E4040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL2_MOD_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E0100000000C142",
> +    "EventName": "PM_MRK_INST_FROM_DL2",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a distant chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E0140000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL2",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a distant chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E0100000010C142",
> +    "EventName": "PM_MRK_INST_FROM_DL2_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E0140000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL2_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E8040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL3_SHR",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E8040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL3_SHR_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0EC040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL3_MOD",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0EC040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL3_MOD_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E8100000000C142",
> +    "EventName": "PM_MRK_INST_FROM_DL3",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a distant chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E8140000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL3",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a distant chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E8100000010C142",
> +    "EventName": "PM_MRK_INST_FROM_DL3_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E8140000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL3_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E0240000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL2L3_SHR",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E0240000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL2L3_SHR_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a valid line that was not in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E4240000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL2L3_MOD",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E4240000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL2L3_MOD_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded with a line in the M (exclusive) state from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E0300000000C142",
> +    "EventName": "PM_MRK_INST_FROM_DL2L3",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E0340000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL2L3",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E0300000010C142",
> +    "EventName": "PM_MRK_INST_FROM_DL2L3_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0E0340000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_DL2L3_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a distant chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0F4100000000C142",
> +    "EventName": "PM_MRK_INST_FROM_DMEM",
> +    "BriefDescription": "The processor's instruction cache was reloaded from distant memory (MC slow) due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0F4040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_DMEM",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from distant memory (MC slow) due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0F4100000010C142",
> +    "EventName": "PM_MRK_INST_FROM_DMEM_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from distant memory (MC slow) due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0F4040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_DMEM_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from distant memory (MC slow) due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0F8040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_D_OC_CACHE",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0F8040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_D_OC_CACHE_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0FC040000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_D_OC_MEM",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI memory due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0FC040000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_D_OC_MEM_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI memory due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0F8100000000C142",
> +    "EventName": "PM_MRK_INST_FROM_D_OC_ANY",
> +    "BriefDescription": "The processor's instruction cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0F8140000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_D_OC_ANY",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0F8100000010C142",
> +    "EventName": "PM_MRK_INST_FROM_D_OC_ANY_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0F8140000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_D_OC_ANY_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from a distant chip's OpenCAPI cache or memory due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x080B00000000C142",
> +    "EventName": "PM_MRK_INST_FROM_ONCHIP_CACHE",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x080B40000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_ONCHIP_CACHE",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x080B00000010C142",
> +    "EventName": "PM_MRK_INST_FROM_ONCHIP_CACHE_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x080B40000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_ONCHIP_CACHE_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from the same chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0B00000000C142",
> +    "EventName": "PM_MRK_INST_FROM_OFFCHIP_CACHE",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0B40000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_OFFCHIP_CACHE",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0B00000010C142",
> +    "EventName": "PM_MRK_INST_FROM_OFFCHIP_CACHE_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x0C0B40000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_OFFCHIP_CACHE_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from another core's L2 or L3 from a different chip due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x095900000000C142",
> +    "EventName": "PM_MRK_INST_FROM_ANY_MEMORY",
> +    "BriefDescription": "The processor's instruction cache was reloaded from any chip's memory (MC slow) due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x095840000000C142",
> +    "EventName": "PM_MRK_DATA_FROM_ANY_MEMORY",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from any chip's memory (MC slow) due to a demand miss for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x095900000010C142",
> +    "EventName": "PM_MRK_INST_FROM_ANY_MEMORY_ALL",
> +    "BriefDescription": "The processor's instruction cache was reloaded from any chip's memory (MC slow) due to a demand miss or prefetch reload for a marked instruction."
> +  },
> +  {
> +    "EventCode": "0x095840000020C142",
> +    "EventName": "PM_MRK_DATA_FROM_ANY_MEMORY_ALL",
> +    "BriefDescription": "The processor's L1 data cache was reloaded from any chip's memory (MC slow) due to a demand miss or prefetch reload for a marked instruction."
>    }
>  ]
> -- 
> 2.39.3
> 

-- 

- Arnaldo
