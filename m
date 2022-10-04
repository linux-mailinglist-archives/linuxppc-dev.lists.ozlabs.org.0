Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D03D05F4489
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhf6t57nRz3fTx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:43:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1P5zZxz3c3W
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1P4rgwz4xGj;
	Wed,  5 Oct 2022 00:38:49 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <18473da42362ee8f07bce36b9caef8ba77d7633f.1663656054.git.christophe.leroy@csgroup.eu>
References: <18473da42362ee8f07bce36b9caef8ba77d7633f.1663656054.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/irq: Refactor irq_soft_mask_{set,or}_return()
Message-Id: <166488992228.779920.3541323442224104938.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:25:22 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Sep 2022 08:41:08 +0200, Christophe Leroy wrote:
> This partialy reapply commit ef5b570d3700 ("powerpc/irq: Don't
> open code irq_soft_mask helpers") which was reverted by
> commit 684c68d92e2e ("Revert "powerpc/irq: Don't open code
> irq_soft_mask helpers"")
> 
> irq_soft_mask_set_return() and irq_soft_mask_or_return()
> are overset of irq_soft_mask_set().
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/irq: Refactor irq_soft_mask_{set,or}_return()
      https://git.kernel.org/powerpc/c/4af83545538a4fa80d14b9247ffc0db556e6a556

cheers
