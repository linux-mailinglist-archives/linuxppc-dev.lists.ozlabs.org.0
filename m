Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D741B573
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 19:55:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJnGS4zGqz2ymy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 03:55:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=m9sdz73z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=m9sdz73z; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJnFq623Bz2xXg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 03:54:37 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 me5-20020a17090b17c500b0019af76b7bb4so2279074pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 10:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=orLVhujXuv2LS5anVE9u/slnGdTOgg9Wqn1uh5hqGWw=;
 b=m9sdz73zrjMRDNHc22Gye23uo5ygGPs1cs0mwoNlJ8VUnRLj8voa2vDhgXj2bS9aj2
 aFhf//KoZX796AfWAxpvTXYans8OImGiqCnRmi3Sk6Ml+QvEusKyfBHiXH1VyjA/4sAj
 UeJfSWxx/AfUAAGtCDiw7qNfVTwlszxzNkutU2boB4mHGNl+IVnbL6EhEyS0Cbiztu0L
 JVqp+cBc6JyoHQsLuIcU0LZ6aCx3k+4ofEprD7f3HduGu0V2uJP+PxCitVTzo0PLQ7RZ
 AxHnDX37k0hreucdd5P9XUEzif8rbactBU8SMjoIo1axW/j7y7ez4LhcbOiIdS/8XM3N
 3iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=orLVhujXuv2LS5anVE9u/slnGdTOgg9Wqn1uh5hqGWw=;
 b=iYrwZ8RCRAlrG2StHFhFqLeWNKBpOpvAWHY0pDsTnH6jemEWLsIi9n12gWL2bm8j+z
 LHcbsKCGIywRQNWT/+RK9GiOcllTrBr4cBUeIlKKXijGzKEOehBRoD3C25nuDavFaCWC
 A1Hl4JXNS9soXgIAx80FFaXxsKGxSAYuQI8LeR/xzzxz/WqpIqXwGgGJSTVHjpt8XEnR
 nZTRYyCnQg6T788lTD9rAuVShHO6pkfEZcUkzyL9/StcHGr++vBTczzMRt4bDbPamlj/
 cxIbxjsWW0yZifmGv/D5TdfRlNO0qwtM19NzJ9oPEAkA9MsX9dXCdRf7RFzLwBM/62K+
 7U4Q==
X-Gm-Message-State: AOAM531fNXZicvovfI4BgTr7BrWcoRehwGHT2I0bBT717T2/ozm2ASSO
 4cYRpveE3sWmRCtZwoAIOgrfrqUVxj9JfprvSvITQg==
X-Google-Smtp-Source: ABdhPJzAafw90qw6GNR9KOTGCaZVcRyonxJQDUdkiFkRD78TDB31Hda8XvnX+oGdm1yTApwMPKKhgoUwD7Dy3t2YpxQ=
X-Received: by 2002:a17:90a:d686:: with SMTP id x6mr1390645pju.8.1632851674343; 
 Tue, 28 Sep 2021 10:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172647.72738-1-ben.widawsky@intel.com>
 <20210923172647.72738-10-ben.widawsky@intel.com>
In-Reply-To: <20210923172647.72738-10-ben.widawsky@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 28 Sep 2021 10:54:21 -0700
Message-ID: <CAPcyv4i4T4XLW-P=CzdO47mZ8+_Mih7GMeDEXAtgEE+gO9JQHw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] iommu/vt-d: Use pci core's DVSEC functionality
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
 Frederic Barrat <fbarrat@linux.ibm.com>, Kan Liang <kan.liang@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 23, 2021 at 10:27 AM Ben Widawsky <ben.widawsky@intel.com> wrote:
>
> Reduce maintenance burden of DVSEC query implementation by using the
> centralized PCI core implementation.
>
> Cc: iommu@lists.linux-foundation.org
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> ---
>  drivers/iommu/intel/iommu.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index d75f59ae28e6..30c97181f0ae 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -5398,20 +5398,7 @@ static int intel_iommu_disable_sva(struct device *dev)
>   */
>  static int siov_find_pci_dvsec(struct pci_dev *pdev)
>  {
> -       int pos;
> -       u16 vendor, id;
> -
> -       pos = pci_find_next_ext_capability(pdev, 0, 0x23);
> -       while (pos) {
> -               pci_read_config_word(pdev, pos + 4, &vendor);
> -               pci_read_config_word(pdev, pos + 8, &id);
> -               if (vendor == PCI_VENDOR_ID_INTEL && id == 5)
> -                       return pos;
> -
> -               pos = pci_find_next_ext_capability(pdev, pos, 0x23);
> -       }
> -
> -       return 0;
> +       return pci_find_dvsec_capability(pdev, PCI_VENDOR_ID_INTEL, 5);
>  }

Same comments as the CXL patch, siov_find_pci_dvsec() doesn't seem to
have a reason to exist anymore. What is 5?
