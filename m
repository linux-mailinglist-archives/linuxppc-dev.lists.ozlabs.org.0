Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7911CD653
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 12:19:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LH3j2MwKzDqHx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 20:19:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Gd/FiQrt; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LH1J2c6yzDqVP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 20:17:23 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id i19so8972361ioh.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 03:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1kR1shJEz7RtYwnp8STlLF006xWzpnb3OD2hGaxXFxs=;
 b=Gd/FiQrtPM1FTWh+1M9WssyXAtszV37L5T7hXfRHWSFrN9ymD7tODS/kiu2fTC9lnU
 z6yWNVIJgmYXvUYjO4oFHQ1RsbIGkMmRDXbs2FeN8zc/WIXfshLUpEbiRFU7EkkTv6Fc
 rICEh8NNqa2NbsymI1iL8f7kbyq8cHYvbPdg+wfyKeHI6xDQs69pVS4dRbVEnEH/yTHY
 JF06q4+uX1dXwNcbk7aJmMlsr2//CoGBUDKxU9nrKxbiMt95y+myXSXEdNMSej9SY8VW
 oqOgxeL0Ainec16yMGr6i9uSg0KAQnElB4NbEvWNoLg9JAUn3rzMI47eB2evp1+I7I/g
 AZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1kR1shJEz7RtYwnp8STlLF006xWzpnb3OD2hGaxXFxs=;
 b=MnpHFrwI6bakF9AY6Dm1uCdUausr/9PbS/FN5+P+E2vZcDMkbIyasGRs5/xmysgZ8G
 O3hLgrv8qk5h9GPCxIR00sBZ4XiNCxtJD+8IFqrc5yKxTbDtUflTB2TyoOqACw3ThM54
 RK8nJnzy55lMultrbrSi9PW8yLWR573EaHseEuw7CZ/O33zIeUipkWcxcWqGFEO/2Wr9
 HwLj8ZP6BgB3xXgylH68n7T2QR2ihgF+EIfoS13bZSzqQbIpTn0id40m3khpkqPdDSTv
 bP2tHAsld5OzaxY3wdNHoPe1Vq96EilcHjzxmVzCowZFtDAC0yx2kdaylqf9Suk9Vu1u
 3R8g==
X-Gm-Message-State: AGi0PuYyZOGa/3uh6Xz/IMRJ7T58zYfyydf5nrfbZCfd8uI7zG/OTP0H
 ypv3mp7K4KcO7vHvaNb4JMK7ueotjuGExyu18RtP0E8E
X-Google-Smtp-Source: APiQypK2wkBwzd1x1c7BNVC7y9Q/ZRzPT3hEqLA5clXWIqFlXXYEMrl5asNDo2a/tUOJibQDyqJ40+YT3BaE+Vsr7ec=
X-Received: by 2002:a6b:f812:: with SMTP id o18mr14165650ioh.87.1589192237477; 
 Mon, 11 May 2020 03:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <1588857037-25950-1-git-send-email-wenxiong@linux.vnet.ibm.com>
In-Reply-To: <1588857037-25950-1-git-send-email-wenxiong@linux.vnet.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 11 May 2020 20:17:06 +1000
Message-ID: <CAOSf1CFyK+4Ci6nCX-vNaQEJ_KCnm_qoBK2OWUft3KW3KfWSUA@mail.gmail.com>
Subject: Re: powerpc/pci: [PATCH 1/1]: PCIE PHB reset
To: wenxiong@linux.vnet.ibm.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 8, 2020 at 12:36 AM <wenxiong@linux.vnet.ibm.com> wrote:
>
> From: Wen Xiong <wenxiong@linux.vnet.ibm.com>
>
> Several device drivers hit EEH(Extended Error handling) when triggering
> kdump on Pseries PowerVM. This patch implemented a reset of the PHBs
> in pci general code. PHB reset stop all PCI transactions from previous
> kernel. We have tested the patch in several enviroments:
> - direct slot adapters
> - adapters under the switch
> - a VF adapter in PowerVM
> - a VF adapter/adapter in KVM guest.
>
> Signed-off-by: Wen Xiong <wenxiong@linux.vnet.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/pci.c | 153 +++++++++++++++++++++++++++
>  1 file changed, 153 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
> index 911534b89c85..aac7f00696d2 100644
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
> @@ -354,3 +356,154 @@ int pseries_root_bridge_prepare(struct pci_host_bridge *bridge)
>
>         return 0;
>  }
> +
> +/**
> + * pseries_get_pdn_addr - Retrieve PHB address
> + * @pe: EEH PE
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
> +       int ret = -1;
> +       int rets[3];
> +       int ibm_get_config_addr_info;
> +       int ibm_get_config_addr_info2;
> +       int config_addr = 0;
> +       struct pci_dn *root_pdn, *pdn;
> +
> +       ibm_get_config_addr_info2   = rtas_token("ibm,get-config-addr-info2");
> +       ibm_get_config_addr_info    = rtas_token("ibm,get-config-addr-info");
> +
> +       root_pdn = PCI_DN(phb->dn);
> +       pdn = list_first_entry(&root_pdn->child_list, struct pci_dn, list);
> +       config_addr = (pdn->busno << 16) | (pdn->devfn << 8);
> +
> +       if (ibm_get_config_addr_info2 != RTAS_UNKNOWN_SERVICE) {
> +               /*
> +                * First of all, we need to make sure there has one PE
> +                * associated with the device. Otherwise, PE address is
> +                * meaningless.
> +                */
> +               ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
> +                       config_addr, BUID_HI(pdn->phb->buid),
> +                       BUID_LO(pdn->phb->buid), 1);
> +               if (ret || (rets[0] == 0)) {
> +                       pr_warn("%s: Failed to get address for PHB#%x-PE# "
> +                               "option=%d config_addr=%x\n",
> +                               __func__, pdn->phb->global_number, 1, rets[0]);
> +                       return -1;
> +               }
> +
> +               /* Retrieve the associated PE config address */
> +               ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
> +                       config_addr, BUID_HI(pdn->phb->buid),
> +                       BUID_LO(pdn->phb->buid), 0);
> +               if (ret) {
> +                       pr_warn("%s: Failed to get address for PHB#%x-PE# "
> +                               "option=%d config_addr=%x\n",
> +                               __func__, pdn->phb->global_number, 0, rets[0]);
> +                       return -1;
> +               }
> +               return rets[0];
> +       }
> +
> +       if (ibm_get_config_addr_info != RTAS_UNKNOWN_SERVICE) {
> +               ret = rtas_call(ibm_get_config_addr_info, 4, 2, rets,
> +                       config_addr, BUID_HI(pdn->phb->buid),
> +                       BUID_LO(pdn->phb->buid), 0);
> +               if (ret || rets[0]) {
> +                       pr_warn("%s: Failed to get address for PHB#%x-PE# "
> +                               "config_addr=%x\n",
> +                               __func__, pdn->phb->global_number, rets[0]);
> +                       return -1;
> +               }
> +               return rets[0];
> +       }
> +
> +       return ret;
> +}

I'd be nice if we could reduce the amount of duplication between this
function and eeh_pseries_get_pe_addr(). I was planning to re-working
the EEH version though so that this is fine for now.

> +
> +static int __init pseries_phb_reset(void)
> +{
> +       struct pci_controller *phb;
> +       int config_addr;
> +       int ibm_set_slot_reset;
> +       int ibm_configure_pe;
> +       int ret;
> +
> +       if (is_kdump_kernel() || reset_devices) {
> +               pr_info("Issue PHB reset ...\n");
> +               ibm_set_slot_reset = rtas_token("ibm,set-slot-reset");
> +               ibm_configure_pe = rtas_token("ibm,configure-pe");
> +
> +               if (ibm_set_slot_reset == RTAS_UNKNOWN_SERVICE ||
> +                               ibm_configure_pe == RTAS_UNKNOWN_SERVICE) {
> +                       pr_info("%s: EEH functionality not supported\n",
> +                               __func__);
> +               }
> +
> +               list_for_each_entry(phb, &hose_list, list_node) {
> +                       config_addr = pseries_get_pdn_addr(phb);
> +                       if (config_addr == -1)
> +                               continue;
Considering we already cache the buid in the pci_controller we could
also cache the config_addr. That said, considering all this runs
precisely once at boot I'm not that bothered by calling
pseries_get_pdn_addr() again in each loop.


> +
> +                       ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
> +                               config_addr, BUID_HI(phb->buid),
> +                               BUID_LO(phb->buid), EEH_RESET_FUNDAMENTAL);
> +
> +                       /* If fundamental-reset not supported, try hot-reset */
> +                       if (ret == -8)
> +                               ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
> +                                       config_addr, BUID_HI(phb->buid),
> +                                       BUID_LO(phb->buid), EEH_RESET_HOT);
> +
> +                       if (ret) {
> +                               pr_err("%s: fail with rtas_call fundamental reset=%d\n",
> +                                       __func__, ret);
> +                               continue;
> +                       }
> +               }
> +               msleep(EEH_PE_RST_SETTLE_TIME);
> +
> +               list_for_each_entry(phb, &hose_list, list_node) {
> +                       config_addr = pseries_get_pdn_addr(phb);
> +                       if (config_addr == -1)
> +                               continue;
> +
> +                       ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
> +                               config_addr, BUID_HI(phb->buid),
> +                               BUID_LO(phb->buid), EEH_RESET_DEACTIVATE);
> +                       if (ret) {
> +                               pr_err("%s: fail with rtas_call deactive=%d\n",
> +                                       __func__, ret);
> +                               continue;
> +                       }
> +               }
> +               msleep(EEH_PE_RST_SETTLE_TIME);
> +
> +               list_for_each_entry(phb, &hose_list, list_node) {
> +                       config_addr = pseries_get_pdn_addr(phb);
> +                       if (config_addr == -1)
> +                               continue;
> +
> +                       ret = rtas_call(ibm_configure_pe, 3, 1, NULL,
> +                               config_addr, BUID_HI(phb->buid),
> +                               BUID_LO(phb->buid));
> +                       if (ret) {
> +                               pr_err("%s: fail with rtas_call configure_pe =%d\n",
> +                                       __func__, ret);
> +                               continue;
> +                       }
> +               }
> +       }
> +
> +       return 0;
> +}
> +postcore_initcall(pseries_phb_reset);

You probably should use machine_postcore_initcall(pseries,
pseries_phb_reset); so that this only gets run on pseries. Without the
machine type specifier it'll run on PowerNV too.

> +
> --
> 2.18.1
>
