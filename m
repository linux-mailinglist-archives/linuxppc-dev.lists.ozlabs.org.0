Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 079E27F2292
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 01:52:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X1s4lL40;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ5SZ6pGcz3d9T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 11:52:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X1s4lL40;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ5Rk4Ckwz3c4t
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 11:51:44 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3b5ff072fc4so3222420b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 16:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700527901; x=1701132701; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pn9aLSeosG7l0BmT5llM/BGYPNtLICtF9m0AjdHG0XM=;
        b=X1s4lL40fil7djJ63YN3SY39Bk8xXi0VnmLEQcS+gw/YxaoGQdOkOxl5HKIejPua8i
         4Q2VcCd2iQS18KU73YERZkPXMbT1BC0BpuoALOyY2lrcIPxC63iv13eh0SgzposwAU1P
         /VGmJ7RY1TEnnj8KtW9o8VWjLdFXr2Mws3rlABfgBh6t/jKXYAn5OWZNF8tGsOXAuQsW
         aDNGg1KY4yPDkTlWCtc812aZEkO/oEpHp95it5APEdbjKFbEKQdCKjmQOS5QIwkxbJa9
         NXTiKaM0joqOfRUa/uoqRqPlGIk3n9kQYYK05Dua+To3skIi+3y+bJtn2jx81Tk8V47n
         jzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700527901; x=1701132701;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pn9aLSeosG7l0BmT5llM/BGYPNtLICtF9m0AjdHG0XM=;
        b=MW+Da8vNxXP93o0xK/ZkD9zAqnGtNztvMT8t5i1dJeOtH++SkbR07yE4MDMT8QfVCU
         FxVLUVd6ajvpovB39+biAFjnRegqbKX7mePi9YItamxVY1Xsz9wsJrCcbDOFTYln2ziQ
         +L1JqsFC0f6ZpNeZEVnNPNrVOKv9Cr1QSMUdjVznLZ1e/qK0uGHYU3VLE7+EAJ1VbfdK
         WHOiI1I4QPPq0j5tgcTeQSlhVhJxSbdh/pxnXxRQPNm7M8WYBFaU2dVaQWVAPX3SuiYL
         ci5iLCGpbyJqCjvP5FgrUO2CXJ/K0AqcsLlw4IyXAXch0eEFv3UE8hrvTPCf7bhgu2Vm
         s4Ew==
X-Gm-Message-State: AOJu0Yy9jSRaoGjYb4J0wiT9RC7ocJq2vYfRZzRTgg/gtaMtAFUM5szv
	1PuutAyjDVYlN9Wci3YI8M8=
X-Google-Smtp-Source: AGHT+IE+o49kLzCuw1FPClPjXT6ATg3hfgvXAS5obzWWtUpkGeQbWTToBNlZGXTLMvhqz0mk9VwJFQ==
X-Received: by 2002:a05:6871:a60a:b0:1f5:b60d:68ff with SMTP id we10-20020a056871a60a00b001f5b60d68ffmr10197694oab.14.1700527901134;
        Mon, 20 Nov 2023 16:51:41 -0800 (PST)
Received: from localhost (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id n28-20020a056a000d5c00b006cbb80e4577sm723318pfv.210.2023.11.20.16.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 16:51:40 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 10:51:34 +1000
Message-Id: <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely>
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Masahiro Yamada" <masahiroy@kernel.org>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.15.2
References: <20231120232332.4100288-1-masahiroy@kernel.org>
In-Reply-To: <20231120232332.4100288-1-masahiroy@kernel.org>
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
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
> crtsavres.o is linked to modules. However, as explained in commit
> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
> and always-y"), 'make modules' does not build extra-y.
>
> For example, the following command fails:
>
>   $ make ARCH=3Dpowerpc LLVM=3D1 KBUILD_MODPOST_WARN=3D1 mrproper ps3_def=
config modules
>     [snip]
>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file o=
r directory
>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/cell=
/spufs/spufs.ko] Error 1
>   make[2]: *** [Makefile:1844: modules] Error 2
>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: __bui=
ld_one_by_one] Error 2
>   make: *** [Makefile:234: __sub-make] Error 2
>

Thanks. Is this the correct Fixes tag?

Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux")

Hmm, looks like LLD might just do this now automatically for us
too without --save-restore-funcs (https://reviews.llvm.org/D79977).
But we probably still need it for older versions, so we still need
your patch.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>


> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/powerpc/lib/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index 51ad0397c17a..6eac63e79a89 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -45,7 +45,7 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)	+=3D error-injec=
t.o
>  # so it is only needed for modules, and only for older linkers which
>  # do not support --save-restore-funcs
>  ifndef CONFIG_LD_IS_BFD
> -extra-$(CONFIG_PPC64)	+=3D crtsavres.o
> +always-$(CONFIG_PPC64)	+=3D crtsavres.o
>  endif
> =20
>  obj-$(CONFIG_PPC_BOOK3S_64) +=3D copyuser_power7.o copypage_power7.o \

