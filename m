Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE5E5F4506
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 16:01:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfWP3TSzz3fxv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 01:01:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1t5lnsz3dtw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1q4L1Hz4xHk;
	Wed,  5 Oct 2022 00:39:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220926055620.2676869-1-npiggin@gmail.com>
References: <20220926055620.2676869-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 0/5] powerpc/64s: improve boot debugging
Message-Id: <166488995843.779920.12401044629146940322.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:25:58 +1100
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

On Mon, 26 Sep 2022 15:56:15 +1000, Nicholas Piggin wrote:
> This series provides a machine check handler to catch out of
> bounds memory accesses in early boot before the MMU is enabled.
> 
> Since v1:
> - 64e compile fix
> 
> Nicholas Piggin (5):
>   powerpc/64s/interrupt: move early boot ILE fixup into a macro
>   powerpc/64s: early boot machine check handler
>   powerpc/64: avoid using r13 in relocate
>   powerpc/64: don't set boot CPU's r13 to paca until the structure is
>     set up
>   powerpc/64s/interrupt: halt early boot interrupts if paca is not set
>     up
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/64s/interrupt: move early boot ILE fixup into a macro
      https://git.kernel.org/powerpc/c/bf75a3258a40327b73c5b4458ae8102cfa921b40
[2/5] powerpc/64s: early boot machine check handler
      https://git.kernel.org/powerpc/c/2f5182cffa43f31c241131a2c10a4ecd8e90fb3e
[3/5] powerpc/64: avoid using r13 in relocate
      https://git.kernel.org/powerpc/c/b830c8754e046f96e84da9d3b3e028c4ceef2b18
[4/5] powerpc/64: don't set boot CPU's r13 to paca until the structure is set up
      https://git.kernel.org/powerpc/c/519b2e317e39ac99ce589a7c8480c47a17d62638
[5/5] powerpc/64s/interrupt: halt early boot interrupts if paca is not set up
      https://git.kernel.org/powerpc/c/e1100cee059ad0bea6a668177e835baa087a0c65

cheers
