Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D946DF55B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 14:35:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxMc85rmpz3f4w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 22:35:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D5fApWiI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxMbJ5450z3c8b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 22:34:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D5fApWiI;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PxMbG3NBLz4xFv;
	Wed, 12 Apr 2023 22:34:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681302860;
	bh=UkeH4F5iZRYI0CERsT9TqP3nJ65xS+EjA8sk8RC8NXw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D5fApWiI4iWpuhSEPHX/pj3vuEB5E3d9W5uIEtrlJokW7xeV4OI3kndIViUjq6BxU
	 gPY8TKEhKQXmcLw/Qa3mpfkbUyGjFbBF8+FTu8G59rUMDBz8UIru2WjulaPHf9bSiJ
	 rMpbhrD6lh2+IxZRZXJZlaoU1pxVgtkp2vsWXb27LIOQvfnIXWBMD8NXtZhaMUvedl
	 jTyqj7e0iDTH9Kp4c7nDXs1ADuvGRDJdLBgJUTzq+u0zCn6VdhFJulyH9ppDEsjMs7
	 sDunwklz0oFYq+I8KUmGHop1g4hWa2DFvHzRtdAvQpMqM+RzjJrd1YUPlvmCiWz63N
	 vOnGtXcAZtj/A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/64: Always build with 128-bit long double
In-Reply-To: <155c1057-d928-9037-9847-58cdbe7cf537@amd.com>
References: <20230404102847.3303623-1-mpe@ellerman.id.au>
 <155c1057-d928-9037-9847-58cdbe7cf537@amd.com>
Date: Wed, 12 Apr 2023 22:34:15 +1000
Message-ID: <87leixi8jc.fsf@mpe.ellerman.id.au>
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
Cc: dan@danny.cz, daniel@octaforge.org, amd-gfx@lists.freedesktop.org, tpearson@raptorengineering.com, alexdeucher@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hamza Mahfooz <hamza.mahfooz@amd.com> writes:
> On 4/4/23 06:28, Michael Ellerman wrote:
>> The amdgpu driver builds some of its code with hard-float enabled,
>> whereas the rest of the kernel is built with soft-float.
>> 
>> When building with 64-bit long double, if soft-float and hard-float
>> objects are linked together, the build fails due to incompatible ABI
>> tags.
>> 
>> In the past there have been build errors in the amdgpu driver caused by
>> this, some of those were due to bad intermingling of soft & hard-float
>> code, but those issues have now all been fixed since commit c92b7fe0d92a
>> ("drm/amd/display: move remaining FPU code to dml folder").
>> 
>> However it's still possible for soft & hard-float objects to end up
>> linked together, if the amdgpu driver is built-in to the kernel along
>> with the test_emulate_step.c code, which uses soft-float. That happens
>> in an allyesconfig build.
>> 
>> Currently those build errors are avoided because the amdgpu driver is
>> gated on 128-bit long double being enabled. But that's not a detail the
>> amdgpu driver should need to be aware of, and if another driver starts
>> using hard-float the same problem would occur.
>> 
>> All versions of the 64-bit ABI specify that long-double is 128-bits.
>> However some compilers, notably the kernel.org ones, are built to use
>> 64-bit long double by default.
>> 
>> Apart from this issue of soft vs hard-float, the kernel doesn't care
>> what size long double is. In particular the kernel using 128-bit long
>> double doesn't impact userspace's ability to use 64-bit long double, as
>> musl does.
>> 
>> So always build the 64-bit kernel with 128-bit long double. That should
>> avoid any build errors due to the incompatible ABI tags. Excluding the
>> code that uses soft/hard-float, the vmlinux is identical with/without
>> the flag.
>> 
>> It does mean any code which is incorrectly intermingling soft &
>> hard-float code will build without error, so those bugs will need to be
>> caught by testing rather than at build time.
>> 
>> For more background see:
>>    - commit d11219ad53dc ("amdgpu: disable powerpc support for the newer display engine")
>>    - commit c653c591789b ("drm/amdgpu: Re-enable DCN for 64-bit powerpc")
>>    - https://lore.kernel.org/r/dab9cbd8-2626-4b99-8098-31fe76397d2d@app.fastmail.com
>> 
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Reviewed-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Thanks.

> If you'd prefer to have this go through the amdgpu branch, please let
> me know.

I think it makes more sense to go via the powerpc tree, it will get more
testing on powerpc that way.

cheers
