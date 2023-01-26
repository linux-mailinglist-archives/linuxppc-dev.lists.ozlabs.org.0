Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5722467C5AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 09:21:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2YZh6gbxz3fFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 19:21:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.50; helo=mail-oa1-f50.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2YZ45Cq7z3ch3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 19:20:58 +1100 (AEDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-16332831ed0so1515228fac.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 00:20:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTLUhLqiktW0lQYPPHgLpL0hyET/yRv7DDBqjk/47Fc=;
        b=SxLAihgBj628Lu1qu3lfQnQVuxccGZmWSStONg8gRz+jih8QKLzFvpjHsWZaSbUsHf
         KRe+wP3Pky7slBbK8LanXF4+jLxjQH/7YUv/BEgGi2vQ02+cg36jQCTuswRSeWRSE3X9
         4+DuKOJzBdC/sqS1MiaVZjftAO8gGIs8xoIoAlGtt/AeEVuZI11foOwOFo00cQbhg7eq
         0xtwEg0kJSzb3gegdYvBOsZyoi6Vr98qan48uPvbBPCwe6laOi8ZR8qGi0flPysnEEGv
         ayMgP7/y5ZUc+ppl2Nrzm2JaU1MbepN3dGyWy9v5KyAMZPwF3OIpGbSCRWOPMzsCKvD5
         Znnw==
X-Gm-Message-State: AO0yUKU4KH17LBacKo04j6TqzzYgo+EyQrtIxeKspKJ+Co/Kz9eollrG
	aQ6ariE045ZB5njplZfsqq0lUWoBYSA0TQ==
X-Google-Smtp-Source: AK7set8mXo+ovkMk0aHr8S+aamboFyXdItdKK3foNcVu0zVgVAR/5Z+12ctAmxoeFR7PsPg68M5RaA==
X-Received: by 2002:a05:6870:a103:b0:163:27c2:9476 with SMTP id m3-20020a056870a10300b0016327c29476mr4546235oae.10.1674721255924;
        Thu, 26 Jan 2023 00:20:55 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id a21-20020a056870b15500b0011d02a3fa63sm258509oal.14.2023.01.26.00.20.55
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:20:55 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id m18-20020a05683026d200b0068661404380so541794otu.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 00:20:55 -0800 (PST)
X-Received: by 2002:a25:9ac1:0:b0:7b4:6a33:d89f with SMTP id
 t1-20020a259ac1000000b007b46a33d89fmr2761883ybo.543.1674721245117; Thu, 26
 Jan 2023 00:20:45 -0800 (PST)
MIME-Version: 1.0
References: <20230125190757.22555-1-rppt@kernel.org> <20230125190757.22555-2-rppt@kernel.org>
In-Reply-To: <20230125190757.22555-2-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jan 2023 09:20:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeuPgkWVjpZ=OM4ofnoYyv2nY1_FGo0JUZCFXYX=K2vw@mail.gmail.com>
Message-ID: <CAMuHMdUeuPgkWVjpZ=OM4ofnoYyv2nY1_FGo0JUZCFXYX=K2vw@mail.gmail.com>
Subject: Re: [PATCH 1/3] m68k: use asm-generic/memory_model.h for both MMU and !MMU
To: Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux--csky@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Stafford Horne <shorne@gmail.com>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
 , linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023 at 8:08 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> The MMU variant uses generic definitions of page_to_pfn() and
> pfn_to_page(), but !MMU defines them in include/asm/page_no.h for no
> good reason.
>
> Include asm-generic/memory_model.h in the common include/asm/page.h and
> drop redundant definitions.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
