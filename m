Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A69920CD19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 10:02:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wKhw0VBWzDqWJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 18:02:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=samsung.com (client-ip=210.118.77.11;
 helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=s6EBXoym; 
 dkim-atps=neutral
X-Greylist: delayed 513 seconds by postgrey-1.36 at bilbo;
 Mon, 29 Jun 2020 18:00:28 AEST
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wKfh0dz7zDqTM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 18:00:26 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200629075143euoutp01f0f39ed3e9987b337606ea2cea564c5d~c9GnogEET0891208912euoutp01B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 07:51:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200629075143euoutp01f0f39ed3e9987b337606ea2cea564c5d~c9GnogEET0891208912euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593417103;
 bh=dQ9Doz3UBs0xgD6IFLX1j1JQ9wXrq3erbykFtgNQuDY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=s6EBXoymUWh9R+b1KtkNXgxwspIJxNs1VFHDgdhYWFeOHzFCRC8u46/Zm6PSfE90Y
 GVJDflUobNNHFng+q6WlyYuTXrfESnjJb0irk0vdcPQ6X3kBEjS8+QLq/0HUrfTobM
 LcGKLwYcnQ9Mz40qqpfl6izB0v8nAVKZbT4P161E=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200629075143eucas1p118ab028a0335d12e8906b9ce64d4253e~c9GnHwKVj3253332533eucas1p1t;
 Mon, 29 Jun 2020 07:51:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 91.C1.06456.F8D99FE5; Mon, 29
 Jun 2020 08:51:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200629075142eucas1p1d1cf615c77342a874310bfc853b3ed5d~c9GmlEi_T3259232592eucas1p1t;
 Mon, 29 Jun 2020 07:51:42 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200629075142eusmtrp1fb024f39aa4ea00e14ad66a0ec1cc68c~c9GmkFrfa2414324143eusmtrp17;
 Mon, 29 Jun 2020 07:51:42 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-4c-5ef99d8f1bb6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CB.6A.06314.E8D99FE5; Mon, 29
 Jun 2020 08:51:42 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200629075141eusmtip1660c2664e074b9ed3be926930118c382~c9GlPVr7z1159711597eusmtip1P;
 Mon, 29 Jun 2020 07:51:41 +0000 (GMT)
Subject: Re: [PATCH 01/13] iommu/exynos: Use dev_iommu_priv_get/set()
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <f69cc934-1fcc-c311-7bc0-22472befa796@samsung.com>
Date: Mon, 29 Jun 2020 09:51:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625130836.1916-2-joro@8bytes.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa1CMYRid97vtt7HNZ0WPywyzLjM0SbnM6zImt5nXH6N/BsXim0KF/eQ+
 SrJYK2UH2a215VKapRSbbSQt2qmUtDMrJkIxomhCinFp+0L/znPOeeY5Z+bhaXUFN5rfFL9D
 1MVrYzWcH+Oo7K0LPpnVGzXd2OaPT9RVUbg4/SaHO5MP0/jTZSPCvx3pNE6/YqKx/sxC/Pv1
 BxZb0oopbCufh3M9BQiXZVP4mKVQgU3VWRQuavGyuPPoRxZ7SjM57DpdhvCPb79YnJwyA99I
 cnHYfv+CApebvQrcW2plcHv9CwanNM3CPYUtbPgY0lphpYjdakfE431Mk5y2JIaUddsY4jQ/
 V5DivKnkwu02ihjbU1hSlH+MIyXdL1lirYogzcfdFCm+mEhMjbmIPMrIRisCVvnN3yjGbtop
 6kIWrPOL6bxvobcdDNpt0bdQSShtggEpeRBmQm2ngzMgP14t5CHIrzpIycMXBOXJhQPKZwT2
 5mzF35XUslRWFnIROHK6kTx8QnDdeYT1uYYLS6G05CTlwwHCEnjS41H4TLSQp4Bq6x3kEzgh
 FAwdBs6HVcICeJdS348ZYRK8zahlfHiEEAmpl2wDnmFQda61n1f2xbja1NJ/jBbGQUlHJi3j
 QHjWer6/BAhHlNBcUcnKuZdAdoMXyXg4vHffGOgzFmpMRkZeOITgVd1VhTwYEXiSMwY25kFT
 3fe+GHzfiSlQUBoi0wtB//A946NB8IfGjmFyCH845ThLy7QKjurVsnsymN3X/p2tqG+g05DG
 PKiaeVAd86A65v93bYjJR4FighQXLUqh8eKuaZI2TkqIj562YWtcEep77Jpf7q5b6GvDehcS
 eKQZqgp/3BOlZrU7pT1xLgQ8rQlQLaqtiVKrNmr37BV1W9fqEmJFyYXG8IwmUDUjpy1SLURr
 d4hbRHGbqPurUrxydBK6Fbbvdm3UxyzT9g32598b17zq8VpCEsUTy7AmyKC03A0OCD/zqHrm
 3NUrl77l7mb9GH8vZooeZr85UDlq/37n4tc5EY6Rc9CVUzZdr2p+cFrY2hE/nxS8GzqnXZ04
 yT2kqKv6+HJ+NnnZ+hVNfBC2MjPykvNB0GbJGTzZG7L56Z3QLg0jxWhDp9I6SfsHQHazEtQD
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+d3HHtbiNpV+WGAsemB17c5sP/OBlcGvqCiCiB7q0ouLnIvd
 KdkfukRFrcwlmU1d2ssMeznTUpc4e7DCUgfrgZmlhFGmGU1F0Zwa+N+Hc76fwzlwJKTcSftJ
 jicZeH2SOlEh8qJeT778tD6/bCx6Q9f9AHT+jYNAVtMjERrKyCLR4K1zAE3VmUhkqiokUXbR
 FjT19QeNSgqsBCpvDkWVzvsA2SoIlFvyQIwKX5URqKbXRaOhnF80cjaUipD9kg2g8ZFJGmVk
 BqFao12Eqp9dF6Nms0uMxhosFPrZ3k2hzK5gNPqgl45civtaLASutlQD7HR1kPjadyOFbe5y
 Cj8xfxJj6+0AfL3pO4HP/cykcc2dXBGud/fQ2OLYhz+ffUlg6410XPi+EuC3xRVgr88hNkyv
 SzbwyzU6wRCuOMwhJcuFIFa5MYTlglRHNyuDFYERYfF84vEUXh8YEctqhp6VkCfPrD1Vkt1L
 GEHBijwglUBmI8y35dN5wEsiZ24CaP57QTzbWAYdRUZ6lr3hhCtPNBsaAHBgeBB4Gt7MdthQ
 f4HwsA8TBd+NOsWeEMlUi2F7f+Wc8RDAP7WTM4aI4WDegGeUVCJjImB/ZvsMU8xK+K24jfKw
 L3MUurtr5zKLoeNK30xdOr3r3a7emZVIZhO0WL+Qs+wP6wdK53gJ/Nh3lSgAcvM83TxPMc9T
 zPOUckDdAT58sqBN0AocK6i1QnJSAhun09aA6YeqezFmfQw6H+63A0YCFAtlkR2j0XJanSKk
 au0ASkiFj2xr2+touSxenXqa1+ti9MmJvGAHwdPHmUg/3zjd9HsmGWK4YE6FQjhVkCpoE1Is
 keUwLUfkTILawJ/g+ZO8/r9HSKR+RnAxbFfjsYvbNNHxu9urfD+sZsMrUsZVS/vTmka0Jz7a
 XPee35CvKftc725tdQ92p6c2h6w76K98bvIuim3p2UcXb3EsWomlX7L6Dvjv0IgWRLW4OidS
 OrOVByOz7OyiU1FVO28nXN6ZMf60oOhFG8GuKvyNGtPWgtCePTEVqcOWOAUlaNRcAKkX1P8A
 S4B8M2YDAAA=
X-CMS-MailID: 20200629075142eucas1p1d1cf615c77342a874310bfc853b3ed5d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200625130845eucas1p2e7715cbd0b8ad95d5f5bc86728c3aabe
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200625130845eucas1p2e7715cbd0b8ad95d5f5bc86728c3aabe
References: <20200625130836.1916-1-joro@8bytes.org>
 <CGME20200625130845eucas1p2e7715cbd0b8ad95d5f5bc86728c3aabe@eucas1p2.samsung.com>
 <20200625130836.1916-2-joro@8bytes.org>
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
Cc: linux-ia64@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Joerg Roedel <jroedel@suse.de>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25.06.2020 15:08, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
>
> Remove the use of dev->archdata.iommu and use the private per-device
> pointer provided by IOMMU core code instead.
>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/iommu/exynos-iommu.c                  | 20 +++++++++----------
>   .../media/platform/s5p-mfc/s5p_mfc_iommu.h    |  4 +++-
>   2 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 60c8a56e4a3f..6a9b67302369 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -173,7 +173,7 @@ static u32 lv2ent_offset(sysmmu_iova_t iova)
>   #define REG_V5_FAULT_AR_VA	0x070
>   #define REG_V5_FAULT_AW_VA	0x080
>   
> -#define has_sysmmu(dev)		(dev->archdata.iommu != NULL)
> +#define has_sysmmu(dev)		(dev_iommu_priv_get(dev) != NULL)
>   
>   static struct device *dma_dev;
>   static struct kmem_cache *lv2table_kmem_cache;
> @@ -226,7 +226,7 @@ static const struct sysmmu_fault_info sysmmu_v5_faults[] = {
>   };
>   
>   /*
> - * This structure is attached to dev.archdata.iommu of the master device
> + * This structure is attached to dev->iommu->priv of the master device
>    * on device add, contains a list of SYSMMU controllers defined by device tree,
>    * which are bound to given master device. It is usually referenced by 'owner'
>    * pointer.
> @@ -670,7 +670,7 @@ static int __maybe_unused exynos_sysmmu_suspend(struct device *dev)
>   	struct device *master = data->master;
>   
>   	if (master) {
> -		struct exynos_iommu_owner *owner = master->archdata.iommu;
> +		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
>   
>   		mutex_lock(&owner->rpm_lock);
>   		if (data->domain) {
> @@ -688,7 +688,7 @@ static int __maybe_unused exynos_sysmmu_resume(struct device *dev)
>   	struct device *master = data->master;
>   
>   	if (master) {
> -		struct exynos_iommu_owner *owner = master->archdata.iommu;
> +		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
>   
>   		mutex_lock(&owner->rpm_lock);
>   		if (data->domain) {
> @@ -837,8 +837,8 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
>   static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
>   				    struct device *dev)
>   {
> -	struct exynos_iommu_owner *owner = dev->archdata.iommu;
>   	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
> +	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
>   	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
>   	struct sysmmu_drvdata *data, *next;
>   	unsigned long flags;
> @@ -875,8 +875,8 @@ static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
>   static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
>   				   struct device *dev)
>   {
> -	struct exynos_iommu_owner *owner = dev->archdata.iommu;
>   	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
> +	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
>   	struct sysmmu_drvdata *data;
>   	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
>   	unsigned long flags;
> @@ -1237,7 +1237,7 @@ static phys_addr_t exynos_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
>   
>   static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
>   {
> -	struct exynos_iommu_owner *owner = dev->archdata.iommu;
> +	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
>   	struct sysmmu_drvdata *data;
>   
>   	if (!has_sysmmu(dev))
> @@ -1263,7 +1263,7 @@ static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
>   
>   static void exynos_iommu_release_device(struct device *dev)
>   {
> -	struct exynos_iommu_owner *owner = dev->archdata.iommu;
> +	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
>   	struct sysmmu_drvdata *data;
>   
>   	if (!has_sysmmu(dev))
> @@ -1287,8 +1287,8 @@ static void exynos_iommu_release_device(struct device *dev)
>   static int exynos_iommu_of_xlate(struct device *dev,
>   				 struct of_phandle_args *spec)
>   {
> -	struct exynos_iommu_owner *owner = dev->archdata.iommu;
>   	struct platform_device *sysmmu = of_find_device_by_node(spec->np);
> +	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
>   	struct sysmmu_drvdata *data, *entry;
>   
>   	if (!sysmmu)
> @@ -1305,7 +1305,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
>   
>   		INIT_LIST_HEAD(&owner->controllers);
>   		mutex_init(&owner->rpm_lock);
> -		dev->archdata.iommu = owner;
> +		dev_iommu_priv_set(dev, owner);
>   	}
>   
>   	list_for_each_entry(entry, &owner->controllers, owner_node)
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h b/drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h
> index 152a713fff78..1a32266b7ddc 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_iommu.h
> @@ -9,9 +9,11 @@
>   
>   #if defined(CONFIG_EXYNOS_IOMMU)
>   
> +#include <linux/iommu.h>
> +
>   static inline bool exynos_is_iommu_available(struct device *dev)
>   {
> -	return dev->archdata.iommu != NULL;
> +	return dev_iommu_priv_get(dev) != NULL;
>   }
>   
>   #else

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

