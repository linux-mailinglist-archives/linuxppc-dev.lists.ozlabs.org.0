Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A14DEC7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 03:48:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VM6W2JzBzDrNc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 11:48:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YwVLkyUO"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VM4q5zP6zDrM1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 11:47:21 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id k20so109124ios.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 18:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9yrO084oxG4dfNiDRfSabLfvEkBQAcPHS7taeQ/jeGI=;
 b=YwVLkyUOFNcOL0L8d9UZznf+xeeBIZ3g7ZUlrHDcDXBqLeWn0K9Nh1qZw9MCgGaBqb
 bsZDq3fFnLiUXnPvImtfor3a/phBY9+2zH+Do1BBqFhffuGg56NP49qLr/2sqGmf4RoD
 dBPVR54f6mQoB6gvXOLPeez5jvChN+nQ+jpNmWMt+CFi5AMLJhrJuktKhq3OI26jj6DA
 GrvQT8G1lfOsQWFP47xVxQLMf3WpyB4aq7PWUKYCOwYSjf13bJjzA0lXyuF7XawLdCyO
 7WDd+DM8NXTV1ediGy1tO6AcrJnwj7GMoiz5G4IZu2FIiAPzcKTPqdpqyD0E407nmjBU
 ZlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9yrO084oxG4dfNiDRfSabLfvEkBQAcPHS7taeQ/jeGI=;
 b=iaP8JpxFs5y4WGngVfIuE0lv6gAFXkCJs0zhjawwz//Tu4lW4nCj9Dao3GGEnoeJMy
 cJScmZDXit5y6XSNO08LXORtzj3byirUZyFmoI5PMyod+VSwT/RqG1/NonaWfHnZPVnA
 Ox61Pl0i0Gu7Y8O0+KHBVgWNzIvpHWVSCzbcLnegBePEKBi8dD0Ko+XrX+ZxEVdIEH5G
 W3N7jnE7OCkVP6MbskECX/RA1gXqn/2AGmkXMbN3IjkFdGMRCac/Vzf4UrE+dtVqyM8J
 hqsWh4OfK/G4eq2a8l3fvl4EKtUFgNZyy/A68q9AbBHFUC9RdjKxonGOSS8v65HRmRHt
 oBWw==
X-Gm-Message-State: APjAAAUTRjIdeDnJfUsfG0f6AQdp/G1r0X8ei7cP3RPHcl7MB5DfVxc1
 JtpHM3dWHuw9GA8zDJoQ+j7Elni9VgAoR9aIBSk=
X-Google-Smtp-Source: APXvYqxR8Ec8V67QRIv0YSxrqeF2qZ0ENo0zWc+r/BTUyQHPOeP071K+gI3WACD+zZ/Y6TZ2ZUXUkDwEBHuqzlrfHGY=
X-Received: by 2002:a5d:8497:: with SMTP id t23mr6017508iom.298.1561081638030; 
 Thu, 20 Jun 2019 18:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190523074924.19659-1-hch@lst.de>
 <20190523074924.19659-3-hch@lst.de>
In-Reply-To: <20190523074924.19659-3-hch@lst.de>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 21 Jun 2019 11:47:07 +1000
Message-ID: <CAOSf1CFu_T=7weW0eagzjTc8474ntVx1uCKdQh8sX85bfaPxCQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] powerpc/powernv: remove the unused tunneling exports
To: Christoph Hellwig <hch@lst.de>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2019 at 5:51 PM Christoph Hellwig <hch@lst.de> wrote:
>
> These have been unused ever since they've been added to the kernel.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/powerpc/include/asm/pnv-pci.h        |  4 --
>  arch/powerpc/platforms/powernv/pci-ioda.c |  4 +-
>  arch/powerpc/platforms/powernv/pci.c      | 71 -----------------------
>  arch/powerpc/platforms/powernv/pci.h      |  1 -
>  4 files changed, 3 insertions(+), 77 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/pnv-pci.h b/arch/powerpc/include/asm/pnv-pci.h
> index 9fcb0bc462c6..1ab4b0111abc 100644
> --- a/arch/powerpc/include/asm/pnv-pci.h
> +++ b/arch/powerpc/include/asm/pnv-pci.h
> @@ -27,12 +27,8 @@ extern int pnv_pci_get_power_state(uint64_t id, uint8_t *state);
>  extern int pnv_pci_set_power_state(uint64_t id, uint8_t state,
>                                    struct opal_msg *msg);
>
> -extern int pnv_pci_enable_tunnel(struct pci_dev *dev, uint64_t *asnind);
> -extern int pnv_pci_disable_tunnel(struct pci_dev *dev);
>  extern int pnv_pci_set_tunnel_bar(struct pci_dev *dev, uint64_t addr,
>                                   int enable);
> -extern int pnv_pci_get_as_notify_info(struct task_struct *task, u32 *lpid,
> -                                     u32 *pid, u32 *tid);

IIRC as-notify was for CAPI which has an in-tree driver (cxl). Fred or
Andrew (+cc), what's going on with this? Will it ever see the light of
day?

>  int pnv_phb_to_cxl_mode(struct pci_dev *dev, uint64_t mode);
>  int pnv_cxl_ioda_msi_setup(struct pci_dev *dev, unsigned int hwirq,
>                            unsigned int virq);
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 126602b4e399..6b0caa2d0425 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -54,6 +54,8 @@
>  static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_NVLINK",
>                                               "NPU_OCAPI" };
>
> +static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
> +
>  void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
>                             const char *fmt, ...)
>  {
> @@ -2360,7 +2362,7 @@ static long pnv_pci_ioda2_set_window(struct iommu_table_group *table_group,
>         return 0;
>  }
>
> -void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable)
> +static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable)
>  {
>         uint16_t window_id = (pe->pe_number << 1 ) + 1;
>         int64_t rc;
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index 8d28f2932c3b..fc69f5611020 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -868,54 +868,6 @@ struct device_node *pnv_pci_get_phb_node(struct pci_dev *dev)
>  }
>  EXPORT_SYMBOL(pnv_pci_get_phb_node);
>
> -int pnv_pci_enable_tunnel(struct pci_dev *dev, u64 *asnind)
> -{
> -       struct device_node *np;
> -       const __be32 *prop;
> -       struct pnv_ioda_pe *pe;
> -       uint16_t window_id;
> -       int rc;
> -
> -       if (!radix_enabled())
> -               return -ENXIO;
> -
> -       if (!(np = pnv_pci_get_phb_node(dev)))
> -               return -ENXIO;
> -
> -       prop = of_get_property(np, "ibm,phb-indications", NULL);
> -       of_node_put(np);
> -
> -       if (!prop || !prop[1])
> -               return -ENXIO;
> -
> -       *asnind = (u64)be32_to_cpu(prop[1]);
> -       pe = pnv_ioda_get_pe(dev);
> -       if (!pe)
> -               return -ENODEV;
> -
> -       /* Increase real window size to accept as_notify messages. */
> -       window_id = (pe->pe_number << 1 ) + 1;
> -       rc = opal_pci_map_pe_dma_window_real(pe->phb->opal_id, pe->pe_number,
> -                                            window_id, pe->tce_bypass_base,
> -                                            (uint64_t)1 << 48);
> -       return opal_error_code(rc);
> -}
> -EXPORT_SYMBOL_GPL(pnv_pci_enable_tunnel);
> -
> -int pnv_pci_disable_tunnel(struct pci_dev *dev)
> -{
> -       struct pnv_ioda_pe *pe;
> -
> -       pe = pnv_ioda_get_pe(dev);
> -       if (!pe)
> -               return -ENODEV;
> -
> -       /* Restore default real window size. */
> -       pnv_pci_ioda2_set_bypass(pe, true);
> -       return 0;
> -}
> -EXPORT_SYMBOL_GPL(pnv_pci_disable_tunnel);
> -
>  int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
>  {
>         __be64 val;
> @@ -970,29 +922,6 @@ int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
>  }
>  EXPORT_SYMBOL_GPL(pnv_pci_set_tunnel_bar);
>
> -#ifdef CONFIG_PPC64    /* for thread.tidr */
> -int pnv_pci_get_as_notify_info(struct task_struct *task, u32 *lpid, u32 *pid,
> -                              u32 *tid)
> -{
> -       struct mm_struct *mm = NULL;
> -
> -       if (task == NULL)
> -               return -EINVAL;
> -
> -       mm = get_task_mm(task);
> -       if (mm == NULL)
> -               return -EINVAL;
> -
> -       *pid = mm->context.id;
> -       mmput(mm);
> -
> -       *tid = task->thread.tidr;
> -       *lpid = mfspr(SPRN_LPID);
> -       return 0;
> -}
> -EXPORT_SYMBOL_GPL(pnv_pci_get_as_notify_info);
> -#endif
> -
>  void pnv_pci_shutdown(void)
>  {
>         struct pci_controller *hose;
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index 4f11c077af62..469c24463247 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -195,7 +195,6 @@ extern int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type);
>  extern void pnv_teardown_msi_irqs(struct pci_dev *pdev);
>  extern struct pnv_ioda_pe *pnv_ioda_get_pe(struct pci_dev *dev);
>  extern void pnv_set_msi_irq_chip(struct pnv_phb *phb, unsigned int virq);
> -extern void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
>  extern unsigned long pnv_pci_ioda2_get_table_size(__u32 page_shift,
>                 __u64 window_size, __u32 levels);
>  extern int pnv_eeh_post_init(void);
> --
> 2.20.1
>
