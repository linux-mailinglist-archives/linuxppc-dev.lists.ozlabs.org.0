Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD2346F3CF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 20:18:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J93jG0ccDz3c7k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 06:18:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ckgeEJQI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=acme@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ckgeEJQI; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J93hZ0SBLz30J3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 06:17:49 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A4791CE27EF;
 Thu,  9 Dec 2021 19:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08CEC341C6;
 Thu,  9 Dec 2021 19:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639077463;
 bh=l8aT2KFL66nTXjJzC+nFcTYlOzHn82GOsxi5oeVWqXE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ckgeEJQIO8DMz1SvfiIwuXablyJcWbuWPrlZfMFBsL7PHVeL+tKZC5OQhmYbvMoJS
 2MAnUpmjSgIZJcwQV7maFNq67++Jv+PeWQwGJIF1shOh+jMQlXfBqS0RfkNxl/nwoK
 /c8U2jJ2E0RSEDn8zbypb1bbuvC7IgET/dqeGLCtqHleCQyL74ptX/ovL+OOjnTk4/
 svFVOKla7gMg4bdxhHiv99W8HfKviDpsOth4+qsZr053ksruRrkNgTyDNgxyXgPdJZ
 EkdzOR0TkZJMvKrLIxJp6wXHQA8AW1FeTsQanJKzzvfC1ekiX/92ddtHef/Y+xW/oz
 ouBiUv7YQ5AcQ==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 77CF3405D8; Thu,  9 Dec 2021 16:17:41 -0300 (-03)
Date: Thu, 9 Dec 2021 16:17:41 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH 0/4] perf: Add new macros for mem_hops field
Message-ID: <YbJWVYZg1el9PR1I@kernel.org>
References: <20211206091749.87585-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206091749.87585-1-kjain@linux.ibm.com>
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

Em Mon, Dec 06, 2021 at 02:47:45PM +0530, Kajol Jain escreveu:
> Patchset adds new macros for mem_hops field which can be
> used to represent remote-node, socket and board level details.
> 
> Currently the code had macro for HOPS_0, which corresponds
> to data coming from another core but same node.
> Add new macros for HOPS_1 to HOPS_3 to represent
> remote-node, socket and board level data.
> 
> For ex: Encodings for mem_hops fields with L2 cache:

I checked and this hasn't hit mainstream, is it already merged on a tree
where this is slated to be submitted in the next window? If so please
let me know which one so that I can merge it on perf/core.

- Arnaldo
 
> L2                      - local L2
> L2 | REMOTE | HOPS_0    - remote core, same node L2
> L2 | REMOTE | HOPS_1    - remote node, same socket L2
> L2 | REMOTE | HOPS_2    - remote socket, same board L2
> L2 | REMOTE | HOPS_3    - remote board L2
> 
> Patch 1 & 2 adds tool and kernel side changes to add new macros for
> mem_hops field
> 
> Patch 3 add data source encodings for power10 and older platforms
> to represent data based on newer composite  PERF_MEM_LVLNUM* fields
> 
> Patch 4 add data source encodings with proper sub_index used to
> represent memory/cache level data for power10 platform.
> 
> Kajol Jain (4):
>   perf: Add new macros for mem_hops field
>   tools/perf: Add new macros for mem_hops field
>   powerpc/perf: Add encodings to represent data based on newer composite
>     PERF_MEM_LVLNUM* fields
>   powerpc/perf: Add data source encodings for power10 platform
> 
>  arch/powerpc/perf/isa207-common.c     | 60 ++++++++++++++++++++-------
>  include/uapi/linux/perf_event.h       |  5 ++-
>  tools/include/uapi/linux/perf_event.h |  5 ++-
>  tools/perf/util/mem-events.c          | 29 ++++++++-----
>  4 files changed, 71 insertions(+), 28 deletions(-)
> 
> -- 
> 2.27.0

-- 

- Arnaldo
