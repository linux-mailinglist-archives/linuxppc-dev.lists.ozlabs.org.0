Return-Path: <linuxppc-dev+bounces-910-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C3F96978D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 10:45:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyfMT2836z2yHs;
	Tue,  3 Sep 2024 18:45:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725353109;
	cv=none; b=QAHt7HQUiCE9rzbw9LQsxFjdKOvjyzBFlArLp68f62eZ4YWUgmX4QbSQ+nAnHfIMLb0XvmOolALuhCRQpfa5dLkSJaZtCmDwVMBidEMUDLakrvc1O330gahMfEL6IIHYY47vrU+liOeV9XTtiostBTZ9U5wPMxC0GcaVPK/RDhWpKecK21j6u8sUdokumuCRytU8fgbkISrSGuZGJzdCC3HLqiIiVeT8H1IUmhPOFB/RBcb2yJn+wY+U6mXDPNS/tuamuXuanO1xafEkkz2p89SH9tqvFyYQlMLbxsF8eiha1eEYnB5dgMC7x5DOnhdAiKdwk0uKqHPX+Uyz/caxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725353109; c=relaxed/relaxed;
	bh=m1hY1ZNrlFpS/J5jhds4bFyr7UBytHXIaVFY/Tkpgc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=knTnZYP0gau4HIt8fLC7BGAng1CupN2/ce58GynqiJhZjCzNlHnryYOrJFNfe0H8SwXR5jHzC1XxyqOA4+hIQvg4NLvqm/vGfJkt7W4nolWyiXocFgwJ5U7dE4ZytY7XCVZQUlAPlhifqxPC9rhbHTj42SUB6I6ZKeYI19ouIPmBIoAG0U9zJrSkl7Bzvh1vDvwfbinGduIhQ4OMmrTyl6VwxAewSUo90wikXLb800vnaAbSDUZ8OaGH7mz1e2OrnFRLPE/npgkrf+sWEPjZysl0zhM7xwhNm6uzFlgaxh6tqhsTgRljGni8e+X0FqmRycQC8nDsItFCqwgqgi8JOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyfMT010bz2xb3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 18:45:08 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WyfMN2t7pz9sSC;
	Tue,  3 Sep 2024 10:45:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o718uC4gj9KF; Tue,  3 Sep 2024 10:45:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WyfMN25FSz9sRy;
	Tue,  3 Sep 2024 10:45:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 37A688B76E;
	Tue,  3 Sep 2024 10:45:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id UFzvyiGJCqRY; Tue,  3 Sep 2024 10:45:04 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0D72A8B768;
	Tue,  3 Sep 2024 10:45:04 +0200 (CEST)
Message-ID: <966741a8-7df7-4efa-9105-f5762f75fb44@csgroup.eu>
Date: Tue, 3 Sep 2024 10:45:03 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] soc/fsl/qbman: Use iommu_paging_domain_alloc()
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20240812072527.9660-1-baolu.lu@linux.intel.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240812072527.9660-1-baolu.lu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 12/08/2024 à 09:25, Lu Baolu a écrit :
> [Vous ne recevez pas souvent de courriers de baolu.lu@linux.intel.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> An iommu domain is allocated in portal_set_cpu() and is attached to
> pcfg->dev in the same function.
> 
> Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Link: https://lore.kernel.org/r/20240610085555.88197-14-baolu.lu@linux.intel.com
> ---
>   drivers/soc/fsl/qbman/qman_portal.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qbman/qman_portal.c b/drivers/soc/fsl/qbman/qman_portal.c
> index e23b60618c1a..456ef5d5c199 100644
> --- a/drivers/soc/fsl/qbman/qman_portal.c
> +++ b/drivers/soc/fsl/qbman/qman_portal.c
> @@ -48,9 +48,10 @@ static void portal_set_cpu(struct qm_portal_config *pcfg, int cpu)
>          struct device *dev = pcfg->dev;
>          int ret;
> 
> -       pcfg->iommu_domain = iommu_domain_alloc(&platform_bus_type);
> -       if (!pcfg->iommu_domain) {
> +       pcfg->iommu_domain = iommu_paging_domain_alloc(dev);
> +       if (IS_ERR(pcfg->iommu_domain)) {
>                  dev_err(dev, "%s(): iommu_domain_alloc() failed", __func__);
> +               pcfg->iommu_domain = NULL;
>                  goto no_iommu;
>          }
>          ret = fsl_pamu_configure_l1_stash(pcfg->iommu_domain, cpu);
> --
> 2.34.1
> 

Applied for 6.12

Thanks
Christophe

