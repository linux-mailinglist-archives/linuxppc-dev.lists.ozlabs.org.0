Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 930055E748F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:08:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYjtZ3kycz3cfH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:08:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kRbvrL9A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kRbvrL9A;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYjsz48Dtz30D1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 17:08:22 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id iw17so11017138plb.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 00:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=LZZ+DFcc0llvJVRrXIipCqbT3nWDNjH2GYv6SFsu7to=;
        b=kRbvrL9AJnktY9aS5QS918bp2JUVCwAi+7X6OH2jM2hXMFmXBIPyKV+WqClPPxqFUD
         6leBHKdZxnDRq6Hjx3gwIv5bRruNBEmkbiekRtwEHod8Ri21iYQcBePcWaLI223L5RQl
         xT4ARIiRWLq4pHZdFf2Q8Nx6E+wf9HQcCE1j2szYrHoxbNxKnVpFEybfkrnL6G1wq3EA
         wLXI57uLu7uTE3M+FxJs2nviFYHymI8wP//GiSOuiLN9fwvbwDvf4sRqv7LTpPswtMUV
         mDUr+IKEq+Hfpt00BsvQw3D/ScocwtLjZIg6YWYCF7y5+eoVnr1Msww8SBc+Xp35Inlh
         P7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=LZZ+DFcc0llvJVRrXIipCqbT3nWDNjH2GYv6SFsu7to=;
        b=wNrTtxAkskPaUPJlhKdwHK4wjbV77kTOntKNqBXDd7M86OPzyljxgPzHWnWlagqsMQ
         Y6T7iQO6JWg0c4FSgOnTVXoE/cNF9iqF+deVn0AIftXf/Wpyw5KVReQFA+UgluFm+63c
         xJE7BQfUHO0u6kSQwombIXF9ciYehE+HHQe6as9RziZVaT1j5cwGnTmhBUJgQYpkqQdP
         glaHAp3FgIgJuvuOYieBTQkkP3d552/shN4qX0UfjLbJwrx+1uyDX+3a+sfoEiJ2UduX
         cNZiDGlpMBc9dAEzs41/KpIvCAMuSlvpULu/6KJcUHaLkN2e050TwvIzgRXiYhazGbHC
         VSAA==
X-Gm-Message-State: ACrzQf0gd2+gETAGhO3/8jsJzZkNchGrBs6ox+zfDzsh5RzpA1Oku36r
	3IwEYT9gWSpAj2F7+u/zAJr4P/TVRLQ=
X-Google-Smtp-Source: AMsMyM7Zdp3FkT+V1HHoTww6RvyocVYeqOaa3XmpVCunWZBszIAGwRYpHQ+DEwfFK/GzwcrJxgyG8g==
X-Received: by 2002:a17:90b:4a82:b0:200:a89e:6f1f with SMTP id lp2-20020a17090b4a8200b00200a89e6f1fmr19165256pjb.13.1663916899651;
        Fri, 23 Sep 2022 00:08:19 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id k7-20020a170902ce0700b0016c574aa0fdsm5262530plg.76.2022.09.23.00.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 00:08:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Sep 2022 17:08:13 +1000
Message-Id: <CN3LB8F3D9LM.3W1RQRVS64UXU@bobo>
Subject: Re: [PATCH] powerpc/irq: Modernise inline assembly in
 irq_soft_mask_{set,return}
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <178f30ff62c0317061f019b3dbbc079073f104c3.1663656058.git.christophe.leroy@csgroup.eu>
In-Reply-To: <178f30ff62c0317061f019b3dbbc079073f104c3.1663656058.git.christophe.leroy@csgroup.eu>
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
> local_paca is declared as global register asm("r13"), it is therefore
> garantied to always ever be r13.
>
> It is therefore not required to opencode r13 in the assembly, use
> a reference to local_paca->irq_soft_mask instead.
>
> This also allows removing the 'memory' clobber in irq_soft_mask_set()
> as GCC now knows what is being modified in memory.

The code matches the changelog AFAIKS. But I don't know where it is
guaranteed it will always be r13 in GCC and Clang. I still don't know
where in the specification or documentation suggests this.

There was some assertion it would always be r13, but that can't be a
*general* rule. e.g., the following code:

struct foo {
#ifdef BIGDISP
        int array[1024*1024];
#endif
        char bar;
};

register struct foo *foo asm("r13");

static void setval(char val)
{
        asm("stb%X0 %1,%0" : "=3Dm" (foo->bar) : "r" (val));
}

int main(void)
{
        setval(10);
}

With -O0 this generates stb 9,0(10) for me for GCC 12, and with -O2
-DBIGDISP it generates stb 10,0(9). So that makes me nervious. GCC
does not have some kind of correctness guarantee here, so it must not
have this in its regression tests etc., and who knows about clang.

If it is true for some particular subset of cases that we can guarantee,
e.g., using -O2 and irq_soft_mask offset within range of stb offset and
we can point to specification such that both GCC and Clang will follow
it, then okay. Otherwise I still think it's more trouble than it is
worth.

Thanks,
Nick

>
> Using %X modifier will give GCC a bit more flexibility on the code
> generation.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/hw_irq.h | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm=
/hw_irq.h
> index e8de249339d8..dbe037ff4474 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -115,10 +115,7 @@ static inline notrace unsigned long irq_soft_mask_re=
turn(void)
>  {
>  	unsigned long flags;
> =20
> -	asm volatile(
> -		"lbz %0,%1(13)"
> -		: "=3Dr" (flags)
> -		: "i" (offsetof(struct paca_struct, irq_soft_mask)));
> +	asm volatile("lbz%X1 %0,%1" : "=3Dr" (flags) : "m" (local_paca->irq_sof=
t_mask));
> =20
>  	return flags;
>  }
> @@ -147,12 +144,7 @@ static inline notrace void irq_soft_mask_set(unsigne=
d long mask)
>  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>  		WARN_ON(mask && !(mask & IRQS_DISABLED));
> =20
> -	asm volatile(
> -		"stb %0,%1(13)"
> -		:
> -		: "r" (mask),
> -		  "i" (offsetof(struct paca_struct, irq_soft_mask))
> -		: "memory");
> +	asm volatile("stb%X0 %1,%0" : "=3Dm" (local_paca->irq_soft_mask) : "r" =
(mask));
>  }
> =20
>  static inline notrace unsigned long irq_soft_mask_set_return(unsigned lo=
ng mask)
> --=20
> 2.37.1

