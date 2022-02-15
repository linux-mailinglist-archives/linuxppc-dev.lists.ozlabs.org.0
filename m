Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16AF4B602B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 02:50:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyPDg0GTGz3c5j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 12:50:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iaQxBnfn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b33;
 helo=mail-yb1-xb33.google.com; envelope-from=wedsonaf@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=iaQxBnfn; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyPD36cyMz3bTP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 12:49:54 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id 124so23496678ybn.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 17:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FJj1WBzKHeHq7xycI/vstmM3MgrQelS5LPmPdKG2Z3E=;
 b=iaQxBnfnmpmtqAOkM7vQnm9gu8pVdJjB1Um1XNTsT9hdbvwpt5VzEy/ogrvfM3wL1A
 luQdviok/PdDEqUlA9cE8BlDs5K/BgMcoD78ezH7jmwmLR7vf1GbbweN4gP1RrOHo+Zv
 UC+bgIuZ03xtmldU0X1lOtFQMzFB2Y9EXluB5hO/ZJ3fzBqK/zsoWyH4XQC4zxl0TdzA
 NhgzVCFB/zSvHiG/CKPYpkqEI8JwNNTYU4dYEJTTZcumGx4+xempMO/Z0DZw55Bw+Rev
 EsYTPMAo9auvX8eLThdp5uz1iUizJ2bVPBdRGDCxWGg/Y2tWfe539o4fljMND/rGE6bs
 zGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FJj1WBzKHeHq7xycI/vstmM3MgrQelS5LPmPdKG2Z3E=;
 b=fyLVM1Z1lqMru1qu7W3B7Eds1ISa8ffi3tqwWrIEOmccJh+T8pUPHta93okd3HxtVG
 p7LKaNG2h6zsARJxhyLTvN2teTWXR/K9THw+F22/t1aRnBEl+Wu/ZqsbGgbylbpRLYQV
 rTLgZiU4nhdmSb1wodzahO38Iazik6kBME5zFQYBANAD/MUIWtPF69cAIEzwxv1Ezln9
 LYcDUpp/pK8Hk8bhOinRMSJ31RcNp0ELheEmzR33Mz7vDz2g5fOJlgUcCUnxLNycW5Cb
 xDUflPDbId1tSExR6CsF4agCMr2a0eRT+QvrWgYvhyjWYlyFEtaPC6UifPMciTa2I1L/
 5H0A==
X-Gm-Message-State: AOAM5312vS7iLovD8AzS3iORRonXVSolG7BhCm+VocFSq+dnf06TjHxX
 vD+nxqCtiVQ8YCNlUrDNLazVSZrbBCGaumnnaQMx
X-Google-Smtp-Source: ABdhPJy+H1L4z3tZTUtJLjIPjqTxMpQkQuBqADy+loxDTVrSCqFR3Jj29hjSCFtNNnzq0gZZW1arF/8sOQO5i1aMwEw=
X-Received: by 2002:a5b:443:: with SMTP id s3mr1797685ybp.117.1644889790701;
 Mon, 14 Feb 2022 17:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20220202055123.2144842-1-wedsonaf@google.com>
In-Reply-To: <20220202055123.2144842-1-wedsonaf@google.com>
From: Wedson Almeida Filho <wedsonaf@google.com>
Date: Tue, 15 Feb 2022 01:49:39 +0000
Message-ID: <CAMKQLN+Q3asVqP3MZVFZO66CvZVVfGOZn=pMXmiNqZ7t2i55wg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/module_64: use module_init_section instead of
 patching names
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Wed, 2 Feb 2022 at 05:53, Wedson Almeida Filho <wedsonaf@google.com> wrote:
>
> Without this patch, module init sections are disabled by patching their
> names in arch-specific code when they're loaded (which prevents code in
> layout_sections from finding init sections). This patch uses the new
> arch-specific module_init_section instead.
>
> This allows modules that have .init_array sections to have the
> initialisers properly called (on load, before init). Without this patch,
> the initialisers are not called because .init_array is renamed to
> _init_array, and thus isn't found by code in find_module_sections().
>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> ---
>  arch/powerpc/kernel/module_64.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index 5d77d3f5fbb5..6a45e6ddbe58 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -277,6 +277,12 @@ static Elf64_Sym *find_dot_toc(Elf64_Shdr *sechdrs,
>         return NULL;
>  }
>
> +bool module_init_section(const char *name)
> +{
> +       /* We don't handle .init for the moment: always return false. */
> +       return false;
> +}
> +
>  int module_frob_arch_sections(Elf64_Ehdr *hdr,
>                               Elf64_Shdr *sechdrs,
>                               char *secstrings,
> @@ -286,7 +292,6 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
>
>         /* Find .toc and .stubs sections, symtab and strtab */
>         for (i = 1; i < hdr->e_shnum; i++) {
> -               char *p;
>                 if (strcmp(secstrings + sechdrs[i].sh_name, ".stubs") == 0)
>                         me->arch.stubs_section = i;
>                 else if (strcmp(secstrings + sechdrs[i].sh_name, ".toc") == 0) {
> @@ -298,10 +303,6 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
>                         dedotify_versions((void *)hdr + sechdrs[i].sh_offset,
>                                           sechdrs[i].sh_size);
>
> -               /* We don't handle .init for the moment: rename to _init */
> -               while ((p = strstr(secstrings + sechdrs[i].sh_name, ".init")))
> -                       p[0] = '_';
> -
>                 if (sechdrs[i].sh_type == SHT_SYMTAB)
>                         dedotify((void *)hdr + sechdrs[i].sh_offset,
>                                  sechdrs[i].sh_size / sizeof(Elf64_Sym),
> --
> 2.35.0.rc2.247.g8bbb082509-goog

Would any additional clarification from my part be helpful here?

I got an email saying it was under review (and checks passed) but
nothing appears to have happened since.

Cheers,
-Wedson
