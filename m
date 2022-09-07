Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FA95B0F12
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 23:24:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNFdL272pz3c61
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 07:24:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EqYHk7oQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=shy828301@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EqYHk7oQ;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNFcj3cXTz2y8J
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 07:24:04 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id 145so15892470pfw.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Sep 2022 14:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sMQZJyXMfoKZiEunfF/Gh6oLQoPXC7E+0fe21wEbc8c=;
        b=EqYHk7oQSe0x9VrpXRLuIb6iuMh9fPfo+qrUmiODFlDWVSUO1J7+YkXR4t6nDvU1AY
         ZIEWHO0UhZEAnwhhoskKKRK7/R4FG/ZYkekEKRzAXNq+1nVPgeuZo3zRmEyAiaegWW3E
         bAq+57J79A5YFp1q6Zm0rG7zAcs59v68FNeKtUx75TJwk8Ka7SLKrvSNBzF0PdNv6gnX
         jxnDfvF8evtNHChlAYQWvD8Ul8IlRA0GqjPwJofpk4+JHLHGoOCplDe1VZgibTpF6Za2
         Kk1PjuxtW9UbsV867AH7BwBDB+jmxNQeyvuax9bCJcJVh2OCoHhwkpyolUPOGIXLmQRj
         V87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sMQZJyXMfoKZiEunfF/Gh6oLQoPXC7E+0fe21wEbc8c=;
        b=ip7PU+sROIHgrf6sOzW1AQxH6W7uIe1oosCNXnZNyHgSO1HQlcS47kp8hIT9RpfZRn
         FS/BPeE+Io/ztf0nKk9RIIB/btHR/IdMMVa4KqY1dpBzKSjEOEvaJHsNmq03+E+5ZOga
         k1/DwEnAMeB66vu3hAqFhzp2PzEENEgebPm6XMroNpifAz/uiIqRVxIGb0v9jfX97vS+
         5KmZakaR9vBFkL3fwq9NN6zruVkbXN64MEn1w44JTyxhsQvELWlAzlXtg8q3oni+e3Sn
         xN7lKWUP0fPr/+im5u6lRQfoRwyAXxZ07h1ALGcD31CLBVXqpbDbZYfb5KCu1DszU6AN
         DMPg==
X-Gm-Message-State: ACgBeo3LJaEFtxk/j4MyQllXt+AXSKwQjG19MOgaTez16t6nQstzeOoD
	FnzX/PDy49RDf+C3LHXQq7LXQVxZtFbQylki9kg=
X-Google-Smtp-Source: AA6agR6/1FXIRQSKgzUhu4PEPPStby0UGJVvimjKDzJKdUsDC9pMsai0iYwWi/JrzXRSqxb4s+3+B2eXJIVOp/BS4Fg=
X-Received: by 2002:a63:91c7:0:b0:42b:9e30:580f with SMTP id
 l190-20020a6391c7000000b0042b9e30580fmr5008321pge.206.1662585841824; Wed, 07
 Sep 2022 14:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220907180144.555485-1-shy828301@gmail.com> <20220907142246.c7d6f55e1b56fba3e16d974b@linux-foundation.org>
In-Reply-To: <20220907142246.c7d6f55e1b56fba3e16d974b@linux-foundation.org>
From: Yang Shi <shy828301@gmail.com>
Date: Wed, 7 Sep 2022 14:23:48 -0700
Message-ID: <CAHbLzkr==CoCP6U+zNhX8_Ug+sG-P7xwyuf_1yCWwKF8XzGj3Q@mail.gmail.com>
Subject: Re: [v2 PATCH 1/2] mm: gup: fix the fast GUP race against THP collapse
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: david@redhat.com, jhubbard@nvidia.com, hughd@google.com, linux-kernel@vger.kernel.org, peterx@redhat.com, linux-mm@kvack.org, jgg@nvidia.com, aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 7, 2022 at 2:22 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed,  7 Sep 2022 11:01:43 -0700 Yang Shi <shy828301@gmail.com> wrote:
>
> > Since general RCU GUP fast was introduced in commit 2667f50e8b81 ("mm:
> > introduce a general RCU get_user_pages_fast()"), a TLB flush is no longer
> > sufficient to handle concurrent GUP-fast in all cases, it only handles
> > traditional IPI-based GUP-fast correctly.  On architectures that send
> > an IPI broadcast on TLB flush, it works as expected.  But on the
> > architectures that do not use IPI to broadcast TLB flush, it may have
> > the below race:
> >
> >    CPU A                                          CPU B
> > THP collapse                                     fast GUP
> >                                               gup_pmd_range() <-- see valid pmd
> >                                                   gup_pte_range() <-- work on pte
> > pmdp_collapse_flush() <-- clear pmd and flush
> > __collapse_huge_page_isolate()
> >     check page pinned <-- before GUP bump refcount
> >                                                       pin the page
> >                                                       check PTE <-- no change
> > __collapse_huge_page_copy()
> >     copy data to huge page
> >     ptep_clear()
> > install huge pmd for the huge page
> >                                                       return the stale page
> > discard the stale page
> >
> > The race could be fixed by checking whether PMD is changed or not after
> > taking the page pin in fast GUP, just like what it does for PTE.  If the
> > PMD is changed it means there may be parallel THP collapse, so GUP
> > should back off.
> >
> > Also update the stale comment about serializing against fast GUP in
> > khugepaged.
> >
> > Fixes: 2667f50e8b81 ("mm: introduce a general RCU get_user_pages_fast()")
>
> Is this not worth a -stable backport?

Yes, I think it is.
