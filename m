Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E57AB72DAD4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 09:29:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgKv95L4Pz30P4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 17:29:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.182; helo=mail-yw1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgKtd1PwSz2xpr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 17:29:12 +1000 (AEST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-56cf913434cso35945277b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 00:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686641350; x=1689233350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKEzJjzBKla4S0x8jxwIAxVSx314J/aF9PC4BBXNBUc=;
        b=fejkSW0sLrzbPs6Ulkds0tcTQPjzc97P9MErKFDmSYMfEOs3qVyr3IjZRURY/eIS9o
         9CkHtcC8q19qzB1s7y3EQnH+y1oxZ+sB88np+q75UlLoJlzhPNsTarJegxmvapWys08O
         67aR4pbfTZFQHoPfK61IPkrDp+PkyyI4+N2C8omRvZ6jSUNbeWpWHzOypqhwUyvITzmQ
         ea4IgVvxCrqSemEzPzkIrQ4ot4mz3+Ar6KQ4hdvPorJ8n0wUjb9nh03Zvu6VcrSw9ggB
         jNPTJMH/9e17yuf2x/m/2OB/Ky/M2r2OXFEAlMl3z+395cpjazvn2YveS3hztKNA1CwT
         ctwA==
X-Gm-Message-State: AC+VfDyN02BEhBHlXoJ9cTYjSdveYqBidQS/385JP4iT/nx7H32ns7G6
	LHPgkcvXXtVCYR3VfJb02nvZ0Jtkhrrv+g==
X-Google-Smtp-Source: ACHHUZ59prt2KRtRzaT9wi4AmAF7pVqqgcKWcExbw+pJdgQKrJQ2aMMyH7JZyPGHZTEk97E20cgHeA==
X-Received: by 2002:a0d:d245:0:b0:565:9fc7:9330 with SMTP id u66-20020a0dd245000000b005659fc79330mr1062502ywd.17.1686641349703;
        Tue, 13 Jun 2023 00:29:09 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id t202-20020a8183d3000000b005619cfb1b88sm3057823ywf.52.2023.06.13.00.29.08
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 00:29:08 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-56cf913434cso35945077b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 00:29:08 -0700 (PDT)
X-Received: by 2002:a0d:d611:0:b0:56d:ddc:cdbb with SMTP id
 y17-20020a0dd611000000b0056d0ddccdbbmr1077781ywd.25.1686641348561; Tue, 13
 Jun 2023 00:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230612210423.18611-1-vishal.moola@gmail.com> <20230612210423.18611-26-vishal.moola@gmail.com>
In-Reply-To: <20230612210423.18611-26-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jun 2023 09:28:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUk2OM+j_j8XSkMxRnNqmKy3qwUA8Mq-RA+p+ByfY-+4g@mail.gmail.com>
Message-ID: <CAMuHMdUk2OM+j_j8XSkMxRnNqmKy3qwUA8Mq-RA+p+ByfY-+4g@mail.gmail.com>
Subject: Re: [PATCH v4 25/34] m68k: Convert various functions to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 11:05=E2=80=AFPM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> As part of the conversions to replace pgtable constructor/destructors wit=
h
> ptdesc equivalents, convert various page table functions to use ptdescs.
>
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

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
