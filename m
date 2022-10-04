Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC75F450B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 16:02:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfY60y64z3hvY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 01:02:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1v6GkWz3dq0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1r5Bgtz4xHm;
	Wed,  5 Oct 2022 00:39:12 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220926054305.2671436-1-npiggin@gmail.com>
References: <20220926054305.2671436-1-npiggin@gmail.com>
Subject: Re: [PATCH v3 0/7] powerpc/64: interrupt soft-mask and context fixes
Message-Id: <166488993718.779920.14966153082255292179.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:25:37 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 26 Sep 2022 15:42:58 +1000, Nicholas Piggin wrote:
> No real changes since last posting, I just pulled fixes from several
> series together and rearranged them and updated changelogs slightly.
> 
> Thanks,
> Nick
> 
> Nicholas Piggin (7):
>   powerpc/64/interrupt: Fix false warning in context tracking due to
>     idle state
>   powerpc/64: mark irqs hard disabled in boot paca
>   powerpc/64/interrupt: Fix return to masked context after hard-mask irq
>     becomes pending
>   powerpc/64s: Fix irq state management in runlatch functions
>   powerpc/64s/interrupt: masked handler debug check for previous hard
>     disable
>   powerpc/64/interrupt: avoid BUG/WARN recursion in interrupt entry
>   powerpc/64/irq: tidy soft-masked irq replay and improve documentation
> 
> [...]

Applied to powerpc/next.

[1/7] powerpc/64/interrupt: Fix false warning in context tracking due to idle state
      https://git.kernel.org/powerpc/c/56adbb7a8b6cc7fc9b940829c38494e53c9e57d1
[2/7] powerpc/64: mark irqs hard disabled in boot paca
      https://git.kernel.org/powerpc/c/799f7063c7645f9a751d17f5dfd73b952f962cd2
[3/7] powerpc/64/interrupt: Fix return to masked context after hard-mask irq becomes pending
      https://git.kernel.org/powerpc/c/e485f6c751e0a969327336c635ca602feea117f0
[4/7] powerpc/64s: Fix irq state management in runlatch functions
      https://git.kernel.org/powerpc/c/9524f2278f2e6925f147d9140c83f658e7a7c84f
[5/7] powerpc/64s/interrupt: masked handler debug check for previous hard disable
      https://git.kernel.org/powerpc/c/c39fb71a54f09977eba7584ef0eebb25047097c6
[6/7] powerpc/64/interrupt: avoid BUG/WARN recursion in interrupt entry
      https://git.kernel.org/powerpc/c/f7bff6e7759b1abb59334f6448f9ef3172c4c04a
[7/7] powerpc/64/irq: tidy soft-masked irq replay and improve documentation
      https://git.kernel.org/powerpc/c/1da5351f9eb9b72a7d25316b4d38bf10b6e671b1

cheers
