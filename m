Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD1533E2EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 01:39:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0WWR4F09z3bqZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 11:39:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZtJl6hJw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZtJl6hJw; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0WW21lP1z2yTR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 11:39:09 +1100 (AEDT)
Received: by mail-yb1-xb2b.google.com with SMTP id h82so38701151ybc.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 17:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cCf7YAvg8CbAb0kGvSAIoa73YH0cg5JO3qCA6DT63So=;
 b=ZtJl6hJwfOJLoffhjoioHCKSkxqdJtpIeo5FFBNVLakVMiovZ9MhX422dOpysdVWjp
 2cYFuLBDySbEDUQSdm623MtHD3kjP/B4X9dRFOoTBt5JP2i9OqW3haU63CyyizMXM4nI
 e2NmM9K8C4DLfBY45EJnjAU6kvuSzfmR1mgzsxDcZ1/5Py5veRprqhri32gU8/xiaxsC
 1XXyZIQrncfU7fv0+KYUHqBfQX3nVRFL3r1jEwjSNFJ3XuIqf5tQ9ixFyddUcSf8JWfc
 Ee2KIStLOJaO+K8kKtjWV5MEy3gHaEoFmJ4DKwz0RLVWGMwa8cS2Un+8HmeyjzU4B6/x
 PE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cCf7YAvg8CbAb0kGvSAIoa73YH0cg5JO3qCA6DT63So=;
 b=d6e4zi5zTqNJj+uvyPZ7tyHACjRVRgy8zO5Ylxf5Tl6+e4BPRE1KGj7gAQQ5a/Asfy
 NYm+ttvq3OLE+AeCRjLBpISCtWBtmGqRMDQ+bRb+DKe4QPVElEfak0sfE3oP51j4ETHn
 Y4NsEXl686oil3eXyaauCAJrOP/eJlqh/xHS7KvPY3anplBJwQT9sl+39a8Qx0Mg5URC
 ce18P+qOJqfn7e/ErksKXbs+a55DfrOnEOGQgEPnC45vMs3q2IsuzAQACt2IdsiDdPMy
 ov5yM59DzINvXYYCbPB2Y7QYCrRyPb0QW+oiWWqkrXwxgx7p2vPROWJzZbqkEK9KmhbT
 ASgQ==
X-Gm-Message-State: AOAM531tJQtBNXc/X2j/VI2Ze8eeBAxHIagcqyluGEvv4B8Jio4JE/s5
 uIEeAuLU/IYGlKWS48T9qvw1Gp7B6OZWFlklyu8=
X-Google-Smtp-Source: ABdhPJzYM2voXE+0WxFgAAkpWEd8BNf6vgbaLx3oDSjk8sUBt0eNk1sH5bNQKqBknI+gR5P3dTjp1vOegfzLWM/1ouo=
X-Received: by 2002:a5b:147:: with SMTP id c7mr1900782ybp.332.1615941545596;
 Tue, 16 Mar 2021 17:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210316031741.1004850-1-jniethe5@gmail.com>
 <20210316031741.1004850-2-jniethe5@gmail.com>
 <bd0e37b6-22cb-6dbc-1ef8-b6eac4b4c6e6@csgroup.eu>
In-Reply-To: <bd0e37b6-22cb-6dbc-1ef8-b6eac4b4c6e6@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 17 Mar 2021 11:38:53 +1100
Message-ID: <CACzsE9rbgjNtLOjCHL9+LN6_Xoo6mJ_D5pewuMg7ktqA_OnR0w@mail.gmail.com>
Subject: Re: [PATCH v9 2/8] powerpc/lib/code-patching: Set up Strict RWX
 patching earlier
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, ajd@linux.ibm.com,
 Nicholas Piggin <npiggin@gmail.com>, naveen.n.rao@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 16, 2021 at 5:32 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 16/03/2021 =C3=A0 04:17, Jordan Niethe a =C3=A9crit :
> > setup_text_poke_area() is a late init call so it runs before
> > mark_rodata_ro() and after the init calls. This lets all the init code
> > patching simply write to their locations. In the future, kprobes is
> > going to allocate its instruction pages RO which means they will need
> > setup_text__poke_area() to have been already called for their code
> > patching. However, init_kprobes() (which allocates and patches some
> > instruction pages) is an early init call so it happens before
> > setup_text__poke_area().
> >
> > start_kernel() calls poking_init() before any of the init calls. On
> > powerpc, poking_init() is currently a nop. setup_text_poke_area() relie=
s
> > on kernel virtual memory, cpu hotplug and per_cpu_areas being setup.
> > setup_per_cpu_areas(), boot_cpu_hotplug_init() and mm_init() are called
> > before poking_init().
> >
> > Turn setup_text_poke_area() into poking_init().
> >
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v9: New to series
> > ---
> >   arch/powerpc/lib/code-patching.c | 12 ++++--------
> >   1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index 2333625b5e31..b28afa1133db 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -65,14 +65,11 @@ static int text_area_cpu_down(unsigned int cpu)
> >   }
> >
> >   /*
> > - * Run as a late init call. This allows all the boot time patching to =
be done
> > - * simply by patching the code, and then we're called here prior to
> > - * mark_rodata_ro(), which happens after all init calls are run. Altho=
ugh
> > - * BUG_ON() is rude, in this case it should only happen if ENOMEM, and=
 we judge
> > - * it as being preferable to a kernel that will crash later when someo=
ne tries
> > - * to use patch_instruction().
> > + * Although BUG_ON() is rude, in this case it should only happen if EN=
OMEM, and
> > + * we judge it as being preferable to a kernel that will crash later w=
hen
> > + * someone tries to use patch_instruction().
>
> Please use WARN_ON(), see why at https://www.kernel.org/doc/html/latest/p=
rocess/deprecated.html
Ok I can include a change to WARN_ON() as a separate patch.
>
> >    */
> > -static int __init setup_text_poke_area(void)
> > +int __init poking_init(void)
> >   {
> >       BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> >               "powerpc/text_poke:online", text_area_cpu_up,
> > @@ -80,7 +77,6 @@ static int __init setup_text_poke_area(void)
> >
> >       return 0;
> >   }
> > -late_initcall(setup_text_poke_area);
> >
> >   /*
> >    * This can be called for kernel text or a module.
> >
