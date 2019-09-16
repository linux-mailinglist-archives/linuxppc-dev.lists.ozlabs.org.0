Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8482B3FBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 19:48:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XDHQ5v2pzDrPB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 03:48:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="sGHgEALC"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XDFM6NvLzF3FL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 03:46:24 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id z26so648843oto.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 10:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QMOOvJcCOxvJGsQgO09ry9PIYgCnyHRaKHcmKjPMZDE=;
 b=sGHgEALCuEWB5ciy5vD0LBEP7OLBzMNFaPlQpilKVRzFeMz5JJHbuFQLj4PpNzUxPp
 FPdyG5nmqrAHieCHI3kNe4+51PPvluEc2panvSJRp/Vr78fXeOMN9J9AO8MNb2YDHmNY
 /B/x8b6XVp+VTZMNTlc4LHA6oWdGlrcPKrTrl0BLRV0W+5L1oFNWOqLJX5YXtM0en7/r
 orWUlsrnBAdgXUkqvm50ASXBbVpsUCnJMXSFFyNz3g675XJaH9ifvjpIjcc7Zpnm2tHU
 AHRzvUC/EUHEfUhb6CDI+p2UWpvUDtd/dXlfR4skq7vfp6oCyOXgqn9GU1VDcWJKaHL5
 3piQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMOOvJcCOxvJGsQgO09ry9PIYgCnyHRaKHcmKjPMZDE=;
 b=hlaNq1bHE2Z+HJS+XnibNGu0tcgQT44lzECjmk12bao2krCStfT3V8YJWsijOWRXhJ
 7Dd9XSbjHtqi+MwHfgr8SVWGDBkAFnxpHIrLOJntJsNvrETmilT6j0YEh9S+AJ+zfY6i
 z+fq/VkQsH/2i+2ef6fZabMUdNp+y1FFsUVFuRVPF6Jc8n/dyt2vSXd2bwcAMRGh7wNK
 IrfYziZHjQKjNy5+KLl7juKuy+wHa+8Kj7WHIe9wUDT6B8kC7AxAOnFZ0ehcSNqcgWve
 zy2Y+iHvgiTrgo/c9DnvIyL9FU7yPigRdQGVUgHRHWQDRo+LJfAL2Nyp6VUZPhrONruK
 5Isw==
X-Gm-Message-State: APjAAAVZhXwACPv1OTAfqn/2b3DtQD2ogYa8K/wpGPaUZTB/rc0AJQPA
 DNrP1P2QTOLfLSk/0QSyEpothzjhHVG6NgEUvqP+HQ==
X-Google-Smtp-Source: APXvYqz8wwo7dB4Y3wRdLSUJkJjWQZmRljho5XvoU+unxbG7cxvDpcHYJWPfu6CFzQU4tdjicuiHDUtxjbkXi176AnU=
X-Received: by 2002:a9d:3a6:: with SMTP id f35mr263028otf.363.1568655981118;
 Mon, 16 Sep 2019 10:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190910062826.10041-1-aneesh.kumar@linux.ibm.com>
 <20190910062826.10041-2-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20190910062826.10041-2-aneesh.kumar@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 16 Sep 2019 10:46:10 -0700
Message-ID: <CAPcyv4ia0_GUu+=j-ecCuJkqaE5dVENNQxK_S-mO_KBmuA=9hw@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/nvdimm: Update vmemmap_populated to check
 sub-section range
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 9, 2019 at 11:29 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> With commit: 7cc7867fb061 ("mm/devm_memremap_pages: enable sub-section remap")
> pmem namespaces are remapped in 2M chunks. On architectures like ppc64 we
> can map the memmap area using 16MB hugepage size and that can cover
> a memory range of 16G.
>
> While enabling new pmem namespaces, since memory is added in sub-section chunks,
> before creating a new memmap mapping, kernel should check whether there is an
> existing memmap mapping covering the new pmem namespace. Currently, this is
> validated by checking whether the section covering the range is already
> initialized or not. Considering there can be multiple namespaces in the same
> section this can result in wrong validation. Update this to check for
> sub-sections in the range. This is done by checking for all pfns in the range we
> are mapping.
>
> We could optimize this by checking only just one pfn in each sub-section. But
> since this is not fast-path we keep this simple.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/init_64.c | 45 ++++++++++++++++++++-------------------
>  1 file changed, 23 insertions(+), 22 deletions(-)
>
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index 4e08246acd79..7710ccdc19a2 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -70,30 +70,24 @@ EXPORT_SYMBOL_GPL(kernstart_addr);
>
>  #ifdef CONFIG_SPARSEMEM_VMEMMAP
>  /*
> - * Given an address within the vmemmap, determine the pfn of the page that
> - * represents the start of the section it is within.  Note that we have to
> - * do this by hand as the proffered address may not be correctly aligned.
> - * Subtraction of non-aligned pointers produces undefined results.
> - */
> -static unsigned long __meminit vmemmap_section_start(unsigned long page)
> -{
> -       unsigned long offset = page - ((unsigned long)(vmemmap));
> -
> -       /* Return the pfn of the start of the section. */
> -       return (offset / sizeof(struct page)) & PAGE_SECTION_MASK;
> -}
> -
> -/*
> - * Check if this vmemmap page is already initialised.  If any section
> + * Check if this vmemmap page is already initialised.  If any sub section
>   * which overlaps this vmemmap page is initialised then this page is
>   * initialised already.
>   */
> -static int __meminit vmemmap_populated(unsigned long start, int page_size)
> +
> +static int __meminit vmemmap_populated(unsigned long start, int size)
>  {
> -       unsigned long end = start + page_size;
> -       start = (unsigned long)(pfn_to_page(vmemmap_section_start(start)));
> +       unsigned long end = start + size;
>
> -       for (; start < end; start += (PAGES_PER_SECTION * sizeof(struct page)))
> +       /* start is size aligned and it is always > sizeof(struct page) */
> +       VM_BUG_ON(start & sizeof(struct page));

If start is size aligned why not include that assumption in the VM_BUG_ON()?

Otherwise it seems this patch could be reduced simply by:

s/PAGE_SECTION_MASK/PAGE_SUBSECTION_MASK/
s/PAGES_PER_SECTION/PAGES_PER_SUBSECTION/

...and leave the vmemmap_section_start() function in place? In other
words this path used to guarantee that 'start' was aligned to the
minimum mem-hotplug granularity, the change looks ok on the surface,
but it seems a subtle change in semantics.

Can you get an ack from a powerpc maintainer, or maybe this patch
should route through the powerpc tree?

I'll take patch1 through the nvdimm tree.
