Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95430EF9A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 06:28:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tT6p6Sm3zDqMK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 14:28:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jvQCAxGN"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tT4R0GrKzDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 14:26:30 +1000 (AEST)
Received: by mail-it1-x141.google.com with SMTP id q19so2620313itk.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 21:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t1AHa4y9HItu8pWR+Cc3jqH3r77ZUtY/LFLvQb33vwg=;
 b=jvQCAxGNAh6u7Q+yQEV6dMmG3ymyY5vcVzNfGa0WR47bFA2dos1g2PYidD9fR8BZFG
 sEKJ7ryTYwiCygqCq5gAW6TF2Hsdtzk1aleW1kegbyy682P695VLjikwx0G9ID1PucRK
 ItjHrGSZLd/G5QRj6vL2RqIIT3Ru5EYh0c0NKIioALX5V83TUI/JQltTJoRnDzC5QFo9
 VcH6md8PqT3PU1nB6qnVz0SZux6iDu/od193XYIFJhNeA3gvawy2/x2axbzDpefYv1iC
 yxbc8yj95N2Q18J+rsxIzKAE7TpbEr+ozEzwbvwKwhUgrxHMia/zbawfP4GnOqVYoLlf
 HDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t1AHa4y9HItu8pWR+Cc3jqH3r77ZUtY/LFLvQb33vwg=;
 b=oNgzKYEWW2eQYnd1kT53RgNUcV8OUEMF3RtO7k6dEMorI0aj2XjNWVkHfrvyEgn4pf
 XD1p9YnvUHscF3I8mg5zF/3pMYPuCOqqRQDzGsxSs+DR9bxO9zr8KP97PvSpOZH0FE+J
 1w+Y60AJM6VPLK0eKUTWjX5pE6FzxpQ0MKlhnrfk/QlVAI0Ol8AN7WF4fWubTZ5w8vws
 Cj9Gt7xyHIqzKl4OBxt6l+07DH9k6EI9cDy2/T+aw7dmA1Su7WvCTAWvsFPgAkkZ8/oO
 Lw7ZCA0n40DBWU2k5R81ySo6eiDS9RUSFU/U9aRzQW92uZ4qHqQ7Pyf3VyIgcVTGtIKM
 69qg==
X-Gm-Message-State: APjAAAXDjJC7oZnYNS0/EQS/Wdw5ixqmQeje6BeVW1wZGInKdJUl797K
 V+7NLIk522nv4Z0TOPzSln2MsX4sS06qVCeHlbo=
X-Google-Smtp-Source: APXvYqyI6lVgp9aOsLjj03ex4HBhpqIrxoMl1W0IkO6i89AEn/j+YFvp1mF4USodJGyF4UDAZ5kUTrXQ2Y8JQE8Nq/0=
X-Received: by 2002:a24:e85:: with SMTP id 127mr2033755ite.4.1556598388424;
 Mon, 29 Apr 2019 21:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190311115233.6514-1-s.miroshnichenko@yadro.com>
 <20190311115233.6514-3-s.miroshnichenko@yadro.com>
In-Reply-To: <20190311115233.6514-3-s.miroshnichenko@yadro.com>
From: Oliver <oohall@gmail.com>
Date: Tue, 30 Apr 2019 14:26:16 +1000
Message-ID: <CAOSf1CF5gVPdBZpbzr+8cp1dC6Ki+XtkfsSqdR0CP8pDPCnPYQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] powerpc/powernv/pci: Suppress an EEH error when
 reading an empty slot
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
> Reading an empty slot returns all ones, which triggers a false
> EEH error event on PowerNV. This patch unfreezes the bus where
> it has happened.
>
> Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
> ---
>  arch/powerpc/include/asm/ppc-pci.h   |  1 +
>  arch/powerpc/kernel/pci_dn.c         |  2 +-
>  arch/powerpc/platforms/powernv/pci.c | 31 +++++++++++++++++++++++++---
>  3 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
> index f191ef0d2a0a..a22d52a9bb1f 100644
> --- a/arch/powerpc/include/asm/ppc-pci.h
> +++ b/arch/powerpc/include/asm/ppc-pci.h
> @@ -40,6 +40,7 @@ void *traverse_pci_dn(struct pci_dn *root,
>                       void *(*fn)(struct pci_dn *, void *),
>                       void *data);
>  extern void pci_devs_phb_init_dynamic(struct pci_controller *phb);
> +struct pci_dn *pci_bus_to_pdn(struct pci_bus *bus);
>
>  /* From rtas_pci.h */
>  extern void init_pci_config_tokens (void);
> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
> index ab147a1909c8..341ed71250f1 100644
> --- a/arch/powerpc/kernel/pci_dn.c
> +++ b/arch/powerpc/kernel/pci_dn.c
> @@ -40,7 +40,7 @@
>   * one of PF's bridge. For other devices, their firmware
>   * data is linked to that of their bridge.
>   */
> -static struct pci_dn *pci_bus_to_pdn(struct pci_bus *bus)
> +struct pci_dn *pci_bus_to_pdn(struct pci_bus *bus)
>  {
>         struct pci_bus *pbus;
>         struct device_node *dn;
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index 41a381dfc2a1..8cc6661781e2 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -761,6 +761,21 @@ static inline pnv_pci_cfg_check(struct pci_dn *pdn)
>  }
>  #endif /* CONFIG_EEH */
>
> +static int get_bus_pe_number(struct pci_bus *bus)
> +{
> +       struct pci_dn *pdn = pci_bus_to_pdn(bus);
> +       struct pci_dn *child;
> +
> +       if (!pdn)
> +               return IODA_INVALID_PE;
> +
> +       list_for_each_entry(child, &pdn->child_list, list)
> +               if (child->pe_number != IODA_INVALID_PE)
> +                       return child->pe_number;
> +
> +       return IODA_INVALID_PE;
> +}
> +
>  static int pnv_pci_read_config(struct pci_bus *bus,
>                                unsigned int devfn,
>                                int where, int size, u32 *val)
> @@ -772,9 +787,19 @@ static int pnv_pci_read_config(struct pci_bus *bus,
>
>         *val = 0xFFFFFFFF;
>         pdn = pci_get_pdn_by_devfn(bus, devfn);
> -       if (!pdn)
> -               return pnv_pci_cfg_read_raw(phb->opal_id, bus->number, devfn,
> -                                           where, size, val);
> +       if (!pdn) {
> +               int pe_number = get_bus_pe_number(bus);
> +
> +               ret = pnv_pci_cfg_read_raw(phb->opal_id, bus->number, devfn,
> +                                          where, size, val);
> +
> +               if (!ret && (*val == EEH_IO_ERROR_VALUE(size)) && phb->unfreeze_pe)
> +                       phb->unfreeze_pe(phb, (pe_number == IODA_INVALID_PE) ?
> +                                        phb->ioda.reserved_pe_idx : pe_number,
> +                                        OPAL_EEH_ACTION_CLEAR_FREEZE_ALL);
> +
> +               return ret;
> +       }
>
>         if (!pnv_pci_cfg_check(pdn))
>                 return PCIBIOS_DEVICE_NOT_FOUND;
> --
> 2.20.1
>

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
