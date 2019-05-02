Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E03C611B32
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 16:19:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vy7G3ZnVzDqQG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 00:19:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vy5T6FQPzDq6Q
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 00:17:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44vy5S45TNz9s5c;
 Fri,  3 May 2019 00:17:32 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] powerpc/mm: Warn if W+X pages found on boot
In-Reply-To: <20190502073947.6481-2-ruscur@russell.cc>
References: <20190502073947.6481-1-ruscur@russell.cc>
 <20190502073947.6481-2-ruscur@russell.cc>
Date: Fri, 03 May 2019 00:17:29 +1000
Message-ID: <87lfzpx7nq.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Julia.Lawall@lip6.fr, rashmica.g@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:

> Implement code to walk all pages and warn if any are found to be both
> writable and executable.  Depends on STRICT_KERNEL_RWX enabled, and is
> behind the DEBUG_WX config option.
>
> This only runs on boot and has no runtime performance implications.
>
> Very heavily influenced (and in some cases copied verbatim) from the
> ARM64 code written by Laura Abbott (thanks!), since our ptdump
> infrastructure is similar.
>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
> v2: A myriad of fixes and cleanups thanks to Christophe Leroy
>
>  arch/powerpc/Kconfig.debug         | 19 ++++++++++++++
>  arch/powerpc/include/asm/pgtable.h |  6 +++++
>  arch/powerpc/mm/pgtable_32.c       |  3 +++
>  arch/powerpc/mm/pgtable_64.c       |  3 +++
>  arch/powerpc/mm/ptdump/ptdump.c    | 41 +++++++++++++++++++++++++++++-
>  5 files changed, 71 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
> index 4e00cb0a5464..9e8bcddd8b8f 100644
> --- a/arch/powerpc/Kconfig.debug
> +++ b/arch/powerpc/Kconfig.debug
> @@ -361,6 +361,25 @@ config PPC_PTDUMP
>  
>  	  If you are unsure, say N.
>  
> +config PPC_DEBUG_WX
> +	bool "Warn on W+X mappings at boot"
> +	select PPC_PTDUMP

That should be depends not select, I'll fix it up.

cheers
