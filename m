Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC5721819F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 09:47:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1rxB1hm6zDqTV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 17:47:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZRLTbUBQ; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1rtJ6zsxzDr5T
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 17:44:40 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id w17so36368019oie.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jul 2020 00:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i9MFIBkCR9j8+eze3fd0C5FytaBY3rx5UlBzr2QlpIs=;
 b=ZRLTbUBQMlOdcfwV4K6vyHf3ReZyGUriJ24+JRhdXfih8MWhImMwIFhc1TU+wW2wkK
 BZV4yAwze46JFrB6pPp4175HL5p2YxFSnHTI3VftLVJmVu7Z3+DNenu+BPqNyVY/2lCW
 zcOOEtHlT1apauoohGrlATv5AriY2DN97BhUHyZwSZ2Ky2pwTPsYyqt19VdJ64b5jP9f
 ez/DSOXeHo+5NEqj7cXa6/SakhjPj7//+qDo7SfFY//4/V2jHhScMJOlk9z0j/MpCloB
 /qY+ky5NpsM306NqIsOS+h2S77nqOZqN8UhSZ+V9pkP1hN6syqzdJeHFMft1gYKBlqWQ
 THkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i9MFIBkCR9j8+eze3fd0C5FytaBY3rx5UlBzr2QlpIs=;
 b=ajqu2IKZcTQ7FGZ8g7b8l+wtl1ckO3+qYTCYAXeF2JcTVO6hsKFXGQc/pSzbmW6tu/
 zs6X7LGr4TfBcphUX3SwNSBZOD2d4qds4WpGBxOHHifVrG+SNKrBPfbd34D5/llzPUYw
 q2g28nSKaw8Zzt5qsEQzaQRFu48be9spVlNolFBszmAHwBBv6vfrsK5iaWTeOu0pAP5E
 gXY9Om7ejPFm/DYdU/8vAAvDNUXh86SC2nm0TxHytiTRNQ2F1pPZ9QywNkRtJ9u1+zYO
 W9/4/aDLyXS7vTstT6ZzcboR8SDNxK3K5xzuvHxbGGrS7nwG0WWYMHI8V3culHBmx7nL
 21cQ==
X-Gm-Message-State: AOAM532nOGAm4qWhxhTXBfaSM/agJuRwZXyRAE2kTrhcr1tYRfrDMeiZ
 XYz9UwBb4wx3OT5UiiyuSXKe3TEl87Q+xI6x64E=
X-Google-Smtp-Source: ABdhPJyzRoSumY4KPusSNhsW/NdfLDiwaP1MO9JljRCAyUxvbcGY6DgwS7LNJ7fMc9L/voZTo9OO3VBc81/w9vKNn9c=
X-Received: by 2002:aca:c70f:: with SMTP id x15mr6535883oif.40.1594194277193; 
 Wed, 08 Jul 2020 00:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200708045046.135702-1-ravi.bangoria@linux.ibm.com>
 <20200708045046.135702-2-ravi.bangoria@linux.ibm.com>
In-Reply-To: <20200708045046.135702-2-ravi.bangoria@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Wed, 8 Jul 2020 17:44:25 +1000
Message-ID: <CACzsE9qka0j7vKm186Z70fhNy9L4dNR3B97-jQ2oZZAwYduaRw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] powerpc/watchpoint: Fix 512 byte boundary limit
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, apopple@linux.ibm.com,
 mikey@neuling.org, miltonm@us.ibm.com, peterz@infradead.org, oleg@redhat.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, jolsa@kernel.org, fweisbec@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 8, 2020 at 2:53 PM Ravi Bangoria
<ravi.bangoria@linux.ibm.com> wrote:
>
> Milton Miller reported that we are aligning start and end address to
> wrong size SZ_512M. It should be SZ_512. Fix that.
>
> While doing this change I also found a case where ALIGN() comparison
> fails. Within a given aligned range, ALIGN() of two addresses does not
> match when start address is pointing to the first byte and end address
> is pointing to any other byte except the first one. But that's not true
> for ALIGN_DOWN(). ALIGN_DOWN() of any two addresses within that range
> will always point to the first byte. So use ALIGN_DOWN() instead of
> ALIGN().
>
> Fixes: e68ef121c1f4 ("powerpc/watchpoint: Use builtin ALIGN*() macros")
> Reported-by: Milton Miller <miltonm@us.ibm.com>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  arch/powerpc/kernel/hw_breakpoint.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index 0000daf0e1da..031e6defc08e 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -419,7 +419,7 @@ static int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw)
>         if (dawr_enabled()) {
>                 max_len = DAWR_MAX_LEN;
>                 /* DAWR region can't cross 512 bytes boundary */
> -               if (ALIGN(start_addr, SZ_512M) != ALIGN(end_addr - 1, SZ_512M))
> +               if (ALIGN_DOWN(start_addr, SZ_512) != ALIGN_DOWN(end_addr - 1, SZ_512))
I wonder if you should use end_addr - 1, but rather end_addr. For example:
512 -> 1023, because of the -1, 1024 will now be included in this
range meaning 513 bytes?

>                         return -EINVAL;
>         } else if (IS_ENABLED(CONFIG_PPC_8xx)) {
>                 /* 8xx can setup a range without limitation */
> --
> 2.26.2
>
