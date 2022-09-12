Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA45B5757
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 11:43:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR1r714tFz3bhf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 19:43:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ceCsSf5a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ceCsSf5a;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR1qR4gzTz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 19:42:57 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id y136so8076540pfb.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 02:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=YjFOf+QZDvsguJD6uiUwl5wsFwXVQGyEcauZFQT7QcA=;
        b=ceCsSf5aUmp0AF/vhwUecNa0aPg+HwzbMZbLCsScn217VzxRWQLhMGY19zHUliJ08c
         rr1MBP7Er6QSkXXPokY+omn2fSHw+OVxWB5LyATzQoGX88Ajt7pYa+5hGFTF0/wxbmsU
         zpxx5u/YvR3HQYhTKsYO5O6hbcD4Pwbk2YSYsRwZ3XR2Quke/n0iMRbjc7sxKEUVz9UX
         xvLEMFUIDe5Hq0D+qIc4wKo2/wBMLuBFw/NPWs0VTw1qgzXH2+FMNWZ/qHibf7b45OHH
         uhHhvorNynKBIATkYUQ+QH7SfINCR8ezShOeOiIP3PSDExNaJ5Q7qhCVN26+f30YS5VC
         MX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=YjFOf+QZDvsguJD6uiUwl5wsFwXVQGyEcauZFQT7QcA=;
        b=wk5cW3LavEqg8jtbSNtu2TRI0Qruve9dLuC6Hej1/fiOiMD1LvNYJ55dA3cqlnIjhT
         f4pFE7tWjFQXqX+8sW9AH5xl5UNKgKNDv7gsgQlNKtFJDd7NQBbaTbZqesBw0Vk6GF5i
         q82Dukb97RTRlxh1eOgkNit8VENej7JJulVoAWeNqtgIe4jGGB2cglERb9lWFCJ+9CQE
         nBmkinW6SnpnxZ8vah/yvpzXjMxFrFIJNlKEO6bDikdWNJTw1INtCZDgl2bXcu4n9PTH
         S5wCtljHO4Zrxjr2BRHaskUMCGHNAEWk48X4R3Q0aH9PwhKgA0i6NQ7L1+qsdOxKwogV
         aC7w==
X-Gm-Message-State: ACgBeo2tPbdT64F+YkC2HFpBgLi6nQOJc7HAvmS/hYTAlhI/LbY6hPua
	4e6YP5xisEp4ax6cDdBOjPA=
X-Google-Smtp-Source: AA6agR4nc/Ay4MJ9God5dF2jOjFUcm4CFUB5bP1AhWfgLI4QJ6qf9RkLz10V30Xr3vKOjZmsYRuJ1Q==
X-Received: by 2002:a63:4a1e:0:b0:438:fa59:c0f3 with SMTP id x30-20020a634a1e000000b00438fa59c0f3mr3868555pga.107.1662975774526;
        Mon, 12 Sep 2022 02:42:54 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id 9-20020a630a09000000b00434ea8956f6sm5141757pgk.3.2022.09.12.02.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 02:42:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 19:42:49 +1000
Message-Id: <CMUBPLVNQ20M.17MH4E1U3AY7Y@bobo>
Subject: Re: [PATCH v4 05/20] powerpc: Remove direct call to personality
 syscall handler
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-6-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-6-rmclure@linux.ibm.com>
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

On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
> Syscall handlers should not be invoked internally by their symbol names,
> as these symbols defined by the architecture-defined SYSCALL_DEFINE
> macro. Fortunately, in the case of ppc64_personality, its call to
> sys_personality can be replaced with an invocation to the
> equivalent ksys_personality inline helper in <linux/syscalls.h>.

Huh. I wonder why sys_personality doesn't just call ksys_personality
too. Anyway this looks good.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Several of your steps like this one look like they apply to other archs
as well. You might consider ccing linux-arch for some of these.

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Use inline helper to deduplicate bodies in compat/regular
> implementations.
> V3 -> V4: Move to be applied before syscall wrapper.
> ---
>  arch/powerpc/kernel/syscalls.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscall=
s.c
> index 9f29e451e2de..b8461128c8f7 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -71,7 +71,7 @@ static inline long do_ppc64_personality(unsigned long p=
ersonality)
>  	if (personality(current->personality) =3D=3D PER_LINUX32
>  	    && personality(personality) =3D=3D PER_LINUX)
>  		personality =3D (personality & ~PER_MASK) | PER_LINUX32;
> -	ret =3D sys_personality(personality);
> +	ret =3D ksys_personality(personality);
>  	if (personality(ret) =3D=3D PER_LINUX32)
>  		ret =3D (ret & ~PER_MASK) | PER_LINUX;
>  	return ret;
> --=20
> 2.34.1

