Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C00131C82
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 00:43:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sBs76DJBzDqM3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 10:43:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sBdp0r9GzDqGZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 10:33:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47sBdn5hHgz9sRG; Tue,  7 Jan 2020 10:33:17 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c3aae14e5d468d18dbb5d7c0c8c7e2968cc14aad
In-Reply-To: <20191209200338.12546-1-natechancellor@gmail.com>
To: Nathan Chancellor <natechancellor@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/44x: Adjust indentation in
 ibm4xx_denali_fixup_memsize
Message-Id: <47sBdn5hHgz9sRG@ozlabs.org>
Date: Tue,  7 Jan 2020 10:33:17 +1100 (AEDT)
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-12-09 at 20:03:38 UTC, Nathan Chancellor wrote:
> Clang warns:
> 
> ../arch/powerpc/boot/4xx.c:231:3: warning: misleading indentation;
> statement is not part of the previous 'else' [-Wmisleading-indentation]
>         val = SDRAM0_READ(DDR0_42);
>         ^
> ../arch/powerpc/boot/4xx.c:227:2: note: previous statement is here
>         else
>         ^
> 
> This is because there is a space at the beginning of this line; remove
> it so that the indentation is consistent according to the Linux kernel
> coding style and clang no longer warns.
> 
> Fixes: d23f5099297c ("[POWERPC] 4xx: Adds decoding of 440SPE memory size to boot wrapper library")
> Link: https://github.com/ClangBuiltLinux/linux/issues/780
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c3aae14e5d468d18dbb5d7c0c8c7e2968cc14aad

cheers
