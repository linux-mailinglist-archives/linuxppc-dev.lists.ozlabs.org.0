Return-Path: <linuxppc-dev+bounces-8809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DF3ABEF76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 11:20:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2Qrd3sJBz3bx1;
	Wed, 21 May 2025 19:20:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747819249;
	cv=none; b=U92C//h5dqiYSRZcxKSFZmY5tkYQbvqZcd35Cgq5JDg+2wvcY9Ii9GR4+fIqE+hQglTEDfO9JSf2Z1qeWFhy20H26fJYYysKgscUWXOSjTZlYSsK7Hu59JoD2feIRvQQM/Z9KuwkeW6NHocVmJTtQxpC7wW23gPF+/uKqUlWAMc9zV9gNy+d5ABRf7lVYF1536M0xCXUd7elIEwQa9EQxmOKZB5LluQ8FiHc3qRCwODRJ2gUcwDHJSKlUV2cb1wZLiJBCeOUfsIzHOmFjdU0FYsS6eJpANcN6ryVTirwQwK47fCwEXstPgivfyolaV/sWYq2PSOrntIP3m3Gga6Xrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747819249; c=relaxed/relaxed;
	bh=OGCknU44LOIpe2vbs7u4bL5eQCZpEL1YCHXepYhGK6s=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j3LvseNs90mxe/NS1uNaNeVjctph0vK8twLeVuMkrEebRVqMJD26ceWXjmK+qT9NpK2noeOrTXGvqhTYL0KTRupcGbaPDYASE39++dt+Llkr9skv6nj3DbxfYWJ+xGhGImHQCxOhBJ/A8yHbzupdk0FxsLyA5TMP6qLqoLF3oaKBxxy8xT9QD3kVG2QPynLlbm8ZYyKqH0B8HRvMTbMNvSBtLRq+CsCR0JLEz4MXlnvRhDW0khIU9d6UfKBf/7IxNU1vVMoU9WUkX3NCzOc6Z9l2sEYzOz9sqT/Vcp/7Oa3bTE3zb0pwmRALJtkdjeHr85X6EwwsLjqA7JLqg/ncuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2Qrc3qK6z3bwR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 19:20:48 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b2QqW4CpMz6GDJ7;
	Wed, 21 May 2025 17:19:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3E4251402C3;
	Wed, 21 May 2025 17:20:44 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 May
 2025 11:20:43 +0200
Date: Wed, 21 May 2025 10:20:41 +0100
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
Subject: Re: [PATCH v7 04/17] PCI/AER: Consolidate Error Source ID logging
 in aer_isr_one_error_type()
Message-ID: <20250521102041.00004901@huawei.com>
In-Reply-To: <20250520215047.1350603-5-helgaas@kernel.org>
References: <20250520215047.1350603-1-helgaas@kernel.org>
	<20250520215047.1350603-5-helgaas@kernel.org>
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

On Tue, 20 May 2025 16:50:21 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Previously we decoded the AER Error Source ID in aer_isr_one_error_type(),
> then again in find_source_device() if we didn't find any devices with
> errors logged in their AER Capabilities.
> 
> Consolidate this so we only decode and log the Error Source ID once in
> aer_isr_one_error_type().  Add a "details" parameter so we can add a note
> when we didn't find any downstream devices with errors logged in their AER
> Capability.
> 
> This changes the dmesg logging when we found no devices with errors logged:
> 
>   - pci 0000:00:01.0: AER: Correctable error message received from 0000:02:00.0
>   - pci 0000:00:01.0: AER: found no error details for 0000:02:00.0
>   + pci 0000:00:01.0: AER: Correctable error message received from 0000:02:00.0 (no details found)
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Nice little improvement.  I'll assume you reuse
details later as otherwise passing a bool and creating
the (no details found) in aer_print_port_info() would
have been simpler to my eyes as it would have put all the
string generation in one place.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/pci/pcie/aer.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 568229288ca3..488a6408c7a8 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -733,16 +733,17 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
>  			info->severity, info->tlp_header_valid, &info->tlp);
>  }
>  
> -static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info)
> +static void aer_print_port_info(struct pci_dev *dev, struct aer_err_info *info,
> +				const char *details)
>  {
>  	u8 bus = info->id >> 8;
>  	u8 devfn = info->id & 0xff;
>  
> -	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d\n",
> +	pci_info(dev, "%s%s error message received from %04x:%02x:%02x.%d%s\n",
>  		 info->multi_error_valid ? "Multiple " : "",
>  		 aer_error_severity_string[info->severity],
>  		 pci_domain_nr(dev->bus), bus, PCI_SLOT(devfn),
> -		 PCI_FUNC(devfn));
> +		 PCI_FUNC(devfn), details);
>  }
>  
>  #ifdef CONFIG_ACPI_APEI_PCIEAER
> @@ -926,15 +927,8 @@ static bool find_source_device(struct pci_dev *parent,
>  	else
>  		pci_walk_bus(parent->subordinate, find_device_iter, e_info);
>  
> -	if (!e_info->error_dev_num) {
> -		u8 bus = e_info->id >> 8;
> -		u8 devfn = e_info->id & 0xff;
> -
> -		pci_info(parent, "found no error details for %04x:%02x:%02x.%d\n",
> -			 pci_domain_nr(parent->bus), bus, PCI_SLOT(devfn),
> -			 PCI_FUNC(devfn));
> +	if (!e_info->error_dev_num)
>  		return false;
> -	}
>  	return true;
>  }
>  
> @@ -1281,9 +1275,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>  static void aer_isr_one_error_type(struct pci_dev *root,
>  				   struct aer_err_info *info)
>  {
> -	aer_print_port_info(root, info);
> +	bool found;
>  
> -	if (find_source_device(root, info))
> +	found = find_source_device(root, info);
> +	aer_print_port_info(root, info, found ? "" : " (no details found");
> +	if (found)
>  		aer_process_err_devices(info);
>  }
>  


