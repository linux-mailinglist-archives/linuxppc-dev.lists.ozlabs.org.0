Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7109528528
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 15:17:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L20DJ5snRz3c9V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 23:17:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GQwDChHi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L20Ch714Rz2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 May 2022 23:17:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GQwDChHi; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L20Cf32jWz4xY4;
 Mon, 16 May 2022 23:17:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652707039;
 bh=BinEdrmN1IkeDmoVZqub01efpb7Nl+pPavZ2VguRhB8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GQwDChHi2C9rxpY12mVi5aomHKBVnXwpW+ydOUmhYEgngymwbz3o1ZN3Js+Km17BH
 x6ssM68YNge53K354dk40xswpHqqsj4hW1HQ2FNYsadaANAomq0TS4H2AZr2zTcgmg
 9ekTXOB19V3728GYE+Qdgo49ckXPYgzgXzHcaH2MjQM+B6pHvYn+zwOJ+lh10Ozjw8
 mmGEq/eUQo2wpCB6Mcjz+NFiJKpM+odHMfvc6W0VUZRiXUdgOtBslVMdZ2XoVoYRpn
 byQIUoJnCeJEmSQihDhySk+evUJd81/GkuJm5sbG9DCWAW25R+4AXkq2eNJ5S0Kc3Y
 Y1lxo0RwxgJMg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnout Vandecappelle <arnout@mind.be>, Joel Stanley <joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH] linux: Fix powerpc64le defconfig selection
In-Reply-To: <a18d0411-9134-2ee7-62d0-4ba6a1780846@mind.be>
References: <20220510022055.67582-1-joel@jms.id.au>
 <a18d0411-9134-2ee7-62d0-4ba6a1780846@mind.be>
Date: Mon, 16 May 2022 23:17:13 +1000
Message-ID: <87a6bh7h2e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, buildroot@buildroot.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnout Vandecappelle <arnout@mind.be> writes:
> On 10/05/2022 04:20, Joel Stanley wrote:
>> The default defconfig target for the 64 bit powerpc kernel is
>> ppc64_defconfig, the big endian configuration.
>>=20
>> When building for powerpc64le users want the little endian kernel as
>> they can't boot LE userspace on a BE kernel.
>>=20
>> Fix up the defconfig used in this case. This will avoid the following
>> autobuilder failure:
>>=20
>>   VDSO32A arch/powerpc/kernel/vdso32/sigtramp.o
>>   cc1: error: =E2=80=98-m32=E2=80=99 not supported in this configuratioin
>>   make[4]: *** [arch/powerpc/kernel/vdso32/Makefile:49: arch/powerpc/ker=
nel/vdso32/sigtramp.o] Error 1
>>=20
>>   http://autobuild.buildroot.net/results/dd76d53bab56470c0b83e296872d7bb=
90f9e8296/
>>=20
>> Note that the failure indicates the toolchain is configured to disable
>> the 32 bit target, causing the kernel to fail when building the 32 bit
>> VDSO. This is only a problem on the BE kernel as the LE kernel disables
>> CONFIG_COMPAT, aka 32 bit userspace support, by default.
>>=20
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
>   Applied to master, thanks. However, the defconfig mechanism for *all* p=
owerpc=20
> seems pretty broken. Here's what we have in 5.16, before that there was=20
> something similar:
>
> # If we're on a ppc/ppc64/ppc64le machine use that defconfig, otherwise j=
ust use
> # ppc64_defconfig because we have nothing better to go on.
> uname :=3D $(shell uname -m)
> KBUILD_DEFCONFIG :=3D $(if $(filter ppc%,$(uname)),$(uname),ppc64)_defcon=
fig
>
>   So I guess we should use a specific defconfig for *all* powerpc.
>
>   The arch-default defconfig is generally not really reliable, for exampl=
e for=20
> arm it always takes v7_multi, but that won't work for v7m targets...

There's a fundamental problem that just the "arch" is not sufficient
detail when you're building a kernel.

Two CPUs that implement the same user-visible "arch" may differ enough
at the kernel level to require a different defconfig.

Having said that I think we could handle this better in the powerpc
kernel. Other arches allow specifying a different value for ARCH, which
then is fed into the defconfig.

That way you could at least pass ARCH=3Dppc/ppc64/ppc64le, and get an
appropriate defconfig.

I'll work on some kernel changes for that.

cheers
