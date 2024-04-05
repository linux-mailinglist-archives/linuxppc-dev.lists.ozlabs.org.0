Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8895989A54D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 21:58:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OgMVJnTo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VB8SJ2Kbkz3vgC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 06:58:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=OgMVJnTo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=justinstitt@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VB8Rb0FvGz3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 06:58:01 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-516d4d80d00so1231338e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 12:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712347074; x=1712951874; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djSDb4ARr+uYrvgN8eRFQUZSJ4nYLrBVFrRGdM6sRAs=;
        b=OgMVJnTo4YJc+wiQ9OyTEQvcj7GXcSLzC+u20eROuWJfGIZPbzgcH1qVUV9ocMHePG
         WVzEtdeFzGvt5k32kgWCQeIGv7boq+7nn9F1AW3lpSz/tagqLuiB6liLpUOpfrMK/UWg
         BcDN2VOQq0Hx4asPTunJi9z73JxKR1ToWSmZz8pbd63unM+vBd/h/RSQ7qhkEmME40A3
         ThTNLrnt87FFXm99Y1vdBJWvVGuMUvM+DSA+IOLZH4EyAzUhWaa8t4fK6L0ZB9bDgL8+
         zCeAcGsZKL22IKHZUUFIv84cjxve4MuGFeIqWCeh5rO9/Rhg6mP+7m09P7ZROb2eGMLz
         jgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712347074; x=1712951874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djSDb4ARr+uYrvgN8eRFQUZSJ4nYLrBVFrRGdM6sRAs=;
        b=axFTr0BV6M5Fadp37AoMKrWPE2ous3RFCO7I0U7Oq0ohmNWmZj5JivsUuLcmTwhbjQ
         JPY3EmIx4ylUPDr9wlIorauPTpWXCyd/qYTYq2b8fasfpHfu7Ibhj+7HFdoNN9YYwJzE
         der6N3EcLs1SKxadHGn96G2f4XVJqJrzYF3SrCfmuPyGY3i088+JUPgWSpkJsGEQgx2d
         2hUtpQ1j7Eama2tGCBmccmzp+AoI0No5RZglh7cpfH5oYDr57P1OOkZ0HcWRgLsKac24
         JC+xkFVxiFuW7IpBBI5LmFW9KBcE0V6NHhoyvp4c7AGKL1yusL/WGBh9bzJzxFyOsA1J
         PZVA==
X-Forwarded-Encrypted: i=1; AJvYcCVq9WuRnD+e3mFrY+L/QLLDxdC6ke2i+30LwGu+qc7lhv/vsjLdm8eexcRQo2Bcjcl/xTD7cGyLprGxegXOtR2aJYq3jt13MT/9w0RJyQ==
X-Gm-Message-State: AOJu0Yyb2VSn8YW7SE+ABj/cy9VJ2sBedEQFaS5TgDz76u/ESkM4spjG
	/ey3NfQdCuJ5bg/Ee40zy2Gv+UE3crZPdN79o/bC1+SZafPHsevo8SOmt9MFsWmkWhglTVAyfJL
	60D2xvftFczXn90izvv8v10mPrtCENXeZIF7Y
X-Google-Smtp-Source: AGHT+IEI5tCV/tLIzJl1zhvmYgYEcOj4a8SU+B1nmDwswy/V0l1zUgcxaVh6wGimoJvL8b/VSgyjgbLEs9K12/PT7hU=
X-Received: by 2002:ac2:55a6:0:b0:513:ca65:8c58 with SMTP id
 y6-20020ac255a6000000b00513ca658c58mr1880055lfg.43.1712347074344; Fri, 05 Apr
 2024 12:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240405-ppc-fix-wa-fatal-warnings-clang-v1-1-bdcd969f2ef0@kernel.org>
In-Reply-To: <20240405-ppc-fix-wa-fatal-warnings-clang-v1-1-bdcd969f2ef0@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 5 Apr 2024 12:57:41 -0700
Message-ID: <CAFhGd8pcaUqH1z=uywHadFUkNUnK_tkoDzf7P5kOqmgEpx5nwg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Fix fatal warnings flag for LLVM's integrated assembler
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: ajd@linux.ibm.com, llvm@lists.linux.dev, patches@lists.linux.dev, morbo@google.com, bgray@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 5, 2024 at 12:31=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> When building with LLVM_IAS=3D1, there is an error because
> '-fatal-warnings' is not recognized as a valid flag:
>
>   clang: error: unsupported argument '-fatal-warnings' to option '-Wa,'
>
> Use the double hyphen version of the flag, '--fatal-warnings', which
> works with both the GNU assembler and LLVM's integrated assembler.
>
> Fixes: 608d4a5ca563 ("powerpc: Error on assembly warnings")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Nice catch.

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  arch/powerpc/Kbuild | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/Kbuild b/arch/powerpc/Kbuild
> index da862e9558bc..571f260b0842 100644
> --- a/arch/powerpc/Kbuild
> +++ b/arch/powerpc/Kbuild
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
> -subdir-ccflags-$(CONFIG_PPC_WERROR) :=3D -Werror -Wa,-fatal-warnings
> -subdir-asflags-$(CONFIG_PPC_WERROR) :=3D -Wa,-fatal-warnings
> +subdir-ccflags-$(CONFIG_PPC_WERROR) :=3D -Werror -Wa,--fatal-warnings
> +subdir-asflags-$(CONFIG_PPC_WERROR) :=3D -Wa,--fatal-warnings
>
>  obj-y +=3D kernel/
>  obj-y +=3D mm/
>
> ---
> base-commit: bfe51886ca544956eb4ff924d1937ac01d0ca9c8
> change-id: 20240405-ppc-fix-wa-fatal-warnings-clang-603f0ebb0133
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
