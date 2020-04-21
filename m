Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0601B1B16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 03:09:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495lpQ5kYKzDr48
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 11:09:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fnBot7Fc; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495ljD2cjKzDqxh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 11:05:04 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id s3so9604213eji.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 18:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t8z5VWgZjAeVfvVL0BHA/W6t+TdOdX0ymrvMNRwoeHU=;
 b=fnBot7Fca5TUmQ+L/rzFjjgDHgWyUpL6VYXI3UIDIxDcBP3XiNLfj1Nx9+mgYro9E8
 nOzgZqN3ff21PyjfYlwWFvZ/SwF90ECV1p10n/SHiVSwYLkIqkgl3cnWutvLcN0DIVvA
 TO3s9vVb1oQnnCvYdRxldq2yl2Y5BucmZzJpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t8z5VWgZjAeVfvVL0BHA/W6t+TdOdX0ymrvMNRwoeHU=;
 b=QOgYEz5UeYhHA9TrQ+8hQEIoILbWy8s+SCOWmyFBGFfG7nvIS1BFxg/ttnH2I750w1
 XRkFRZB3MvDEEf5KjfoWGKkkeQBIWa7glwo32fSr7OlnGyQfZ9E4BxgmLvEE7Uw89lxp
 uyXXkvM8S5/Lmwm9iApvP0ceubWGGPidL2NwMGHIJNs0DTetVBaJbnZpzaan2pIM2tlK
 PKzwpuIgbGEry8OvjmPZux691C+KjsrnK531tX8dDo1MUPuE8RgENA5K9o0S6FjC6uIu
 Xn+wTbGZQqCSp2NDgd2laIHNQSaga3OP1Uyz9Zd87ySvIkK1j+u693K98BWNTwJ7z9wc
 5kiw==
X-Gm-Message-State: AGi0PubfYP2GmBFdrzq36Azr5KBjKc65tMOevosj4KLaRpH7ysz9K4WC
 ESAPMLIWGUgnC/AsEUKEGF+CMOKNJRW/dqqiLe4ZC9Be
X-Google-Smtp-Source: APiQypJ9RQ8Y7J3lsg/SXPX3NDFzgPc/25FyFFqsjHr5dq96MspGxBWOZgQtwUEIsHMU5TVbe4X9G0cCfOVIHxGNmF0=
X-Received: by 2002:a17:907:2155:: with SMTP id
 rk21mr19400529ejb.163.1587431100366; 
 Mon, 20 Apr 2020 18:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
 <bb0a6081f7b95ee64ca20f92483e5b9661cbacb2.1587407777.git.christophe.leroy@c-s.fr>
In-Reply-To: <bb0a6081f7b95ee64ca20f92483e5b9661cbacb2.1587407777.git.christophe.leroy@c-s.fr>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Apr 2020 01:04:48 +0000
Message-ID: <CACPK8Xf+h378ddF_YakTT++gv_Zx-raBqg54VkKPS3=qe6193Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] powerpc: Remove _ALIGN_UP(),
 _ALIGN_DOWN() and _ALIGN()
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Apr 2020 at 18:39, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>
> These three powerpc macros have been replaced by
> equivalent generic macros and are not used anymore.
>
> Remove them.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-By: Joel Stanley <joel@jms.id.au>

riscv has a copy of these too that could probably be removed:

arch/riscv/include/asm/page.h:#define _ALIGN_UP(addr, size)
(((addr)+((size)-1))&(~((size)-1)))
arch/riscv/include/asm/page.h:#define _ALIGN(addr, size)
_ALIGN_UP(addr, size)



> ---
>  arch/powerpc/include/asm/page.h | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
> index 3ee8df0f66e0..a63fe6f3a0ff 100644
> --- a/arch/powerpc/include/asm/page.h
> +++ b/arch/powerpc/include/asm/page.h
> @@ -249,13 +249,6 @@ static inline bool pfn_valid(unsigned long pfn)
>  #include <asm/page_32.h>
>  #endif
>
> -/* align addr on a size boundary - adjust address up/down if needed */
> -#define _ALIGN_UP(addr, size)   __ALIGN_KERNEL(addr, size)
> -#define _ALIGN_DOWN(addr, size)        ((addr)&(~((typeof(addr))(size)-1)))
> -
> -/* align addr on a size boundary - adjust address up if needed */
> -#define _ALIGN(addr,size)     _ALIGN_UP(addr,size)
> -
>  /*
>   * Don't compare things with KERNELBASE or PAGE_OFFSET to test for
>   * "kernelness", use is_kernel_addr() - it should do what you want.
> --
> 2.25.0
>
