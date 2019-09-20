Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6825B95E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 18:41:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZfcG4ZqFzF3bx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 02:41:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jPvq1xo2"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zf8R4mFbzDqsd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 02:20:36 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id h17so1563455pgb.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 09:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vlNGfK1QkeKihZ4C4Tfs64KHadfyM3q44e2VI4eyD3A=;
 b=jPvq1xo2VKxr3BDR3r7JrBL+WPTyholNKVawQB0EIuY3oOAFbxYM/uA5HMC2fbYkic
 N+WbDQvIvyuzqCIEBZvdePa9S1vqkH6K2m+EW/LDDM5YxksbqG7BltCluuCjXA8C6rA7
 oHUFuiqrNcCKpzeBNyoIFf5CiOpQ7mWVH8K4LjuMdP+70bqDaHmnZ0Meec8zRHOKfRHW
 WkfhMJuUv5shwWw4+4MZYjOsBWWfUVi91S2tVPqfkpzmI25/3+lVsKK8NU8bZ3jTRK1Q
 VmeH6eXJojh3Y3TPr80WtGaHCxT9hYoF2HjqaXLkg8KcbvcmXvsnsKXNp1G8WPXDWFwI
 GALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vlNGfK1QkeKihZ4C4Tfs64KHadfyM3q44e2VI4eyD3A=;
 b=mCOJUW7FFlJv4Y+UGJEB+g6WgpHU+AgdcdM1HF3hwk4eCB738yvAeOH0wLBHnlXWjG
 pRGGBnu5eR7ysBn+NHPSfMkKJvTj1qSFzR7TQZIYC2LumiqZ9Xy1K4+0BJ6k3oLUMJR6
 JImdlJx8MQGVpEN2AfKUCxSFbH/yk927j6IRoeG/ri1rO+eI7JvYdDz6k1U989vCo4Qm
 htxLr24DvrnC40VwHu6JMm/zN5EzZ9q5rn2Cj87eMwyJoiLkg3bu1+bwmbTeKUZYrP0D
 GN3NKCV4iXMFBDjRV5H3DEi5EKf0LkOi4B+aw0HGY8Hbxe2msvVsNwXsWu0nFJR0dVWY
 TKmg==
X-Gm-Message-State: APjAAAVVYcVw41w5kVel/bPIitQ4Hj9vGgJvSJjO3cmIKGQUgXnebXoD
 mQQ/MwA2CVdRFAbsjztFOmKWVHgPWY+YgldQ3xdUmw==
X-Google-Smtp-Source: APXvYqwrqKTqYsi8OR1VdueDkW2Mi43aJ5Pj88pR9RVaDL1ha76c1BEGk/C9C4FKe3KucmQ34BVGRHYWuJyH1TnFXko=
X-Received: by 2002:a17:90a:ff18:: with SMTP id
 ce24mr5537560pjb.123.1568996432715; 
 Fri, 20 Sep 2019 09:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190920153951.25762-1-ilie.halip@gmail.com>
In-Reply-To: <20190920153951.25762-1-ilie.halip@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 20 Sep 2019 09:20:20 -0700
Message-ID: <CAKwvOdkvrRgQ7KtGag0yDH+ry7a6=pd5xudrNm9X+5oVu2Z20A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/pmac/smp: avoid unused-variable warnings
To: Ilie Halip <ilie.halip@gmail.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 20, 2019 at 8:41 AM Ilie Halip <ilie.halip@gmail.com> wrote:
>
> When building with ppc64_defconfig, the compiler reports
> that these 2 variables are not used:
>     warning: unused variable 'core99_l2_cache' [-Wunused-variable]
>     warning: unused variable 'core99_l3_cache' [-Wunused-variable]
>
> They are only used when CONFIG_PPC64 is not defined. Move
> them into a section which does the same macro check.
>
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Ilie Halip <ilie.halip@gmail.com>

Hi Ilie, thanks for the patch.  LGTM (Please include link tags if your
link addresses a bug in our bug tracker; it helps us track where/when
patches land, in case they need to be backported).
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/663

> ---
>  arch/powerpc/platforms/powermac/smp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
> index f95fbdee6efe..e44c606f119e 100644
> --- a/arch/powerpc/platforms/powermac/smp.c
> +++ b/arch/powerpc/platforms/powermac/smp.c
> @@ -648,6 +648,10 @@ static void smp_core99_pfunc_tb_freeze(int freeze)
>
>  static unsigned int core99_tb_gpio;    /* Timebase freeze GPIO */
>
> +/* L2 and L3 cache settings to pass from CPU0 to CPU1 on G4 cpus */
> +volatile static long int core99_l2_cache;
> +volatile static long int core99_l3_cache;
> +
>  static void smp_core99_gpio_tb_freeze(int freeze)
>  {
>         if (freeze)
> @@ -660,10 +664,6 @@ static void smp_core99_gpio_tb_freeze(int freeze)
>
>  #endif /* !CONFIG_PPC64 */
>
> -/* L2 and L3 cache settings to pass from CPU0 to CPU1 on G4 cpus */
> -volatile static long int core99_l2_cache;
> -volatile static long int core99_l3_cache;
> -
>  static void core99_init_caches(int cpu)
>  {
>  #ifndef CONFIG_PPC64
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190920153951.25762-1-ilie.halip%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
