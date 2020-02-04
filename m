Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED347151A6E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 13:18:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BkHf2YVtzDqBM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 23:18:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BjwL3sLZzDqLv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 23:01:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48BjwK1mspzB3x2; Tue,  4 Feb 2020 23:01:36 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 41196224883a64e56e0ef237c19eb837058df071
In-Reply-To: <fc8390a33c2a470105f01abbcbdc7916c30c0a54.1580301269.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/32s: Fix kasan_early_hash_table() for
 CONFIG_VMAP_STACK
Message-Id: <48BjwK1mspzB3x2@ozlabs.org>
Date: Tue,  4 Feb 2020 23:01:36 +1100 (AEDT)
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

On Wed, 2020-01-29 at 12:34:36 UTC, Christophe Leroy wrote:
> On book3s/32 CPUs that are handling MMU through a hash table,
> MMU_init_hw() function was adapted for VMAP_STACK in order to
> handle virtual addresses instead of physical addresses in the
> low level hash functions.
> 
> When using KASAN, the same adaptations are required for the
> early hash table set up by kasan_early_hash_table() function.
> 
> Fixes: cd08f109e262 ("powerpc/32s: Enable CONFIG_VMAP_STACK")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/41196224883a64e56e0ef237c19eb837058df071

cheers
