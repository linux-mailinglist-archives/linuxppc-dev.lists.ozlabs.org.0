Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEE89465F4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 00:44:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UfmZwU1S;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dYjjT02d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbLVc0Htgz3dW8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 08:44:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UfmZwU1S;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dYjjT02d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WbLTw6Dy2z3cBd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2024 08:43:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722638621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kWgeUNWYR4zhRqTU3LJS1HQO1SCauqzxtnFFVDzZSg8=;
	b=UfmZwU1SOxfdongsFtlR2kvEGPfDaJEWZbqAnovePNowD72ls5S6gZs3TB8o2cDfmdFZOq
	4kjWiqJW2c6e996ab0kglJ5zfky+dPQtZb8WeBPWSsNBgEnl/zfmx1DAyQXeguX8GXtF6L
	rHvxizb1yFinoOLQbJLTCkr3iJTg2Z8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722638622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kWgeUNWYR4zhRqTU3LJS1HQO1SCauqzxtnFFVDzZSg8=;
	b=dYjjT02dH4yeT/xCcgwz33R59sehGqZTeVN3+Ri3EHhmVsX3buDi4iqHOE0UAYSmszKXuo
	telAb7h7Xenqh+aljBTw5XhVMZbgFK4Q6vpHjnOWyDFCMvZQlHGQy/W3KaCc0obipH6z+b
	GXJpH+kBHAkqWdqumFiGMHW3dD7kaQQ=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-tIrKIXDbM4u1ngVfRD8YXQ-1; Fri, 02 Aug 2024 18:43:40 -0400
X-MC-Unique: tIrKIXDbM4u1ngVfRD8YXQ-1
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e0ba329ed84so1300535276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2024 15:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722638620; x=1723243420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWgeUNWYR4zhRqTU3LJS1HQO1SCauqzxtnFFVDzZSg8=;
        b=E7o59Waw/3SIQy0xYrcJ/e3rR2GmFERpRbh49ye71XYmEpSyXNnFVPjNpB0gYQHNs7
         Twtcqh/FBDtmpglGKVGgVJyEkMGFtG3vvJfJIV7tMFJNhIXFUDoijHvLd0OyR/DCytNo
         1Uy3xizvFAAN6t2xuhTd34lC3e/wyMa1s9f+Pdb88rpMkIDr5EPf56SGOF4um1FwLDY5
         ezTuMHRSAXfbwHcTgZe2zI2/iSTx+q/9aTCiiy+pNP9DJb8rx9q2641qRf+CwjvAsISU
         E9JgEB1qsKyl9/aZ40TA6MtUJmmwtVa2PtYEAk3o5kwi80pYvGP+z/Ge1c2jPDZkhJlM
         uwUw==
X-Forwarded-Encrypted: i=1; AJvYcCWqshvS1jz7ELNlcTe1CQEJ5nOKschqae6KVVi1QToQf9Li4xouLF2Pcdt3W30pkX3W3FOHrWxvaoF2sjU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIdUFV8nnTOHNWagLCda/FEXOdqubmFr9+eVoY5uDEn9qIE5ry
	CMx2aMx+o4zK8R7uA1v/pasit6Kw8B7mk3TyouGpdnoUiAczl+1XM1R96NVL2+uD2CgThsyPgI1
	UwOlyVMMTBQoJT1fm+kf9bOUu4o8UlDYAAhNsNdSzQ7X+Xb7KZ/UmvSXHa4in8YQ=
X-Received: by 2002:a25:86c5:0:b0:dff:323d:349d with SMTP id 3f1490d57ef6-e0bdddea5a9mr3315504276.0.1722638619536;
        Fri, 02 Aug 2024 15:43:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1AyUDUh3wVU2WkxCi0wv9ZHC79ULJiqW9SIWuRQFDWWk8xWZ+YB+mfabn7aU3YWxCJojoWg==
X-Received: by 2002:a25:86c5:0:b0:dff:323d:349d with SMTP id 3f1490d57ef6-e0bdddea5a9mr3315469276.0.1722638619034;
        Fri, 02 Aug 2024 15:43:39 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f78b7a5sm123953885a.122.2024.08.02.15.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 15:43:38 -0700 (PDT)
Date: Fri, 2 Aug 2024 18:43:35 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 1/8] mm/dax: Dump start address in fault handler
Message-ID: <Zq1hF9tQwLnQhU0j@x1n>
References: <20240715192142.3241557-1-peterx@redhat.com>
 <20240715192142.3241557-2-peterx@redhat.com>
 <bca7a510-4f66-42b2-b4a7-40b3bd37ead6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bca7a510-4f66-42b2-b4a7-40b3bd37ead6@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 31, 2024 at 02:04:38PM +0200, David Hildenbrand wrote:
> On 15.07.24 21:21, Peter Xu wrote:
> > Currently the dax fault handler dumps the vma range when dynamic debugging
> > enabled.  That's mostly not useful.  Dump the (aligned) address instead
> > with the order info.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   drivers/dax/device.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> > index eb61598247a9..714174844ca5 100644
> > --- a/drivers/dax/device.c
> > +++ b/drivers/dax/device.c
> > @@ -235,9 +235,9 @@ static vm_fault_t dev_dax_huge_fault(struct vm_fault *vmf, unsigned int order)
> >   	int id;
> >   	struct dev_dax *dev_dax = filp->private_data;
> > -	dev_dbg(&dev_dax->dev, "%s: %s (%#lx - %#lx) order:%d\n", current->comm,
> > -			(vmf->flags & FAULT_FLAG_WRITE) ? "write" : "read",
> > -			vmf->vma->vm_start, vmf->vma->vm_end, order);
> > +	dev_dbg(&dev_dax->dev, "%s: op=%s addr=%#lx order=%d\n", current->comm,
> > +		(vmf->flags & FAULT_FLAG_WRITE) ? "write" : "read",
> > +		vmf->address & ~((1UL << (order + PAGE_SHIFT)) - 1), order);
> >   	id = dax_read_lock();
> >   	if (order == 0)
> 
> Agreed, the address of the fault is better. Just wondering, would the
> unmasked address be even better? Using the order we can figure out the
> to-be-aligned address.

From my very limited dax experience on monitoring these faults and making
sure huge mappings popped up correctly.. it's so far easier when we see
address properly aligned with order info.  But let me know if you still
prefer that, I'm fine with making that calculation simpler.

> 
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks for taking a look!

-- 
Peter Xu

