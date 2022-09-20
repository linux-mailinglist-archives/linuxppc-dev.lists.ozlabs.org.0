Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D625BD90A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:06:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWk036SWdz3c3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 11:06:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YasyySfQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YasyySfQ;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWjzQ2PYxz2ymS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 11:06:10 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id e68so1291243pfe.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 18:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=msMZhqNq61If7HcCA+NfR7MMdzuuCIJw+aWLcbkpcnU=;
        b=YasyySfQ8sOb6nLt8cM/Il/HdiCy/WfOKqas6cOonnzFfk0kpKTJGITZkbTj2shRVu
         G/p4E8ttB4PFWRunzEjLWaA0EWIjnymGuN968eIGeTSXttIrkm0uSjSGVeNBtVaG38uh
         uJNxOnCrHA8ZKUdB/ramvlu3rHB5PGA6B4hezDABzQEC3PWHfrAC7mJnQGcHUFzrQSYg
         Hsw/k4NYc8eZcyDGBtDDCYhayLQjOlr3da+AnsLjbf1lkJs/ACOYeOH3qKHDLQCJf1a6
         4nTgTSNN9+5g7Nn0GdlECHu2LEnxzQxVWbvUg8n50OVvYOcXudmM5xMNQ/6oxiNb4TXa
         3FDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=msMZhqNq61If7HcCA+NfR7MMdzuuCIJw+aWLcbkpcnU=;
        b=WGiTeWQqS6CbBXIcYgzaN3sVo6tFhXZCWK5ROCxbPHsWfu5T1Y0Ufrc++e9e9e+sWx
         2I3tED+RcJ313tBZo+GynphiLXOc1zA4xCd/U8ybP6HliPKvXfxL7t+lqHfSla4hw5/W
         DxE30rcqtqVk5Lq4cBh1657CR12FjkKajvokD7OGDcEtreaLcCze3SSeRao+x1zTKs23
         10NVAPoJporbuG9Ppn7Ip3scHtVAzhmeJMNnBjHcSANPkUnXUzCY5BlFOzJBe88G55P8
         Fzqa4MGhrkmF14DBOXx2/2bxEnprYFwvSDsLN334XyeBdSA0ID1w9PUDpiSgGchhgw1W
         jXZw==
X-Gm-Message-State: ACrzQf3747Ag7CRuftlBJ15+bhIPbnwfUF+Jtr9YDZItkZjYc611Z4R2
	AKiFnn5fF4KoefZfvWbpXGA=
X-Google-Smtp-Source: AMsMyM4Rua4knZuDnYF83oyPImT7Kh2TAxhd7BZf5JJ1sXZ8RxoSK6AqShZNDvCJ59DBPzt3GFfaTw==
X-Received: by 2002:a63:77c4:0:b0:435:4224:98b6 with SMTP id s187-20020a6377c4000000b00435422498b6mr18113764pgc.94.1663635967096;
        Mon, 19 Sep 2022 18:06:07 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id w184-20020a627bc1000000b00540ad46bc1dsm14580pfc.157.2022.09.19.18.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 18:06:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 11:06:01 +1000
Message-Id: <CN0TQ9Y2OA8T.1EEPB63P94PKY@bobo>
Subject: Re: [PATCH 09/23] asm-generic: compat: Support BE for long long
 args in 32-bit ABIs
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-10-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-10-rmclure@linux.ibm.com>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Sep 16, 2022 at 3:32 PM AEST, Rohan McLure wrote:
> 32-bit ABIs support passing 64-bit integers by registers via argument
> translation. Commit 59c10c52f573 ("riscv: compat: syscall: Add
> compat_sys_call_table implementation") implements the compat_arg_u64
> macro for efficiently defining little endian compatibility syscalls.
>
> Architectures supporting big endianness may benefit from reciprocal
> argument translation, but are welcome also to implement their own.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Better put Arnd and linux-arch on cc...

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> V4 -> V5: New patch.
> ---
>  include/asm-generic/compat.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/include/asm-generic/compat.h b/include/asm-generic/compat.h
> index d06308a2a7a8..aeb257ad3d1a 100644
> --- a/include/asm-generic/compat.h
> +++ b/include/asm-generic/compat.h
> @@ -14,12 +14,17 @@
>  #define COMPAT_OFF_T_MAX	0x7fffffff
>  #endif
> =20
> -#if !defined(compat_arg_u64) && !defined(CONFIG_CPU_BIG_ENDIAN)
> +#ifndef compat_arg_u64
> +#ifdef CONFIG_CPU_BIG_ENDIAN
>  #define compat_arg_u64(name)		u32  name##_lo, u32  name##_hi
>  #define compat_arg_u64_dual(name)	u32, name##_lo, u32, name##_hi
> +#else
> +#define compat_arg_u64(name)		u32  name##_hi, u32  name##_lo
> +#define compat_arg_u64_dual(name)	u32, name##_hi, u32, name##_lo
> +#endif
>  #define compat_arg_u64_glue(name)	(((u64)name##_lo & 0xffffffffUL) | \
>  					 ((u64)name##_hi << 32))
> -#endif
> +#endif /* compat_arg_u64 */
> =20
>  /* These types are common across all compat ABIs */
>  typedef u32 compat_size_t;
> --=20
> 2.34.1

