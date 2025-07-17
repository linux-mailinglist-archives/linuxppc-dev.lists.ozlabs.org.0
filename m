Return-Path: <linuxppc-dev+bounces-10309-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A49B096D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 00:11:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjnDt2Yxzz2xTh;
	Fri, 18 Jul 2025 08:10:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752790254;
	cv=none; b=K90Y5Ve+RcW+hpYUssOtHnqvF29WgwCTIfOpuby70hddxQlrAxzFa9qxcSEpIbgyfExU5gR+V3JLSX5FL1S61vl8qkIDa3SICAQc4VDAK+5gRv2mwoFefQDpi/MuI/mblzmdJak2fDWxf6iO8SNagPT6HlufjDz9xemT/Kfphu/9TDi/BHw2CcYU6ByIMq2ZlmGzNl6Sk4Yye/qzMgjaPFJ3Ulr2JbdTFr3fgEBrKLnwe5tBeufKX9QLxIHYr5GJa0cwrUgk/VvweamJvERFfNt2RJoq5a+6jBetgAhZXS6Ec0MHyD7gkUf7kM/g9KqGwBPUI1YFji8zL+ElkJDBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752790254; c=relaxed/relaxed;
	bh=LZCCFSUO+wfzHPsPwgejKoRmReB7/qEwEHJdDzPicLw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ESN4fABtCXC1t639+ZgRIwv+ZgJG6NZ+DW3V8wM+AbD0DP5UGMqTKuZfI8XYpnCTXrKGJxGB7nk7wMJoTOqxOcUt2cLpSm72haLvCuiyqtgQJSCZzWHAm4z+Aczo6Z6fJPzCTjEg1t8gDFaR9amf+4ELv+p6GA+eqbaYTukrvG3In7JLZrT+DPkyXHvZ6Otr3pKf4gQD69b1D1kpD7dnHJXzoTAXW+h5OMfDL6qw2XlHbD0f2sI8XXhMvQ+YnB3b7zG7GRFqNJbFp50FD5UD7f7R4t6DCldkopu8TAt9k2sMYSUcNu6oBHLZyc+JGJeDTiOAkSErhXFtL+t0r0pN2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=JnFTsEv6; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=JnFTsEv6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjnDr2Hrpz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 08:10:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C44A43447;
	Thu, 17 Jul 2025 22:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A609C4CEE3;
	Thu, 17 Jul 2025 22:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1752790249;
	bh=vZ0u5fd3DfJ6yBk3+g+sfM/GC0NNG81eBl17aO+ZI9c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JnFTsEv6asV1QHvn9oyLm0adlVD8YAwUk8D9+xSBsZ/4xRhcX7l4l0qMZNDgSRPEr
	 VDRVgiNcFppstl5irHVMQqIlu2EyZC6EiTz9tDOSSNke5t727uDO0ipCsMi5ieUTgf
	 xIAtuMC6pkfxnueF+6ZvQa0PYivWUcYkQ1GV4da4=
Date: Thu, 17 Jul 2025 15:10:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, ryabinin.a.a@gmail.com, glider@google.com,
 dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v3 01/12] lib/kasan: introduce CONFIG_ARCH_DEFER_KASAN
 option
Message-Id: <20250717151048.bb6124bea54a31cd2b41faaf@linux-foundation.org>
In-Reply-To: <20250717142732.292822-2-snovitoll@gmail.com>
References: <20250717142732.292822-1-snovitoll@gmail.com>
	<20250717142732.292822-2-snovitoll@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 17 Jul 2025 19:27:21 +0500 Sabyrzhan Tasbolatov <snovitoll@gmail.com> wrote:

> Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
> to defer KASAN initialization until shadow memory is properly set up.
> 
> Some architectures (like PowerPC with radix MMU) need to set up their
> shadow memory mappings before KASAN can be safely enabled, while others
> (like s390, x86, arm) can enable KASAN much earlier or even from the
> beginning.
> 
> This option allows us to:
> 1. Use static keys only where needed (avoiding overhead)
> 2. Use compile-time constants for arch that don't need runtime checks
> 3. Maintain optimal performance for both scenarios
> 
> Architectures that need deferred KASAN should select this option.
> Architectures that can enable KASAN early will get compile-time
> optimizations instead of runtime checks.

Looks nice and appears quite mature.  I'm reluctant to add it to mm.git
during -rc6, especially given the lack of formal review and ack tags.

But but but, that's what the mm-new branch is for.  I guess I'll add it
to get some additional exposure, but whether I'll advance it into
mm-unstable/linux-next for this cycle is unclear.

What do you (and others) think?

