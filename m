Return-Path: <linuxppc-dev+bounces-2979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CAD9C03FB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 12:29:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkfxB2Whtz3blk;
	Thu,  7 Nov 2024 22:29:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730978974;
	cv=none; b=eyA/p81C4OffgkLz2nZObJ1ywQO+z5LJyzYCylr9dtJ+cfkXsKrjF1njvVB0nJW1Y3GJJFxwkvJ7tmMQClcB1ytrqrA7Xurrf48VyIkXcR0DViVNL/d9pYg2NfGRxieERCuW1evzsXcwBm0b53PG2nQdQ2aWEyrQuAAHnKM0bq0XZpwpDti/xIMA1MNePWpXwFF86lByvlFOGW2h4Vtld8Y2YPzFdTjB3Tce24v/+vdJRPnsg751pfBz0DKMKm+a+wlKL7/ts+wP1Kgmt1cyf7bredcJKmg4BZBDObAB0VkIY2YZtf57t8XT9oo5+xNCKkoFkxcOxlhaq3lnRrtT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730978974; c=relaxed/relaxed;
	bh=nrjbtAPdhIcAlgAV7NujXI6QsiUwiA3bnjCu+yPjnXY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FVSFmSF0RIk/Ai0SqW9tXO7lETDhm671KvpFLw5ve9fokQ2zo+ElSmdKNDfvizhKjfA8hZD/hDL+PBItRwUn9DUhvi3rQw+Ff0OjDPnBlLNkAbL8aNmtfcyD/x6GNxOx9U3nEtYY9o9D1oqlQ9lsWBxagu6lmmfLkhf1r+J0+phd1GzSxz7/HzsB5X47gAEEtta7tDpTIysCVyknCJ73Nx+gqgJEcKb+HW5ejNjLuVzIoNTqW7ndfWQ0Is0aOdNI4Q8NSMKq+3vM0OrZP3TBWLryH+aOvUorqhcqm3DRMjxYowl3Rl2DanQaEneMZkWPqO9kA1O2XYn5QzwyCNX/Ug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lIEIxhXW; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lIEIxhXW;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xkfx93VZ8z2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 22:29:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730978971;
	bh=nrjbtAPdhIcAlgAV7NujXI6QsiUwiA3bnjCu+yPjnXY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lIEIxhXWsTbljLBFi7X0QovZJjQVTZ26Df6phbYHs3YG380sHO08erH3WYcn4Mw9V
	 2MGy44pxqPNu61obgb+FVTsxZ0bTMPgE7OlLcj8b5d69BzS2N37o+euibIQyxSlFC4
	 +wtVWFN0o8hqkyuf6dtRIPl6bnerOS0WGJeknORV+r5x0dsJ6iHmgXXO/77etoOeDu
	 nspWpHHIgQx/CXiKiwWHeZDYTU7jIcLF5m9ALYokd3n/U5LUVsS5OtjPLx/SkQ/RKK
	 2yHARHBPE3OkbFtPRnUrmMwI+kZtSdlFgc0jXWDDqshkRHLD/sm73EiJKb+1rAAQBm
	 rnhVtwfjOZpPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xkfx66dngz4wcj;
	Thu,  7 Nov 2024 22:29:30 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yang Li <yang.lee@linux.alibaba.com>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Yang Li
 <yang.lee@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] powerpc/machdep: Remove duplicated include in svm.c
In-Reply-To: <20241107010259.46308-1-yang.lee@linux.alibaba.com>
References: <20241107010259.46308-1-yang.lee@linux.alibaba.com>
Date: Thu, 07 Nov 2024 22:29:32 +1100
Message-ID: <87msibcmeb.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Yang Li <yang.lee@linux.alibaba.com> writes:
> The header files linux/mem_encrypt.h is included twice in svm.c,
> so one inclusion of each can be removed.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11750
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  arch/powerpc/platforms/pseries/svm.c | 1 -
>  1 file changed, 1 deletion(-)

The two includes only appear in linux-next, and they both come from
different trees. They are required in each tree to avoid breaking the
build.

So no one can merge this patch until the two trees are merged into mainline.

cheers

> diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
> index c5d0f92c7969..384c9dc1899a 100644
> --- a/arch/powerpc/platforms/pseries/svm.c
> +++ b/arch/powerpc/platforms/pseries/svm.c
> @@ -10,7 +10,6 @@
>  #include <linux/memblock.h>
>  #include <linux/mem_encrypt.h>
>  #include <linux/cc_platform.h>
> -#include <linux/mem_encrypt.h>
>  #include <asm/machdep.h>
>  #include <asm/svm.h>
>  #include <asm/swiotlb.h>
> -- 
> 2.32.0.3.g01195cf9f

