Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC2F872D7A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 04:23:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qXRwmR6x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqHpB46kXz3vfT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 14:23:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qXRwmR6x;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqHnR09h1z3dSr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 14:23:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709695384;
	bh=/y2+0RqpSJV0EEovMx8gY13hc+5DqjF774hxbb0jxsA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qXRwmR6xvsQniHq04xOB0IRzX0sBHuy9U4c9YFQ0xQXtRekwWFHHOpu9Uqg9HpJmi
	 GS9hOz2qlecKNPk2Ahu/PJH7u1kIolRvbHwjieQCUDj/8io0rP7u2hvpq+VO5K7l6d
	 2iAZrILqVUlRMvsizMk5NrkwAO6Mq7leAw02LiZyY9bSvlZFlu1jYNbuVEbBI3vfIF
	 Xb0r1oY14sbO1qm2jMOOlU8cgt1xu/vTs5STWCWTYNSxh5Z20kmto4nQeEj0cQViqA
	 erYLVs0Z426nVhXhz+/V5iiDAg/UuOWNftxGUybObkkQet1VotBw9hbe73+u99oOe5
	 Q14DiMtfQRi2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TqHnN4FXNz4wb2;
	Wed,  6 Mar 2024 14:23:04 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] selftests/powerpc: Fix load_unaligned_zeropad build
 failure
In-Reply-To: <170966344685.711906.6879783407944074958.b4-ty@chromium.org>
References: <20240305125644.3315910-1-mpe@ellerman.id.au>
 <170966344685.711906.6879783407944074958.b4-ty@chromium.org>
Date: Wed, 06 Mar 2024 14:23:03 +1100
Message-ID: <87y1awniw8.fsf@mail.lhotse>
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
Cc: Tanzir Hasan <tanzhasanwork@gmail.com>, andy.shevchenko@gmail.com, linuxppc-dev@lists.ozlabs.org, Kees Cook <keescook@chromium.org>, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> On Tue, 05 Mar 2024 23:56:44 +1100, Michael Ellerman wrote:
>> This test is userspace code, but uses some kernel headers via symlinks,
>> and mocks other headers, in order to test load_unaligned_zeropad().
>> 
>> Currently the test fails to build with:
>> 
>>   In file included from load_unaligned_zeropad.c:26:
>>   word-at-a-time.h:7:10: fatal error: linux/bitops.h: No such file or directory
>>       7 | #include <linux/bitops.h>
>> 
>> [...]
>
> Applied to for-next/hardening, thanks!
>
> [1/1] selftests/powerpc: Fix load_unaligned_zeropad build failure
>       https://git.kernel.org/kees/c/3fe1eb4dd2e4
>
> Take care,

Thanks.

cheers
