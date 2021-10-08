Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F2A426BA4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 15:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQpqj3Bmxz3ccC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 00:26:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQpnY1Mf8z2yKB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 00:24:33 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQpnY0WQMz4xqP;
 Sat,  9 Oct 2021 00:24:33 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20211004145642.1331214-1-npiggin@gmail.com>
References: <20211004145642.1331214-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/5] powerpc: various interrupt handling fixes
Message-Id: <163369938156.3568929.5142383792032173677.b4-ty@ellerman.id.au>
Date: Sat, 09 Oct 2021 00:23:01 +1100
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 5 Oct 2021 00:56:37 +1000, Nicholas Piggin wrote:
> This fixes a number of bugs found mostly looking at a MCE handler issue,
> which should be fixed in patch 5 of the series, previous attempt here
> which Ganesh found to be wrong.
> 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210922020247.209409-1-npiggin@gmail.com/
> 
> I didn't increment to patch v2 because it's a different approach (so I
> gave it a different title).
> 
> [...]

Applied to powerpc/fixes.

[1/5] powerpc/64s: fix program check interrupt emergency stack path
      https://git.kernel.org/powerpc/c/3e607dc4df180b72a38e75030cb0f94d12808712
[2/5] powerpc/traps: do not enable irqs in _exception
      https://git.kernel.org/powerpc/c/d0afd44c05f8f4e4c91487c02d43c87a31552462
[3/5] powerpc/64: warn if local irqs are enabled in NMI or hardirq context
      https://git.kernel.org/powerpc/c/ff058a8ada5df0d84e5537cfaf89d06d71501580
[4/5] powerpc/64/interrupt: Reconcile soft-mask state in NMI and fix false BUG
      https://git.kernel.org/powerpc/c/768c47010392ece9766a56479b4e0cf04a536916
[5/5] powerpc/64s: Fix unrecoverable MCE calling async handler from NMI
      https://git.kernel.org/powerpc/c/f08fb25bc66986b0952724530a640d9970fa52c1

cheers
