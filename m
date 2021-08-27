Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5A3F94B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 08:59:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwrF14t5Pz3086
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 16:59:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ahob/aCa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ahob/aCa; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwrDK4rwrz2yPq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 16:59:11 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id m4so3389897pll.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 23:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Rqn+GrCddwb17438Eb7/acjTBeKWly1ebyK4GCadnFc=;
 b=Ahob/aCaoxGGmBX3uT/2Oo+coR/T1tys8xgPUYlJZHQ+79x1W7tMhNYHihEb3g00Pw
 m+dgL0BLb9DG6XuqQrGIlpqK11vUr+Y2ytYHZ7LdTBFa1tFBJE3STgSjF41FypNGQroh
 EB33JFOQSvpQcvOA/KVG6FqtXl7O0+BT+q4qQg5vtIojCX29E2kJoRY1MRvb3ovAgDbp
 aFXAm0ssP0g7n3TLr2XOHHUaLQbsPjFKeMCjJaff6OnyliY0dDUUm9ACwqxN5BizOny5
 6o6R1k1p3THp4VGKPD1gPgbF9N5SJmHFccehHvyHptaqGZoYeq1bOsTJYfzYeYbXFcTi
 n8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Rqn+GrCddwb17438Eb7/acjTBeKWly1ebyK4GCadnFc=;
 b=FstEEy/AisEuN8d3AMzeUqzleDXv13mISTcI61sbNnGOT8ni0Uv8XWpg8ko6s1ELOn
 m/zhSD6tJZsfZ/S20f11rMkSL8zcWWe9hLjEnDJl2WQUm/xXoj7okpJzXWopEaJcSjk8
 +0G0W90ZltcPnmQyL924GqJCsNa3GQ4BBHm6q4r/OV5bK8HEouaxOiKxzbM6Q6/QsbJd
 6MnknNmvAIHRngYoPWjesq9T4sKfURxv9jMt98MZgEHgDPmNOV1WSSgBwx6d+zrZ0Ry8
 NGiKz7qzXEqtCGrw1fR4d2mBHWuFOaD0UPncgVsT2VFuU8h+khYy6JXDvIqmF/T6QXUI
 TeUw==
X-Gm-Message-State: AOAM5330BjDwr9NOL+00GrOkCxWgoC1cin/H7K/p+iUdGdkPXy5W/PUo
 hzIO/L8TgxoMMFoBFS2KscUPrZrikXBr+qQIE4E=
X-Google-Smtp-Source: ABdhPJzbMPfKsiNwRsmJ6wf35o+bM3Vsllxj/xaKs1Zg3gEKi2+LtrBilr6TwQqyx2Jk+YbMtx83ULLwDM5rxvcqh8o=
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr7349833pls.17.1630047548297; Thu, 26 Aug
 2021 23:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-11-tientzu@chromium.org>
In-Reply-To: <20210624155526.2775863-11-tientzu@chromium.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 27 Aug 2021 09:58:32 +0300
Message-ID: <CAHp75VfVhVGFEQGeUKajrUKmkx_et_KakDDgroC2BrMMhd62yg@mail.gmail.com>
Subject: Re: [PATCH v15 10/12] swiotlb: Add restricted DMA pool initialization
To: Claire Chang <tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, daniel@ffwll.ch, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Juergen Gross <jgross@suse.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 quic_qiancai@quicinc.com, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 thomas.lendacky@amd.com, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 24, 2021 at 6:59 PM Claire Chang <tientzu@chromium.org> wrote:
>
> Add the initialization function to create restricted DMA pools from
> matching reserved-memory nodes.
>
> Regardless of swiotlb setting, the restricted DMA pool is preferred if
> available.
>
> The restricted DMA pools provide a basic level of protection against the
> DMA overwriting buffer contents at unexpected times. However, to protect
> against general data leakage and system memory corruption, the system
> needs to provide a way to lock down the memory access, e.g., MPU.





> +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> +                                   struct device *dev)
> +{
> +       struct io_tlb_mem *mem =3D rmem->priv;
> +       unsigned long nslabs =3D rmem->size >> IO_TLB_SHIFT;
> +
> +       /*
> +        * Since multiple devices can share the same pool, the private da=
ta,
> +        * io_tlb_mem struct, will be initialized by the first device att=
ached
> +        * to it.
> +        */

> +       if (!mem) {

Can it be rather

if (mem)
  goto out_assign;

or so?

> +               mem =3D kzalloc(struct_size(mem, slots, nslabs), GFP_KERN=
EL);
> +               if (!mem)
> +                       return -ENOMEM;
> +
> +               set_memory_decrypted((unsigned long)phys_to_virt(rmem->ba=
se),
> +                                    rmem->size >> PAGE_SHIFT);

Below you are using a macro from pfn.h, but not here, I think it's PFN_DOWN=
().

> +               swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
> +               mem->force_bounce =3D true;
> +               mem->for_alloc =3D true;
> +
> +               rmem->priv =3D mem;
> +
> +               if (IS_ENABLED(CONFIG_DEBUG_FS)) {
> +                       mem->debugfs =3D
> +                               debugfs_create_dir(rmem->name, debugfs_di=
r);
> +                       swiotlb_create_debugfs_files(mem);
> +               }
> +       }
> +
> +       dev->dma_io_tlb_mem =3D mem;
> +
> +       return 0;
> +}
> +
> +static void rmem_swiotlb_device_release(struct reserved_mem *rmem,
> +                                       struct device *dev)
> +{
> +       dev->dma_io_tlb_mem =3D io_tlb_default_mem;
> +}
> +
> +static const struct reserved_mem_ops rmem_swiotlb_ops =3D {
> +       .device_init =3D rmem_swiotlb_device_init,
> +       .device_release =3D rmem_swiotlb_device_release,
> +};
> +
> +static int __init rmem_swiotlb_setup(struct reserved_mem *rmem)
> +{
> +       unsigned long node =3D rmem->fdt_node;
> +
> +       if (of_get_flat_dt_prop(node, "reusable", NULL) ||
> +           of_get_flat_dt_prop(node, "linux,cma-default", NULL) ||
> +           of_get_flat_dt_prop(node, "linux,dma-default", NULL) ||
> +           of_get_flat_dt_prop(node, "no-map", NULL))
> +               return -EINVAL;
> +
> +       if (PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
> +               pr_err("Restricted DMA pool must be accessible within the=
 linear mapping.");
> +               return -EINVAL;
> +       }
> +
> +       rmem->ops =3D &rmem_swiotlb_ops;
> +       pr_info("Reserved memory: created restricted DMA pool at %pa, siz=
e %ld MiB\n",
> +               &rmem->base, (unsigned long)rmem->size / SZ_1M);

Oh l=C3=A0 l=C3=A0, besides explicit casting that I believe can be avoided,=
 %ld
!=3D unsigned long. Can you check the printk-formats.rst document?

> +       return 0;
> +}
> +
> +RESERVEDMEM_OF_DECLARE(dma, "restricted-dma-pool", rmem_swiotlb_setup);
>  #endif /* CONFIG_DMA_RESTRICTED_POOL */

--=20
With Best Regards,
Andy Shevchenko
