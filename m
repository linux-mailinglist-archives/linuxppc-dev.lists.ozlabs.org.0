Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2895D19ACA0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 15:22:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sn1K1tLhzDqWK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:22:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48smMh5Sp5zDr1b
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 23:53:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 48smMd4mMgz9sT2; Wed,  1 Apr 2020 23:53:17 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48smMd0jTnz9sTD; Wed,  1 Apr 2020 23:53:16 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: ead983604c5a390f1e3ce085945b60e82f08dbbe
In-Reply-To: <20200227045933.22967-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/vmlinux.lds: Explicitly retain .gnu.hash
Message-Id: <48smMd0jTnz9sTD@ozlabs.org>
Date: Wed,  1 Apr 2020 23:53:16 +1100 (AEDT)
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
Cc: joel@jms.id.au, amodra@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-02-27 at 04:59:32 UTC, Michael Ellerman wrote:
> Relocatable kernel builds produce a warning about .gnu.hash being an
> orphan section:
> 
>   ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'
> 
> If we try to discard it the build fails:
> 
>   ld -EL -m elf64lppc -pie --orphan-handling=warn --build-id -o
>     .tmp_vmlinux1 -T ./arch/powerpc/kernel/vmlinux.lds --whole-archive
>     arch/powerpc/kernel/head_64.o arch/powerpc/kernel/entry_64.o
>     ...
>     sound/built-in.a net/built-in.a virt/built-in.a --no-whole-archive
>     --start-group lib/lib.a --end-group
>   ld: could not find section .gnu.hash
> 
> So add an entry to explicitly retain it, as we do for .hash.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/ead983604c5a390f1e3ce085945b60e82f08dbbe

cheers
