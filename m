Return-Path: <linuxppc-dev+bounces-5336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28601A136C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 10:39:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYd9H3tKyz3bfc;
	Thu, 16 Jan 2025 20:38:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737020339;
	cv=none; b=doQws28HrcXSmKpSKlZLu1MWEtCCYSrAtDmZQ14i/QHtthNh8PyztdtlX64aQDuiw5XTAiLZ+p+vWHutw5kZqV8l65JBjYsGOgQwTQlrf2bwU9wqhXBKYorH6Hl3OhYfEtJMyylc9eRG6E86IXh59dH/ZLvnYJGMHLtT1iYUSJeMCJi6VeWJxoiPPp+qyYo0LE7ICuatAc8/GPcqS/5iaTG6aLhEe2s6cZBo2sN/iZFhWE6Ug8N+x96KJZ76P4c8GUjPgyjnTQWpkpT7jop0JsAPw9VPLNdZmWtCxKz70iRR3y42BmLkrzz6CPYJzGjAUSeK51zOQ7M19GIY7FtR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737020339; c=relaxed/relaxed;
	bh=sp+FxjCkzTW4qc2F4mDkdN/WiXSt2JPHkUPS5ECiaJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCE+OIaZVVwDkF0fii6sVpA0m4fj5omQYh9Y/x0k5S56TtPaOPL70bBtFdsSR6x1F7QtSwimhu6uaEZptRi9LpbAvADqHuqoyLV166Kq58NthiG3MRe7uSFcAbHu3wZ84D3PV2B3ca2BwmrewZa6a6nUGlMf6y0EXFBI2jRp950mIuqN7YxIl3nIk4agau/RVmUxo6Cn/0WcKAxgMuKPOqmUEdmHWwCpLXAA4t977qWMsx3y2VqTKYTdkfjA/jRP/Qr9yH/qZX36PUNlaVrXw1SIMPE6DzsHWP0uCeuhqPp4lIKjhrXh/LjVY7gLALRHxCoCJO4VC+I+8xXNRdtN1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=tNEt+TND; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=tNEt+TND;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYd9D4KHPz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 20:38:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sp+FxjCkzTW4qc2F4mDkdN/WiXSt2JPHkUPS5ECiaJE=; b=tNEt+TNDhov73YFgV4d3QuFfxV
	wodGVIjMSeOy/uoYu4slydOluGBThtgfGTQSUSMXUqUkBx3FZUEI/jieBTlfjTs+JrstOjNPh5ioh
	zE9igoQMNvxowDWCDekEhektqAE29BAxX2tAZsnzMKN6Wo/KQd1SaoRbTfLD3NNtmvwP1rvdHY0I9
	K0JYXKyMwq1Q52W6HrVWbF9QTpKEbmdf0+nMip3iVnlpCbl4AUSuSXow6ozld2psjbUfqduuxVZmL
	7xSwg49F9U3irbLXqcyfUSVJcwrhOu6EtTR4fdt8N8h3xIt2AJJWw0SD/UoXLJCKg4ltNYstPQ1OE
	LwIawK4Q==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMKu-0000000BO6o-0Ees;
	Thu, 16 Jan 2025 09:38:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2920A300777; Thu, 16 Jan 2025 10:38:47 +0100 (CET)
Date: Thu, 16 Jan 2025 10:38:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 00/15] powerpc/objtool: uaccess validation for PPC32
 (v5)
Message-ID: <20250116093847.GH8362@noisy.programming.kicks-ass.net>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 15, 2025 at 11:42:40PM +0100, Christophe Leroy wrote:
> Christophe Leroy (15):
>   objtool: Fix generic annotation infrastructure cross build
>   objtool: Move back misplaced comment
>   objtool: Allow an architecture to disable objtool on ASM files
>   objtool: Fix JUMP_ENTRY_SIZE for bi-arch like powerpc
>   objtool: Add INSN_RETURN_CONDITIONAL
>   objtool: Add support for relative switch tables
>   objtool: Merge mark_func_jump_tables() and add_func_jump_tables()
>   objtool: Track general purpose register used for switch table base
>   objtool: Find end of switch table directly
>   objtool: When looking for switch tables also follow conditional and
>     dynamic jumps
>   objtool: .rodata.cst{2/4/8/16} are not switch tables
>   objtool: Add support for more complex UACCESS control
>   objtool: Prepare noreturns.h for more architectures
>   powerpc/bug: Annotate reachable after warning trap
>   powerpc: Implement UACCESS validation on PPC32

This mostly looks okay to me. You have a tendency to violate the reverse
xmas tree for variables thing, but meh.

I would like Josh to have a hard look at this though, jump tables are
his thing :-)

