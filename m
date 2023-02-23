Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBE46A0218
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 05:43:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMgQg0477z3cXl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 15:43:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Vjfi48je;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMgPm1YLZz3c72
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 15:43:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Vjfi48je;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PMgPl5VPbz4x5X;
	Thu, 23 Feb 2023 15:43:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677127387;
	bh=RcPf/yVfNQXTHTIDsKM1VL6c0rF/I59vwPQ6PaamSkY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Vjfi48jeUf845yqqakdvQVfJ4Jihbd9ETHh8hccv/5U8iwckJVJAH95Wzz98hfT+c
	 sPsZFS71srDg+lqWxORd9F2oKRi0dUMyPelVmjNESeqHdjw+p660txlOSaznKVhF4U
	 hbchRQ+Y5nhIHLWTfCcjQJq8jbom2MIpgjhO/GJR7ehBiOp+OdCAuejy9fI0WTgYGF
	 1SKZnTEU4pjvjNkeL8GWbRjFjL+cMAOVX/lRDkCzctZUaNZMajeo46ZSmfHwDRrmbk
	 K2fvOGVtRFr+l3GNruj+f/npgozVLQpyaTpkIMoqhQPWGbPoS1wNXBQPzph8bZmuae
	 5GvpK+1RUI0hw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] powerpc/vmlinux.lds: Add .text.asan/tsan sections
In-Reply-To: <Y/ZMEqjpT6plg0nR@dev-arch.thelio-3990X>
References: <20230222060037.2897169-1-mpe@ellerman.id.au>
 <Y/ZMEqjpT6plg0nR@dev-arch.thelio-3990X>
Date: Thu, 23 Feb 2023 15:43:04 +1100
Message-ID: <87cz61at5z.fsf@mpe.ellerman.id.au>
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
Cc: ndesaulniers@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> On Wed, Feb 22, 2023 at 05:00:37PM +1100, Michael Ellerman wrote:
>> When KASAN/KCSAN are enabled clang generates .text.asan/tsan sections.
>> Because they are not mentioned in the linker script warnings are
>> generated, and when orphan handling is set to error that becomes a build
>> error, eg:
>> 
>>   ld.lld: error: vmlinux.a(init/main.o):(.text.tsan.module_ctor) is
>>   being placed in '.text.tsan.module_ctor' ld.lld: error:
>>   vmlinux.a(init/version.o):(.text.tsan.module_ctor) is being placed in
>>   '.text.tsan.module_ctor'
>> 
>> Fix it by adding the sections to our linker script, similar to the
>> generic change made in 848378812e40 ("vmlinux.lds.h: Handle clang's
>> module.{c,d}tor sections").
>> 
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Indeed, I had not thought about architectures not using the TEXT_TEXT
> macro.

I think it's just us. I have a plan to fix that but it's a bit involved.

> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks.

cheers
