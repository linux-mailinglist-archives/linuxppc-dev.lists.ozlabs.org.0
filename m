Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 617008AD1F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 18:33:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNW670ZZqz3dVp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 02:33:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1007 seconds by postgrey-1.37 at boromir; Tue, 23 Apr 2024 02:33:27 AEST
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNW5g6rm9z3cds
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 02:33:25 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VNVgX4VLDz6J9gG;
	Tue, 23 Apr 2024 00:14:16 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id CD52A140736;
	Tue, 23 Apr 2024 00:16:30 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 22 Apr
 2024 17:16:30 +0100
Date: Mon, 22 Apr 2024 17:16:29 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: Re: [PATCH v3 1/3] PCI/AER: Store UNCOR_STATUS bits that might be
 ANFE in aer_err_info
Message-ID: <20240422171629.00005675@Huawei.com>
In-Reply-To: <20240417061407.1491361-2-zhenzhong.duan@intel.com>
References: <20240417061407.1491361-1-zhenzhong.duan@intel.com>
	<20240417061407.1491361-2-zhenzhong.duan@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
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
Cc: linmiaohe@huawei.com, alison.schofield@intel.com, rafael@kernel.org, sathyanarayanan.kuppuswamy@intel.com, linux-pci@vger.kernel.org, erwin.tsaur@intel.com, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com, ira.weiny@intel.com, dave@stgolabs.net, dave.jiang@intel.com, vishal.l.verma@intel.com, Smita.KoralahalliChannabasappa@amd.com, linux-acpi@vger.kernel.org, helgaas@kernel.org, lenb@kernel.org, chao.p.peng@intel.com, rrichter@amd.com, yudong.wang@intel.com, bp@alien8.de, qingshun.wang@linux.intel.com, bhelgaas@google.com, dan.j.williams@intel.com, linux-edac@vger.kernel.org, tony.luck@intel.com, feiting.wanyan@intel.com, adam.c.preble@intel.com, mahesh@linux.ibm.com, leoyang.li@nxp.com, lukas@wunner.de, james.morse@arm.com, linuxppc-dev@lists.ozlabs.org, shiju.jose@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 Apr 2024 14:14:05 +0800
Zhenzhong Duan <zhenzhong.duan@intel.com> wrote:

> In some cases the detector of a Non-Fatal Error(NFE) is not the most
> appropriate agent to determine the type of the error. For example,
> when software performs a configuration read from a non-existent
> device or Function, completer will send an ERR_NONFATAL Message.
> On some platforms, ERR_NONFATAL results in a System Error, which
> breaks normal software probing.
> 
> Advisory Non-Fatal Error(ANFE) is a special case that can be used
> in above scenario. It is predominantly determined by the role of the
> detecting agent (Requester, Completer, or Receiver) and the specific
> error. In such cases, an agent with AER signals the NFE (if enabled)
> by sending an ERR_COR Message as an advisory to software, instead of
> sending ERR_NONFATAL.
> 
> When processing an ANFE, ideally both correctable error(CE) status and
> uncorrectable error(UE) status should be cleared. However, there is no
> way to fully identify the UE associated with ANFE. Even worse, a Fatal
> Error(FE) or Non-Fatal Error(NFE) may set the same UE status bit as
> ANFE. Treating an ANFE as NFE will reproduce above mentioned issue,
> i.e., breaking softwore probing; treating NFE as ANFE will make us
> ignoring some UEs which need active recover operation. To avoid clearing
> UEs that are not ANFE by accident, the most conservative route is taken
> here: If any of the FE/NFE Detected bits is set in Device Status, do not
> touch UE status, they should be cleared later by the UE handler. Otherwise,
> a specific set of UEs that may be raised as ANFE according to the PCIe
> specification will be cleared if their corresponding severity is Non-Fatal.
> 
> To achieve above purpose, store UNCOR_STATUS bits that might be ANFE
> in aer_err_info.anfe_status. So that those bits could be printed and
> processed later.
> 
> Tested-by: Yudong Wang <yudong.wang@intel.com>
> Co-developed-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
> Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  drivers/pci/pci.h      |  1 +
>  drivers/pci/pcie/aer.c | 45 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 17fed1846847..3f9eb807f9fd 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -412,6 +412,7 @@ struct aer_err_info {
>  
>  	unsigned int status;		/* COR/UNCOR Error Status */
>  	unsigned int mask;		/* COR/UNCOR Error Mask */
> +	unsigned int anfe_status;	/* UNCOR Error Status for ANFE */
>  	struct pcie_tlp_log tlp;	/* TLP Header */
>  };
>  
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index ac6293c24976..27364ab4b148 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -107,6 +107,12 @@ struct aer_stats {
>  					PCI_ERR_ROOT_MULTI_COR_RCV |	\
>  					PCI_ERR_ROOT_MULTI_UNCOR_RCV)
>  
> +#define AER_ERR_ANFE_UNC_MASK		(PCI_ERR_UNC_POISON_TLP |	\
> +					PCI_ERR_UNC_COMP_TIME |		\
> +					PCI_ERR_UNC_COMP_ABORT |	\
> +					PCI_ERR_UNC_UNX_COMP |		\
> +					PCI_ERR_UNC_UNSUP)
> +
>  static int pcie_aer_disable;
>  static pci_ers_result_t aer_root_reset(struct pci_dev *dev);
>  
> @@ -1196,6 +1202,41 @@ void aer_recover_queue(int domain, unsigned int bus, unsigned int devfn,
>  EXPORT_SYMBOL_GPL(aer_recover_queue);
>  #endif
>  
> +static void anfe_get_uc_status(struct pci_dev *dev, struct aer_err_info *info)
> +{
> +	u32 uncor_mask, uncor_status;
> +	u16 device_status;
> +	int aer = dev->aer_cap;
> +
> +	if (pcie_capability_read_word(dev, PCI_EXP_DEVSTA, &device_status))
> +		return;
> +	/*
> +	 * Take the most conservative route here. If there are
> +	 * Non-Fatal/Fatal errors detected, do not assume any
> +	 * bit in uncor_status is set by ANFE.
> +	 */
> +	if (device_status & (PCI_EXP_DEVSTA_NFED | PCI_EXP_DEVSTA_FED))
> +		return;
> +

Is there not a race here?  If we happen to get either an NFED or FED 
between the read of device_status above and here we might pick up a status
that corresponds to that (and hence clear something we should not).

Or am I missing that race being close somewhere?

> +	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, &uncor_status);
> +	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, &uncor_mask);
> +	/*
> +	 * According to PCIe Base Specification Revision 6.1,
> +	 * Section 6.2.3.2.4, if an UNCOR error is raised as
> +	 * Advisory Non-Fatal error, it will match the following
> +	 * conditions:
> +	 *	a. The severity of the error is Non-Fatal.
> +	 *	b. The error is one of the following:
> +	 *		1. Poisoned TLP           (Section 6.2.3.2.4.3)
> +	 *		2. Completion Timeout     (Section 6.2.3.2.4.4)
> +	 *		3. Completer Abort        (Section 6.2.3.2.4.1)
> +	 *		4. Unexpected Completion  (Section 6.2.3.2.4.5)
> +	 *		5. Unsupported Request    (Section 6.2.3.2.4.1)
> +	 */
> +	info->anfe_status = uncor_status & ~uncor_mask & ~info->severity &
> +			    AER_ERR_ANFE_UNC_MASK;
> +}
> +
>  /**
>   * aer_get_device_error_info - read error status from dev and store it to info
>   * @dev: pointer to the device expected to have a error record
> @@ -1213,6 +1254,7 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>  
>  	/* Must reset in this function */
>  	info->status = 0;
> +	info->anfe_status = 0;
>  	info->tlp_header_valid = 0;
>  
>  	/* The device might not support AER */
> @@ -1226,6 +1268,9 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>  			&info->mask);
>  		if (!(info->status & ~info->mask))
>  			return 0;
> +
> +		if (info->status & PCI_ERR_COR_ADV_NFAT)
> +			anfe_get_uc_status(dev, info);
>  	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
>  		   type == PCI_EXP_TYPE_RC_EC ||
>  		   type == PCI_EXP_TYPE_DOWNSTREAM ||

