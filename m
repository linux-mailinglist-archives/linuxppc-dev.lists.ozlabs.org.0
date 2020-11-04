Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2042A6396
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 12:49:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR4gN4ZjbzDqBY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 22:49:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR4RF03ZwzDqW1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 22:38:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CR4RC23yVz9sVK; Wed,  4 Nov 2020 22:38:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Qian Cai <cai@redhat.com>
In-Reply-To: <20201028152717.8967-1-cai@redhat.com>
References: <20201028152717.8967-1-cai@redhat.com>
Subject: Re: [PATCH] powerpc/eeh_cache: Fix a possible debugfs deadlock
Message-Id: <160448988321.674824.1925161464513848358.b4-ty@ellerman.id.au>
Date: Wed,  4 Nov 2020 22:38:30 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Oct 2020 11:27:17 -0400, Qian Cai wrote:
> Lockdep complains that a possible deadlock below in
> eeh_addr_cache_show() because it is acquiring a lock with IRQ enabled,
> but eeh_addr_cache_insert_dev() needs to acquire the same lock with IRQ
> disabled. Let's just make eeh_addr_cache_show() acquire the lock with
> IRQ disabled as well.
> 
>         CPU0                    CPU1
>         ----                    ----
>    lock(&pci_io_addr_cache_root.piar_lock);
>                                 local_irq_disable();
>                                 lock(&tp->lock);
>                                 lock(&pci_io_addr_cache_root.piar_lock);
>    <Interrupt>
>      lock(&tp->lock);
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/eeh_cache: Fix a possible debugfs deadlock
      https://git.kernel.org/powerpc/c/fd552e0542b4532483289cce48fdbd27b692984b

cheers
