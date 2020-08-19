Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB6324A080
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 15:49:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWq0J5pt7zDqdT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 23:49:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::143;
 helo=mail-il1-x143.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SI2qX2Rp; dkim-atps=neutral
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWpDl5DF2zDqgD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 23:15:35 +1000 (AEST)
Received: by mail-il1-x143.google.com with SMTP id q14so20578544ilj.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 06:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ilWlBZp7MnHg0U+muXPjdU62XNfp9Wi4bMk6LrnLeP0=;
 b=SI2qX2Rp1lvteZrtiqhiujeHxllrKbBmBrv+iGYrzJlmwWqez7RwJpC18ut9o5FqJh
 +SQAXuhy6mmIChwX1jHtudCjtbY1Yk9HK4GV1wTHShlMpWIe39BiKVGrlXg4J5KBaaOA
 MhX+Cei/Lziy6zxBjzT2PEdXzitIf/2Z/VjECs2xrERWCtN5a9hQivGAVSS6s3yxkAiJ
 pxmwrm/hXE+veCvmbKwTiS2hX1R6fM2IXe/QjFc0JBBxNlxW8/bdOsQiOw21XmiYGC0O
 UW96cRUnnQ9LJw8kkdlWLh5SFhqdAHXiPEU3NeBR+ZovQOGQhgIqd29od6cPWR4ekKrs
 CUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ilWlBZp7MnHg0U+muXPjdU62XNfp9Wi4bMk6LrnLeP0=;
 b=AxDBqQbQbJSm8MQ4Jht59Dh1T5LmobjR4apxJnMLoqbb+oCzUM/GAUcIIOKpklcFtz
 jQ+b+XHi7Gvb9kOSC2XYKK8AVOTj5Uo8mszh1WY8jCdqrbd/Al6nCPgDwVqb4y6XdJ7/
 UKEnMyIi01xIb44JrJO/deT4srJAL+4S8Sg0+JBbKEqOdb1/W4xssxFs/kDTyZ9tcXzR
 fCa3hJ8jCqDP9JgjPvYaSP8GNeT4hRjoLOK1Re/tpKRR7Ir1pl/ESPLCeS/xSBKkTRAp
 onBs50SuR0BKAhIIcNwLMr144q4oQxl0IoUhuy21dQ3OqhUfhLa4rLQX661TKswSKt98
 ZxPQ==
X-Gm-Message-State: AOAM531GFWGrHQFPr8gKAOnVPii81kXLUw3P0CZGG5+h34nhof/0JXdF
 m3XkMym1aUIoos5gol+zPpa7gSWctvY/sToBn5Y=
X-Google-Smtp-Source: ABdhPJyRUysqitctGeOeQaC79XgqliCkd9IdSel4jxWqZ8XOIUHkep4Bkpo52zr7MTzw+UmRTiZsOeqocFDgttWO+bE=
X-Received: by 2002:a92:bb19:: with SMTP id w25mr21313595ili.149.1597842930643; 
 Wed, 19 Aug 2020 06:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200819130741.16769-1-fbarrat@linux.ibm.com>
In-Reply-To: <20200819130741.16769-1-fbarrat@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 19 Aug 2020 23:15:19 +1000
Message-ID: <CAOSf1CG=ecx53ySsmX-7pK_zUJsd9LRMX5V1HBhYZBcOT2z89w@mail.gmail.com>
Subject: Re: [PATCH] powerpc/powernv/pci: Fix typo when releasing DMA resources
To: Frederic Barrat <fbarrat@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 19, 2020 at 11:07 PM Frederic Barrat <fbarrat@linux.ibm.com> wrote:
>
> Fix typo introduced during recent code cleanup, which could lead to
> silently not freeing resources or oops message (on PCI hotplug or CAPI
> reset).

oof

Did you actually hit that oops on CAPI reset? Including the stack
trace is helpful for avoiding this sort of problem in the future.
Anyway,

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>

> Only impacts ioda2, the code path for ioda1 is correct.

yeah but no ones uses ioda1

> Fixes: 01e12629af4e ("powerpc/powernv/pci: Add explicit tracking of the DMA setup state")
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index c9c25fb0783c..023a4f987bb2 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -2705,7 +2705,7 @@ void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe)
>         struct iommu_table *tbl = pe->table_group.tables[0];
>         int64_t rc;
>
> -       if (pe->dma_setup_done)
> +       if (!pe->dma_setup_done)
>                 return;
>
>         rc = pnv_pci_ioda2_unset_window(&pe->table_group, 0);
> --
> 2.26.2
>
