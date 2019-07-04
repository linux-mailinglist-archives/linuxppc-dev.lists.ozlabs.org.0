Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BD25FB42
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 17:54:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fjGJ2QgpzDqXD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 01:54:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fjDF3FSbzDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 01:52:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45fjDD6cxvz9sNw; Fri,  5 Jul 2019 01:52:44 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 548c54acba5bd1388d50727a9a126a42d0cd4ad0
In-Reply-To: <20190604030037.9424-1-mikey@neuling.org>
To: Michael Neuling <mikey@neuling.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v5 1/2] powerpc: silence a -Wcast-function-type warning in
 dawr_write_file_bool
Message-Id: <45fjDD6cxvz9sNw@ozlabs.org>
Date: Fri,  5 Jul 2019 01:52:44 +1000 (AEST)
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
Cc: Mathieu Malaterre <malat@debian.org>, hch@infradead.org, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-06-04 at 03:00:36 UTC, Michael Neuling wrote:
> From: Mathieu Malaterre <malat@debian.org>
> 
> In commit c1fe190c0672 ("powerpc: Add force enable of DAWR on P9
> option") the following piece of code was added:
> 
>    smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
> 
> Since GCC 8 this triggers the following warning about incompatible
> function types:
> 
>   arch/powerpc/kernel/hw_breakpoint.c:408:21: error: cast between incompatible function types from 'int (*)(struct arch_hw_breakpoint *)' to 'void (*)(void *)' [-Werror=cast-function-type]
> 
> Since the warning is there for a reason, and should not be hidden behind
> a cast, provide an intermediate callback function to avoid the warning.
> 
> Fixes: c1fe190c0672 ("powerpc: Add force enable of DAWR on P9 option")
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: Michael Neuling <mikey@neuling.org>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/548c54acba5bd1388d50727a9a126a42d0cd4ad0

cheers
