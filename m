Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B5779C8B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 04:17:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PPd13mxb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RN4732tcXz3cPD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 12:17:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PPd13mxb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RN4665HDJz2yV8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 12:16:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691806591; x=1723342591;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sbxhrY1MVdB36V2CNTZkugKnmcToq8EzXXuZlM20LSI=;
  b=PPd13mxb1pMVd/TSohDR/R/wQ6rJx1KwVpBowljJV/drALrCakl8hGb0
   e+AjGEPVfH86tHA54gKg8Rrvf+0Q8oUTknkgup34Ug29pSMqIRC7R/A8E
   8GVCGn1MkldoYCupMw6uUmjSRWtlvdb7eAqiDtT40zQcL4PkUU7hzsFJk
   K0Z03+BtYy6Zfc6sa4Lpea6NxMd9WXiHUjipaScKQy2W/ntpwprqD3f6U
   tCzpgzyNvxNHOoDViWlJXjPg31D5KrLiUxtJuj+w7ldHKyRiwAFvqhMbw
   mynod40+1tOYqPJNJOwyIlEYktAVZYhv3OL+FEBfE0EsgOy/kI+n5lEkT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375507194"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="375507194"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 19:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="979386282"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="979386282"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.79]) ([10.254.215.79])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 19:15:45 -0700
Message-ID: <b50a464a-fa28-e359-1bc5-4f2b105326ad@linux.intel.com>
Date: Sat, 12 Aug 2023 10:15:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 08/25] iommu: Reorganize
 iommu_get_default_domain_type() to respect def_domain_type()
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson
 <andersson@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
 <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <8-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <8-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, baolu.lu@linux.intel.com, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/8/3 8:07, Jason Gunthorpe wrote:
> Except for dart every driver returns 0 or IDENTITY from def_domain_type().
> 
> The drivers that return IDENTITY have some kind of good reason, typically
> that quirky hardware really can't support anything other than IDENTITY.
> 
> Arrange things so that if the driver says it needs IDENTITY then
> iommu_get_default_domain_type() either fails or returns IDENTITY.  It will
> never reject the driver's override to IDENTITY.
> 
> The only real functional difference is that the PCI untrusted flag is now
> ignored for quirky HW instead of overriding the IOMMU driver.
> 
> This makes the next patch cleaner that wants to force IDENTITY always for
> ARM_IOMMU because there is no support for DMA.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 66 +++++++++++++++++++++----------------------
>   1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index c64365169b678d..53174179102d17 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1669,19 +1669,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(fsl_mc_device_group);
>   
> -static int iommu_get_def_domain_type(struct device *dev)
> -{
> -	const struct iommu_ops *ops = dev_iommu_ops(dev);
> -
> -	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
> -		return IOMMU_DOMAIN_DMA;
> -
> -	if (ops->def_domain_type)
> -		return ops->def_domain_type(dev);
> -
> -	return 0;
> -}
> -
>   static struct iommu_domain *
>   __iommu_group_alloc_default_domain(const struct bus_type *bus,
>   				   struct iommu_group *group, int req_type)
> @@ -1775,36 +1762,49 @@ static int iommu_bus_notifier(struct notifier_block *nb,
>   static int iommu_get_default_domain_type(struct iommu_group *group,
>   					 int target_type)
>   {
> +	const struct iommu_ops *ops = dev_iommu_ops(
> +		list_first_entry(&group->devices, struct group_device, list)
> +			->dev);

How about consolidating above into a single helper?

--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1787,6 +1787,21 @@ __iommu_group_alloc_default_domain(struct 
iommu_group *group, int req_type)
  	return __iommu_group_domain_alloc(group, req_type);
  }

+/*
+ * Returns the iommu_ops for the devices in an iommu group.
+ *
+ * It is assumed that all devices in an iommu group are managed by a single
+ * IOMMU unit. Therefore, this returns the dev_iommu_ops of the first 
device
+ * in the group.
+ */
+static const struct iommu_ops *group_iommu_ops(struct iommu_group *group)
+{
+	struct group_device *device;
+
+	device = list_first_entry(&group->devices, struct group_device, list);
+	return dev_iommu_ops(device->dev);
+}
+
  /*
   * req_type of 0 means "auto" which means to select a domain based on
   * iommu_def_domain_type or what the driver actually supports.
@@ -1794,10 +1809,7 @@ __iommu_group_alloc_default_domain(struct 
iommu_group *group, int req_type)
  static struct iommu_domain *
  iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
  {
-	struct device *dev =
-		list_first_entry(&group->devices, struct group_device, list)
-			->dev;
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
+	const struct iommu_ops *ops = group_iommu_ops(group);
  	struct iommu_domain *dom;

  	lockdep_assert_held(&group->mutex);
@@ -1888,9 +1900,7 @@ static int iommu_bus_notifier(struct 
notifier_block *nb,
  static int iommu_get_default_domain_type(struct iommu_group *group,
  					 int target_type)
  {
-	const struct iommu_ops *ops = dev_iommu_ops(
-		list_first_entry(&group->devices, struct group_device, list)
-			->dev);
+	const struct iommu_ops *ops = group_iommu_ops(group);
  	int best_type = target_type;
  	struct group_device *gdev;
  	struct device *last_dev;
@@ -2124,13 +2134,9 @@ static struct iommu_domain 
*__iommu_domain_alloc(const struct iommu_ops *ops,
  static struct iommu_domain *
  __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
  {
-	struct device *dev =
-		list_first_entry(&group->devices, struct group_device, list)
-			->dev;
-
  	lockdep_assert_held(&group->mutex);

-	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, type);
+	return __iommu_domain_alloc(group_iommu_ops(group), dev, type);
  }

  struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)

>   	int best_type = target_type;
>   	struct group_device *gdev;
>   	struct device *last_dev;
> +	int type;
>   
>   	lockdep_assert_held(&group->mutex);
> -
>   	for_each_group_device(group, gdev) {
> -		unsigned int type = iommu_get_def_domain_type(gdev->dev);
> -
> -		if (best_type && type && best_type != type) {
> -			if (target_type) {
> -				dev_err_ratelimited(
> -					gdev->dev,
> -					"Device cannot be in %s domain\n",
> -					iommu_domain_type_str(target_type));
> -				return -1;
> -			}
> -
> -			dev_warn(
> -				gdev->dev,
> -				"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
> -				iommu_domain_type_str(type), dev_name(last_dev),
> -				iommu_domain_type_str(best_type));
> -			return 0;
> +		type = best_type;
> +		if (ops->def_domain_type) {
> +			type = ops->def_domain_type(gdev->dev);
> +			if (best_type && type && best_type != type)
> +				goto err;
>   		}
> -		if (!best_type)
> -			best_type = type;
> +
> +		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
> +			type = IOMMU_DOMAIN_DMA;
> +			if (best_type && type && best_type != type)
> +				goto err;
> +		}
> +		best_type = type;
>   		last_dev = gdev->dev;
>   	}
>   	return best_type;
> +
> +err:
> +	if (target_type) {
> +		dev_err_ratelimited(
> +			gdev->dev,
> +			"Device cannot be in %s domain - it is forcing %s\n",
> +			iommu_domain_type_str(target_type),
> +			iommu_domain_type_str(type));
> +		return -1;
> +	}
> +
> +	dev_warn(
> +		gdev->dev,
> +		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
> +		iommu_domain_type_str(type), dev_name(last_dev),
> +		iommu_domain_type_str(best_type));
> +	return 0;

This doesn't match the commit message, where it states:

"Arrange things so that if the driver says it needs IDENTITY then
  iommu_get_default_domain_type() either fails or returns IDENTITY.
"

I saw that this change was made in the sequential patch. It is probably
better to put that here?

>   }
>   
>   static void iommu_group_do_probe_finalize(struct device *dev)

Best regards,
baolu
