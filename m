Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4124278577C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:05:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4fd1Nfgz3dd9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:05:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4cZ718xz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:03:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4cZ5f70z4wxQ;
	Wed, 23 Aug 2023 22:03:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20230801011744.153973-1-bgray@linux.ibm.com>
References: <20230801011744.153973-1-bgray@linux.ibm.com>
Subject: Re: [PATCH 0/7] Rework perf and ptrace watchpoint tracking
Message-Id: <169279175563.797584.15688679017292645953.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

On Tue, 01 Aug 2023 11:17:37 +1000, Benjamin Gray wrote:
> Syzkaller triggered a null pointer dereference in the
> arch_unregister_hw_breakpoint() hook. This is due to accessing
> the bp->ctx->task field changing to -1 while we iterate the breakpoints.
> 
> This series refactors the breakpoint tracking logic to remove the
> dependency on bp->ctx entirely. It also simplifies handling of ptrace and
> perf breakpoints, making insertion less restrictive.
> 
> [...]

Applied to powerpc/next.

[1/7] powerpc/watchpoints: Explain thread_change_pc() more
      https://git.kernel.org/powerpc/c/8f8f1cd67aa026c9dab8eb4e087e4a2d8fa9d5bc
[2/7] powerpc/watchpoints: Don't track info persistently
      https://git.kernel.org/powerpc/c/668a6ec6ed57f0248070c490aba75a9572e4b0a4
[3/7] powerpc/watchpoints: Track perf single step directly on the breakpoint
      https://git.kernel.org/powerpc/c/1e60f3564bad09962646bf8c2af588ecf518d337
[4/7] powerpc/watchpoints: Simplify watchpoint reinsertion
      https://git.kernel.org/powerpc/c/5a2d8b9c06712b52b2f0f2fc9a144242277fda74
[5/7] powerpc/watchpoints: Remove ptrace/perf exclusion tracking
      https://git.kernel.org/powerpc/c/bd29813ae10698f7bdfb3c68eacbb6464ec701ff
[6/7] selftests/powerpc/ptrace: Update ptrace-perf watchpoint selftest
      https://git.kernel.org/powerpc/c/58709f6fc327a997daeeca77aa5e6bd4d4c238cf
[7/7] perf/hw_breakpoint: Remove arch breakpoint hooks
      https://git.kernel.org/powerpc/c/53834a0c09252dea7918a9e1788bad880690900b

cheers
