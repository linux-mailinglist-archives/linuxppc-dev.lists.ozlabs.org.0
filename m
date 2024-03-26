Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDACC88B97D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 05:46:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UBNjYIA6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UBNjYIA6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3chF4GJyz3dXH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 15:46:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UBNjYIA6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UBNjYIA6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsavitz@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3cgQ3QLqz3vXR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 15:45:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711428335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLn9q/d3IXDRXcZITYj+lKYLmTjyEeBrR8h5o+IkddE=;
	b=UBNjYIA6AbXsH2WUPAUw2yYcxeNH7uemR6Xx1mp4pb8eYZjiqBDGs1NYTL2t41FrLta6Nr
	o3evOnTNotHlpvwFXN1JeJy9S9bg6GzPRxJ84N7l+pIvxdaryyeU6w8ZQOLcxxMhQ7oIAF
	Z+NDPY4JPKfDxHa9wWJKHVvWMD9Q/0Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711428335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLn9q/d3IXDRXcZITYj+lKYLmTjyEeBrR8h5o+IkddE=;
	b=UBNjYIA6AbXsH2WUPAUw2yYcxeNH7uemR6Xx1mp4pb8eYZjiqBDGs1NYTL2t41FrLta6Nr
	o3evOnTNotHlpvwFXN1JeJy9S9bg6GzPRxJ84N7l+pIvxdaryyeU6w8ZQOLcxxMhQ7oIAF
	Z+NDPY4JPKfDxHa9wWJKHVvWMD9Q/0Y=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-_l4b8ExxN9SkuhqRLJiEXw-1; Tue, 26 Mar 2024 00:45:33 -0400
X-MC-Unique: _l4b8ExxN9SkuhqRLJiEXw-1
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-4d4628a4bacso1880982e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 21:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711428333; x=1712033133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLn9q/d3IXDRXcZITYj+lKYLmTjyEeBrR8h5o+IkddE=;
        b=rSQgTbpQFRjr2H6cxgYfIV0IG+pW8WnF1imBBx0SnSq1skuj6u8csKOoL0uqs7xgCx
         8hRWVSSrb4MvXHPbf/39mEWLnhbfRo0XHTO74VjuNZv4BXWTXYGEGeyTdULsUDbS0wUu
         KWMVwdcVjLlFwzbxxtDBzoF1xxFllS7J8ccMpKNiqu6R24zdh1dfsBd1YvaAqnpf1/AY
         RpV/iHJ3AnHagRb30/HBT3+57vGrSP7UkKmOfud0M9ludsec8wvzFqPALPjEQcWjDPLs
         qZPBCTn1AaOHFMEycjFiCGZShgemRxXXH01Hd8byd6hNx0vnx+DnTBD8ibXhVj0RZUdW
         D36g==
X-Forwarded-Encrypted: i=1; AJvYcCUwz5UaEUKKjdiAUGBm/9Ho7xwkhGbrJoMODJGy6/70KzUIoR9HWE1wqjh4EWpEqYk1/Ygt4occ214ZJ5lXHW8St3iMeRbwidukakyjWw==
X-Gm-Message-State: AOJu0YxSMV1O3dLTkOT7nG0+2Kn5Wh6tqcz63fSr/bmiRjhSb2nmf6Qv
	81BZzGctg7VCTrgAY1+sWDjPRsHo41QiDLCkPWsGc/stZnjYQpyAlJ7mzaqO3WL/0ZiuZIIMXtn
	kdNhOCc1cK5jot4QZWItzahJacDdu/bO+Z6njqfGRoVqqr57I4gz+otSvPyHnP4wJAoSskqW17h
	+lRi4P9HCHaBQXhX9K5yM3gTi4Wtrd77KwTFhwwA==
X-Received: by 2002:a05:6122:168a:b0:4c9:2540:8520 with SMTP id 10-20020a056122168a00b004c925408520mr1743475vkl.1.1711428333016;
        Mon, 25 Mar 2024 21:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfNLJPf8BwG8GdUEorXPr162rmx5xbKqekfpH7H27QQ3Vu30bi3pOmdnAJp/Gx6xebGiQNvKpx8wabblhWq3o=
X-Received: by 2002:a05:6122:168a:b0:4c9:2540:8520 with SMTP id
 10-20020a056122168a00b004c925408520mr1743463vkl.1.1711428332671; Mon, 25 Mar
 2024 21:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240301203023.2197451-1-jsavitz@redhat.com> <87jzmduiva.fsf@kernel.org>
In-Reply-To: <87jzmduiva.fsf@kernel.org>
From: Joel Savitz <jsavitz@redhat.com>
Date: Tue, 26 Mar 2024 00:45:16 -0400
Message-ID: <CAL1p7m5BoxFDeK0MryQCmTDCeBLN3rMLRGx3cHa6teS02wsgZw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: align memory_limit to 16MB in early_parse_mem
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Gonzalo Siero <gsierohu@redhat.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 8, 2024 at 5:18=E2=80=AFAM Aneesh Kumar K.V <aneesh.kumar@kerne=
l.org> wrote:
>
> Joel Savitz <jsavitz@redhat.com> writes:
>
> > On 64-bit powerpc, usage of a non-16MB-aligned value for the mem=3D ker=
nel
> > cmdline parameter results in a system hang at boot.
> >
> > For example, using 'mem=3D4198400K' will always reproduce this issue.
> >
> > This patch fixes the problem by aligning any argument to mem=3D to 16MB
> > corresponding with the large page size on powerpc.
> >
> > Fixes: 2babf5c2ec2f ("[PATCH] powerpc: Unify mem=3D handling")
> > Co-developed-by: Gonzalo Siero <gsierohu@redhat.com>
> > Signed-off-by: Gonzalo Siero <gsierohu@redhat.com>
> > Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> > ---
> >  arch/powerpc/kernel/prom.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> > index 0b5878c3125b..8cd3e2445d8a 100644
> > --- a/arch/powerpc/kernel/prom.c
> > +++ b/arch/powerpc/kernel/prom.c
> > @@ -82,8 +82,12 @@ static int __init early_parse_mem(char *p)
> >  {
> >       if (!p)
> >               return 1;
> > -
> > +#ifdef CONFIG_PPC64
> > +     /* Align to 16 MB =3D=3D size of ppc64 large page */
> > +     memory_limit =3D ALIGN(memparse(p, &p), 0x1000000);
> > +#else
> >       memory_limit =3D PAGE_ALIGN(memparse(p, &p));
> > +#endif
> >       DBG("memory limit =3D 0x%llx\n", memory_limit);
> >
> >       return 0;
> > --
> > 2.43.0
>
> Can you try this change?
>
> commit 5555bc55e1aa71f545cff31e1eccdb4a2e39df84
> Author: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
> Date:   Fri Mar 8 14:45:26 2024 +0530
>
>     powerpc/mm: Align memory_limit value specified using mem=3D kernel pa=
rameter
>
>     The value specified for the memory limit is used to set a restriction=
 on
>     memory usage. It is important to ensure that this restriction is with=
in
>     the linear map kernel address space range. The hash page table
>     translation uses a 16MB page size to map the kernel linear map addres=
s
>     space. htab_bolt_mapping() function aligns down the size of the range
>     while mapping kernel linear address space. Since the memblock limit i=
s
>     enforced very early during boot, before we can detect the type of mem=
ory
>     translation (radix vs hash), we align the memory limit value specifie=
d
>     as a kernel parameter to 16MB. This alignment value will work for bot=
h
>     hash and radix translations.
>
>     Signed-off-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
>
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 0b5878c3125b..9bd965d35352 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -824,8 +824,11 @@ void __init early_init_devtree(void *params)
>                 reserve_crashkernel();
>         early_reserve_mem();
>
> -       /* Ensure that total memory size is page-aligned. */
> -       limit =3D ALIGN(memory_limit ?: memblock_phys_mem_size(), PAGE_SI=
ZE);
> +       if (memory_limit > memblock_phys_mem_size())
> +               memory_limit =3D 0;
> +
> +       /* Align down to 16 MB which is large page size with hash page tr=
anslation */
> +       limit =3D ALIGN_DOWN(memory_limit ?: memblock_phys_mem_size(), SZ=
_16M);
>         memblock_enforce_memory_limit(limit);
>
>  #if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_4K_PAGES)
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_i=
nit.c
> index e67effdba85c..d6410549e141 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -817,8 +817,8 @@ static void __init early_cmdline_parse(void)
>                 opt +=3D 4;
>                 prom_memory_limit =3D prom_memparse(opt, (const char **)&=
opt);
>  #ifdef CONFIG_PPC64
> -               /* Align to 16 MB =3D=3D size of ppc64 large page */
> -               prom_memory_limit =3D ALIGN(prom_memory_limit, 0x1000000)=
;
> +               /* Align down to 16 MB which is large page size with hash=
 page translation */
> +               prom_memory_limit =3D ALIGN_DOWN(prom_memory_limit, SZ_16=
M);
>  #endif
>         }
>
>

Sorry for the delayed reply. I just tested this patch and it fixes the
bug for me.

