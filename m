Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC661FF413
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 16:01:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nk9m6pSlzDrGx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 00:01:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.251.173; helo=1.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 1.mo69.mail-out.ovh.net (1.mo69.mail-out.ovh.net
 [178.33.251.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nk345HNFzDrFH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 23:55:11 +1000 (AEST)
Received: from player772.ha.ovh.net (unknown [10.108.42.82])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 3094996352
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 15:47:49 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id B0D6F13914407;
 Thu, 18 Jun 2020 13:47:46 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0038b232fc3-f937-4595-93c8-2403ead6b4b6,49AEAE6CE59BF51777C75B820326F476AEA2639C)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2 0/2] powerpc/pci: unmap interrupts when a PHB is removed
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20200617162938.743439-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <07a753f3-1ba2-7e8b-c545-6a9afb04507c@kaod.org>
Date: Thu, 18 Jun 2020 15:47:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617162938.743439-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8107605232250162109
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudejgedgieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/17/20 6:29 PM, Cédric Le Goater wrote:
> Hello,
> 
> When a passthrough IO adapter is removed from a pseries machine using
> hash MMU and the XIVE interrupt mode, the POWER hypervisor expects the
> guest OS to clear all page table entries related to the adapter. If
> some are still present, the RTAS call which isolates the PCI slot
> returns error 9001 "valid outstanding translations" and the removal of
> the IO adapter fails. This is because when the PHBs are scanned, Linux
> maps automatically some interrupts in the Linux interrupt number space
> but these are never removed.
> 
> To solve this problem, we introduce a PPC platform specific
> pcibios_remove_bus() routine which clears all interrupt mappings when
> the bus is removed. This also clears the associated page table entries
> of the ESB pages when using XIVE.
> 
> For this purpose, we record the logical interrupt numbers of the
> mapped interrupt under the PHB structure and let pcibios_remove_bus()
> do the clean up.
> 
> Tested on :
> 
>   - PowerNV with PCI, OpenCAPI, CAPI and GPU adapters. I don't know
>     how to inject a failure on a PHB but that would be a good test.

I found out that powering down the slot is enough :

	echo 0 > /sys/bus/pci/slots/<slot name>/power

The IRQ cleanup is done as expected on baremetal also.

Cheers,

C. 

>   - KVM P8+P9 guests with passthrough PCI adapters, but PHBs can not
>     be removed under QEMU/KVM.   
>   - PowerVM with passthrough PCI adapters (main target)
>   
> Thanks,
> 
> C.
> 
> Changes since v1:
> 
>  - extended the removal to interrupts other than the legacy INTx.
> 
> Cédric Le Goater (2):
>   powerpc/pci: unmap legacy INTx interrupts when a PHB is removed
>   powerpc/pci: unmap all interrupts when a PHB is removed
> 
>  arch/powerpc/include/asm/pci-bridge.h |   6 ++
>  arch/powerpc/kernel/pci-common.c      | 114 ++++++++++++++++++++++++++
>  2 files changed, 120 insertions(+)
> 

