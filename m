Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E464A41B55D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 19:44:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJn1j51zwz3035
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 03:44:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel-com.20210112.gappssmtp.com header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=FKSA5duz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20210112.gappssmtp.com
 header.i=@intel-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=FKSA5duz; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJn126QcCz2xY5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 03:43:34 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id q23so19502793pfs.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imp5I7p53F2DZ1YVYnsTH+B34q59d+HgTV0CrYjuwxo=;
 b=FKSA5duzWRw87ND8p4lngfxsNUmCYFC44YeU70RM2fO3H/yHuH9M8QAsg6bBXTVGqG
 3FzsJWZner5fSvs4m//3O3KT4Er9dHUAKbxccSn9HST/Muq0BTHUTTxiAAVbsVwLn32F
 kMu5q37rLliYt0miOzAML2ekRzAjfDa2oIa9haIsSoVwsZQmx1vS1WDTYixCibF16NoD
 PysTgZlSI4xgn682PA88sYHTzF2Ripl8Xt/5ETc7WmqGsbfvX47bK9Mv0Tv6ZetpFN1f
 4iJKT3z+f1Hd5msRz+IxwpazFQn4bqCPJrKXdTaNL+9xpv6VObc7DAnRAvZcn6ijId1S
 hTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imp5I7p53F2DZ1YVYnsTH+B34q59d+HgTV0CrYjuwxo=;
 b=Umz0U1maAs+fuPxuBOErW73CMnwDQKREMfKpZNwDgv9EkJ59PulKLJVEz/XpcjbSSf
 5m2IbrsrAhclG0h7QeO3rTc4/tinjgnGWHAw1w8luqxMK2t8a0ys4I3T5Mes1HSdmlUb
 WUmCQscbDA+VLziVx5kQZCMH/QRNJZb6BI3xt3MFZtj9i+Iv8yBuYrOgB8Fz6Dw4Pe/H
 BZPTdRjwt6mKrWWiE6aJIrkXDNPnq4ebgJovcxAUsud0/s8YkO4iMj6Tnp2LBCQZ9L+p
 W12Tqv8tDq08mtvjhx6p1rh15M+Vf/LrEryMo0I992wh6bI577EES+f+MuR7NNhGCPSj
 zfUQ==
X-Gm-Message-State: AOAM532rCEYXThV5ae7x5bsf2rdiq7oZJUyPaL1VQm3Dr8DgdV6SQ74x
 dPWrhneSeNKPAs8kV4ub/yj4rHIODyE6yHEMj6VoEw==
X-Google-Smtp-Source: ABdhPJzjFahY5zlVRdQpZP5HYQgI99KxcTCTyAuujDoILwq7WhTATCP0bUPpo4Bx1rVGm7VXzxNZyVmeIZH5CGfCiSk=
X-Received: by 2002:a62:7f87:0:b0:444:b077:51ef with SMTP id
 a129-20020a627f87000000b00444b07751efmr6437884pfd.61.1632851011800; Tue, 28
 Sep 2021 10:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172647.72738-1-ben.widawsky@intel.com>
 <20210923172647.72738-8-ben.widawsky@intel.com>
In-Reply-To: <20210923172647.72738-8-ben.widawsky@intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 28 Sep 2021 10:43:19 -0700
Message-ID: <CAPcyv4jHnio-4vcJ5Y7yhcYKT+Gy73Rgfn5YuRn68_CKbbWnmw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] cxl/pci: Use pci core's DVSEC functionality
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

On Thu, Sep 23, 2021 at 10:27 AM Ben Widawsky <ben.widawsky@intel.com> wrote:
>
> Reduce maintenance burden of DVSEC query implementation by using the
> centralized PCI core implementation.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> ---
>  drivers/cxl/pci.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
>
> diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
> index 5eaf2736f779..79d4d9b16d83 100644
> --- a/drivers/cxl/pci.c
> +++ b/drivers/cxl/pci.c
> @@ -340,25 +340,7 @@ static void cxl_pci_unmap_regblock(struct cxl_mem *cxlm, struct cxl_register_map
>
>  static int cxl_pci_dvsec(struct pci_dev *pdev, int dvsec)

cxl_pci_dvsec() has no reason to exist anymore. Let's just have the
caller use pci_find_dvsec_capability() directly.
