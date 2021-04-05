Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFECA35452E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 18:32:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDbmj6y59z3bv1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 02:32:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=tDA3jodw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=tDA3jodw; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDbmC6gxtz2yRG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 02:32:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=WlZlrre6xzixEo2giGUl6pFbTjNx7pniG1L/BRwxIwU=; b=tDA3jodwCZQinL1j+mqzmDIbMI
 5x9ANZXMUUVi7C+9PvXqBExh+5JA5lXzeFMV3qWB/f+e1Hr51A3Y4LJ7GR4c2ydyce3q2z8siPx7X
 7ytVHJajPFoNofR1z7SAxarTPpdtMVxwA1xbH9ln5e953zaaalkGsPXW0lvBPe8dVLbbuz8NfsJ4L
 fOBu5fjjaLIn//r9LFSgMjg4PBUt3+KhLPUDij3prUeeFUS8Z7mm10RG4LpIwTof6d0cbaq6WOxrj
 weRUDDc3tx360RWB9BvDsjkbWc/EcQycrIqf9TKhspUCRtTEmKW/EP5xuWzsR63VcddqMXedVMj9X
 lyEvvBCA==;
Received: from [2601:1c0:6280:3f0::e0e1]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lTS8c-00Bc7S-Uq; Mon, 05 Apr 2021 16:31:50 +0000
Subject: Re: [PATCH v2] powerpc: iommu: fix build when neither PCI or IBMVIO
 is set
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org
References: <20210404192623.10697-1-rdunlap@infradead.org>
 <135d33bc-5520-d49b-dd1c-582c7d8e3bac@csgroup.eu>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dbe0b77b-df0b-8477-cc78-3e0c392680e8@infradead.org>
Date: Mon, 5 Apr 2021 09:31:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <135d33bc-5520-d49b-dd1c-582c7d8e3bac@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>,
 Anton Blanchard <anton@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/5/21 2:04 AM, Christophe Leroy wrote:
> 
> 
> Le 04/04/2021 à 21:26, Randy Dunlap a écrit :
>> When neither CONFIG_PCI nor CONFIG_IBMVIO is set/enabled, iommu.c has a
>> build error. The fault injection code is not useful in that kernel config,
>> so make the FAIL_IOMMU option depend on PCI || IBMVIO.
>>
>> Prevents this build error (warning escalated to error):
>> ../arch/powerpc/kernel/iommu.c:178:30: error: 'fail_iommu_bus_notifier' defined but not used [-Werror=unused-variable]
>>    178 | static struct notifier_block fail_iommu_bus_notifier = {
>>
>> Fixes: d6b9a81b2a45 ("powerpc: IOMMU fault injection")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: Anton Blanchard <anton@samba.org>
>> ---
>> I was supposed to update this about one month ago, but then I lost
>> some email and also took a break for a few weeks, then I remembered,
>> so here it is.
>>
>>   arch/powerpc/Kconfig.debug |    1 +
>>   1 file changed, 1 insertion(+)
> 
> Wouldn't it be cleaner to get rid of those two horid #ifdefs ?
> Of course we can do both.

Sure, that works. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 216871414434..d691afa8acf8 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -180,12 +180,10 @@ static struct notifier_block fail_iommu_bus_notifier = {
> 
>  static int __init fail_iommu_setup(void)
>  {
> -#ifdef CONFIG_PCI
> -    bus_register_notifier(&pci_bus_type, &fail_iommu_bus_notifier);
> -#endif
> -#ifdef CONFIG_IBMVIO
> -    bus_register_notifier(&vio_bus_type, &fail_iommu_bus_notifier);
> -#endif
> +    if (IS_ENABLED(CONFIG_PCI))
> +        bus_register_notifier(&pci_bus_type, &fail_iommu_bus_notifier);
> +    if (IS_ENABLED(CONFIG_IBMVIO))
> +        bus_register_notifier(&vio_bus_type, &fail_iommu_bus_notifier);
> 
>      return 0;
>  }
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 86c799c97b77..361f4f255911 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -964,6 +964,8 @@ enum {
>  #define PCI_IRQ_MSIX        (1 << 2) /* Allow MSI-X interrupts */
>  #define PCI_IRQ_AFFINITY    (1 << 3) /* Auto-assign affinity */
> 
> +extern struct bus_type pci_bus_type;
> +
>  /* These external functions are only available when PCI support is enabled */
>  #ifdef CONFIG_PCI
> 
> @@ -986,8 +988,6 @@ enum pcie_bus_config_types {
> 
>  extern enum pcie_bus_config_types pcie_bus_config;
> 
> -extern struct bus_type pci_bus_type;
> -
>  /* Do NOT directly access these two variables, unless you are arch-specific PCI
>   * code, or PCI core code. */
>  extern struct list_head pci_root_buses;    /* List of all known PCI buses */


-- 
~Randy

