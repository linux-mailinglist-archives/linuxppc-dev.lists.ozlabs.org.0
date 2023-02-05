Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C35268AF07
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 10:43:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8kwY211Hz3fKX
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 20:43:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8kvP5bh8z3bZj
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 20:42:25 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8kvP3qm5z4xZb;
	Sun,  5 Feb 2023 20:42:25 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230131111407.806770-1-mpe@ellerman.id.au>
References: <20230131111407.806770-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64s: Reconnect tlb_flush() to hash__tlb_flush()
Message-Id: <167559011181.1647710.16257388961009688840.b4-ty@ellerman.id.au>
Date: Sun, 05 Feb 2023 20:41:51 +1100
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
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com, bgray@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 31 Jan 2023 22:14:07 +1100, Michael Ellerman wrote:
> Commit baf1ed24b27d ("powerpc/mm: Remove empty hash__ functions")
> removed some empty hash MMU flushing routines, but got a bit overeager
> and also removed the call to hash__tlb_flush() from tlb_flush().
> 
> In regular use this doesn't lead to any noticable breakage, which is a
> little concerning. Presumably there are flushes happening via other
> paths such as arch_leave_lazy_mmu_mode(), and/or a bit of luck.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Reconnect tlb_flush() to hash__tlb_flush()
      https://git.kernel.org/powerpc/c/1665c027afb225882a5a0b014c45e84290b826c2

cheers
