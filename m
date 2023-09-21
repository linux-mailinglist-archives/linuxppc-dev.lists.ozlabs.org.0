Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEDC7A930E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 11:28:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrqnw0jFXz3dfp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 19:28:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrqlL2C9qz3c5k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 19:26:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RrqlL144hz4xP9;
	Thu, 21 Sep 2023 19:26:06 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>
In-Reply-To: <20230913134129.2782088-1-naveen@kernel.org>
References: <20230913134129.2782088-1-naveen@kernel.org>
Subject: Re: [PATCH] powerpc: Fix build issue with LD_DEAD_CODE_DATA_ELIMINATION and FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Message-Id: <169528828845.872767.17985585791799048051.b4-ty@ellerman.id.au>
Date: Thu, 21 Sep 2023 19:24:48 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 13 Sep 2023 19:11:29 +0530, Naveen N Rao wrote:
> We recently added support for -fpatchable-function-entry and it is
> enabled by default on ppc32 (ppc64 needs gcc v13.1.0). When building the
> kernel for ppc32 and also enabling CONFIG_LD_DEAD_CODE_DATA_ELIMINATION,
> we see the below build error with older gcc versions:
>   powerpc-linux-gnu-ld: init/main.o(__patchable_function_entries): error: need linked-to section for --gc-sections
> 
> This error is thrown since __patchable_function_entries section would be
> garbage collected with --gc-sections since it does not reference any
> other kept sections. This has subsequently been fixed with:
>   https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=b7d072167715829eed0622616f6ae0182900de3e
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Fix build issue with LD_DEAD_CODE_DATA_ELIMINATION and FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
      https://git.kernel.org/powerpc/c/60d77ed24bb3068c0837fe45b8921b0a6598829d

cheers
