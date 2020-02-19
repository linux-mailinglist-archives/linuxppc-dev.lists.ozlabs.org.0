Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EB61644EF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 14:04:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MybQ2kZLzDqQd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 00:04:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48My3m4xgGzDqB5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 23:40:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48My3m00TPz9sSm; Wed, 19 Feb 2020 23:40:03 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 232ca1eecafed8c54491017f0612c33d8c742d74
In-Reply-To: <64a4aa44686e9fd4b01333401367029771d9b231.1581761633.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Erhard F. <erhard_f@mailbox.org>,
 Larry Finger <Larry.Finger@lwfinger.net>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4] powerpc/32s: Fix DSI and ISI exceptions for
 CONFIG_VMAP_STACK
Message-Id: <48My3m00TPz9sSm@ozlabs.org>
Date: Wed, 19 Feb 2020 23:40:03 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2020-02-15 at 10:14:25 UTC, Christophe Leroy wrote:
> hash_page() needs to read page tables from kernel memory. When entire
> kernel memory is mapped by BATs, which is normally the case when
> CONFIG_STRICT_KERNEL_RWX is not set, it works even if the page hosting
> the page table is not referenced in the MMU hash table.
> 
> However, if the page where the page table resides is not covered by
> a BAT, a DSI fault can be encountered from hash_page(), and it loops
> forever. This can happen when CONFIG_STRICT_KERNEL_RWX is selected
> and the alignment of the different regions is too small to allow
> covering the entire memory with BATs. This also happens when
> CONFIG_DEBUG_PAGEALLOC is selected or when booting with 'nobats'
> flag.
> 
> Also, if the page containing the kernel stack is not present in the
> MMU hash table, registers cannot be saved and a recursive DSI fault
> is encountered.
> 
> To allow hash_page() to properly do its job at all time and load the
> MMU hash table whenever needed, it must run with data MMU disabled.
> This means it must be called before re-enabling data MMU. To allow
> this, registers clobbered by hash_page() and create_hpte() have to
> be saved in the thread struct together with SRR0, SSR1, DAR and DSISR.
> It is also necessary to ensure that DSI prolog doesn't overwrite
> regs saved by prolog of the current running exception. That means:
> - DSI can only use SPRN_SPRG_SCRATCH0
> - Exceptions must free SPRN_SPRG_SCRATCH0 before writing to the stack.
> 
> This also fixes the Oops reported by Erhard when create_hpte() is
> called by add_hash_page().
> 
> Due to prolog size increase, a few more exceptions had to get split
> in two parts.
> 
> Fixes: cd08f109e262 ("powerpc/32s: Enable CONFIG_VMAP_STACK")
> Reported-by: Erhard F. <erhard_f@mailbox.org>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206501
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Tested-by: Erhard F. <erhard_f@mailbox.org>
> Tested-by: Larry Finger <Larry.Finger@lwfinger.net>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/232ca1eecafed8c54491017f0612c33d8c742d74

cheers
