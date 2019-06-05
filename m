Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 930CD35B50
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 13:34:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jms80BTbzDqZS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 21:34:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jmqn6KNLzDqQh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 21:32:53 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id 107so370742otj.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 04:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gKIrzdoUs9Q5HqSQ9aF++SWQgmsoIMMP53yLp9JAEhA=;
 b=S3GCnogqDd4736yHaR6Sv/eerB7w0jIQIolcNBvGeYIUi03+hEH8KL5oRbZws9Y8Zr
 7u0KlqHTpSpJp0onqaMOnyf6pKdO1NmUVrYkluhzzU9koqKT4A4S/3DRqrCfHyJXoQpj
 bV/gY9384kR72NOoQZAv69FbselNP1DKNoxTaynhRRscsIjPB4c0bjclLdh/gMwaBpXb
 NnuzsUpHYV9yCWIUy2XF/ewVt1tqdkqaRmnCcIEvZCaFlROvjPS0hi+T+k3zS8VpLj1B
 zjdcyQ2QZ4gKHgiX85zhwdWna2W98F8uhHAB4hL+FqDk9dHxRnZNvZLb4keaARGH9Ur6
 Yi8w==
X-Gm-Message-State: APjAAAX2c+1duDkBLvBInm3HniHfPV8OtOv7ijjBTR6wqKvuPTc6309b
 e4fnDioxXtlTHtmqLaGjKrP6C0brX6xIkGdXNKk=
X-Google-Smtp-Source: APXvYqz+JZW2+VQCD6Erxe5NqzDpmFjd4VjgArIo0C0WgsuCGX5oKZ7QMpJqVs3/r9yA8gOMHCxJc6awbkEujZVMQjU=
X-Received: by 2002:a9d:7987:: with SMTP id h7mr9178825otm.284.1559734370049; 
 Wed, 05 Jun 2019 04:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <90d30adb0943a11ab127808c03229ba657478df4.1559566521.git.christophe.leroy@c-s.fr>
In-Reply-To: <90d30adb0943a11ab127808c03229ba657478df4.1559566521.git.christophe.leroy@c-s.fr>
From: Mathieu Malaterre <malat@debian.org>
Date: Wed, 5 Jun 2019 13:32:39 +0200
Message-ID: <CA+7wUswvw3JJ2dLCn877tNbTd==O5c9LxHGezOm+y5otQZnS2w@mail.gmail.com>
Subject: Re: [PATCH] powerpc/32s: fix booting with CONFIG_PPC_EARLY_DEBUG_BOOTX
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 3, 2019 at 3:00 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>
> When booting through OF, setup_disp_bat() does nothing because
> disp_BAT are not set. By change, it used to work because BOOTX
> buffer is mapped 1:1 at address 0x81000000 by the bootloader, and
> btext_setup_display() sets virt addr same as phys addr.
>
> But since commit 215b823707ce ("powerpc/32s: set up an early static
> hash table for KASAN."), a temporary page table overrides the
> bootloader mapping.
>
> This 0x81000000 is also problematic with the newly implemented
> Kernel Userspace Access Protection (KUAP) because it is within user
> address space.
>
> This patch fixes those issues by properly setting disp_BAT through
> a call to btext_prepare_BAT(), allowing setup_disp_bat() to
> properly setup BAT3 for early bootx screen buffer access.
>
> Reported-by: Mathieu Malaterre <malat@debian.org>
> Fixes: 215b823707ce ("powerpc/32s: set up an early static hash table for KASAN.")
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

The patch below does fix the symptoms I reported. Tested with CONFIG_KASAN=n :

Tested-by: Mathieu Malaterre <malat@debian.org>

Thanks !

> ---
>  arch/powerpc/include/asm/btext.h       | 4 ++++
>  arch/powerpc/kernel/prom_init.c        | 1 +
>  arch/powerpc/kernel/prom_init_check.sh | 2 +-
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/btext.h b/arch/powerpc/include/asm/btext.h
> index 3ffad030393c..461b0f193864 100644
> --- a/arch/powerpc/include/asm/btext.h
> +++ b/arch/powerpc/include/asm/btext.h
> @@ -13,7 +13,11 @@ extern void btext_update_display(unsigned long phys, int width, int height,
>                                  int depth, int pitch);
>  extern void btext_setup_display(int width, int height, int depth, int pitch,
>                                 unsigned long address);
> +#ifdef CONFIG_PPC32
>  extern void btext_prepare_BAT(void);
> +#else
> +static inline void btext_prepare_BAT(void) { }
> +#endif
>  extern void btext_map(void);
>  extern void btext_unmap(void);
>
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 3555cad7bdde..ed446b7ea164 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -2336,6 +2336,7 @@ static void __init prom_check_displays(void)
>                         prom_printf("W=%d H=%d LB=%d addr=0x%x\n",
>                                     width, height, pitch, addr);
>                         btext_setup_display(width, height, 8, pitch, addr);
> +                       btext_prepare_BAT();
>                 }
>  #endif /* CONFIG_PPC_EARLY_DEBUG_BOOTX */
>         }
> diff --git a/arch/powerpc/kernel/prom_init_check.sh b/arch/powerpc/kernel/prom_init_check.sh
> index 518d416971c1..160bef0d553d 100644
> --- a/arch/powerpc/kernel/prom_init_check.sh
> +++ b/arch/powerpc/kernel/prom_init_check.sh
> @@ -24,7 +24,7 @@ fi
>  WHITELIST="add_reloc_offset __bss_start __bss_stop copy_and_flush
>  _end enter_prom $MEM_FUNCS reloc_offset __secondary_hold
>  __secondary_hold_acknowledge __secondary_hold_spinloop __start
> -logo_linux_clut224
> +logo_linux_clut224 btext_prepare_BAT
>  reloc_got2 kernstart_addr memstart_addr linux_banner _stext
>  __prom_init_toc_start __prom_init_toc_end btext_setup_display TOC."
>
> --
> 2.13.3
>
