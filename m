Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B86D035665
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 07:50:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JdDn1SmyzDqWt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 15:50:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::144; helo=mail-it1-x144.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qr7KOxvy"; 
 dkim-atps=neutral
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JdCY1QlLzDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 15:49:28 +1000 (AEST)
Received: by mail-it1-x144.google.com with SMTP id l21so1753799ita.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2019 22:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oW+bwxWTLIVociuA7JrrFw3bSeWILym80WNvYoV1ylE=;
 b=qr7KOxvy696MOhQOp7KF2L/z7JvF1TUyhELRUcNvmu9/LPkmMUNdi1gj+1OK7rR3Bc
 pSf776wV5Y3TNFn2bq/uV0TRZfeUUvhD5QIjEFzS5zwTc907vwQgkLYuV+YHkOIy938c
 QV+gl3zfgurMe4Ozq2RBjQ7qTvJu/aKAKO5FTEJoornkiSWQe0hYAlX3d1yQL2rZ2Z3C
 2475IeE35E2FZipFqCCxgT+nKpa+X4Uf/1iVImBZ53TXbCRQeCwkJp/A5mMzo0i9iNs3
 bM5cSFA5h4aXKfI8YgS+V8X7m4yr41ymm1rVZsT+plGjcatXQsktS0GFihPgQ8KaBsuX
 yMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oW+bwxWTLIVociuA7JrrFw3bSeWILym80WNvYoV1ylE=;
 b=JGn1JcdlWAFbR/LIGfmPK5cvMfXTsNn2ZR1dSfWvRukY/QtNrV5loCHQdkZ9TAi30O
 FhVJ+ZdMPGe0SmCqMGqhNzyXAvh6xq/RvmYpG9WooAx1tF7Np7K11o7WOqn4MHeRtSdq
 TjXQUt3clu6fs8YU5PIOfFNTJpVM6JK3K5eQLeNc1nn7snDkeQ9uyJtf9IwZl7NFClm/
 U/TdqNTSZz+RfbNeST4S7mlkD8PYz90qg3LV7dIEUa0xe7aR74lo1WVIAE6gn/nMQFR/
 iMo6TRijECdL6SSsthNTgC1KnM9M01ETiequZAggoFvjBXzr4sHppJ6Q0BHaNeejwjn5
 vskQ==
X-Gm-Message-State: APjAAAUKCBPY2QK6Hs85XpTEQlXUAv+0WeTH3XEarusswfpMhNyZMN5R
 z/TGJVWNJhmcPatMSGThA7pahERLFYWTouHEndTC9PWEJkw=
X-Google-Smtp-Source: APXvYqwWH2oW/YbUH0O8b1QTxIakbILT3aX34tk9zxWRVlVl8bw/OH43f4r0lKlIMbEV2lOVIBeCJ1z78RTFKidQJis=
X-Received: by 2002:a24:2855:: with SMTP id h82mr17470033ith.15.1559713766517; 
 Tue, 04 Jun 2019 22:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1557203383.git.sbobroff@linux.ibm.com>
 <a3e33cf84e4d6a957259e04533c85a37db0d2aef.1557203383.git.sbobroff@linux.ibm.com>
In-Reply-To: <a3e33cf84e4d6a957259e04533c85a37db0d2aef.1557203383.git.sbobroff@linux.ibm.com>
From: Oliver <oohall@gmail.com>
Date: Wed, 5 Jun 2019 15:49:15 +1000
Message-ID: <CAOSf1CFYtmbq2ZMpAPuJiyG7gkUO=w-mp-61jW1uQCHfF3=LpQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] powerpc/eeh: Refactor around eeh_probe_devices()
To: Sam Bobroff <sbobroff@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 7, 2019 at 2:30 PM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
>
> Now that EEH support for all devices (on PowerNV and pSeries) is
> provided by the pcibios bus add device hooks, eeh_probe_devices() and
> eeh_addr_cache_build() are redundant and can be removed.
>
> Move the EEH enabled message into it's own function so that it can be
> called from multiple places.
>
> Note that previously on pSeries, useless EEH sysfs files were created
> for some devices that did not have EEH support and this change
> prevents them from being created.
>
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
> v2 - As it's so small, merged the enablement message patch into this one =
(where it's used).
>    - Reworked enablement messages.
>
>  arch/powerpc/include/asm/eeh.h               |  7 ++---
>  arch/powerpc/kernel/eeh.c                    | 27 ++++++-----------
>  arch/powerpc/kernel/eeh_cache.c              | 32 --------------------
>  arch/powerpc/platforms/powernv/eeh-powernv.c |  4 +--
>  arch/powerpc/platforms/pseries/pci.c         |  3 +-
>  5 files changed, 14 insertions(+), 59 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/ee=
h.h
> index 12baf1df134c..3994d45ae0d4 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -283,13 +283,12 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
>
>  struct eeh_dev *eeh_dev_init(struct pci_dn *pdn);
>  void eeh_dev_phb_init_dynamic(struct pci_controller *phb);
> -void eeh_probe_devices(void);
> +void eeh_show_enabled(void);
>  int __init eeh_ops_register(struct eeh_ops *ops);
>  int __exit eeh_ops_unregister(const char *name);
>  int eeh_check_failure(const volatile void __iomem *token);
>  int eeh_dev_check_failure(struct eeh_dev *edev);
>  void eeh_addr_cache_init(void);
> -void eeh_addr_cache_build(void);
>  void eeh_add_device_early(struct pci_dn *);
>  void eeh_add_device_tree_early(struct pci_dn *);
>  void eeh_add_device_late(struct pci_dev *);
> @@ -333,7 +332,7 @@ static inline bool eeh_enabled(void)
>          return false;
>  }
>
> -static inline void eeh_probe_devices(void) { }
> +static inline void eeh_show_enabled(void) { }
>
>  static inline void *eeh_dev_init(struct pci_dn *pdn, void *data)
>  {
> @@ -351,8 +350,6 @@ static inline int eeh_check_failure(const volatile vo=
id __iomem *token)
>
>  static inline void eeh_addr_cache_init(void) { }
>
> -static inline void eeh_addr_cache_build(void) { }
> -
>  static inline void eeh_add_device_early(struct pci_dn *pdn) { }
>
>  static inline void eeh_add_device_tree_early(struct pci_dn *pdn) { }
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 1ed80adb40a1..f905235f0307 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -163,6 +163,16 @@ static int __init eeh_setup(char *str)
>  }
>  __setup("eeh=3D", eeh_setup);
>
> +void eeh_show_enabled(void)
> +{
> +       if (eeh_has_flag(EEH_FORCE_DISABLED))
> +               pr_info("EEH: Recovery disabled by kernel parameter.\n");
> +       else if (eeh_has_flag(EEH_ENABLED))
> +               pr_info("EEH: Capable adapter found: recovery enabled.\n"=
);
> +       else
> +               pr_info("EEH: No capable adapters found: recovery disable=
d.\n");
> +}
> +
>  /*
>   * This routine captures assorted PCI configuration space data
>   * for the indicated PCI device, and puts them into a buffer
> @@ -1156,23 +1166,6 @@ static struct notifier_block eeh_reboot_nb =3D {
>         .notifier_call =3D eeh_reboot_notifier,
>  };
>

> -void eeh_probe_devices(void)
> -{
> -       struct pci_controller *hose, *tmp;
> -       struct pci_dn *pdn;
> -
> -       /* Enable EEH for all adapters */
> -       list_for_each_entry_safe(hose, tmp, &hose_list, list_node) {
> -               pdn =3D hose->pci_data;
> -               traverse_pci_dn(pdn, eeh_ops->probe, NULL);
> -       }
> -       if (eeh_enabled())
> -               pr_info("EEH: PCI Enhanced I/O Error Handling Enabled\n")=
;
> -       else
> -               pr_info("EEH: No capable adapters found\n");
> -
> -}

The one concern I have about this is that PAPR requires us to enable
EEH for the device before we do any config accesses. From PAPR:

R1=E2=80=937.3.11.1=E2=80=935. For the EEH option: If a device driver is go=
ing to
enable EEH and the platform has not defaulted
to EEH enabled, then it must do so before it does any operations with
its IOA, including any configuration
cycles or Load or Store operations.

So if we want to be strictly compatible we'd need to ensure the
set-eeh-option RTAS call happens before we read the VDID in
pci_scan_device(). The pseries eeh_probe() function does this
currently, but if we defer it until the pcibios call happens we'll
have done a pile of config accesses before then. Maybe it doesn't
matter, but we'd need to do further testing under phyp or work out
some other way to ensure it's done pre-probe.

>  /**
>   * eeh_init - EEH initialization
>   *
> diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_ca=
che.c
> index f93dd5cf6a39..c40078d036af 100644
> --- a/arch/powerpc/kernel/eeh_cache.c
> +++ b/arch/powerpc/kernel/eeh_cache.c
> @@ -278,38 +278,6 @@ void eeh_addr_cache_init(void)
>         spin_lock_init(&pci_io_addr_cache_root.piar_lock);
>  }
>
> -/**
> - * eeh_addr_cache_build - Build a cache of I/O addresses
> - *
> - * Build a cache of pci i/o addresses.  This cache will be used to
> - * find the pci device that corresponds to a given address.
> - * This routine scans all pci busses to build the cache.
> - * Must be run late in boot process, after the pci controllers
> - * have been scanned for devices (after all device resources are known).
> - */
> -void eeh_addr_cache_build(void)
> -{
> -       struct pci_dn *pdn;
> -       struct eeh_dev *edev;
> -       struct pci_dev *dev =3D NULL;
> -
> -       for_each_pci_dev(dev) {
> -               pdn =3D pci_get_pdn_by_devfn(dev->bus, dev->devfn);
> -               if (!pdn)
> -                       continue;
> -
> -               edev =3D pdn_to_eeh_dev(pdn);
> -               if (!edev)
> -                       continue;
> -
> -               dev->dev.archdata.edev =3D edev;
> -               edev->pdev =3D dev;
> -
> -               eeh_addr_cache_insert_dev(dev);
> -               eeh_sysfs_add_device(dev);
> -       }
> -}
> -
>  static int eeh_addr_cache_show(struct seq_file *s, void *v)
>  {
>         struct pci_io_addr_range *piar;
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/=
platforms/powernv/eeh-powernv.c
> index 90729d908a54..22a94f4b8586 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -259,9 +259,7 @@ int pnv_eeh_post_init(void)
>         struct pnv_phb *phb;
>         int ret =3D 0;
>
> -       /* Probe devices & build address cache */
> -       eeh_probe_devices();
> -       eeh_addr_cache_build();
> +       eeh_show_enabled();
>
>         /* Register OPAL event notifier */
>         eeh_event_irq =3D opal_event_request(ilog2(OPAL_EVENT_PCI_ERROR))=
;
> diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platform=
s/pseries/pci.c
> index 37a77e57893e..d6a5f4f27507 100644
> --- a/arch/powerpc/platforms/pseries/pci.c
> +++ b/arch/powerpc/platforms/pseries/pci.c
> @@ -242,8 +242,7 @@ void __init pSeries_final_fixup(void)
>
>         pSeries_request_regions();
>
> -       eeh_probe_devices();
> -       eeh_addr_cache_build();
> +       eeh_show_enabled();
>
>  #ifdef CONFIG_PCI_IOV
>         ppc_md.pcibios_sriov_enable =3D pseries_pcibios_sriov_enable;
> --
> 2.19.0.2.gcad72f5712
>
