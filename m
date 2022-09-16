Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 688B35BA3C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 03:12:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTGJX27klz3bkl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 11:12:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bGsCApaq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bGsCApaq;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTGHs3Tzzz304v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 11:11:53 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id t70so18910365pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 18:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=HzrwbV0PQ9QQxR4YQxIUuhNcfwnMak6+9/bNZvMUC+w=;
        b=bGsCApaqLzH17EQ36wwTW3B4f/QLDw3blT8YHxmaYVbWd2c+qMZpUY6exbDuSEeKQ6
         7HBXRpvYJFTE9H5O5ped427GIXjB5vIpEh4cj/VKxEcT5gk2TBb/F1ywT76NU8uVeHIM
         NZEw20Pv9euApSaaMY4dSPZ2uPsFO7zlsETzZyw49RM26bVR7zg7S0XeTk83s/fkUFej
         yy7d/0mduFkMc8rmGA9nugpqFUYniKbQIT7Lx3o6Vt5Gcz9BWxDiaWmrvz9QccmpuWdN
         sq1b3z9aZGf46n5mcHog2bGO0S4VZfcqI6gUjOPs6WdVRyguYNpIofjel3Ls/MKA3jqw
         StyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=HzrwbV0PQ9QQxR4YQxIUuhNcfwnMak6+9/bNZvMUC+w=;
        b=i8vKIKnZp/Xur9dwtrUyTpiIoREjZ7NhBCSyGr/45KZIyjg3r//UCcN2LwDgv0NkXd
         Yc/1GDofa1LW7RU2yfS1w9IAXCw5PoOaLgPv8i8X2ExSeDCqybJusG/ggv/pNue8wx/8
         3kD78Dx5Bt1Alr9a7735qot94HY/C5LYywH84CUMUWn8ZVDd5AsvUft/sBRNVZRb0QSP
         E39vjnTjyQ6Rohs5e5tNKOXxEXE7r5B+bVTjsl44P4GCbqUxOJMfXZT5RQ53ASzfVfhC
         7nGsh8lIIopvQ8t7tT6FQwU9Tti83KD8/3yquASkcjH3vNYldxZg+U3HLRYC43/bkrcY
         VGag==
X-Gm-Message-State: ACrzQf37+OeNJxUsECjuXeEXIcUQLHHMUm6Rc64TOCGjjW/PyABvg8sf
	WnRPQr+lQTL5CY4xBjkp9Ug=
X-Google-Smtp-Source: AMsMyM4SFjsmeT+NUCD4KaNgS18jNA5eQKZj2EU1Th96ZvAL4NtaM/bTuqO34fl924MA/kDyIjHBhQ==
X-Received: by 2002:a63:f446:0:b0:42a:a729:18f0 with SMTP id p6-20020a63f446000000b0042aa72918f0mr2215790pgk.589.1663290710259;
        Thu, 15 Sep 2022 18:11:50 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id t2-20020a634442000000b0043057fe66c0sm12301114pgk.48.2022.09.15.18.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 18:11:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Sep 2022 11:11:43 +1000
Message-Id: <CMXFCGO3971M.1KAV9C8T8F14P@bobo>
To: "Michael Ellerman" <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/64: Remove unused SYS_CALL_TABLE symbol
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220913124545.2817825-1-mpe@ellerman.id.au>
In-Reply-To: <20220913124545.2817825-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Sep 13, 2022 at 10:45 PM AEST, Michael Ellerman wrote:
> In interrupt_64.S, formerly entry_64.S, there are two toc entries
> created for sys_call_table and compat_sys_call_table.
>
> These are no longer used, since the system call entry was converted from
> asm to C, so remove them.
>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> Fixes: 68b34588e202 ("powerpc/64/sycall: Implement syscall entry/exit log=
ic in C")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/interrupt_64.S | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/int=
errupt_64.S
> index f9ee93e3a0d3..0093a6b6b1e1 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -13,16 +13,6 @@
>  #include <asm/ppc_asm.h>
>  #include <asm/ptrace.h>
> =20
> -	.section	".toc","aw"
> -SYS_CALL_TABLE:
> -	.tc sys_call_table[TC],sys_call_table
> -
> -#ifdef CONFIG_COMPAT
> -COMPAT_SYS_CALL_TABLE:
> -	.tc compat_sys_call_table[TC],compat_sys_call_table
> -#endif
> -	.previous
> -
>  	.align 7
> =20
>  .macro DEBUG_SRR_VALID srr
> --=20
> 2.37.2

