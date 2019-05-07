Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CD915DBF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 08:51:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yqy248KRzDqNN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 16:51:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=green.hu@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MbpgTNQu"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yqwb3CGBzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 16:49:47 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id a64so3646165qkg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2019 23:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pa7Box1aR7yFtR1LX1WDnV3kRpU7SqZCsbjs49Q3I5I=;
 b=MbpgTNQuafLtAS2Dly735CRfwi2rTUQf2u2v4oGvQgQgSYIdnRpg7VCLomPpMzIscG
 QaTnC9SQ9ku6gzFOzq1s9XrRaJmYor/1LFKrkhizBLNXIXufH7ZYafVfUTi/hxmPPuHk
 B/SkK/YRJGmYzfaQ1xghtxinwaerdxpRKizUfkuezccasVKNLUKgHxlEEtCQzs7jj3xl
 zQkJPXfNNvA3TqInSISCOxmMnYUjkdAFYUZlvI0ouvwsL+dfg4OFY2WIgIiVzRvRisWc
 5DS8N2wLUkGet8qbU+i0bfGDKHxX5peC2gXK9w9E6zQg9z2uNJlAWgMxSlSz/L/CQjSl
 IVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pa7Box1aR7yFtR1LX1WDnV3kRpU7SqZCsbjs49Q3I5I=;
 b=EdgfxYhlDlB9Lb/dizKJskwbok3f2gsMJtJzUX2vyL6rvveFc3Qx32UueBqDqehkRU
 mICWwMEY5xFFRU/ePBSitCCyMAezHKGZeztuz4e1H7wszrZmGj+Cxui1+wowVU7Xi7Zz
 FVEl2WIsSXUcBGB93jEqvW60VJUa8GFDuq5Wz9vltncbBNlWvRbsLNdQAC4LtLuHo/8g
 Km6oCS2GkdEvBxKimAZfuE67QmAmCxkVDKgixp3uSv+tFOi/Dk5M9CUVUO0cYWYQvqYS
 rU90mvYkxKSqmjBbmnJGIk+4frEpz3Y2OgWV7FbtYkcvEoXUKS5PBLNTjLAsEy3W89mf
 v6qQ==
X-Gm-Message-State: APjAAAUVrSEZd/xufgcPrRPfM5IobWVL7Z8l4O9QUayVcyJV1LXazqU1
 QXWCvKWeK5YTN6QnEru7fc5xxuyqd6dAvIdFJ6A=
X-Google-Smtp-Source: APXvYqzuoQEtPiGnZXwYeWTvh/tWnA2kNb3EmE2Gn3p8SIpj/ShNUcDydJeqXgxDTOHN1axGtXmE2eyXjqUTKs09l0U=
X-Received: by 2002:a05:620a:1012:: with SMTP id
 z18mr1671111qkj.205.1557211784520; 
 Mon, 06 May 2019 23:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <1556810922-20248-1-git-send-email-rppt@linux.ibm.com>
 <1556810922-20248-10-git-send-email-rppt@linux.ibm.com>
In-Reply-To: <1556810922-20248-10-git-send-email-rppt@linux.ibm.com>
From: Greentime Hu <green.hu@gmail.com>
Date: Tue, 7 May 2019 14:49:08 +0800
Message-ID: <CAEbi=3d=HN0NagdZRu7qYE1KCWGnnGGwyhWKPp31XbzT7JunBQ@mail.gmail.com>
Subject: Re: [PATCH 09/15] nds32: switch to generic version of pte allocation
To: Mike Rapoport <rppt@linux.ibm.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-mips@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch <linux-arch@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 Sam Creasey <sammy@sammy.net>, Arnd Bergmann <arnd@arndb.de>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 nios2-dev@lists.rocketboards.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Kuo <rkuo@codeaurora.org>, Paul Burton <paul.burton@mips.com>,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,

Mike Rapoport <rppt@linux.ibm.com> =E6=96=BC 2019=E5=B9=B45=E6=9C=882=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:30=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The nds32 implementation of pte_alloc_one_kernel() differs from the gener=
ic
> in the use of __GFP_RETRY_MAYFAIL flag, which is removed after the
> conversion.
>
> The nds32 version of pte_alloc_one() missed the call to pgtable_page_ctor=
()
> and also used __GFP_RETRY_MAYFAIL. Switching it to use generic
> __pte_alloc_one() for the PTE page allocation ensures that page table
> constructor is run and the user page tables are allocated with
> __GFP_ACCOUNT.
>
> The conversion to the generic version of pte_free_kernel() removes the NU=
LL
> check for pte.
>
> The pte_free() version on nds32 is identical to the generic one and can b=
e
> simply dropped.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/nds32/include/asm/pgalloc.h | 31 ++++---------------------------
>  1 file changed, 4 insertions(+), 27 deletions(-)

Thanks for your patch.
I'm assuming this is going in along with the rest of the patches, so I'm no=
t
going to add it to my tree.

Acked-by: Greentime Hu <greentime@andestech.com>
