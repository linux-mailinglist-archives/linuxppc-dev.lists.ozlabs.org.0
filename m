Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A21686FFEFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 04:35:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHXv03zdtz3fSJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 12:35:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XG5MpC2Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHXt73J6Wz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 12:35:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XG5MpC2Y;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QHXt2620vz4x1R;
	Fri, 12 May 2023 12:35:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1683858906;
	bh=EkKpO2Lf6XrmEbhTcVWXc5G/4/3y6AtGBsRmT41WPgs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XG5MpC2YQuMorlJv0koV3gEbpnZDr/eEZ+aASkeVvD1ksGiOpIjPHWO9vxrD4sMZj
	 Zkvh2pZLC/b0+5CfrS8D6sPmAbm0JHxZg/J1NX4iXGSrjunq9YPRVLXSerXRf5uYMP
	 rLF8YdICIokazblkALyZ4/pPRbxtTD7or1lV7de6P1qEMa3zLk08RYe9tN6w6OSpXX
	 Nzn+9fbf3KbxlIIg+jKpslnOeZWXbKHY3vEReh2W855Y1iw+RC9KucKb8dEX5iAqbd
	 6KwSh8ytVi0oMeFcmQ/BsP+vDiTuiylsUbODjOLc9yxijZgGLyevQS3T8/JFpQDc5G
	 u8EF/ohM8Zdcw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/iommu: limit number of TCEs to 512 for
 H_STUFF_TCE hcall
In-Reply-To: <20230509220549.23946-1-gbatra@linux.vnet.ibm.com>
References: <20230509220549.23946-1-gbatra@linux.vnet.ibm.com>
Date: Fri, 12 May 2023 12:35:06 +1000
Message-ID: <875y8yl1k5.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.vnet.ibm.com>, gjoyce@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
> As of now, in tce_freemulti_pSeriesLP(), there is no limit on how many TCEs
> are passed to H_STUFF_TCE hcall. PAPR is enforcing this to be limited to
> 512 TCEs.

Did you actually hit a bug here, or just noticed via code inspection?

Can you provide a Fixes: tag ?

cheers

> Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>
> Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index c74b71d4733d..1b134b1b795a 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -306,13 +306,21 @@ static void tce_free_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
>  static void tce_freemulti_pSeriesLP(struct iommu_table *tbl, long tcenum, long npages)
>  {
>  	u64 rc;
> +	long limit, rpages = npages;
  
I don't know why npages is signed, but we don't ever want limit to be
negative, so it'd be better of as unsigned long wouldn't it?

>  	if (!firmware_has_feature(FW_FEATURE_STUFF_TCE))
>  		return tce_free_pSeriesLP(tbl->it_index, tcenum,
>  					  tbl->it_page_shift, npages);
>  
> -	rc = plpar_tce_stuff((u64)tbl->it_index,
> -			     (u64)tcenum << tbl->it_page_shift, 0, npages);
> +	do {
> +		limit = min_t(long, rpages, 512);

And here'd we'd use unsigned long.

> +		rc = plpar_tce_stuff((u64)tbl->it_index,
> +			     	(u64)tcenum << tbl->it_page_shift, 0, limit);
> +
> +		rpages -= limit;
> +		tcenum += limit;
> +	} while (rpages > 0 && !rc);
>  
>  	if (rc && printk_ratelimit()) {
>  		printk("tce_freemulti_pSeriesLP: plpar_tce_stuff failed\n");
> -- 

cheers
