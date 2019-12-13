Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 899ED11E1DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 11:22:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Z6DF6j6RzDrFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 21:22:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Z69m6t0YzDr5Y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 21:20:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Ldm6482B"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Z69l4rbPz9sPK;
 Fri, 13 Dec 2019 21:20:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576232412;
 bh=REJuXt88eUWhnfsGMe4pLpIzeN5S9e3uhWZYEtXkwrI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ldm6482BTx3SHZWoAMGzF+5hb/9eCob/VDT3wAtV3rEi1036dEKo3gCcHkeOt1uCQ
 JJqDU9IG5oCsGMAZu8F+qkJ9mi61vxjM4jjxSq76cTvNyl8UJl0bcSsBfvl3+ekLFh
 5VTcvCPWSW6jRg1P03A0GPiDBRKhPl98OccskLm5MH/Hmwvfvpl3oGTjghN7gx9tjn
 2piUXudvRdaDXEfaA3WMkn7QVX2QZ7Vt5xeXTdkXu7HiSpeu0Dw4QzhM8+mMFan4ZW
 5jzHMQk5k2W16RhTewO/ZWkpCMzNnl1/ws3gKkCOQ7mx5xjOdSZznR3S4WOv8c+xBD
 pwNbPcRf9jdOA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel 3/3] powerpc/pseries/iommu: Do not use
 H_PUT_TCE_INDIRECT in secure VM
In-Reply-To: <20191213084537.27306-4-aik@ozlabs.ru>
References: <20191213084537.27306-1-aik@ozlabs.ru>
 <20191213084537.27306-4-aik@ozlabs.ru>
Date: Fri, 13 Dec 2019 21:20:10 +1100
Message-ID: <87v9qko7c5.fsf@mpe.ellerman.id.au>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Ram Pai <linuxram@us.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> H_PUT_TCE_INDIRECT uses a 4K page with TCEs to allow handling up to 512
> TCEs per hypercall. While it is a decent optimization, we rather share
> less of secure VM memory so let's avoid sharing.
>
> This only allows H_PUT_TCE_INDIRECT for normal (not secure) VMs.
>
> This keeps using H_STUFF_TCE as it does not require sharing.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>
> Possible alternatives are:
>
> 1. define FW_FEATURE_STUFFTCE (to allow H_STUFF_TCE) in addition to
> FW_FEATURE_MULTITCE (make it only enable H_PUT_TCE_INDIRECT) and enable
> only FW_FEATURE_STUFFTCE for SVM; pro = no SVM mention in iommu.c,
> con = a FW feature bit with very limited use

Yes let's do that please.

Actually let's rename FW_FEATURE_MULTITCE to FW_FEATURE_PUT_TCE_IND (?)
to make it clear that's what it controls now.

You should just be able to add two entries to hypertas_fw_features_table
that both look for "hcall-multi-tce". And then the SVM code disables the
PUT_TCE_IND feature at some point.

cheers

>
> 2. disable FW_FEATURE_MULTITCE and loose H_STUFF_TCE which adds a delay
> in booting process
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index f6e9b87c82fc..2334a67c7614 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -192,7 +192,8 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>  	int ret = 0;
>  	unsigned long flags;
>  
> -	if ((npages == 1) || !firmware_has_feature(FW_FEATURE_MULTITCE)) {
> +	if ((npages == 1) || !firmware_has_feature(FW_FEATURE_MULTITCE) ||
> +			is_secure_guest()) {
>  		return tce_build_pSeriesLP(tbl->it_index, tcenum,
>  					   tbl->it_page_shift, npages, uaddr,
>  		                           direction, attrs);
> @@ -402,7 +403,8 @@ static int tce_setrange_multi_pSeriesLP(unsigned long start_pfn,
>  	u64 rc = 0;
>  	long l, limit;
>  
> -	if (!firmware_has_feature(FW_FEATURE_MULTITCE)) {
> +	if (!firmware_has_feature(FW_FEATURE_MULTITCE) ||
> +			is_secure_guest()) {
>  		unsigned long tceshift = be32_to_cpu(maprange->tce_shift);
>  		unsigned long dmastart = (start_pfn << PAGE_SHIFT) +
>  				be64_to_cpu(maprange->dma_base);
> -- 
> 2.17.1
