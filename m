Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EAC6F51A6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 May 2023 09:33:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QB7wY5MVbz3f6r
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 May 2023 17:33:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ld7X1/eO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ld7X1/eO;
	dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QB7vh365Yz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 May 2023 17:32:45 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-b996127ec71so7074739276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 May 2023 00:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683099161; x=1685691161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uy5PpAsKGu7ciMA0KH8W435+ovkPrJCw8/GzBOIehDY=;
        b=ld7X1/eOQn3jw3nscqDgK6ddNhZLhCbJd9fPsanB0OgdXTNVkQ6EYUUqBqyPM/a4vY
         CbHtyASiJA418MX0oSjMiiVC6FiPHw14WLUdEeW4Umr+YbCrJrLf7Hu5eVK7mdrvS4DL
         9OmWoG7mWW8rmfaib9lGQ1oMZzSYCCqUfliHLErQsjuMdJcbCt3LcNup8fzoyt0Y/8GR
         akHy/Cg/e08JrY/cBm35hsRfsCSXWjiae/OD5Dh8cA2PThcAjwbY7B/39CO37V9omWgv
         O4OooSmTvvfZDRD1Nt5OUOhrDwbp6u/SmztihR1xLy5JcdwnB1lQkg/5xvUiJBgW8awI
         T2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683099161; x=1685691161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uy5PpAsKGu7ciMA0KH8W435+ovkPrJCw8/GzBOIehDY=;
        b=hx7n8xLG3dq5sLhKCVEiCU6UXQ+qLSbjmBOjvVquKuiIzT3WUY9Ry9Yicxv6JfGR9G
         UsXmRCJ+/WaZXcTqs/umcKJ2/w0Wypt9JoEfq2CdUlIu9ssKe7vWBEVXlvcsE7m8CUJ0
         Qi9x7LeXN9HwkzK4sLL8F+1sbvVYjmHNJEw5O/Cp3I35lhpvFCRxbDh+Hrjz0W5Ri4AQ
         L+I8bZMK3GAFZkBHpbngz6JvaME1tJA5+jXjRZfK/X0VGIi2wyn5Iyoe8AsMXmeilE1J
         su8AwpftNO5hTruvaAT3S61lzCeLdLZpbeZ71lZgQ12Pm+yu1GDauozZ6VqHlhrGL39Y
         1Uig==
X-Gm-Message-State: AC+VfDz99Fk6sT0Qzy7ScwYz8KQQ6IdllVsl26ILTdZvklxfL179UUcL
	7hX3f764AJx+HDW9io1RNOGYfx0cGLEGVtG9Bj6TqQ==
X-Google-Smtp-Source: ACHHUZ73FCxNpyBPivD8TlcnhveCdt/a/J/xcLCbn8/+GFgeEvve0a+EDCSbzNvVgcIQCyONugRorkzlO9zyElssW9s=
X-Received: by 2002:a25:4c84:0:b0:b9e:5006:42af with SMTP id
 z126-20020a254c84000000b00b9e500642afmr5598495yba.58.1683099161569; Wed, 03
 May 2023 00:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <168155718437.13678.714141668943813263.stgit@skinsburskii.localdomain>
In-Reply-To: <168155718437.13678.714141668943813263.stgit@skinsburskii.localdomain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 3 May 2023 09:32:30 +0200
Message-ID: <CACRpkdYCZ0rya3hE+BRrHwP=fASjkpp_Y=BiC=WY-_z0yyRNEg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Expect immutable pointer in virt_to_phys/isa_virt_to_bus
 prototypes
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
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
Cc: linux-ia64@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Omar Sandoval <osandov@fb.com>, linux-arch@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Chris Down <chris@chrisdown.name>, linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, A
 ndrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 27, 2023 at 7:41=E2=80=AFPM Stanislav Kinsburskii
<skinsburskii@linux.microsoft.com> wrote:

> This series is aimed to address compilation warnings when a constant poin=
ter
> is passed to virt_to_phys and isa_virt_to_bus functions:
>
>   warning: passing argument 1 of =E2=80=98virt_to_phys=E2=80=99 discards =
=E2=80=98const=E2=80=99 qualifier from pointer target type
>   warning: passing argument 1 of =E2=80=98isa_virt_to_bus=E2=80=99 discar=
ds =E2=80=98const=E2=80=99 qualifier from pointer target type
>
> The change(s) is the same for all architectures, but it's split into a se=
ries on
> per-arch basis to simplify applying and testing on the maintainers side.
>
> The following series implements...

This is nice.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I am working with an adjacent task, which is to make virt_to_pfn() and
pfn_to_virt() into static inlines. I might need to rebase my work on top
of this but it should be doable, I am currently stressing the buildbots
with this with the idea to propose it to Arnd once v6.4-rc1 is out:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git=
/log/?h=3Db4/virt-to-pfn-v6-4-rc1

Yours,
Linus Walleij
