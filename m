Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1812E31EA90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 14:53:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhGQC16GZz3cJh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 00:53:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pHcD0ghe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pHcD0ghe; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhGPm1yZ4z30LG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 00:53:13 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id u20so4991203ejb.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 05:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e4WxhpsUCYoI68epWSVeYmZpkTYdeeFLMrDY4wlplfI=;
 b=pHcD0ghentGOj45fVxrfkX0xPlSZvJlC0kd55797B5+7/FDJlRdHC9SkXW6ugmrNgK
 X6hGVuBi8QvWvI67Qz+hZ8U7osHbDuB6KtlpwRBkq/2shwzErWmKsoy3LTn6TQGu1jIl
 Yo64yXGT9VUimy9DnHi719D1gvNEgtvWVw+U68Z7BoJaiOvA9lBI19trc+JMMBa+FlMw
 jq00qgzP+phsfc+PuRwfmT8Ze9o8f5Jm2VJ3YOTcrF6wv+YcRf6K/VpPwCp8M03Q1wRi
 wRrU5a+VkfQ8wMMML5nmr+vFJ64WpquXC8gxvaAl4x4hfAdn1BPVCq86muKBF1COxEvF
 2AgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e4WxhpsUCYoI68epWSVeYmZpkTYdeeFLMrDY4wlplfI=;
 b=sNd6OEvIaNDyZ+fXxLrs+8mDdZc1CVjOjhVw5RpQCaneJonzF6WVYJJT2SZKywgcAp
 O5wEUfR9JKfHjYvquAjXS8PHnmUwlPNSD8/A09t8HwvDLBCmpcJQrVJpNQ+3LTqNE6jS
 2WAU2SOk+630Ty1BxpF9nUEye50cJ3CHqmhbj94PZvwVPUgti4LS88cbY1xwyblSFbhB
 A9H0aVkvq3yreliy3/C80zV7hhBWkIVRyMn7+P+lc7GFbDrSDw500yewcAKJnMY3gMp+
 IONYAHJBSTamCZYuKZwDe3YT8oA6dGgkOI4EZBwYMMnFBvtqdUulP18+n/T++QH0Cjas
 kIYg==
X-Gm-Message-State: AOAM5319HPUG9EYQuAagNoPoA7E/TisLbQ/7Len/n3MaHvu/c9XXmxj/
 /Kv8IS/X9ohl/RAKQl/IXh+EueRqmXOqdl/4tQ==
X-Google-Smtp-Source: ABdhPJyjnj3etHjyJP96CAwGNcurZz9kLIYoqEOkH+GezZ/ZGsXaciElTkISu6NL/wj6DRkIqVBz6keGOskaBkyE5vc=
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr4044757ejj.108.1613656386829; 
 Thu, 18 Feb 2021 05:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20210218144815.5673ae6f@canb.auug.org.au>
 <874ki9vene.fsf@mpe.ellerman.id.au>
 <20210218223427.77109d83@canb.auug.org.au>
In-Reply-To: <20210218223427.77109d83@canb.auug.org.au>
From: Rob Herring <robherring2@gmail.com>
Date: Thu, 18 Feb 2021 07:52:52 -0600
Message-ID: <CAL_JsqJ9Ske4hkWn3uo8-nef29MQ1DkNdtE=gxbqj8CKrtQorg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the powerpc
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 18, 2021 at 5:34 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Michael,
>
> On Thu, 18 Feb 2021 21:44:37 +1100 Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > I think it just needs this?
> >
> > diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> > index 87e34611f93d..0492ca6003f3 100644
> > --- a/arch/powerpc/kexec/elf_64.c
> > +++ b/arch/powerpc/kexec/elf_64.c
> > @@ -104,7 +104,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
> >
> >       fdt = of_kexec_alloc_and_setup_fdt(image, initrd_load_addr,
> >                                          initrd_len, cmdline,
> > -                                        fdt_totalsize(initial_boot_params));
> > +                                        kexec_fdt_totalsize_ppc64(image));
> >       if (!fdt) {
> >               pr_err("Error setting up the new device tree.\n");
> >               ret = -EINVAL;
> >
>
> I thought about that, but the last argument to
> of_kexec_alloc_and_setup_fdt() is extra_fdt_size and the allocation
> done is for this:
>
> fdt_size = fdt_totalsize(initial_boot_params) +
>                    (cmdline ? strlen(cmdline) : 0) +
>                    FDT_EXTRA_SPACE +
>                    extra_fdt_size;
>
> and kexec_fdt_totalsize_ppc64() also includes
> fdt_totalsize(initial_boot_params) so I was not sure.  Maybe
> kexec_fdt_totalsize_ppc64() needs modification as well?

You're both right. Michael's fix is sufficient for the merge. The only
risk with a larger size is failing to allocate it, but we're talking
only 10s of KB. Historically until the commit causing the conflict,
PPC was just used 2x fdt_totalsize(initial_boot_params). You could
drop 'fdt_size = fdt_totalsize(initial_boot_params) + (2 *
COMMAND_LINE_SIZE);' from kexec_fdt_totalsize_ppc64() as well, but
then the function name is misleading.

Lakshmi can send a follow-up patch to fine tune the size and rename
kexec_fdt_totalsize_ppc64.

Rob
