Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E023A23B2B8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 04:20:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLJPQ5MlczDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 12:20:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=i5mCNHKh; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLJM41BSfzDqMB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 12:18:05 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id g19so26886810ejc.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 19:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uIh4IaVwdUnOrMvMF8OkJj+BaN2XBBkUF9lKkX7vLq4=;
 b=i5mCNHKhkN24p2L9bXwlh+XLF2BZYpygSTHF3s/cQc+H1EOUytg1vHuDvtp4xPDtaR
 Cmiccbll3Qwegrg+7y5HMOEoZTUKrbcRHPxjzuOY5snnnQ3PM3CgwPssCmgEt1SPrL8u
 OwXmBEL+CFa3jDeJxZz1NgAohgOaCRTjmGmSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uIh4IaVwdUnOrMvMF8OkJj+BaN2XBBkUF9lKkX7vLq4=;
 b=f9C2Ntr5PDKEDlSca3rpDP6zEjaCI8efKuOaLWR7zIWziXPK3F2Q9Y5YHqShmy4cs2
 vn8qlO98OeoIklfdZ2yovzLmS6WQSIS91h/BiFUYe2Ce+ZHeG2kBOf6ifvr5bJ+fTjzj
 S1dCNEH/mBgaz3vJTHegSchlR8wHnyabHzbgI1KlIjr5J69iNH81Ov8EUuY3nPLavG0x
 /OppEccaKiDvcVaD7vTnpaB+Tnl/I1ppRWZ55KwGnBUN1w191hEsAGiT70DMiKlByB7D
 agV3+8JvH48Ld2dCM94fx6wnUyuElpS7VI8YnV9hqjR/tLHnuYzZRXAyouLVkOCek4y0
 Qf5A==
X-Gm-Message-State: AOAM533etParS9f9Wxo8oeCTNkdY+MmXi3oM3gFUJt6dPis+iQ8eKq9S
 yPOdYeGHctX71HJvL3CEd+fad8a2VjznnwT8FVc=
X-Google-Smtp-Source: ABdhPJyt7ycVsN2D4//JnHbXIgH5LMN3+8zYE4ZiOm4jtMM4+MirvovnI6/xKKbDDNPESYlNintZINiOWTef3ixvQ58=
X-Received: by 2002:a17:906:7790:: with SMTP id
 s16mr12280995ejm.254.1596507481682; 
 Mon, 03 Aug 2020 19:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200804005410.146094-1-oohall@gmail.com>
 <20200804005410.146094-4-oohall@gmail.com>
In-Reply-To: <20200804005410.146094-4-oohall@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Aug 2020 02:17:49 +0000
Message-ID: <CACPK8XcbsaZ=7x07CjiCDNfMeiA2AVi6k_WWQnS50eERt6QAow@mail.gmail.com>
Subject: Re: [PATCH 3/6] powerpc/powernv: Staticify functions without
 prototypes
To: "Oliver O'Halloran" <oohall@gmail.com>
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

On Tue, 4 Aug 2020 at 01:01, Oliver O'Halloran <oohall@gmail.com> wrote:
>
> There's a few scattered in the powernv platform.
>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -38,7 +38,7 @@
>
>  static int eeh_event_irq = -EINVAL;
>
> -void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
> +static void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
>  {
>         dev_dbg(&pdev->dev, "EEH: Setting up device\n");
>         eeh_probe_device(pdev);

This one could even be deleted as eeh_probe_device has it's own dev_dbg.

Reviewed-by: Joel Stanley <joel@jms.id.au>
