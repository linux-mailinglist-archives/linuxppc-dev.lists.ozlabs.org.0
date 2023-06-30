Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7687434AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 08:01:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Ov/WA9FI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qsl7D0Ng5z3bsW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 16:01:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Ov/WA9FI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qsl6J1Pdzz2xvh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 16:00:22 +1000 (AEST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5728df0a7d9so15806047b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 23:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688104819; x=1690696819;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+0nTG/kHTQnVMhxohP5MHsuqRdzFEHicjq/sQ6iCKf4=;
        b=Ov/WA9FIpcLbO5CWiZUETBfpY3/i28SEAzmOAtKKfVPcjC2oiPdl88c3NEOwzb8cD+
         6WzK7yaRwizLNaiSK+XsCbeueaZWtb1w0nxmwBno9xEic/fO7Z4szDyPbW8HYyXhAvZ7
         YV3jFnWqdMrYUC5skCnnCQvrYAyK6TUTJpnLrxix2anE3XJz7ZmlaiODH4pHDYJGT4Q6
         giQoUvXCxUzI+Kk2H80FyTpsBZKpuQSjgZKIWyFp5elg9xREP/alCVI73Tg8EO5xvOTl
         AJIs6DUayxlLux2wbVvwTJNJxrms7uSk68djZvXan8LY41dV6vRsyGpCGRqDLR35B8w7
         0tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688104819; x=1690696819;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+0nTG/kHTQnVMhxohP5MHsuqRdzFEHicjq/sQ6iCKf4=;
        b=I+s3x36uQgTGjwflKtEwhPWDjQvpOxUnf+H8XO+yAg8M6gPEMlc05yFcEcLN1buo6y
         HY80lJ0qIBI4uJst0ASLMxkX6yh4LtOwFMoMlCxBpsqmWEXQZERp/S8J1cTxo11UB+WB
         HKqn/xZKWJjEWmQ3wxKodiG3DRpy/UtM2kTuEN/MmWh1KkRwpUcy/CmikA0dDwne+hPc
         xSfmFS8WAnoFptTzHIpL1vAVaM9CE08X649naFS7X4ahg27dGOkSHng9gTK2jRDRg7HD
         sSVMP3HEvHUvfJhVEtbYn3XFLKlAITUXOl/g+1RG/087ZjuNGkfEKdTrlAKTPJ2NaLUx
         iTrQ==
X-Gm-Message-State: ABy/qLauKmLHOAalpvpqisi16Zf7nNQ8uf3XMRZWTLynxXbPmQ0XKzDF
	TyIxUK2uPHxMOscZpvMz7wMZ0A==
X-Google-Smtp-Source: APBJJlHFE9Bxkgb6xQI8G8hQpu1DsdB6JNYk+x45ihxlo4iT7BDx6YBh1zc44ElJh614CQjrX+ONmg==
X-Received: by 2002:a81:5302:0:b0:56d:31a1:bd9b with SMTP id h2-20020a815302000000b0056d31a1bd9bmr1566007ywb.41.1688104819415;
        Thu, 29 Jun 2023 23:00:19 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id n197-20020a0dcbce000000b0056d3d7a59cesm3278770ywd.12.2023.06.29.23.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 23:00:19 -0700 (PDT)
Date: Thu, 29 Jun 2023 23:00:07 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <20230629175645.7654d0a8@thinkpad-T15>
Message-ID: <edaa96f-80c1-1252-acbb-71c4f045b035@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com> <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com> <20230628211624.531cdc58@thinkpad-T15> <cd7c2851-1440-7220-6c53-16b343b1474@google.com> <ZJ2hsM5Tn+yUZ5ZV@ziepe.ca>
 <20230629175645.7654d0a8@thinkpad-T15>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, P
 asha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Jun 2023, Gerald Schaefer wrote:
> On Thu, 29 Jun 2023 12:22:24 -0300
> Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Wed, Jun 28, 2023 at 10:08:08PM -0700, Hugh Dickins wrote:
> > > On Wed, 28 Jun 2023, Gerald Schaefer wrote:  
> > > > 
> > > > As discussed in the other thread, we would rather go with less complexity,
> > > > possibly switching to an approach w/o the list and fragment re-use in the
> > > > future. For now, as a first step in that direction, we can try with not
> > > > adding fragments back only for pte_free_defer(). Here is an adjusted
> > > > version of your patch, copying most of your pte_free_defer() logic and
> > > > also description, tested with LTP and all three of your patch series applied:  
> > > 
> > > Thanks, Gerald: I don't mind abandoning my 13/12 SLAB_TYPESAFE_BY_RCU
> > > patch (posted with fewer Cc's to the s390 list last week), and switching
> > > to your simpler who-cares-if-we-sometimes-don't-make-maximal-use-of-page
> > > patch.
> > > 
> > > But I didn't get deep enough into it today to confirm it - and disappointed
> > > that you've found it necessary to play with pt_frag_refcount in addition to
> > > _refcount and HH bits.  No real problem with that, but my instinct says it
> > > should be simpler.  
> 
> Yes, I also found it a bit awkward, but it seemed "good and simple enough",
> to have something to go forward with, while my instinct was in line with yours.
> 
> > 
> > Is there any reason it should be any different at all from what PPC is
> > doing?
> > 
> > I still think the right thing to do here is make the PPC code common
> > (with Hugh's proposed RCU modification) and just use it in both
> > arches....
> 
> With the current approach, we would not add back fragments _only_ for
> the new pte_free_defer() path, while keeping our cleverness for the other
> paths. Not having a good overview of the negative impact wrt potential
> memory waste, I would rather take small steps, if possible.
> 
> If we later switch to never adding back fragments, of course we should
> try to be in line with PPC implementation.

I find myself half-agreeing with everyone.

I agree with Gerald that s390 should keep close to what it is already
doing (except for adding pte_free_defer()): that changing its strategy
and implementation to be much more like powerpc, is a job for some other
occasion (and would depend on gathering data about how well each does).

But I agree with Jason that the powerpc solution we ended up with cut
out a lot of unnecessary complication: it shifts the RCU delay from
when pte_free_defer() is called, to when the shared page comes to be
freed; which may be a lot later, and might not be welcome in a common
path, but is quite okay for the uncommon pte_free_defer().

And I agree with Alexander that pte_free_lower() and pte_free_upper()
are better names than pte_free_now0() and pte_free_now1(): I was going
to make that change, except all those functions disappear if we follow
Jason's advice and switch the call_rcu() to when freeing the page.

(Lower and upper seem unambiguous to me: Gerald, does your confusion
come just from the way they are shown the wrong way round in the PP AA
diagram?  I corrected that in my patch, but you reverted it in yours.)

I've grown to dislike the (ab)use of pt_frag_refcount even more, to the
extent that I've not even tried to verify it; but I think I do get the
point now, that we need further info than just PPHHAA to know whether
the page is on the list or not.  But I think that if we move where the
call_rcu() is done, then the page can stay on or off the list by same
rules as before (but need to check HH bits along with PP when deciding
whether to allocate, and whether to list_add_tail() when freeing).

So, starting from Gerald's but cutting it down, I was working on the
patch which follows those ideas.  But have run out of puff for tonight,
and would just waste all our time (again) if I sent anything out now.

Hugh
