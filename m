Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A08B4228B87
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 23:41:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBBr167TmzDqMl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 07:41:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U/SFUi7i; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBBp01rkgzDqcc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 07:39:51 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id e7so349289qti.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 14:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=f6dpuk5+La18ZWVO5+si7DCz5e38PY6ivAQLVNSBqmA=;
 b=U/SFUi7id/t/LHsdzY311skIWx53KxIcsw3dbIbaHD6SVpNfo44ZLLR63YgmWd7Veu
 NQ33Tu4Gx8i6gjr6No04I0N+EbNgp8JXEwUhwt9VLA6HjCnYN3HVyXcd+ZOoWoA2mFLm
 5gl8zp/L7yJuzZnu3upL2YYoig+gcHAZLQ3X/EqqUMdYUCgyTHimHbLcfCuTAdBfZk1r
 pfsvxJ2FRig3QL4rxWVQuNmXf84xJ7o3ES5jNNeBlISg2JW/hgHyVxgz4gtrV6eZlglB
 atchVAtCg8EvawE6CFfGl+nH43F6AyyTgG+CjspWNk+Ulhf3OwvkZL2QuoPhGu7ISFQG
 pdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=f6dpuk5+La18ZWVO5+si7DCz5e38PY6ivAQLVNSBqmA=;
 b=lNrtZ8raL325iEGSKaJKnfp3gu0Wipk9W/wiB1ddiahTFcKMXeFX4Nt2h4DYXcSyIM
 j+FqgO6d0Ws17j742rspNlTyQsAmHAgaoT/yl1a7h8tz8+Kip73e0eAweDJWHpPySwhS
 UA/GvOXepzuOeNwnbZ1MI1IKXmAJYD1fDQGxRRWTGogjM2vFU6fL54DrDkJRdkPFFR7m
 zqF2W0gGK7BDHb14Sxgqrd7y1PRbXFnrzJehE6IVqEqVGoL24YLB7SCcGmqpAao2BLaH
 dw6Pg7U9Df31WyvHmDVAdOI9lbYRNmYN4zn+lZpsgV8j6aZOsfU+didlU9m2vuv+djVh
 dqgA==
X-Gm-Message-State: AOAM531OmIyk3n3HIcdvUC4KrQ37mfZULHBpiQL3rOwwvc189xURXgbI
 wBzZmLDn32neKOUCuRz8noA=
X-Google-Smtp-Source: ABdhPJyKYD+bwMc8kmQwGoqjQRczCgRq/FKP5Y7ngik8icr3nxfXpbx921KBNewzPsWm/gTfn4ccnQ==
X-Received: by 2002:ac8:5241:: with SMTP id y1mr6741728qtn.102.1595367587328; 
 Tue, 21 Jul 2020 14:39:47 -0700 (PDT)
Received: from LeoBras (179-125-153-225.dynamic.desktop.com.br.
 [179.125.153.225])
 by smtp.gmail.com with ESMTPSA id n127sm3592591qke.29.2020.07.21.14.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 14:39:46 -0700 (PDT)
Message-ID: <534451cb4ae2a6c38e1cde147d4021581a6a4f0d.camel@gmail.com>
Subject: Re: [PATCH v4 6/7] powerpc/pseries/iommu: Make use of DDW even if
 it does not map the partition
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alexey
 Kardashevskiy <aik@ozlabs.ru>, Joel Stanley <joel@jms.id.au>, Christophe
 Leroy <christophe.leroy@c-s.fr>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>,  Ram Pai <linuxram@us.ibm.com>, Brian King
 <brking@linux.vnet.ibm.com>
Date: Tue, 21 Jul 2020 18:39:40 -0300
In-Reply-To: <20200716071658.467820-7-leobras.c@gmail.com>
References: <20200716071658.467820-1-leobras.c@gmail.com>
 <20200716071658.467820-7-leobras.c@gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-07-16 at 04:16 -0300, Leonardo Bras wrote:
> +static void iommu_pseries_table_update(struct pci_dev *dev,
> +                                      struct device_node *pdn)
> +{
> +       const struct dynamic_dma_window_prop *ddw;
> +       struct pci_dn *pci;
> +       int len;
> +
> +       ddw = of_get_property(pdn, DMA64_PROPNAME, &len);
> +       if (!ddw  || len < sizeof(struct dynamic_dma_window_prop))
> +               return;
> +
> +       iommu_table_update(pci->table_group->tables[0], pci->phb->node,
> +                          ddw->liobn, ddw->dma_base, ddw->tce_shift,
> +                          ddw->window_shift);
> +}
> +
>  static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
>  {
>         struct device_node *pdn, *dn;
> @@ -1382,6 +1403,7 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
>                 pdev->dev.archdata.dma_offset = enable_ddw(pdev, pdn);
>                 if (pdev->dev.archdata.dma_offset)
>                         return true;
> +               iommu_pseries_table_update(pdev, pdn);
>         }
> 

Noticed a bug in this one: pci is not getting assigned. 
My bad, there must have been a merge error.

Also, I will refactor the function to make use of pdn only, as I can do
pci = PCI_DN(pdn) (I think it's better this way).

Sorry for the buggy patch.

Best regards,

