Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F04611BD2BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 04:59:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BjsR2vrfzDr1c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 12:59:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BbYoYynq; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bjqw1CTRzDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 12:58:04 +1000 (AEST)
Received: by mail-oi1-x241.google.com with SMTP id o24so542351oic.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 19:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sb9oygUj8hRo/IXf7I5lpmScyZt3WR/iNs7z0RHeB1U=;
 b=BbYoYynqp9Y3+Cx8TAmBbDp940Pyw5om5zkGC8bFfbIru68/38BRriy3XZebg2EycC
 VDv2TL5b7D33tgcGTAXD6qg0IVlHe5EBNrPiIpsVqeNEJMHx7n4kgQgGMZyKV5BHgnZR
 FgwulYN3tJDDN4gZef7nN7q3Pw6whYNLPOrzjjzHCON7lhdUPy93lGe2f/fwMUQ23Crk
 M+lq3bd3LGkKeloZkT/nNIPKhdIdglKI9eG6HGU026XDETL1jHdiCKZnyT6zh0eIWr1C
 rMxw2bCsAlE70WglZUYCW1bHqMEi6PgL70pcIo90XiCCjJ8bSERoSWfa8hjK79AMd+nX
 tZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sb9oygUj8hRo/IXf7I5lpmScyZt3WR/iNs7z0RHeB1U=;
 b=n1o+hwd91y8sr1QwS+6hM/6qDCSd+4CpqWij9Me4SR/zPOVhJAK5Q8PfNRqLSeVFfG
 lDOegWqiQmuKgX1DXxTGPcp3FnlExz7lc3dD6Ym2bb4Nooh5eke7c2AwRHQHZZ4zb4Ja
 rWc7j2UKiXLxAAnKKqcoARrT8BaOxG99Mwoa1CSn2rX6hCz/pJL5Ghah9wDKNhkLryt9
 0vPH7WsNvjUS9oDnf8O2bxRvfvrmqf27czosBIthSHGORCoewZ3NP8mR7VKSknVqzu99
 3oDA6Ja74DIHDGMjY8QpScROcNLJqWxA5M7J7bxxLPqKmxsdhOie3zZmuixgpTaFGdaB
 RUeA==
X-Gm-Message-State: AGi0Pubv7dwBB9Pdb4BKEB13LIjvTa0Jrn8BnMA++pfx0wm+ULBVM3lu
 lLNNHu5nXiuSztboILGabs/i++DB51isvg6Odfs=
X-Google-Smtp-Source: APiQypJMewNN6zngNB/NYLs3wFpTfJ2Z8RVbZGHeTqLlqdnNu7GDtt1miQESr/Zii7sfj40i5GEVh/j9Qz7dQzPuY3k=
X-Received: by 2002:aca:eb88:: with SMTP id j130mr347736oih.12.1588129080793; 
 Tue, 28 Apr 2020 19:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200428015814.15380-1-jniethe5@gmail.com>
 <20200428015814.15380-12-jniethe5@gmail.com>
 <2014493.21tHG7dN9E@townsend>
In-Reply-To: <2014493.21tHG7dN9E@townsend>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 29 Apr 2020 12:57:49 +1000
Message-ID: <CACzsE9qeu9odEwB8bdf-w3rb_BAoFDeXXZ1tejSU25uMDKGn3g@mail.gmail.com>
Subject: Re: [PATCH v6 11/28] powerpc: Use a datatype for instructions
To: Alistair Popple <alistair@popple.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 29, 2020 at 12:02 PM Alistair Popple <alistair@popple.id.au> wrote:
>
> Hi Jordan,
>
> I needed the below fix for building with CONFIG_STRICT_KERNEL_RWX enabled.
> Hopefully it's correct, I have not yet had a chance to test it beyond building
> it.
Thanks, I'll get that working.
>
> - Alistair
>
> ---
>  arch/powerpc/lib/code-patching.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
> patching.c
> index ad5754c5f007..a8c8ffdb1ccd 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -166,8 +166,8 @@ static int do_patch_instruction(struct ppc_inst *addr,
> struct ppc_inst instr)
>                 goto out;
>         }
>
> -       patch_addr = (unsigned int *)(text_poke_addr) +
> -                       ((kaddr & ~PAGE_MASK) / sizeof(unsigned int));
> +       patch_addr = (struct ppc_inst *)(text_poke_addr) +
> +               ((kaddr & ~PAGE_MASK) / sizeof(unsigned int));
Hmm, I think this might not give the expected result, with struct
ppc_inst being 8 long, compared to unsigned int being 4 long.
So the pointer arithmetic will not give the patch_addr you would expecting.

>
>         __patch_instruction(addr, instr, patch_addr);
>
> --
> 2.20.1
>
>
>
>
