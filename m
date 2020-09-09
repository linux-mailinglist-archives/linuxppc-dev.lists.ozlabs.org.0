Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A418A263034
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 17:08:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmll441BPzDqCk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 01:08:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjWQ5544zDqF0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:28:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjWQ1ZyFz9sW5; Wed,  9 Sep 2020 23:28:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200811140435.20957-1-sfr@canb.auug.org.au>
References: <20200811140435.20957-1-sfr@canb.auug.org.au>
Subject: Re: [PATCH 0/7] powerpc: unrel_branch_check.sh: make it suck less
Message-Id: <159965716980.808686.15231955060688132897.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:28:01 +1000 (AEST)
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
Cc: Linux PowerPC List <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 12 Aug 2020 00:04:27 +1000, Stephen Rothwell wrote:
> Michael Ellerman: "who wants to make
> arch/powerpc/tools/unrel_branch_check.sh suck less"
> 
> This series is based off the current powerpc/next branch and keeps the
> same functionaity as the original except that it suppresses some error
> messages for early failures that still cause this script to succeed
> (as it always did).
> 
> [...]

Applied to powerpc/next.

[1/7] powerpc: unrel_branch_check.sh: fix shellcheck complaints
      https://git.kernel.org/powerpc/c/d9de6b0da85c9f51734f7648f6e860b89f94c801
[2/7] powerpc: unrel_branch_check.sh: simplify and combine some executions
      https://git.kernel.org/powerpc/c/20ff8ec182160df86571a8af5773ff1e52837d73
[3/7] powerpc: unrel_branch_check.sh: simplify objdump's asm output
      https://git.kernel.org/powerpc/c/4e71106c343c625c0bf72a65b244e35e7d2cd037
[4/7] powerpc: unrel_branch_check.sh: convert grep | sed | awk to just sed
      https://git.kernel.org/powerpc/c/3d97abbc9f6fe90973551f3e3eef47ffef863114
[5/7] powerpc: unrel_branch_check.sh: simplify and tidy up the final loop
      https://git.kernel.org/powerpc/c/b84eaab6ede6477484edc043456cf7d7cfc7f8b3
[6/7] powerpc: unrel_branch_check.sh: fix up the file header
      https://git.kernel.org/powerpc/c/3745ae63b405b09c86718f95d96c4b2d2827b087
[7/7] powerpc: unrel_branch_check.sh: exit silently for early errors
      https://git.kernel.org/powerpc/c/af13a2244d59c4d63a25abd8257cbaef9d9ffebc

cheers
