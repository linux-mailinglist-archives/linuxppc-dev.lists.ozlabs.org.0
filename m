Return-Path: <linuxppc-dev+bounces-7322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C18BA6EA53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 08:20:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMLsx6Ts7z2yqd;
	Tue, 25 Mar 2025 18:20:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742887221;
	cv=none; b=CNuYdRt6x3n16LuezRpsO+85tRzeLYpcKclLgkws6Rwmqj+MroS8OuZ+8J8dvpdqsxxA9CLyxeW88A1xy3YTzw0kdz6LGuhM21nCDT4fFL53KssvxVz6yQ5PVZJpDMj2bMIlLwNCS+WtDYUEu500D0VuHFapI1kB5P/pm19KssV1o7mYln/mjRvM3cUtYXr2GHMAL5U8iruOcK1AZdiZgYQHsp2gNZ//NrVnDmFv1Nhxn9YVJOZvoFZ9xtEpBTyj7MKJdFQxCcl0xL8fZdvfiOODSIwtM0oGYSm+q7x3+l/RuC/FmFjLDx8qBJygR2Bg3p897IDx/AomOKM0TKT6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742887221; c=relaxed/relaxed;
	bh=piogwt4lmu4qtK2/ZkbCRH1Dp64bWGgsY5Wm+uO4l14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ys+POb50lBn7P64AfZQsk3pofYHfKHnRlo/xuo5/LX8tGROxklL6rIVEV0V/La1a6r4jDKA4LMH3oV6doN2CqYfJYgC8dAeB81DBgUkXdPRRZbprPSTluHK+sun7d77Baj7bglv16S9Gvh0L4mLJ8Y/cH3PKB1heLeWFWEFJ0cIAqkwHDA+8v0MJdAxOYEy2HQ5WPGuCuMIBIcz+VVQUDqtQDZFE4xbNQYOgRlbpcHmo9rXGgFCSlNpl2uD6aMHNLCoGB5v+LD2U6DrL6wAGikhsgdBf80K7JOebRxeAXK3Dv+YCEtqEqGv4CsqPPPQIWLhDUlkNO8ftX89KVupTBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMLsx1xwGz2yqg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 18:20:21 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZMLk83dyNz9sSm;
	Tue, 25 Mar 2025 08:13:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1R402GlpRmr; Tue, 25 Mar 2025 08:13:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZMLk82p2tz9sSj;
	Tue, 25 Mar 2025 08:13:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A99B8B765;
	Tue, 25 Mar 2025 08:13:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Q_Gt9WeIslhN; Tue, 25 Mar 2025 08:13:36 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BC7668B763;
	Tue, 25 Mar 2025 08:13:35 +0100 (CET)
Message-ID: <b192632a-7b30-4227-96b8-84a587c45fa2@csgroup.eu>
Date: Tue, 25 Mar 2025 08:13:35 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vfio: pci: Advertise INTx only if LINE is connected
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, alex.williamson@redhat.com,
 jgg@ziepe.ca, kevin.tian@intel.com
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, yi.l.liu@intel.com,
 Yunxiang.Li@amd.com, pstanner@redhat.com, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
References: <174231895238.2295.12586708771396482526.stgit@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <174231895238.2295.12586708771396482526.stgit@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 18/03/2025 à 18:29, Shivaprasad G Bhat a écrit :
> On POWER systems, when the device is behind the io expander,
> not all PCI slots would have the PCI_INTERRUPT_LINE connected.
> The firmware assigns a valid PCI_INTERRUPT_PIN though. In such
> configuration, the irq_info ioctl currently advertizes the
> irq count as 1 as the PCI_INTERRUPT_PIN is valid.
> 
> The patch adds the additional check[1] if the irq is assigned
> for the PIN which is done iff the LINE is connected.
> 
> [1]: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fqemu-devel%2F20250131150201.048aa3bf.alex.williamson%40redhat.com%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Ce0fb1d4bf2064e115ce408dd6642796b%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638779157886704638%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=egZuT5CZsC6S%2Bd7bZTuO4RcKL8IJREPbxIMGZZkZeMQ%3D&reserved=0
> 
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> Suggested-By: Alex Williamson <alex.williamson@redhat.com>
> ---
>   drivers/vfio/pci/vfio_pci_core.c |    4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 586e49efb81b..4ce70f05b4a8 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -734,6 +734,10 @@ static int vfio_pci_get_irq_count(struct vfio_pci_core_device *vdev, int irq_typ
>   			return 0;
>   
>   		pci_read_config_byte(vdev->pdev, PCI_INTERRUPT_PIN, &pin);
> +#if IS_ENABLED(CONFIG_PPC64)
> +		if (!vdev->pdev->irq)
> +			pin = 0;
> +#endif

I see no reason for #ifdef here, please instead do:

	if (IS_ENABLED(CONFIG_PPC64) && !vdev->pdev->irq)

See 
https://docs.kernel.org/process/coding-style.html#conditional-compilation

>   
>   		return pin ? 1 : 0;
>   	} else if (irq_type == VFIO_PCI_MSI_IRQ_INDEX) {
> 
> 
> 


