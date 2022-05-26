Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 829AA534A92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 08:57:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7zK83884z3bl5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 16:57:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QCxhAjt6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7zJW6h0lz2yn5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 16:57:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QCxhAjt6;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7zJV5bTjz4xDK;
	Thu, 26 May 2022 16:57:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1653548235;
	bh=127HEbVatWxWSFTFtkpD7Yfl33CpGpSP98OYTsRwnfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QCxhAjt6Cmrd7OYhcpP7StCfbgt1eKhXP8fsF+y9fUiYgOomanYuq4rvXCy1iAbO6
	 Fa/Yb57lrmsGPvg8ptDt6o+vF8vz0dXfFIE6/KUc7VL1RqnqOn2XrVi0njz/A+TToB
	 bOMSR5vuSqTn1/xEg+aIxy2WBszaPacAIeM7w5OzKnUf0Eadp9pgBcqaMV6UhEuzzC
	 pGMjWceYtwomWpyL6vkoTgIfTeFG7sLQyoYp64Rlwd8D3SRQgTuEwshq2S8R6NTkzi
	 FN+3PJEBFYbqiLCo7u+Z7ayg02OMpti5+Gjjb1sflXrGMrZCjOjYl7nxuBHXKLfF7Z
	 ECXqLM6Ni1vHQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnout Vandecappelle <arnout@mind.be>, Joel Stanley <joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH] linux: Fix powerpc64le defconfig selection
In-Reply-To: <693a9659-d2f2-8a74-2402-592a429af336@mind.be>
References: <20220510022055.67582-1-joel@jms.id.au>
 <a18d0411-9134-2ee7-62d0-4ba6a1780846@mind.be>
 <87a6bh7h2e.fsf@mpe.ellerman.id.au>
 <693a9659-d2f2-8a74-2402-592a429af336@mind.be>
Date: Thu, 26 May 2022 16:57:09 +1000
Message-ID: <875ylsn5mi.fsf@mpe.ellerman.id.au>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnout Vandecappelle <arnout@mind.be> writes:
> On 16/05/2022 15:17, Michael Ellerman wrote:
>> Arnout Vandecappelle <arnout@mind.be> writes:
>>> On 10/05/2022 04:20, Joel Stanley wrote:
>>>> The default defconfig target for the 64 bit powerpc kernel is
>>>> ppc64_defconfig, the big endian configuration.
>>>>
>>>> When building for powerpc64le users want the little endian kernel as
>>>> they can't boot LE userspace on a BE kernel.
>>>>
>>>> Fix up the defconfig used in this case. This will avoid the following
>>>> autobuilder failure:
>>>>
>>>>    VDSO32A arch/powerpc/kernel/vdso32/sigtramp.o
>>>>    cc1: error: =E2=80=98-m32=E2=80=99 not supported in this configurat=
ioin
>>>>    make[4]: *** [arch/powerpc/kernel/vdso32/Makefile:49: arch/powerpc/=
kernel/vdso32/sigtramp.o] Error 1
>>>>
>>>>    http://autobuild.buildroot.net/results/dd76d53bab56470c0b83e296872d=
7bb90f9e8296/
>>>>
>>>> Note that the failure indicates the toolchain is configured to disable
>>>> the 32 bit target, causing the kernel to fail when building the 32 bit
>>>> VDSO. This is only a problem on the BE kernel as the LE kernel disables
>>>> CONFIG_COMPAT, aka 32 bit userspace support, by default.
>>>>
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>
>>>    Applied to master, thanks. However, the defconfig mechanism for *all=
* powerpc
>>> seems pretty broken. Here's what we have in 5.16, before that there was
>>> something similar:
>>>
>>> # If we're on a ppc/ppc64/ppc64le machine use that defconfig, otherwise=
 just use
>>> # ppc64_defconfig because we have nothing better to go on.
>>> uname :=3D $(shell uname -m)
>>> KBUILD_DEFCONFIG :=3D $(if $(filter ppc%,$(uname)),$(uname),ppc64)_defc=
onfig
>>>
>>>    So I guess we should use a specific defconfig for *all* powerpc.
>>>
>>>    The arch-default defconfig is generally not really reliable, for exa=
mple for
>>> arm it always takes v7_multi, but that won't work for v7m targets...
>>=20
>> There's a fundamental problem that just the "arch" is not sufficient
>> detail when you're building a kernel.
>
>   Yes, which is pretty much unavoidable.
>
>> Two CPUs that implement the same user-visible "arch" may differ enough
>> at the kernel level to require a different defconfig.
>>=20
>> Having said that I think we could handle this better in the powerpc
>> kernel. Other arches allow specifying a different value for ARCH, which
>> then is fed into the defconfig.
>
>   I don't know if it's worth bothering with that. It certainly would not =
make=20
> our life easier, because it would mean we need to set ARCH correctly. If =
we can=20
> do that, we can just as well set the defconfig correctly.

OK.

>> That way you could at least pass ARCH=3Dppc/ppc64/ppc64le, and get an
>> appropriate defconfig.
>>=20
>> I'll work on some kernel changes for that.
>
>   I think the most important thing is that it makes no sense to rely on u=
name=20
> when ARCH and/or CROSS_COMPILE are set.

I'm not sure I entirely agree.

Neither ARCH or CROSS_COMPILE give us enough information to know which
defconfig to use, so we still have to guess somehow.

CROSS_COMPILE can be set even when you're building on ppc, it's the
easiest way to specfiy a different toolchain from the default.

cheers
