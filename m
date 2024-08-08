Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E550A94C050
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 16:55:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NU2iJXKX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R5Nd8xoo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfqpN6gtRz2yNP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 00:55:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NU2iJXKX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R5Nd8xoo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfqnh72zHz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 00:54:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723128865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0YfHjxzOoIJLo5MdFMHzLs+Cgg2yZMeP3Ex80OFBemw=;
	b=NU2iJXKXYV2drVStquDANv8BsIjM4cR/b+TvIDp42io7u/XIVTen8lUaQJKPY5pKVOihgY
	OaLwrowbzC2tQqUI0DogUD5j7iZ4RBn9a3GZur42LPSlbuz4sBddpWHVjSU9x/QmuEqEN9
	PXV79rMdsDkBjS3qdRdLehvwbQl0QFQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723128866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0YfHjxzOoIJLo5MdFMHzLs+Cgg2yZMeP3Ex80OFBemw=;
	b=R5Nd8xoo6LLO4FeGX3ZqRWUbBl9lHkH3wzw1/cbG1PS3oooFe9N/0Kb/d838vZmZwcp0FI
	Kq7dUxqR0Fwqhf08EQTkm/8CiJjsUeZq2wwSBwfABKKudvEhO2Uv5ntEQNNI7igzB4qhPX
	hDW3DDKx3uCKe4eb/aZfFgBamLyGh6o=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-FZ7QCKO6MpibCYS7y0V75A-1; Thu, 08 Aug 2024 10:54:24 -0400
X-MC-Unique: FZ7QCKO6MpibCYS7y0V75A-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-26440d4a6f9so98756fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 07:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128863; x=1723733663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YfHjxzOoIJLo5MdFMHzLs+Cgg2yZMeP3Ex80OFBemw=;
        b=hjGVQ06q1oAKqcMsDVPPmsdLw7CbH/loGvPblXbn8hf0NpRxAEnkCtlWd/TaHaEks4
         xub38gmwKJXNH5tyo3800ghPNv82SyfejE0jwMmDWCF3awTbuq2Gaji2OVg7n0vrRPfW
         1yeS+C4rk7GUPyAE3mMc/SwsL0qmisczh8eYe1WJWn6IjT8hYiv6+/RZZAI79Xo6caPp
         ZRCsHl7ay06j3yaQU6pPjbcpOktWnoBQpOjud0ZiNkWXXJcHucCym+yvQ9SL2tX+4MqK
         wDP4Tixxq/79wjlqBQ9PUpXgJTwOPNtYeeiK/qrkYZyD8twc6D8LjpA1fNW5yGNA4/tb
         o/xg==
X-Forwarded-Encrypted: i=1; AJvYcCUwkHEvg77Rs3hRVbbwvkG17FrFcxp2OGq6gcYGT4I0YQouGSY0xiJlQGE0LHqeMtAa7k1ir+Cd3shUl1w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzac2sHjdjkAPvn7+NHSmPzVDUBnTK5IsZDj4+8wR6x1sawEQ+F
	6cgb6M+YadzfsyLGOtoUXE74W7GZe1e73lMjfslRgszV08r8TyQyYewchhOOTRVezRt/nFa0rx2
	UYkk8xAW3cG0Yerk3kDpGLSUM+E96mj9NfNwVv8F9dDVp7lixkSjUUstfSuPo440=
X-Received: by 2002:a05:6808:1490:b0:3da:ac08:b74a with SMTP id 5614622812f47-3dc3b4623aamr1357594b6e.7.1723128863371;
        Thu, 08 Aug 2024 07:54:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiqsl7u491+dk16BCdQXSlY2KYF+kMbWvb93MQDcyt8BmOo92tc6HC335u2mF8sk01BC1ZNg==
X-Received: by 2002:a05:6808:1490:b0:3da:ac08:b74a with SMTP id 5614622812f47-3dc3b4623aamr1357566b6e.7.1723128862987;
        Thu, 08 Aug 2024 07:54:22 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3785d0d1asm167486185a.25.2024.08.08.07.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:54:22 -0700 (PDT)
Date: Thu, 8 Aug 2024 10:54:19 -0400
From: Peter Xu <peterx@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 4/7] mm/x86: Make pud_leaf() only care about PSE bit
Message-ID: <ZrTcGxANpcvwp1qt@x1n>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807194812.819412-5-peterx@redhat.com>
 <87bk240y8h.ffs@tglx>
MIME-Version: 1.0
In-Reply-To: <87bk240y8h.ffs@tglx>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 08, 2024 at 12:22:38AM +0200, Thomas Gleixner wrote:
> On Wed, Aug 07 2024 at 15:48, Peter Xu wrote:
> > An entry should be reported as PUD leaf even if it's PROT_NONE, in which
> > case PRESENT bit isn't there. I hit bad pud without this when testing dax
> > 1G on zapping a PROT_NONE PUD.
> 
> That does not qualify as a change log. What you hit is irrelevant unless
> you explain the actual underlying problem. See Documentation/process/
> including the TIP documentation.

Firstly, thanks a lot for the reviews.

I thought the commit message explained exactly what is the underlying
problem, no?

The problem is even if PROT_NONE, as long as the PSE bit is set on the PUD
it should be treated as a PUD leaf.  Currently, the code will return
pud_leaf()==false for those PROT_NONE PUD entries, and IMHO that is wrong.
This patch wants to make it right.  I still think that's mostly what I put
there in the commit message..

Would you please suggest something so I can try to make it better,
otherwise?  Or it'll be helpful too if you could point out which part of
the two documentations I should reference.

> 
> > diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> > index e39311a89bf4..a2a3bd4c1bda 100644
> > --- a/arch/x86/include/asm/pgtable.h
> > +++ b/arch/x86/include/asm/pgtable.h
> > @@ -1078,8 +1078,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
> >  #define pud_leaf pud_leaf
> >  static inline bool pud_leaf(pud_t pud)
> >  {
> > -	return (pud_val(pud) & (_PAGE_PSE | _PAGE_PRESENT)) ==
> > -		(_PAGE_PSE | _PAGE_PRESENT);
> > +	return pud_val(pud) & _PAGE_PSE;
> >  }
> 
> And the changelog does not explain why this change is not affecting any
> existing user of pud_leaf().

That's what I want to do: I want to affect them..

And IMHO it's mostly fine before because mprotect() is broken with 1g
anyway, and I guess nobody managed to populate any pud entry with PROT_NONE
on dax 1g before, and that's what this whole series is trying to fix.

Thanks,

-- 
Peter Xu

