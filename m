Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAB95ECD85
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 22:00:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McVpY2jJ9z3cFr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 06:00:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c7D3k10N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c7D3k10N;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McVnw2NVZz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 05:59:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664308772; x=1695844772;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hHMW6dKcSr50LmzJxBbJqerolMIPg6Gn2+JmAaKAzHQ=;
  b=c7D3k10N20noCIvd8eixSksQsJ+dl4M6mTN4MUVczlkKrP5+yJBOw3kR
   tO1q7CpWXvIHp4pFoDN5zchGHvXHtyByQmeBszRCwaoubCVKJPkjWT83a
   wybsT/yI7poYeVipvZeh4yyEBY69kOWhqA9E2klzd5rwVs2UVFGnSfuBI
   fRVHK78LE/h+DY6fCkl3elaNMheXN3kokZSu9Tff1b4XAefjZJHFguvo6
   RfYXtkPP0s6PFf+beRIc39PCk1NbO9z6tzysFNT+JkekrXwQQJgbgvXKL
   ZC1/PUaK5VQcSfbiTKmMZ87fWXhqNIcX1ceYRPMgtWa2gvziCJi0YTPa0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="284546384"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="284546384"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 12:59:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="684116462"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; 
   d="scan'208";a="684116462"
Received: from weimingg-mobl.amr.corp.intel.com (HELO [10.212.244.112]) ([10.212.244.112])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 12:59:28 -0700
Message-ID: <8bf3e3c0-78b6-7121-1951-300175ede3b9@linux.intel.com>
Date: Tue, 27 Sep 2022 12:59:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 5/9] PCI/AER: Unexport pci_aer_clear_nonfatal_status()
Content-Language: en-US
To: Zhuo Chen <chenzhuo.1@bytedance.com>, bhelgaas@google.com,
 ruscur@russell.cc, oohall@gmail.com, fancer.lancer@gmail.com,
 jdmason@kudzu.us, dave.jiang@intel.com, allenbh@gmail.com,
 james.smart@broadcom.com, dick.kennedy@broadcom.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com
References: <20220927153524.49172-1-chenzhuo.1@bytedance.com>
 <20220927153524.49172-6-chenzhuo.1@bytedance.com>
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20220927153524.49172-6-chenzhuo.1@bytedance.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pci@vger.kernel.org, ntb@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/27/22 8:35 AM, Zhuo Chen wrote:
> Since pci_aer_clear_nonfatal_status() is used only internally, move
> its declaration to the PCI internal header file. Also, no one cares
> about return value of pci_aer_clear_nonfatal_status(), so make it void.
> 
> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> ---

Looks good to me.

>  drivers/pci/pci.h      | 2 ++
>  drivers/pci/pcie/aer.c | 7 ++-----
>  include/linux/aer.h    | 5 -----
>  3 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 785f31086313..a114175d08e4 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -684,6 +684,7 @@ void pci_aer_init(struct pci_dev *dev);
>  void pci_aer_exit(struct pci_dev *dev);
>  extern const struct attribute_group aer_stats_attr_group;
>  void pci_aer_clear_fatal_status(struct pci_dev *dev);
> +void pci_aer_clear_nonfatal_status(struct pci_dev *dev);
>  int pci_aer_clear_status(struct pci_dev *dev);
>  int pci_aer_raw_clear_status(struct pci_dev *dev);
>  #else
> @@ -691,6 +692,7 @@ static inline void pci_no_aer(void) { }
>  static inline void pci_aer_init(struct pci_dev *d) { }
>  static inline void pci_aer_exit(struct pci_dev *d) { }
>  static inline void pci_aer_clear_fatal_status(struct pci_dev *dev) { }
> +static inline void pci_aer_clear_nonfatal_status(struct pci_dev *dev) { }
>  static inline int pci_aer_clear_status(struct pci_dev *dev) { return -EINVAL; }
>  static inline int pci_aer_raw_clear_status(struct pci_dev *dev) { return -EINVAL; }
>  #endif
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 4e637121be23..e2ebd108339d 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -251,13 +251,13 @@ int pci_disable_pcie_error_reporting(struct pci_dev *dev)
>  }
>  EXPORT_SYMBOL_GPL(pci_disable_pcie_error_reporting);
>  
> -int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
> +void pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>  {
>  	int aer = dev->aer_cap;
>  	u32 status, sev;
>  
>  	if (!pcie_aer_is_native(dev))
> -		return -EIO;
> +		return;
>  
>  	/* Clear status bits for ERR_NONFATAL errors only */
>  	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, &status);
> @@ -265,10 +265,7 @@ int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>  	status &= ~sev;
>  	if (status)
>  		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
> -
> -	return 0;
>  }
> -EXPORT_SYMBOL_GPL(pci_aer_clear_nonfatal_status);
>  
>  void pci_aer_clear_fatal_status(struct pci_dev *dev)
>  {
> diff --git a/include/linux/aer.h b/include/linux/aer.h
> index 154690c278cb..f638ad955deb 100644
> --- a/include/linux/aer.h
> +++ b/include/linux/aer.h
> @@ -44,7 +44,6 @@ struct aer_capability_regs {
>  /* PCIe port driver needs this function to enable AER */
>  int pci_enable_pcie_error_reporting(struct pci_dev *dev);
>  int pci_disable_pcie_error_reporting(struct pci_dev *dev);
> -int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
>  int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev);
>  void pci_save_aer_state(struct pci_dev *dev);
>  void pci_restore_aer_state(struct pci_dev *dev);
> @@ -57,10 +56,6 @@ static inline int pci_disable_pcie_error_reporting(struct pci_dev *dev)
>  {
>  	return -EINVAL;
>  }
> -static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
> -{
> -	return -EINVAL;
> -}
>  static inline int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev)
>  {
>  	return -EINVAL;

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
