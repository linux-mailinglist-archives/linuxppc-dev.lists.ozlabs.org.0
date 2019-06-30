Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6564B5AF74
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 10:40:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45c3qq53BDzDqWT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 18:40:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45c3lh5fG3zDqLc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 18:37:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45c3lh4zYrz9sCJ; Sun, 30 Jun 2019 18:37:20 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 348ea30f51fc63ce3c7fd7dba6043e8e3ee0ef34
X-Patchwork-Hint: ignore
In-Reply-To: <20190528232801.7413-1-nathanl@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: avoid blocking in irq when queuing
 hotplug events
Message-Id: <45c3lh4zYrz9sCJ@ozlabs.org>
Date: Sun, 30 Jun 2019 18:37:20 +1000 (AEST)
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

On Tue, 2019-05-28 at 23:28:01 UTC, Nathan Lynch wrote:
> A couple of bugs in queue_hotplug_event():
> 
> 1. Unchecked kmalloc result which could lead to an oops.
> 2. Use of GFP_KERNEL allocations in interrupt context (this code's
>    only caller is ras_hotplug_interrupt()).
> 
> Use kmemdup to avoid open-coding the allocation+copy and check for
> failure; use GFP_ATOMIC for both allocations.
> 
> Ultimately it probably would be better to avoid or reduce allocations
> in this path if possible.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/348ea30f51fc63ce3c7fd7dba6043e8e3ee0ef34

cheers
