Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FCA83C746
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 16:51:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HEeG5r3E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLQKS372Tz3cXr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 02:51:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HEeG5r3E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::730; helo=mail-qk1-x730.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLQJc3GnQz3cQg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 02:50:22 +1100 (AEDT)
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7831362c9bcso455450785a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 07:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1706197819; x=1706802619; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=58NyEZxlKioQHJ5VpckWrYBK4rieOl/YNYhuqxJjrTQ=;
        b=HEeG5r3Ee99chExbvnp2n567nnGAS04jbGnhgutOuhH3V29H5Nkg528eUncBQZ+c9y
         XgnTyjHRbvc4S4tHcUK7xms68RT5/kCDZ/uRnwXJwu41+qrz6DF11Di4nc96QPW8MRuO
         8rxXZ8gCPiNfwE9q8Awwx5BbxRgacJ5K+u7i9ILJgsNENu6K58FUSU9xCPOGnscToa3y
         kvO+4WMPvdGQM6I9T/aQSTiGm4QIP5tMIGFZelYfN3Tv1+0dUofBvbCCJMowZhpMmAJb
         tlZhEH7+38JxzC5rYnJNt4HHJEeOHWK7e9Och0Hl8z8pw3iVX5YFXw51RqkKUxXxJqTV
         sBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706197819; x=1706802619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58NyEZxlKioQHJ5VpckWrYBK4rieOl/YNYhuqxJjrTQ=;
        b=qtz3QrFoFiE3kWFxPS5N71IeYH6WbXerGq+Vad0R0jcSJ5WpcnDfVqhvu2XwV8o9D6
         CHZs4sTSKHn6QlFkuUrk+ptCp91gK5XG/Et9uxLK0qVq3hFFxWd4Wr8IDYNOCJ0Y399w
         5ZPMp2xiKPV/SdCNhIFiv3MuudlqkFdo8OwZNgBNNvgb8HSvQnOdZshOku8aU2R0imc9
         wobP/1hAiAQ+XVd9TZKZqTUpVnUsfe3JXLaDvAVINW5qI9vDWNetXV5+69soQsPPIKvK
         jwj4HEZ7Kui0/HJInwlBLiZMQ9HhYyIsE6yY/1Dk/1k6stt66DPNg7ecF2T75mplAkVq
         ax8Q==
X-Gm-Message-State: AOJu0Yzr8CBqylFrZwMlrqPlydNjVsnow40R4io/uViZHLIqxLe6GOPY
	9UjTJpjF5BpvfO6OVNkYu9al3KH8hDph4OVFBFC7QKpDTG/AR31o5V/KHjJZpns=
X-Google-Smtp-Source: AGHT+IFLwvlLixMEJ8F1pWJryesPKscOkN+uPtiDwB9PKXC0aC3fby4A8RdctwHTaEij+xMpjf5IVw==
X-Received: by 2002:a05:6214:1c0c:b0:681:9a5e:c49f with SMTP id u12-20020a0562141c0c00b006819a5ec49fmr1240542qvc.118.1706197819189;
        Thu, 25 Jan 2024 07:50:19 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id dk13-20020a056214092d00b006852ff71ac2sm5578899qvb.30.2024.01.25.07.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 07:50:18 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rT1zd-0091pp-BV;
	Thu, 25 Jan 2024 11:50:17 -0400
Date: Thu, 25 Jan 2024 11:50:17 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc: iommu: Bring back table group
 release_ownership() call
Message-ID: <20240125155017.GW50608@ziepe.ca>
References: <170618450592.3805.8216395093813382208.stgit@ltcd48-lp2.aus.stglab.ibm.com>
 <170618451433.3805.9015493852395837391.stgit@ltcd48-lp2.aus.stglab.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170618451433.3805.9015493852395837391.stgit@ltcd48-lp2.aus.stglab.ibm.com>
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
Cc: jroedel@suse.de, gbatra@linux.vnet.ibm.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, tpearson@raptorengineering.com, iommu@lists.linux.dev, npiggin@gmail.com, bgray@linux.ibm.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 25, 2024 at 06:08:39AM -0600, Shivaprasad G Bhat wrote:
> The commit 2ad56efa80db ("powerpc/iommu: Setup a default domain and
> remove set_platform_dma_ops") refactored the code removing the
> set_platform_dma_ops(). It missed out the table group
> release_ownership() call which would have got called otherwise
> during the guest shutdown via vfio_group_detach_container(). On
> PPC64, this particular call actually sets up the 32-bit TCE table,
> and enables the 64-bit DMA bypass etc. Now after guest shutdown,
> the subsequent host driver (e.g megaraid-sas) probe post unbind
> from vfio-pci fails like,
> 
> megaraid_sas 0031:01:00.0: Warning: IOMMU dma not supported: mask 0x7fffffffffffffff, table unavailable
> megaraid_sas 0031:01:00.0: Warning: IOMMU dma not supported: mask 0xffffffff, table unavailable
> megaraid_sas 0031:01:00.0: Failed to set DMA mask
> megaraid_sas 0031:01:00.0: Failed from megasas_init_fw 6539
> 
> The patch brings back the call to table_group release_ownership()
> call when switching back to PLATFORM domain.
> 
> Fixes: 2ad56efa80db ("powerpc/iommu: Setup a default domain and remove set_platform_dma_ops")
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
>  arch/powerpc/kernel/iommu.c |   16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index ebe259bdd462..ac7df43fa7ef 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -1296,9 +1296,19 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
>  	if (!grp)
>  		return -ENODEV;
>  
> -	table_group = iommu_group_get_iommudata(grp);
> -	ret = table_group->ops->take_ownership(table_group);
> -	iommu_group_put(grp);
> +	if (platform_domain->type == IOMMU_DOMAIN_PLATFORM) {
> +		ret = 0;
> +		table_group = iommu_group_get_iommudata(grp);
> +		/*
> +		 * The domain being set to PLATFORM from earlier
> +		 * BLOCKED. The table_group ownership has to be released.
> +		 */
> +		table_group->ops->release_ownership(table_group);
> +	} else if (platform_domain->type == IOMMU_DOMAIN_BLOCKED) {
> +		table_group = iommu_group_get_iommudata(grp);
> +		ret = table_group->ops->take_ownership(table_group);
> +		iommu_group_put(grp);
> +	}

Sure, but please split the function, don't test on the
platform->domain_type.

Also, is there any chance someone can work on actually fixing this to
be a proper iommu driver? I think that will become important for power
to use the common dma_iommu code in the next year...

Sort of like this:

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index ebe259bdd46298..0d6a7fea2bd9a5 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1287,20 +1287,20 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_group *grp = iommu_group_get(dev);
 	struct iommu_table_group *table_group;
-	int ret = -EINVAL;
 
 	/* At first attach the ownership is already set */
 	if (!domain)
 		return 0;
 
-	if (!grp)
-		return -ENODEV;
-
 	table_group = iommu_group_get_iommudata(grp);
-	ret = table_group->ops->take_ownership(table_group);
+	/*
+	 * The domain being set to PLATFORM from earlier
+	 * BLOCKED. The table_group ownership has to be released.
+	 */
+	table_group->ops->release_ownership(table_group);
 	iommu_group_put(grp);
 
-	return ret;
+	return 0
 }
 
 static const struct iommu_domain_ops spapr_tce_platform_domain_ops = {
@@ -1312,13 +1312,33 @@ static struct iommu_domain spapr_tce_platform_domain = {
 	.ops = &spapr_tce_platform_domain_ops,
 };
 
-static struct iommu_domain spapr_tce_blocked_domain = {
-	.type = IOMMU_DOMAIN_BLOCKED,
+static int
+spapr_tce_platform_iommu_blocked_dev(struct iommu_domain *platform_domain,
+				     struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct iommu_group *grp = iommu_group_get(dev);
+	struct iommu_table_group *table_group;
+	int ret = -EINVAL;
+
 	/*
 	 * FIXME: SPAPR mixes blocked and platform behaviors, the blocked domain
 	 * also sets the dma_api ops
 	 */
-	.ops = &spapr_tce_platform_domain_ops,
+	table_group = iommu_group_get_iommudata(grp);
+	ret = table_group->ops->take_ownership(table_group);
+	iommu_group_put(grp);
+
+	return ret;
+}
+
+static const struct iommu_domain_ops spapr_tce_blocked_domain_ops = {
+	.attach_dev = spapr_tce_blocked_iommu_attach_dev,
+};
+
+static struct iommu_domain spapr_tce_blocked_domain = {
+	.type = IOMMU_DOMAIN_BLOCKED,
+	.ops = &spapr_tce_blocked_domain_ops,
 };
 
 static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
