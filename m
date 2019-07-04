Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3535F00A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 02:28:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fJjN3WjSzDqbB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 10:28:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fJgs37BjzDqXS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 10:26:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45fJgr3SRDz9sNw;
 Thu,  4 Jul 2019 10:26:48 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/boot: pass CONFIG options in a simpler and
 more robust way
In-Reply-To: <1557756964-13087-1-git-send-email-yamada.masahiro@socionext.com>
References: <1557756964-13087-1-git-send-email-yamada.masahiro@socionext.com>
Date: Thu, 04 Jul 2019 10:26:48 +1000
Message-ID: <87v9wibq5z.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Mark Greer <mgreer@animalcreek.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> Commit 5e9dcb6188a4 ("powerpc/boot: Expose Kconfig symbols to wrapper")
> was wrong, but commit e41b93a6be57 ("powerpc/boot: Fix build failures
> with -j 1") was also wrong.
>
> The correct dependency is:
>
>   $(obj)/serial.o: $(obj)/autoconf.h
>
> However, I do not see the reason why we need to copy autoconf.h to
> arch/power/boot/. Nor do I see consistency in the way of passing
> CONFIG options.
>
> decompress.c references CONFIG_KERNEL_GZIP and CONFIG_KERNEL_XZ, which
> are passed via the command line.
>
> serial.c includes autoconf.h to reference a couple of CONFIG options,
> but this is fragile because we often forget to include "autoconf.h"
> from source files.
>
> In fact, it is already broken.
>
> ppc_asm.h references CONFIG_PPC_8xx, but utils.S is not given any way
> to access CONFIG options. So, CONFIG_PPC_8xx is never defined here.
>
> Pass $(LINUXINCLUDE) to make sure CONFIG options are accessible from
> all .c and .S files in arch/powerpc/boot/.

This breaks our skiroot_defconfig, I don't know why yet:

  In file included from /kisskb/src/arch/powerpc/boot/../../../lib/decompress_unxz.c:236:0,
                   from /kisskb/src/arch/powerpc/boot/decompress.c:42:
  /kisskb/src/arch/powerpc/boot/../../../lib/xz/xz_dec_bcj.c: In function 'bcj_powerpc':
  /kisskb/src/arch/powerpc/boot/../../../lib/xz/xz_dec_bcj.c:166:11: warning: implicit declaration of function 'get_unaligned_be32' [-Wimplicit-function-declaration]
     instr = get_unaligned_be32(buf + i);


http://kisskb.ellerman.id.au/kisskb/buildresult/13862914/

cheers
