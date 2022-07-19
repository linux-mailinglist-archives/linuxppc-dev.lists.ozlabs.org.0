Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FBF579139
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 05:19:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ln3wC527Rz3bsP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 13:19:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=UAhbqadB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=UAhbqadB;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ln3vX1S39z3035
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 13:18:44 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id p9so13497208pjd.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 20:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9BVbVFop1MpExz8nPR0yoVMaqYjV+LHpDDLDzkkCU8g=;
        b=UAhbqadBM/QJIMG5sz78JBdA/BL/wUjyPyE5E85/ipptFRRwSKwtKhN4WIZ5aA2Ywr
         Fsdc4BIQ8tnRUxaj6wL/poEe7FJc2kAu03DxFcoRvukp3SawnfYxAoTYLdPZzY5/q/6q
         MsZYckLMnZeLYQ4aZcBgJ7GWZkun52q5tNbmvddUIT2fV33ZnzGTI9DKEGPGJCm1Lo0t
         0OCbxdIQddJS6n9AkpSb1JhvlmYsndSqj6LTnxwDzrWFE6cl66FjvhJUrW+fpi2vQMgH
         dFQEkumZhilzMHLGf487TnvS9oBD0TuTqZCip/HXcACrjG0UEAS7ex/8qh5NXiQRWwhV
         spdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9BVbVFop1MpExz8nPR0yoVMaqYjV+LHpDDLDzkkCU8g=;
        b=U47kRbrrYS6lp6oyq0RcvxiavPKyDcqZ0iZyF+ipcgaGd2735N6UXyBdA53xyCOOo6
         qio7AYIVXMHtMCdYLcGPptaxXAzWEXkCk+P85NVJSKnwUEWXl2ulmacIk7Bi/hD5/69J
         VJtgRsNwZFee73eez6lMeMC3ptP1prZqjUO8b7HRymUWgp2GE1Uy4vT8umUTwPhfiNiv
         OyrsvCKaoujA4UcWhPgoHyxjVdrMhLmFmDnDNLJJJsG1mjH1XZkuAj7R56M5bKmynkfL
         261Hcxow6HNezB22jbDf9s8sBC7HVcdgVGBHfkrllsWlH0CRUf4lW6pW2KY/smMsc+l8
         IqDQ==
X-Gm-Message-State: AJIora9uuVSycWIALZW4QYcsXMVaLKGDs2M+PlRAoBt/qI7NKB7zUHSp
	PvIdAB8mpDNOyBEU+J7zpA7qaQ==
X-Google-Smtp-Source: AGRyM1uY9pOIvUU5sZk2tegLaQel9y2LSRoNU/6A4GrRu42DlhuPCUNFDsTN/WPyANdrSXxxWLHOYg==
X-Received: by 2002:a17:902:cf12:b0:16c:a263:62b8 with SMTP id i18-20020a170902cf1200b0016ca26362b8mr20734673plg.31.1658200721009;
        Mon, 18 Jul 2022 20:18:41 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
        by smtp.gmail.com with ESMTPSA id h16-20020a170902f55000b0016c740e53bbsm10281804plf.79.2022.07.18.20.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 20:18:40 -0700 (PDT)
Message-ID: <00c41fa4-4e64-0a90-b06e-accdc662fa4d@ozlabs.ru>
Date: Tue, 19 Jul 2022 13:18:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0
Subject: Re: [PATCH kernel 3/3] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20220714081822.3717693-1-aik@ozlabs.ru>
 <20220714081822.3717693-4-aik@ozlabs.ru> <20220718180924.GE4609@nvidia.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220718180924.GE4609@nvidia.com>
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, Deming Wang <wangdeming@inspur.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 19/07/2022 04:09, Jason Gunthorpe wrote:
> On Thu, Jul 14, 2022 at 06:18:22PM +1000, Alexey Kardashevskiy wrote:
> 
>> +/*
>> + * A simple iommu_ops to allow less cruft in generic VFIO code.
>> + */
>> +static bool spapr_tce_iommu_capable(enum iommu_cap cap)
>> +{
>> +	switch (cap) {
>> +	case IOMMU_CAP_CACHE_COHERENCY:
> 
> I would add a remark here that it is because vfio is going to use
> SPAPR mode but still checks that the iommu driver support coherency -
> with out that detail it looks very strange to have caps without
> implementing unmanaged domains
> 
>> +static struct iommu_domain *spapr_tce_iommu_domain_alloc(unsigned int type)
>> +{
>> +	struct iommu_domain *dom;
>> +
>> +	if (type != IOMMU_DOMAIN_BLOCKED)
>> +		return NULL;
>> +
>> +	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
>> +	if (!dom)
>> +		return NULL;
>> +
>> +	dom->geometry.aperture_start = 0;
>> +	dom->geometry.aperture_end = ~0ULL;
>> +	dom->geometry.force_aperture = true;
> 
> A blocked domain doesn't really have an aperture, all DMA is rejected,
> so I think these can just be deleted and left at zero.
> 
> Generally I'm suggesting drivers just use a static singleton instance
> for the blocked domain instead of the allocation like this, but that
> is a very minor nit.
> 
>> +static struct iommu_device *spapr_tce_iommu_probe_device(struct device *dev)
>> +{
>> +	struct pci_dev *pdev;
>> +	struct pci_controller *hose;
>> +
>> +	/* Weirdly iommu_device_register() assigns the same ops to all buses */
>> +	if (!dev_is_pci(dev))
>> +		return ERR_PTR(-EPERM);
> 
> Less "weirdly", more by design. The iommu driver should check if the
> given struct device is supported or not, it isn't really a bus
> specific operation.
> 
>> +static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
>> +{
>> +	struct pci_controller *hose;
>> +	struct pci_dev *pdev;
>> +
>> +	/* Weirdly iommu_device_register() assigns the same ops to all buses */
>> +	if (!dev_is_pci(dev))
>> +		return ERR_PTR(-EPERM);
> 
> This doesn't need repeating, if probe_device() fails then this will
> never be called.
> 
>> +static int spapr_tce_iommu_attach_dev(struct iommu_domain *dom,
>> +				      struct device *dev)
>> +{
>> +	struct iommu_group *grp = iommu_group_get(dev);
>> +	struct iommu_table_group *table_group;
>> +	int ret = -EINVAL;
>> +
>> +	if (!grp)
>> +		return -ENODEV;
>> +
>> +	table_group = iommu_group_get_iommudata(grp);
>> +
>> +	if (dom->type == IOMMU_DOMAIN_BLOCKED)
>> +		ret = table_group->ops->take_ownership(table_group);
> 
> Ideally there shouldn't be dom->type checks like this.
> 
> 
> The blocking domain should have its own iommu_domain_ops that only
> process the blocking operation. Ie call this like
> spapr_tce_iommu_blocking_attach_dev()
> 
> Instead of having a "default_domain_ops" leave it NULL and create a
> spapr_tce_blocking_domain_ops with these two functions and assign it
> to domain->ops when creating. Then it is really clear these functions
> are only called for the DOMAIN_BLOCKED type and you don't need to
> check it.
> 
>> +static void spapr_tce_iommu_detach_dev(struct iommu_domain *dom,
>> +				       struct device *dev)
>> +{
>> +	struct iommu_group *grp = iommu_group_get(dev);
>> +	struct iommu_table_group *table_group;
>> +
>> +	table_group = iommu_group_get_iommudata(grp);
>> +	WARN_ON(dom->type != IOMMU_DOMAIN_BLOCKED);
>> +	table_group->ops->release_ownership(table_group);
>> +}
> 
> Ditto
> 
>> +struct iommu_group *pSeries_pci_device_group(struct pci_controller *hose,
>> +					     struct pci_dev *pdev)
>> +{
>> +	struct device_node *pdn, *dn = pdev->dev.of_node;
>> +	struct iommu_group *grp;
>> +	struct pci_dn *pci;
>> +
>> +	pdn = pci_dma_find(dn, NULL);
>> +	if (!pdn || !PCI_DN(pdn))
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	pci = PCI_DN(pdn);
>> +	if (!pci->table_group)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	grp = pci->table_group->group;
>> +	if (!grp)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	return iommu_group_ref_get(grp);
> 
> Not for this series, but this is kind of backwards, the driver
> specific data (ie the table_group) should be in
> iommu_group_get_iommudata()...


It is there but here we are getting from a device to a group - a device 
is not added to a group yet when iommu_probe_device() works and tries 
adding a device via iommu_group_get_for_dev().




>> diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
>> index 8a65ea61744c..3b53b466e49b 100644
>> --- a/drivers/vfio/vfio_iommu_spapr_tce.c
>> +++ b/drivers/vfio/vfio_iommu_spapr_tce.c
>> @@ -1152,8 +1152,6 @@ static void tce_iommu_release_ownership(struct tce_container *container,
>>   	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i)
>>   		if (container->tables[i])
>>   			table_group->ops->unset_window(table_group, i);
>> -
>> -	table_group->ops->release_ownership(table_group);
>>   }
>>   
>>   static long tce_iommu_take_ownership(struct tce_container *container,
>> @@ -1161,10 +1159,6 @@ static long tce_iommu_take_ownership(struct tce_container *container,
>>   {
>>   	long i, ret = 0;
>>   
>> -	ret = table_group->ops->take_ownership(table_group);
>> -	if (ret)
>> -		return ret;
>> -
>>   	/* Set all windows to the new group */
>>   	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
>>   		struct iommu_table *tbl = container->tables[i];
>> @@ -1183,8 +1177,6 @@ static long tce_iommu_take_ownership(struct tce_container *container,
>>   	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i)
>>   		table_group->ops->unset_window(table_group, i);
>>   
>> -	table_group->ops->release_ownership(table_group);
>> -
> 
> This is great, makes alot of sense.
> 
> Anyhow, it all looks fine to me as is even:
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks. I'll try now to find an interested party to test this :)


> 
> Jason

-- 
Alexey
