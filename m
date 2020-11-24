Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F2C2C3169
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 20:50:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgZPR6rjZzDqMm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:50:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgZKm67n8zDqTL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 06:47:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=kZV2I6Jj; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CgZKm4mdVz8w8R
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 06:47:08 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CgZKm4Jnrz9sVM; Wed, 25 Nov 2020 06:47:08 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=kZV2I6Jj; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CgZKj1YgGz9sVD;
 Wed, 25 Nov 2020 06:46:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=adSkpZYfbtw5YR9pzoArH9tVvt6i+Y/n0sB753TdFjg=; b=kZV2I6JjutCE/10UVbysMCNmfe
 oNed/8MXDW9X36pSmHgsgE2BInry6Y8ud5SN7gMAJJgMMTAQ4iQNMkpErjD2jtdKT4PYCHRKtVPfQ
 W2tokWkcu/wOcg9MLa+jVXfBPc09KUBNqtQ9b6vpH7hZYXSjyN2nOeuo+BqEPIsKeY0Iy6oRFu9QD
 ts3X3rxwEjpul1g8WwKFHKZy7TjzQWLPnuuxGrMrCGXhaT0NEhefRsX3FK/0gkUEJ0/m0LDACZkal
 vUaNFblcegjirOMJ+IhewtQqQDbZJAvD766mbZXllMdHD+QMe/BgUAkQVE7W0bUk9Sk9PXZs884vj
 UT/xs5Fw==;
Received: from [2601:1c0:6280:3f0::cc1f]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kheH8-0000fY-RW; Tue, 24 Nov 2020 19:46:55 +0000
Subject: Re: [PATCH 1/3] powerpc: Make NUMA depend on SMP
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20201124120547.1940635-1-mpe@ellerman.id.au>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cc56e56f-1bf8-faf3-bfcd-f67fb5d08e71@infradead.org>
Date: Tue, 24 Nov 2020 11:46:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124120547.1940635-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/24/20 4:05 AM, Michael Ellerman wrote:
> Our Kconfig allows NUMA to be enabled without SMP, but none of
> our defconfigs use that combination. This means it can easily be
> broken inadvertently by code changes, which has happened recently.
> 
> Although it's theoretically possible to have a machine with a single
> CPU and multiple memory nodes, I can't think of any real systems where
> that's the case. Even so if such a system exists, it can just run an
> SMP kernel anyway.
> 
> So to avoid the need to add extra #ifdefs and/or build breaks, make
> NUMA depend on SMP.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  arch/powerpc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e9f13fe08492..a22db3db6b96 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -660,7 +660,7 @@ config IRQ_ALL_CPUS
>  
>  config NUMA
>  	bool "NUMA support"
> -	depends on PPC64
> +	depends on PPC64 && SMP
>  	default y if SMP && PPC_PSERIES
>  
>  config NODES_SHIFT
> 


-- 
~Randy
