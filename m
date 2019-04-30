Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D961EF66
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 06:24:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tT1s1P5bzDqRC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 14:24:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="n1dnmh2Z"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tT0Y2hpkzDq74
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 14:23:09 +1000 (AEST)
Received: by mail-it1-x141.google.com with SMTP id v143so2626662itc.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 21:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o2slRh9TET5ekToJXqk2NUH3nM++xivNoqCUhSr0SCs=;
 b=n1dnmh2ZPNUr8GpXNgQgCYYHLgwcl1b5bph3R3lBS5Dizg03TmJ1LPH4fBSM/HGhCn
 5xxkXUhj571uy/7H8tQCxRfqE+6dTJ3erfP7D4EGR0NDXjzlfA6tgWPkJxQPJd/0eMcW
 44sZbspGfbVWA8Qo6UW87VpZSkmXJyFjCJl9itAseq13RblW47vQUG36/1mTsCYiC52Z
 cVu3GuwR6ZlhlR8QeF2gnEWZ/Vrn+LskLqciNhuQ1nrB6xWF9AIpBEkPuUrl3YVc6MQe
 Hv/oCSu3218aKulQcYbppnDEkgVUjMjOiW65oUdASD0waZuuk0pCOo5rgzhmP7cjLI1B
 VH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2slRh9TET5ekToJXqk2NUH3nM++xivNoqCUhSr0SCs=;
 b=MqfhEvvC9tFjYV+n8qqEbrbP8zML4FU2d1rH/JOhytLydBuuOSBOGQsCx493LBDCAg
 6PUE2tAgcwn6Ax1/Ct0+FvebSMu8algSM5bKeNGj34sArFM8E3VF2Ma6KJtdF1l/ioi3
 1i8HqlrDXlMKfwPW4EQEkt1f8RnVIMJBr8QiJmBd4aXd85cNaQICGHaf/h/+svG4EeNQ
 RlrFEsmL+4KvmDknJlN+kUYLWAUxNNrPczp/+K/19CsUSdT55WvItQP79S0U+IXLahu2
 BmeuAYgB5dgciwwtfIsl2ZIE0fouKFivZe90ntX+HpI9iUSzmdgCPpsiLWTFLaBwhttY
 whKg==
X-Gm-Message-State: APjAAAWWf/VWvxDkefbJVgI99Xytr0T8gJmPzL7L8VOqRejQ+0kr4PJC
 kHTK67AsiiZlqYKcxaLdPGGQ69cr7f9k9SH3qmQ=
X-Google-Smtp-Source: APXvYqxwoq1b3F8w81yugISReTBOKS0SEOx8bLZaTLUjBxoFYmsjCrIC96mBWWfJpxXh2CzJQf+P0IwucbWxd3fsDok=
X-Received: by 2002:a02:1384:: with SMTP id 126mr41450685jaz.72.1556598185310; 
 Mon, 29 Apr 2019 21:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190311115233.6514-1-s.miroshnichenko@yadro.com>
 <20190311115233.6514-2-s.miroshnichenko@yadro.com>
In-Reply-To: <20190311115233.6514-2-s.miroshnichenko@yadro.com>
From: Oliver <oohall@gmail.com>
Date: Tue, 30 Apr 2019 14:22:53 +1000
Message-ID: <CAOSf1CGKrb6tnGpanuUL3Bt8kyqqV6D4o5TLF9ncny3MRBN=ng@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] powerpc/pci: Access PCI config space directly w/o
 pci_dn
To: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
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
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linux-pci@vger.kernel.org,
 linux@yadro.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 11, 2019 at 10:52 PM Sergey Miroshnichenko
<s.miroshnichenko@yadro.com> wrote:
>
> To fetch an updated DT for the newly hotplugged device, OS must explicitly
> request it from the firmware via the pnv_php driver.
>
> If pnv_php wasn't triggered/loaded, it is still possible to discover new
> devices if PCIe I/O will not stop in absence of the pci_dn structure.
>
> Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
> ---
>  arch/powerpc/kernel/rtas_pci.c       | 97 +++++++++++++++++++---------
>  arch/powerpc/platforms/powernv/pci.c | 64 ++++++++++++------
>  2 files changed, 109 insertions(+), 52 deletions(-)
>
> diff --git a/arch/powerpc/kernel/rtas_pci.c b/arch/powerpc/kernel/rtas_pci.c
> index c2b148b1634a..f675b5ecb5bc 100644
> --- a/arch/powerpc/kernel/rtas_pci.c
> +++ b/arch/powerpc/kernel/rtas_pci.c
> @@ -55,10 +55,26 @@ static inline int config_access_valid(struct pci_dn *dn, int where)
>         return 0;
>  }
>
> -int rtas_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
> +static int rtas_read_raw_config(unsigned long buid, int busno, unsigned int devfn,
> +                               int where, int size, u32 *val)
>  {
>         int returnval = -1;
> -       unsigned long buid, addr;
> +       unsigned long addr = rtas_config_addr(busno, devfn, where);
> +       int ret;
> +
> +       if (buid) {
> +               ret = rtas_call(ibm_read_pci_config, 4, 2, &returnval,
> +                               addr, BUID_HI(buid), BUID_LO(buid), size);
> +       } else {
> +               ret = rtas_call(read_pci_config, 2, 2, &returnval, addr, size);
> +       }
> +       *val = returnval;
> +
> +       return ret;
> +}
> +
> +int rtas_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
> +{
>         int ret;
>
>         if (!pdn)
> @@ -71,16 +87,8 @@ int rtas_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
>                 return PCIBIOS_SET_FAILED;
>  #endif
>
> -       addr = rtas_config_addr(pdn->busno, pdn->devfn, where);
> -       buid = pdn->phb->buid;
> -       if (buid) {
> -               ret = rtas_call(ibm_read_pci_config, 4, 2, &returnval,
> -                               addr, BUID_HI(buid), BUID_LO(buid), size);
> -       } else {
> -               ret = rtas_call(read_pci_config, 2, 2, &returnval, addr, size);
> -       }
> -       *val = returnval;
> -
> +       ret = rtas_read_raw_config(pdn->phb->buid, pdn->busno, pdn->devfn,
> +                                  where, size, val);
>         if (ret)
>                 return PCIBIOS_DEVICE_NOT_FOUND;
>
> @@ -98,18 +106,44 @@ static int rtas_pci_read_config(struct pci_bus *bus,
>
>         pdn = pci_get_pdn_by_devfn(bus, devfn);
>
> -       /* Validity of pdn is checked in here */
> -       ret = rtas_read_config(pdn, where, size, val);
> -       if (*val == EEH_IO_ERROR_VALUE(size) &&
> -           eeh_dev_check_failure(pdn_to_eeh_dev(pdn)))
> -               return PCIBIOS_DEVICE_NOT_FOUND;
> +       if (pdn) {
> +               /* Validity of pdn is checked in here */
> +               ret = rtas_read_config(pdn, where, size, val);
> +
> +               if (*val == EEH_IO_ERROR_VALUE(size) &&
> +                   eeh_dev_check_failure(pdn_to_eeh_dev(pdn)))
> +                       ret = PCIBIOS_DEVICE_NOT_FOUND;
> +       } else {
> +               struct pci_controller *phb = pci_bus_to_host(bus);
> +
> +               ret = rtas_read_raw_config(phb->buid, bus->number, devfn,
> +                                          where, size, val);
> +       }
>
>         return ret;
>  }
>
> +static int rtas_write_raw_config(unsigned long buid, int busno, unsigned int devfn,
> +                                int where, int size, u32 val)
> +{
> +       unsigned long addr = rtas_config_addr(busno, devfn, where);
> +       int ret;
> +
> +       if (buid) {
> +               ret = rtas_call(ibm_write_pci_config, 5, 1, NULL, addr,
> +                               BUID_HI(buid), BUID_LO(buid), size, (ulong)val);
> +       } else {
> +               ret = rtas_call(write_pci_config, 3, 1, NULL, addr, size, (ulong)val);
> +       }
> +
> +       if (ret)
> +               return PCIBIOS_DEVICE_NOT_FOUND;
> +
> +       return PCIBIOS_SUCCESSFUL;
> +}
> +
>  int rtas_write_config(struct pci_dn *pdn, int where, int size, u32 val)
>  {
> -       unsigned long buid, addr;
>         int ret;
>
>         if (!pdn)
> @@ -122,15 +156,8 @@ int rtas_write_config(struct pci_dn *pdn, int where, int size, u32 val)
>                 return PCIBIOS_SET_FAILED;
>  #endif
>
> -       addr = rtas_config_addr(pdn->busno, pdn->devfn, where);
> -       buid = pdn->phb->buid;
> -       if (buid) {
> -               ret = rtas_call(ibm_write_pci_config, 5, 1, NULL, addr,
> -                       BUID_HI(buid), BUID_LO(buid), size, (ulong) val);
> -       } else {
> -               ret = rtas_call(write_pci_config, 3, 1, NULL, addr, size, (ulong)val);
> -       }
> -
> +       ret = rtas_write_raw_config(pdn->phb->buid, pdn->busno, pdn->devfn,
> +                                   where, size, val);
>         if (ret)
>                 return PCIBIOS_DEVICE_NOT_FOUND;
>
> @@ -141,12 +168,20 @@ static int rtas_pci_write_config(struct pci_bus *bus,
>                                  unsigned int devfn,
>                                  int where, int size, u32 val)
>  {
> -       struct pci_dn *pdn;
> +       struct pci_dn *pdn = pci_get_pdn_by_devfn(bus, devfn);
> +       int ret;
>
> -       pdn = pci_get_pdn_by_devfn(bus, devfn);
> +       if (pdn) {
> +               /* Validity of pdn is checked in here. */
> +               ret = rtas_write_config(pdn, where, size, val);
> +       } else {
> +               struct pci_controller *phb = pci_bus_to_host(bus);
>
> -       /* Validity of pdn is checked in here. */
> -       return rtas_write_config(pdn, where, size, val);
> +               ret = rtas_write_raw_config(phb->buid, bus->number, devfn,
> +                                           where, size, val);
> +       }
> +
> +       return ret;
>  }
>
>  static struct pci_ops rtas_pci_ops = {
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index ef9448a907c6..41a381dfc2a1 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -652,30 +652,29 @@ static void pnv_pci_config_check_eeh(struct pci_dn *pdn)
>         }
>  }
>
> -int pnv_pci_cfg_read(struct pci_dn *pdn,
> -                    int where, int size, u32 *val)
> +static int pnv_pci_cfg_read_raw(u64 phb_id, int busno, unsigned int devfn,
> +                               int where, int size, u32 *val)
>  {
> -       struct pnv_phb *phb = pdn->phb->private_data;
> -       u32 bdfn = (pdn->busno << 8) | pdn->devfn;
> +       u32 bdfn = (busno << 8) | devfn;
>         s64 rc;
>
>         switch (size) {
>         case 1: {
>                 u8 v8;
> -               rc = opal_pci_config_read_byte(phb->opal_id, bdfn, where, &v8);
> +               rc = opal_pci_config_read_byte(phb_id, bdfn, where, &v8);
>                 *val = (rc == OPAL_SUCCESS) ? v8 : 0xff;
>                 break;
>         }
>         case 2: {
>                 __be16 v16;
> -               rc = opal_pci_config_read_half_word(phb->opal_id, bdfn, where,
> -                                                  &v16);
> +               rc = opal_pci_config_read_half_word(phb_id, bdfn, where,
> +                                                   &v16);
>                 *val = (rc == OPAL_SUCCESS) ? be16_to_cpu(v16) : 0xffff;
>                 break;
>         }
>         case 4: {
>                 __be32 v32;
> -               rc = opal_pci_config_read_word(phb->opal_id, bdfn, where, &v32);
> +               rc = opal_pci_config_read_word(phb_id, bdfn, where, &v32);
>                 *val = (rc == OPAL_SUCCESS) ? be32_to_cpu(v32) : 0xffffffff;
>                 break;
>         }
> @@ -684,27 +683,28 @@ int pnv_pci_cfg_read(struct pci_dn *pdn,
>         }
>
>         pr_devel("%s: bus: %x devfn: %x +%x/%x -> %08x\n",
> -                __func__, pdn->busno, pdn->devfn, where, size, *val);
> +                __func__, busno, devfn, where, size, *val);
> +
>         return PCIBIOS_SUCCESSFUL;
>  }
>
> -int pnv_pci_cfg_write(struct pci_dn *pdn,
> -                     int where, int size, u32 val)
> +static int pnv_pci_cfg_write_raw(u64 phb_id, int busno, unsigned int devfn,
> +                                int where, int size, u32 val)
>  {
> -       struct pnv_phb *phb = pdn->phb->private_data;
> -       u32 bdfn = (pdn->busno << 8) | pdn->devfn;
> +       u32 bdfn = (busno << 8) | devfn;
>
>         pr_devel("%s: bus: %x devfn: %x +%x/%x -> %08x\n",
> -                __func__, pdn->busno, pdn->devfn, where, size, val);
> +                __func__, busno, devfn, where, size, val);
> +
>         switch (size) {
>         case 1:
> -               opal_pci_config_write_byte(phb->opal_id, bdfn, where, val);
> +               opal_pci_config_write_byte(phb_id, bdfn, where, val);
>                 break;
>         case 2:
> -               opal_pci_config_write_half_word(phb->opal_id, bdfn, where, val);
> +               opal_pci_config_write_half_word(phb_id, bdfn, where, val);
>                 break;
>         case 4:
> -               opal_pci_config_write_word(phb->opal_id, bdfn, where, val);
> +               opal_pci_config_write_word(phb_id, bdfn, where, val);
>                 break;
>         default:
>                 return PCIBIOS_FUNC_NOT_SUPPORTED;
> @@ -713,6 +713,24 @@ int pnv_pci_cfg_write(struct pci_dn *pdn,
>         return PCIBIOS_SUCCESSFUL;
>  }
>
> +int pnv_pci_cfg_read(struct pci_dn *pdn,
> +                    int where, int size, u32 *val)
> +{
> +       struct pnv_phb *phb = pdn->phb->private_data;
> +
> +       return pnv_pci_cfg_read_raw(phb->opal_id, pdn->busno, pdn->devfn,
> +                                   where, size, val);
> +}
> +
> +int pnv_pci_cfg_write(struct pci_dn *pdn,
> +                     int where, int size, u32 val)
> +{
> +       struct pnv_phb *phb = pdn->phb->private_data;
> +
> +       return pnv_pci_cfg_write_raw(phb->opal_id, pdn->busno, pdn->devfn,
> +                                    where, size, val);
> +}
> +
>  #if CONFIG_EEH
>  static bool pnv_pci_cfg_check(struct pci_dn *pdn)
>  {
> @@ -748,13 +766,15 @@ static int pnv_pci_read_config(struct pci_bus *bus,
>                                int where, int size, u32 *val)
>  {
>         struct pci_dn *pdn;
> -       struct pnv_phb *phb;
> +       struct pci_controller *hose = pci_bus_to_host(bus);
> +       struct pnv_phb *phb = hose->private_data;
>         int ret;
>
>         *val = 0xFFFFFFFF;
>         pdn = pci_get_pdn_by_devfn(bus, devfn);
>         if (!pdn)
> -               return PCIBIOS_DEVICE_NOT_FOUND;
> +               return pnv_pci_cfg_read_raw(phb->opal_id, bus->number, devfn,
> +                                           where, size, val);
>
>         if (!pnv_pci_cfg_check(pdn))
>                 return PCIBIOS_DEVICE_NOT_FOUND;
> @@ -777,12 +797,14 @@ static int pnv_pci_write_config(struct pci_bus *bus,
>                                 int where, int size, u32 val)
>  {
>         struct pci_dn *pdn;
> -       struct pnv_phb *phb;
> +       struct pci_controller *hose = pci_bus_to_host(bus);
> +       struct pnv_phb *phb = hose->private_data;
>         int ret;
>
>         pdn = pci_get_pdn_by_devfn(bus, devfn);
>         if (!pdn)
> -               return PCIBIOS_DEVICE_NOT_FOUND;
> +               return pnv_pci_cfg_write_raw(phb->opal_id, bus->number, devfn,
> +                                            where, size, val);
>
>         if (!pnv_pci_cfg_check(pdn))
>                 return PCIBIOS_DEVICE_NOT_FOUND;
> --
> 2.20.1
>

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
