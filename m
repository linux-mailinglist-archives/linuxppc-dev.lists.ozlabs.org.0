Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7676F171C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 14:03:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q7B8j0WJ8z3fVw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 22:03:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nI15zjo2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=2a00:1098:0:82:1000:25:2eeb:e5ab; helo=madras.collabora.co.uk; envelope-from=usama.anjum@collabora.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nI15zjo2;
	dkim-atps=neutral
X-Greylist: delayed 317 seconds by postgrey-1.36 at boromir; Fri, 28 Apr 2023 18:14:39 AEST
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q754H5gmYz3c6v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Apr 2023 18:14:39 +1000 (AEST)
Received: from [192.168.10.39] (unknown [39.37.187.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2791266032C3;
	Fri, 28 Apr 2023 09:09:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682669347;
	bh=j90SNX8gDxgMch3e8i0rNxBg5i2HnX4rEsOIw0VxQug=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=nI15zjo251FRTC5y40Ph5kANUL6OpwjTQHhBiCc1uYNex6zMsiHvISoE8uCrrfUDO
	 CZnVGzeLa5xN2QyYXcoIMztjkby06Zm8lyrvdYl03Wv78nYdfG7+cLw3Bc7PEbKdyJ
	 Wwekx7SqPnqQXON2mPROfZV+pjJvaPBOrV7zrvrWwJMuBoHDg9gVNYDqMMX8n7UAK+
	 UEpK8FZlXwJOytRYk80h1vkjDKl6Odzin94OAbo8/pkXzvQaAFQSqVmO9XfPBiNy+Y
	 hTUKl2JvxqKfdSiijdFoFtMUHNftbg8e0JO6bMfryIgGK9/jvAslyRWk/1XTeQsfbA
	 5zW4Nyd2rTyQw==
Message-ID: <b0af0f17-907c-3905-faf8-1c1e43acbca2@collabora.com>
Date: Fri, 28 Apr 2023 13:09:00 +0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] selftests/powerpc: Replace obsolete memalign() with
 posix_memalign()
Content-Language: en-US
To: Deming Wang <wangdeming@inspur.com>, mpe@ellerman.id.au, shuah@kernel.org
References: <20230413010250.4254-1-wangdeming@inspur.com>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20230413010250.4254-1-wangdeming@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Apr 2023 22:01:27 +1000
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
Cc: linux-kernel@vger.kernel.org, Muhammad Usama Anjum <usama.anjum@collabora.com>, npiggin@gmail.com, linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/13/23 6:02 AM, Deming Wang wrote:
> memalign() is obsolete according to its manpage.
> 
> Replace memalign() with posix_memalign() and remove malloc.h include
> that was there for memalign().
Thanks for the patch.

> 
> As a pointer is passed into posix_memalign(), initialize *s to NULL
I'm unable to find this initialization below. Did you really mean to add
the initialization?

> to silence a warning about the function's return value being used as
> uninitialized (which is not valid anyway because the error is properly
> checked before s is returned).
> 
> Signed-off-by: Deming Wang <wangdeming@inspur.com>
> ---
>  tools/testing/selftests/powerpc/stringloops/strlen.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
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
Can we do if (!ret) instead? The page says:
posix_memalign()  returns zero on success.
>  		perror("memalign");
>  		exit(1);
>  	}

-- 
BR,
Muhammad Usama Anjum
