Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C2A1B1B25
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 03:13:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495lvR08HYzDqCq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 11:13:55 +1000 (AEST)
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
 header.s=google header.b=jBHIXMMq; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495lsN4yTWzDq5t
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 11:12:06 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id re23so9603202ejb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 18:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wp/4OUZ+t6DtrNUNi8QED2tYXGNcm7p7HQx9y7jVsyE=;
 b=jBHIXMMqmv7Aus032CJ29TCsVbNmCcWvBL1qZYR+MTvz1Np/UQLslt3cjqrBpRQ7A+
 HVoyGy2PNpEomcWwRjHmW8Ak2N/EoxZMA1MCSPmiEBAije7BXceQJc3pWuaMlFYjZCGw
 +dbOr9lgbJ1NksYu03hyjp/+zZGgTDNZTrbIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wp/4OUZ+t6DtrNUNi8QED2tYXGNcm7p7HQx9y7jVsyE=;
 b=HAvCBZGW3aM5o+1cbps/DV0yoTXY2Yfi3x/DoRASNJld8ZE2PM00a3xmmdhCUYKPkV
 jAgZK9Ebmqa603iaVB9YS6JxgwmzBnw6CrofDBiUKywDZdjLs9X4+acUCc/hG2YGSjVA
 aBXNwNfiTTXFOKMBaT8R5BIxsxKGhcHzLctuGCRdn9PC4kCjQMZ2+C7Ep1tCWx1YicYq
 2cwvmfBelsoRab8fWQeOa3ozCTf16YRY8ddgpUT4SQMnzO38DDFLwS+6aPKjQ4f3AZPH
 DDGWWEtS2kfFA7SbxEWix80dA6A3qBniOjxeRy8srDXq1o3FQXAJcML9bckbIoUd226t
 kTiA==
X-Gm-Message-State: AGi0PubTZPWj1Mdtf465KH8lTIxKKTYoIHd1XEVnlxnZ3c+gP86Suoxw
 hqgi+zKIhR8gNs0cwdQ9Y1m7qXBvUWPUtMdBZF8=
X-Google-Smtp-Source: APiQypIwX6LNiArHUl2jR5jEUHw3irQha6rujNUKiFvGPogUg6tL4fPWSZU+QH9PJrbsYVIAn12O5Owrj2LpHTm1d+Q=
X-Received: by 2002:a17:906:a857:: with SMTP id
 dx23mr18970317ejb.52.1587431523767; 
 Mon, 20 Apr 2020 18:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
 <4006d9c8e69f8eaccee954899f6b5fb76240d00b.1587407777.git.christophe.leroy@c-s.fr>
In-Reply-To: <4006d9c8e69f8eaccee954899f6b5fb76240d00b.1587407777.git.christophe.leroy@c-s.fr>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Apr 2020 01:11:51 +0000
Message-ID: <CACPK8XfCS0X_YsuL8Bq-a3gNgEBoTb8=cK6yBvK4qVwvATZ68A@mail.gmail.com>
Subject: Re: [PATCH 4/5] powerpc: Replace _ALIGN() by ALIGN()
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
> _ALIGN() is specific to powerpc
> ALIGN() is generic and does the same
>
> Replace _ALIGN() by ALIGN()
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
>  arch/powerpc/include/asm/nohash/32/pgtable.h | 2 +-
>  arch/powerpc/kernel/prom_init.c              | 8 ++++----
>  arch/powerpc/platforms/powermac/bootx_init.c | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
> index 53b5c93eaf5d..0d4bccb4b9f2 100644
> --- a/arch/powerpc/include/asm/book3s/32/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
> @@ -188,7 +188,7 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
>   * memory shall not share segments.
>   */
>  #if defined(CONFIG_STRICT_KERNEL_RWX) && defined(CONFIG_MODULES)
> -#define VMALLOC_START ((_ALIGN((long)high_memory, 256L << 20) + VMALLOC_OFFSET) & \
> +#define VMALLOC_START ((ALIGN((long)high_memory, 256L << 20) + VMALLOC_OFFSET) & \
>                        ~(VMALLOC_OFFSET - 1))
>  #else
>  #define VMALLOC_START ((((long)high_memory + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))
> diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
> index 5b4d4c4297e1..4315d40906a0 100644
> --- a/arch/powerpc/include/asm/nohash/32/pgtable.h
> +++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
> @@ -110,7 +110,7 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
>   */
>  #define VMALLOC_OFFSET (0x1000000) /* 16M */
>  #ifdef PPC_PIN_SIZE
> -#define VMALLOC_START (((_ALIGN((long)high_memory, PPC_PIN_SIZE) + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))
> +#define VMALLOC_START (((ALIGN((long)high_memory, PPC_PIN_SIZE) + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))

Perhaps this once needed to be more flexiable, but now it always
aligns to 256M and then to 16MB.

>  #else
>  #define VMALLOC_START ((((long)high_memory + VMALLOC_OFFSET) & ~(VMALLOC_OFFSET-1)))

This is an open coded align to VMALLOC_OFFSET.

>  #endif
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 3a5a7db4564f..e3a9fde51c4f 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -2426,7 +2426,7 @@ static void __init *make_room(unsigned long *mem_start, unsigned long *mem_end,
>  {
>         void *ret;
>
> -       *mem_start = _ALIGN(*mem_start, align);
> +       *mem_start = ALIGN(*mem_start, align);
>         while ((*mem_start + needed) > *mem_end) {
>                 unsigned long room, chunk;
>
> @@ -2562,7 +2562,7 @@ static void __init scan_dt_build_struct(phandle node, unsigned long *mem_start,
>                                 *lp++ = *p;
>                 }
>                 *lp = 0;
> -               *mem_start = _ALIGN((unsigned long)lp + 1, 4);
> +               *mem_start = ALIGN((unsigned long)lp + 1, 4);
>         }
>
>         /* get it again for debugging */
> @@ -2608,7 +2608,7 @@ static void __init scan_dt_build_struct(phandle node, unsigned long *mem_start,
>                 /* push property content */
>                 valp = make_room(mem_start, mem_end, l, 4);
>                 call_prom("getprop", 4, 1, node, pname, valp, l);
> -               *mem_start = _ALIGN(*mem_start, 4);
> +               *mem_start = ALIGN(*mem_start, 4);
>
>                 if (!prom_strcmp(pname, "phandle"))
>                         has_phandle = 1;
> @@ -2667,7 +2667,7 @@ static void __init flatten_device_tree(void)
>                 prom_panic ("couldn't get device tree root\n");
>
>         /* Build header and make room for mem rsv map */
> -       mem_start = _ALIGN(mem_start, 4);
> +       mem_start = ALIGN(mem_start, 4);
>         hdr = make_room(&mem_start, &mem_end,
>                         sizeof(struct boot_param_header), 4);
>         dt_header_start = (unsigned long)hdr;
> diff --git a/arch/powerpc/platforms/powermac/bootx_init.c b/arch/powerpc/platforms/powermac/bootx_init.c
> index c3374a90952f..9d4ecd292255 100644
> --- a/arch/powerpc/platforms/powermac/bootx_init.c
> +++ b/arch/powerpc/platforms/powermac/bootx_init.c
> @@ -386,7 +386,7 @@ static unsigned long __init bootx_flatten_dt(unsigned long start)
>         hdr->dt_strings_size = bootx_dt_strend - bootx_dt_strbase;
>
>         /* Build structure */
> -       mem_end = _ALIGN(mem_end, 16);
> +       mem_end = ALIGN(mem_end, 16);
>         DBG("Building device tree structure at: %x\n", mem_end);
>         hdr->off_dt_struct = mem_end - mem_start;
>         bootx_scan_dt_build_struct(base, 4, &mem_end);
> @@ -404,7 +404,7 @@ static unsigned long __init bootx_flatten_dt(unsigned long start)
>          * also bump mem_reserve_cnt to cause further reservations to
>          * fail since it's too late.
>          */
> -       mem_end = _ALIGN(mem_end, PAGE_SIZE);
> +       mem_end = ALIGN(mem_end, PAGE_SIZE);
>         DBG("End of boot params: %x\n", mem_end);
>         rsvmap[0] = mem_start;
>         rsvmap[1] = mem_end;
> --
> 2.25.0
>
