Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2D5116699
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 06:52:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WXQd0JjPzDqQv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 16:52:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WXGH4D8VzDqHJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 16:45:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47WXGH3Myxz9sR7; Mon,  9 Dec 2019 16:45:11 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b6afd1234cf93aa0d71b4be4788c47534905f0be
In-Reply-To: <20191204115015.18015-1-ardb@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/archrandom: fix arch_get_random_seed_int()
Message-Id: <47WXGH3Myxz9sR7@ozlabs.org>
Date: Mon,  9 Dec 2019 16:45:11 +1100 (AEDT)
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
Cc: paulus@samba.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-12-04 at 11:50:15 UTC, Ard Biesheuvel wrote:
> Commit 01c9348c7620ec65
> 
>   powerpc: Use hardware RNG for arch_get_random_seed_* not arch_get_random_*
> 
> updated arch_get_random_[int|long]() to be NOPs, and moved the hardware
> RNG backing to arch_get_random_seed_[int|long]() instead. However, it
> failed to take into account that arch_get_random_int() was implemented
> in terms of arch_get_random_long(), and so we ended up with a version
> of the former that is essentially a NOP as well.
> 
> Fix this by calling arch_get_random_seed_long() from
> arch_get_random_seed_int() instead.
> 
> Fixes: 01c9348c7620ec65 ("powerpc: Use hardware RNG for arch_get_random_seed_* not arch_get_random_*")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/b6afd1234cf93aa0d71b4be4788c47534905f0be

cheers
