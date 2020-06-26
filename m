Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D8920ABA4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 07:00:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tPnx6KyFzDqDL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 15:00:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPTg1VLZzDqkK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:45:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49tPTc04WXz9sTC; Fri, 26 Jun 2020 14:45:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Albert Herranz <albert_herranz@yahoo.es>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <ca8c9f8249f523b1fab873e67b81b11989d46553.1592207216.git.christophe.leroy@csgroup.eu>
References: <ca8c9f8249f523b1fab873e67b81b11989d46553.1592207216.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/fixmap: Fix FIX_EARLY_DEBUG_BASE when page size
 is 256k
Message-Id: <159314672762.1150869.11958650760523739309.b4-ty@ellerman.id.au>
Date: Fri, 26 Jun 2020 14:45:55 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Jun 2020 07:48:25 +0000 (UTC), Christophe Leroy wrote:
> FIX_EARLY_DEBUG_BASE reserves a 128k area for debuging.
> 
> When page size is 256k, the calculation results in a 0 number of
> pages, leading to the following failure:
> 
>   CC      arch/powerpc/kernel/asm-offsets.s
> In file included from ./arch/powerpc/include/asm/nohash/32/pgtable.h:77:0,
>                  from ./arch/powerpc/include/asm/nohash/pgtable.h:8,
>                  from ./arch/powerpc/include/asm/pgtable.h:20,
>                  from ./include/linux/pgtable.h:6,
>                  from ./arch/powerpc/include/asm/kup.h:42,
>                  from ./arch/powerpc/include/asm/uaccess.h:9,
>                  from ./include/linux/uaccess.h:11,
>                  from ./include/linux/crypto.h:21,
>                  from ./include/crypto/hash.h:11,
>                  from ./include/linux/uio.h:10,
>                  from ./include/linux/socket.h:8,
>                  from ./include/linux/compat.h:15,
>                  from arch/powerpc/kernel/asm-offsets.c:14:
> ./arch/powerpc/include/asm/fixmap.h:75:2: error: overflow in enumeration values
>   __end_of_permanent_fixed_addresses,
>   ^
> make[2]: *** [arch/powerpc/kernel/asm-offsets.s] Error 1
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/fixmap: Fix FIX_EARLY_DEBUG_BASE when page size is 256k
      https://git.kernel.org/powerpc/c/03fd42d458fb9cb69e712600bd69ff77ff3a45a8

cheers
