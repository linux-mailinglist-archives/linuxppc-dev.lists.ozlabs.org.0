Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D40416CF748
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 01:33:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pn2tJ5QXsz3fKh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 10:33:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxtx.org (client-ip=209.85.214.180; helo=mail-pl1-f180.google.com; envelope-from=jmforbes@linuxtx.org; receiver=<UNKNOWN>)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmrkH69tkz3fcf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:55:51 +1100 (AEDT)
Received: by mail-pl1-f180.google.com with SMTP id kc4so15342917plb.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62ZIWkSy5tZoUHv/2BRxXjvjKExsY1hv+Zfd9ZYJQ4E=;
        b=b8l3hDGhau7Bc5OyMgPu8FYIPCyc96IjYtOacdyiBRAJPwcIyrWfMfTsfmnpYrH1da
         LjcpIAxqX3urzswbGXHzSvWwShXTExV1fuHYCGxFlQXtEBEzoEdRa0J484d3f7jBYbaC
         UnjhdzJNFAZ2MnWU3O83YA4bpMrn5YoyU0qA/40Syxkovs0L3uCJ5vk3AvQ8E7EQzVXb
         4BTHm3uINZ0UGamCmfRKURt8f9SLj7s8ItfcMhV8hx9qJx3dACyDyGe6pWj+JPPpO7xn
         YWe6PaaLcBIGErX7LOjSFHVhIuW/MXAayMb//71bbjkrAOnQ05YCRT6rTvtM2ejs7sf5
         JMsg==
X-Gm-Message-State: AAQBX9dlbRE8joL6eCDk+MXTj3TbopicMiv1stm7pgyhYrvKtJ1RhkfR
	XwZshCXu3JUbm8m8KZtg24Xv/FztOPg9kayIQObpXQ==
X-Google-Smtp-Source: AKy350aLDH5YR9t419L5OiinTR+6vLBCDmWiJH85fFWabTVqFHlXOqvkdPLNLHEa0183i9K3F9W0CuWctZ/RgFAniww=
X-Received: by 2002:a17:902:c3c6:b0:1a1:b318:2776 with SMTP id
 j6-20020a170902c3c600b001a1b3182776mr7729184plj.0.1680105349103; Wed, 29 Mar
 2023 08:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230325060828.2662773-1-rppt@kernel.org> <20230325060828.2662773-3-rppt@kernel.org>
In-Reply-To: <20230325060828.2662773-3-rppt@kernel.org>
From: Justin Forbes <jforbes@fedoraproject.org>
Date: Wed, 29 Mar 2023 10:55:37 -0500
Message-ID: <CAFxkdAr5C7ggZ+WdvDbsfmwuXujT_z_x3qcUnhnCn-WrAurvgA@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] arm64: drop ranges in definition of ARCH_FORCE_MAX_ORDER
To: Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 30 Mar 2023 10:33:05 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 25, 2023 at 1:09=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> It is not a good idea to change fundamental parameters of core memory
> management. Having predefined ranges suggests that the values within
> those ranges are sensible, but one has to *really* understand
> implications of changing MAX_ORDER before actually amending it and
> ranges don't help here.
>
> Drop ranges in definition of ARCH_FORCE_MAX_ORDER and make its prompt
> visible only if EXPERT=3Dy

I do not like suddenly hiding this behind EXPERT for a couple of
reasons.  Most importantly, it will silently change the config for
users building with an old kernel config.  If a user has for instance
"13" set and building with 4K pages, as is the current configuration
for Fedora and RHEL aarch64 builds, an oldconfig build will now set it
to 10 with no indication that it is doing so.  And while I think that
10 is a fine default for many aarch64 users, there are valid reasons
for choosing other values. Putting this behind expert makes it much
less obvious that this is an option.

Justin

> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/arm64/Kconfig | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e60baf7859d1..7324032af859 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1487,11 +1487,9 @@ config XEN
>  # 16K |       27          |      14      |       13        |         11 =
        |
>  # 64K |       29          |      16      |       13        |         13 =
        |
>  config ARCH_FORCE_MAX_ORDER
> -       int "Maximum zone order" if ARM64_4K_PAGES || ARM64_16K_PAGES
> +       int "Maximum zone order" if EXPERT && (ARM64_4K_PAGES || ARM64_16=
K_PAGES)
>         default "13" if ARM64_64K_PAGES
> -       range 11 13 if ARM64_16K_PAGES
>         default "11" if ARM64_16K_PAGES
> -       range 10 15 if ARM64_4K_PAGES
>         default "10"
>         help
>           The kernel memory allocator divides physically contiguous memor=
y
> --
> 2.35.1
>
>
