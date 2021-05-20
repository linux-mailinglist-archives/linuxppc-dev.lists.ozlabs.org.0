Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C69B9389B49
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 04:19:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fltj35ZbTz3bnR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 12:19:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aMy+3gB9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BaeI4QYa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aMy+3gB9; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=BaeI4QYa; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlthX06hyz2yXb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 12:18:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621477127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sHDqMefuS0jfZY78aneKv+C4tqai2cafaPaE1zr9kR4=;
 b=aMy+3gB9J5QTPEyxjN2/r/RI7Sz4WA2SyLr4r8s5GgXd9qgfAhRXLQ7tnqWUrRCw7yiPf1
 xo5ZLw9n5A/XmpJg7Ymvj4Eqsb8Q2fUjV2S8QeZofY/mhOxDYNvQ144h2ChhZHl21a9KiK
 1Mdw8Favoe9NVRF951PzLNkMi9kRwcM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621477128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sHDqMefuS0jfZY78aneKv+C4tqai2cafaPaE1zr9kR4=;
 b=BaeI4QYaSbRvvObttBGJ4e+g3bxT026oFnJzDmYHcokIVJyYWBGle3yA81tyDD/9kEzv1z
 SCeVSLd4Web8JXVxHym2Qm/eaPpmFGsNYoK+4oqUhiEm5rHYS6EHCEeb7vJiADgARZILWX
 +1o+u0+l3bm9TgxdUuS8O/TPoLDiJ+4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-bDCSYvF1Nh-AJ2IRm358Lw-1; Wed, 19 May 2021 22:18:45 -0400
X-MC-Unique: bDCSYvF1Nh-AJ2IRm358Lw-1
Received: by mail-qk1-f197.google.com with SMTP id
 l6-20020a3770060000b02902fa5329f2b4so11292597qkc.18
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 19:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sHDqMefuS0jfZY78aneKv+C4tqai2cafaPaE1zr9kR4=;
 b=QZ8gfOonXdcGZys9rEq44qc6or89dAe6InHrGAuwRiL+eQ//U5/EVWf08fzARMhCpC
 0kyg6VmIbv7ft+uY/eINEdJPPbbYDCh2lTdchVrAjETFcNF8+6cpYMtF4V63tzrNBD/5
 zjpo980K5s38ic2snksG94uS3oK0Z8FlECl7sVRffzrBQrdIuWUTx9sUHVLP/IRx4Diz
 jYGNkSE1lFoa9aXylpXQBQAs93fUfHmFWp79g/3SqVN6rm2G7WYteBTzLo7TH9MMm76C
 HNRjZ2vQCNQULIefil0iwN/f2MdOd+OAC7a+VdTpqR4dVM8KcZbLXEW7z0hp1mw0dyhu
 w2dw==
X-Gm-Message-State: AOAM532u15eiImKVTAwLGkISR2UmEgSc1QQtp+T6azNMvAj45LXSz1tT
 xnVOu6we/l6Ttz3/oTY7t6co1ErpmjZjrPvMN63uPiksAiv+y53xLNMyNaU2PX1qEeqoYQEoy+d
 i962Q9sL/YFXdIVOsQUvwCtW+4A==
X-Received: by 2002:a0c:e601:: with SMTP id z1mr2909838qvm.62.1621477125439;
 Wed, 19 May 2021 19:18:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPjm1JJXTWz/eOauSQvLjSeZzx1RIOLWGjlNLXK3o/XwUebWLz4kqwZAF4my19038LoZ+q1g==
X-Received: by 2002:a0c:e601:: with SMTP id z1mr2909808qvm.62.1621477125084;
 Wed, 19 May 2021 19:18:45 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id m21sm980797qtu.11.2021.05.19.19.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 19:18:44 -0700 (PDT)
Date: Wed, 19 May 2021 22:18:43 -0400
From: Peter Xu <peterx@redhat.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 3/9] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
Message-ID: <YKXHA8/HmP6HXngO@t490s>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-4-aneesh.kumar@linux.ibm.com>
 <YKQdxpHVYB9H0M0j@Ryzen-9-3900X.localdomain>
 <87mtsrqqk0.fsf@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <87mtsrqqk0.fsf@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
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
Cc: npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>,
 linux-mm@kvack.org, kaleshsingh@google.com, joel@joelfernandes.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 10:16:07AM +0530, Aneesh Kumar K.V wrote:
> > On Thu, Apr 22, 2021 at 11:13:17AM +0530, Aneesh Kumar K.V wrote:
> >> pmd/pud_populate is the right interface to be used to set the respective
> >> page table entries. Some architectures like ppc64 do assume that set_pmd/pud_at
> >> can only be used to set a hugepage PTE. Since we are not setting up a hugepage
> >> PTE here, use the pmd/pud_populate interface.

[1]

> Can you try this change?
> 
> modified   mm/mremap.c
> @@ -279,7 +279,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
>  	pmd_clear(old_pmd);
>  
>  	VM_BUG_ON(!pmd_none(*new_pmd));
> -	pmd_populate(mm, new_pmd, (pgtable_t)pmd_page_vaddr(pmd));
> +	pmd_populate(mm, new_pmd, pmd_pgtable(pmd));
>  
>  	if (new_ptl != old_ptl)
>  		spin_unlock(new_ptl);

I reported this issue today somewhere else:

https://lore.kernel.org/linux-mm/YKVemB5DuSqLFmmz@t490s/

And came to this same line after the bisection.

This seems to work at least for my userfaultfd test on shmem, however I don't
fully understand the commit message [1] on: How do we guarantee we're not
moving a thp pte?

-- 
Peter Xu

