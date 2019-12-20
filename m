Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDD71278AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 10:59:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fPN31w97zDqmd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 20:58:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=jack@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fPKt6Sx3zDqvZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 20:57:04 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 40D27ACFE;
 Fri, 20 Dec 2019 09:57:01 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 9D3F61E0B44; Fri, 20 Dec 2019 10:57:00 +0100 (CET)
Date: Fri, 20 Dec 2019 10:57:00 +0100
From: Jan Kara <jack@suse.cz>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH] powerpc/book3s64: Fix error handling in
 mm_iommu_do_alloc()
Message-ID: <20191220095700.GB10068@quack2.suse.cz>
References: <20191211104226.20620-1-jack@suse.cz>
 <b760209b-b09a-2049-e0dd-ec0b3ed9a46c@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="uAKRQypu60I7Lcqm"
Content-Disposition: inline
In-Reply-To: <b760209b-b09a-2049-e0dd-ec0b3ed9a46c@ozlabs.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, Jan Kara <jack@suse.cz>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri 20-12-19 16:06:05, Alexey Kardashevskiy wrote:
> 
> 
> On 11/12/2019 21:42, Jan Kara wrote:
> > The last jump to free_exit in mm_iommu_do_alloc() happens after page
> > pointers in struct mm_iommu_table_group_mem_t were already converted to
> > physical addresses. Thus calling put_page() on these physical addresses
> > will likely crash. Convert physical addresses back to page pointers
> > during the error cleanup.
> > 
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > ---
> >  arch/powerpc/mm/book3s64/iommu_api.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> >  Beware, this is completely untested, spotted just by code audit.
> > 
> > diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
> > index 56cc84520577..06c403381c9c 100644
> > --- a/arch/powerpc/mm/book3s64/iommu_api.c
> > +++ b/arch/powerpc/mm/book3s64/iommu_api.c
> > @@ -154,7 +154,7 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
> >  				       (mem2->entries << PAGE_SHIFT)))) {
> >  			ret = -EINVAL;
> >  			mutex_unlock(&mem_list_mutex);
> > -			goto free_exit;
> > +			goto convert_exit;
> >  		}
> >  	}
> >  
> > @@ -166,6 +166,9 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
> >  
> >  	return 0;
> >  
> > +convert_exit:
> > +	for (i = 0; i < pinned; i++)
> > +		mem->hpages[i] = pfn_to_page(mem->hpas[i] >> PAGE_SHIFT);
> 
> 
> Good find. Although doing it where you added "goto convert_exit" seems
> cleaner imho. Thanks,

I don't really care :). V2 attached.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--uAKRQypu60I7Lcqm
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="0001-powerpc-book3s64-Fix-error-handling-in-mm_iommu_do_a.patch"

From 947c7a893c282b829a8623da73276a2fe56fdcd3 Mon Sep 17 00:00:00 2001
From: Jan Kara <jack@suse.cz>
Date: Wed, 11 Dec 2019 11:36:54 +0100
Subject: [PATCH v2] powerpc/book3s64: Fix error handling in mm_iommu_do_alloc()

The last jump to free_exit in mm_iommu_do_alloc() happens after page
pointers in struct mm_iommu_table_group_mem_t were already converted to
physical addresses. Thus calling put_page() on these physical addresses
will likely crash. Convert physical addresses back to page pointers
during the error cleanup.

Signed-off-by: Jan Kara <jack@suse.cz>
---
 arch/powerpc/mm/book3s64/iommu_api.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index 56cc84520577..1aa06584d783 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -154,6 +154,11 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 				       (mem2->entries << PAGE_SHIFT)))) {
 			ret = -EINVAL;
 			mutex_unlock(&mem_list_mutex);
+			/* Convert back to page pointers */
+			for (i = 0; i < pinned; i++) {
+				mem->hpages[i] =
+					pfn_to_page(mem->hpas[i] >> PAGE_SHIFT);
+			}
 			goto free_exit;
 		}
 	}
-- 
2.16.4


--uAKRQypu60I7Lcqm--
