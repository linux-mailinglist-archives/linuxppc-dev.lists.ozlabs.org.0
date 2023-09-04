Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBBD791F72
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 00:11:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=cuItqygV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RfjXK741Fz30PY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 08:11:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RfjWH6qTPz2xq6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 08:10:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xahJMTjgPcQA+Fj2QnICgP77BNL3/8o+OA1c8sYTjv8=; b=cuItqygV6XF0oYfJ4TFHzRzbfn
	Svx5rirG2yw/eXov4zG+rNOCmnMK2L/71ekWM8x+wnID3Lq6c4EhHDd0amUwuCxeBeUrQGCUNL0ja
	29dji72jaP6LyHfK4m2H77xJqaJIlSxAZDZ+FE65Om1a4Kn+Y7FkUNvNgxV/XR7kCkAj3OlzznfyO
	Mui63fu6EA2yBQEt4NiDa5G2xui/1LpqMDj78/Sl6TCBjUuEl0VpxKDCCNJrdHoShJXKd1AfsDLOc
	MF0HlcpCorVkUU7vsRWoH3K/hdYrxbOtr5eT1H9nwAZfy68NMZskRemT1iaK8yoUhJgFC0X5ioeYV
	phlHDGFw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qdHll-002qQ5-8w; Mon, 04 Sep 2023 22:10:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E62A8300642; Tue,  5 Sep 2023 00:10:04 +0200 (CEST)
Date: Tue, 5 Sep 2023 00:10:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/smp: Dynamically build powerpc topology
Message-ID: <20230904221004.GB2568@noisy.programming.kicks-ass.net>
References: <20230830122614.73067-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830122614.73067-1-srikar@linux.vnet.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, ndesaulniers@google.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 30, 2023 at 05:56:14PM +0530, Srikar Dronamraju wrote:
> Currently there are four powerpc specific sched topologies.  These are
> all statically defined.  However not all these topologies are used by
> all powerpc systems.
> 
> To avoid unnecessary degenerations by the scheduler , masks and flags
> are compared. However if the sched topologies are build dynamically then
> the code is simpler and there are greater chances of avoiding
> degenerations.
> 
> Even x86 builds its sched topologies dynamically and new changes are
> very similar to the way x86 is building its topologies.

You're not stating it explicitly, but you're doing this as a performance
optimization, right? The x86 thing didn't particularly care about
avoiding degenerate topologies -- it's just that the fixed tables method
grew unwieldy due to combinatorics.

And how does this patch relate to the other series touching this?

  powerpc/smp: Shared processor sched optimizations

