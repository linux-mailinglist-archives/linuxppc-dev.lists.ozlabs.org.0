Return-Path: <linuxppc-dev+bounces-1747-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F37898EF72
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2024 14:42:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKBCJ6CgYz2yVP;
	Thu,  3 Oct 2024 22:42:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727959340;
	cv=none; b=lJcEuDKutWbpIwW4mQ6M5KNBtNuePzp5vMCJNrTB91SN6D99Pwl09vCkLdcHkkkS0o/AX7Jjs0BADM1NW82XKTSlkKOc7FnTFSJbx4oFmtLmb/dhOLt3AYiBUbZhAJ2LeCoih6el/+g0744l2V7RZ+Wb93u0jYmdEVwbHi7u1hk7c2LsbXwAYbeOMZYCZ/upGdGJppgvDE81mK4VXN4Typs16u9hlePVZlZ1AIEQ4NS1o8frTYvlngwTo22AAYSES7HRzYOTmA8ZYWwPovyqd2NVQfl1zqy52XzDxPMNmxLDnoDPvrgxIn/MvNN8F21OmN2dokxIan1a3qKhwaP79Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727959340; c=relaxed/relaxed;
	bh=MqCRL77Kui3HoQ7LWf3zgujsDIxLz+dHg0ibXcNrVwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bhKuKeE/igeDXx2j5OHrSPHE6+dQG9SxaflKZddm0v6B/bl2Sw4vfi3pywjEoSJUwok5JI0A/yKZWngIxn+BhxbEO77masBe1C9O2QurunsZUBsY6SfQBqGMPjaNTrdBTAdZnxR5vZwjiTvymH8ItvPPNkLUbS7rezu7Lj3trpC7bz/kLhIRSLv9bcf3bWyT8H5ar8jYPEvKzmY+bbkZnR9C8hcXjSpnfNaAexgya1WH035kcGQNj3am0uN5VYbgd6fT/DNm3FVvnpzJMkwkbjIpWQsO6Y1pRP01H4qpK4Rnx6kpRsMPhEPTnUTiDD/AW7geiZI0XOf58wj1sOYsAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKBCH0Xrmz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2024 22:42:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XKBC53lcyz9sPd;
	Thu,  3 Oct 2024 14:42:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UcCvYNjCI1ht; Thu,  3 Oct 2024 14:42:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XKBC41yX2z9rvV;
	Thu,  3 Oct 2024 14:42:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 32AFF8B779;
	Thu,  3 Oct 2024 14:42:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id T3yUggJN7IQO; Thu,  3 Oct 2024 14:42:08 +0200 (CEST)
Received: from [192.168.232.22] (PO26607.IDSI0.si.c-s.fr [192.168.232.22])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C16C08B770;
	Thu,  3 Oct 2024 14:42:07 +0200 (CEST)
Message-ID: <8edc93c8-b146-4507-8336-0709b2596cb9@csgroup.eu>
Date: Thu, 3 Oct 2024 14:42:07 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] powerpc/4xx: Fix exception handling in
 ppc4xx_pciex_port_setup_hose()
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Josh Boyer <jwboyer@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Stefan Roese <sr@denx.de>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <72a7bfe2-6051-01b0-6c51-a0f8cc0c93a5@web.de>
 <ecda8227-d89a-9c23-06b7-54f9d974af5e@web.de>
 <e68a714b-32f2-de9f-066e-99a3f51a264f@web.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <e68a714b-32f2-de9f-066e-99a3f51a264f@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 25/03/2023 à 16:36, Markus Elfring a écrit :
> Date: Thu, 16 Mar 2023 19:00:57 +0100
> 
> The label “fail” was used to jump to another pointer check despite of
> the detail in the implementation of the function “ppc4xx_pciex_port_setup_hose”
> that it was determined already that the corresponding variable contained
> a null pointer (because of a failed function call in three cases).
> 
> 1. Thus return directly after a call of the function “pcibios_alloc_controller” failed.
> 
> 2. Use more appropriate labels instead.
> 
> 3. Reorder jump targets at the end.
> 
> 4. Delete two questionable checks.
> 
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: a2d2e1ec07a80946cbe812dc8c73291cad8214b2 ("[POWERPC] 4xx: PLB to PCI Express support")
> Fixes: 80daac3f86d4f5aafc9d3e79addb90fa118244e2 ("[POWERPC] 4xx: Add endpoint support to 4xx PCIe driver")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Looks like you have messed up your patches, there is no much we can do 
it seems:

$ b4 shazam e68a714b-32f2-de9f-066e-99a3f51a264f@web.de

$ LANG= b4 --no-stdin shazam e68a714b-32f2-de9f-066e-99a3f51a264f@web.de
Grabbing thread from 
lore.kernel.org/all/e68a714b-32f2-de9f-066e-99a3f51a264f@web.de/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 123 messages in the thread
WARNING: duplicate messages found at index 1
    Subject 1: btrfs: Fix exception handling in relocating_repair_kthread()
    Subject 2: powerpc/4xx: Fix exception handling in 
ppc4xx_pciex_port_setup_hose()
   2 is not a reply... assume additional patch
Assuming new revision: v3 ([cocci] [PATCH] ufs: Fix exception handling 
in ufs_fill_super())
Assuming new revision: v4 ([cocci] [PATCH] perf cputopo: Improve 
exception handling in build_cpu_topology())
Assuming new revision: v5 ([cocci] [PATCH] perf pmu: Improve exception 
handling in pmu_lookup())
Assuming new revision: v6 ([cocci] [PATCH] selftests/bpf: Improve 
exception handling in rbtree_add_and_remove())
Assuming new revision: v7 ([cocci] [PATCH resent] btrfs: Fix exception 
handling in relocating_repair_kthread())
Assuming new revision: v8 ([cocci] [PATCH resent] ufs: Fix exception 
handling in ufs_fill_super())
Assuming new revision: v9 ([cocci] [PATCH resent] perf cputopo: Improve 
exception handling in build_cpu_topology())
WARNING: duplicate messages found at index 1
    Subject 1: scsi: message: fusion: Return directly after input data 
validation failed in four functions
    Subject 2: btrfs: Fix exception handling in relocating_repair_kthread()
   2 is a reply... replacing existing: btrfs: Fix exception handling in 
relocating_repair_kthread()
WARNING: duplicate messages found at index 2
    Subject 1: scsi: message: fusion: Delete a redundant pointer check 
in four functions
    Subject 2: powerpc/4xx: Fix exception handling in 
ppc4xx_pciex_port_setup_hose()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 3
    Subject 1: scsi: message: fusion: Delete an unnecessary variable 
initialisation in four functions
    Subject 2: powerpc/4xx: Fix exception handling in 
ppc4xx_pciex_port_setup_hose()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
    Subject 1: md/raid1: Fix exception handling in setup_conf()
    Subject 2: scsi: message: fusion: Return directly after input data 
validation failed in four functions
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 2
    Subject 1: md/raid10: Fix exception handling in setup_conf()
    Subject 2: scsi: message: fusion: Return directly after input data 
validation failed in four functions
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
    Subject 1: irqchip/gic-v4: Fix exception handling in 
its_alloc_vcpu_irqs()
    Subject 2: md/raid1: Fix exception handling in setup_conf()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 2
    Subject 1: irqchip/gic-v4: Fix exception handling in 
its_alloc_vcpu_sgis()
    Subject 2: md/raid1: Fix exception handling in setup_conf()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
    Subject 1: selinux: Improve exception handling in security_get_bools()
    Subject 2: irqchip/gic-v4: Fix exception handling in 
its_alloc_vcpu_irqs()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
    Subject 1: selinux: Adjust implementation of security_get_bools()
    Subject 2: powerpc/4xx: Fix exception handling in 
ppc4xx_pciex_port_setup_hose()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
    Subject 1: IB/uverbs: Improve exception handling in create_qp()
    Subject 2: selinux: Improve exception handling in security_get_bools()
   2 is a reply... replacing existing: selinux: Improve exception 
handling in security_get_bools()
WARNING: duplicate messages found at index 2
    Subject 1: IB/uverbs: Delete a duplicate check in create_qp()
    Subject 2: irqchip/gic-v4: Fix exception handling in 
its_alloc_vcpu_irqs()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
    Subject 1: powerpc/pseries: Fix exception handling in 
pSeries_reconfig_add_node()
    Subject 2: IB/uverbs: Improve exception handling in create_qp()
   2 is not a reply... assume additional patch
Assuming new revision: v10 ([PATCH] ipvs: Fix exception handling in two 
functions)
Assuming new revision: v11 ([PATCH] selftests: cgroup: Fix exception 
handling in test_memcg_oom_group_score_events())
Assuming new revision: v12 ([Nouveau] [PATCH] drm/nouveau: Add a jump 
label in nouveau_gem_ioctl_pushbuf())
Assuming new revision: v13 ([PATCH] mm/mempolicy: Fix exception handling 
in shared_policy_replace())
Assuming new revision: v14 ([PATCH] firmware: ti_sci: Fix exception 
handling in ti_sci_probe())
Assuming new revision: v15 ([PATCH] remoteproc: imx_dsp_rproc: Improve 
exception handling in imx_dsp_rproc_mbox_alloc())
Assuming new revision: v16 ([PATCH] spi: atmel: Improve exception 
handling in atmel_spi_configure_dma())
WARNING: duplicate messages found at index 1
    Subject 1: powerpc/pseries: Do not pass an error pointer to 
of_node_put() in pSeries_reconfig_add_node()
    Subject 2: selinux: Adjust implementation of security_get_bools()
   2 is a reply... replacing existing: selinux: Adjust implementation of 
security_get_bools()
WARNING: duplicate messages found at index 2
    Subject 1: powerpc/pseries: Fix exception handling in 
pSeries_reconfig_add_node()
    Subject 2: powerpc/4xx: Fix exception handling in 
ppc4xx_pciex_port_setup_hose()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
    Subject 1: powerpc/pseries: Do not pass an error pointer to 
of_node_put() in pSeries_reconfig_add_node()
    Subject 2: powerpc/pseries: Do not pass an error pointer to 
of_node_put() in pSeries_reconfig_add_node()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 2
    Subject 1: powerpc/pseries: Fix exception handling in 
pSeries_reconfig_add_node()
    Subject 2: powerpc/pseries: Do not pass an error pointer to 
of_node_put() in pSeries_reconfig_add_node()
   2 is not a reply... assume additional patch
Will use the latest revision: v16
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
   ✗ [PATCH] spi: atmel: Improve exception handling in 
atmel_spi_configure_dma()
   ---
   ✗ BADSIG: DKIM/web.de
   ✓ Signed: DKIM/lists.infradead.org (From: Markus.Elfring@web.de)
---
Total patches: 1
---
Applying: spi: atmel: Improve exception handling in 
atmel_spi_configure_dma()



> ---
>   arch/powerpc/platforms/4xx/pci.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx/pci.c
> index ca5dd7a5842a..7336c7039b10 100644
> --- a/arch/powerpc/platforms/4xx/pci.c
> +++ b/arch/powerpc/platforms/4xx/pci.c
> @@ -1930,7 +1930,7 @@ static void __init ppc4xx_pciex_port_setup_hose(struct ppc4xx_pciex_port *port)
>   	/* Allocate the host controller data structure */
>   	hose = pcibios_alloc_controller(port->node);
>   	if (!hose)
> -		goto fail;
> +		return;
> 
>   	/* We stick the port number in "indirect_type" so the config space
>   	 * ops can retrieve the port data structure easily
> @@ -1962,7 +1962,7 @@ static void __init ppc4xx_pciex_port_setup_hose(struct ppc4xx_pciex_port *port)
>   		if (cfg_data == NULL) {
>   			printk(KERN_ERR "%pOF: Can't map external config space !",
>   			       port->node);
> -			goto fail;
> +			goto free_controller;
>   		}
>   		hose->cfg_data = cfg_data;
>   	}
> @@ -1974,7 +1974,7 @@ static void __init ppc4xx_pciex_port_setup_hose(struct ppc4xx_pciex_port *port)
>   	if (mbase == NULL) {
>   		printk(KERN_ERR "%pOF: Can't map internal config space !",
>   		       port->node);
> -		goto fail;
> +		goto recheck_cfg_data;
>   	}
>   	hose->cfg_addr = mbase;
> 
> @@ -2007,7 +2007,7 @@ static void __init ppc4xx_pciex_port_setup_hose(struct ppc4xx_pciex_port *port)
> 
>   	/* Parse inbound mapping resources */
>   	if (ppc4xx_parse_dma_ranges(hose, mbase, &dma_window) != 0)
> -		goto fail;
> +		goto unmap_io_mbase;
> 
>   	/* Configure outbound ranges POMs */
>   	ppc4xx_configure_pciex_POMs(port, hose, mbase);
> @@ -2064,13 +2064,14 @@ static void __init ppc4xx_pciex_port_setup_hose(struct ppc4xx_pciex_port *port)
>   	}
> 
>   	return;
> - fail:
> -	if (hose)
> -		pcibios_free_controller(hose);
> +
> +unmap_io_mbase:
> +	iounmap(mbase);
> +recheck_cfg_data:
>   	if (cfg_data)
>   		iounmap(cfg_data);
> -	if (mbase)
> -		iounmap(mbase);
> +free_controller:
> +	pcibios_free_controller(hose);
>   }
> 
>   static void __init ppc4xx_probe_pciex_bridge(struct device_node *np)
> --
> 2.40.0
> 

