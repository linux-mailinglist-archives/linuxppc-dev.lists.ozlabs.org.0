Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D79AD70759E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 00:48:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QM7YR5Pp0z3fDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 08:48:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=RDSSWi2c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=RDSSWi2c;
	dkim-atps=neutral
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QM7XZ1Lnpz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 08:47:23 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230517224139euoutp017c2d47e37f1d6482e683800375f99180~gD3806AQW3178231782euoutp01c;
	Wed, 17 May 2023 22:41:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230517224139euoutp017c2d47e37f1d6482e683800375f99180~gD3806AQW3178231782euoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1684363299;
	bh=NcQzwCvCpxVNULTL4p4tvs+CN1+fBl+7JbHkAnqGlTc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=RDSSWi2cMlCnOeNEyFtWVBgQA74uILaYctFynXXm8LNuNdsyHqYyqBGBH6OUybVR6
	 2/N0BmpmSu3CT/7c2rBeWsMuXWGsW4+mKhGK3gAyLC6UoFIuQ3zNfLkYEsBMJnnVch
	 Je7+AexzTYHGxEnT+s2X61XNFIpwhXt2CyqK/YIw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230517224139eucas1p13e8fac5a51a7c41f26fe5910fe858f04~gD38j9syJ2454424544eucas1p19;
	Wed, 17 May 2023 22:41:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 2C.46.42423.32855646; Wed, 17
	May 2023 23:41:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230517224138eucas1p2a52b9287f18e642ab4f497f91c9401c6~gD38AuTqB0316203162eucas1p2B;
	Wed, 17 May 2023 22:41:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230517224138eusmtrp1993107c255367809d06826cce0c7d570~gD37-jRKD2285622856eusmtrp1Y;
	Wed, 17 May 2023 22:41:38 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-cd-64655823fb28
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id EC.23.14344.22855646; Wed, 17
	May 2023 23:41:38 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230517224136eusmtip17c0187406963fb821c57c5b9ba53893b~gD358V0mM1562815628eusmtip1h;
	Wed, 17 May 2023 22:41:36 +0000 (GMT)
Message-ID: <692ff1c1-47d2-815d-9e63-05d84eed283e@samsung.com>
Date: Thu, 18 May 2023 00:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
	Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 10/25] iommu/exynos: Implement an IDENTITY domain
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Baolin
	Wang <baolin.wang@linux.alibaba.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan
	Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, Kevin Tian
	<kevin.tian@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof
	Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, Russell King
	<linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org, Matthias Brugger
	<matthias.bgg@gmail.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Michael
	Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Orson
	Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>, Robin Murphy
	<robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>, Thierry Reding
	<thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai
	<wens@csie.org>, Will Deacon <will@kernel.org>, Yong Wu
	<yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <10-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta1BUZRjuO+fs2WVt6bDi8IWVM+ugFOMiZdPXSAw0asdxuoANak7BDpyA
	uNmuZOVMEJeEzZEFU+BQiwLFTZC7uLML7UYQksvNVoQlNsCWiysgNIBbSyxHi3/P+zzP+z7v
	+818AlyczfcUxCScZOQJsjgJKSSaO1aMu7YfZSJ3W+8JkXHcTiCLuplEzZn+qL8ColVdB0AN
	OU0kMuda+ahqfhyg2bQP0OrYDA89XETIWlQD0C2HFqB0tphAWYW1fPS9rYmPMs9fI5BuZg3V
	j5t4KKftJh8NpPUB9MCyiiPV5TQc5fe0YuibVg2JshZZEhku6ACyLzl4KDX9JVRbUoijxhQD
	iXR3x0m0MjlIoLy5QoCsl5dxpJ+b4CHrWBaJ8lP/JNGX7bNrFo2aQMN2V3ROF4JWDD0YSje/
	jEZzGwhUZtHwA6X0hF6N0VfUVwA9YOrD6ZaRUkD/dceI0bVjVTy6eCqFoK+zI3y6RDuF0fWV
	WSRtNmlJ+vofr9Kq4h8Bre4KphtKk+nJhgLwjsd7Qv9IJi7mE0buGxAujO6tLQcnLko/1c7+
	gqWAWi8lcBFAag803VDxlUAoEFPlAJo1JXynIKYWAbyf7s4JCwDm3qvgPe741bYMOKEMwArW
	SHLFPIA9bBPpdImoAFhkmVofRVBecPD3eYLj3WBXwcQ63kIxsLKhD3fizRQNB1fYdR6nPODQ
	RBHmHOpOKZ+E1e1nMU6YAtBUuMuJScoPKm3K9TAXaj/MNgzwOc82eM32Le5shlTVJni3TcXn
	9t4Hh64WkBzeDKc7Gx/xz8Du82cJruEMgJfsoxhXqABMsQ4BzrUXmo0P17oFaxHPw6saX44O
	gjUrHbiThpQrHLS5cUu4wtzmvEe0CGZ+JebcOyDbWfNfrL63H1cBCbvhXdgN97MbzmH/z70E
	iErgwSQp4qMYhV8Cc0qqkMUrkhKipBGJ8fVg7c90OzoftIDvpuelBoAJgAFAAS5xFwWfi4gU
	iyJln33OyBPD5ElxjMIAtgoIiYfI57WuCDEVJTvJxDLMCUb+WMUELp4pmCooozGU3foKXPLo
	tPuOuDV5hR5M/Cjj7cKCN08ne33olqqKkZW84S3UPKGLrf5pZ4dnhvGwaYbyriG2hxPPxQUc
	k9eZ6UPF2dVHRsJiZwK9fY/+vBpSP5o9d9u4/9h0F8/9uCMosI3tbm059+wo+FimFORk+OQ+
	nXj7wj6z5PDp1wXNob1/R2vLSwmJa8TymS1Fw9Z3VQ77pOjGtoDhSTlv6cCLs+O17MXE3vCy
	+7G9NnyP/ouvl+BefX+xf9/72NI/Pgcqg9+S16UqXTLvCOoKina3q0t/8LS3s0cO5Vt2lmL6
	uZzfNj21I+ympSwv28JYpJap8uSF0FuOUwshx7UDEkIRLfN7AZcrZP8CfV4kW6IEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xbdRTH87v39rYlstzxCFfcnNaAj2hpgcIBAeeIepVkOsIfBp2zo9ey
	DChpwceyKK8lUBkbBTYoWBjQzbEJlQJjrOVRJ4OJg8mssBXGAIHKeC04ViFgC5rw3+c8vud7
	cnJ4uEc16cs7kpLGKlOkSQLSjfhl/cbIa4IPWZlIU+YPtyZWCRjTtZDQkhsBv12kYcPcjcBY
	2EyCTTPNhUtLEwgWsj+BjfFZDvyzDDBdWY/gzroJQY62moC8cgMX9HPNXMgtukKAedZJjRNW
	DhR2/MqFwezbCB6NbeBw+lw2DqX97RgUt7eRkLesJcFSYkawurLOgaycIDDUlOPQlGEhwfzn
	BAmOmSECzi6WI5g+9wSHrsVJDkyP55FQmjVFQub1BWdLm46Ae6s7oMAcCw5LPwY5Ngnc1xgJ
	uDDWxt0rZCa7dBhzWXcZMYPW2zjTOlKLmL+Hb2GMYfwSh6m2ZxDMVe0Il6kx2TGmsS6PZGxW
	E8lcfRDGnK7uRIyu9wBjrP2GmTGWoQ984oURSkV6GvtcokKVFin4SAyBQnEYCAODw4TioNCD
	4YESQUBUhIxNOvI5qwyI+lSYOGD4HqWeEX5pWujBMpDBT434PJoKpvvmniAXe1B6RBev7djK
	76J7z2RwttiTXrOqSTVyc/YsIHr2xk3MVXCnoujKMTvXxQTlRw+NLhFb+Z10b9nkJntTLN2r
	H9pkT4qhhxzaTcYpH/ruZCXmGupFaZ6iH1X1c10BTtkR3VCU/Z9dKaI7Zgo2LUhKTKvnXHvw
	eXzqLfqUZZC7NSqEVjer0Rbvoa/MVeCnkYd22ybabY7abRLtNkkVIuqQF5uuSpYnqwKFKmmy
	Kj1FLkxQJDci57O2dDuaWtHFv5aEFoTxkAXRPFzg5X6gIEHm4S6TfnWMVSoOKdOTWJUFSZzn
	KMR9vRMUzm9PSTskDhFJxMEhYSJJWEiQwMf93dRcqQcll6axR1k2lVX+r8N4fN8MLMbBfeG7
	IdtMtyDaZypogl+fu3OqqGCgRB75mLbvq1qPON76vGOt9o38xPMDK2PCE/hwys+qe6MsX/9H
	aFZ8S6Y9Uee9Hx+OUzR1zEc2sxrPhH7T8WulJ+c15frOaDKGiO1cmZf1Le+eajwffnRB/eLd
	XZLVEa7R+rIdroda0SnRj0JBe2V8uN/+H+pzR0U9++SKBzVZNiWn55l4TcvDikFbAK2RtB+8
	050eJ/ti8Zh/7HufVSx9u+fZGP/8x1V1ysMnL7wjmvnp9RM3TW8OTF/DG+Tms11sjKHAuKjP
	f6kk8PDX7yt6zbv3ZhY3uH38dN+rD38vjLbIO5PuVxS8HYeNCwhVolT8Cq5USf8F8R6m+zUE
	AAA=
X-CMS-MailID: 20230517224138eucas1p2a52b9287f18e642ab4f497f91c9401c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230516000116eucas1p2afa079038cb38a53400b940cf84cd34d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230516000116eucas1p2afa079038cb38a53400b940cf84cd34d
References: <CGME20230516000116eucas1p2afa079038cb38a53400b940cf84cd34d@eucas1p2.samsung.com>
	<10-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
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
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16.05.2023 02:00, Jason Gunthorpe wrote:
> What exynos calls exynos_iommu_detach_device is actually putting the iommu
> into identity mode.
>
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Marek Szyprowski

> ---
>   drivers/iommu/exynos-iommu.c | 66 +++++++++++++++++-------------------
>   1 file changed, 32 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index c275fe71c4db32..5e12b85dfe8705 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -24,6 +24,7 @@
>   
>   typedef u32 sysmmu_iova_t;
>   typedef u32 sysmmu_pte_t;
> +static struct iommu_domain exynos_identity_domain;
>   
>   /* We do not consider super section mapping (16MB) */
>   #define SECT_ORDER 20
> @@ -829,7 +830,7 @@ static int __maybe_unused exynos_sysmmu_suspend(struct device *dev)
>   		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
>   
>   		mutex_lock(&owner->rpm_lock);
> -		if (data->domain) {
> +		if (&data->domain->domain != &exynos_identity_domain) {
>   			dev_dbg(data->sysmmu, "saving state\n");
>   			__sysmmu_disable(data);
>   		}
> @@ -847,7 +848,7 @@ static int __maybe_unused exynos_sysmmu_resume(struct device *dev)
>   		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
>   
>   		mutex_lock(&owner->rpm_lock);
> -		if (data->domain) {
> +		if (&data->domain->domain != &exynos_identity_domain) {
>   			dev_dbg(data->sysmmu, "restoring state\n");
>   			__sysmmu_enable(data);
>   		}
> @@ -980,17 +981,20 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
>   	kfree(domain);
>   }
>   
> -static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
> -				    struct device *dev)
> +static int exynos_iommu_identity_attach(struct iommu_domain *identity_domain,
> +					struct device *dev)
>   {
> -	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
>   	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
> -	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
> +	struct exynos_iommu_domain *domain;
> +	phys_addr_t pagetable;
>   	struct sysmmu_drvdata *data, *next;
>   	unsigned long flags;
>   
> -	if (!has_sysmmu(dev) || owner->domain != iommu_domain)
> -		return;
> +	if (owner->domain == identity_domain)
> +		return 0;
> +
> +	domain = to_exynos_domain(owner->domain);
> +	pagetable = virt_to_phys(domain->pgtable);
>   
>   	mutex_lock(&owner->rpm_lock);
>   
> @@ -1009,15 +1013,25 @@ static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
>   		list_del_init(&data->domain_node);
>   		spin_unlock(&data->lock);
>   	}
> -	owner->domain = NULL;
> +	owner->domain = identity_domain;
>   	spin_unlock_irqrestore(&domain->lock, flags);
>   
>   	mutex_unlock(&owner->rpm_lock);
>   
> -	dev_dbg(dev, "%s: Detached IOMMU with pgtable %pa\n", __func__,
> -		&pagetable);
> +	dev_dbg(dev, "%s: Restored IOMMU to IDENTITY from pgtable %pa\n",
> +		__func__, &pagetable);
> +	return 0;
>   }
>   
> +static struct iommu_domain_ops exynos_identity_ops = {
> +	.attach_dev = exynos_iommu_identity_attach,
> +};
> +
> +static struct iommu_domain exynos_identity_domain = {
> +	.type = IOMMU_DOMAIN_IDENTITY,
> +	.ops = &exynos_identity_ops,
> +};
> +
>   static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
>   				   struct device *dev)
>   {
> @@ -1026,12 +1040,11 @@ static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
>   	struct sysmmu_drvdata *data;
>   	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
>   	unsigned long flags;
> +	int err;
>   
> -	if (!has_sysmmu(dev))
> -		return -ENODEV;
> -
> -	if (owner->domain)
> -		exynos_iommu_detach_device(owner->domain, dev);
> +	err = exynos_iommu_identity_attach(&exynos_identity_domain, dev);
> +	if (err)
> +		return err;
>   
>   	mutex_lock(&owner->rpm_lock);
>   
> @@ -1407,26 +1420,12 @@ static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
>   	return &data->iommu;
>   }
>   
> -static void exynos_iommu_set_platform_dma(struct device *dev)
> -{
> -	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
> -
> -	if (owner->domain) {
> -		struct iommu_group *group = iommu_group_get(dev);
> -
> -		if (group) {
> -			exynos_iommu_detach_device(owner->domain, dev);
> -			iommu_group_put(group);
> -		}
> -	}
> -}
> -
>   static void exynos_iommu_release_device(struct device *dev)
>   {
>   	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
>   	struct sysmmu_drvdata *data;
>   
> -	exynos_iommu_set_platform_dma(dev);
> +	WARN_ON(exynos_iommu_identity_attach(&exynos_identity_domain, dev));
>   
>   	list_for_each_entry(data, &owner->controllers, owner_node)
>   		device_link_del(data->link);
> @@ -1457,6 +1456,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
>   
>   		INIT_LIST_HEAD(&owner->controllers);
>   		mutex_init(&owner->rpm_lock);
> +		owner->domain = &exynos_identity_domain;
>   		dev_iommu_priv_set(dev, owner);
>   	}
>   
> @@ -1471,11 +1471,9 @@ static int exynos_iommu_of_xlate(struct device *dev,
>   }
>   
>   static const struct iommu_ops exynos_iommu_ops = {
> +	.identity_domain = &exynos_identity_domain,
>   	.domain_alloc = exynos_iommu_domain_alloc,
>   	.device_group = generic_device_group,
> -#ifdef CONFIG_ARM
> -	.set_platform_dma_ops = exynos_iommu_set_platform_dma,
> -#endif
>   	.probe_device = exynos_iommu_probe_device,
>   	.release_device = exynos_iommu_release_device,
>   	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

