Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B31F3432
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:44:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h0wP5svgzDqlD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:44:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzFx5tL0zDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFl0mnkz9sTj; Tue,  9 Jun 2020 15:29:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200429070247.1678172-1-npiggin@gmail.com>
References: <20200429070247.1678172-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Fix early_init_mmu section mismatch
Message-Id: <159168031279.1381411.14709671191249764346.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:30 +1000 (AEST)
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
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 29 Apr 2020 17:02:47 +1000, Nicholas Piggin wrote:
> Christian reports:
> 
>   MODPOST vmlinux.o
>   WARNING: modpost: vmlinux.o(.text.unlikely+0x1a0): Section mismatch in
>   reference from the function .early_init_mmu() to the function
>   .init.text:.radix__early_init_mmu()
>   The function .early_init_mmu() references
>   the function __init .radix__early_init_mmu().
>   This is often because .early_init_mmu lacks a __init
>   annotation or the annotation of .radix__early_init_mmu is wrong.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64s: Fix early_init_mmu section mismatch
      https://git.kernel.org/powerpc/c/9384e552aabb647ec22acb00181ca1715b0fcdfe

cheers
