Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F746193EC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 13:23:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p3zn489PzDqyG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 23:23:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p3cW3mNPzDqqJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 23:06:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 48p3cT6hQvz9sSK; Thu, 26 Mar 2020 23:06:33 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48p3cT3BXLz9sSb; Thu, 26 Mar 2020 23:06:33 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 6eeb9b3b9ce588f14a697737a30d0702b5a20293
In-Reply-To: <20200225031328.14676-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Fix section mismatch warnings from boot code
Message-Id: <48p3cT3BXLz9sSb@ozlabs.org>
Date: Thu, 26 Mar 2020 23:06:33 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-02-25 at 03:13:28 UTC, Michael Ellerman wrote:
> We currently have two section mismatch warnings:
> 
>   The function __boot_from_prom() references
>   the function __init prom_init().
> 
>   The function start_here_common() references
>   the function __init start_kernel().
> 
> The warnings are correct, we do have branches from non-init code into
> init code, which is freed after boot. But we don't expect to ever
> execute any of that early boot code after boot, if we did that would
> be a bug. In particular calling into OF after boot would be fatal
> because OF is no longer resident.
> 
> So for now fix the warnings by marking the relevant functions as
> __REF, which puts them in the ".ref.text" section.
> 
> This causes some reordering of the functions in the final link:
> 
>   @@ -217,10 +217,9 @@
>    c00000000000b088 t generic_secondary_common_init
>    c00000000000b124 t __mmu_off
>    c00000000000b14c t __start_initialization_multiplatform
>   -c00000000000b1ac t __boot_from_prom
>   -c00000000000b1ec t __after_prom_start
>   -c00000000000b260 t p_end
>   -c00000000000b27c T copy_and_flush
>   +c00000000000b1ac t __after_prom_start
>   +c00000000000b220 t p_end
>   +c00000000000b23c T copy_and_flush
>    c00000000000b300 T __secondary_start
>    c00000000000b300 t copy_to_here
>    c00000000000b344 t start_secondary_prolog
>   @@ -228,8 +227,9 @@
>    c00000000000b36c t enable_64b_mode
>    c00000000000b388 T relative_toc
>    c00000000000b3a8 t p_toc
>   -c00000000000b3b0 t start_here_common
>   -c00000000000b3d0 t start_here_multiplatform
>   +c00000000000b3b0 t __boot_from_prom
>   +c00000000000b3f0 t start_here_multiplatform
>   +c00000000000b480 t start_here_common
>    c00000000000b880 T system_call_common
>    c00000000000b974 t system_call
>    c00000000000b9dc t system_call_exit
> 
> In particular __boot_from_prom moves after copy_to_here, which means
> it's not copied to zero in the first stage of copy of the kernel to
> zero.
> 
> But that's OK, because we only call __boot_from_prom before we do the
> copy, so it makes no difference when it's copied. The call sequence
> is:
>   __start
>   -> __start_initialization_multiplatform
>      -> __boot_from_prom
>         -> __start
>            -> __start_initialization_multiplatform
>               -> __after_prom_start
>                  -> copy_and_flush
>                  -> copy_and_flush (relocated to 0)
>                     -> start_here_multiplatform
>                        -> early_setup
> 
> Reported-by: Mauricio Faria de Oliveira <mauricfo@linux.ibm.com>
> Reported-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/6eeb9b3b9ce588f14a697737a30d0702b5a20293

cheers
