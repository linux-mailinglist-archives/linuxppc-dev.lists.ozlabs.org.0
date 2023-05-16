Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C85447045C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 09:08:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL6lm4S3tz3fG6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 17:08:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.178; helo=mail-yw1-f178.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QL6lG5n3Kz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 17:08:10 +1000 (AEST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-55a2cb9788dso194718567b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 00:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684220886; x=1686812886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTQjfNfGsMfbyHJYnY/d7iucXXNLZgToVmLQABWZsBQ=;
        b=jjhNcLkyo8IdkFKOPds3w5d4hfuBgOMr2Ke+rNJ/eEpD4MJlxew1UtmMKkbJhlWMAf
         XMS5dDbPcCi99GyuMr0vPel8iFxoU08Cl79hReI3ugq37WevHTQ3nCaJTTE/X3kTT2Oi
         ngBpf0DTSkMfrthIXUocq8Jbg7xYdFQxMJJksGshdREKlq3hkWW1BaWMxldMp8k5ZOwI
         PCrA6TvSmOqWUZNMiSufhJCTKu/+2fP1yYZdO1ZwKVgbzyDTkZSBxJJlddVJkB1WcO3h
         odXP2nNhr5Lc5tKJFH1i3aMOfSDduBqhZpjt1JhnvhF7fxPEEN7tYmjlpG+eCuSU5FF0
         9mQw==
X-Gm-Message-State: AC+VfDwXCqyMb1DeATiRJ9N88FkbQ24Zm0DijKuJjNru1IX1AHHpwDag
	Q7ydIh/oM99aOMEIBjC/ybxYo8JfQiM6ng==
X-Google-Smtp-Source: ACHHUZ7NgbAaA57zkMlB7D/4Wt5pUt+oGPpLIH44ptoKoTQip5Vu+m1ZwHpzBfKKT8GWHqO8BBybTQ==
X-Received: by 2002:a81:61c6:0:b0:55a:abb4:4c30 with SMTP id v189-20020a8161c6000000b0055aabb44c30mr31645521ywb.48.1684220885310;
        Tue, 16 May 2023 00:08:05 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id p205-20020a8174d6000000b0055ddea0db57sm386077ywc.146.2023.05.16.00.08.04
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 00:08:04 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ba8374001abso10033276.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 00:08:04 -0700 (PDT)
X-Received: by 2002:a25:1c6:0:b0:ba7:dcad:9b6 with SMTP id 189-20020a2501c6000000b00ba7dcad09b6mr4131622ybb.40.1684220883815;
 Tue, 16 May 2023 00:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230515090848.833045-1-bhe@redhat.com> <20230515090848.833045-2-bhe@redhat.com>
In-Reply-To: <20230515090848.833045-2-bhe@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 May 2023 09:07:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-bL-khVUN59ku1GwV6i4OC3O9AU1GQU2hfGn+JrsBXg@mail.gmail.com>
Message-ID: <CAMuHMdU-bL-khVUN59ku1GwV6i4OC3O9AU1GQU2hfGn+JrsBXg@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 01/17] asm-generic/iomap.h: remove
 ARCH_HAS_IOREMAP_xx macros
To: Baoquan He <bhe@redhat.com>
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
Cc: linux-arch@vger.kernel.org, wangkefeng.wang@huawei.com, arnd@arndb.de, schnelle@linux.ibm.com, netdev@vger.kernel.org, deller@gmx.de, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, David.Laight@aculab.com, willy@infradead.org, loongarch@lists.linux.dev, agordeev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, shorne@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 15, 2023 at 11:14=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
> Let's use '#define ioremap_xx' and "#ifdef ioremap_xx" instead.
>
> For each architecture to remove defined ARCH_HAS_IOREMAP_xx macros in
> To remove defined ARCH_HAS_IOREMAP_xx macros in <asm/io.h> of each ARCH,
> the ARCH's own ioremap_wc|wt|np definition need be above
> "#include <asm-generic/iomap.h>. Otherwise the redefinition error would
> be seen during compiling. So the relevant adjustments are made to avoid
> compiling error:
>
>   loongarch:
>   - doesn't include <asm-generic/iomap.h>, defining ARCH_HAS_IOREMAP_WC
>     is redundant, so simply remove it.
>
>   m68k:
>   - selected GENERIC_IOMAP, <asm-generic/iomap.h> has been added in
>     <asm-generic/io.h>, and <asm/kmap.h> is included above
>     <asm-generic/iomap.h>, so simply remove ARCH_HAS_IOREMAP_WT defining.
>
>   mips:
>   - move "#include <asm-generic/iomap.h>" below ioremap_wc definition
>     in <asm/io.h>
>
>   powerpc:
>   - remove "#include <asm-generic/iomap.h>" in <asm/io.h> because it's
>     duplicated with the one in <asm-generic/io.h>, let's rely on the
>     latter.
>
>   x86:
>   - selected GENERIC_IOMAP, remove #include <asm-generic/iomap.h> in
>     the middle of <asm/io.h>. Let's rely on <asm-generic/io.h>.
>
> Signed-off-by: Baoquan He <bhe@redhat.com>

>  arch/m68k/include/asm/io_mm.h       | 2 --
>  arch/m68k/include/asm/kmap.h        | 2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
