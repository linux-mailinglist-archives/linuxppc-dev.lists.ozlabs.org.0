Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BA457FB70
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 10:35:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrtdk09nhz3cf7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 18:35:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kVqvVrWP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrtd82ZV5z3bXZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 18:34:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kVqvVrWP;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lrtd745lSz4x1b;
	Mon, 25 Jul 2022 18:34:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658738076;
	bh=2SHi/7MiYuZZ+RFbqHJ2P9vUPRO0hmbQRyNXAW/lWsQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kVqvVrWP8qwBu33A7IqhqO9r0BeBrUIlk6CRqjtI1NzrQT+0GTPPk7Bdq87u9NJqY
	 FArZqKHMOpyU3GYM8ewX10ZMmvIyVKbJ/xyf2hDajfnYiyUVhc0NaMppu+e+ci/kUJ
	 rtKFjdstnTcCcAayMQgBQDcOyrpplXodiWwWy1KgMpQYUEsp4TBKeyS15aY1LtyY4x
	 HE1wWO2caXRtArMXVDk/7JkvZBeVdgG/UeOLVVYb8Jt6I3BIy8nCb5GP2sJd/NUPPQ
	 SBVSZUGyKt6w3ZzsEjeIZdKaYvTylulmO38M0K7qnHQOp6LRBmZg6T4zsD7WmcXNmz
	 nGG76IHo7HrJw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, linuxppc-dev@lists.ozlabs.org, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 1/2] powerpc: drop dependency on <asm/machdep.h> in
 archrandom.h
In-Reply-To: <20220723214537.2054208-2-yury.norov@gmail.com>
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-2-yury.norov@gmail.com>
Date: Mon, 25 Jul 2022 18:34:35 +1000
Message-ID: <8735epd204.fsf@mpe.ellerman.id.au>
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
Cc: Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yury Norov <yury.norov@gmail.com> writes:
> archrandom.h includes <asm/machdep.h> to refer ppc_md. This causes
> circular header dependency, if generic nodemask.h  includes random.h:
>
> In file included from include/linux/cred.h:16,
>                  from include/linux/seq_file.h:13,
>                  from arch/powerpc/include/asm/machdep.h:6,
>                  from arch/powerpc/include/asm/archrandom.h:5,
>                  from include/linux/random.h:109,
>                  from include/linux/nodemask.h:97,
>                  from include/linux/list_lru.h:12,
>                  from include/linux/fs.h:13,
>                  from include/linux/compat.h:17,
>                  from arch/powerpc/kernel/asm-offsets.c:12:
> include/linux/sched.h:1203:9: error: unknown type name 'nodemask_t'
>  1203 |         nodemask_t                      mems_allowed;
>       |         ^~~~~~~~~~
>
> Fix it by removing <asm/machdep.h> dependency from archrandom.h
>
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  arch/powerpc/include/asm/archrandom.h |  9 +--------
>  arch/powerpc/kernel/setup-common.c    | 11 +++++++++++
>  2 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
> index 9a53e29680f4..21def59ef1a6 100644
> --- a/arch/powerpc/include/asm/archrandom.h
> +++ b/arch/powerpc/include/asm/archrandom.h
> @@ -4,7 +4,7 @@
>  
>  #ifdef CONFIG_ARCH_RANDOM
>  
> -#include <asm/machdep.h>
> +bool __must_check arch_get_random_seed_long(unsigned long *v);
>  
>  static inline bool __must_check arch_get_random_long(unsigned long *v)
>  {
> @@ -16,13 +16,6 @@ static inline bool __must_check arch_get_random_int(unsigned int *v)
>  	return false;
>  }
>  
> -static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
> -{
> -	if (ppc_md.get_random_seed)
> -		return ppc_md.get_random_seed(v);
> -
> -	return false;
> -}

I'd rather we didn't have to force this out of line.

I think I see a different way to fix it, I'll just do some more build
tests.

cheers
