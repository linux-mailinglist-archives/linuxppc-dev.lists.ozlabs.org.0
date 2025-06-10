Return-Path: <linuxppc-dev+bounces-9256-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 837D2AD4379
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 22:09:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH0HJ1fzhz2yLJ;
	Wed, 11 Jun 2025 06:09:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749586140;
	cv=none; b=Pv4XQnZiiJjMSLCW/GRWCcgGkeQ8uhn6CbTyLsn/MymlgOTHHgpiq1aPh/sLwZlRnQ/hdjBlOvT0yxc1rvc4hOlqws4H1sMI+c014hnJCLMNRT2/AHYqQX2r5ZNmbGEOPf5d5jGMcjvFGBNlErzPTdDzLtF5bJTK5A6/Swc1ctydpW5324pGqzl+GRAh3xTOtj03JwOEjJ8nlEsDgTknZaRxp7voneEq+RIWDT6GYKIJw0m4zLpQ8plX8hWqHO446wdXXHAoFjHcYN9HpluKNawpBNlIW0wMzsMmitrAccm9lz7wR9RN2cWwbtGeqHWalK5J/CnfJXuW7n2z98qLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749586140; c=relaxed/relaxed;
	bh=4zGQbCBxX2Sh6TIXcEqVOMqFVP1QStVlhXj20PaPMCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArrvsirvlVw61lvnCcOfwRqo7JFJUx3mHyIiCUM+216zAjzhBpcVFQtrc//em3Dv5LiaNtAKKq9Vz6auBqbsFOzogULTeEShx6TJDlZ6sxrT0ry/XhCqnWMq9CGFAfho6AlwXEsflt3qDCNY/vfXGjXuBQIDdBoRjyZuVLrDLUE10vVjUR5J/5Hn4Pi4cC1RwbHG8WyzNJvwhnc7dvQqOZpxSbWpviUYCYopInxw2kQaEpa83WUTJAPUa4kS2YfQhpLLRnoMdmVU4KO0OMRBFc2n22pPbIH1nHus26qrNLIsMbEqFApG7cFfezbe9goztLBPBGAv2Kv+qn6XNMp3yQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH0HH0gqGz2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 06:08:58 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55AK0TLT012803;
	Tue, 10 Jun 2025 15:00:29 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 55AK0SZb012802;
	Tue, 10 Jun 2025 15:00:28 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 10 Jun 2025 15:00:28 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Thomas Huth <thuth@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Geoff Levand <geoff@infradead.org>, Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v2 0/2] powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
Message-ID: <20250610200028.GE30295@gate.crashing.org>
References: <20250610160128.69033-1-thuth@redhat.com>
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
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610160128.69033-1-thuth@redhat.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 10, 2025 at 06:01:26PM +0200, Thomas Huth wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembly and C source code.
> However, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:

Any symbol name starting with two underscores is reserved for any use.

That also means that the kernel (being user code!) is not allowed to use
such for its own use.

But the kernel historically defines stuff in this namespace anyway.  Of
course it cannot prohibit others to do the same though!

> To avoid confusion in the future, it would make sense to standardize
> on the macro that gets defined by the compiler, so this patch series
> changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.

GCC already defines __ASSEMBLER__ when compiling assembler code (a .s
or .S file, usually).  LLVM should do the same, it promises to be
compatible to GCC for all user code, after all.


Segher

