Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF25539B6F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 05:03:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCYrM3TXQz3bmt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 13:03:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ToN7Mw+w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ToN7Mw+w;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCYqj0BCXz2ywN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 13:03:10 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id w2-20020a17090ac98200b001e0519fe5a8so742271pjt.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 20:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VruUXxZuB29SSfKbT0BHA1r5CfD3X/4kJhuEclwdGXU=;
        b=ToN7Mw+wpsQC6AgudX6VDdEHWTR8BwPGLYzXluWBLO2O9CRz48vyeW2sKBaARJeFfl
         fGd6JTDZzRAgG8MAnWGZnCJRYgMt3joQ7cj8qrZEOejESMASs/dKY6ltUcQ7ULzguYk3
         0IrXoyh+HzfjvnWbv28dfgX+8fEAmhj3haeoVCOUu+Th8sG0ooX6H3oGl6LgC/1e0xnT
         uvXWWz1S5KJ5X9+se7CoQvr5NUbIuz9D3iDua3u7qFFiH6vsa+utoBbYNgtSb6ctNSSI
         G5ybofM9ucN7VtpaGO7Sf9Mr8mrBcCybVN+jdJFH7S/2XusjITIwIVQMuEZCrfOiDBNI
         nlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VruUXxZuB29SSfKbT0BHA1r5CfD3X/4kJhuEclwdGXU=;
        b=arbXtOibwRYRgc108hanRdV1gzbzQBm76JeptQejajXhzU2/2ZNSHxfGClYYG39qPM
         cgl/LCtnc4vvi+tXmGrFmklRHKbTVwVOUFKO5EYnpDlWbGj8dC/pe3gUscAUA+E2UVgC
         IKtW9m/UfdpXryve8PmSwEjW6n6KBEgZc5trA+sTmIU/YHMGtD+ukY/KACg61O5W7Gcw
         ihXNb3K69jDFoPZ+oqCthjwNtA6tiU9ajbEcVA2L74h0QWb/z3jz5Fp+eILmBcaPaNhy
         cBmvmL3uMq8Ppd2r/WTk/QFHDJqDYBAUHdJ10g4+Yf1Pq5x7eLmPYFotwpsYcNTmICYC
         pxsg==
X-Gm-Message-State: AOAM531cU5d8kyKv8QA5oRDmnI9LXUzweyLxfQA7GTo5l4eYogFMPbq2
	MirBAAm5uX2LoMjE4/cEd5SNGwCyanhEog==
X-Google-Smtp-Source: ABdhPJy+4OZUqnKETbQrjvhDDEx0VGwbPeswMmuhwUzn6OnClBClpiPQZAXUMpXFm3pVRay9Ur1twg==
X-Received: by 2002:a17:903:31d1:b0:159:804:e852 with SMTP id v17-20020a17090331d100b001590804e852mr63680630ple.19.1654052588035;
        Tue, 31 May 2022 20:03:08 -0700 (PDT)
Received: from localhost (subs03-180-214-233-86.three.co.id. [180.214.233.86])
        by smtp.gmail.com with ESMTPSA id iw4-20020a170903044400b0015e8d4eb20esm248894plb.88.2022.05.31.20.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 20:03:07 -0700 (PDT)
Date: Wed, 1 Jun 2022 10:03:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Drop ppc_inst_as_str()
Message-ID: <YpbW6fNSGx6s9yJ+@debian.me>
References: <20220531065936.3674348-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220531065936.3674348-1-mpe@ellerman.id.au>
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
Cc: jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Tue, May 31, 2022 at 04:59:36PM +1000, Michael Ellerman wrote:
> The ppc_inst_as_str() macro tries to make printing variable length,
> aka "prefixed", instructions convenient. It mostly succeeds, but it does
> hide an on-stack buffer, which triggers stack protector.
> 
> More problematically it doesn't compile at all with GCC 12, due to the
> fact that it returns the char buffer declared inside the macro:
> 
>   arch/powerpc/kernel/trace/ftrace.c: In function '__ftrace_modify_call':
>   ./include/linux/printk.h:475:44: error: using a dangling pointer to '__str' [-Werror=dangling-pointer=]
>     475 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>     ...
>   arch/powerpc/kernel/trace/ftrace.c:567:17: note: in expansion of macro 'pr_err'
>     567 |                 pr_err("Not expected bl: opcode is %s\n", ppc_inst_as_str(op));
>         |                 ^~~~~~
>   ./arch/powerpc/include/asm/inst.h:156:14: note: '__str' declared here
>     156 |         char __str[PPC_INST_STR_LEN];   \
>         |              ^~~~~
> 
> This could be fixed by having the caller declare the buffer, but in some
> places there'd need to be two buffers. In all cases where
> ppc_inst_as_str() is used the output is not really meant for user
> consumption, it's almost always indicative of a kernel bug.
> 
> A simpler solution is to just print the value as an unsigned long. For
> normal instructions the output is identical. For prefixed instructions
> the value is printed as a single 64-bit quantity, whereas previously the
> low half was printed first. But that is good enough for debug output,
> especially as prefixed instructions will be rare in practice.
> 
> Old:
>   c000000000111170  60420000      ori     r2,r2,0
>   c000000000111174  04100001 e580fb00     .long 0xe580fb0004100001
> 
> New:
>   c00000000010f90c  60420000      ori     r2,r2,0
>   c00000000010f910  e580fb0004100001      .long 0xe580fb0004100001
> 
> Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Reported-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

The arch/powerpc/kernel/trace/ftrace.c builds successfully, however
there is also other build error for which I have reported at [1].

Thanks.

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

[1]: https://lore.kernel.org/linuxppc-dev/YpbUcPrm61RLIiZF@debian.me/

-- 
An old man doll... just what I always wanted! - Clara
