Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC5624780
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 07:19:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457PFZ6df2zDqGg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 15:19:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=newverein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457P9G6myHzDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 15:15:30 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 71C1968B05; Tue, 21 May 2019 07:15:07 +0200 (CEST)
Date: Tue, 21 May 2019 07:15:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH 11/12] powerpc/pseries/svm: Force SWIOTLB for secure guests
Message-ID: <20190521051507.GD29120@lst.de>
References: <20190521044912.1375-1-bauerman@linux.ibm.com>
 <20190521044912.1375-12-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521044912.1375-12-bauerman@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> diff --git a/arch/powerpc/include/asm/mem_encrypt.h b/arch/powerpc/include/asm/mem_encrypt.h
> new file mode 100644
> index 000000000000..45d5e4d0e6e0
> --- /dev/null
> +++ b/arch/powerpc/include/asm/mem_encrypt.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * SVM helper functions
> + *
> + * Copyright 2019 IBM Corporation
> + */
> +
> +#ifndef _ASM_POWERPC_MEM_ENCRYPT_H
> +#define _ASM_POWERPC_MEM_ENCRYPT_H
> +
> +#define sme_me_mask	0ULL
> +
> +static inline bool sme_active(void) { return false; }
> +static inline bool sev_active(void) { return false; }
> +
> +int set_memory_encrypted(unsigned long addr, int numpages);
> +int set_memory_decrypted(unsigned long addr, int numpages);
> +
> +#endif /* _ASM_POWERPC_MEM_ENCRYPT_H */

S/390 seems to be adding a stub header just like this.  Can you please
clean up the Kconfig and generic headers bits for memory encryption so
that we don't need all this boilerplate code?

>  config PPC_SVM
>  	bool "Secure virtual machine (SVM) support for POWER"
>  	depends on PPC_PSERIES
> +	select SWIOTLB
> +	select ARCH_HAS_MEM_ENCRYPT
>  	default n

n is the default default, no need to explictly specify it.
