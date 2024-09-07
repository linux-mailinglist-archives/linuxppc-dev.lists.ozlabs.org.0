Return-Path: <linuxppc-dev+bounces-1142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C9E9700EB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2024 10:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X15w547wCz2yYK;
	Sat,  7 Sep 2024 18:33:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725698005;
	cv=none; b=AVvUM3qbvccFX8eStD8coR2RHwCZJ0bgeSTun5gzVMfuZ2Ji0xOT13aMVpuhNN6Y/8XFdLRe1AZ67DwrhoTYRxnZi/07c6tlIN3UcTb7CqAUU49aXXXGVuuJsONp6lRiXBuQuXmOxlwwtEPObK1EzVOMXZPOryGrKexWKIGNQhJVCxo/Q6EhyYTgSEGmWSWV7wfPFLSEAq+DZ6XgZTc1ylLZ1CSvlxj/fLvr1qL2XfK58kCHU7EMvPnsJs6bdieLCszprwkgoEH/7O0K7QR7FOfzdXpbruNs8ZzaxjtzVM48UumvHxiwTK0urbJNOALj9AFB7yvHl0vMZewiz7IoMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725698005; c=relaxed/relaxed;
	bh=zPAqREqDyeDirPC2RDM+wml7eIrpmIYMOVZ10q3a7Eg=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=ZG3ho8fjF9Ybqj9cT6Qz/f8utcdDupSHQi1iNWaBrqzUwUTuig8pi7pP9/Rcyj4Yldk0pvG2zYwv3oyhfwwpb/VH++od/cwIcWCY34DphuU9wFs0dWHsIdUyxKq5357haWfxiu08jPhngvLrd7jqBDQOR/y5c/5qbQq7ezr8jxJ6VTG12FOPd3ahqfBngswHLEe9bLdEYby4VaTkfvdnmuHfHtFdzo8N8Pgi/CoZRvZzgatZWWIja4E5nkVerMrAerGUn6TfI92DaI3AdXGAuLakDVtF1N/Xyob4Bc1M7QRqRFgpwiuuq6Jt2DeBD0W5foVyuti0BTSlbbudvh1Lsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cnlLb71x; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=chenhuacai@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cnlLb71x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=chenhuacai@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X15w5162Yz2yLg
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 18:33:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4E0C5C272F
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 08:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7AFC4CEC5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 08:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725698001;
	bh=u+uX1McwKP5BK8XQmU+PXHl98+FoSw3Bcucds2dN+dQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cnlLb71xCoe+LwDSKHLu+SAFDTXAZTH/hmvRuLNA50FuPFpQKiyYhfaxxqqqNhONf
	 /538MrEoA/xrfbDEPNIvFWKTCYrLMmrMi5VrLdjlUVlsQNkj0R8hATfkFiwMXfTJ1+
	 lOI62A81KIJ8WIJvBwf8NyGKhkR+Qhgh9EICXinHmefcNYp+rf1iR3U0E3EYHSG4+Z
	 sVaKDLE7o+zVIqp88HIQcLN0fT+8lw61EnzcGOTu87EjcEKttssbC286D0VRc4Kvzc
	 3E6gAYYOdAhCCUsi8pbwD5mA8w75lFyUPAEL7cse7H+LyPmkmFJLAu64JXCPbLTP6H
	 e+mGjam/r8JWQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c3d209da98so4096009a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Sep 2024 01:33:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXr+yi+1NuRs0FFVu3AHOnxfqIvNR3PZMXMNp+fQOWoEipvKALaYcAS0jt8/WC9OYY3XZzlWMITUljr9So=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyuZ/60ZCT/kBuIUgFb7qmJaLjmcmp5n8ACY92l9HAfyGRLzMND
	sstEENWJyvZZ+3oqr5R8v/Mz124R3E8r+YxZsu/gwFOjHGPyA2xS9A8EsIL6iDTokzBjwTWou5n
	gZbLR+RglUr6rPtBqOsadmfs/PNU=
X-Google-Smtp-Source: AGHT+IFsZizcv4SWg/uc4wlWEYG5dAogoRVM+IMfx6S10F6ncEDAhujg1s1ypzSz68Wq2OEYPS2U6E3IM7nuU3g2JxE=
X-Received: by 2002:a05:6402:5208:b0:5c2:2b1f:f75a with SMTP id
 4fb4d7f45d1cf-5c3c1f87bf5mr14240990a12.11.1725697999525; Sat, 07 Sep 2024
 01:33:19 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240907082720.452148-1-maobibo@loongson.cn>
In-Reply-To: <20240907082720.452148-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 7 Sep 2024 16:33:07 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4miZqRDWw5SkfdJJRxuV_4obnqLWHc6zdgGC09xE5rRw@mail.gmail.com>
Message-ID: <CAAhV-H4miZqRDWw5SkfdJJRxuV_4obnqLWHc6zdgGC09xE5rRw@mail.gmail.com>
Subject: Re: [PATCH] smp: Mark smp_prepare_boot_cpu() __init
To: Bibo Mao <maobibo@loongson.cn>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Thomas Gleixner <tglx@linutronix.de>, Naveen N Rao <naveen@kernel.org>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Sat, Sep 7, 2024 at 4:27=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrote=
:
>
> Function smp_prepare_boot_cpu() is only called at boot stage, here
> mark it as __init.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/kernel/smp.c | 2 +-
>  arch/mips/kernel/smp.c      | 2 +-
>  arch/powerpc/kernel/smp.c   | 2 +-
>  include/linux/smp.h         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
> index ca405ab86aae..be2655c4c414 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -476,7 +476,7 @@ core_initcall(ipi_pm_init);
>  #endif
>
>  /* Preload SMP state for boot cpu */
> -void smp_prepare_boot_cpu(void)
> +void __init smp_prepare_boot_cpu(void)
>  {
>         unsigned int cpu, node, rr_node;
>
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 0362fc5df7b0..39e193cad2b9 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -439,7 +439,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  }
>
>  /* preload SMP state for boot cpu */
> -void smp_prepare_boot_cpu(void)
> +void __init smp_prepare_boot_cpu(void)
>  {
>         if (mp_ops->prepare_boot_cpu)
>                 mp_ops->prepare_boot_cpu();
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 46e6d2cd7a2d..4ab9b8cee77a 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1166,7 +1166,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>         cpu_smt_set_num_threads(num_threads, threads_per_core);
>  }
>
> -void smp_prepare_boot_cpu(void)
> +void __init smp_prepare_boot_cpu(void)
>  {
>         BUG_ON(smp_processor_id() !=3D boot_cpuid);
>  #ifdef CONFIG_PPC64
> diff --git a/include/linux/smp.h b/include/linux/smp.h
> index fcd61dfe2af3..6a0813c905d0 100644
> --- a/include/linux/smp.h
> +++ b/include/linux/smp.h
> @@ -109,7 +109,7 @@ static inline void on_each_cpu_cond(smp_cond_func_t c=
ond_func,
>   * Architecture specific boot CPU setup.  Defined as empty weak function=
 in
>   * init/main.c. Architectures can override it.
>   */
> -void smp_prepare_boot_cpu(void);
> +void __init smp_prepare_boot_cpu(void);
>
>  #ifdef CONFIG_SMP
>
>
> base-commit: b31c4492884252a8360f312a0ac2049349ddf603
> --
> 2.39.3
>

