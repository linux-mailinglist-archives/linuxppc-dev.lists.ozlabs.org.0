Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E82238B255
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 16:58:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmCY625dVz2yYN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 00:58:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mu1k7wq7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mu1k7wq7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Mu1k7wq7; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mu1k7wq7; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmCXc2DQ1z2xvB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 00:58:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621522684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IFy+kDGy5FjXwv8NN0pfzTAzqZNfkA1UTKIoWhwHib8=;
 b=Mu1k7wq7g3xNKVd+GlcHQVvuSftHt3VbULZv+xGbkdaVpOw6ct0zBK/px3WNIGxl0M15aS
 F+CKA3HbTM5vLwCkjvWhyXvhxXRxxv612TC6fx/3elxeVz+quUj3fCX2HAILta+rjkwXQ8
 IU32TWgXO8juJydbvKEDRRoZwFxoOwE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621522684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IFy+kDGy5FjXwv8NN0pfzTAzqZNfkA1UTKIoWhwHib8=;
 b=Mu1k7wq7g3xNKVd+GlcHQVvuSftHt3VbULZv+xGbkdaVpOw6ct0zBK/px3WNIGxl0M15aS
 F+CKA3HbTM5vLwCkjvWhyXvhxXRxxv612TC6fx/3elxeVz+quUj3fCX2HAILta+rjkwXQ8
 IU32TWgXO8juJydbvKEDRRoZwFxoOwE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-GNRQvtP1NDaN-wdu-xpUuw-1; Thu, 20 May 2021 10:58:00 -0400
X-MC-Unique: GNRQvtP1NDaN-wdu-xpUuw-1
Received: by mail-qt1-f198.google.com with SMTP id
 69-20020aed304b0000b02901c6d87aed7fso12412904qte.21
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 07:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IFy+kDGy5FjXwv8NN0pfzTAzqZNfkA1UTKIoWhwHib8=;
 b=q3MDc460lajhdu1u6xSrlRFGDnKmRyOUW7S6RpEyHSNlot5lMvQSd7qudqoq7YWcYf
 ud6bIjA+x15Mt3lwKYzx75WVkSyVu8x/JuJKIVwaB52GChXPiXn7JIlP6AyQvEhD26Z8
 1Seje+VJOHkC5NJHt/rTfViNzfBe1U4PaPEJHASh++3qvdO/lUEfpJ+Fc/vREDvGjw0c
 rjzGcOknFpRNAI4sxf/YAtZdRKgzBYgcZ0kfZiwOseaMF46GWwO266nbQIw6XXaf0Zqs
 AblooqSPWypHgEW3ajHGyXtob6TJORBQQ2zURz9Hzn19kkIPuDL4eULmjwYps6o8oNPv
 H9vQ==
X-Gm-Message-State: AOAM532Lo8Oom7pD9cVP2qrFkEJ3sXC7AkUeDxpw+TdpgEgEAXzySs1P
 RUGlz/UeMzdux+AsgdMNeFJXXbJv2wvGKKps9qNBAtgIke+0QLxXF5wZKZUO6U8Zm/8BSndRtZh
 QnSV5ZnP4NiviG6jWbOHb/f/PRA==
X-Received: by 2002:a05:620a:133b:: with SMTP id
 p27mr5255796qkj.354.1621522679424; 
 Thu, 20 May 2021 07:57:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUwFU67C8yrPnfpE5qhvyk2qLh59LFKNHs9lIWRvVbD2sY6jO7wZyKH2elnhPr9KzFI/TEfA==
X-Received: by 2002:a05:620a:133b:: with SMTP id
 p27mr5255763qkj.354.1621522679102; 
 Thu, 20 May 2021 07:57:59 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id u186sm2253425qkd.30.2021.05.20.07.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 07:57:58 -0700 (PDT)
Date: Thu, 20 May 2021 10:57:56 -0400
From: Peter Xu <peterx@redhat.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 3/9] mm/mremap: Use pmd/pud_poplulate to update page
 table entries
Message-ID: <YKZ49Nrz2OojQUBR@t490s>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-4-aneesh.kumar@linux.ibm.com>
 <YKQdxpHVYB9H0M0j@Ryzen-9-3900X.localdomain>
 <87mtsrqqk0.fsf@linux.ibm.com> <YKXHA8/HmP6HXngO@t490s>
 <6e0dbb76-2b33-53f1-246e-30cec2b871e2@linux.ibm.com>
 <YKZaLHurH9nJWvbj@t490s>
 <e6525655-2e51-a0c0-fe54-596cfae9ce21@linux.ibm.com>
 <87o8d5le4q.fsf@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <87o8d5le4q.fsf@linux.ibm.com>
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

On Thu, May 20, 2021 at 07:07:57PM +0530, Aneesh Kumar K.V wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> 
> > On 5/20/21 6:16 PM, Peter Xu wrote:
> >> On Thu, May 20, 2021 at 01:56:54PM +0530, Aneesh Kumar K.V wrote:
> >>>> This seems to work at least for my userfaultfd test on shmem, however I don't
> >>>> fully understand the commit message [1] on: How do we guarantee we're not
> >>>> moving a thp pte?
> >>>>
> >>>
> >>> move_page_tables() checks for pmd_trans_huge() and ends up calling
> >>> move_huge_pmd if it is a THP entry.
> >> 
> >> Sorry to be unclear: what if a huge pud thp?
> >> 
> >
> > I am still checking. Looking at the code before commit 
> > c49dd340180260c6239e453263a9a244da9a7c85, I don't see kernel handling 
> > huge pud thp. I haven't studied huge pud thp enough to understand 
> > whether c49dd340180260c6239e453263a9a244da9a7c85 intent to add that 
> > support.
> >
> > We can do a move_huge_pud() like we do for huge pmd thp. But I am not 
> > sure whether we handle those VMA's earlier and restrict mremap on them?
> 
> something like this? (not even compile tested). I am still not sure
> whether this is really needed or we handle DAX VMA's in some other form.

Yeah maybe (you may want to at least drop that extra "case HPAGE_PUD").

It's just that if with CONFIG_HAVE_MOVE_PUD (x86 and arm64 enables it by
default so far) it does seem to work even with huge pud, while after this patch
it seems to be not working anymore, even with your follow up fix.

Indeed I saw CONFIG_HAVE_MOVE_PUD is introduced a few months ago so breaking
someone seems to be unlikely, perhaps no real user yet to mremap() a huge pud
for dax or whatever backend?

Ideally maybe rework this patch (or series?) and repost it for a better review?
Agree the risk seems low.  I'll leave that to you and Andrew to decide..

-- 
Peter Xu

