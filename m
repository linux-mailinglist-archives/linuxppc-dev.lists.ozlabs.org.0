Return-Path: <linuxppc-dev+bounces-1225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B0974752
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 02:24:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3LtY2dWKz2yRZ;
	Wed, 11 Sep 2024 10:24:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726014293;
	cv=none; b=IhXweBsZuokb2yNa0Q7UiYA9G7KjuqvkSPSlTH2wF7UgOsSuTO9fIPobvYZyNaqWH8C4VGPieXleelqSMWZ42jI6rjVC19vjpbwYnqrpELJnywFc4bOt/03Pu48lOOQRYIu7C9d+O3hDpiWY+VxquwDI+sD/ZvHAW+zDiEIKZWLBMeqUAK1TpUfxI60QPAcbAWaFPjcuTlVGnEVjqPSIspnYySyiI9MX+rpFZMdZhl6Lh1eLFvRuppnbjcazdMhsXzW+vb8r3/8DKeKg2VecBKX7QdeJLgPvrGYn53WQMeJeZv4GRA3k1iqX9vJ9pskw3HtaJh1Xdg8+VWVbweq4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726014293; c=relaxed/relaxed;
	bh=hQL7b2T+ck7yVp9AOdbZlAurU0fDqRzd8GlLZ/sklTg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=DjDaLOg4JDrZ+0hNP4SCQVFD6/DHR3rUG4Jc+cDWT3M7UPREgEbozcsaVJQHl2wmDgZbS2HAwk1o7kCJcvEh6wgm3QFtQZvWeSfHVFxvPBJO9E5E8tm6qdCLEO+TQKmxooMoyGSTiPFrvv+kKWyYQmqWG9qFQisjxTk7bqrun+M7bP3psnRAoSWm7WXPeHYjSxsJq1HSuv9IdGQCIesZG4fq8AZMFGIeut9zu7RgYIkgMJCM8gWEFl2Lv3MELqGclWtkT6IqnSLpwMN+kDx/Cys7Ab8eYE5mUFE68Hq6qUzw/Hgpt6pxAy91Ih1yuyGep6l/UoJYJd3E4/wWIHjUAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iXONZf1N; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iXONZf1N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3LtX6hhwz2yPM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 10:24:51 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-718e1ce7e84so3073473b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 17:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726014289; x=1726619089; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQL7b2T+ck7yVp9AOdbZlAurU0fDqRzd8GlLZ/sklTg=;
        b=iXONZf1Ni/IljTs/QChkMK4v4hdXIY2LdlFq3QdHkNl0POLCdxzrgoiN7ThuICrCA2
         AoAf69jHgkdaPEW6DqNb43gAbzhf3asvvjpwbNjmJGaIjkhlnQsAIBR28IqhqrO8QPtS
         Od1kV7bTSEFfB+hlINR7d845C9CyE0mfMxOvVF3r6RQn9bjGD0YQS/0GXBIY+I/lcXwO
         TnRbTS8CX5Qg20JsgiwVP5jvMMRLrUE58WpcaOHO8bURQC5zaZyBswiY1/2FMjVhFDbO
         VWpRvtp45BCwNhoGYReA/Nt/OEEEFLkkQxYfQcq/TgvwBOebduf79bhi8pzmOVsOxtFa
         dlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726014289; x=1726619089;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hQL7b2T+ck7yVp9AOdbZlAurU0fDqRzd8GlLZ/sklTg=;
        b=G5J90A2mdCtR8FGkRbuj40ejvnK+exmXZ3MIM2KH/kjxg3WyMsqHkGLxQXcRZ/W+AV
         7JU1MlCfVirY/qzMBLl2pkZDW6fVhUnydb+EwdsmDzG8jGH4439Kv5PSHcH779CxpyQn
         +/SckDriLp830UgfTsm8t4Qg6GepFF3C3PBCtzl4ZYhNArGJ3swJDtoxPN579FA0Iloz
         UHaXe0dR4NFxMp4peWY0/vud5sZzKZKFRZFKBO0lnVUHhnj7H8RiEJVvda7R34RHlGiZ
         Mr6rRjJ9QbHrWFrjShu1qyAjiGQ1tqvHC1OrUeKEs4/TCG10XJFUA7ulr3WUzqTf8ZD5
         6F1A==
X-Forwarded-Encrypted: i=1; AJvYcCVYXKYQeEOlwSmzTljCJzrKYmZKtdKQ93VU+5gn2/y1s8uypCWTGkA9ij6EXytfComhMYESpY+iQLLKsDs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyotPVatDPOVgeZ2jMBvT/RsrFyd4jWwNcw7ran39K5Q9ocGo8r
	ORHhD3H7r0okpEPx6VOsPwqXh0unj64m/d0saDkXkM2B8jM8S9kf
X-Google-Smtp-Source: AGHT+IEBdeHkCceNz2Cdj6vYvPK7rPbq1iaO3iYumNfAUIh3qemUllNju96UzHJ623oYLYNeAbHUxw==
X-Received: by 2002:a05:6a00:988:b0:714:2198:26b9 with SMTP id d2e1a72fcca58-718d5e50f2emr17269272b3a.13.1726014288800;
        Tue, 10 Sep 2024 17:24:48 -0700 (PDT)
Received: from localhost ([1.146.47.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe264csm1918606b3a.61.2024.09.10.17.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 17:24:48 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 10:24:34 +1000
Message-Id: <D430ZV4FP2GE.3B7VE2I37RPXX@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>
Cc: <pbonzini@redhat.com>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <frankja@linux.ibm.com>, <imbrenda@linux.ibm.com>, <nrb@linux.ibm.com>,
 <atishp@rivosinc.com>, <cade.richard@berkeley.edu>, <jamestiotio@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 3/4] configure: Support cross
 compiling with clang
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.18.2
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-9-andrew.jones@linux.dev>
In-Reply-To: <20240904105020.1179006-9-andrew.jones@linux.dev>

On Wed Sep 4, 2024 at 8:50 PM AEST, Andrew Jones wrote:
> When a user specifies the compiler with --cc assume it's already
> fully named, even if the user also specifies a cross-prefix. This
> allows clang to be selected for the compiler, which doesn't use
> prefixes, but also still provide a cross prefix for binutils. If
> a user needs a prefix on the compiler that they specify with --cc,
> then they'll just have to specify it with the prefix prepended.

Makes sense.

> Also ensure user provided cflags are used when testing the compiler,
> since the flags may drastically change behavior, such as the --target
> flag for clang.

Could be a separate patch but no big deal.

>
> With these changes it's possible to cross compile for riscv with
> clang after configuring with
>
>  ./configure --arch=3Driscv64 --cc=3Dclang --cflags=3D'--target=3Driscv64=
' \
>              --cross-prefix=3Driscv64-linux-gnu-

Nice. Perhaps add a recipe to README?

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  configure | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/configure b/configure
> index 27ae9cc89657..337af07374df 100755
> --- a/configure
> +++ b/configure
> @@ -130,6 +130,7 @@ while [[ "$1" =3D -* ]]; do
>  	    ;;
>  	--cc)
>  	    cc=3D"$arg"
> +	    cc_selected=3Dyes
>  	    ;;
>  	--cflags)
>  	    cflags=3D"$arg"
> @@ -200,6 +201,10 @@ while [[ "$1" =3D -* ]]; do
>      esac
>  done
> =20
> +if [ -z "$cc_selected" ] && [ "$cross_prefix" ]; then
> +    cc=3D"$cross_prefix$cc"
> +fi
> +
>  if [ -z "$efi" ] || [ "$efi" =3D "n" ]; then
>      [ "$efi_direct" =3D "y" ] && efi_direct=3D
>  fi
> @@ -370,7 +375,7 @@ fi
>  cat << EOF > lib-test.c
>  __UINT32_TYPE__
>  EOF
> -u32_long=3D$("$cross_prefix$cc" -E lib-test.c | grep -v '^#' | grep -q l=
ong && echo yes)
> +u32_long=3D$("$cc" $cflags -E lib-test.c | grep -v '^#' | grep -q long &=
& echo yes)
>  rm -f lib-test.c
> =20
>  # check if slash can be used for division
> @@ -379,7 +384,7 @@ if [ "$arch" =3D "i386" ] || [ "$arch" =3D "x86_64" ]=
; then
>  foo:
>      movl (8 / 2), %eax
>  EOF
> -  wa_divide=3D$("$cross_prefix$cc" -c lib-test.S >/dev/null 2>&1 || echo=
 yes)
> +  wa_divide=3D$("$cc" $cflags -c lib-test.S >/dev/null 2>&1 || echo yes)
>    rm -f lib-test.{o,S}
>  fi
> =20
> @@ -442,7 +447,7 @@ ARCH=3D$arch
>  ARCH_NAME=3D$arch_name
>  ARCH_LIBDIR=3D$arch_libdir
>  PROCESSOR=3D$processor
> -CC=3D$cross_prefix$cc
> +CC=3D$cc
>  CFLAGS=3D$cflags
>  LD=3D$cross_prefix$ld
>  OBJCOPY=3D$cross_prefix$objcopy


