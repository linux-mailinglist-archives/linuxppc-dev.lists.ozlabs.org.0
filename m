Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 264B361100A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 13:51:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzLVP0R0kz3cbV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 22:51:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzLTr5P2tz3cC0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 22:50:56 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MzLTr48Pdz4wgr;
	Fri, 28 Oct 2022 22:50:56 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20221006140413.126443-1-npiggin@gmail.com>
References: <20221006140413.126443-1-npiggin@gmail.com>
Subject: Re: (subset) [PATCH 0/4] powerpc: misc interrupt and context tracking fixes
Message-Id: <166695778801.1609528.7830840855528110755.b4-ty@ellerman.id.au>
Date: Fri, 28 Oct 2022 22:49:48 +1100
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

On Fri, 7 Oct 2022 00:04:09 +1000, Nicholas Piggin wrote:
> These are several fixes for regressions and bugs that can crash
> the host.
> 
> Thanks,
> Nick
> 
> Nicholas Piggin (4):
>   KVM: PPC: BookS PR-KVM and BookE do not support context tracking
>   powerpc/64s/interrupt: Perf NMI should not take normal exit path
>   powerpc/64e/interrupt: Prevent NMI PMI causing a dangerous warning
>   powerpc/64: Fix perf profiling asynchronous interrupt handlers
> 
> [...]

Applied to powerpc/fixes.

[2/4] powerpc/64s/interrupt: Perf NMI should not take normal exit path
      https://git.kernel.org/powerpc/c/dc398a084d459f065658855454e09f2778f8c5cc

cheers
