Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A789B7F296D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 10:56:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mhD+0S4v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZKXC44j6z3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 20:56:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mhD+0S4v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZKWN5Ywsz3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 20:55:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 48523CE19AC;
	Tue, 21 Nov 2023 09:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7622C433C9;
	Tue, 21 Nov 2023 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700560541;
	bh=whZKNHlZ95uq0WovW7uV1N9xwhHgL6PQohmnfid0AWE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mhD+0S4vsURq+ycERbdOKbNJeq/9OUo8bkbe1D5VplTzH+MK4N3u1Z1NSSEdOcaRe
	 HrpHSY48+BT6K4A29XWUtMFUA3xzhJzbaXQpq5+pntililQaEe1NyYUzat3dwdenjA
	 RdBerLk6UxRMshZcUMxVaXBraKRnLRiA32I+mSUcBp2UaoSltK67Q3qcWSBtoBy7/Q
	 a8e8XXZsVKcKdwHrMgGpSYGToQ5gJzTuSovqOMqoOM8aKDs+WD5KKm4jYmCWkBCUVV
	 5pNxwRYWo1UgsJ1yO8zYF8Rax0Ogq78AwXezck25mwyLJZuaWIOgzVqddkKbQZ/eNn
	 DWkAuv+q9Yyug==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
In-Reply-To: <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely>
References: <20231120232332.4100288-1-masahiroy@kernel.org>
 <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely>
Date: Tue, 21 Nov 2023 15:25:28 +0530
Message-ID: <87bkbnsa5r.fsf@kernel.org>
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
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:

> On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
>> crtsavres.o is linked to modules. However, as explained in commit
>> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
>> and always-y"), 'make modules' does not build extra-y.
>>
>> For example, the following command fails:
>>
>>   $ make ARCH=powerpc LLVM=1 KBUILD_MODPOST_WARN=1 mrproper ps3_defconfig modules
>>     [snip]
>>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
>>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory
>>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/cell/spufs/spufs.ko] Error 1
>>   make[2]: *** [Makefile:1844: modules] Error 2
>>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: __build_one_by_one] Error 2
>>   make: *** [Makefile:234: __sub-make] Error 2
>>
>
> Thanks. Is this the correct Fixes tag?
>
> Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux")
>

I am finding a different commit ID:

commit baa25b571a168aff5a13bfdc973f1229e2b12b63
Author: Nicholas Piggin <npiggin@gmail.com>
Date:   Fri May 12 01:56:49 2017 +1000

    powerpc/64: Do not link crtsavres.o in vmlinux
     
    The 64-bit linker creates save/restore functions on demand with final
    links, so vmlinux does not require crtsavres.o.
     

-aneesh
