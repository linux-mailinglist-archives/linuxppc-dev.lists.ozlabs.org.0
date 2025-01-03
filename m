Return-Path: <linuxppc-dev+bounces-4633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B708A00880
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 12:17:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPgz566QCz2xQ8;
	Fri,  3 Jan 2025 22:17:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735903057;
	cv=none; b=BOhQaIW4LIR0Jz8+TnIKE4edSV94LhHrd1+8N30O8KlQx7wIUW87W/b0SoVnhnT3Zt0pOVwUr6Mgb/0UXC9apR4agw0p1MZCjaQW9GWlkCyfUJbWAz5j+ED+dyu3YdnP9FLYt3b47202qtwkdKyFJSNX526jZAJWZYNgPJOBszgCNbMyyXJzrDd5AIkQpjt/Y33ltthOO1gVrymA5abaTy5rdAT73WSoVLXr5tecA32P1OwhTl8YAw/fCe0fY1zg9sUpfnbaly/ZrfsX/vBn7nsI+qB91YD95OY8wVNggr285LmfHNDF4YowXEDjupwabkCRFCbwp7bwOK++UyqIww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735903057; c=relaxed/relaxed;
	bh=Aq48p+m41K3ezDIynwlebgPMap9fDoRlnHk8CyL6OTY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EyHpt/YkkZPsYW1vzLouyESTFn1PNgAUEDnYXWonuA2uLaZtkBPvjqVHjUL9ESX0QZEOKbjo4zmSYrxIyV/IzYWLsa8LXzGJJk0/kNvU5Xlx1qexuJf8Vj9uEZxhnyxJn0ji3cviPoRjIolxio30cRbl1DbOLZcWaMp+EMQbxoL4FuhL/B85v/q8RDzxCakpR4f7FGPWdwc1GWDENNZGN0axHf0aOsjjdT8E7zUcFacZKvD5RdBA1l8fXqc9KymD4YenAy9w/Al00XMU8A+wu7GNh2kwEz1XofR13dhbDnwJAu1n5TrU8Dou6jRUxSP1wLxvAb7i4jBny15Dbds7Vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPgz46gFqz2x9j
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 22:17:36 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YPgxM1w8zz6M4KP;
	Fri,  3 Jan 2025 19:16:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F8691406AC;
	Fri,  3 Jan 2025 19:17:34 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 3 Jan
 2025 12:17:34 +0100
Date: Fri, 3 Jan 2025 11:17:32 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Atharva Tiwari <evepolonium@gmail.com>
CC: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran
	<oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI/AER:Add error message when unable to handle
 additional devices
Message-ID: <20250103111732.00003ab3@huawei.com>
In-Reply-To: <20241227071910.1719-1-evepolonium@gmail.com>
References: <20241227071910.1719-1-evepolonium@gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 27 Dec 2024 12:49:10 +0530
Atharva Tiwari <evepolonium@gmail.com> wrote:

> Log an error message in `find_device_iter'
> when the system cannot handle more error devices.
Needs a statement of 'why'

Jonathan

> 
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
> ---
>  drivers/pci/pcie/aer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 34ce9f834d0c..04743617202e 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -886,7 +886,7 @@ static int find_device_iter(struct pci_dev *dev, void *data)
>  		/* List this device */
>  		if (add_error_device(e_info, dev)) {
>  			/* We cannot handle more... Stop iteration */
> -			/* TODO: Should print error message here? */
> +			pr_err("PCI: Unable to handle additional error devices\n");
>  			return 1;
>  		}
>  


