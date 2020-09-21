Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA35F273695
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 01:21:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwL6H2gmDzDqss
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 09:21:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwL4K4q4pzDqmj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 09:19:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=tLvKt6RB; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4BwL4K2tFPz9sSt; Tue, 22 Sep 2020 09:19:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1600730369; bh=Gh/jGMCMQmrrfp+HhoHjE8q2QWpEvx5rxPTcdpfPEt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tLvKt6RBA7E4vUVZYVD3O0hQckC/kqu0Y6WFB8O4lOYXfgvdTXK9gsmS2BD7ls6Xr
 A1w4ELvBsIAhbgPaFFbignPhVBc1+vqX+JLVk+i4hT/EJmapByfasDbtvk9ZdIRSiY
 VVBZFvHlCGQiUgyF/mZ9yP+i3k8ThJdX+sjKTRfWPcM8mzSoNZ9quQ9ynaUbGeGfwD
 zHkAT3JewA/O4SLmM/ZXDet68DJvmz2PUC/X2oxcj8Ee8mh4Y6Ut6o1RPksx6psUXi
 nbGOfz1G8iQA3tLtlpbbVNHjCbXyoRskt/SrPz3ILNA3SiwzpqzpxiLangK6IevOV/
 epbK+jzQSZ3hw==
Date: Tue, 22 Sep 2020 09:19:25 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: sathnaga@linux.vnet.ibm.com
Subject: Re: [PATCH V2] Doc: admin-guide: Add entry for kvm_cma_resv_ratio
 kernel param
Message-ID: <20200921231925.GA348814@thinks.paulus.ozlabs.org>
References: <20200921090220.14981-1-sathnaga@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921090220.14981-1-sathnaga@linux.vnet.ibm.com>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 21, 2020 at 02:32:20PM +0530, sathnaga@linux.vnet.ibm.com wrote:
> From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> 
> Add document entry for kvm_cma_resv_ratio kernel param which
> is used to alter the KVM contiguous memory allocation percentage
> for hash pagetable allocation used by hash mode PowerPC KVM guests.
> 
> Cc: linux-kernel@vger.kernel.org
> Cc: kvm-ppc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> ---
> 
> V2: 
> Addressed review comments from Randy.
> 
> V1: https://lkml.org/lkml/2020/9/16/72
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a1068742a6df..932ed45740c9 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2258,6 +2258,14 @@
>  			[KVM,ARM] Allow use of GICv4 for direct injection of
>  			LPIs.
>  
> +	kvm_cma_resv_ratio=n [PPC]
> +			Reserves given percentage from system memory area for
> +			contiguous memory allocation for KVM hash pagetable
> +			allocation.
> +			By default it reserves 5% of total system memory.

I am concerned that using the term "reserve" here could give the
impression that this memory is then not available for any other use.
It is in fact available for other uses as long as they are movable
allocations.  So this memory is available for uses such as process
anonymous memory and page cache, just not for things like kmalloc.

I'm not sure what would be a better term than "reserve", though.
Perhaps we need to add a sentence something like "The reserved memory
is available for use as process memory and page cache when it is not
being used by KVM."

Paul.
