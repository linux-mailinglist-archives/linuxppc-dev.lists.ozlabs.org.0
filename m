Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C331E199C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 04:40:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WJ9Z1FXXzDqDK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 12:40:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WJ5Q3WZkzDqFZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 12:37:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oOg3PmaW; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49WJ5Q0jHhz8sxL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 12:37:14 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49WJ5P6h1cz9sSt; Tue, 26 May 2020 12:37:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oOg3PmaW; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49WJ5P68YWz9sSs
 for <linuxppc-dev@ozlabs.org>; Tue, 26 May 2020 12:37:13 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id h7so15149823otr.3
 for <linuxppc-dev@ozlabs.org>; Mon, 25 May 2020 19:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iX25KaYxLGCAJf4jfpjLV8MVCur8Xn9EfMDu1j5KCYg=;
 b=oOg3PmaWeuL0i2LK/4ZblmHuk9MaydSKfEHvbQp1W8fnksEcGSy4B/dNfAP4d26LIt
 OGj1FFqlTqwd7DKmaDX8Jtnbt1p5i3byL2pcLOPIGP/9sh+qUTe9YNK69djvvB121BWZ
 SDmqRyAsGaBfX6se7Gn0VJJCJsMmdo4kya9zVIH7U5t4qXQrc+VAJ5IPYE3TqTtpVDoY
 2krpGTgjjnoLFKeNPjdSDNH/1/rYqu0bRERK8sTb9VcNBEQ4Rw5JZd9v82mof6qCRZDD
 pdGcr1wlswxj1RiCg589qqUPddC+4XNgNJWqs5oz6J/5Uef4r0M1ktCP+vj70WlrR7T+
 U9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iX25KaYxLGCAJf4jfpjLV8MVCur8Xn9EfMDu1j5KCYg=;
 b=nGV3xK+vD6wtVYgYRSqRUvtfNiqDVqxlUTZ9jweWZ3YnAOGxFY1tD/O4zT78gEammE
 dEO/biN4TEi8Rw66Rql+yXacGNozhFy0kqgw7qHugfaI85niMWGP4j0CvyedpqEdazNx
 GaOgi1lkQkOSmsJlsgGFWINC2/it+91FUvTiOWs2K0m4qH2I3ApAdqVR/2m4h760cLNw
 18OlTzRyfJocSGvrOjbEq6gT37FyBYJtXWTDE5NPQS8tT5F9CI47Mjvs3/eNSfXC+QMv
 OnpkRq6Y/PI2B+nogFAWyhY3NBsIWqE3L68QrqPOgUmCL99q4la49S/6nQEkDCeJbMXf
 qzfQ==
X-Gm-Message-State: AOAM533v7abhIDF4ba6y3O4AuXCItXE5Ge8qlKTykvpDHpdwl4+5nB+i
 4swqWpMAFWXAAoZLRK++qbU34DanG0t8ogXnc/zdzI+4wW8=
X-Google-Smtp-Source: ABdhPJwd00q4GoPiLuy5ZT363bI7MtpOq5xdrdyf4XPEp7LTYz4/TAGM/EmnHSa0OUvaZWKxUM5as6yFU9f8dofmWes=
X-Received: by 2002:a9d:220c:: with SMTP id o12mr24819228ota.155.1590460630335; 
 Mon, 25 May 2020 19:37:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200525055004.2182328-1-mpe@ellerman.id.au>
In-Reply-To: <20200525055004.2182328-1-mpe@ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 26 May 2020 12:36:59 +1000
Message-ID: <CACzsE9r-gUUYFxfZov+KXpMVx=YpS+oS4fff=tjWTEUkWPJ3Lw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Add ppc_inst_as_u64()
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 25, 2020 at 3:49 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> The code patching code wants to get the value of a struct ppc_inst as
Might need to change the wording here as it also gets used in
arch_prepare_optimized_kprobe()
> a u64 when the instruction is prefixed, so we can pass the u64 down to
> __put_user_asm() and write it with a single store.
>
> This is a bit awkward because the value differs based on the CPU
> endianness, so add a helper to do the conversion.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/inst.h  | 9 +++++++++
>  arch/powerpc/kernel/optprobes.c  | 3 +--
>  arch/powerpc/lib/code-patching.c | 8 +-------
>  3 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> index d82e0c99cfa1..d61e07fb2937 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -100,6 +100,15 @@ static inline int ppc_inst_len(struct ppc_inst x)
>         return ppc_inst_prefixed(x) ? 8 : 4;
>  }
>
> +static inline u64 ppc_inst_as_u64(struct ppc_inst x)
> +{
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> +       return (u64)ppc_inst_suffix(x) << 32 | ppc_inst_val(x);
> +#else
> +       return (u64)ppc_inst_val(x) << 32 | ppc_inst_suffix(x);
> +#endif
> +}
> +
>  int probe_user_read_inst(struct ppc_inst *inst,
>                          struct ppc_inst __user *nip);
>
> diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
> index 3ac105e7faae..69bfe96884e2 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -283,8 +283,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
>          * 3. load instruction to be emulated into relevant register, and
>          */
>         temp = ppc_inst_read((struct ppc_inst *)p->ainsn.insn);
> -       patch_imm64_load_insns(ppc_inst_val(temp) | ((u64)ppc_inst_suffix(temp) << 32),
> -                              4, buff + TMPL_INSN_IDX);
> +       patch_imm64_load_insns(ppc_inst_as_u64(temp), 4, buff + TMPL_INSN_IDX);
>
>         /*
>          * 4. branch back from trampoline
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index 64cf621e5b00..5ecf0d635a8d 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -27,13 +27,7 @@ static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst instr
>         if (!ppc_inst_prefixed(instr)) {
>                 __put_user_asm(ppc_inst_val(instr), patch_addr, err, "stw");
>         } else {
> -#ifdef CONFIG_CPU_LITTLE_ENDIAN
> -               __put_user_asm((u64)ppc_inst_suffix(instr) << 32 |
> -                              ppc_inst_val(instr), patch_addr, err, "std");
> -#else
> -               __put_user_asm((u64)ppc_inst_val(instr) << 32 |
> -                              ppc_inst_suffix(instr), patch_addr, err, "std");
> -#endif
> +               __put_user_asm(ppc_inst_as_u64(instr), patch_addr, err, "std");
>         }
>
>         if (err)
> --
> 2.25.1
>
I booted a BE and LE kernel - test_prefixed_patching() worked on both.
Also on BE and LE kernels I put optprobes on prefixed and non prefixed
instructions.
The correct value was passed via r4 to emulate_step().

Tested-by: Jordan Niethe <jniethe5@gmail.com>
