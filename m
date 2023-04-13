Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7CE6E0842
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 09:52:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxsHN0hdlz3fDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 17:52:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mEliRrXD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mEliRrXD;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxsGS32yTz3cgv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 17:51:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Au1HGF148lMOJhXl55fVMciphrL5/N0EfS5Fnj76E4g=; b=mEliRrXDDk8Kw7VHKsS5hSUMl4
	ldXJVGmCkr1vlznPtsLVyufPQRpdwWxbJM26bCbyLMFDA3DfDM9Vx3J6/4xa1hdXg4VdA3liP6QUJ
	iE+k/ZYn0JdTpTNJMmmyk0C/xKYHNJyvhhZmIZ6lwsVaZ2gf8LNalXxtYHYs5VU0FUbu+RYWkXTC5
	nrKgc2Yu69XwE5JDSshFTh25FCuHs9C9VIoZryu2Dp/TjpDrdk3AuJEUlxVt85SRX/rg6bWUqBVz7
	quaURGsRd8ujKm5fVJoli/YWMw7eYbdehGoUQDiJEuBPFN5M0E+SWJVfOxQKUjRKWqkYV7CUdMUJs
	abDFoBaA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pmrjY-00EfR9-1y;
	Thu, 13 Apr 2023 07:51:09 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F0FCE30002F;
	Thu, 13 Apr 2023 09:51:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id D5214235CC4A0; Thu, 13 Apr 2023 09:51:06 +0200 (CEST)
Date: Thu, 13 Apr 2023 09:51:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: ndesaulniers@google.com
Subject: Re: [PATCH 0/2] start_kernel: omit stack canary
Message-ID: <20230413075106.GE4253@hirez.programming.kicks-ass.net>
References: <20230412-no_stackp-v1-0-46a69b507a4b@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412-no_stackp-v1-0-46a69b507a4b@google.com>
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
Cc: llvm@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Borislav Petkov \(AMD\)" <bp@alien8.de>, Tom Rix <trix@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 12, 2023 at 11:32:11AM -0700, ndesaulniers@google.com wrote:

> Nick Desaulniers (2):
>       start_kernel: add no_stack_protector fn attr
>       start_kernel: omit prevent_tail_call_optimization for newer toolchains
> 

Your second patch has a vile comment style :-)

Other than that,

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
