Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03621363F45
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 12:00:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP2PX0CmFz3btG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 20:00:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EZHTNLZo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=sxwjean@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EZHTNLZo; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP2P11x1gz2yRh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 20:00:01 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id j18so55040464lfg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 03:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FDGOhqaPmu3im/JE4IpXZ09jQoRV39s/gRjkoNBVyKY=;
 b=EZHTNLZouZoMLyLTmgLvuz8FG1YMM1x2h1vcFtvYUFM9I3x+VTT/guKRngXHMdilqU
 UenNks47/087slpJVH6kkd3EK9GJysXYoWvpIbywOE0HRwkQO0BxiGA34+D9VeYUK6/4
 xi+kt4YZSX7SOuZq+lgSFo+7t33ZKpTEmCZA2A4kG+mc6FoSzCG1MrJkDIiBOYKeKYdw
 L91N1iRzsCLxjc5sAgMzSQdo7aICHWO+vbZsrVQs5Uw7f/PNL2DrIY6HMABRMNple8ic
 daQpbfCSZcOI5xj+H0/o1L6bBnaCk7Xq95WyWkAKm9uVGWGY40M0YzWa1P6rTob6BrSv
 Fg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FDGOhqaPmu3im/JE4IpXZ09jQoRV39s/gRjkoNBVyKY=;
 b=qWky1ftjl2047DMDh9WFLdCjgYipxyAMvuAXC0Srtgzy987M9Xcr/banEXlbCL60/2
 87kihWfBaghWG9OMZfPcaUHKcn11RKmrDfYu91wzklP+CvsZ8S7JnrxoWc/PE46pNTcO
 N1fAmM/O5ISYFag+XGjoyJsFpYLfrU+4iPANMAJTijjqBrfnodRZbm6g5/uMf5P/ekjc
 T3FdshRMaSQwed0JYAHj3NH+DpAvdZspMbWlqTWYpiyxJMeNQ/Kb3N6g7gz80d6JcG+W
 fhEumHh3Ef5t9UhqdwEHNgRJLl3/6rIkZeRCcAHZIyvK2wL19uLAvlAd6AtouBxf7RoA
 vyOw==
X-Gm-Message-State: AOAM532HM/XJtGcvFhsKtKLbdAJYP3HgWPfBMGcfLxId2fg5+CSyY00M
 K1JDAlM7yrfo48LGmkL0SCgteE/U+U0+i9d9Olg=
X-Google-Smtp-Source: ABdhPJwQnGpTascKyiJ1cToLttIEuyb6KjHxOCs6RhEKgClnJH+QO6ghlbyQBC2V5G3V6PWC8LHym4Qbkl9gA+t/ghQ=
X-Received: by 2002:a19:58a:: with SMTP id 132mr11989778lff.520.1618826394783; 
 Mon, 19 Apr 2021 02:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210419191425.281dc58a@canb.auug.org.au>
In-Reply-To: <20210419191425.281dc58a@canb.auug.org.au>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Mon, 19 Apr 2021 17:59:28 +0800
Message-ID: <CAEVVKH905HJoJ_WVVZadXiy3LG5y+XDpMBVVtUNOwF2MtYTv8Q@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the powerpc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thank you so much Stephen. Sorry for my negligence.

Should I fix this myself on powerpc tree?

Regards,
Xiongwei

On Mon, Apr 19, 2021 at 5:14 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the powerpc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> arch/powerpc/kernel/fadump.c: In function 'crash_fadump':
> arch/powerpc/kernel/fadump.c:731:28: error: 'INTERRUPT_SYSTEM_RESET' undeclared (first use in this function)
>   731 |  if (TRAP(&(fdh->regs)) == INTERRUPT_SYSTEM_RESET) {
>       |                            ^~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/kernel/fadump.c:731:28: note: each undeclared identifier is reported only once for each function it appears in
>
> Caused by commit
>
>   7153d4bf0b37 ("powerpc/traps: Enhance readability for trap types")
>
> I have applied the following patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 19 Apr 2021 19:05:05 +1000
> Subject: [PATCH] fix up for "powerpc/traps: Enhance readability for trap types"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/kernel/fadump.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index b55b4c23f3b6..000e3b7f3fca 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -31,6 +31,7 @@
>  #include <asm/fadump.h>
>  #include <asm/fadump-internal.h>
>  #include <asm/setup.h>
> +#include <asm/interrupt.h>
>
>  /*
>   * The CPU who acquired the lock to trigger the fadump crash should
> --
> 2.30.2
>
> --
> Cheers,
> Stephen Rothwell
