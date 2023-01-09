Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F156632F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:33:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRyQ2XbGz3fpH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:33:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BUrkQTa+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BUrkQTa+;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrRm94s95z3g2N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 08:24:40 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id g20so7212778pfb.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 13:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cwNgqi/NQkqWmtT2yM6QfKma/Y9yH7Zze7tBPVBivxk=;
        b=BUrkQTa+u/VpDQVrQM/lKNS4FTu2L3sLIIqBbnjlsemezMYlVHS8iPOKK5l8sDB8yf
         M4eQOaPKiijvKhy/SLCWzcZDVz/vrcfFQIx6305wyt+99rkBk/j46H2bPJO4NqwWUeFh
         SkY620a+ghXrYMMXDe+qWeyKu+3Dvw/iW6h4x+aAX3OuOb3gVlFRnttrZ6X5yzPnhfFV
         a4hbYsL2Asa8O8K8Flc+yw3WuHu8TpXa9t3pgAGlKDIZrPieC5OiBBQVM/ABA/0OaMpG
         9l3Kc8GBn58XMHZQT3nc6VjzrTALSMaOkN4yeTt5fG9hcT419bAO6RkFlg+/vznV8Naa
         zz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwNgqi/NQkqWmtT2yM6QfKma/Y9yH7Zze7tBPVBivxk=;
        b=sAeEMNkjHHL+tyK+rJzNQQe6PVlOUvVNPsNOY5/Qyodr57QRo9wqU4x9NKsnQfQT3T
         3F/FUGSup82++Y7dvw6tk+2/5ipaP5hrU8kOgYwuJAacS3cTggtmC0WzTapBfAb/HQ6m
         hbd30qtrP2mF/aPSz81KZ7JA20cUNFP+L3hOcegQNVYIxqo+8BEhQ0fLwaH91YLELSNd
         b1b+Eicy7EhoI1hM73b3cy7Jf5hfYZ8HDbDOmCU1U8hwOa1WuMUbJmrvjwHBoTaXNxjl
         qfpBeq2M7ae74UW5UvFbstZcNqn4lAGDg/sGUNR7lfoOsb94PyXPVVYjOCHMsknaPTUM
         1ZXw==
X-Gm-Message-State: AFqh2koFYkSsSMSbTAaq10WW0bMNYmp+a0nMw34uYyKLwRFRx0sO5WLa
	TcS+0atg0gbRgQLY8TOLiUSfSnefASeTUbZX/wn4bw==
X-Google-Smtp-Source: AMrXdXtIh0E/DgOM0QwEcwfy9eQgImnKUYlPyPKRHz81WoFNXLApps0jEhpEfXN0JAZZbWaOYH1ssQGCAd5Wpz9DJLc=
X-Received: by 2002:a63:4943:0:b0:478:e6cf:c24c with SMTP id
 y3-20020a634943000000b00478e6cfc24cmr5119252pgk.365.1673299477404; Mon, 09
 Jan 2023 13:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-5-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-5-658cbc8fc592@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 13:24:26 -0800
Message-ID: <CAKwvOdkB_+Nf9zpXeeayA6V14QoAEfW0b37DBsro04q5JpjBnw@mail.gmail.com>
Subject: Re: [PATCH 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org, trix@redhat.com, masahiroy@kernel.org, llvm@lists.linux.dev, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 4, 2023 at 11:54 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> points out that KBUILD_AFLAGS contains a linker flag, which will be
> used:
>
>   clang: error: -Wl,-a32: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>
> This was likely supposed to be '-Wa,-a$(BITS)'. However, this change is
> unnecessary, as all supported versions of clang and gcc will pass '-a64'
> or '-a32' to GNU as based on the value of '-m'; the behavior of the
> latest stable release of the oldest supported major version of each
> compiler is shown below and each compiler's latest release exhibits the
> same behavior (GCC 12.2.0 and Clang 15.0.6).
>
>   $ powerpc64-linux-gcc --version | head -1
>   powerpc64-linux-gcc (GCC) 5.5.0
>
>   $ powerpc64-linux-gcc -m64 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
>   .../as -a64 -mppc64 -many -mbig -o /dev/null /tmp/cctwuBzZ.s
>
>   $ powerpc64-linux-gcc -m32 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
>   .../as -a32 -mppc -many -mbig -o /dev/null /tmp/ccaZP4mF.sg
>
>   $ clang --version | head -1
>   Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214622.5
>
>   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
>     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
>    "/usr/bin/powerpc64-linux-gnu-as" "-a64" "-mppc64" "-many" "-o" "/dev/null" "/tmp/null-80267c.s"
>
>   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
>     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
>    "/usr/bin/powerpc64-linux-gnu-as" "-a32" "-mppc" "-many" "-o" "/dev/null" "/tmp/null-ab8f8d.s"
>
> Remove this flag altogether to avoid future issues.
>
> Fixes: 1421dc6d4829 ("powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Cc: mpe@ellerman.id.au
> Cc: npiggin@gmail.com
> Cc: christophe.leroy@csgroup.eu
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index dc4cbf0a5ca9..4fd630efe39d 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -90,7 +90,7 @@ aflags-$(CONFIG_CPU_LITTLE_ENDIAN)    += -mlittle-endian
>
>  ifeq ($(HAS_BIARCH),y)
>  KBUILD_CFLAGS  += -m$(BITS)
> -KBUILD_AFLAGS  += -m$(BITS) -Wl,-a$(BITS)
> +KBUILD_AFLAGS  += -m$(BITS)
>  KBUILD_LDFLAGS += -m elf$(BITS)$(LDEMULATION)
>  endif
>
>
> --
> 2.39.0



-- 
Thanks,
~Nick Desaulniers
