Return-Path: <linuxppc-dev+bounces-11220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1CAB3217E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 19:27:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7nFJ5pmHz3cmw;
	Sat, 23 Aug 2025 03:27:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755883652;
	cv=none; b=YB7lOhgbL2wnuAp13pPiujUcd8SpZcCIAH3VllCrrMa9Xc40khRkx6MNqmpVctFWigHE1jXKwaQQJ0++k3L2rr0xunITF0XFHdmAK0G8AY3CXLBz+GUE5OWZxpTTFyfqO/qL3+WUXjmmZEV0XA6uf6rhLK1J4igCWT/zQtaX3cQICoy99nTyQKJ3MrMg1v0uw4Ps0VmHlsrwwMvoI2MCOTgV03aoCz90qmwXa4V9nYdHSe7ztH6/6bZvl8HODQLTpyrl/dunIG3YxsVWsZSk4qGhyCSFaTvqyEzpntm0POBHA8N5lPpSH/fi2dOnw87hSW5dIp44vHObDcArShzX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755883652; c=relaxed/relaxed;
	bh=cnYAK6pcJbmN/7KkXHKKoNuoegVk5crF3+JsE5R4CDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VMYR85GoLjgGES6GZBQ/voF0Q72LploXuh4nq6Qv2M1RQtKPyqVH5d0vn4MoJhROiQgo9lGz7d2T5NgjcDRNbBcHnEg1bUu2AeUPfchvnN2EyK6wyxi60igwSY9K7k0XORTfvddjKvYkqdMiqg/hJ8bRCK2TmLM4He52vhTzXUwccKrvD0j7BSmgXx7MUAqbY0hzqdwzGHSKb/+DsjpuvnFkJv3Iq6NZE3JO/3kegI3jID0W04nqYO7Osqdlg/2BfO4ovttDpI50MyDst9EBWarEk4MsH7PKdFJfeQHwzL9u9tqrMvvn6bF3XJDxn9Ci0MLOmht1qSxSrxqfBWwLAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JYIJREYc; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JYIJREYc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7nFH687Gz3clh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 03:27:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F05743532;
	Fri, 22 Aug 2025 17:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA3CC4CEED;
	Fri, 22 Aug 2025 17:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755883649;
	bh=G7KtXL3SjzTkHJuJOjwYNF1lYEbXJj7RSBitEc7W8Zw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=JYIJREYc3SZvg4o7EQpPH98l0K7aQf2+DyQbIFgiot+v5EJ++MLXdULNEx4PVxR+A
	 zC9ma60qFBdp2XnPeijvRm+wVOkoqzpt15MRz/yn/5n90QBS6uVUiSvHE7AEGt90uP
	 zSFIO0Xy/X66608SXg7/eEo6+mUpBp71po7Vv9MaQmOSSGXObn/Nx1LXxYvbhJEDZy
	 Wfzz4nJy1B0TR7/QOJO21Mw90TDV4FtTIOkbi0JkC2H8HctU/SLT75H3DjYoeheL0r
	 66HNIRe+xb/XdQWmpdkEZ2WP+bLIrTOdXnMid5nXxcXP+UNe1eUbxB+l+xxkeCBO0s
	 Xw/eo9rSGhsig==
Date: Fri, 22 Aug 2025 12:27:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: linux-pci@vger.kernel.org, bhelgaas@google.com, mahesh@linux.ibm.com,
	oohall@gmail.com, linuxppc-dev@lists.ozlabs.org,
	linux-acpi@vger.kernel.org, rafael@kernel.org, lenb@kernel.org,
	james.morse@arm.com, tony.luck@intel.com, bp@alien8.de,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com, linmiaohe@huawei.com,
	shiju.jose@huawei.com, adam.c.preble@intel.com, lukas@wunner.de,
	Smita.KoralahalliChannabasappa@amd.com, rrichter@amd.com,
	linux-cxl@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, erwin.tsaur@intel.com,
	sathyanarayanan.kuppuswamy@intel.com, dan.j.williams@intel.com,
	feiting.wanyan@intel.com, yudong.wang@intel.com,
	chao.p.peng@intel.com, qingshun.wang@linux.intel.com,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v5 2/2] PCI/AER: Print UNCOR_STATUS bits that might be
 ANFE
Message-ID: <20250822172727.GA690123@bhelgaas>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620025857.206647-3-zhenzhong.duan@intel.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 20, 2024 at 10:58:57AM +0800, Zhenzhong Duan wrote:
> When an Advisory Non-Fatal error(ANFE) triggers, both correctable error(CE)
> status and ANFE related uncorrectable error(UE) status will be printed:
> 
>   AER: Correctable error message received from 0000:b7:02.0
>   PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
>     device [8086:0db0] error status/mask=00002000/00000000
>      [13] NonFatalErr
>     Uncorrectable errors that may cause Advisory Non-Fatal:
>      [12] TLP

Forgot to mention on other patch, but please add spaces between the
spelled-out terms and the "()" abbreviation, e.g., "Correctable Error
(CE)".

Also, can you update this commit log to say what the patch does?  It's
OK if it repeats and/or expands on the subject.

> Tested-by: Yudong Wang <yudong.wang@intel.com>
> Co-developed-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
> Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>  drivers/pci/pcie/aer.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 3dcfa0191169..ba3a54092f2c 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -681,6 +681,7 @@ static void __aer_print_error(struct pci_dev *dev,
>  {
>  	const char **strings;
>  	unsigned long status = info->status & ~info->mask;
> +	unsigned long anfe_status = info->anfe_status;
>  	const char *level, *errmsg;
>  	int i;
>  
> @@ -701,6 +702,20 @@ static void __aer_print_error(struct pci_dev *dev,
>  				info->first_error == i ? " (First)" : "");
>  	}
>  	pci_dev_aer_stats_incr(dev, info);
> +
> +	if (!anfe_status)
> +		return;
> +
> +	strings = aer_uncorrectable_error_string;
> +	pci_printk(level, dev, "Uncorrectable errors that may cause Advisory Non-Fatal:\n");

Will have to look at the spec more, but I don't think "may cause" is
quite the right wording here.  It's not that an Uncorrectable Error
causes a separate Advisory Non-Fatal Error; IIUC there's only a single
error and it's just *treated* and signaled differently.

> +
> +	for_each_set_bit(i, &anfe_status, 32) {
> +		errmsg = strings[i];
> +		if (!errmsg)
> +			errmsg = "Unknown Error Bit";
> +
> +		pci_printk(level, dev, "   [%2d] %s\n", i, errmsg);

I think we might have removed pci_printk() recently, so this might
need adjustment.

> +	}
>  }
>  
>  void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
> -- 
> 2.34.1
> 

