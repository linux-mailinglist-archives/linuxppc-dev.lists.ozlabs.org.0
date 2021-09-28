Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5965D41B247
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 16:42:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJj0T271Xz2ypT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 00:42:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=chZAM6VP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::c30;
 helo=mail-oo1-xc30.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=chZAM6VP; dkim-atps=neutral
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJhzr2KCTz2yPF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 00:42:16 +1000 (AEST)
Received: by mail-oo1-xc30.google.com with SMTP id
 j11-20020a4a92cb000000b002902ae8cb10so7204808ooh.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 07:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EhyfaFfmpYzLgiWiMX1s0Z67f4LnrHK0KizRdjLnqJw=;
 b=chZAM6VPfyeAr8nqg4SrTVeBKQVNy32nK0MCL9hXLqYHkCSaBIuCY4L9340PwMXY81
 oX7KSMtTXh9aMON1lHCK0x3P5EwD2uawm9OkvBX4/0RXdgLlydme/qvFUvgvv9WA9Sv/
 Yz21N3KSQUS2EZKolBII/gB4UKw+N3eLKo52na8cVvsAJ+Qc2SeaGzdn8hRPrSmtLUIP
 aRpX80YJRQ8nBCKprXegn9SXbCfxmYUl3oIwG6UYYMLCsBzmBW5xMWFkV25U8SWzllts
 kIxnMRI6kDbq5RYBmMNwi7Wlv9DpyqfjkDB7DdGDvHHixU/+azKq4y+P+1z9W+Dxdw1N
 bQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EhyfaFfmpYzLgiWiMX1s0Z67f4LnrHK0KizRdjLnqJw=;
 b=PAptAYIoE7gyxQnKS6msdpUS5DCSCH1E6+MJPivl8wcNXKtaDk0mgTZtoRIgVCi7/w
 DnwmnwQkqGZBZxTvthYV0Rp/0rqa8LrR5kEgWLma5Ln4Vxo6CHMAoMn0/ma/FKEilCDf
 3TLM+lem1zyyERkrLUr4XU6rt6AHbXdMrEA2+A1G+g79cpZ0thO1Z1gK9cYPD/vJ8Xbg
 NqR9LBOONPoOuSGQpQfv6hdF5pUTvJ/doTyXVRAQfrzGH1kVi1/Od2yoxeoJ8rstxQHo
 0eCOMa8zXbBDeMFWbF4W3KeCh2/9orX+WBLprKv52/U5yIsHmBNcxlVL5p0PtQLvfuEO
 2rHA==
X-Gm-Message-State: AOAM532e2xkg1bSUXREztS7gZdRzqzLEkfUsApSRDO5mC0PWRYrdBPCR
 t3NCPrl4kKM/hu6oA9ZheHg/eiggDt7o1KQIseNAGA==
X-Google-Smtp-Source: ABdhPJxsyNViSzziMqVNWC0HCL2fNBAjJtzRxqsLj/BUr+opO/6Yx5+T1yeJwLyWxMocosrCzkw74g3ptylH1JuvRA0=
X-Received: by 2002:a4a:88e2:: with SMTP id q31mr5127880ooh.91.1632840132764; 
 Tue, 28 Sep 2021 07:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172647.72738-1-ben.widawsky@intel.com>
 <20210923172647.72738-4-ben.widawsky@intel.com>
In-Reply-To: <20210923172647.72738-4-ben.widawsky@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 28 Sep 2021 07:42:00 -0700
Message-ID: <CAPcyv4jZUiwqGrYGX3Mmj9XqUvZwZwh79wAQTFxf5g+wZOohtQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] cxl/pci: Remove pci request/release regions
To: Ben Widawsky <ben.widawsky@intel.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Linux PCI <linux-pci@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-cxl@vger.kernel.org,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Kan Liang <kan.liang@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 23, 2021 at 10:26 AM Ben Widawsky <ben.widawsky@intel.com> wrote:
>
> Quoting Dan, "... the request + release regions should probably just be
> dropped. It's not like any of the register enumeration would collide
> with someone else who already has the registers mapped. The collision
> only comes when the registers are mapped for their final usage, and that
> will have more precision in the request."

Looks good to me:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

>
> Recommended-by: Dan Williams <dan.j.williams@intel.com>

This isn't one of the canonical tags:
Documentation/process/submitting-patches.rst

I'll change this to Suggested-by:

> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> ---
>  drivers/cxl/pci.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
> index ccc7c2573ddc..7256c236fdb3 100644
> --- a/drivers/cxl/pci.c
> +++ b/drivers/cxl/pci.c
> @@ -453,9 +453,6 @@ static int cxl_pci_setup_regs(struct cxl_mem *cxlm)
>                 return -ENXIO;
>         }
>
> -       if (pci_request_mem_regions(pdev, pci_name(pdev)))
> -               return -ENODEV;
> -
>         /* Get the size of the Register Locator DVSEC */
>         pci_read_config_dword(pdev, regloc + PCI_DVSEC_HEADER1, &regloc_size);
>         regloc_size = FIELD_GET(PCI_DVSEC_HEADER1_LENGTH_MASK, regloc_size);
> @@ -499,8 +496,6 @@ static int cxl_pci_setup_regs(struct cxl_mem *cxlm)
>                 n_maps++;
>         }
>
> -       pci_release_mem_regions(pdev);
> -
>         for (i = 0; i < n_maps; i++) {
>                 ret = cxl_map_regs(cxlm, &maps[i]);
>                 if (ret)
> --
> 2.33.0
>
