Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3022F94B254
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 23:48:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LjcGnRqa;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dSaeqOJu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfP1H0Ww7z3dLH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 07:48:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LjcGnRqa;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dSaeqOJu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfP0c22Vkz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 07:47:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723067244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aCiVKpNiLqOePBRGHLX/OUQr3iDeTroqagJLNDFWCWE=;
	b=LjcGnRqawBM+s6MlFo9AkT6CxOtM8VZx1Hhw5kR7VfRWbaBThLEau1xzONjVxj1Pg/H0lG
	4mUDZ9bA06MI6fyza7lyBB4zZs2a3LRgwDm2LN/h7iVmlEib9i0qdqPIFL9JKLAlB7WStU
	kIj3vzbJphPRgomQvrE4tNvCMMSPfCM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723067245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aCiVKpNiLqOePBRGHLX/OUQr3iDeTroqagJLNDFWCWE=;
	b=dSaeqOJuSSIRURNjuewj5XZSKBETDjQSMHAlFLcRT/+BEQtUs+OCsC9iZXtBaYWSNFtlgV
	DtixTnMkkO9rNqgT6WGMdXSCRfW951G+VTFRq8vWm5rtZfqR+AyD2VyIVHQG+pI8f+ZZRS
	eY+Hy3lI7xx/8wNi6SpVZtvWlIrU1Mk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-7xQCqBp2M4eaas9-wdDyeg-1; Wed, 07 Aug 2024 17:47:23 -0400
X-MC-Unique: 7xQCqBp2M4eaas9-wdDyeg-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-44fea369811so663201cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 14:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723067243; x=1723672043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCiVKpNiLqOePBRGHLX/OUQr3iDeTroqagJLNDFWCWE=;
        b=R8rlJtal+4WEXwj1eDwqPX0WsCZtorLMD+XH0tj4HJZ1uE2HQHp1zFUxNwWZ6u2twX
         1yAUpf/GSQAXUfBJdpbTDPX+SmsY4Kmo2izRSSZXAPediSlSTGih/s5k90tdySASqzbA
         tm+lLLurXM+P+5qxGV5y5WR9byPqGtF+xC05WUWLF/hnhPSR1gJ8GrpqdY5MjqRg6m2r
         79R9uiV+iGpNCVwDDM3GAHuvm4QgYRgzqQns7a2Lp2EewfM7IucV4FUHbTcRwdWZdPdJ
         7wi6SdDycq3upEcovr0Xv8chZx7QvjH8O14bJuBd5U7Ue+n4KBt2S07J+G+G+QDA+ON2
         xwcw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2ITr8Oa8fC35ISzMuWH+15a2xaURjKavHIW5VRkewStRilk8FE2TOOH9zY8qDCTo29jXlRY9t2N4iOhUQIlXWaGj8e8x9BG3J2eK3g==
X-Gm-Message-State: AOJu0Yz+Yvm3HS9O/04u7AT5b3Fk56iUaM5+tIL4Crx2BquIrr2qHI5p
	zGj205QIT41kv+aTOAaxAZkYzyAjHFNLO2M5kR3VAqgARdIGWPsapvLT5eSh0VJG95xQMocm08e
	xJscFRlG9nf4Vy9O1C8iSginERGQNx47j3DgYya1Duy7PnXi1OUx1rvimDOBQ+M4=
X-Received: by 2002:ac8:7dc6:0:b0:44e:cff7:3741 with SMTP id d75a77b69052e-451d42e8e13mr45501cf.7.1723067242637;
        Wed, 07 Aug 2024 14:47:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9bw5zA2mwygXKj1TGJFqzB/idtoA3I89YV20jwaY21AqDhG6xaZ18FG34XF9AfNZNBTawgg==
X-Received: by 2002:ac8:7dc6:0:b0:44e:cff7:3741 with SMTP id d75a77b69052e-451d42e8e13mr45301cf.7.1723067242218;
        Wed, 07 Aug 2024 14:47:22 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c87344desm7823491cf.50.2024.08.07.14.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 14:47:16 -0700 (PDT)
Date: Wed, 7 Aug 2024 17:47:13 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 0/7] mm/mprotect: Fix dax puds
Message-ID: <ZrPrYdmyUDRdz1QN@x1n>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807142316.bbad141a106093b6f36249e2@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20240807142316.bbad141a106093b6f36249e2@linux-foundation.org>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 07, 2024 at 02:23:16PM -0700, Andrew Morton wrote:
> On Wed,  7 Aug 2024 15:48:04 -0400 Peter Xu <peterx@redhat.com> wrote:
> 
> > 
> > Tests
> > =====
> > 
> > What I did test:
> > 
> > - cross-build tests that I normally cover [1]
> > 
> > - smoke tested on x86_64 the simplest program [2] on dev_dax 1G PUD
> >   mprotect() using QEMU's nvdimm emulations [3] and ndctl to create
> >   namespaces with proper alignments, which used to throw "bad pud" but now
> >   it'll run through all fine.  I checked sigbus happens if with illegal
> >   access on protected puds.
> > 
> > - vmtests.
> > 
> > What I didn't test:
> > 
> > - fsdax: I wanted to also give it a shot, but only until then I noticed it
> >   doesn't seem to be supported (according to dax_iomap_fault(), which will
> >   always fallback on PUD_ORDER).  I did remember it was supported before, I
> >   could miss something important there.. please shoot if so.
> 
> OK.  Who are you addressing this question to?

Anyone who is familiar with fsdax + 1g.  Maybe Matthew would be the most
suitable, but I didn't track further on fsdax.

> 
> > - userfault wp-async: I also wanted to test userfault-wp async be able to
> >   split huge puds (here it's simply a clear_pud.. though), but it won't
> >   work for devdax anyway due to not allowed to do smaller than 1G faults in
> >   this case. So skip too.
> 
> Sounds OK.  So that's an additional project if anyone cares enough?

Right.

> 
> > - Power, as no hardware on hand.
> 
> Hopefully the powerpc people can help with that.  What tests do you ask
> that they run?

The test program [2] in cover letter should work as a very basic test; one
needs to setup the dax device to use 1g mapping first, though:

[2] https://github.com/xzpeter/clibs/blob/master/misc/dax.c

At least per my experience not much fancy things we can do there, e.g., I
think at least dev_dax has a limitation on vma split that it must be 1g
aligned when use 1g mappings, so even split can't happen (as iirc I used to
try some random mprotect on smaller ranges)..

Thanks,

-- 
Peter Xu

