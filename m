Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C11749DE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 23:49:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VM6C0mdbzDrC8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 09:49:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=09+H6QEX; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VM4d5WH9zDr8C
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Mar 2020 09:48:01 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id g96so6095925otb.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 14:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8rTAnPPQPQ2zDwIh6KNULPqO4A3SBF/aTaf3+a0KIRA=;
 b=09+H6QEX0IFkK+L3p4GHO6Y0ATs+adHreQcu1bdLJyN+n2Vgctq6CmsN235zfYz7cz
 Zjowwp86NseHUm8hZsO+r0jOlHoaSUrXGunU/rqFwsJ1s7n5AN8EwU8Ta7ZV68MEDMoy
 cYFY629qtjE7k7S8TFWxiMwDorJu8ZM8TrjzCM6bvmFSocUCibA7lH7EUmIS6yLAffHg
 Ym9Ff+mKB4LVR21VHWSFek6dY5HD72PiWKRZfpQCH7KVSONiX3j+r8BDKOrr5WjC/edI
 3j/m/eKnMAevYsWQnEm1mQYYcl4k+knJqW8Hze1OVUGbNTe30vZzkPj3LXSahhmiaB5B
 dHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8rTAnPPQPQ2zDwIh6KNULPqO4A3SBF/aTaf3+a0KIRA=;
 b=KZpnPQD3yy42tegcUMym9pWFO/99TZC5uUQznxMsRqHer9wX656CkVL/zgEpTP+ZGZ
 S+gZvxDZi5FIleBxaFWoBpkZq9BOWY7JeIIzqNdu4oIX1xC+KqztDq3st8WnNixlXHqg
 yXb9GfW9eHYphvZeFjqN4I0a44JB38AC50LAsQICq4AQ7VecPqTALPzzT8+6molMHCSC
 SN6uJ9m8mw0S5dzy8If8cXthXpYDgcIv8o4CkLDlVDdEQbpepTfkSKn8Ikn0N0iX9BPf
 o6zjoG9dY95CiWscOaJvU4s49dl1kYx7Ue01S0Hv/ZOscchc6ubmAWFbs/cvYipqmE2y
 7EQw==
X-Gm-Message-State: APjAAAV+7opTJiftfqTUIR9tqdW5qNtOpo/2uvMZdkRKmcgOyQZoChCw
 h+TIjo65OGTM8n0p+oY3GR3gBPLv202tJCshinaoXQ==
X-Google-Smtp-Source: APXvYqwSzpqJpUKxRtH4EHX0XgauIJ4nXMymmXz192v5Aj+PoXy5ct4ECYTcjg/oqiVXoujFwDEj//qBNgc38LEqyHw=
X-Received: by 2002:a9d:5d09:: with SMTP id b9mr8013603oti.207.1583016478029; 
 Sat, 29 Feb 2020 14:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20200221182503.28317-1-logang@deltatee.com>
 <20200221182503.28317-8-logang@deltatee.com>
In-Reply-To: <20200221182503.28317-8-logang@deltatee.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sat, 29 Feb 2020 14:47:47 -0800
Message-ID: <CAPcyv4gNi3sesGnujShStoF8bi8kYg+MQkqhQRCT_1+wex5wbw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] mm/memremap: Set caching mode for PCI P2PDMA
 memory to WC
To: Logan Gunthorpe <logang@deltatee.com>
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
Cc: linux-ia64@vger.kernel.org, Linux-sh <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390 <linux-s390@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Michal Hocko <mhocko@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Eric Badger <ebadger@gigaio.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 21, 2020 at 10:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
> PCI BAR IO memory should never be mapped as WB, however prior to this
> the PAT bits were set WB and it was typically overridden by MTRR
> registers set by the firmware.
>
> Set PCI P2PDMA memory to be WC (writecombining) as the only current
> user (the NVMe CMB) was originally mapped WC before the P2PDMA code
> replaced the mapping with devm_memremap_pages().

Will the change to UC regress this existing use case?

>
> Future use-cases may need to generalize this by adding flags to
> select the caching type, as some P2PDMA cases will not want WC.
> However, those use-cases are not upstream yet and this can be changed
> when they arrive.
>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---
>  mm/memremap.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 06742372a203..8d141c3e3364 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -190,7 +190,10 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>                 }
>                 break;
>         case MEMORY_DEVICE_DEVDAX:
> +               need_devmap_managed = false;
> +               break;
>         case MEMORY_DEVICE_PCI_P2PDMA:
> +               params.pgprot = pgprot_writecombine(params.pgprot);

Approach looks good to me, modulo Jason's comment that this should be
UC. Upcoming DAX changes will want to pass this via pgmap, but as you
say this can wait for this changes to arrive.

After change to UC:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
