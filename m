Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 967C3314589
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 02:23:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZQBJ6b0wzDvXv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 12:23:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QbCjiqa1; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZQ6k4pb4zDvVk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 12:19:58 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id u11so8802119plg.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 17:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=t54yD33kVzyBqW7tMjZSfob5XimxFTzloqgNh2ZBkpc=;
 b=QbCjiqa1GR9ANuY9aAYxYU2y3FOXpTUKG5caTMncO1rAvEg+YCngOgjLN9F6HHkH08
 4VDBP1nG3zkWzSDRrLE0tWi2QH4GFwHwcncu1SsB9qRhVIu9JXFS/8hF0ZeEI1Y45E1D
 Ueig+tWKnjicLCY3AHxO7FzGOIR3t4vAVK/oEnwzTZLLzUBh3guBmW9f2d8EhJCnc/Uy
 gQYYF7eVgGqj2G0WMg8AtATPzpiSNc9IkxyoxxyLD9Ga0ahGqSxmAVPDg5NQVb3txUIp
 glaN2lp5SpNdZuZugCN85gO9kY7HCAlw6+8Rr0BZgSWL9+DUcIIpqW/Dqt0iJG5+fzlh
 16Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=t54yD33kVzyBqW7tMjZSfob5XimxFTzloqgNh2ZBkpc=;
 b=sau8tIDAvJKMhsaC6XMVpvBXznI6AyCPSxTbA3i9HjGjswXwAOZ8vi3lncWRPYVokz
 S9U3kKmtizDk1MK2vqV/onwPAmxIwjHz5bKhTfV4k8Ev5exQTZ0UxU9mpvezf69NUPLu
 PG/p9EzIvzDv+RqSp4Emx4zs3yDeHj+hn+ilK7AWBfpqG/2vzt8ZBBQ9oX3s6wItjoNa
 t+QMyBlcEeHR/338EzLBy2YHkkv0G88mkp1kuVCcXtUyc/2QtjLeOY31v6ReG4LAplRY
 6Y35B19Oc6yAi5BeGwoLU/+01XMbUQsp4ARJAUEVgqU/Qy4AAzup0ISiFB+H7oiV7AVf
 bFCg==
X-Gm-Message-State: AOAM531X6LF5EFLiPTEKk1dJgCLz1qOlEnxgi7xt5hrDWhGMjj598FDT
 Qy3LGqZ3vdq7aCV/FCUEr0g=
X-Google-Smtp-Source: ABdhPJxNYfPLoE77uKkmqyRjXbZzA6/RT6tUkJ1p3/P+GtVV2HMvYxEnZdxsS6R3Mjya3q337Teg2Q==
X-Received: by 2002:a17:903:18c:b029:e1:f4f0:dc26 with SMTP id
 z12-20020a170903018cb02900e1f4f0dc26mr18862677plg.22.1612833596415; 
 Mon, 08 Feb 2021 17:19:56 -0800 (PST)
Received: from localhost ([220.240.226.199])
 by smtp.gmail.com with ESMTPSA id 3sm230108pjk.26.2021.02.08.17.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 17:19:55 -0800 (PST)
Date: Tue, 09 Feb 2021 11:19:50 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 08/22] powerpc/syscall: Rename syscall_64.c into
 interrupt.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <cddc2deaa8f049d3ec419738e69804934919b935.1612796617.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cddc2deaa8f049d3ec419738e69804934919b935.1612796617.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612833574.78p5tc9eia.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
> syscall_64.c will be reused almost as is for PPC32.
>=20
> As this file also contains functions to handle other types
> of interrupts rename it interrupt.c
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/kernel/Makefile                      | 2 +-
>  arch/powerpc/kernel/{syscall_64.c =3D> interrupt.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename arch/powerpc/kernel/{syscall_64.c =3D> interrupt.c} (100%)
>=20
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index c173efd66c00..26ff8c6e06b7 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -60,7 +60,7 @@ obj-y				:=3D cputable.o syscalls.o \
>  				   hw_breakpoint_constraints.o
>  obj-y				+=3D ptrace/
>  obj-$(CONFIG_PPC64)		+=3D setup_64.o \
> -				   paca.o nvram_64.o note.o syscall_64.o
> +				   paca.o nvram_64.o note.o interrupt.o
>  obj-$(CONFIG_COMPAT)		+=3D sys_ppc32.o signal_32.o
>  obj-$(CONFIG_VDSO32)		+=3D vdso32_wrapper.o
>  obj-$(CONFIG_PPC_WATCHDOG)	+=3D watchdog.o
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/inter=
rupt.c
> similarity index 100%
> rename from arch/powerpc/kernel/syscall_64.c
> rename to arch/powerpc/kernel/interrupt.c
> --=20
> 2.25.0
>=20
>=20
