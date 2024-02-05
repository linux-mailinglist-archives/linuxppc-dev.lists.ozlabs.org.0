Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B67D6849938
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 12:51:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qFtnvIwy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT4TH4b3Zz3bqC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 22:50:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qFtnvIwy;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT4SX2fk3z2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 22:50:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1707133820;
	bh=bq4JnBKH4fcGIQnmBj9NFYLFAco5hbkJPdMheU+N2rg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qFtnvIwyatxe9V0C/oa7VXw+9uKeDDekYVIcg/rKdZBKYY+sfNOvrYEXpL0khVtcw
	 xJxX8RBOuz6kcSKoyDZV8Kwl67LBjdGP81LGqiyVTw7dSM4pqsVX8+hCxpgBpTDoey
	 /IdMaHFHuNNzOQKzKQJLIhfeD45omAFespEwvYoeBs9lBNdd25uGXbqSYugZCD6k5l
	 M6kBe7lHCNkHIyHpM3ryw3oaHEA9e/OqDEGDNDQJFDZlSqvO0Cejql5lelNbGxT+qs
	 zDnzji32v67pY5StdX8BM6iyamOfnu160TUsEFx42ek6ozAvZ2qopEN2GwYdcVoVSY
	 tM8FgIe/rKvsw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TT4SV4yXvz4wcF;
	Mon,  5 Feb 2024 22:50:18 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jan Stancek <jstancek@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
In-Reply-To: <ZbjHTMhQ4Z9lRR6L@t14s>
References: <20231120232332.4100288-1-masahiroy@kernel.org>
 <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely> <ZbjHTMhQ4Z9lRR6L@t14s>
Date: Mon, 05 Feb 2024 22:50:17 +1100
Message-ID: <87v873870m.fsf@mail.lhotse>
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
Cc: Tom Rix <trix@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org, jstancek@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jan Stancek <jstancek@redhat.com> writes:
> On Tue, Nov 21, 2023 at 10:51:34AM +1000, Nicholas Piggin wrote:
>>On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
>>> crtsavres.o is linked to modules. However, as explained in commit
>>> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
>>> and always-y"), 'make modules' does not build extra-y.
>>>
>>> For example, the following command fails:
>>>
>>>   $ make ARCH=powerpc LLVM=1 KBUILD_MODPOST_WARN=1 mrproper ps3_defconfig modules
>>>     [snip]
>>>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
>>>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory
>>>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/cell/spufs/spufs.ko] Error 1
>>>   make[2]: *** [Makefile:1844: modules] Error 2
>>>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: __build_one_by_one] Error 2
>>>   make: *** [Makefile:234: __sub-make] Error 2
>>>
>>
>>Thanks. Is this the correct Fixes tag?
>>
>>Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux")
>>
>>Hmm, looks like LLD might just do this now automatically for us
>>too without --save-restore-funcs (https://reviews.llvm.org/D79977).
>>But we probably still need it for older versions, so we still need
>>your patch.
>
> Hi,
>
> I'm still seeing the error of crtsavres.o missing when building external modules
> after "make LLVM=1 modules_prepare". Should it be built also in archprepare?

Or modules_prepare?

Example patch below.

cheers


diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 051247027da0..82cdef40a9cd 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -59,6 +59,11 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
 KBUILD_LDFLAGS_MODULE += --save-restore-funcs
 else
 KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
+
+crtsavres_prepare: scripts
+	$(MAKE) $(build)=arch/powerpc/lib arch/powerpc/lib/crtsavres.o
+
+modules_prepare: crtsavres_prepare
 endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN

