Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCFF29220A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 06:57:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF4J11jPMzDqdv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 15:57:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XQl3RjUC; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CF4GP3HSfzDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 15:56:11 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id a23so6838484qkg.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 21:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+DdX9ApBECm+ZbNtZ5Vnyo8TdWHP3VGSlELnREVWBNY=;
 b=XQl3RjUCuFc72C5e68vkhmCKQQgsZkb9Vh0Thw8hzOZzbVkTFD4oW0HJS4kZ6wZnO5
 h7qwyL+8o43sy9jIkDfnRYdrivkw96E6c/JE7XY/e1BYCz2dIVIdYZHQkRQXmsM5lbNr
 GUEcOVIgdW6FRDAW2PwuDztW/r9zSpXdfmjCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+DdX9ApBECm+ZbNtZ5Vnyo8TdWHP3VGSlELnREVWBNY=;
 b=NM8kZpWQHbegAIXH5nCkXmlZsJGkOvtl8qiGKNjNzFOR1UREFktRXmmcXx1AyvT1Jf
 jmrpr3c50ONQK7ZLS8sWRHNfrHF2ZpiZ+cooI0JIllBuy2G0mvJnVm0PnlqIo8i5EZ0t
 OHPuE/SHIKIikfIETc7JsOIOpomm2jehlks6iJQRcmJYBY0mbGWQ4ctG6StfWM97lOfX
 QxMq9mzNP33GFHUACOK9lFCpGrV0YwqLZI3XkLkWg1hvgY0/sO4JlfrCxFfbYk0JYL01
 87871X2g4JB8z2kvSTCBQM02Of+3MwDlIBgLWkYO8RTs4ZTAB88LCj/W1fdrl+9Sc0yN
 92ag==
X-Gm-Message-State: AOAM530yLtAvQI7QitgAY/e9V3g6jwLEiYcp2KnVpKKTc+YpkelHakAD
 BUtv5/gU/Sb/csAzZ6RB5gqez4cnE7NzzKPmwRQ=
X-Google-Smtp-Source: ABdhPJyar9udlZPgCCqFMvDSZwmLzCPi0LxWbnXc6wqf6/x0UQyWB6Sox4JOJ3/KAzY0OBVi6VParLwqDvMXazd9S60=
X-Received: by 2002:a37:48cc:: with SMTP id v195mr15006360qka.66.1603083367899; 
 Sun, 18 Oct 2020 21:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <96c6172d619c51acc5c1c4884b80785c59af4102.1602949927.git.christophe.leroy@csgroup.eu>
In-Reply-To: <96c6172d619c51acc5c1c4884b80785c59af4102.1602949927.git.christophe.leroy@csgroup.eu>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Oct 2020 04:55:55 +0000
Message-ID: <CACPK8XfgK0Bj3sLjKCi80jS6vK34FN5BTkU8FvBGcMR=RQn4Xw@mail.gmail.com>
Subject: Re: [PATCH] asm-generic: Force inlining of get_order() to work around
 gcc10 poor decision
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 17 Oct 2020 at 15:55, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> When building mpc885_ads_defconfig with gcc 10.1,
> the function get_order() appears 50 times in vmlinux:
>
> [linux]# ppc-linux-objdump -x vmlinux | grep get_order | wc -l
> 50
>
> [linux]# size vmlinux
>    text    data     bss     dec     hex filename
> 3842620  675624  135160 4653404  47015c vmlinux
>
> In the old days, marking a function 'static inline' was forcing
> GCC to inline, but since commit ac7c3e4ff401 ("compiler: enable
> CONFIG_OPTIMIZE_INLINING forcibly") GCC may decide to not inline
> a function.
>
> It looks like GCC 10 is taking poor decisions on this.
>
> get_order() compiles into the following tiny function,
> occupying 20 bytes of text.
>
> 0000007c <get_order>:
>   7c:   38 63 ff ff     addi    r3,r3,-1
>   80:   54 63 a3 3e     rlwinm  r3,r3,20,12,31
>   84:   7c 63 00 34     cntlzw  r3,r3
>   88:   20 63 00 20     subfic  r3,r3,32
>   8c:   4e 80 00 20     blr
>
> By forcing get_order() to be __always_inline, the size of text is
> reduced by 1940 bytes, that is almost twice the space occupied by
> 50 times get_order()
>
> [linux-powerpc]# size vmlinux
>    text    data     bss     dec     hex filename
> 3840680  675588  135176 4651444  46f9b4 vmlinux

I see similar results with GCC 10.2 building for arm32. There are 143
instances of get_order with aspeed_g5_defconfig.

Before:
 9071838 2630138  186468 11888444         b5673c vmlinux
After:
 9069886 2630126  186468 11886480         b55f90 vmlinux

1952 bytes smaller with your patch applied. Did you raise this with
anyone from GCC?

Reviewed-by: Joel Stanley <joel@jms.id.au>



> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/asm-generic/getorder.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/asm-generic/getorder.h b/include/asm-generic/getorder.h
> index e9f20b813a69..f2979e3a96b6 100644
> --- a/include/asm-generic/getorder.h
> +++ b/include/asm-generic/getorder.h
> @@ -26,7 +26,7 @@
>   *
>   * The result is undefined if the size is 0.
>   */
> -static inline __attribute_const__ int get_order(unsigned long size)
> +static __always_inline __attribute_const__ int get_order(unsigned long size)
>  {
>         if (__builtin_constant_p(size)) {
>                 if (!size)
> --
> 2.25.0
>
