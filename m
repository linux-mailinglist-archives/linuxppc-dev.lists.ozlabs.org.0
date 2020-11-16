Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E76552B5521
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 00:37:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZlpj2LTyzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 10:37:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZlmW3Z2YzDqM4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 10:35:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ThL2VPbq; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CZlmW2PbFz8w0S
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 10:35:07 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CZlmW1wSFz9sTL; Tue, 17 Nov 2020 10:35:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ThL2VPbq; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CZlmV3dYlz9sSs
 for <linuxppc-dev@ozlabs.org>; Tue, 17 Nov 2020 10:35:06 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id p68so4173939pga.6
 for <linuxppc-dev@ozlabs.org>; Mon, 16 Nov 2020 15:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pv3SdWEU94yZUVWUhkFKAAtzguyHPsl6uo1DKmUfEmk=;
 b=ThL2VPbq6tQT41obQs2rumy1Zc1xCnOh1BOu6+GeVE3t/4BxvetMa7F4W69LyAAC9j
 LIQpcBxhXa2Ob+07TKaeNMvqmEN80io1xTgb6V3heMoqjO+hqKIvaKxIrlzY7K3tRH9P
 FdGQ5oIvXRtNIb7nqybdwJ4MHbuXna8pFZSdhkXkIqUl7WIAxpOwSQCX4zeQ10AkvJAo
 AFmpoeENxPh3JIwxn+UzvGN4DPJWN0VUe+qMZKhvGTQhPcpaIPsGn88M48PAtiizOBEn
 dWbcWzakiWfvXGZLN+/+SbraF5s+9TAfnG5v2scLlv/aZYD0HXcL5Cyw/O8uARxGwaoy
 0abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pv3SdWEU94yZUVWUhkFKAAtzguyHPsl6uo1DKmUfEmk=;
 b=TV9+dDiOaJ4Zjd5KXQZ6tew8Va9/E85yDqVV0ldfD0t1uoOJHsMKNuMnD781VrImKA
 SlwlxFDHymvrJdDoAviOqdfwPPw+Ac/I8yMOlmZr/TSt4Xsmq6C6bLRK5P3jm7sElVpO
 GfPpZo7tTtxdlyrFdVt9TyCMtvn8xuBkzMlecrLDSfR1RmgiZedDugQgie+WW7QgIFvs
 gO45BRjgh+0LykSqfpHOsvljS4YcH7nIjV3n/Rf9D3CZ+rDtPMvz4K1ep7G1CWVpt6Zp
 OMS4y75e+T2NCuWg11hE8YCA+aSHVvr3d5JPYSWyapLjaPTckkHZhJV40qCSvEfzNrpH
 NuSQ==
X-Gm-Message-State: AOAM533geWowR92i9WlxkzrI3SQq6ueU5C2Qp9SuGenf+ksQdo/cN8ra
 qw5RQcexhknF8fCadh8qycpePFg1fuiNtQei/1lzMA==
X-Google-Smtp-Source: ABdhPJzcW2PVHopBMd0xgsqMrcmed1NFI91MyTdyQEBc2n2hVm2m7NjtYpoGWbVzQ5DeMt6s9zbBJxpqggI7yAzKo1w=
X-Received: by 2002:a17:90a:4881:: with SMTP id
 b1mr1447923pjh.32.1605569702981; 
 Mon, 16 Nov 2020 15:35:02 -0800 (PST)
MIME-Version: 1.0
References: <20201116120913.165317-1-mpe@ellerman.id.au>
In-Reply-To: <20201116120913.165317-1-mpe@ellerman.id.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Nov 2020 15:34:52 -0800
Message-ID: <CAKwvOdnhmcmGgSfKG0KEOEbf=WZnixV6c838ArQ8EOXUXqxfMQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Drop -me200 addition to build flags
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>, oss@buserror.net,
 linuxppc-dev@ozlabs.org, Nathan Chancellor <natechancellor@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 4:09 AM Michael Ellerman <mpe@ellerman.id.au> wrote=
:
>
> Currently a build with CONFIG_E200=3Dy will fail with:
>
>   Error: invalid switch -me200
>   Error: unrecognized option -me200
>
> Upstream binutils has never supported an -me200 option. Presumably it
> was supported at some point by either a fork or Freescale internal
> binutils.
>
> We can't support code that we can't even build test, so drop the
> addition of -me200 to the build flags, so we can at least build with
> CONFIG_E200=3Dy.
>
> Reported-by: N=C3=A9meth M=C3=A1rton <nm127@freemail.hu>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks for the patch; this should make randconfig builds not pick this
non-buildable config.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> More discussion: https://lore.kernel.org/lkml/202011131146.g8dPLQDD-lkp@i=
ntel.com
> ---
>  arch/powerpc/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a4d56f0a41d9..16b8336f91dd 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -248,7 +248,6 @@ KBUILD_CFLAGS               +=3D $(call cc-option,-mn=
o-string)
>  cpu-as-$(CONFIG_40x)           +=3D -Wa,-m405
>  cpu-as-$(CONFIG_44x)           +=3D -Wa,-m440
>  cpu-as-$(CONFIG_ALTIVEC)       +=3D $(call as-option,-Wa$(comma)-maltive=
c)
> -cpu-as-$(CONFIG_E200)          +=3D -Wa,-me200
>  cpu-as-$(CONFIG_E500)          +=3D -Wa,-me500
>
>  # When using '-many -mpower4' gas will first try and find a matching pow=
er4
> --
> 2.25.1
>


--=20
Thanks,
~Nick Desaulniers
