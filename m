Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1363C6D73CB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 07:33:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrtZb6vJPz3c6v
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 15:33:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YfZvmH+F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrtYk356Jz3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 15:32:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YfZvmH+F;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PrtYh30Hrz4wj7;
	Wed,  5 Apr 2023 15:32:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680672746;
	bh=6cvZnTNdwRmgAZ2M1VYA2Gsp2e92pYs++vVV/vBNJI0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YfZvmH+FVv9XziLRu5Qy0A59sFncSyDVUTEY9XnAANVK87Rj7BcIp7Pr4igO888Wj
	 7fEVYZ6ezUGVvYRpfEYBpt+/rsqwlyGm51T1Ocbfrth0iO8J2iYQ/zNcI+duNkPddP
	 WEJa9k0ih/LUCi1xme4jWirECKyad4GxjkLJWaEhO3XIUbU4QGr8M6rqqrUxvYlIp3
	 XXzlLj1te8KtwjzDxT7Z+8QaiK8N/dA0Ksf1iaIy0DL6VrIHabBAhfTz20X4qWZl9H
	 3I7PFOMSZlj3noQzITqlCpBOWSHxa4q3nZC0/kOItcmVaakQrbOHemRvnCnTkSvBSK
	 SA4zKynbM994g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/64: Always build with 128-bit long double
In-Reply-To: <20230404151010.GC25951@gate.crashing.org>
References: <20230404102847.3303623-1-mpe@ellerman.id.au>
 <20230404151010.GC25951@gate.crashing.org>
Date: Wed, 05 Apr 2023 15:32:21 +1000
Message-ID: <87edoyki6y.fsf@mpe.ellerman.id.au>
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
Cc: dan@danny.cz, daniel@octaforge.org, amd-gfx@lists.freedesktop.org, tpearson@raptorengineering.com, alexdeucher@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Tue, Apr 04, 2023 at 08:28:47PM +1000, Michael Ellerman wrote:
>> The amdgpu driver builds some of its code with hard-float enabled,
>> whereas the rest of the kernel is built with soft-float.
>> 
>> When building with 64-bit long double, if soft-float and hard-float
>> objects are linked together, the build fails due to incompatible ABI
>> tags.
>
>> Currently those build errors are avoided because the amdgpu driver is
>> gated on 128-bit long double being enabled. But that's not a detail the
>> amdgpu driver should need to be aware of, and if another driver starts
>> using hard-float the same problem would occur.
>
> Well.  The kernel driver either has no business using long double (or
> any other floating point even) at all, or it should know exactly what is
> used: double precision, double-double, or quadruple precision.  Both of
> the latter two are 128 bits.

In a perfect world ... :)

>> All versions of the 64-bit ABI specify that long-double is 128-bits.
>> However some compilers, notably the kernel.org ones, are built to use
>> 64-bit long double by default.
>
> Mea culpa, I suppose?  But builddall doesn't force 64 bit explicitly.
> I wonder how this happened?  Is it maybe a problem in the powerpc64le
> config in GCC itself?

Not blaming anyone, just one of those things that happens. The
toolchains the distros (Ubuntu/Fedora) build all seem to use 128, but
possibly that's because someone told them to configure them that way at
some point.

> I have a patch from summer last year (Arnd's
> toolchains are built without it) that does
> +       powerpc64le-*)  TARGET_GCC_CONF=--with-long-double-128
> Unfortunately I don't remember why I did that, and I never investigated
> what the deeper problem is :-/

Last summer (aka winter) is when we first discovered this issue with the
long double size being implicated.

See:
  https://git.kernel.org/torvalds/c/c653c591789b3acfa4bf6ae45d5af4f330e50a91

So I guess that's what prompted your patch?

> In either case, the kernel should always use specific types, not rely on
> the toolchain to pick a type that may or may not work.  The correct size
> floating point type alone is not enough, but it is a step in the right
> direction certainly.
>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

Thanks.

cheers
