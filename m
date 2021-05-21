Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175DD38BC7D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 04:41:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmW8B08w4z30BJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 12:41:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BfJC9dqc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=BfJC9dqc; 
 dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmW7h3gFvz2yXh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 12:41:03 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id 131so22206129ljj.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 19:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gixno4vr81cCAgvQz027RE1pAMILS4ks2YALYpOh1sE=;
 b=BfJC9dqc8caOml9V2QhWPD3hRkU6E0PHFbZPMYJfBdudmaaAb+WwUkNx19gz9gJWC/
 wpBKXxOi1ZuNzchWPYXtnAnY7Ak/nW2IQ0kaaY6lXBFmbkKA6UDRniCwaEpO4zYv3UHk
 qo2/o4t2WuWel02dPj1GoCYnj9cQqiszKvRso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gixno4vr81cCAgvQz027RE1pAMILS4ks2YALYpOh1sE=;
 b=gNEhhW57+eVqd6Clx4FgWksRZ1AsE1ZndXz261u32S6S9i9vyPeiEuVnAeneQoKOxb
 9d5pcn1LbQYqtOVSCLfrxumDjobI7CNWLWcMuHOO5jzeHOoNQ2RrGzw8Aj36LM+ZEufe
 AYYw4f9cAN1O21ebHItO8zuogTV+wZT4kXgCKv8F43OLnVSn5yiZqXIlMbcuGIB1lP0H
 pflg691Ejq+GHYsnUR1GUCtCEsGEttZhwsccz1EesloOkRmsCjLE3G1Sd43CAYoca44f
 Nnkh4IspwWt4QmLYPNok4MYUFOoMAoYqt7GQA8o98UYWkqR0usQjfPK8wvsWQniv42cU
 jAFg==
X-Gm-Message-State: AOAM530mT/OPBvHa/Mcs0CAKsJjgFuYdBrezD8GAxlohImxfwClfB7on
 tuAH7iQ7zcQpNLWPS2TPvQ0n/vNOMmxtxKnL
X-Google-Smtp-Source: ABdhPJwUiPTGeao5k/8CHT1DEDEymYCwsfniLklg7/hgggclMvxvq6PIuTYIeANPWEHpRhdAspq42Q==
X-Received: by 2002:a2e:3803:: with SMTP id f3mr5108893lja.230.1621564857775; 
 Thu, 20 May 2021 19:40:57 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id b14sm470711lfb.111.2021.05.20.19.40.57
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 19:40:57 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id c10so6458737lfm.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 19:40:57 -0700 (PDT)
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr431893lfp.201.1621564856863; 
 Thu, 20 May 2021 19:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
 <b3047082-fc82-b326-dbdb-835b88df78d0@linux.ibm.com>
 <2eafd7df-65fd-1e2c-90b6-d143557a1fdc@linux.ibm.com>
In-Reply-To: <2eafd7df-65fd-1e2c-90b6-d143557a1fdc@linux.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 May 2021 16:40:41 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
Message-ID: <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
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
Cc: Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 6:57 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> Wondering whether this is correct considering we are holding mmap_sem in
> write mode in mremap.

Right. So *normally* the rule is to EITHER

 - hold the mmap_sem for writing

OR

 - hold the page table lock

and that the TLB flush needs to happen before you release that lock.

But as that commit message of commit eb66ae030829 ("mremap: properly
flush TLB before releasing the page") says, "mremap()" is a bit
special. It's special because mremap() didn't take ownership of the
page - it only moved it somewhere else. So now the page-out logic -
that relies on the page table lock - can free the page immediately
after we've released the page table lock.

So basically, in order to delay the TLB flush after releasing the page
table lock, it's not really sufficient to _just_ hold the mmap_sem for
writing. You also need to guarantee that the lifetime of the page
itself is held until after the TLB flush.

For normal operations like "munmap()", this happens naturally, because
we remove the page from the page table, and add it to the list of
pages to be freed after the TLB flush.

But mremap never did that "remove the page and add it to a list to be
free'd later". Instead, it just moved the page somewhere else. And
thus there is no guarantee that the page that got moved will continue
to exist until a TLB flush is done.

So mremap does need to flush the TLB before releasing the page table
lock, because that's the lifetime boundary for the page that got
moved.

                  Linus
