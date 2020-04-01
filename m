Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 344FC19A80C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 10:58:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sg8b3TTLzDr3X
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 19:58:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UGfBm0OG; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sfxX6N5WzDqxQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 19:48:48 +1100 (AEDT)
Received: by mail-ed1-x541.google.com with SMTP id a20so28751470edj.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 01:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NFnQtMAv52vc67tP5TFOUo3bRsY9ihV28ROS9W2huxg=;
 b=UGfBm0OG6dm/aY2vbCbLWqdatsFbxQNSssJ6VGYhMiDq/OZ3CcwFMRXjdJP0AXYK7D
 qh0ra8EMgQmGzX4Fxxcv2zpRpA6bvmpNcGy3vpPXv3wvgBL5g1kIy0ijObNxfTpeqLe8
 zJQlvRgzdUnUwCw9a3vVQyhTkhOj1bGwFPHvgJUavxqHY6EN1biqXsQJEuRb2ZAx1+la
 bIBqqpPryQe7pXTndun8sNc9rg9fyRYz2RGUeOFAXiGwD9NEgCHUS1mhusff7WG/rzRe
 rFzKfqWGnLyr5HwxUXqFoo2mpn0Y5mBOQNJqTToIbYTuOKzCLXGk0bf6ytMk5SVA0IRX
 r6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFnQtMAv52vc67tP5TFOUo3bRsY9ihV28ROS9W2huxg=;
 b=jXivyLdU73Gk6gGmbf+kTsyH8n9wmJoMbGzAm2zY9PhZKNiQBApytCNgLAkIQsFmRY
 eE7dAiYVn7jMVU+f0ZPS/aFu6XR0Pusfb0CbV1XAXsAzRw8wNSK+9fhKdVpncuAy6H0R
 2reuR7vH7hgH+BMtWpX22PIiqNNhFf0MdupZ4cgV3fmJXqg/UAWJAaBU8i4NhJp3QpBo
 ntgP7JftUeHfr+37juhLSUCq2sPEUtyGqqLvKfKlcGqRatZot5Y88TCRXf/k37B2T4As
 Mh8Zu3IIF+NoaUBNoZ4mayfHjbFyhlbsBDwO62eZo4uduj7IVkFNaIQAPbyTI118sg/Y
 OU8w==
X-Gm-Message-State: ANhLgQ3BXWS3XOOu4rbmXGpF66oCdqZjZnDbu6HzUTtURpuo4IOPzFJK
 oCniubZzt3bvDluGkObyc/wRoMflEOlXoPYa/GitkA==
X-Google-Smtp-Source: ADFU+vudGlnJtN5ZeSeIRWxrez165WdBj7a1Bu0ZFHM+ccZlxf9ge6aKX/I8+gF5fOEuZLiG5EzKhnaDmM289WwDWgA=
X-Received: by 2002:a50:d847:: with SMTP id v7mr19478119edj.154.1585730924056; 
 Wed, 01 Apr 2020 01:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-4-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-4-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 01:48:32 -0700
Message-ID: <CAPcyv4iGEHJpZctEm+Do1-kOZBUDeKKcREr=BqcK4kCvLWhAQQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/25] powerpc/powernv: Map & release OpenCAPI LPC
 memory
To: "Alastair D'Silva" <alastair@d-silva.org>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva <alastair@d-silva.org> wrote:
>
> This patch adds OPAL calls to powernv so that the OpenCAPI
> driver can map & release LPC (Lowest Point of Coherency)  memory.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/pnv-ocxl.h   |  2 ++
>  arch/powerpc/platforms/powernv/ocxl.c | 43 +++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/pnv-ocxl.h b/arch/powerpc/include/asm/pnv-ocxl.h
> index 7de82647e761..560a19bb71b7 100644
> --- a/arch/powerpc/include/asm/pnv-ocxl.h
> +++ b/arch/powerpc/include/asm/pnv-ocxl.h
> @@ -32,5 +32,7 @@ extern int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
>
>  extern int pnv_ocxl_alloc_xive_irq(u32 *irq, u64 *trigger_addr);
>  extern void pnv_ocxl_free_xive_irq(u32 irq);
> +u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size);
> +void pnv_ocxl_platform_lpc_release(struct pci_dev *pdev);
>
>  #endif /* _ASM_PNV_OCXL_H */
> diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
> index 8c65aacda9c8..f13119a7c026 100644
> --- a/arch/powerpc/platforms/powernv/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/ocxl.c
> @@ -475,6 +475,49 @@ void pnv_ocxl_spa_release(void *platform_data)
>  }
>  EXPORT_SYMBOL_GPL(pnv_ocxl_spa_release);
>
> +u64 pnv_ocxl_platform_lpc_setup(struct pci_dev *pdev, u64 size)
> +{
> +       struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> +       struct pnv_phb *phb = hose->private_data;

Is calling the local variable 'hose' instead of 'host' on purpose?

> +       u32 bdfn = pci_dev_id(pdev);
> +       __be64 base_addr_be64;
> +       u64 base_addr;
> +       int rc;
> +
> +       rc = opal_npu_mem_alloc(phb->opal_id, bdfn, size, &base_addr_be64);
> +       if (rc) {
> +               dev_warn(&pdev->dev,
> +                        "OPAL could not allocate LPC memory, rc=%d\n", rc);
> +               return 0;
> +       }
> +
> +       base_addr = be64_to_cpu(base_addr_be64);
> +
> +#ifdef CONFIG_MEMORY_HOTPLUG_SPARSE

With the proposed cleanup in patch2 the ifdef can be elided here.

> +       rc = check_hotplug_memory_addressable(base_addr >> PAGE_SHIFT,
> +                                             size >> PAGE_SHIFT);
> +       if (rc)
> +               return 0;

Is this an error worth logging if someone is wondering why their
device is not showing up?


> +#endif
> +
> +       return base_addr;
> +}
> +EXPORT_SYMBOL_GPL(pnv_ocxl_platform_lpc_setup);
> +
> +void pnv_ocxl_platform_lpc_release(struct pci_dev *pdev)
> +{
> +       struct pci_controller *hose = pci_bus_to_host(pdev->bus);
> +       struct pnv_phb *phb = hose->private_data;
> +       u32 bdfn = pci_dev_id(pdev);
> +       int rc;
> +
> +       rc = opal_npu_mem_release(phb->opal_id, bdfn);
> +       if (rc)
> +               dev_warn(&pdev->dev,
> +                        "OPAL reported rc=%d when releasing LPC memory\n", rc);
> +}
> +EXPORT_SYMBOL_GPL(pnv_ocxl_platform_lpc_release);
> +
>  int pnv_ocxl_spa_remove_pe_from_cache(void *platform_data, int pe_handle)
>  {
>         struct spa_data *data = (struct spa_data *) platform_data;
> --
> 2.24.1
>
