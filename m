Return-Path: <linuxppc-dev+bounces-9188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51433AD0E53
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jun 2025 17:59:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bF2vB5rLXz2yqn;
	Sun,  8 Jun 2025 01:59:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749311990;
	cv=none; b=D5bQpI5YajaSfqa8k3Y+RApICHXN/w9zRzO95AuZ/ArjDocTTKvs7vbAeqIX7MUyrhuk3Kb/CnRHeQCRE5+VpQBXsl/UFQ0yALv8ycquUBPJ2QXCGSokG6rcX/ZJHJMlxeAzGgef3B6NWngBosjyyGXtLYYYRimYVbYa2xjsEV9FM0/uw+pOvHwhQdkXKfx+XKkhDtrNZPyitkWOpiDrVpNgWu21GLMbkOaZTGpRHhEuIU8ledg2er5+KKUSVw92Iv7vAIldi9SCwD7cgCL5CrZGp9389N1VtgzDWuvftte+xKVjqS3+XMSbUg7gu0gnrmLEr3SpSTl5SZcpj+gBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749311990; c=relaxed/relaxed;
	bh=WqPXzQfOBkSg6Wxyj4Ie76iGWRDRnm01njaAWfiUy1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fFyyiRmCaQGt/8hGxbzs0RmVKaIOSrO3SY0FbqnPmxOSQzRPtUmWjEj3D/r94TekY10lP+3hkLOLY/5t3dzGqVuKbX/QSyETvcu1GgCSIWc6ax9DVRmr6atz9/WS+JA9LBJI2eWUluBm7Fd41slgDruU67KdAgYx/3G9VfnF3TdofCCDE8HBHUcofO4jQ87hYHb07JalItg9eTVPiFfN/Mp4lG1KIAkrvaJ5byrndd1iIMDFh9Z6xodqZ8OCoELmpx+NPFJ8jlh95U9SxO9FC1OvchXVHiOYFgGxjd90wVfcAJvEDlXbSENT4+/+lu8nw4vBB2yh+D8hzPYHaGWAMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PAreezaA; dkim-atps=neutral; spf=pass (client-ip=220.197.31.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PAreezaA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.3; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bF2v843mfz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jun 2025 01:59:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=WqPXzQfOBkSg6Wxyj4Ie76iGWRDRnm01njaAWfiUy1s=;
	b=PAreezaAcUZNwAn/lFfbdBkcDVhCD6jqD1LO+N7g/y7lvtN/OCnoG/3B6jJCOW
	ErhnhFrUCHGJG9h9AI2NFjr6kWwYinn6toHcULvCiUwUm898ucdmAA8T0OFYv5e9
	0beL1IbezcPdwWrbHiN15X+nGrAA14cDK/rAIazOFJv3w=
Received: from [192.168.71.94] (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAHzn3cYURotOR+Gw--.10086S2;
	Sat, 07 Jun 2025 23:59:24 +0800 (CST)
Message-ID: <f2e49d66-ac97-4502-abe7-c02f560637e6@163.com>
Date: Sat, 7 Jun 2025 23:59:24 +0800
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI/AER: Use pci_clear_and_set_config_dword() to
 simplify mask updates
To: mahesh@linux.ibm.com, bhelgaas@google.com
Cc: oohall@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20250607155159.805679-1-18255117159@163.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250607155159.805679-1-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wAHzn3cYURotOR+Gw--.10086S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGry3ury3CF1kWw1Dtw1fJFb_yoW5Zw43pr
	ZxAFyrArWUJF1Y9rWUWaykAr1rZas7tay0gr93Gwn5XF4xZFZrJr9avw17J345KFZ7Xw4f
	Jws5Ka1ruF4UtaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UmZXrUUUUU=
X-Originating-IP: [124.79.114.92]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDx1lo2hEWUbMvgAAsV
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add Mani's new email address.

On 2025/6/7 23:51, Hans Zhang wrote:
> Replace manual read-modify-write sequences in multiple functions with
> pci_clear_and_set_config_dword() to ensure atomic operations and reduce
> code duplication.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
> Changes for v2:
> - The patch commit message were modified.
> - New optimizations for the functions disable_ecrc_checking, aer_enable_irq, and aer_disable_irq have been added.
> ---
>   drivers/pci/pcie/aer.c | 30 +++++++++++-------------------
>   1 file changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 70ac66188367..86cbd204a73f 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -176,14 +176,13 @@ static int enable_ecrc_checking(struct pci_dev *dev)
>   static int disable_ecrc_checking(struct pci_dev *dev)
>   {
>   	int aer = dev->aer_cap;
> -	u32 reg32;
>   
>   	if (!aer)
>   		return -ENODEV;
>   
> -	pci_read_config_dword(dev, aer + PCI_ERR_CAP, &reg32);
> -	reg32 &= ~(PCI_ERR_CAP_ECRC_GENE | PCI_ERR_CAP_ECRC_CHKE);
> -	pci_write_config_dword(dev, aer + PCI_ERR_CAP, reg32);
> +	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_CAP,
> +				       PCI_ERR_CAP_ECRC_GENE |
> +				       PCI_ERR_CAP_ECRC_CHKE, 0);
>   
>   	return 0;
>   }
> @@ -1101,15 +1100,12 @@ static bool find_source_device(struct pci_dev *parent,
>   static void pci_aer_unmask_internal_errors(struct pci_dev *dev)
>   {
>   	int aer = dev->aer_cap;
> -	u32 mask;
>   
> -	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, &mask);
> -	mask &= ~PCI_ERR_UNC_INTN;
> -	pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, mask);
> +	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
> +				       PCI_ERR_UNC_INTN, 0);
>   
> -	pci_read_config_dword(dev, aer + PCI_ERR_COR_MASK, &mask);
> -	mask &= ~PCI_ERR_COR_INTERNAL;
> -	pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, mask);
> +	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_COR_MASK,
> +				       PCI_ERR_COR_INTERNAL, 0);
>   }
>   
>   static bool is_cxl_mem_dev(struct pci_dev *dev)
> @@ -1555,23 +1551,19 @@ static irqreturn_t aer_irq(int irq, void *context)
>   static void aer_enable_irq(struct pci_dev *pdev)
>   {
>   	int aer = pdev->aer_cap;
> -	u32 reg32;
>   
>   	/* Enable Root Port's interrupt in response to error messages */
> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> -	reg32 |= ROOT_PORT_INTR_ON_MESG_MASK;
> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +	pci_clear_and_set_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND,
> +				       0, ROOT_PORT_INTR_ON_MESG_MASK);
>   }
>   
>   static void aer_disable_irq(struct pci_dev *pdev)
>   {
>   	int aer = pdev->aer_cap;
> -	u32 reg32;
>   
>   	/* Disable Root Port's interrupt in response to error messages */
> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> -	reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +	pci_clear_and_set_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND,
> +				       ROOT_PORT_INTR_ON_MESG_MASK, 0);
>   }
>   
>   /**
> 
> base-commit: ec7714e4947909190ffb3041a03311a975350fe0


