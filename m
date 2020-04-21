Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BD31B1AF1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 02:51:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495lPp4X6LzDqyb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 10:51:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=meeAYjLZ; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495lMS1yTmzDr0k
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 10:49:39 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id t12so5653614edw.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 17:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wJHlw0Va8nRu1bocL0iGdefgbBDvsiBEjRNcEzF2emU=;
 b=meeAYjLZhNhYpKBnFQIRY8QNiqkTLOGzc2f5eEof1vaJQqZnU3xO9BHaM0ZTWqz18H
 7JdM/LuAS1FxwOG+U10a3oGmldXeSsYkdnMVfzGPyQiNrW5OHAnV4Q5byiDuVeQsbNl1
 E333eMFKt3b2MoMegW3BJnD5V/q7diY8XYF6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJHlw0Va8nRu1bocL0iGdefgbBDvsiBEjRNcEzF2emU=;
 b=FQnToslmuYAmddSi3Kd9RaJ8sKqF9Vr5yfObV30oXtZB+Ktfe7mKd7ul9BvY8W33lH
 E0ZbuLEQWtXIZ0ytYEvzEXz48ZaYFIrsCwqrnEVV2WX7LKa42RGKSuSve2d/LoGlvM3G
 pFJjAu9qViw7d1uhCJ8msQgs7DCi3YnYtVnCsNiuVOgfiarONysZokDQCLLPqrafTQI0
 mHhocSa7bvDKrxL4/6ILqN2GLQ1QVpAaY2RpmnQ8NKvkeePKJG8e847CgyshS4Bh0d1r
 cti6Vcn7GV9JRK2q/V6xGtW6jBjRtmtJ2yF5UKqqe3sJT+p5WlSatn0Q7f0tLs3U02xj
 6N7A==
X-Gm-Message-State: AGi0PuYqv8Qzy5U1DMI2qy6qgn8cSTXTCFAuhvf/5iJjYqbczOEh8T4x
 cMepk3fa425y2F0OBUzdhiRkikfYdT2yqirCNIc=
X-Google-Smtp-Source: APiQypI1EAeVQeoUmWxrcddmzILwfd83lCEKJEUjqchmR0ZO8JH1LNOiAonElPJJKLVzNuxsgOg9s5aCArGIIeHtz4k=
X-Received: by 2002:a50:cd17:: with SMTP id z23mr16344581edi.191.1587430175724; 
 Mon, 20 Apr 2020 17:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
In-Reply-To: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Apr 2020 00:49:23 +0000
Message-ID: <CACPK8XdzLiUkzp-B3DuwxVHgn-hZqKypoyU_PLtE5d0K=B1mXQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drivers/powerpc: Replace _ALIGN_UP() by ALIGN()
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>,
 linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Apr 2020 at 18:37, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>
> _ALIGN_UP() is specific to powerpc
> ALIGN() is generic and does the same
>
> Replace _ALIGN_UP() by ALIGN()
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

I was curious, so I expanded out the kernel one. Here's the diff:

- (((addr)+((size)-1))&(~((typeof(addr))(size)-1)))
+ (((addr)+((typeof(addr))(size) - 1))&~((typeof(addr))(size)-1))

So it adds a cast, but aside from that it's the same.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/ps3/ps3-lpm.c               | 6 +++---
>  drivers/vfio/pci/vfio_pci_nvlink2.c | 2 +-
>  drivers/video/fbdev/ps3fb.c         | 4 ++--
>  sound/ppc/snd_ps3.c                 | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/ps3/ps3-lpm.c b/drivers/ps3/ps3-lpm.c
> index 83c45659bc9d..064b5884ba13 100644
> --- a/drivers/ps3/ps3-lpm.c
> +++ b/drivers/ps3/ps3-lpm.c
> @@ -1096,8 +1096,8 @@ int ps3_lpm_open(enum ps3_lpm_tb_type tb_type, void *tb_cache,
>                 lpm_priv->tb_cache_internal = NULL;
>                 lpm_priv->tb_cache = NULL;
>         } else if (tb_cache) {
> -               if (tb_cache != (void *)_ALIGN_UP((unsigned long)tb_cache, 128)
> -                       || tb_cache_size != _ALIGN_UP(tb_cache_size, 128)) {
> +               if (tb_cache != (void *)ALIGN((unsigned long)tb_cache, 128)
> +                       || tb_cache_size != ALIGN(tb_cache_size, 128)) {
>                         dev_err(sbd_core(), "%s:%u: unaligned tb_cache\n",
>                                 __func__, __LINE__);
>                         result = -EINVAL;
> @@ -1116,7 +1116,7 @@ int ps3_lpm_open(enum ps3_lpm_tb_type tb_type, void *tb_cache,
>                         result = -ENOMEM;
>                         goto fail_malloc;
>                 }
> -               lpm_priv->tb_cache = (void *)_ALIGN_UP(
> +               lpm_priv->tb_cache = (void *)ALIGN(
>                         (unsigned long)lpm_priv->tb_cache_internal, 128);
>         }
>
> diff --git a/drivers/vfio/pci/vfio_pci_nvlink2.c b/drivers/vfio/pci/vfio_pci_nvlink2.c
> index ed20d73cc27c..65c61710c0e9 100644
> --- a/drivers/vfio/pci/vfio_pci_nvlink2.c
> +++ b/drivers/vfio/pci/vfio_pci_nvlink2.c
> @@ -67,7 +67,7 @@ static size_t vfio_pci_nvgpu_rw(struct vfio_pci_device *vdev,
>          *
>          * This is not fast path anyway.
>          */
> -       sizealigned = _ALIGN_UP(posoff + count, PAGE_SIZE);
> +       sizealigned = ALIGN(posoff + count, PAGE_SIZE);
>         ptr = ioremap_cache(data->gpu_hpa + posaligned, sizealigned);
>         if (!ptr)
>                 return -EFAULT;
> diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
> index 834f63edf700..9df78fb77267 100644
> --- a/drivers/video/fbdev/ps3fb.c
> +++ b/drivers/video/fbdev/ps3fb.c
> @@ -44,7 +44,7 @@
>  #define GPU_CMD_BUF_SIZE                       (2 * 1024 * 1024)
>  #define GPU_FB_START                           (64 * 1024)
>  #define GPU_IOIF                               (0x0d000000UL)
> -#define GPU_ALIGN_UP(x)                                _ALIGN_UP((x), 64)
> +#define GPU_ALIGN_UP(x)                                ALIGN((x), 64)
>  #define GPU_MAX_LINE_LENGTH                    (65536 - 64)
>
>  #define GPU_INTR_STATUS_VSYNC_0                        0       /* vsync on head A */
> @@ -1015,7 +1015,7 @@ static int ps3fb_probe(struct ps3_system_bus_device *dev)
>         }
>  #endif
>
> -       max_ps3fb_size = _ALIGN_UP(GPU_IOIF, 256*1024*1024) - GPU_IOIF;
> +       max_ps3fb_size = ALIGN(GPU_IOIF, 256*1024*1024) - GPU_IOIF;
>         if (ps3fb_videomemory.size > max_ps3fb_size) {
>                 dev_info(&dev->core, "Limiting ps3fb mem size to %lu bytes\n",
>                          max_ps3fb_size);
> diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
> index 6d2a33b8faa0..b8161a08f2ca 100644
> --- a/sound/ppc/snd_ps3.c
> +++ b/sound/ppc/snd_ps3.c
> @@ -926,7 +926,7 @@ static int snd_ps3_driver_probe(struct ps3_system_bus_device *dev)
>                             PAGE_SHIFT, /* use system page size */
>                             0, /* dma type; not used */
>                             NULL,
> -                           _ALIGN_UP(SND_PS3_DMA_REGION_SIZE, PAGE_SIZE));
> +                           ALIGN(SND_PS3_DMA_REGION_SIZE, PAGE_SIZE));
>         dev->d_region->ioid = PS3_AUDIO_IOID;
>
>         ret = ps3_dma_region_create(dev->d_region);
> --
> 2.25.0
>
