Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9B45E741E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 08:29:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYj0X6gTQz2yyT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 16:29:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F3LcOqv9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F3LcOqv9;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYhzt2J95z3bkZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 16:28:26 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d11so3481979pll.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 23:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=WXct63XdfXnmhrU6JkhDEgH7DhFZYz4ydjHuX9xt76w=;
        b=F3LcOqv9MMAa1OjNe2c8oDp+Y7yfE7B5udJC69BMUWjQAAxPH0W6qwRzPWU4KYLrkB
         1G+McWJQbCE/1gO7CSTGzHcYbWm7bKGidbgru6oGMiMbI0kyK+cz7gloXQ0zgdqhpkku
         kbxt41lcoXybkDxKlv5Hxq33piDkPM2JqDRIp/P8gfiHnGk3xZZ9YgZhr0svY4rAWSN5
         35VZlD6QGxZraaUcTxXVHXF9BvB0SH5NSQxCaHbDKjpkoe/o7RPkRbN5UjrEea4scfhx
         mT+ExVqffmn3XSA3q+jZrycP/QtSUrdspxx2c+0IlDXO0keq/sNHBVhpCbT/H2Qa5fbV
         79Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=WXct63XdfXnmhrU6JkhDEgH7DhFZYz4ydjHuX9xt76w=;
        b=Qf8x1yKKyBOxVUjRCg82d5t+fXA+MnX7/HB4VLBGJV7jGBGNVvMkkRakwLGUaxOSkC
         Oe0ZEbqzGZQwXhTAXqFq3XPcm7E7sEyJWUa6O0Fet6sQoF5MLWKSURNZ5BpMnRXXAPDA
         MCmDyItfSWm/jN2S98i0FUsDoFZKxvxFu3w6Jw+mV2CFjEuUWHpU3y06i7Hm9MM5mspN
         xRwauaBm0ujS8Iq/0vJPxJfTz+vBNH18621CdE3+kJNEuvN47sSGEYPDYWr/sZIc0Ebw
         b9RZjVmoUM7Lx/ybp1rvyuJG7OLK1NMe1fzyxh4jeuaLZW6829VVIiKzTNf+FxU7XDWs
         5PmQ==
X-Gm-Message-State: ACrzQf1QX75hkjFxC3mWq610g/PR19ymIoPVqXBDqn1tjxVndFm3Pjy9
	GdoTv9o3BwK8chbEZa/U5v4F0a0vxY4=
X-Google-Smtp-Source: AMsMyM6NmmWM06lTwON8IcHn3oajWjJmQOdy64FUh3zkaDiGKiEb/bynUKP2tYjAx1DKku27z7034g==
X-Received: by 2002:a17:90b:4f8d:b0:203:747c:7b7e with SMTP id qe13-20020a17090b4f8d00b00203747c7b7emr7752199pjb.98.1663914503291;
        Thu, 22 Sep 2022 23:28:23 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id i4-20020a626d04000000b0054a1534516dsm5683336pfc.97.2022.09.22.23.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 23:28:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Sep 2022 16:28:16 +1000
Message-Id: <CN3KGNCORWST.2ZBOWWZZMIJ06@bobo>
Subject: Re: [PATCH] powerpc/irq: Refactor irq_soft_mask_{set,or}_return()
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <18473da42362ee8f07bce36b9caef8ba77d7633f.1663656054.git.christophe.leroy@csgroup.eu>
In-Reply-To: <18473da42362ee8f07bce36b9caef8ba77d7633f.1663656054.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Sep 20, 2022 at 4:41 PM AEST, Christophe Leroy wrote:
> This partialy reapply commit ef5b570d3700 ("powerpc/irq: Don't
> open code irq_soft_mask helpers") which was reverted by
> commit 684c68d92e2e ("Revert "powerpc/irq: Don't open code
> irq_soft_mask helpers"")
>
> irq_soft_mask_set_return() and irq_soft_mask_or_return()
> are overset of irq_soft_mask_set().
>
> Have them use irq_soft_mask_set() instead of duplicating it.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/include/asm/hw_irq.h | 26 ++++----------------------
>  1 file changed, 4 insertions(+), 22 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm=
/hw_irq.h
> index 983551859891..e8de249339d8 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -157,36 +157,18 @@ static inline notrace void irq_soft_mask_set(unsign=
ed long mask)
> =20
>  static inline notrace unsigned long irq_soft_mask_set_return(unsigned lo=
ng mask)
>  {
> -	unsigned long flags;
> -
> -#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
> -	WARN_ON(mask && !(mask & IRQS_DISABLED));
> -#endif
> +	unsigned long flags =3D irq_soft_mask_return();
> =20
> -	asm volatile(
> -		"lbz %0,%1(13); stb %2,%1(13)"
> -		: "=3D&r" (flags)
> -		: "i" (offsetof(struct paca_struct, irq_soft_mask)),
> -		  "r" (mask)
> -		: "memory");
> +	irq_soft_mask_set(mask);
> =20
>  	return flags;
>  }
> =20
>  static inline notrace unsigned long irq_soft_mask_or_return(unsigned lon=
g mask)
>  {
> -	unsigned long flags, tmp;
> +	unsigned long flags =3D irq_soft_mask_return();
> =20
> -	asm volatile(
> -		"lbz %0,%2(13); or %1,%0,%3; stb %1,%2(13)"
> -		: "=3D&r" (flags), "=3Dr" (tmp)
> -		: "i" (offsetof(struct paca_struct, irq_soft_mask)),
> -		  "r" (mask)
> -		: "memory");
> -
> -#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
> -	WARN_ON((mask | flags) && !((mask | flags) & IRQS_DISABLED));
> -#endif
> +	irq_soft_mask_set(flags | mask);
> =20
>  	return flags;
>  }
> --=20
> 2.37.1

