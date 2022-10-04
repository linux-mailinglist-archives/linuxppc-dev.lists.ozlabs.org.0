Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0FA5F4480
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:42:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhf5l4mpDz3fLP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:42:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1N502Jz3bry
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:38:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1N3pCHz4xGy;
	Wed,  5 Oct 2022 00:38:48 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <bea5ad0de7f83eff256116816d46c84fa0a444de.1662370698.git.christophe.leroy@csgroup.eu>
References: <bea5ad0de7f83eff256116816d46c84fa0a444de.1662370698.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/book3s: Inline first level of update_mmu_cache()
Message-Id: <166488985859.779920.743401358886191871.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:18 +1100
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

On Mon, 5 Sep 2022 11:38:25 +0200, Christophe Leroy wrote:
> update_mmu_cache() voids when hash page tables are not used.
> On PPC32 that means when MMU_FTR_HPTE_TABLE is not defined.
> On PPC64 that means when RADIX is enabled.
> 
> Rename core part of update_mmu_cache() as __update_mmu_cache()
> and include the initial verification in an inlined caller.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/book3s: Inline first level of update_mmu_cache()
      https://git.kernel.org/powerpc/c/73ea68ad0d2f655815b6f1fbe1c5521d72f01b64

cheers
