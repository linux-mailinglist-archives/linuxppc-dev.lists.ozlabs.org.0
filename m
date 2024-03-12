Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3BD878E3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 06:46:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iURsuDLS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv2gV6tV0z3vZK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 16:45:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iURsuDLS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv2fj0zPqz3dW8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 16:45:16 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d944e8f367so40122375ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 22:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710222312; x=1710827112; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW/EcKaMbEkneZDxVrHKCHliy210kWmaiqbzUm1tuZw=;
        b=iURsuDLSQ0lpCZUeqPLyoC66b8Lo897/5RC8Wlh1+TD4LTReVFAksbJaczjMkND1Ht
         L+p9JOg6tjS6QqmUoT3jFtK5XWNnmut/3PAliyeBZuEbfCai/NZavQfe6CdhVtnVfnuP
         6C/WLrtsCfPfC9hdvolOOCBZORQDvccrN7Jpk04HyGw9+kQo797etyPKcbFR+xjc9mGd
         7WPKndxkO0LdR8HlxPCtn2rImncCUZeDcyjfBVusbjpR4H8mu3eEI2lSmpffVLy3NHrL
         wTtNBUQeg0wBw4mX97IdvrI2R5iTXnIfwP2yLK4WwedrFM7OKwY46YhaiUQTMlXzTb0N
         6ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710222312; x=1710827112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fW/EcKaMbEkneZDxVrHKCHliy210kWmaiqbzUm1tuZw=;
        b=w4uWWd/zcmRABXSRGyLjW9+isI51mDvUYv0m8+LFEmMt/a1u3F1kqDxrCttD7McayC
         9NIpJV83z+s2dZyjJD63etw5KdtYScJTMBdlWsB7wGnN8w4PTaQ11cQW1JdZ+A+xQN8U
         u6Zm4nk48Lca8ThdYhQlx8v86roSdKdZqiQ0r5Q3v9KvdxQJ17PyEwNeCdERiVkdIIv/
         OiJL8y/gnSFMuiOWfbMPPE6FK4VmvjG109TdkC7Vt3MrD+g4LIkC+Ii6CAZ6HbktrBkf
         oknicuKVvVLJT1u+Tn8s1XxbFd3Os+eo4ZZHfb1yYE2dgbHkp9luENY9Q3ERRFyvf3QT
         vpww==
X-Forwarded-Encrypted: i=1; AJvYcCU0j7BqeqWPAqbWxgLFnSQWangpVMGf73RkVx/VEh8eonNRnpgF4dsCILA2SLxwzcoocjUQXcU/oK061WsgoFzzI0u+eq4yAzvO+ZqyRw==
X-Gm-Message-State: AOJu0Ywk2DhTH7G7AjJ6nOFH3wwmUCrnt45sE+hMBjaTXqGNyBa9yFDK
	uTV5/ybDVrEbrmfFnQVJYUWG5Sa6BfvX7Jk7pr9OKXVwALgFFvVR
X-Google-Smtp-Source: AGHT+IFv14RRSVORaVxPGv7Pgc/FfkulvwmrU9WcDb6eZGl4gISl+ryDpVeng37EST8Ipt5IeQErUQ==
X-Received: by 2002:a17:902:e54f:b0:1db:5b41:c5ac with SMTP id n15-20020a170902e54f00b001db5b41c5acmr7737568plf.68.1710222312180;
        Mon, 11 Mar 2024 22:45:12 -0700 (PDT)
Received: from localhost ([1.146.55.44])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090322c700b001da1fae8a73sm3335793plg.12.2024.03.11.22.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 22:45:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Mar 2024 15:45:05 +1000
Message-Id: <CZRJ7KVBS2ZT.3144ZIHYUZRNY@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>
Subject: Re: [kvm-unit-tests PATCH v2 04/13] treewide: lib/stack: Make
 base_address arch specific
X-Mailer: aerc 0.15.2
References: <20240305170858.395836-15-andrew.jones@linux.dev>
 <20240305170858.395836-19-andrew.jones@linux.dev>
In-Reply-To: <20240305170858.395836-19-andrew.jones@linux.dev>
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
Cc: lvivier@redhat.com, linux-s390@vger.kernel.org, thuth@redhat.com, nrb@linux.ibm.com, frankja@linux.ibm.com, kvmarm@lists.linux.dev, pbonzini@redhat.com, imbrenda@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Mar 6, 2024 at 3:09 AM AEST, Andrew Jones wrote:
> Calculating the offset of an address is image specific, which is
> architecture specific. Until now, all architectures and architecture
> configurations which select CONFIG_RELOC were able to subtract
> _etext, but the EFI configuration of riscv cannot (it must subtract
> ImageBase). Make this function weak, such that an architecture may
> override it when necessary, to accommodate the image layout. Then,
> immediately supply the riscv override.
>

Thanks for making these changes. Looks good. For the generic parts,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  lib/riscv/stack.c | 18 ++++++++++++++++++
>  lib/stack.c       |  8 ++++----
>  lib/stack.h       |  2 ++
>  3 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/lib/riscv/stack.c b/lib/riscv/stack.c
> index d865594b9671..2cd7f012738b 100644
> --- a/lib/riscv/stack.c
> +++ b/lib/riscv/stack.c
> @@ -2,6 +2,24 @@
>  #include <libcflat.h>
>  #include <stack.h>
> =20
> +#ifdef CONFIG_RELOC
> +extern char ImageBase, _text, _etext;
> +
> +bool arch_base_address(const void *rebased_addr, unsigned long *addr)
> +{
> +	unsigned long ra =3D (unsigned long)rebased_addr;
> +	unsigned long base =3D (unsigned long)&ImageBase;
> +	unsigned long start =3D (unsigned long)&_text;
> +	unsigned long end =3D (unsigned long)&_etext;
> +
> +	if (ra < start || ra >=3D end)
> +		return false;
> +
> +	*addr =3D ra - base;
> +	return true;
> +}
> +#endif
> +
>  int arch_backtrace_frame(const void *frame, const void **return_addrs,
>  			 int max_depth, bool current_frame)
>  {
> diff --git a/lib/stack.c b/lib/stack.c
> index dd6bfa8dac6e..086fec544a81 100644
> --- a/lib/stack.c
> +++ b/lib/stack.c
> @@ -14,7 +14,7 @@
>  #ifdef CONFIG_RELOC
>  extern char _text, _etext;
> =20
> -static bool base_address(const void *rebased_addr, unsigned long *addr)
> +bool __attribute__((weak)) arch_base_address(const void *rebased_addr, u=
nsigned long *addr)
>  {
>  	unsigned long ra =3D (unsigned long)rebased_addr;
>  	unsigned long start =3D (unsigned long)&_text;
> @@ -27,7 +27,7 @@ static bool base_address(const void *rebased_addr, unsi=
gned long *addr)
>  	return true;
>  }
>  #else
> -static bool base_address(const void *rebased_addr, unsigned long *addr)
> +bool __attribute__((weak)) arch_base_address(const void *rebased_addr, u=
nsigned long *addr)
>  {
>  	*addr =3D (unsigned long)rebased_addr;
>  	return true;
> @@ -45,13 +45,13 @@ static void print_stack(const void **return_addrs, in=
t depth,
>  	/* @addr indicates a non-return address, as expected by the stack
>  	 * pretty printer script. */
>  	if (depth > 0 && !top_is_return_address) {
> -		if (base_address(return_addrs[0], &addr))
> +		if (arch_base_address(return_addrs[0], &addr))
>  			printf(" @%lx", addr);
>  		i++;
>  	}
> =20
>  	for (; i < depth; i++) {
> -		if (base_address(return_addrs[i], &addr))
> +		if (arch_base_address(return_addrs[i], &addr))
>  			printf(" %lx", addr);
>  	}
>  	printf("\n");
> diff --git a/lib/stack.h b/lib/stack.h
> index 6edc84344b51..df076d94bf8f 100644
> --- a/lib/stack.h
> +++ b/lib/stack.h
> @@ -34,4 +34,6 @@ static inline int backtrace_frame(const void *frame, co=
nst void **return_addrs,
>  }
>  #endif
> =20
> +bool __attribute__((weak)) arch_base_address(const void *rebased_addr, u=
nsigned long *addr);
> +
>  #endif

