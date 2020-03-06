Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3CF17B34D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 01:59:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YTmT66KWzDr1j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 11:59:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YT3Y1QWfzDqhY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 11:27:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48YT3X0KXSz9sPJ; Fri,  6 Mar 2020 11:27:51 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 6453f9ed9d4e4b4cdf201bf34bf460c436bf50ea
In-Reply-To: <03c97f0f6b3790d164822563be80f2fd4713a955.1581932480.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/mm: Don't kmap_atomic() in pte_offset_map() on
 PPC32
Message-Id: <48YT3X0KXSz9sPJ@ozlabs.org>
Date: Fri,  6 Mar 2020 11:27:51 +1100 (AEDT)
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

On Mon, 2020-02-17 at 09:41:35 UTC, Christophe Leroy wrote:
> On PPC32, pte_offset_map() does a kmap_atomic() in order to support
> page tables allocated in high memory, just like ARM and x86/32.
> 
> But since at least 2008 and commit 8054a3428fbe ("powerpc: Remove dead
> CONFIG_HIGHPTE"), page tables are never allocated in high memory.
> 
> When the page is in low mem, kmap_atomic() just returns the page
> address but still disable preemption and pagefault. And it is
> not an inlined function, so we suffer function call for no reason.
> 
> Make pte_offset_map() the same as pte_offset_kernel() and make
> pte_unmap() void, in the same way as PPC64 which doesn't have HIGHMEM.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/6453f9ed9d4e4b4cdf201bf34bf460c436bf50ea

cheers
