Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3B980883E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:46:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDXr35QNz3vlF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:46:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDVn630Bz3dBH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:44:33 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVn5DVkz4xPL;
	Thu,  7 Dec 2023 23:44:33 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <masahiroy@kernel.org>
In-Reply-To: <20231120232332.4100288-1-masahiroy@kernel.org>
References: <20231120232332.4100288-1-masahiroy@kernel.org>
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
Message-Id: <170195271160.2310221.3176675115907278770.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
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
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Nov 2023 08:23:32 +0900, Masahiro Yamada wrote:
> crtsavres.o is linked to modules. However, as explained in commit
> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
> and always-y"), 'make modules' does not build extra-y.
> 
> For example, the following command fails:
> 
>   $ make ARCH=powerpc LLVM=1 KBUILD_MODPOST_WARN=1 mrproper ps3_defconfig modules
>     [snip]
>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory
>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/cell/spufs/spufs.ko] Error 1
>   make[2]: *** [Makefile:1844: modules] Error 2
>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: __build_one_by_one] Error 2
>   make: *** [Makefile:234: __sub-make] Error 2
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: add crtsavres.o to always-y instead of extra-y
      https://git.kernel.org/powerpc/c/1b1e38002648819c04773647d5242990e2824264

cheers
