Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD706FEC31
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 09:02:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH2rq205qz3fNd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 17:02:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.43; helo=mail-oa1-f43.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH2rK1lYkz2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 17:01:52 +1000 (AEST)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1929818d7faso49208524fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 00:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683788510; x=1686380510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gv6cvH2UY+DsSAH/1SoTqLLUBTfL/OySbHO2647mvDo=;
        b=TTsQaOfQZMQFo2BbVMCeDY5KKtLuDJ2+cd3MLwztuvwav33+Wtk34zU387fP3rI+nI
         J/mHLoOcmqqgIPAONvHCVEKu50fNiIYloO1jzFbdrg/syVcuXKRKQUMkK8D9SyAVFx14
         4EIxsi3q1hH9Gg0BDfzinKB9gsYoQuYQG6AtFLY5tPITqKcPXsAJSSfCLfqgsGvdQwft
         EXGb+h7ZWe228CTKzRMrNNX+Zve2kOeuO1fDTFbweVcLjqCaYJcbEMlc1IunW3CV9JGd
         HCD45rNAyhqwmPm9Qvyqk722r8KwmHYQ3pE4LGYAa4emEXYN+kCk0185rc61+NE1EDfM
         +ypQ==
X-Gm-Message-State: AC+VfDy+s6gAC7dc0p5UWBvAaS5sDxmr5y523Gr40a/QztdMnbEkvfzy
	4DJvSApnkpRzAEEnLSnQUjiSugzXBkRv3w==
X-Google-Smtp-Source: ACHHUZ7XAzfyr1+uUcwAgyxLsfqOsT/lpcfNMcQUQWhlsb2ET9w9tGnD2lrGZyP8TGycKJ7nXnNFdQ==
X-Received: by 2002:a05:6870:b494:b0:196:4a09:a6f3 with SMTP id y20-20020a056870b49400b001964a09a6f3mr3342090oap.2.1683788509892;
        Thu, 11 May 2023 00:01:49 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com. [209.85.160.44])
        by smtp.gmail.com with ESMTPSA id v44-20020a056870956c00b00184591ae6d0sm7766421oal.26.2023.05.11.00.01.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 00:01:49 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-18f4a6d2822so49097036fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 00:01:49 -0700 (PDT)
X-Received: by 2002:a25:1342:0:b0:b25:a1e1:5b65 with SMTP id
 63-20020a251342000000b00b25a1e15b65mr22072246ybt.5.1683788488909; Thu, 11 May
 2023 00:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230510195806.2902878-1-nphamcs@gmail.com>
In-Reply-To: <20230510195806.2902878-1-nphamcs@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2023 09:01:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=PNCb1VYfUkEb9rPwGVB=1tkwvm-XBqECyhHR4SNGKg@mail.gmail.com>
Message-ID: <CAMuHMdV=PNCb1VYfUkEb9rPwGVB=1tkwvm-XBqECyhHR4SNGKg@mail.gmail.com>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
To: Nhat Pham <nphamcs@gmail.com>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, linux-mm@kvack.org, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, linux@armlinux.org.uk, mattst88@gmail.com, borntraeger@linux.ibm.com, linux-alpha@vger.kernel.org, gor@linux.ibm.com, hca@linux.ibm.com, kernel-team@meta.com, richard.henderson@linaro.org, npiggin@gmail.com, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, glaubitz@physik.fu-berlin.de, linux-arm-kernel@lists.infradead.org, chris@zankel.net, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, jcmvbkbc@gmail.com, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, svens@linux.ibm.com, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nat,

On Wed, May 10, 2023 at 9:58=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
> cachestat is previously only wired in for x86 (and architectures using
> the generic unistd.h table):
>
> https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs@gmail.com/
>
> This patch wires cachestat in for all the other architectures.
>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
>  arch/arm/tools/syscall.tbl                  | 1 +

Looking at the last addition of a syscall (commit 21b084fdf2a49ca1
("mm/mempolicy: wire up syscall set_mempolicy_home_node"), it looks
like you forgot to update arm64 in compat mode? Or is that not needed?

>  arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

>  arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
>  arch/mips/kernel/syscalls/syscall_n32.tbl   | 1 +
>  arch/mips/kernel/syscalls/syscall_n64.tbl   | 1 +
>  arch/mips/kernel/syscalls/syscall_o32.tbl   | 1 +
>  arch/parisc/kernel/syscalls/syscall.tbl     | 1 +
>  arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
>  arch/s390/kernel/syscalls/syscall.tbl       | 1 +
>  arch/sh/kernel/syscalls/syscall.tbl         | 1 +
>  arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
>  arch/xtensa/kernel/syscalls/syscall.tbl     | 1 +
>  14 files changed, 14 insertions(+)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
