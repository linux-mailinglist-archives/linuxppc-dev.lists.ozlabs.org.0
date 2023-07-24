Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA3E7600DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 23:05:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E5m3HGxI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8t3F1qNhz3cXk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 07:05:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E5m3HGxI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8t1Y30YXz30f4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 07:03:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B71BF613CA;
	Mon, 24 Jul 2023 21:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6814C433C7;
	Mon, 24 Jul 2023 21:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690232623;
	bh=kYSEueI+WBIYmfRMFPhQ6AKpNjlY0FqGZ2t/LW3XT2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E5m3HGxIfKlAAVQnBAFY5vLtZKt7ZnRYYHZsszZGFmiAprJU4tInJAFLhC9a84aC4
	 SzmhGmV8naumS1zchR2tzKDmrtuEvC2YVL8WIDlaLyrHtf6ApcaE99rK20kBendpZR
	 nFaV/f+RJhYi0r+rNN4pCa0m7+ivwil5Mw8UDCu1MIXsgHKrm/66pbvVUUfUQY/+j0
	 ujYklEejHyHzgZe4Df2Ym4ZDOmU9pwEkHw8dgFqNguHeeB3fc/f11B6WZ/m6o7kUK/
	 IsgUV5NM8iyR1wifjZ5x+pbCfJYdLWx4o7qqZxdBntqWe5QlDJpKEdKS8ef1wyHNCw
	 Tq5CCQm4EFsoA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 2F0D240516; Mon, 24 Jul 2023 18:03:40 -0300 (-03)
Date: Mon, 24 Jul 2023 18:03:40 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH] tools/perf: Fix addr location init during
 arch_skip_callchain_idx function
Message-ID: <ZL7nLEFFjTCTcZW6@kernel.org>
References: <20230724165815.17810-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724165815.17810-1-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, jolsa@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Mon, Jul 24, 2023 at 10:28:15PM +0530, Athira Rajeev escreveu:
> perf record with callchain recording fails as below
> in powerpc:
> 
>     ./perf record -a -gR sleep 10
>     ./perf report
>     perf: Segmentation fault
> 
> gdb trace points to thread__find_map
> 
>     0  0x00000000101df314 in atomic_cmpxchg (newval=1818846826, oldval=1818846827, v=0x1001a8f3) at /home/athira/linux/tools/include/asm-generic/atomic-gcc.h:70
>     1  refcount_sub_and_test (i=1, r=0x1001a8f3) at /home/athira/linux/tools/include/linux/refcount.h:135
>     2  refcount_dec_and_test (r=0x1001a8f3) at /home/athira/linux/tools/include/linux/refcount.h:148
>     3  map__put (map=0x1001a8b3) at util/map.c:311
>     4  0x000000001016842c in __map__zput (map=0x7fffffffa368) at util/map.h:190
>     5  thread__find_map (thread=0x105b92f0, cpumode=<optimized out>, addr=13835058055283572736, al=al@entry=0x7fffffffa358) at util/event.c:582
>     6  0x000000001016882c in thread__find_symbol (thread=<optimized out>, cpumode=<optimized out>, addr=<optimized out>, al=0x7fffffffa358) at util/event.c:656
>     7  0x00000000102e12b4 in arch_skip_callchain_idx (thread=<optimized out>, chain=<optimized out>) at arch/powerpc/util/skip-callchain-idx.c:255
>     8  0x00000000101d3bf4 in thread__resolve_callchain_sample (thread=0x105b92f0, cursor=0x1053d160, evsel=<optimized out>, sample=0x7fffffffa908, parent=0x7fffffffa778, root_al=0x7fffffffa710,
>         max_stack=<optimized out>) at util/machine.c:2940
>     9  0x00000000101cd210 in sample__resolve_callchain (sample=<optimized out>, cursor=<optimized out>, parent=<optimized out>, evsel=<optimized out>, al=<optimized out>, max_stack=<optimized out>)
>         at util/callchain.c:1112
>     10 0x000000001022a9d8 in hist_entry_iter__add (iter=0x7fffffffa750, al=0x7fffffffa710, max_stack_depth=<optimized out>, arg=0x7fffffffbbd0) at util/hist.c:1232
>     11 0x0000000010056d98 in process_sample_event (tool=0x7fffffffbbd0, event=0x7ffff6223c38, sample=0x7fffffffa908, evsel=<optimized out>, machine=0x10524ef8) at builtin-report.c:332
> 
> Here arch_skip_callchain_idx calls thread__find_symbol and which
> invokes thread__find_map with uninitialised "addr_location".
> Snippet:
> 
> thread__find_symbol(thread, PERF_RECORD_MISC_USER, ip, &al);
> 
> Recent change with commit 0dd5041c9a0ea ("perf addr_location:
> Add init/exit/copy functions"), introduced "maps__zput" in the
> function thread__find_map. This could result in segfault while
> accessing uninitialised map from "struct addr_location". Fix this
> by adding addr_location__init and addr_location__exit in
> arch_skip_callchain_idx.

Thanks, applied.
 
> Fixes: 0dd5041c9a0ea ("perf addr_location: Add init/exit/copy functions")

> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

I'll also do a audit of all calls to thread__find_map() and its callers
to check for other such cases :-\

For instance, this one seem buggy as well, Adrian?

diff --git a/tools/perf/util/dlfilter.c b/tools/perf/util/dlfilter.c
index 46f74b2344dbb34c..798a53d7e6c9dfc5 100644
--- a/tools/perf/util/dlfilter.c
+++ b/tools/perf/util/dlfilter.c
@@ -166,6 +166,7 @@ static __s32 dlfilter__resolve_address(void *ctx, __u64 address, struct perf_dlf
 	if (!thread)
 		return -1;
 
+	addr_location__init(&al);
 	thread__find_symbol_fb(thread, d->sample->cpumode, address, &al);
 
 	al_to_d_al(&al, &d_al);


