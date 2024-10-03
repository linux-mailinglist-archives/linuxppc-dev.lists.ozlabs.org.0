Return-Path: <linuxppc-dev+bounces-1752-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3E898F866
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2024 23:02:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKPHy3dqdz2yP8;
	Fri,  4 Oct 2024 07:02:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727989326;
	cv=none; b=YbFsPLndq+iUfPeVJ9aXZyH8fRyJgdC0WEZ/rppGCD8ndCsASmhru8izn/Ly6+bUmRkFA0E7QHJ4Qck6rIu4SYF4Y74lOcAxDinOHoCuHgoRhmELKjNfzHMEwQl7ZZe1zCv4Ov439Zk3eSElOA44zQoGGiFhRG9nMT3YtG9RNxBDool5OOtofW4fTGFA5JIZNuniwC9n7iijtot2TcBFPoj4MLJALfEotsiPQNCNJl9HXgaWBMXA8WAycKCVZ+d3DTcD6/RlZr2AYvvrLj3625P0XLdribrnP0hWP5Medcoe2JttQMaObWmay6fjDECAitDQJ/mOsX27PKMvcreSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727989326; c=relaxed/relaxed;
	bh=D457nZIinSl2MKEqHrhSeNPEUVZM42HX7JNz+TDg5v0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EhxSCeMYun/vDLCxQKogUy+vYPuEcGzammWgWMOc4PNU8Z9icf3nn6IEwrZMSbHtdJBhRDlneSrGhDK37uIOfuzWVaJHPaEtzb/jbhhEkdxjOGtWYNVlOxM1LU67YPU4TAIcURivDC8tSarrZdSsW++e18sEGosO69nmC4h9PtB0q/zKNfqAhYYvqT9BzQdiv3S9N7xE2qRwkGfGWO8+sFYC3TxvZU3QJTLQKzMjngDOGRMy1Q6/mEJkvQ/5F8VBKnMveMTeqHgDMywsib+zHavK3IyElPxkwLn1OZkoqnTdm3fEs5VXVPb9UqmrIEvAPGSrkoYvXhfPvAz/3w8yJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKPHw4yg8z2y72
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2024 07:02:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XKPHp4GKtz9sPd;
	Thu,  3 Oct 2024 23:01:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WAgclfL1Jj8E; Thu,  3 Oct 2024 23:01:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XKPHp3F8Kz9rvV;
	Thu,  3 Oct 2024 23:01:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F3C38B77A;
	Thu,  3 Oct 2024 23:01:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id C9MyDAEoZ6Bd; Thu,  3 Oct 2024 23:01:58 +0200 (CEST)
Received: from [192.168.232.49] (PO19490.IDSI0.si.c-s.fr [192.168.232.49])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F2AF98B770;
	Thu,  3 Oct 2024 23:01:57 +0200 (CEST)
Message-ID: <9dfb5d24-f05c-4a67-b86c-7f157f633fb9@csgroup.eu>
Date: Thu, 3 Oct 2024 23:01:57 +0200
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
Subject: Re: [PATCH v2 1/2] powerpc/pseries: Do not pass an error pointer to
 of_node_put() in pSeries_reconfig_add_node()
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Moore <paul@paul-moore.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <0981dc33-95d0-4a1b-51d9-168907da99e6@web.de> <871qln8quw.fsf@linux.ibm.com>
 <a01643fd-1e4a-1183-2fa6-000465bc81f3@web.de> <87v8iz75ck.fsf@linux.ibm.com>
 <2f5a00f6-f3fb-9f00-676a-acdcbef90c6c@web.de> <87pm9377qt.fsf@linux.ibm.com>
 <afb528f2-5960-d107-c3ba-42a3356ffc65@web.de>
 <d4bcde15-b4f1-0e98-9072-3153d1bd21bc@web.de>
 <8949eefb-30d3-3c51-4f03-4a3c6f1b15dc@web.de>
 <434320e1-2a30-4362-9212-ca17cdde8b31@web.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <434320e1-2a30-4362-9212-ca17cdde8b31@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 03/10/2024 à 19:05, Markus Elfring a écrit :
>> Date: Tue, 21 Mar 2023 10:30:23 +0100
>>
>> It can be determined in the implementation of the function
>> “pSeries_reconfig_add_node” that an error code would occasionally
>> be provided by a call of a function like pseries_of_derive_parent().
>> This error indication was passed to an of_node_put() call according to
>> an attempt for exception handling so far.
> …
> 
> I was notified also about the following adjustment.
> 
> …
>   * linuxppc-dev: [resent,v2,1/2] powerpc/pseries: Do not pass an error pointer to of_node_put() in pSeries_reconfig_add_node()
>       - https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinuxppc-dev%2Fpatch%2Ff5ac19db-c7d5-9a94-aa37-9bb448fe665f%40web.de%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cab19d1c85de343f5474908dce3cd8c02%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638635719164841772%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=8b7APXbglDf13PvZ4nVh5Z92bEft2RBqU3LfKsUETOI%3D&reserved=0
>       - for: Linux PPC development
>      was: New
>      now: Changes Requested
> …
> 
> It seems that I can not see so far why this status update happened
> for any reasons.
> Will further clarifications become helpful here?

Sorry I forgot to send the email. It is the same kind of problem as the 
other series: Message IDs and/or In-Reply-To headers are messed up and 
b4 ends up applying an unrelated patch instead of applying the series as 
you can see below:

$ b4 shazam f5ac19db-c7d5-9a94-aa37-9bb448fe665f@web.de

Grabbing thread from 
lore.kernel.org/all/f5ac19db-c7d5-9a94-aa37-9bb448fe665f@web.de/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 128 messages in the thread
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
Assuming new revision: v3 ([PATCH] ipvs: Fix exception handling in two 
functions)
Assuming new revision: v4 ([PATCH] selftests: cgroup: Fix exception 
handling in test_memcg_oom_group_score_events())
Assuming new revision: v5 ([Nouveau] [PATCH] drm/nouveau: Add a jump 
label in nouveau_gem_ioctl_pushbuf())
Assuming new revision: v6 ([PATCH] mm/mempolicy: Fix exception handling 
in shared_policy_replace())
Assuming new revision: v7 ([PATCH] firmware: ti_sci: Fix exception 
handling in ti_sci_probe())
Assuming new revision: v8 ([PATCH] remoteproc: imx_dsp_rproc: Improve 
exception handling in imx_dsp_rproc_mbox_alloc())
Assuming new revision: v9 ([PATCH] spi: atmel: Improve exception 
handling in atmel_spi_configure_dma())
Assuming new revision: v10 ([cocci] [PATCH] btrfs: Fix exception 
handling in relocating_repair_kthread())
Assuming new revision: v11 ([cocci] [PATCH] ufs: Fix exception handling 
in ufs_fill_super())
Assuming new revision: v12 ([cocci] [PATCH] perf cputopo: Improve 
exception handling in build_cpu_topology())
Assuming new revision: v13 ([cocci] [PATCH] perf pmu: Improve exception 
handling in pmu_lookup())
Assuming new revision: v14 ([cocci] [PATCH] selftests/bpf: Improve 
exception handling in rbtree_add_and_remove())
Assuming new revision: v15 ([cocci] [PATCH resent] btrfs: Fix exception 
handling in relocating_repair_kthread())
Assuming new revision: v16 ([cocci] [PATCH resent] ufs: Fix exception 
handling in ufs_fill_super())
Assuming new revision: v17 ([cocci] [PATCH resent] perf cputopo: Improve 
exception handling in build_cpu_topology())
WARNING: duplicate messages found at index 1
    Subject 1: scsi: message: fusion: Return directly after input data 
validation failed in four functions
    Subject 2: powerpc/pseries: Fix exception handling in 
pSeries_reconfig_add_node()
   2 is a reply... replacing existing: powerpc/pseries: Fix exception 
handling in pSeries_reconfig_add_node()
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
    Subject 1: powerpc/4xx: Fix exception handling in 
ppc4xx_pciex_port_setup_hose()
    Subject 2: powerpc/pseries: Do not pass an error pointer to 
of_node_put() in pSeries_reconfig_add_node()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 2
    Subject 1: powerpc/4xx: Fix exception handling in 
ppc4xx_probe_pcix_bridge()
    Subject 2: powerpc/pseries: Do not pass an error pointer to 
of_node_put() in pSeries_reconfig_add_node()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 3
    Subject 1: powerpc/4xx: Fix exception handling in 
ppc4xx_probe_pci_bridge()
    Subject 2: powerpc/pseries: Do not pass an error pointer to 
of_node_put() in pSeries_reconfig_add_node()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 4
    Subject 1: powerpc/4xx: Delete unnecessary variable initialisations 
in four functions
    Subject 2: powerpc/pseries: Do not pass an error pointer to 
of_node_put() in pSeries_reconfig_add_node()
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
    Subject 1: powerpc/4xx: Fix exception handling in 
ppc4xx_pciex_port_setup_hose()
    Subject 2: IB/uverbs: Improve exception handling in create_qp()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 2
    Subject 1: powerpc/4xx: Fix exception handling in 
ppc4xx_probe_pcix_bridge()
    Subject 2: IB/uverbs: Improve exception handling in create_qp()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 3
    Subject 1: powerpc/4xx: Fix exception handling in 
ppc4xx_probe_pci_bridge()
    Subject 2: IB/uverbs: Improve exception handling in create_qp()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 4
    Subject 1: powerpc/4xx: Delete unnecessary variable initialisations 
in four functions
    Subject 2: IB/uverbs: Improve exception handling in create_qp()
   2 is not a reply... assume additional patch
Looking for additional code-review trailers on lore.kernel.org
Will use the latest revision: v17
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
   ✗ [PATCH] perf cputopo: Improve exception handling in 
build_cpu_topology()
   ---
   ✗ BADSIG: DKIM/web.de
   ✓ Signed: DKIM/inria.fr (From: Markus.Elfring@web.de)
---
Total patches: 1
---
Application de  perf cputopo: Improve exception handling in 
build_cpu_topology()


