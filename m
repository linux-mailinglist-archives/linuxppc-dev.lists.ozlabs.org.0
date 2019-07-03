Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 842055E6F1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 16:39:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f3fP4fclzDqTM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 00:39:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f3Mq5KnfzDqK1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 00:27:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45f3Mq1Jzfz9s8m; Thu,  4 Jul 2019 00:27:02 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3becd11dffe5d4a7467ebd841172f3e091fbcbd0
In-Reply-To: <1559767579-7151-1-git-send-email-cai@lca.pw>
To: Qian Cai <cai@lca.pw>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/eeh_cache: fix a W=1 kernel-doc warning
Message-Id: <45f3Mq1Jzfz9s8m@ozlabs.org>
Date: Thu,  4 Jul 2019 00:27:02 +1000 (AEST)
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
Cc: sbobroff@linux.ibm.com, linux-kernel@vger.kernel.org, oohall@gmail.com,
 Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-05 at 20:46:19 UTC, Qian Cai wrote:
> The opening comment mark "/**" is reserved for kernel-doc comments, so
> it will generate a warning with "make W=1".
> 
> arch/powerpc/kernel/eeh_cache.c:37: warning: cannot understand function
> prototype: 'struct pci_io_addr_range
> 
> Since this is not a kernel-doc for the struct below, but rather an
> overview of this source eeh_cache.c, just use the free-form comments
> kernel-doc syntax instead.
> 
> Signed-off-by: Qian Cai <cai@lca.pw>
> Acked-by: Russell Currey <ruscur@russell.cc>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/3becd11dffe5d4a7467ebd841172f3e091fbcbd0

cheers
