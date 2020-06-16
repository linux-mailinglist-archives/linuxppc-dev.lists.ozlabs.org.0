Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D311FAFAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 13:59:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mRZS34RWzDqpd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 21:59:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mRVC3524zDqrC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 21:55:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Nr9nDUe2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49mRV74rknz9sRk;
 Tue, 16 Jun 2020 21:55:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592308544;
 bh=Oi9PLBZ1Dzj5w0ZkhfD2ZbQDPkmKbXKCavF3esG84z4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Nr9nDUe2Mvj5Zkm1EoIgokKwsANxFPCPFxJthAR5fsCxEhHgZBy6zUDutS35qYTyv
 jxffxSvxbDQT5lFyPC0zObzsd9N+x+EBa4R8uLF50m1jqlm6f0wzRHDMXghBsaGV/L
 oealeJvgAsC8y8l/bUUAbJpMU/8f11Lv7Nz2yYmJBkKsSNSaaTYg4S0Acjqf94hydA
 HgpZXeh5grTRzNrODxoMiUuImuEoQe+8/RFD0+922TPUKjEvmsuHNdeziCzkHwmM71
 D/L06eAMJDBjYo+BNzXjKchz8UpJKuvMyennIOz4F4HuEWj/oCEE0DVDdlRe6CxBBu
 XevZ9rrvWQ3EA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: wenxiong@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: powerpc/pci: [PATCH 1/1 V3] PCIE PHB reset
In-Reply-To: <1590499319-6472-1-git-send-email-wenxiong@linux.vnet.ibm.com>
References: <1590499319-6472-1-git-send-email-wenxiong@linux.vnet.ibm.com>
Date: Tue, 16 Jun 2020 21:56:10 +1000
Message-ID: <87r1ufdy1x.fsf@mpe.ellerman.id.au>
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
Cc: brking@linux.vnet.ibm.com, oohall@gmail.com,
 Wen Xiong <wenxiong@linux.vnet.ibm.com>, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

wenxiong@linux.vnet.ibm.com writes:
> From: Wen Xiong <wenxiong@linux.vnet.ibm.com>
>
> Several device drivers hit EEH(Extended Error handling) when triggering
> kdump on Pseries PowerVM. This patch implemented a reset of the PHBs
> in pci general code when triggering kdump.

Actually it's in pseries specific PCI code, and the reset is done in the
2nd kernel as it boots, not when triggering the kdump.

You're doing it as a:

  machine_postcore_initcall(pseries, pseries_phb_reset);

But we do the EEH initialisation in:

  core_initcall_sync(eeh_init);

Which happens first.

So it seems to me that this should be called from pseries_eeh_init().

That would isolate the code in the right place, and allow you to use the
existing ibm_get_config_addr_info.

You probably can't use pseries_eeh_get_pe_addr(), because you won't have
a "pe" structure yet.

Instead you should add a helper that does the core of that logic but
accepts config_addr/buid as parameters, and then have your code and
pseries_eeh_get_pe_addr() call that.

> PHB reset stop all PCI
> transactions from normal kernel. We have tested the patch in several
> enviroments:
> - direct slot adapters
> - adapters under the switch
> - a VF adapter in PowerVM
> - a VF adapter/adapter in KVM guest.
>
> Signed-off-by: Wen Xiong <wenxiong@linux.vnet.ibm.com>
>
> ---
>  arch/powerpc/platforms/pseries/pci.c | 152 +++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
> index 911534b89c85..cb7e4276cf04 100644
> --- a/arch/powerpc/platforms/pseries/pci.c
> +++ b/arch/powerpc/platforms/pseries/pci.c
> @@ -11,6 +11,8 @@
>  #include <linux/kernel.h>
>  #include <linux/pci.h>
>  #include <linux/string.h>
> +#include <linux/crash_dump.h>
> +#include <linux/delay.h>
>  
>  #include <asm/eeh.h>
>  #include <asm/pci-bridge.h>
> @@ -354,3 +356,153 @@ int pseries_root_bridge_prepare(struct pci_host_bridge *bridge)
>  
>  	return 0;
>  }
> +
> +/**
> + * pseries_get_pdn_addr - Retrieve PHB address
> + * @pe: EEH PE

There is no "pe" parameter.

Oh but there is in pseries_eeh_get_pe_addr() which this is an almost
verbatim copy of.

> + *
> + * Retrieve the assocated PHB address. Actually, there're 2 RTAS
> + * function calls dedicated for the purpose. We need implement
> + * it through the new function and then the old one. Besides,
> + * you should make sure the config address is figured out from
> + * FDT node before calling the function.
> + *
> + */
> +static int pseries_get_pdn_addr(struct pci_controller *phb)
> +{
> +	int ret = -1;
> +	int rets[3];
> +	int ibm_get_config_addr_info;
> +	int ibm_get_config_addr_info2;
> +	int config_addr = 0;
> +	struct pci_dn *root_pdn, *pdn;
> +
> +	ibm_get_config_addr_info2   = rtas_token("ibm,get-config-addr-info2");
> +	ibm_get_config_addr_info    = rtas_token("ibm,get-config-addr-info");
> +
> +	root_pdn = PCI_DN(phb->dn);
> +	pdn = list_first_entry(&root_pdn->child_list, struct pci_dn, list);
> +	config_addr = (pdn->busno << 16) | (pdn->devfn << 8);
> +
> +	if (ibm_get_config_addr_info2 != RTAS_UNKNOWN_SERVICE) {
> +		/*
> +		 * First of all, we need to make sure there has one PE
> +		 * associated with the device. If option is 1, it
> +		 * queries if config address is supported in a PE or not.
> +		 * If option is 0, it returns PE config address or config
> +		 * address for the PE primary bus.
> +		 */
> +		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
> +			config_addr, BUID_HI(pdn->phb->buid),
> +			BUID_LO(pdn->phb->buid), 1);
> +		if (ret || (rets[0] == 0)) {
> +			pr_warn("%s: Failed to get address for PHB#%x-PE# option=%d config_addr=%x\n",
> +				__func__, pdn->phb->global_number, 1, rets[0]);

Here you've hacked the existing pr_warn() to drop the PE number but left
"-PE#" in the format string.

See the original:
			pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
				__func__, pe->phb->global_number, pe->config_addr);


> +			return -1;
> +		}
> +
> +		/* Retrieve the associated PE config address */
> +		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
> +			config_addr, BUID_HI(pdn->phb->buid),
> +			BUID_LO(pdn->phb->buid), 0);
> +		if (ret) {
> +			pr_warn("%s: Failed to get address for PHB#%x-PE# option=%d config_addr=%x\n",
                                                                         ^
                                                                         and here

> +				__func__, pdn->phb->global_number, 0, rets[0]);
> +			return -1;
> +		}
> +		return rets[0];
> +	}
> +
> +	if (ibm_get_config_addr_info != RTAS_UNKNOWN_SERVICE) {
> +		ret = rtas_call(ibm_get_config_addr_info, 4, 2, rets,
> +			config_addr, BUID_HI(pdn->phb->buid),
> +			BUID_LO(pdn->phb->buid), 0);
> +		if (ret || rets[0]) {
> +			pr_warn("%s: Failed to get address for PHB#%x-PE# config_addr=%x\n",
                                                                         ^
                                                                         and here

> +				__func__, pdn->phb->global_number, rets[0]);
> +			return -1;
> +		}
> +		return rets[0];
> +	}
> +
> +	return ret;
> +}
> +
> +static int __init pseries_phb_reset(void)
> +{
> +	struct pci_controller *phb;
> +	int config_addr;
> +	int ibm_set_slot_reset;
> +	int ibm_configure_pe;
> +	int ret;
> +
> +	if (is_kdump_kernel() || reset_devices) {

This should be inverted and turned into an early return, allowing the
entire rest of the function to be de-indented.

> +		pr_info("Issue PHB reset ...\n");
> +		ibm_set_slot_reset = rtas_token("ibm,set-slot-reset");
> +		ibm_configure_pe = rtas_token("ibm,configure-pe");
> +
> +		if (ibm_set_slot_reset == RTAS_UNKNOWN_SERVICE ||
> +				ibm_configure_pe == RTAS_UNKNOWN_SERVICE) {
> +			pr_info("%s: EEH functionality not supported\n",
> +				__func__);

But then you just continue?

> +		}
> +
> +		list_for_each_entry(phb, &hose_list, list_node) {
> +			config_addr = pseries_get_pdn_addr(phb);
> +			if (config_addr == -1)
> +				continue;
> +
> +			ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
> +				config_addr, BUID_HI(phb->buid),
> +				BUID_LO(phb->buid), EEH_RESET_FUNDAMENTAL);
> +
> +			/* If fundamental-reset not supported, try hot-reset */
> +			if (ret == -8)

Where does -8 come from?

Oh I see, it's copied from pseries_eeh_reset().

> +				ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
> +					config_addr, BUID_HI(phb->buid),
> +					BUID_LO(phb->buid), EEH_RESET_HOT);
> +
> +			if (ret) {
> +				pr_err("%s: PHB#%x-PE# failed with rtas_call activate reset=%d\n",
                                                      ^
                                                      again missing PE number.

> +					__func__, phb->global_number, ret);
> +				continue;
> +			}
> +		}
> +		msleep(EEH_PE_RST_SETTLE_TIME);

So that loop is basically a copy of pseries_eeh_reset() but with the
sleep hoisted out of the loop.

I'd really prefer to see that refactored into a helper that takes the
config_addr and buid and doesn't do the sleep.

Then this loop could call that helper, and so could pseries_eeh_reset().

> +
> +		list_for_each_entry(phb, &hose_list, list_node) {
> +			config_addr = pseries_get_pdn_addr(phb);
> +			if (config_addr == -1)
> +				continue;
> +
> +			ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
> +				config_addr, BUID_HI(phb->buid),
> +				BUID_LO(phb->buid), EEH_RESET_DEACTIVATE);
> +			if (ret) {
> +				pr_err("%s: PHB#%x-PE# failed with rtas_call deactive reset=%d\n",
> +					__func__, phb->global_number, ret);
> +				continue;
> +			}
> +		}
> +		msleep(EEH_PE_RST_SETTLE_TIME);
> +
> +		list_for_each_entry(phb, &hose_list, list_node) {
> +			config_addr = pseries_get_pdn_addr(phb);
> +			if (config_addr == -1)
> +				continue;
> +
> +			ret = rtas_call(ibm_configure_pe, 3, 1, NULL,
> +				config_addr, BUID_HI(phb->buid),
> +				BUID_LO(phb->buid));
> +			if (ret) {
> +				pr_err("%s: PHB#%x-PE# failed with rtas_call configure_pe =%d\n",
> +					__func__, phb->global_number, ret);
> +				continue;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +machine_postcore_initcall(pseries, pseries_phb_reset);

cheers
