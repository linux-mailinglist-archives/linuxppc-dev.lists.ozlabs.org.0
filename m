Return-Path: <linuxppc-dev+bounces-8808-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A06ABEF50
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 11:15:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2Qkg2CB6z3bsm;
	Wed, 21 May 2025 19:15:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747818939;
	cv=none; b=PfrvuZ2NX6h6s1KEpEWXDYOjw6yDUtVfP+RxiAOJr1VuM59eeYKELcwTHN/Omlec/8RWc05tr5J+q+QhHYdn82uxB9Vf+kwNX7EZBjffQVgq+Em7tzFFHvZASiDNrFTq+pnjHylQLOECi7F14WIMnye65ZlvQYBeFcKXzlWxE1Skaz08lJuoNXzjz/CNLK/z+63ms3a5LW5j7GZT1SPF9bg86wkicoxqv3Ko6aQce0ws/LboOx3MgHvKBqvHrzB73A6GOQThFygTnFeJWb2FiE9FptA3JcQ1tvp7uPz3RDHYsT9XqljvGbOdQgCXU7/F7NUswcT1t/Ot1HA+7cr9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747818939; c=relaxed/relaxed;
	bh=uaukME0DI156wRLVKcSUoNAH164cT5waxeWqipoNMK8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K5xjho7WjqDmdZA+fS7uerwZW8wXwvax5jTz/Js2hTJPZCZ8jlnSekrOncHnMnHOpwsaENz/csuiO7WtN5XAGRvEhNSEUE2VzywIZap/vBP1DPKG14Wf7ZQNCizAXQ0VEc8PBMyEPasepCT80nl+mANwSsbwA7podIDoIen9klI0JtLxSfIgeLeNqXQ8jvZtgD7Bmm8KNDLaZnDa6EsT92owptyd0kE+6XaEXuF34DCQlcu0iX+XDdCoehZAmOp1d1RGjswkoIhu0MeWMzrLdBxe5C6rKopl8qablhlWQEILQjQcO1rDhZCHmXEnHztLbR/OPRN5Njsagj7VurC6Xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2Qkf015Mz3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 19:15:35 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b2Qfq4j1Bz6H7Ps;
	Wed, 21 May 2025 17:12:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 88B57140519;
	Wed, 21 May 2025 17:15:30 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 May
 2025 11:15:29 +0200
Date: Wed, 21 May 2025 10:15:27 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-pci@vger.kernel.org>, Jon Pan-Doh <pandoh@google.com>, "Karolina
 Stolarek" <karolina.stolarek@oracle.com>, Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>, Ben Fuller
	<ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>, "Anil
 Agrawal" <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Sathyanarayanan
 Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Lukas Wunner
	<lukas@wunner.de>, Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney"
	<paulmck@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver
 O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>, Keith
 Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>, "Terry Bowman"
	<terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>, "Dave Jiang"
	<dave.jiang@intel.com>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v7 03/17] PCI/AER: Factor COR/UNCOR error handling out
 from aer_isr_one_error()
Message-ID: <20250521101527.000026b4@huawei.com>
In-Reply-To: <20250520215047.1350603-4-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
	<20250520215047.1350603-4-helgaas@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 20 May 2025 16:50:20 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> aer_isr_one_error() duplicates the Error Source ID logging and AER error
> processing for Correctable Errors and Uncorrectable Errors.  Factor out the
> duplicated code to aer_isr_one_error_type().
> 
> aer_isr_one_error() doesn't need the struct aer_rpc pointer, so pass it the
> Root Port or RCEC pci_dev pointer instead.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
One passing comment inside (on neighbouring code)
Otherwise it is a sensible bit of cleanup.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/pci/pcie/aer.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index a1cf8c7ef628..568229288ca3 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1273,17 +1273,32 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>  }
>  
>  /**
> - * aer_isr_one_error - consume an error detected by Root Port
> - * @rpc: pointer to the Root Port which holds an error
> + * aer_isr_one_error_type - consume a Correctable or Uncorrectable Error
> + *			    detected by Root Port or RCEC
> + * @root: pointer to Root Port or RCEC that signaled AER interrupt
> + * @info: pointer to AER error info
> + */
> +static void aer_isr_one_error_type(struct pci_dev *root,
> +				   struct aer_err_info *info)
> +{
> +	aer_print_port_info(root, info);
> +
> +	if (find_source_device(root, info))
> +		aer_process_err_devices(info);
> +}
> +
> +/**
> + * aer_isr_one_error - consume error(s) signaled by an AER interrupt from
> + *		       Root Port or RCEC
> + * @root: pointer to Root Port or RCEC that signaled AER interrupt
>   * @e_src: pointer to an error source
>   */
> -static void aer_isr_one_error(struct aer_rpc *rpc,
> +static void aer_isr_one_error(struct pci_dev *root,
>  		struct aer_err_source *e_src)
>  {
> -	struct pci_dev *pdev = rpc->rpd;
>  	struct aer_err_info e_info;

I wonder if, in the interests of readability this should be
initialized.  That would allows some conditions to set
only the valid case (ones) rather than explicit zeros.
 
>  
> -	pci_rootport_aer_stats_incr(pdev, e_src);
> +	pci_rootport_aer_stats_incr(root, e_src);
>  
>  	/*
>  	 * There is a possibility that both correctable error and
> @@ -1297,10 +1312,8 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>  			e_info.multi_error_valid = 1;
>  		else
>  			e_info.multi_error_valid = 0;
> -		aer_print_port_info(pdev, &e_info);
>  
> -		if (find_source_device(pdev, &e_info))
> -			aer_process_err_devices(&e_info);
> +		aer_isr_one_error_type(root, &e_info);
>  	}
>  
>  	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
> @@ -1316,10 +1329,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>  		else
>  			e_info.multi_error_valid = 0;
>  
> -		aer_print_port_info(pdev, &e_info);
> -
> -		if (find_source_device(pdev, &e_info))
> -			aer_process_err_devices(&e_info);
> +		aer_isr_one_error_type(root, &e_info);
>  	}
>  }
>  
> @@ -1340,7 +1350,7 @@ static irqreturn_t aer_isr(int irq, void *context)
>  		return IRQ_NONE;
>  
>  	while (kfifo_get(&rpc->aer_fifo, &e_src))
> -		aer_isr_one_error(rpc, &e_src);
> +		aer_isr_one_error(rpc->rpd, &e_src);
>  	return IRQ_HANDLED;
>  }
>  


