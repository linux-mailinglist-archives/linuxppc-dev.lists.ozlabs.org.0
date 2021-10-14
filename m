Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB4142E343
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 23:27:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVjCd3wj1z3bXR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 08:27:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=nySJqlSw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=nySJqlSw; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVjBt4Rt2z2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 08:26:29 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id ls18so5727211pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 14:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=CLaFJ0M9ufD0uCBwTkgOwQCLYTA2acJBA4tvaXF3j60=;
 b=nySJqlSwO+ULk3udlcOszY6Ia0XQFeH789zFbu7K9HOE2rbb+01FRBlzqYTOfLe01Y
 UjBibChKl+lLjdMq7H2G6UmdoL4DkJBBd2xPkhVd/NnmKnnR8gnnU7EkmSiSJ0GL6yHC
 xyAObJJcyavoFkvMN+kslHElYwm+54tEYY9dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=CLaFJ0M9ufD0uCBwTkgOwQCLYTA2acJBA4tvaXF3j60=;
 b=vQCVIGK8x/bIqYRCMiUa3qKfUZrGCuz84+u9Al3bYg4PMGtQNROcZslLc8V96xC9t7
 IPHkeXSRtAteiTCVzdMFa7sQ04sWgy+7cmunHXnqOsx5MmU2onOKR+MvK0gbUTxLYUgp
 Q78cH9uQcS4GSr3IC9jV0a/6hN3/7MR/s0uG2FYRJjZnaByFyC4Hj31xIhI6IzqQ/Yz8
 pAbdvliGthrJisSbt6zU/u089w4sua/y4j/9ift+rS4p4cuA98QQ2A2FPih8HFpBZFIL
 2pyJXgVqqb4QXRwlSKe8u0C67J0ruE6UpJsN77WeWexdaD/7EZkgynCmaus6O9cTP9Hf
 8eDg==
X-Gm-Message-State: AOAM5330drL6LzxeWLqtXMpWNFwfxeH923S20qds1J24p9TQfxBbx4Qt
 7KB43eFGM0+gylJ21UPLpxOv4w==
X-Google-Smtp-Source: ABdhPJw845LVBzEpWwR4bMZtD/PFJA96pgIe4GSulaOTJBUImwok7XHbH5FT4bUDZgXBEMZc0+GWdQ==
X-Received: by 2002:a17:90a:6a8f:: with SMTP id
 u15mr22641531pjj.212.1634246786410; 
 Thu, 14 Oct 2021 14:26:26 -0700 (PDT)
Received: from localhost ([2001:4479:e300:600:4901:2fb9:ed97:3a3e])
 by smtp.gmail.com with ESMTPSA id i128sm3261169pfc.47.2021.10.14.14.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 14:26:25 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Andrew Morton <akpm@linux-foundation.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>, Kees Cook
 <keescook@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 01/13] powerpc: Move 'struct ppc64_opd_entry' back
 into asm/elf.h
In-Reply-To: <42d2a571677e60082c0a5b3e52e855aa58c0b1fc.1634190022.git.christophe.leroy@csgroup.eu>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <42d2a571677e60082c0a5b3e52e855aa58c0b1fc.1634190022.git.christophe.leroy@csgroup.eu>
Date: Fri, 15 Oct 2021 08:26:22 +1100
Message-ID: <87czo747sx.fsf@dja-thinkpad.axtens.net>
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
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

> 'struct ppc64_opd_entry' doesn't belong to uapi/asm/elf.h
>
> It was initially in module_64.c and commit 2d291e902791 ("Fix compile
> failure with non modular builds") moved it into asm/elf.h
>
> But it was by mistake added outside of __KERNEL__ section,
> therefore commit c3617f72036c ("UAPI: (Scripted) Disintegrate
> arch/powerpc/include/asm") moved it to uapi/asm/elf.h

As Michael said on v1, I'm a little nervous about moving it out of uAPI
after so long, although I do take the points of Arnd and Kees that we're
not breaking compiled binaries, nor should people be using this struct
to begin with...

I've cc:ed the linux-api@ list.

Kind regards,
Daniel

> Move it back into asm/elf.h, this brings it back in line with
> IA64 and PARISC architectures.
>
> Fixes: 2d291e902791 ("Fix compile failure with non modular builds")
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/elf.h      | 6 ++++++
>  arch/powerpc/include/uapi/asm/elf.h | 8 --------
>  2 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/elf.h b/arch/powerpc/include/asm/elf.h
> index b8425e3cfd81..a4406714c060 100644
> --- a/arch/powerpc/include/asm/elf.h
> +++ b/arch/powerpc/include/asm/elf.h
> @@ -176,4 +176,10 @@ do {									\
>  /* Relocate the kernel image to @final_address */
>  void relocate(unsigned long final_address);
>  
> +/* There's actually a third entry here, but it's unused */
> +struct ppc64_opd_entry {
> +	unsigned long funcaddr;
> +	unsigned long r2;
> +};
> +
>  #endif /* _ASM_POWERPC_ELF_H */
> diff --git a/arch/powerpc/include/uapi/asm/elf.h b/arch/powerpc/include/uapi/asm/elf.h
> index 860c59291bfc..308857123a08 100644
> --- a/arch/powerpc/include/uapi/asm/elf.h
> +++ b/arch/powerpc/include/uapi/asm/elf.h
> @@ -289,12 +289,4 @@ typedef elf_fpreg_t elf_vsrreghalf_t32[ELF_NVSRHALFREG];
>  /* Keep this the last entry.  */
>  #define R_PPC64_NUM		253
>  
> -/* There's actually a third entry here, but it's unused */
> -struct ppc64_opd_entry
> -{
> -	unsigned long funcaddr;
> -	unsigned long r2;
> -};
> -
> -
>  #endif /* _UAPI_ASM_POWERPC_ELF_H */
> -- 
> 2.31.1
