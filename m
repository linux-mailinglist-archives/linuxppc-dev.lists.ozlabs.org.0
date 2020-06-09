Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A111F3424
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:37:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h0mM3NDMzDqrC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:37:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFx5qmCzDqRq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFh6RbTz9sV8; Tue,  9 Jun 2020 15:29:28 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <cover.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] powerpc/module_64: Fix _mcount() stub
Message-Id: <159168035221.1381411.741503627258979206.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:28 +1000 (AEST)
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
Cc: Qian Cai <cai@lca.pw>, Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Apr 2020 23:05:42 +0530, Naveen N. Rao wrote:
> This series addresses the crash reported by Qian Cai on ppc64le with
> -mprofile-kernel here:
> https://lore.kernel.org/r/15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw
> 
> While fixing patch_instruction() should address the crash, we should
> still change the default stub we setup for _mcount() for cases where a
> kernel is built without ftrace.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/module_64: Consolidate ftrace code
      https://git.kernel.org/powerpc/c/03b51416e876aea5e7638947e50831b6c988c246
[2/3] powerpc/module_64: Simplify check for -mprofile-kernel ftrace relocations
      https://git.kernel.org/powerpc/c/1f2aaed2db03150428dbcd2ddee02ae6cb4bac52
[3/3] powerpc/module_64: Use special stub for _mcount() with -mprofile-kernel
      https://git.kernel.org/powerpc/c/bd55e792de0844631d34487d43eaf3f13294ebfe

cheers
