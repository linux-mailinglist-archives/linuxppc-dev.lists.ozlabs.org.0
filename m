Return-Path: <linuxppc-dev+bounces-3401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A319D0B96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 10:25:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsMgQ01dWz2ygB;
	Mon, 18 Nov 2024 20:25:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731921953;
	cv=none; b=kjy89tDqpOSJi2MZCAXUM7L3Mzvob5CmWs4qD5UBlRKU9JPfy7gYk8wutvOhrqI5Rr0xppPnbyho9/jhknk+IpB1YYs8Rc2HyQJssm4A/UnH0hv4o6m7AVmgk4D4Orjb0v4U5TLK0SmNRHMLn8yUMBrUq9rUllQ9vYIFPsSJYMdvwJZW87vxo/bKO+q4mGMtZdwytrR0kGwCgLXq3biG9zN3L3MIqAXLgzxhDdQciWEFlTpH1c3uGnZUs9AjUxtlzrhEZyeiZXhqkgFYHX84gji0n0pNhxjC6nM0VvIe0YqHQ0cdMNt2GhZUlHzJBb41t5P11tdocuB2lXkPJeqV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731921953; c=relaxed/relaxed;
	bh=QZv9B88aiudPzp5KFIC/r8NmKWNQgmSFAM98pAwSItI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZW6Q9NCUSck6+0gRBxrUslnn2k5jtaazamTeh8gisrmweIOmpU/xyFG45F2uKzj86k+MvBowcVYfNRrKYpcmODvxMgI/zCgeE1wvMTmufzb3mc7hZQmrbhUZG+hqx6c/xWniLk7RHke1k7WaWk2JhKE7CkF3/m0JzKp8KEPBO7WGsf1KYRkK40er6lMMFdNRZnWxPAQa0hZj9rOCqlxioRcAURRuMbCiyIB/tGilygOAnBC46JnOdylD+5+gTEdJ9oP0P1aN4CjyLgAtgQJjHxXG5BKuRnEBVQepTeJtwnckEGtixDO/ehI5JvIKEBFVPrsJPyTlmKuue8lHdEsFDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jATJIly7; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jATJIly7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsMgG5lrKz2yft
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 20:25:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QZv9B88aiudPzp5KFIC/r8NmKWNQgmSFAM98pAwSItI=; b=jATJIly71K9XLkVd42isb8BV28
	Z0Sh/qK1Z7BJtWHTOQuJXHH+Aom5xYqXR7OLOB7/P4bR6OYK3w5QX4o63cGvDgrqk073aLn67cQsW
	bjD8br0XSffBxCBn3WYcMacgCOZ9Se7QKExkYBIzNj4J26j/VYdWF0fKGDJv1MjAti4pnPfDXfeMf
	SINasJGzO/LFTzTUXQh7D+wLoKXxVGT25qOeb/srHkoBam2b/z4NfzLNPbmCBeLsCGLpbfKQ8llB6
	yhpAWkM4rmtb8c1e9tb7sx2qYwOR7RoSDsolvBI/sll0tIHtcVb/nylzONb4prHcMaJueai3/3Qhu
	pNBaYF6A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tCy0U-00000000CxD-25nF;
	Mon, 18 Nov 2024 09:25:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 468F530049D; Mon, 18 Nov 2024 10:25:17 +0100 (CET)
Date: Mon, 18 Nov 2024 10:25:17 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Michal Hocko <mhocko@suse.com>
Cc: "Nysal Jan K.A." <nysal@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linuxppc-dev@lists.ozlabs.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] sched/membarrier: Fix redundant load of
 membarrier_state
Message-ID: <20241118092517.GE39245@noisy.programming.kicks-ass.net>
References: <20241007053936.833392-1-nysal@linux.ibm.com>
 <20241029055133.121418-1-nysal@linux.ibm.com>
 <ZzsDEvJn-vauz9gE@tiehlicka>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzsDEvJn-vauz9gE@tiehlicka>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 18, 2024 at 10:04:18AM +0100, Michal Hocko wrote:
> I do not see this patch staged in any tree (e.g. linux-next). Is this on
> its way to be merged?

I only now found it -- it doesn't look super urgent. I'll get it into a
git tree after -rc1.

