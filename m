Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D21242E3C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 23:46:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVjdN5wtMz3c5S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 08:46:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=XqUQLpCs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=XqUQLpCs; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVjck4Rcdz2yLV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 08:45:25 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 66so6715023pgc.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 14:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=4GrPc7FGyCnCD/UjuDxp/izjM7wkRrx7pBgnvNh8AfA=;
 b=XqUQLpCs2S/h/ceVWU2JHhlb+0n6xx80AR84zM1fbTXyJpTTdz7naNXuSISe0OmVPh
 NjZ/D/TD0ZH2RQIVG7s4CPqlOO1tq69oTkrFSh1I9LXUEVLqPBgSqyhAGps/jJj4ZA4P
 vglf7c8/7+vfhlwsZ4SeyOpGpkDyS0m7q2pnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=4GrPc7FGyCnCD/UjuDxp/izjM7wkRrx7pBgnvNh8AfA=;
 b=GVNDIH7qeiGnL2VLjcYxT86RvorvAtGVO6H+8fCRztWfUrW8Tm356i/IUEW6uYELAv
 jsa/nDb27FsL43XkUXvaMm9e15WvtReV6IzrMNlBd4wRMN3IhqnfMHFXctZuY9hf4iHa
 oVgEG2aDOXfK4nc8TmjC6jyBzZvj6lli4OY7O/W52CMjWWNVHB2f0neRVPAfsopgyhg2
 4jzQsECjJYdboAUlDq4TtXzkWQL0OuHhCjF2ovgFPERqrMzWAPdTgP9LMJhg6VDFsVSe
 siEZOzND//C4uIHq2gBkwnHcUOub0zO43Sc/lvtMbKW0cun8DsA5LZA7z0WbuBIlfVAm
 6PRA==
X-Gm-Message-State: AOAM532UsFMjVm4S7QMAy6cj+saJsmxVKWHuWvpOapnh0ZZRFaYKobSr
 Uq2v5tpCCuSCtUIRrYWENxNPbg==
X-Google-Smtp-Source: ABdhPJxS8/zOn3bSDjYQg+GZqWOsdaDA+H+My597hv01n1JtKvTgaMjIuZ//mrufBDPiNL/OIH5zxA==
X-Received: by 2002:a63:dc42:: with SMTP id f2mr6272407pgj.152.1634247922841; 
 Thu, 14 Oct 2021 14:45:22 -0700 (PDT)
Received: from localhost ([2001:4479:e300:600:4901:2fb9:ed97:3a3e])
 by smtp.gmail.com with ESMTPSA id s62sm3366448pgc.5.2021.10.14.14.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 14:45:22 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Andrew Morton <akpm@linux-foundation.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>, Kees Cook
 <keescook@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 02/13] powerpc: Rename 'funcaddr' to 'addr' in
 'struct ppc64_opd_entry'
In-Reply-To: <49f59a8bf2c4d95cfaa03bd3dd3c1569822ad6ba.1634190022.git.christophe.leroy@csgroup.eu>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <49f59a8bf2c4d95cfaa03bd3dd3c1569822ad6ba.1634190022.git.christophe.leroy@csgroup.eu>
Date: Fri, 15 Oct 2021 08:45:19 +1100
Message-ID: <877def46xc.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> There are three architectures with function descriptors, try to
> have common names for the address they contain in order to
> refactor some functions into generic functions later.
>
> powerpc has 'funcaddr'
> ia64 has 'ip'
> parisc has 'addr'
>
> Vote for 'addr' and update 'struct ppc64_opd_entry' accordingly.

I would have picked 'funcaddr', but at least 'addr' is better than 'ip'!
And I agree that consistency, and then making things generic is worthwhile.

I grepped the latest powerpc/next for uses of 'funcaddr'. There were 5,
your patch changes all 5.

The series passes build tests and this patch has no checkpatch or other
style concerns.

On that basis:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/elf.h      | 2 +-
>  arch/powerpc/include/asm/sections.h | 2 +-
>  arch/powerpc/kernel/module_64.c     | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/elf.h
> index a4406714c060..bb0f278f9ed4 100644
> --- a/arch/powerpc/include/asm/elf.h
> +++ b/arch/powerpc/include/asm/elf.h
> @@ -178,7 +178,7 @@ void relocate(unsigned long final_address);
>  
>  /* There's actually a third entry here, but it's unused */
>  struct ppc64_opd_entry {
> -	unsigned long funcaddr;
> +	unsigned long addr;
>  	unsigned long r2;
>  };
>  
> diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
> index 6e4af4492a14..32e7035863ac 100644
> --- a/arch/powerpc/include/asm/sections.h
> +++ b/arch/powerpc/include/asm/sections.h
> @@ -77,7 +77,7 @@ static inline void *dereference_function_descriptor(void *ptr)
>  	struct ppc64_opd_entry *desc = ptr;
>  	void *p;
>  
> -	if (!get_kernel_nofault(p, (void *)&desc->funcaddr))
> +	if (!get_kernel_nofault(p, (void *)&desc->addr))
>  		ptr = p;
>  	return ptr;
>  }
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index 6baa676e7cb6..82908c9be627 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -72,11 +72,11 @@ static func_desc_t func_desc(unsigned long addr)
>  }
>  static unsigned long func_addr(unsigned long addr)
>  {
> -	return func_desc(addr).funcaddr;
> +	return func_desc(addr).addr;
>  }
>  static unsigned long stub_func_addr(func_desc_t func)
>  {
> -	return func.funcaddr;
> +	return func.addr;
>  }
>  static unsigned int local_entry_offset(const Elf64_Sym *sym)
>  {
> @@ -187,7 +187,7 @@ static int relacmp(const void *_x, const void *_y)
>  static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
>  				    const Elf64_Shdr *sechdrs)
>  {
> -	/* One extra reloc so it's always 0-funcaddr terminated */
> +	/* One extra reloc so it's always 0-addr terminated */
>  	unsigned long relocs = 1;
>  	unsigned i;
>  
> -- 
> 2.31.1
