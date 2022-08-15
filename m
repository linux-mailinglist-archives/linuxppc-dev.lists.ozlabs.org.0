Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F3259328B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 17:54:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5zNq6Ml6z3c9K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 01:54:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.133; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5zNP3qYnz2xJG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 01:53:55 +1000 (AEST)
Received: from mail-ej1-f46.google.com ([209.85.218.46]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MNtCi-1nzMOb3QCW-00OK3m for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug
 2022 17:53:49 +0200
Received: by mail-ej1-f46.google.com with SMTP id gb36so14195583ejc.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 08:53:49 -0700 (PDT)
X-Gm-Message-State: ACgBeo2aZ516zrS2QMKmXNJ1gAyqpnbTeIYHA8NUMWjNQz/IniHPv506
	rFM3ZDDTtGuQosUjUdR4FD3qytzJbrj9c7wpA0M=
X-Google-Smtp-Source: AA6agR4kQH9OPkAoSzw4z/FBPTVCt5TcLJ18r0latd6JdISl5KaD+R3rrNlWHfqDqar+qTRK7WgfYWLgQGqiKgJkzhc=
X-Received: by 2002:a17:907:7609:b0:730:d70a:1efc with SMTP id
 jx9-20020a170907760900b00730d70a1efcmr10863122ejc.766.1660578818066; Mon, 15
 Aug 2022 08:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220815143959.1511278-1-zi.yan@sent.com>
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Aug 2022 17:53:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0TcnXHVsxBkpqLi63XC62Jkg3HChtK4RgB6-giYb+hnw@mail.gmail.com>
Message-ID: <CAK8P3a0TcnXHVsxBkpqLi63XC62Jkg3HChtK4RgB6-giYb+hnw@mail.gmail.com>
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
To: Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/dggTdrz/zo7ojNyPk1kTscRZIp7ZmTQwdWm2G+oLkrOBJ8xwFO
 po1n93h3IJag/lA5RoqBam4Xb4wXXi8VRCSEGes3xRtSMfdhqzxO7aXaUJM+wXCxLxKxar1
 irYlrVtICk428c7+ev7QPxnJn25WqCjRsogCaWUftmFK06Y9Wvh9sG5sD6qW+h3ezT6EPUq
 1Wl4/15dbmhJLigpGwMXg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bxiDEkVkDyo=:JFTd7x303UnmVyTaZiM0YT
 QdSJoJ+x12rNemtwn2Mj2F2hLQHdWvEs5HjjDPHTj1Ev1GKbGd1Nt4+j3Ad/qH8LfuXP7y2Qc
 yYDK1PBu3D7yojT5UlX7GJmYnmKUJ/NuiBGBI32KM8T56LESvvjx4LQh3lRKBnRCOojScmQj9
 RWcHShaXpzBFSuowt2ztFI4OlTmgaaKQytN1bYI+pM4TwAagIGpgSVDo55UvHV8PCgf+Koxl3
 n76UqN/RWDotrd4RPrcW+gCP9aOm89Trv6AgMqA4B3jsT9e3ME3RGQSuZouDXZoz2z5zvf05x
 PkMbTlCs5iEQHXiUtEUv1FY55gMu4N7GJCfGzdl9+NkU8U6MLr/VUyWM6IjieyBYzot1KS2h9
 KVdBWrwC7cjHwGiPJHr2yRJaDAP+aa4uPLyqGlFTVBURFqfx/pmrHNqS5w7knprqtllmZVtQV
 3lCKAaywyPSH23btKMHKWAu6rf17q7vbudSP8/dHYRx2fGAmy/08F/cnBcg1MctKP2ek/RPMB
 j3LKc7pZQNcrUkcuHaJw41xk8EOhCw1yxJmocf8lcb/Opwndqedb7tFw43HHEu7GS1h+SbtHs
 iW/WnCvUFRnvozjsdHqbtGb+DsbY2x7HpNWbhuAIkzipT9lLrB26/cT9dBQVrdVgGYbmKsyE8
 gShal1MGwTKEbfIXP6dt3TvWzFpy44pWEsj2oeWZoLlvgS55P/cOBSJQezdQDmIwJDQUxkjOy
 kWApYGjweGoV4qkVR9ZQxN6ECmkVB3yJMXKjeVJrkTRe3tPKMNAOhlN4V84Egu2XJDC8FYftv
 FzLlnMBkGXMB8ULsfeP4DQg5CJ/2EfBs84eaPPZmm0+KTefaGA2I3UaKp7auD7/VVK5p8QqyB
 t2FOv2ac9gb764REs9og==
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
Cc: James Houghton <jthoughton@google.com>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Ley Foon Tan <ley.foon.tan@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, NXP Linux Team <linux-imx@nxp.com>, David Rientjes <rientjes@google.com>, linux-snps-arc@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Chris Zankel <chris@zankel.net>, John Hubbard <jhubbard@nvidia.com>, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-ar
 m-kernel@lists.infradead.org, Qin Jian <qinjian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Taichi Sugaya <sugaya.taichi@socionext.com>, Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 15, 2022 at 4:39 PM Zi Yan <zi.yan@sent.com> wrote:
>
> ---
>  arch/arc/Kconfig                             | 2 +-
>  arch/arm/Kconfig                             | 2 +-
>  arch/arm/configs/imx_v6_v7_defconfig         | 2 +-
>  arch/arm/configs/milbeaut_m10v_defconfig     | 2 +-
>  arch/arm/configs/oxnas_v6_defconfig          | 2 +-
>  arch/arm/configs/pxa_defconfig               | 2 +-
>  arch/arm/configs/sama7_defconfig             | 2 +-
>  arch/arm/configs/sp7021_defconfig            | 2 +-
>  arch/arm64/Kconfig                           | 2 +-
>  arch/csky/Kconfig                            | 2 +-
>  arch/ia64/Kconfig                            | 2 +-
>  arch/ia64/include/asm/sparsemem.h            | 6 +++---
>  arch/loongarch/Kconfig                       | 2 +-
>  arch/m68k/Kconfig.cpu                        | 2 +-
>  arch/mips/Kconfig                            | 2 +-
>  arch/nios2/Kconfig                           | 2 +-
>  arch/powerpc/Kconfig                         | 2 +-
>  arch/powerpc/configs/85xx/ge_imp3a_defconfig | 2 +-
>  arch/powerpc/configs/fsl-emb-nonhw.config    | 2 +-
>  arch/sh/configs/ecovec24_defconfig           | 2 +-
>  arch/sh/mm/Kconfig                           | 2 +-
>  arch/sparc/Kconfig                           | 2 +-
>  arch/xtensa/Kconfig                          | 2 +-
>  include/linux/mmzone.h                       | 4 ++--

Acked-by: Arnd Bergmann <arnd@arndb.de>
