Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5BB6DF4A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 14:03:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxLvy5n6hz3fQY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 22:03:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZCoiEQfg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxLv54f1jz3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 22:02:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZCoiEQfg;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PxLv23jRZz4xFd;
	Wed, 12 Apr 2023 22:02:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681300974;
	bh=F2asZabOHB6NFbG/61+yCHm7pNGbmMoPx7zSLypENV8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZCoiEQfgaiE/bZtcYlseLoEYcgDNCwRRRkiGiDyYQZsS03TbfFMK2zAhdn0/Dkbp1
	 Jlx5HIoOnLCoNpgz8bKYSvhF/J+Px5h1z9qgUFJcnon++nGadrZ9CkewLugX7MxClR
	 0SW8FjfYbWjQOk5cV+L9Gn5l175bm6lSnrPsJKexIJM3mgtScgB7OEy2YFBmG5u5Hb
	 5g4QfGb8c2mJikMUqLHYtgfX7FaJ2l2FDxxl89Eb1uFr/zPo9gYcZXwAd4aeEsoxvu
	 qRgucGhd93n1LxX8TRpoL3tWEXkCmnNWdyXwVu3xcYoBT4LfgSE3GtyCHpvrbtohBe
	 clSQmaVwolwWg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Deming Wang <wangdeming@inspur.com>, shuah@kernel.org
Subject: Re: [PATCH] selftests/powerpc: Replace obsolete memalign() with
 posix_memalign()
In-Reply-To: <20230412111237.2007-1-wangdeming@inspur.com>
References: <20230412111237.2007-1-wangdeming@inspur.com>
Date: Wed, 12 Apr 2023 22:02:50 +1000
Message-ID: <87o7nti9zp.fsf@mpe.ellerman.id.au>
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
Cc: Deming Wang <wangdeming@inspur.com>, linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Deming Wang <wangdeming@inspur.com> writes:
> memalign() is obsolete according to its manpage.
>
> Replace memalign() with posix_memalign() and remove malloc.h include
> that was there for memalign().
>
> As a pointer is passed into posix_memalign(), initialize *s to NULL
> to silence a warning about the function's return value being used as
> uninitialized (which is not valid anyway because the error is properly
> checked before p is returned).

The patch doesn't do that. There is no p?

I think you've copied the change log for a whole bunch of commits but
not updated them to be accurate for each change?

cheers

> diff --git a/tools/testing/selftests/powerpc/stringloops/strlen.c b/tools/testing/selftests/powerpc/stringloops/strlen.c
> index 9055ebc484d0..f9c1f9cc2d32 100644
> --- a/tools/testing/selftests/powerpc/stringloops/strlen.c
> +++ b/tools/testing/selftests/powerpc/stringloops/strlen.c
> @@ -1,5 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0
> -#include <malloc.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <time.h>
> @@ -51,10 +50,11 @@ static void bench_test(char *s)
>  static int testcase(void)
>  {
>  	char *s;
> +	int ret;
>  	unsigned long i;
>  
> -	s = memalign(128, SIZE);
> -	if (!s) {
> +	ret = posix_memalign((void **)&s, 128, SIZE);
> +	if (ret < 0) {
>  		perror("memalign");
>  		exit(1);
>  	}
> -- 
> 2.27.0
