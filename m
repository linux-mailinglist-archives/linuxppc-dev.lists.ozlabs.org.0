Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5185B5768
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 11:48:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR1xG2H97z3bry
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 19:48:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hDSadGOK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hDSadGOK;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR1wf1CvQz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 19:47:30 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso7610919pjd.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 02:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=+9jimVV10XVCE2fXhKNpI2KfH+y2HHY0aFdf4FAaxMY=;
        b=hDSadGOK0eFSoeDUpP2NpytOE2JznG6ERRY8eER3sEGNXJUp6wtOX0ZgdEnd01wWSS
         fjURvWBWUW5X1u2cBclub52hRNNPKfjGn/Zk9YnJYdiUV4PK8BR0/XGABcRA8I9B4CeG
         AAtTDGYAhvyZLfSv+XNq1n7A9owe+eMs3KVsW6kJqaJZkeTMOaL/Pt+6xLmYLpYdyPw6
         BaceK+eD+NBdOLPI6pokpRDGM2YzliwCbqClBRMRl3PTuz9SASaSuqCwu2jTKJudyiMD
         pEP9/PrPu2QKcWFFQ/WcW9Fz298Dy8k0g6Pbtty8Z77yT0/ykApu+nlcEDDnXROMZ6xR
         jFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=+9jimVV10XVCE2fXhKNpI2KfH+y2HHY0aFdf4FAaxMY=;
        b=qnLnaVlma0aAnFYuKYf6eckQb4Gkea61IUjbXqLwbzS4ZCW4y+quU6vKjFNIGPxbiN
         crGROE1gv+oPUCY9n2WPxVfci+XkexuP1CEgJvDeMGElyPwEGW8rSgJ9AThIdU4cEJi3
         T8HLI/0KeqkewbbXSARIO6BMrDTIoYZ1cx4JpfMwlXeME2S11tyJqS09hdTErd4mCoEQ
         AT1ApBrQcHkeUbqX0DEf1eTytFj94tWhG3n8jRpGmW+qdM/aV0N7CTlmaqwhs3ae8xWo
         Ac8upm5GXj/Sd/b6+EAUYZNADBHkP/VUWFtfWZPQvJWKTQLgLO4iee/te558/w2dhlzL
         ekEA==
X-Gm-Message-State: ACgBeo1IVUuCCHqw4BsqJn1aCKq9IYNBHQ07ZziM/5asRYr3UhLvdx7k
	2W+fC+aAxb58hAAZ4M8B4eMLTxSuq/0=
X-Google-Smtp-Source: AA6agR41qxNXFGi+0etv0zTfy4gDNwvXtMCt20wexsSn1odtnHRE4/DzSZVmaXNqnlARJCz0drVB/A==
X-Received: by 2002:a17:90b:164f:b0:1f5:4ced:ed81 with SMTP id il15-20020a17090b164f00b001f54ceded81mr22502206pjb.122.1662976047135;
        Mon, 12 Sep 2022 02:47:27 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id l7-20020a170903120700b0017312bfca95sm5524510plh.253.2022.09.12.02.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 02:47:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 19:47:17 +1000
Message-Id: <CMUBT12P8ZWV.VDK394MP3MSI@bobo>
Subject: Re: [PATCH v4 06/20] powerpc: Remove direct call to mmap2 syscall
 handlers
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-7-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-7-rmclure@linux.ibm.com>
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
> macro. Move the compatibility syscall definition for mmap2 to
> syscalls.c, so that all mmap implementations can share an inline helper
> function, as is done with the personality handlers.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Is there any point to keping sys_ppc32.c at all? Might as well move them
all to syscall.c IMO.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> V1 -> V2: Move mmap2 compat implementation to asm/kernel/syscalls.c.
> V3 -> V4: Move to be applied before syscall wrapper introduced.
> ---
>  arch/powerpc/kernel/sys_ppc32.c |  9 ---------
>  arch/powerpc/kernel/syscalls.c  | 11 +++++++++++
>  2 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_pp=
c32.c
> index f4edcc9489fb..bc6491ed6454 100644
> --- a/arch/powerpc/kernel/sys_ppc32.c
> +++ b/arch/powerpc/kernel/sys_ppc32.c
> @@ -25,7 +25,6 @@
>  #include <linux/poll.h>
>  #include <linux/personality.h>
>  #include <linux/stat.h>
> -#include <linux/mman.h>
>  #include <linux/in.h>
>  #include <linux/syscalls.h>
>  #include <linux/unistd.h>
> @@ -48,14 +47,6 @@
>  #include <asm/syscalls.h>
>  #include <asm/switch_to.h>
> =20
> -unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
> -			  unsigned long prot, unsigned long flags,
> -			  unsigned long fd, unsigned long pgoff)
> -{
> -	/* This should remain 12 even if PAGE_SIZE changes */
> -	return sys_mmap(addr, len, prot, flags, fd, pgoff << 12);
> -}
> -
>  /*=20
>   * long long munging:
>   * The 32 bit ABI passes long longs in an odd even register pair.
> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscall=
s.c
> index b8461128c8f7..32fadf3c2cd3 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -56,6 +56,17 @@ SYSCALL_DEFINE6(mmap2, unsigned long, addr, size_t, le=
n,
>  	return do_mmap2(addr, len, prot, flags, fd, pgoff, PAGE_SHIFT-12);
>  }
> =20
> +#ifdef CONFIG_COMPAT
> +COMPAT_SYSCALL_DEFINE6(mmap2,
> +		       unsigned long, addr, size_t, len,
> +		       unsigned long, prot, unsigned long, flags,
> +		       unsigned long, fd, unsigned long, pgoff)
> +{
> +	/* This should remain 12 even if PAGE_SIZE changes */
> +	return do_mmap2(addr, len, prot, flags, fd, pgoff << 12, PAGE_SHIFT-12)=
;
> +}
> +#endif
> +
>  SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
>  		unsigned long, prot, unsigned long, flags,
>  		unsigned long, fd, off_t, offset)
> --=20
> 2.34.1

