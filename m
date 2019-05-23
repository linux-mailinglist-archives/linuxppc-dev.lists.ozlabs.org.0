Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A624D27C21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 13:51:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458nrr6psWzDqj1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 21:51:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.193; helo=mail-oi1-f193.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458nqQ1y3SzDqMX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 21:49:54 +1000 (AEST)
Received: by mail-oi1-f193.google.com with SMTP id a132so4136878oib.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 04:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SDPZpn1Z/WVcAFnu0wVzRJujrt6mxAJ74qzNvfLBBxg=;
 b=EKniwaAJ40IN5HMRgU2qrYWTVov9d8d86xfh1ENPFUwHApTzr14LDdZEdNNFo5G5bN
 CJlggju+bJ/ahw+v7lpQF1CNALyqFmxrXkVkSLnoG2HvBi6+E8Z5p02KVjxrNOoBLqQL
 dvNJOnTJKYKeoxw/rFEhIYzXgMsAiYTNidOOl11FG56pl5TJ/8aGYU7aLbAi4zQf9zUK
 lPdkr4LZClkcPSMLh6j8XO339xJ+hcbL/d5rsFHBroUQtUDeddt1nUpdTsU7YPp1coG2
 z/qam1wzx/VwOb6Z33U4Cus1AGi2T809moYurFPC8HHagli2qtra6TEosyXAAW4BAczk
 7PwQ==
X-Gm-Message-State: APjAAAWsCWaGtrEhVlzXwuV9pp/qbhkO2yOf5PqMtzaimDeZIvGGzDQg
 Zt/4V3jWdX6s+u9AFZFSLFb7fzlu+gbqz5yYB1I=
X-Google-Smtp-Source: APXvYqyI2EjTKGdCz8up8VgvWh4xBSwLJzL9dCRQnLByupzgDHI7qG2w659u2fgJb7RIPVhnUUIVbWffOSOp331evS0=
X-Received: by 2002:a05:6808:98a:: with SMTP id a10mr535oic.57.1558612191818; 
 Thu, 23 May 2019 04:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190312202008.29681-1-malat@debian.org>
 <20190312212318.17822-1-malat@debian.org>
In-Reply-To: <20190312212318.17822-1-malat@debian.org>
From: Mathieu Malaterre <malat@debian.org>
Date: Thu, 23 May 2019 13:49:41 +0200
Message-ID: <CA+7wUswq0nDfo7d7F_+v+bMXZUSr0ZQ7QbOTdxmLGp4_SK7xBw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/32: sstep: Move variable `rc` within
 CONFIG_PPC64 sentinels
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ping ?

On Tue, Mar 12, 2019 at 10:23 PM Mathieu Malaterre <malat@debian.org> wrote:
>
> Fix warnings treated as errors with W=1:
>
>   arch/powerpc/lib/sstep.c:1172:31: error: variable 'rc' set but not used [-Werror=unused-but-set-variable]
>
> Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
> v2: as suggested prefer CONFIG_PPC64 sentinel instead of unused keyword
>
>  arch/powerpc/lib/sstep.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index 3d33fb509ef4..9996dc7a0b46 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1169,7 +1169,10 @@ static nokprobe_inline int trap_compare(long v1, long v2)
>  int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>                   unsigned int instr)
>  {
> -       unsigned int opcode, ra, rb, rc, rd, spr, u;
> +       unsigned int opcode, ra, rb, rd, spr, u;
> +#ifdef CONFIG_PPC64
> +       unsigned int rc;
> +#endif
>         unsigned long int imm;
>         unsigned long int val, val2;
>         unsigned int mb, me, sh;
> @@ -1292,7 +1295,9 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>         rd = (instr >> 21) & 0x1f;
>         ra = (instr >> 16) & 0x1f;
>         rb = (instr >> 11) & 0x1f;
> +#ifdef CONFIG_PPC64
>         rc = (instr >> 6) & 0x1f;
> +#endif
>
>         switch (opcode) {
>  #ifdef __powerpc64__
> --
> 2.20.1
>
