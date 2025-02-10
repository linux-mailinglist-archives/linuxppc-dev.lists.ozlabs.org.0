Return-Path: <linuxppc-dev+bounces-6028-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD20A2EA4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2025 12:00:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ys1nC1gQbz2yvs;
	Mon, 10 Feb 2025 21:59:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739185199;
	cv=none; b=Dcm8d1Zr5t41aIXHOLPbEPam5C3Tf5VwzmkGGpoLVuyudS0OztuEPkVXOMNSjVsVqKyBP/t5BAp6HGczhzAaaBpGXzRdf2Ha5S2ex1AlhNZY/MTNmffg19zwlpk7D4XF7E/zIs0LMZZ1y7b4UOsjQhdELKW9tNJY4oM+BuFVENE1Du7E66JcGEBkPQCFJxfgS6AqI7/IEpWycCqxlsyzr6OzVfSgP6QTgvHdfADtTO9a5i9HJ/WGfQ54XvDCr6wtQ6N8DD3tsA79GI1T/86GBo2itdBDwKTlLsQikGkeMm3nHgY3YjuZKn7xtcuXNU5ZNWfDvIu72x5QHc3zpvE5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739185199; c=relaxed/relaxed;
	bh=e/71EfjX9I1EgSNmijPvfd/2Dexoeg3yU8p5Lg2VgJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FniDyOuU+Z9EiNzoawgHE/5Wi4M0Bibt3PjE5aAelRpurK6+9wxOZLI3sSlXIuqsa+fYo4evsmS+vuOce/HQenBAi0UPfyB+aucGjRxMt3LlptbjYYNp7kHm5/QJxk1Qgv2l4/VYAx9QVH1QSC72o4xfsJR3vpaDk2+flz6OYLIpYQMhzW2fJ87B3Y5cJIApbgLNbjMtdjptjYfYavRdbd5XfkfqNp30Dyn+HUxJNYxsOa4aG4Qe6BTBYxhIqxdgDCg2KGjf02tGmsVNvlCMhT3SKaqXjkT36fls9pVsATRAwA1q01cm7nKp1Vb7JQAwykqVJg2NVx1UEKWlJgTqYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EzmIUaI8; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=p/PoQOLr; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EzmIUaI8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=p/PoQOLr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ys1n95pVpz2yvn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 21:59:57 +1100 (AEDT)
Date: Mon, 10 Feb 2025 11:59:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739185190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e/71EfjX9I1EgSNmijPvfd/2Dexoeg3yU8p5Lg2VgJU=;
	b=EzmIUaI8e9kINUayIQcwRp9+MXEH03GkblyBVp838/g5Afftv4Q7098EEAKnegCn31DaHY
	GEqCNwlPYYVOmGK5SmmajhhQqzOVUJ+3UsaEiiFEFAZZ/tSnOszMxBwuLOCwtO6ZVlmqDa
	UjXjB1km6CYLIXauECZO11b20EUPyilT4FoHA+PCqYMfreI5f/ZoKmOpNOKaizKJmJbrYR
	JEdzMqPoH3cxqs3N8Oznu/OcTbkoljftoNPiP4hI9qjg+2ZZ0CukkvOd50gr8lE8jV4UNj
	gdXGqtosVV1pC47eH2hkKXM1Hi65w1W3T/RHkBebziGdFlopLAAM27LOTfK+3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739185190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e/71EfjX9I1EgSNmijPvfd/2Dexoeg3yU8p5Lg2VgJU=;
	b=p/PoQOLrVzaTKUuwfSrgtlQGN0h1g9uTAdLZYP7Tj3VncGQDDUicCpE/5BXGgKk1BiSGPT
	QtRCE73gAFwRdNAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Ben Segall <bsegall@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 5/9] powerpc: Use preempt_model_str().
Message-ID: <20250210105949.b9PKqiw7@linutronix.de>
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-6-bigeasy@linutronix.de>
 <65c6f60d-bb52-48bd-a02c-87ffd2a915d4@csgroup.eu>
 <20250203160103.9DikC9FJ@linutronix.de>
 <51999b8e-61c0-48b7-b744-c83d39e7f311@csgroup.eu>
 <20250204082223.6iNyq_KR@linutronix.de>
 <7b51f7de-8e4b-4766-85ca-dee24832c693@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b51f7de-8e4b-4766-85ca-dee24832c693@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-02-08 13:05:57 [+0530], Shrikanth Hegde wrote:
> 
> 
> On 2/4/25 13:52, Sebastian Andrzej Siewior wrote:
> > Use preempt_model_str() instead of manually conducting the preemption
> > model. Use pr_emerg() instead of printk() to pass a loglevel.
> 
> even on powerpc, i see __die ends up calling show_regs_print_info().
> Why print it twice?

Thank you for noticing. I did remove it on other architectures, I
somehow missed it here. Will remove it from from the arch code.

Sebastian

