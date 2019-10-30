Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BACCE9B63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 13:19:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4736vy3LbyzF4DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 23:19:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4736ng1KnNzF4BM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 23:14:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4736nf5bR0z9sPq; Wed, 30 Oct 2019 23:14:14 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3b9176e9a874a848afa7eb2f6943639eb18b7a17
In-Reply-To: <1563215552-8166-1-git-send-email-cai@lca.pw>
To: Qian Cai <cai@lca.pw>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4] powerpc/setup_64: fix -Wempty-body warnings
Message-Id: <4736nf5bR0z9sPq@ozlabs.org>
Date: Wed, 30 Oct 2019 23:14:14 +1100 (AEDT)
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
Cc: linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>,
 tyreld@linux.vnet.ibm.com, joe@perches.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-07-15 at 18:32:32 UTC, Qian Cai wrote:
> At the beginning of setup_64.c, it has,
> 
>   #ifdef DEBUG
>   #define DBG(fmt...) udbg_printf(fmt)
>   #else
>   #define DBG(fmt...)
>   #endif
> 
> where DBG() could be compiled away, and generate warnings,
> 
> arch/powerpc/kernel/setup_64.c: In function 'initialize_cache_info':
> arch/powerpc/kernel/setup_64.c:579:49: warning: suggest braces around
> empty body in an 'if' statement [-Wempty-body]
>     DBG("Argh, can't find dcache properties !\n");
>                                                  ^
> arch/powerpc/kernel/setup_64.c:582:49: warning: suggest braces around
> empty body in an 'if' statement [-Wempty-body]
>     DBG("Argh, can't find icache properties !\n");
> 
> Fix it by using the suggestions from Michael:
> 
> "Neither of those sites should use DBG(), that's not really early boot
> code, they should just use pr_warn().
> 
> And the other uses of DBG() in initialize_cache_info() should just be
> removed.
> 
> In smp_release_cpus() the entry/exit DBG's should just be removed, and
> the spinning_secondaries line should just be pr_debug().
> 
> That would just leave the two calls in early_setup(). If we taught
> udbg_printf() to return early when udbg_putc is NULL, then we could just
> call udbg_printf() unconditionally and get rid of the DBG macro
> entirely."
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Qian Cai <cai@lca.pw>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/3b9176e9a874a848afa7eb2f6943639eb18b7a17

cheers
