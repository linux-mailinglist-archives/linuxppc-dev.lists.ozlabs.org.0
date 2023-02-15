Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAC4697C39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:50:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGybJ35Vyz3g9M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:50:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRQ2dWnz3f2p
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRQ1VxXz4x8D;
	Wed, 15 Feb 2023 23:43:14 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20221216115930.2667772-1-npiggin@gmail.com>
References: <20221216115930.2667772-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/4] powerpc: Misc early boot fixes
Message-Id: <167646485406.1421441.70610048323807995.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:40:54 +1100
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

On Fri, 16 Dec 2022 21:59:26 +1000, Nicholas Piggin wrote:
> The first patch is a fix for a commit that's in powerpc next which
> is a pretty harmless dump_stack(). Except that we had some bugs with
> doing stack unwinding that early when the boot CPU is not zero so
> that ended up crashing badly.
> 
> First patch should be relatively safe and solve that problem, but
> only needed if you're testing with stress_hpt. Second patch is a
> relatively minimal fix that should close most of the large window
> where we're running with the wrong task_cpu, but I would not call
> it trivial because it could cause some weird breakage or expose
> another bug. Third patch closes the rest of the window and makes
> the paca allocation a lot better, but it has more possibility for
> regressions. Last patch is independent of the rest and should be
> quite straightforward.
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/64s: Fix stress_hpt memblock alloc alignment
      https://git.kernel.org/powerpc/c/dea18da459922d70692ae1e5736d1c760040cb07
[2/4] powerpc/64: Fix task_cpu in early boot when booting non-zero cpuid
      https://git.kernel.org/powerpc/c/9fa24404f5044967753a6cd3e5e36f57686bec6e
[3/4] powerpc/64: Move paca allocation to early_setup()
      https://git.kernel.org/powerpc/c/dc222fa7737212fe0da513e5b8937c156d02225d
[4/4] powerpc: Skip stack validation checking alternate stacks if they are not allocated
      https://git.kernel.org/powerpc/c/1ee4e35076e36724a62ba2fa29b722fb53eb68f2

cheers
