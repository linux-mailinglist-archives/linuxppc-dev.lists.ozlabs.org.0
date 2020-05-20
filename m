Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A681DB31C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 14:23:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RsNN0XqGzDqXZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 22:23:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RsL40D6RzDqbt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 22:21:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EeC9lpK1; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49RsL35w3Bz8syj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 22:21:15 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49RsL35CSZz9sTc; Wed, 20 May 2020 22:21:15 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c42;
 helo=mail-oo1-xc42.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EeC9lpK1; dkim-atps=neutral
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49RsL31Nvrz9sTC
 for <linuxppc-dev@ozlabs.org>; Wed, 20 May 2020 22:21:15 +1000 (AEST)
Received: by mail-oo1-xc42.google.com with SMTP id r12so675285ool.4
 for <linuxppc-dev@ozlabs.org>; Wed, 20 May 2020 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5exZ2+8/4wESGrp7kbv2d1VSSv+LjcKN1qBNGIKXSTA=;
 b=EeC9lpK1/wmbc0dBmuZitfd7h7kmYBQA5zmTFsFrH9ibVU9w7EG61lJN5/KStJxuIS
 Xeki2YQGy5VoEYLEFw+adyvJ7mpRNTJKYQfcgQ8u0b0W3HTvjVVc5SuEaYSjDs9c/G0G
 CYWKS0HLpcB9rX5g2W84BVPP9b6STSd4ZC+p18VsrYA5vf2Ls2wAgPcQXzJiSuYT86rh
 +4cCZ4bxulw+pD+XVgvoYSt5IOwCwdmXae6LPFIZh9S8RU+23/jfOzPkhcewToh2Pzx1
 2G87xddc0eI8USUcxkDOiPuToN4eXxTxqCe5q72gF2/jGqZlB88LMdVgLAkN7s7/67iL
 mp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5exZ2+8/4wESGrp7kbv2d1VSSv+LjcKN1qBNGIKXSTA=;
 b=c6yF+i+Qj6QuIndFuB/Rk0BSFJxrOWiUBhnljLzRq3DT2roRhTdjH3/QpwoovkODnN
 GrRuvBtIoqQac1diPto2hDin2UV9r+gKUbKi0lCbDtnx32WsXSgOuqH3ABPMWn3CpTHD
 VUwJO+OdtLlUJisEx1eSRbYgmCOxtqL4lpIGYMq3DS78JPFWLCRE7NMkmTI+eraM0Vin
 PoII7eGn+zrI0oC1hEZKs2QwUZPjxz/tn3wPhq85Vdvcr2XaVM/hFnrOWPYi+thBZ1r+
 f4y1r31OaWp7lVrUt/ipsUBmW7DSBYinchyroEy9AuprMDKkujsN4j2az3mxUfuHi9W3
 vkkw==
X-Gm-Message-State: AOAM530eyM/k7yOJnDGd/cKfDA1/46xYpGCosL5ubvJ+tLryNJf9w9EU
 nmU+U/FTnqF2VG0rzQdE2keawz9/3rT/qmyMiWs=
X-Google-Smtp-Source: ABdhPJxMhYTg3TzUsfMxWYrhdY9Mg727GRdg8P25R3/HxRLu5rKDoTYXpokex4gENDKn91wS3IPlZICIagroM1HxSSc=
X-Received: by 2002:a4a:be07:: with SMTP id l7mr2313128oop.38.1589977271747;
 Wed, 20 May 2020 05:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200520114446.956215-1-mpe@ellerman.id.au>
In-Reply-To: <20200520114446.956215-1-mpe@ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 20 May 2020 22:21:00 +1000
Message-ID: <CACzsE9p2c2ZLny86eOEtbyoiYtSNp0kmw9KE7GdfdxhqhWwLOQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Add ppc_inst_next()
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 20, 2020 at 9:44 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> In a few places we want to calculate the address of the next
> instruction. Previously that was simple, we just added 4 bytes, or if
> using a u32 * we incremented that pointer by 1.
>
> But prefixed instructions make it more complicated, we need to advance
> by either 4 or 8 bytes depending on the actual instruction. We also
> can't do pointer arithmetic using struct ppc_inst, because it is
> always 8 bytes in size on 64-bit, even though we might only need to
> advance by 4 bytes.
>
> So add a ppc_inst_next() helper which calculates the location of the
> next instruction, if the given instruction was located at the given
> address. Note the instruction doesn't need to actually be at the
> address in memory.
>
> Convert several locations to use it.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/inst.h   |  9 +++++++++
>  arch/powerpc/kernel/uprobes.c     |  2 +-
>  arch/powerpc/lib/feature-fixups.c | 10 +++++-----
>  arch/powerpc/xmon/xmon.c          |  2 +-
>  4 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> index d82e0c99cfa1..7d5ee1309b92 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -100,6 +100,15 @@ static inline int ppc_inst_len(struct ppc_inst x)
>         return ppc_inst_prefixed(x) ? 8 : 4;
>  }
>
> +/*
> + * Return the address of the next instruction, if the instruction @value was
> + * located at @location.
> + */
> +static inline struct ppc_inst *ppc_inst_next(void *location, struct ppc_inst value)
> +{
> +       return location + ppc_inst_len(value);
> +}
I think this is a good idea. I tried something similar in the initial
post for an instruction type. I had:
+#define PPC_INST_NEXT(ptr) ((ptr) += PPC_INST_LEN(DEREF_PPC_INST_PTR((ptr))))
but how you've got it is much more clear/usable.
I wonder why not
+static inline struct ppc_inst *ppc_inst_next(void *location)
+{
+       return location + ppc_inst_len(ppc_inst_read((struct ppc_inst
*)location);
+}

> +
>  int probe_user_read_inst(struct ppc_inst *inst,
>                          struct ppc_inst __user *nip);
>
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index 83e883e1a42d..683ba76919a7 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -112,7 +112,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>          * support doesn't exist and have to fix-up the next instruction
>          * to be executed.
>          */
> -       regs->nip = utask->vaddr + ppc_inst_len(ppc_inst_read(&auprobe->insn));
> +       regs->nip = (unsigned long)ppc_inst_next((void *)utask->vaddr, auprobe->insn);
>
>         user_disable_single_step(current);
>         return 0;
> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
> index 80f320c2e189..0ad01eebf112 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -84,13 +84,13 @@ static int patch_feature_section(unsigned long value, struct fixup_entry *fcur)
>         src = alt_start;
>         dest = start;
>
> -       for (; src < alt_end; src = (void *)src + ppc_inst_len(ppc_inst_read(src)),
> -            (dest = (void *)dest + ppc_inst_len(ppc_inst_read(dest)))) {
> +       for (; src < alt_end; src = ppc_inst_next(src, *src),
> +                             dest = ppc_inst_next(dest, *dest)) {
The reason to maybe use ppc_inst_read() in the helper instead of just
*dest would be we don't always need to read 8 bytes.
>                 if (patch_alt_instruction(src, dest, alt_start, alt_end))
>                         return 1;
>         }
>
> -       for (; dest < end; dest = (void *)dest + ppc_inst_len(ppc_inst(PPC_INST_NOP)))
> +       for (; dest < end; dest = ppc_inst_next(dest, ppc_inst(PPC_INST_NOP)))
But then you wouldn't be able to do this as easily I guess.
>                 raw_patch_instruction(dest, ppc_inst(PPC_INST_NOP));
>
>         return 0;
> @@ -405,8 +405,8 @@ static void do_final_fixups(void)
>         while (src < end) {
>                 inst = ppc_inst_read(src);
>                 raw_patch_instruction(dest, inst);
> -               src = (void *)src + ppc_inst_len(inst);
> -               dest = (void *)dest + ppc_inst_len(inst);
> +               src = ppc_inst_next(src, *src);
> +               dest = ppc_inst_next(dest, *dest);
>         }
>  #endif
>  }
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index fb135f2cd6b0..aa123f56b7d4 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -939,7 +939,7 @@ static void insert_bpts(void)
>                 }
>
>                 patch_instruction(bp->instr, instr);
> -               patch_instruction((void *)bp->instr + ppc_inst_len(instr),
> +               patch_instruction(ppc_inst_next(bp->instr, instr),
>                                   ppc_inst(bpinstr));
>                 if (bp->enabled & BP_CIABR)
>                         continue;
> --
> 2.25.1
>
