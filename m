Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655CC3A0A82
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 05:09:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0Bt45ZLlz3bxb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 13:09:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=u6SGIGRx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=u6SGIGRx; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0BsZ37FKz300Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 13:09:20 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id c124so22404883qkd.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 20:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=F64qVructnWzJh2UCdmrGDFp9pNzOx+GVrSxuZ12oEU=;
 b=u6SGIGRxJIbSvDi8qBdZKctSymsdf/VNWDDCE709TCy6tubvmmrnEBL7kIdmuMdpGb
 l58Mu7sjq0SXyvRYXRG/IEGIdJNclEIXrlt5KZVfojBFh2ZtbHF/7sY8sYsxC9KrgRxv
 MBmQtbwkYsLj4zzEq3pSdksMUeWmaiS132nFmNc6QHEV3LPkOmlrKaneDCC4vPm3Pwc7
 MoIRMgcpXFjzJrBWsB/07zOODjCLTijrc/3aFkSieoHvURyzJYAfV1gWpl2HhzEV1ASw
 5CGDJaAVzJHYMAWYWJ8RlhZMFpgbz7unQNVTAAYa/oVFo6kPdSkUKYsSqS6KeF6ycEB6
 ARPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=F64qVructnWzJh2UCdmrGDFp9pNzOx+GVrSxuZ12oEU=;
 b=YsxuFTcTGK87qdB3R71qQhLi3ynrTcbtv3yLEueUwObSrHtwL+oE93v6Og2TkdSn79
 XDObU2cqVTIvLnEBsLch3PthGseN6fCY3Whj4EXBeH9JnLmPLgzQFJ2PUhxOJCghSE3c
 U7srznHGzy6QCUkCcAc8lyvZgeXL5d2FV7H8fINSfa3sj5HdtqPitTh9Mplbmzdmgl3X
 EhhX0IiIqCdPbJa0MiVI6BpWOYYbDjaL9C+k5YWfJHIj7sh1flHCHGvM3YO8c/FwSUT1
 D1/ZFZCQyEmy1+El6bxVKlfIu2mO9YBMw8+TyPe9VG1M1pGG4MTGFqygIlK5IHJda38a
 D/Qg==
X-Gm-Message-State: AOAM530s9FwCWCReeqxG8g/gPIXHyUDklKwDco/CSpxeugUrDJJFeH7d
 v3KE3DfdkG28WNizaKI4rBE=
X-Google-Smtp-Source: ABdhPJx33SaqdvcrUNooclzhfJhcaDkHhBOW7/lrNAfY8ru2PTGdQYcwI1K9l4cbjxoF8P5+3IzEiw==
X-Received: by 2002:a37:ad5:: with SMTP id 204mr24499320qkk.373.1623208156434; 
 Tue, 08 Jun 2021 20:09:16 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:87bb::1000? ([2804:14c:482:87bb::1000])
 by smtp.gmail.com with ESMTPSA id 7sm12735937qtu.38.2021.06.08.20.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 20:09:15 -0700 (PDT)
Message-ID: <2501d7b80d76ceb77678ad027ee6761fa8cd0ea3.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] powerpc/mm/hash: Avoid multiple HPT resize-ups
 on memory hotplug
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Wed, 09 Jun 2021 00:09:45 -0300
In-Reply-To: <YL2qKPhC2TrsFn6e@yekko>
References: <20210430143607.135005-1-leobras.c@gmail.com>
 <20210430143607.135005-3-leobras.c@gmail.com> <YL2qKPhC2TrsFn6e@yekko>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Scott Cheloha <cheloha@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Sandipan Das <sandipan@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2021-06-07 at 15:10 +1000, David Gibson wrote:
> On Fri, Apr 30, 2021 at 11:36:08AM -0300, Leonardo Bras wrote:
> > Every time a memory hotplug happens, and the memory limit crosses a
> > 2^n
> > value, it may be necessary to perform HPT resizing-up, which can
> > take
> > some time (over 100ms in my tests).
> > 
> > It usually is not an issue, but it can take some time if a lot of
> > memory
> > is added to a guest with little starting memory:
> > Adding 256G to a 2GB guest, for example will require 8 HPT resizes.
> > 
> > Perform an HPT resize before memory hotplug, updating HPT to its
> > final size (considering a successful hotplug), taking the number of
> > HPT resizes to at most one per memory hotplug action.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Thanks David!

> 
> > ---
> >  arch/powerpc/include/asm/book3s/64/hash.h     |  2 ++
> >  arch/powerpc/mm/book3s64/hash_utils.c         | 20
> > +++++++++++++++++++
> >  .../platforms/pseries/hotplug-memory.c        |  9 +++++++++
> >  3 files changed, 31 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/book3s/64/hash.h
> > b/arch/powerpc/include/asm/book3s/64/hash.h
> > index d959b0195ad9..fad4af8b8543 100644
> > --- a/arch/powerpc/include/asm/book3s/64/hash.h
> > +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> > @@ -255,6 +255,8 @@ int hash__create_section_mapping(unsigned long
> > start, unsigned long end,
> >                                  int nid, pgprot_t prot);
> >  int hash__remove_section_mapping(unsigned long start, unsigned
> > long end);
> >  
> > +void hash_batch_expand_prepare(unsigned long newsize);
> > +
> >  #endif /* !__ASSEMBLY__ */
> >  #endif /* __KERNEL__ */
> >  #endif /* _ASM_POWERPC_BOOK3S_64_HASH_H */
> > diff --git a/arch/powerpc/mm/book3s64/hash_utils.c
> > b/arch/powerpc/mm/book3s64/hash_utils.c
> > index 608e4ed397a9..3fa395b3fe57 100644
> > --- a/arch/powerpc/mm/book3s64/hash_utils.c
> > +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> > @@ -859,6 +859,26 @@ int hash__remove_section_mapping(unsigned long
> > start, unsigned long end)
> >  
> >         return rc;
> >  }
> > +
> > +void hash_batch_expand_prepare(unsigned long newsize)
> > +{
> > +       const u64 starting_size = ppc64_pft_size;
> > +
> > +       /*
> > +        * Resizing-up HPT should never fail, but there are some
> > cases system starts with higher
> > +        * SHIFT than required, and we go through the funny case of
> > resizing HPT down while
> > +        * adding memory
> > +        */
> > +
> > +       while (resize_hpt_for_hotplug(newsize, false) == -ENOSPC) {
> > +               newsize *= 2;
> > +               pr_warn("Hash collision while resizing HPT\n");
> > +
> > +               /* Do not try to resize to the starting size, or
> > bigger value */
> > +               if (htab_shift_for_mem_size(newsize) >=
> > starting_size)
> > +                       break;
> > +       }
> > +}
> >  #endif /* CONFIG_MEMORY_HOTPLUG */
> >  
> >  static void __init hash_init_partition_table(phys_addr_t
> > hash_table,
> > diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c
> > b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > index 8377f1f7c78e..48b2cfe4ce69 100644
> > --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> > +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/memory.h>
> >  #include <linux/memory_hotplug.h>
> >  #include <linux/slab.h>
> > +#include <linux/pgtable.h>
> >  
> >  #include <asm/firmware.h>
> >  #include <asm/machdep.h>
> > @@ -671,6 +672,10 @@ static int dlpar_memory_add_by_count(u32
> > lmbs_to_add)
> >         if (lmbs_available < lmbs_to_add)
> >                 return -EINVAL;
> >  
> > +       if (!radix_enabled())
> > +               hash_batch_expand_prepare(memblock_phys_mem_size()
> > +
> > +                                                lmbs_to_add *
> > drmem_lmb_size());
> > +
> >         for_each_drmem_lmb(lmb) {
> >                 if (lmb->flags & DRCONF_MEM_ASSIGNED)
> >                         continue;
> > @@ -788,6 +793,10 @@ static int dlpar_memory_add_by_ic(u32
> > lmbs_to_add, u32 drc_index)
> >         if (lmbs_available < lmbs_to_add)
> >                 return -EINVAL;
> >  
> > +       if (!radix_enabled())
> > +               hash_batch_expand_prepare(memblock_phys_mem_size()
> > +
> > +                                         lmbs_to_add *
> > drmem_lmb_size());
> > +
> >         for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> >                 if (lmb->flags & DRCONF_MEM_ASSIGNED)
> >                         continue;
> 
> -- 
> David Gibson                    | I'll have my music baroque, and my
> code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_
> _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson


