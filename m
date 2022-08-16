Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CAC5952E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 08:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6MC76K0bz3c5G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 16:47:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.52; helo=mail-ot1-f52.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6MBh17YXz2xX6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 16:46:50 +1000 (AEST)
Received: by mail-ot1-f52.google.com with SMTP id z22-20020a056830129600b0063711f456ceso6870521otp.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 23:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mQKxHhlVCpHcdp8dQEIScJFQsrh06tzn535mwalxKj0=;
        b=xykdswDyPHGwrXgQBxAG37W4wLaI1EuAhP92qQVV/+JRT/6qotCGK64HApN2MmK4EX
         pTTZd23+km6JjQYiPpgrcWAaS9trPHT8XLD926cI7C6Tt+Uty477RbwEWA2AmOrjs3is
         lRBz+5C2VzfDDYUDh908/PiNjoP1vwLJdVGSQgAE8yV3PT75qeRjO6lWK1/esTrafXK8
         XC+aAUrjo7lsO6QZQ9Fy/NnUb//A3uUDizSbpu7HJ53fwnlJMoJRNdm5mrHcBxCvWHNE
         E05IQpfr4bcVj0XDSD+EqI812BY3tAryaVfdBJ3aVUC5U4jADUKsJkEUx8dHK2pryf9B
         I55Q==
X-Gm-Message-State: ACgBeo3216nFUNFkDmsJho8afQUCRhrDDdVJzCCHvbc3SCal1bbbSRCe
	YvG9bQSyJJG5EcZA8XZ2a+ItPwzTSSqFwA==
X-Google-Smtp-Source: AA6agR7EzjlvQrgOPvG96wNVB+Odx4KpsznhKXQmZr4ik2KDn9aWnEk9VjyTS31WYFvEEs9GAmyh/A==
X-Received: by 2002:a05:6830:61cd:b0:618:d560:b787 with SMTP id cc13-20020a05683061cd00b00618d560b787mr7495620otb.154.1660632406874;
        Mon, 15 Aug 2022 23:46:46 -0700 (PDT)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id fq7-20020a0568710b0700b00112c8bda532sm1885135oab.11.2022.08.15.23.46.41
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 23:46:43 -0700 (PDT)
Received: by mail-oo1-f46.google.com with SMTP id r22-20020a4abf16000000b00448a8a2044aso1674355oop.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 23:46:41 -0700 (PDT)
X-Received: by 2002:a05:6902:100a:b0:676:ed53:25b0 with SMTP id
 w10-20020a056902100a00b00676ed5325b0mr13356288ybt.365.1660632391068; Mon, 15
 Aug 2022 23:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220815143959.1511278-1-zi.yan@sent.com>
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2022 08:46:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWohdUZxi3A=H1wqY4rYrLD-ME6mmhWb6Z-udovd=1BhQ@mail.gmail.com>
Message-ID: <CAMuHMdWohdUZxi3A=H1wqY4rYrLD-ME6mmhWb6Z-udovd=1BhQ@mail.gmail.com>
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
To: Zi Yan <ziy@nvidia.com>
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
Cc: James Houghton <jthoughton@google.com>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>, Ley Foon Tan <ley.foon.tan@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Linux-sh list <linux-sh@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>, NXP Linux Team <linux-imx@nxp.com>, David Rientjes <rientjes@google.com>, arcml <linux-snps-arc@lists.infradead.org>, Huacai Chen <chenhuacai@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Chris Zankel <chris@zankel.net>, John Hubbard <jhubbard@nvidia.com>, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.or
 g>, linux-m68k <linux-m68k@lists.linux-m68k.org>, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Qin Jian <qinjian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Taichi Sugaya <sugaya.taichi@socionext.com>, Vineet Gupta <vgupta@synopsys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 15, 2022 at 4:40 PM Zi Yan <zi.yan@sent.com> wrote:
> From: Zi Yan <ziy@nvidia.com>
>
> This Kconfig option is used by individual arch to set its desired
> MAX_ORDER. Rename it to reflect its actual use.
>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Zi Yan <ziy@nvidia.com>

>  arch/m68k/Kconfig.cpu                        | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
