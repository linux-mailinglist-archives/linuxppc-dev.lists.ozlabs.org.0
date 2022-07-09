Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D3856C61C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 04:56:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lfvtl3ltPz3c8V
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 12:56:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4OHZPXkZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=4OHZPXkZ;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lfvt41blPz3bnH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 12:56:08 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id a15so589322pjs.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Jul 2022 19:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Iu4+SfGnILNyrtOPbZlqTPcN6ioiSauG+G5Viw8UbkE=;
        b=4OHZPXkZ7ZnQosBhh/5M+GPXDZj6PxbiJq6JyMh4JF5j0T25k04I3XCtO2DGGzdzOM
         IjtUMhFqx1+X7jM7QYfThlkXu5EuH46KBixGz4l0EcrTXQA3zU550VcPk3174I5shRkT
         YWetdbuD9iAa9m6dg9yOvt9CuavyH4vxvfTz+IqkLDDh2g5Rn2VszNv9UMocSs0lb9KM
         4zvYKkiVFijqRWuZpxM8xYQx20ipNLODpr0PZv9HHnvgHR3Jn/kflZZ5HU2qbPzC52Z+
         jhyP5kWoKIu9dO0gXB95VIwD00G2E25B5yG50CQjIhBLVhe9AgoNrPplYIgxGRGf95RO
         5imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Iu4+SfGnILNyrtOPbZlqTPcN6ioiSauG+G5Viw8UbkE=;
        b=pnPHfSthlWyttxWnpL4dEgN5jiVCDFYiA5mmZk20KafFVyS0QCHL/gcanMIeWh6+5O
         UBhW8FBzXR/ikb6MEg3QSzidWLp7dFYvS8HMoc4BCSifzW6giu83fEBPBCmzoLe9XkjI
         8G5e4MJwzB1SBOrjbqorqQH1IQBsqAOdwK31Tqkq2PQTbChFYIiqnbXcaEwkU+55suh0
         Qw/5Awx9eR7Wu4VH2SxgeR8X7YZIqg9b07CWqn/bJCTlnPKzN1uQa8rmlgXeuIsyrCFk
         6AS4tWJ2DV1qmnGI4H8k2YO+DFdWRtgVqZqHfFG1fvydM40mVuO57TdEvFS/9sjkgXFI
         1mDA==
X-Gm-Message-State: AJIora/Us/K1CAP+lsNM5SL6f3f17TUduaX33X7qWUM3QwK0GlYCstMR
	EIGaEXY83jACo530wYPH1/Dd5w==
X-Google-Smtp-Source: AGRyM1sNAKGtQSl3OJK31+VZwzSz+l9+Khv93qto99rzXrd44U4TeqYhciXpTToLUGk4X2v1dM98ng==
X-Received: by 2002:a17:90b:3b43:b0:1ef:d89b:3454 with SMTP id ot3-20020a17090b3b4300b001efd89b3454mr3432246pjb.87.1657335365511;
        Fri, 08 Jul 2022 19:56:05 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id z24-20020aa79498000000b0052542cbff9dsm309688pfk.99.2022.07.08.19.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 19:56:04 -0700 (PDT)
Message-ID: <8329c51a-601e-0d93-41b4-2eb8524c9bcb@ozlabs.ru>
Date: Sat, 9 Jul 2022 12:58:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <20220708115522.GD1705032@nvidia.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220708115522.GD1705032@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/07/2022 21:55, Jason Gunthorpe wrote:
> On Fri, Jul 08, 2022 at 04:34:55PM +1000, Alexey Kardashevskiy wrote:
> 
>> For now I'll add a comment in spapr_tce_iommu_attach_dev() that it is fine
>> to do nothing as tce_iommu_take_ownership() and
>> tce_iommu_take_ownership_ddw() take care of not having active DMA mappings.
> 
> That will still cause a security problem because
> tce_iommu_take_ownership()/etc are called too late. This is the moment
> in the flow when the ownershift must change away from the DMA API that
> power implements and to VFIO, not later.

Trying to do that.

vfio_group_set_container:
     iommu_group_claim_dma_owner
     driver->ops->attach_group

iommu_group_claim_dma_owner sets a domain to a group. Good. But it 
attaches devices, not groups. Bad.

driver->ops->attach_group on POWER attaches a group so VFIO claims 
ownership over a group, not devices. Underlying API 
(pnv_ioda2_take_ownership()) does not need to keep track of the state, 
it is one group, one ownership transfer, easy.


What is exactly the reason why iommu_group_claim_dma_owner() cannot stay 
inside Type1 (sorry if it was explained, I could have missed)?



Also, from another mail, you said iommu_alloc_default_domain() should 
fail on power but at least IOMMU_DOMAIN_BLOCKED must be supported, or 
the whole iommu_group_claim_dma_owner() thing falls apart.
And iommu_ops::domain_alloc() is not told if it is asked to create a 
default domain, it only takes a type.



-- 
Alexey
