Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFF18CD817
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 18:06:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EkuI6ESz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EkuI6ESz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlXv41vY8z793W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 02:00:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EkuI6ESz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EkuI6ESz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlXtJ1Rx4z3wY4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 01:59:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716479972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFW+xu7QNxeGwrYT708qIRdLA+B0NE1DkW6W5XAywxE=;
	b=EkuI6ESz7UcfwyCxWXp89lrkSYMtteJFdGnEcweqJ0OXNBlkqJTZoJYmhbvDFibLuGAVNB
	08+BhOZpDBnvos+pyPa5DsW7eWT6W426V/C1vOS73gGjzxJ2QF/1p1UyVgy3ybu3KpGOxU
	4fux0G42jdjatF1f3mmeORNRosp3Hgc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716479972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFW+xu7QNxeGwrYT708qIRdLA+B0NE1DkW6W5XAywxE=;
	b=EkuI6ESz7UcfwyCxWXp89lrkSYMtteJFdGnEcweqJ0OXNBlkqJTZoJYmhbvDFibLuGAVNB
	08+BhOZpDBnvos+pyPa5DsW7eWT6W426V/C1vOS73gGjzxJ2QF/1p1UyVgy3ybu3KpGOxU
	4fux0G42jdjatF1f3mmeORNRosp3Hgc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-tARenD7MNS6SNYeDw6zDyQ-1; Thu, 23 May 2024 11:59:30 -0400
X-MC-Unique: tARenD7MNS6SNYeDw6zDyQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ab9836827eso777996d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 08:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716479970; x=1717084770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFW+xu7QNxeGwrYT708qIRdLA+B0NE1DkW6W5XAywxE=;
        b=YVVhY/HWoy/+591bcjM5AheU6lOQlyC7lTdyNxQM/S48FLip07ENZVH3aMVXWwClAW
         froL7I57CW8DhGuuy+/YyXPqo3lD39RUoansTfYHnVPY7ZX/kDlaoAlQVeB9LTeAdO7f
         Px6Dt0+lfYBdaMcO42ltmgnPhuuluwdL25jd4v2xYUpAkGzetVJ80MtD6a+zaNjo4g+g
         Qw7bg/Fafo3vGSJKEFt8BmHY3Ai9gRI8HIm7U1g/9o5POMQnWH1DR0kMa/K63Ubf8WTL
         q5XQO3E+OqysLP81EGldM54SanACEtSTxgtp2IiQjDvocNVwyx+KivA/yzCqiL7cLvND
         9fbw==
X-Forwarded-Encrypted: i=1; AJvYcCUDed1vnPiA958tbYy2Fk3bOVfjheaniuBU6AbPpk9kZypF24WBd02c8+ttly0MrC8JU3ql+MdTBO4gUW1Qo428Vlo9XjPvnAzrnJ8u+g==
X-Gm-Message-State: AOJu0YxDchLXIY9i7gPql4Azd5sNTQ08JVlK+z4OwOB4Kp1MB74/ODAf
	DQfYs9FZSjqmFpMkF2TODtWOs9+tScE3ccOfq7i0PjNGduGdDkQfg/4wC2vQ3XFXfeos3adrBTU
	+fue1bYis/ATPgXM57iryPUSKP+e/YI3fbm5DkEPJxMVBIg1oCHyQLMPIbsLj+WI=
X-Received: by 2002:a05:6214:2484:b0:69b:1c5c:28fb with SMTP id 6a1803df08f44-6ab7f19ec6amr55473376d6.0.1716479969666;
        Thu, 23 May 2024 08:59:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfEZ/MxR7kXEObGm96kXld53lPLAn57DT2wv2+Ejd7pVHUF2vvfPDOcD/zLRIDa0eVAMCLMw==
X-Received: by 2002:a05:6214:2484:b0:69b:1c5c:28fb with SMTP id 6a1803df08f44-6ab7f19ec6amr55472786d6.0.1716479968823;
        Thu, 23 May 2024 08:59:28 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f17960csm144178206d6.25.2024.05.23.08.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 08:59:28 -0700 (PDT)
Date: Thu, 23 May 2024 11:59:25 -0400
From: Peter Xu <peterx@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 1/1] arch/fault: don't print logs for pte marker
 poison errors
Message-ID: <Zk9n3aXbOufWpAhn@x1n>
References: <20240510182926.763131-1-axelrasmussen@google.com>
 <20240510182926.763131-2-axelrasmussen@google.com>
 <Zj51rEwZeSK4Vr1G@x1n>
 <ZkPJCc5N1Eotpa4u@localhost.localdomain>
 <ZkPY4CSnZWZnxjTa@x1n>
 <ZkSMv31Cwx080no7@localhost.localdomain>
 <Zk5noUEYI4lknyJy@x1n>
 <Zk6zLRimo6Q6ZrwM@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <Zk6zLRimo6Q6ZrwM@localhost.localdomain>
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, Liu Shixin <liushixin2@huawei.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2024 at 05:08:29AM +0200, Oscar Salvador wrote:
> On Wed, May 22, 2024 at 05:46:09PM -0400, Peter Xu wrote:
> > > Now, ProcessB still has the page mapped, so upon re-accessing it,
> > > it will trigger a new MCE event. memory-failure code will see that this
> > 
> > The question is why accessing that hwpoison entry from ProcB triggers an
> > MCE.  Logically that's a swap entry and it should generate a page fault
> > rather than MCE.  Then in the pgfault hanlder we don't need that encoded
> > pfn as we have vmf->address.
> 
> It would be a swap entry if we reach try_to_umap_one() without trouble.
> Then we have the code that converts it:
> 
>  ...
>  if (PageHWPoison(p))
>          pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
> 	 set_{huge_}pte_at
>  ...
> 
> But maybe we could only do that for ProcA, while ProcB failed to do that,
> which means that for ProcA that is a hwpoisoned-swap-entry, but ProcB still
> has this page mapped as usual, so if ProcB re-access it, that will not
> trigger a fault (because the page is still mapped in its pagetables).

But in that case "whether encode pfn in hwpoison swap entry" doesn't matter
either.. as it's not yet converted to a swap entry, so the pfn is there.

Thanks,

-- 
Peter Xu

