Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E2422AE04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 13:43:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC9T273MXzDrN2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 21:43:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=WXaqbpyD; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC9PR0pSlzDrN4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 21:40:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kdvkLlB0WIqKZ1XY1QVM6XMLE4+I3RIvWx6RmMkENUQ=; b=WXaqbpyDkFyXzYWsaKmxUO6XOJ
 NHsi5kiF8SRTNR0efEuOMP5FTHTzkRIaNCVFEdC5pHGcz/+eMpoPOelGZxPcLn0+/n3RGFhPV/HrR
 YTFn/Bcrr9RL4JHs0NpbYeXnb+iYXKEEXzWvkTHy3eo3Wm1hYnCDil4KbawSbsyUH7BuvckQ9wQOl
 JSZcc0IE8OqaY3/6zoC8D8rSkfQSpObAfunyAuqz8Ee5zQrEnks0ZVf8k5oHHgWkNt2Zqjias8Kci
 5yzCJpOVEsqPUYYaaXTvQIU99DSjitCb13t7fPHUI6CwDAFcq8M7sdabKU1Fr63w/nwpKj/sPvYUM
 in7glj0A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyZa8-0005JF-MA; Thu, 23 Jul 2020 11:40:12 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 988F49821EE; Thu, 23 Jul 2020 13:40:10 +0200 (CEST)
Date: Thu, 23 Jul 2020 13:40:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] lockdep: improve current->(hard|soft)irqs_enabled
 synchronisation with actual irq state
Message-ID: <20200723114010.GO5523@worktop.programming.kicks-ass.net>
References: <20200723105615.1268126-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723105615.1268126-1-npiggin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 23, 2020 at 08:56:14PM +1000, Nicholas Piggin wrote:

> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index 3a0db7b0b46e..35060be09073 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -200,17 +200,14 @@ static inline bool arch_irqs_disabled(void)
>  #define powerpc_local_irq_pmu_save(flags)			\
>  	 do {							\
>  		raw_local_irq_pmu_save(flags);			\
> -		trace_hardirqs_off();				\
> +		if (!raw_irqs_disabled_flags(flags))		\
> +			trace_hardirqs_off();			\
>  	} while(0)
>  #define powerpc_local_irq_pmu_restore(flags)			\
>  	do {							\
> -		if (raw_irqs_disabled_flags(flags)) {		\
> -			raw_local_irq_pmu_restore(flags);	\
> -			trace_hardirqs_off();			\
> -		} else {					\
> +		if (!raw_irqs_disabled_flags(flags))		\
>  			trace_hardirqs_on();			\
> -			raw_local_irq_pmu_restore(flags);	\
> -		}						\
> +		raw_local_irq_pmu_restore(flags);		\
>  	} while(0)

You shouldn't be calling lockdep from NMI context! That is, I recently
added suport for that on x86:

  https://lkml.kernel.org/r/20200623083721.155449112@infradead.org
  https://lkml.kernel.org/r/20200623083721.216740948@infradead.org

But you need to be very careful on how you order things, as you can see
the above relies on preempt_count() already having been incremented with
NMI_MASK.
