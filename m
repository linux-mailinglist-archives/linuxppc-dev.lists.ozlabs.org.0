Return-Path: <linuxppc-dev+bounces-11506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4AB3C431
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 23:18:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDB266h0Xz2yfL;
	Sat, 30 Aug 2025 07:18:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756502286;
	cv=none; b=gJyVCandHHfmtxFqJUJMQldfXnOzTNAUguLhfCxO53DdF5rclRQx0xOc+NIjBHSksU0X2d2rzrp5J+IvChiwRmfCP3V4RxLV5u+slN9Cln1beBsNaZ33SB9/TNpCaFOAcEHoI79lIXsrWc/57GO9xVqZTXeM7qw71pqmZGQwob8q09qTNeAjywdDmG8zmuFCVKPKFrHFmweVuJ7eSPwltnRmD3gamLV79rAhaSesCqzwoi0+Own7eVrxhBXfx95tvYx1t3aMIVjo4wsw/GpIBI6RcllgJsTkaGuUtNZBI/oWuIwi+oLHJ4viQ1iZFp0XZZBFUF4ZIcINKEPrpfU9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756502286; c=relaxed/relaxed;
	bh=jkWMMlUstzNoy5n5BoFaGIjxYwBFQSeyrlj3V+KPYok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DKQKDGFmDW4aK6kAE/s9s4gVJqXXTQzAPEFe8RXoMPVCXEMhyPSiDtcoWvasO9gQ8bJs1xEq85o7Rt2EDizDovRHee536xYGamTeHFA+FYEj2JK+jfmvKLMVWIxxiOmO7PCNiU6vnRzNCuCh5yK5TyUeOHW8tJQDZCDkKiYOHWKVrz0tWeGx/JGjmBMrRoaGzyoKF7RnLWuDbtrZ/KZrDEzDK62w3/MXPbEuxczcOt1HJVrtwRjShuhPT9lZFsa5HOq71GaK7HAFQ+ZOS3h8pM55zTU9dMr0eGN6LxIykF84c5wXfv5RmEuuY7Lp+CJA43FUeZzNgfhk3jfhEARxOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cTF1qr6g; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cTF1qr6g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDB261Jjtz2yMw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 07:18:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03CC860142;
	Fri, 29 Aug 2025 21:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8E6C4CEF0;
	Fri, 29 Aug 2025 21:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756502283;
	bh=V5VOMAjw9pzEl70en0MP+3pcBujDo0p2tlcA6Iwhj08=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cTF1qr6gFycOdtViqBehM1mwJmfXzfYP+ZHDqakqlmGuO18OPu7EJxuqBPjbkolvL
	 qOxyZ4ZX6PBxKF6Y0I4ZTcz4v/tOkzZG4R0ZohsfxpaWtdJOfA8hiUEcZl+I0hvIbP
	 mEXIVFKiifrZQEXq47mc7+8EuwpjhADw05aGzMbr5TqBL9v5w1YOPzezEmHpEBCLHj
	 ZVsQdN3oZZbcIBF+e537fOz9HTTWFObWhdCnCU9zrXgEK1vSezg6ArLxCRu3dX5PDS
	 4JUBXpK3uOMKHxjZ9GHz3s1Us6VsQrWHYGdCjHdjlcRryaOzKIjDXzJ/8o/VcOO3qR
	 zztYif2H5i5wA==
Date: Fri, 29 Aug 2025 16:18:01 -0500
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
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Matthew W Carlis <mattc@purestorage.com>
Subject: Re: [PATCH v5 2/2] PCI/AER: Print UNCOR_STATUS bits that might be
 ANFE
Message-ID: <20250829211801.GA1025641@bhelgaas>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[+cc Matt]

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
> 
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

__aer_print_error() is used by both native AER handling, where Linux
fields the AER interrupt and reads the AER status registers directly,
and APEI GHES firmware-first error handling, where platform firmware
fields the AER interrupt, reads the AER status registers, and packages
them up to hand off to Linux via aer_recover_queue().

But the previous patch only sets info->anfe_status for the native
path, so the APEI GHES path doesn't get the benefit of this change.

I think both paths should log the same ANFE information.

> +
> +	strings = aer_uncorrectable_error_string;
> +	pci_printk(level, dev, "Uncorrectable errors that may cause Advisory Non-Fatal:\n");
> +
> +	for_each_set_bit(i, &anfe_status, 32) {
> +		errmsg = strings[i];
> +		if (!errmsg)
> +			errmsg = "Unknown Error Bit";
> +
> +		pci_printk(level, dev, "   [%2d] %s\n", i, errmsg);
> +	}
>  }
>  
>  void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
> -- 
> 2.34.1
> 

