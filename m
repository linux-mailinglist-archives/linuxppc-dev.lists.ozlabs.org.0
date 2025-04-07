Return-Path: <linuxppc-dev+bounces-7481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD06A7D728
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 10:06:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWMH36l09z2yRx;
	Mon,  7 Apr 2025 18:06:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744013183;
	cv=none; b=Cwzf4j1/kYxU9irqx3L/ccemVUCYFKHb77tm6A1+sZQRr53thbyaOdHC72F/QglmItEKw5jZhcHF8dIrDdg7qGVLUyEqpqgaEoogmuaNiz+qdfBMsQD3iCHRbYHdTq/t5WjagzN95ydfgfYooZoiTLltvT3J2c/UjUnsh1AjPh4veR7JW67rszlPE2c3AR8+76V+DOgaxgaj+0Y8lf7dLLuEdtq1CDF5y6dBJmFDVU08MyTUNNhge0fR22lKeEB9P9TWeLJxYpHzOV93/u+6fiYqncZcL8Yd47Cw8/mC6AaI0NRsnvzrtK0F3m0Y3Bf1vVZtG4qxzYKnl4Jk57XayA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744013183; c=relaxed/relaxed;
	bh=em0yD0kIpDtyZFKdGXKgNdHuMfrDjAXLZIWfYU3VNv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZXhiVda/0azS5zIJT565uPNr9Ii2VVlzqDzxGeSt4qVsJqgXVRBei7I5Ee7D93Mob+O3GOgeat1q3B1AVYj04HY7ymjFybJAMxlkMlXYHk+Qm2dhPI/6wZ/ux5Ki59SN003OtjZusFjrCGSTPzzdNB7L3ASIKaLG0Vq6Ha9EQqNEpR5iaKzgcO7JMGdNw8VAqCohxZeTABCyXJhw1GbS3vSlgDMxI9BBVZ8eS6R4+TqpoTGGy9KAgK9Yjkni89dVKC9HGvUGFaSxPKZzq5Dl1ySn2Aeoaf2fcl9Ih6P6u9kdjAMFHOh4l4PfGsYm6uGBRen4onO0XU6rKL2RK2fmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.169; helo=mail-vk1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.169; helo=mail-vk1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWMH21rK6z2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 18:06:21 +1000 (AEST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51eb1823a8eso2185865e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Apr 2025 01:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013177; x=1744617977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=em0yD0kIpDtyZFKdGXKgNdHuMfrDjAXLZIWfYU3VNv0=;
        b=Thq7nCrq2TfcivqphPKfyTVBEYvDKQayj2JVUq7Fu2vyp9ck5zy+xDAY6SNeMHus9k
         NsUvEgZkY0kvB8N3tF9VyulUE9GhlgJAWSPnyWUsCeLNSf5bM6W5+9QsRFQmnpHKFfwR
         RJtSwzuKFVbDn9+sU1sz0/bycv57GUSQwghiUmGq752DaCqC4ECJHYl4nk8B2iXEpDgN
         nlk52YGuuR/r5x2qBOomycVwnlVfsgjC1wpGmscX8gfUDHEbegPPnVX498wPkPQlurp0
         X0u7zYNZ8KeGRTmvgoVtRUcEzfH3WYOfbAypU/ySKxZJDvcyM0mPYgSmPoOfvcnAsjnW
         0BIA==
X-Forwarded-Encrypted: i=1; AJvYcCV+XLpGUG9lT+LleecqV8ZIGeS5la38q1xsy5CHo1HUra91XsPG9A70eT7q/byCUd7qt4oNeY+AT/EDxUo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyfzpv6aDmMhrKSDPNsxKHwiUIouDLnqbElltZXPhlWLcNzxvqg
	n8SNZGPRrM8Xk4cDN0RHEPS2iO6CRj4HP6+q1FIt8ZKpk9H2DK3d5MH4vLoc
X-Gm-Gg: ASbGncsC5ZH/QOJE6u4CD4oMWIB5Gvvrn1kDF5smEGnnrNAEypX5lplRNh9xiwT2tJQ
	f5EiV6hef58kb0SYOL0DiPtph2H2MB4rDRzErrfGHNqBZ5VLMI7hB1fxjqCQ9HaeF6BO68Gpcfj
	o+ZtHwWUVQdVF40pSGInHujUz8Flcq91UTBKYBafLR7+hZejWh4++y4f1c5kpMU5UfiA+P3RVSB
	MtQQzat9w58aWGTglH9inelvfa62K5AH+FSWA0+na7AWFBKyUt9qjNe21ePeJ3RDWicu0n8Mbt1
	avSFAXlai1GBV7HCjAd81dGQqwkJo2E8fz5AMhnJaCYzoUnAAe2I6YFP5MaDQ3u0OsL0oRtlxlP
	cHecu90A3frA=
X-Google-Smtp-Source: AGHT+IEOVRGr2G+0ZHNJezneEJk4HOj1ihHtx9+1wi7BgGoelXI0QYnk3BNp/2ai1xieV21x3kjWpQ==
X-Received: by 2002:a05:6122:4f91:b0:527:67da:74ee with SMTP id 71dfb90a1353d-52767da815amr7430266e0c.5.1744013177027;
        Mon, 07 Apr 2025 01:06:17 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5275af7a043sm1762643e0c.29.2025.04.07.01.06.16
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 01:06:16 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52617ceae0dso1255836e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Apr 2025 01:06:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFysaJK0jsVsZNY1sI6ZKdm6tW/b7R2SrZwM0mxeidZOrZ81nFFiySncFWJ4aMSZ099vw84ws9rvJ/F6o=@lists.ozlabs.org
X-Received: by 2002:a05:6102:1622:b0:4c3:221:8f47 with SMTP id
 ada2fe7eead31-4c8553d0fafmr8533368137.13.1744013176401; Mon, 07 Apr 2025
 01:06:16 -0700 (PDT)
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
References: <20250218175735.19882-1-linmag7@gmail.com> <20250218175735.19882-2-linmag7@gmail.com>
 <4209b9816551367f8e5670cc5a08e139f0f2c215.camel@physik.fu-berlin.de>
In-Reply-To: <4209b9816551367f8e5670cc5a08e139f0f2c215.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Apr 2025 10:06:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLVw8aUY8aCowgOz+puxjrDqcbUXUAoVXGi8=FpTHwrA@mail.gmail.com>
X-Gm-Features: ATxdqUEtUaFZruSQ19joR0gbmVyVokHgxasQdxoPHK2-UPmtdbKL5noyYxpgMcc
Message-ID: <CAMuHMdWLVw8aUY8aCowgOz+puxjrDqcbUXUAoVXGi8=FpTHwrA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Magnus Lindholm <linmag7@gmail.com>, richard.henderson@linaro.org, mattst88@gmail.com, 
	ink@unseen.parts, kees@kernel.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, chris@zankel.net, 
	dinguyen@kernel.org, jcmvbkbc@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	loongarch@lists.linux.dev, monstr@monstr.eu, sparclinux@vger.kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Adrian,

On Sat, 5 Apr 2025 at 19:22, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Tue, 2025-02-18 at 18:55 +0100, Magnus Lindholm wrote:
> > Make pte_swp_exclusive return bool instead of int. This will better reflect
> > how pte_swp_exclusive is actually used in the code. This fixes swap/swapoff
> > problems on Alpha due pte_swp_exclusive not returning correct values when
> > _PAGE_SWP_EXCLUSIVE bit resides in upper 32-bits of PTE (like on alpha).
>
> Minor nitpick:
>
> "when _PAGE_SWP_EXCLUSIVE" => "when the _PAGE_SWP_EXCLUSIVE"
>
> >
> > Signed-off-by: Magnus Lindholm <linmag7@gmail.com>

> > --- a/arch/alpha/include/asm/pgtable.h
> > +++ b/arch/alpha/include/asm/pgtable.h
> > @@ -334,7 +334,7 @@ extern inline pte_t mk_swap_pte(unsigned long type, unsigned long offset)
> >  #define __pte_to_swp_entry(pte)      ((swp_entry_t) { pte_val(pte) })
> >  #define __swp_entry_to_pte(x)        ((pte_t) { (x).val })
> >
> > -static inline int pte_swp_exclusive(pte_t pte)
> > +static inline bool pte_swp_exclusive(pte_t pte)
> >  {
> >       return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
> >  }

> > --- a/arch/xtensa/include/asm/pgtable.h
> > +++ b/arch/xtensa/include/asm/pgtable.h
> > @@ -355,7 +355,7 @@ ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
> >  #define __pte_to_swp_entry(pte)      ((swp_entry_t) { pte_val(pte) })
> >  #define __swp_entry_to_pte(x)        ((pte_t) { (x).val })
> >
> > -static inline int pte_swp_exclusive(pte_t pte)
> > +static inline bool pte_swp_exclusive(pte_t pte)
> >  {
> >       return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
> >  }
>
> I'm not so sure about this implicit cast from unsigned long to bool though.
>
> Is this verified to work correctly on all architectures? I wonder why this

Should work fine: any non-zero value is mapped to one.

> bug was not caught earlier on alpha on the other hand.

On Alpha, "pte_val(pte) & _PAGE_SWP_EXCLUSIVE" is either
_PAGE_SWP_EXCLUSIVE == 0x8000000000UL or zero.  Due to the return
type being int, the return value was truncated, and the function always
returned zero.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

