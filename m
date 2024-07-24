Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAFB93B377
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 17:16:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BCtLbAeB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BCtLbAeB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTczn6J9jz3cYr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 01:16:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BCtLbAeB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BCtLbAeB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTcz4111cz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2024 01:15:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721834138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RUkRMF0WARuhu/29TKm6k3lHbJ84nYZGVBuX5dht2/s=;
	b=BCtLbAeB56q8SCHZJ96iE1jO956tyKrDRufvR12KTEUy0y4rPfsslD1aJ7ItdF9p07Aqkd
	/O2m3HDHkTQhHgIM1V+HHORX+2EYcKYe2A3RuMp/VGyODrmOSImvRXfurkTMxJH4mqFt1A
	S5WIIA/B7scpJeHtcETd43PegBMpg2g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721834138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RUkRMF0WARuhu/29TKm6k3lHbJ84nYZGVBuX5dht2/s=;
	b=BCtLbAeB56q8SCHZJ96iE1jO956tyKrDRufvR12KTEUy0y4rPfsslD1aJ7ItdF9p07Aqkd
	/O2m3HDHkTQhHgIM1V+HHORX+2EYcKYe2A3RuMp/VGyODrmOSImvRXfurkTMxJH4mqFt1A
	S5WIIA/B7scpJeHtcETd43PegBMpg2g=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-klUQejJ_NiisJ4umxty6-A-1; Wed, 24 Jul 2024 11:15:34 -0400
X-MC-Unique: klUQejJ_NiisJ4umxty6-A-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-447e66bbc62so3907711cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 08:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721834134; x=1722438934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUkRMF0WARuhu/29TKm6k3lHbJ84nYZGVBuX5dht2/s=;
        b=N+ge1A31VFViaUAxEPO60bmeuTeuajU+MUoM9pjqPyn7KO+qz2jevRFlX1XjNuExK3
         i4pSLU/+w6YfiKHm2woBst8lGLYz+DA3Nc+i1dfTuwM8Z4yzTyBcpe9ICz7CqoE/M8KR
         1yQ9LluHCTP2f/Js3lJxxdya1XDvrUNDXMTb9UGmGQk3CWJ5tE+o/iJozpAkMj+6lAx0
         /cktpwKyVJCRGmG6/zSKpEFdV+J0+euauhp2AnzvXbIubwFB77sJNr2fy3PBZTkVCYah
         vzTgmIZ3NZLVX/5HRh8mSZDYiRgbqDbScCZvrjUpW8sy+rwMydO/cS213jroTQM5omOu
         aTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoSxny2CPFuL6a4N+0R3e/DAmX8t8S4xeeDWoW1zrBKn9AM9u3v4ppkAXpJXw/zq7tJq40DIbRiNwbPkYzIbZA9wPtLXqh22OUYXSMZA==
X-Gm-Message-State: AOJu0Yzf8RCD5qfbV8U3URgNsLxRJzId//bS5oUlJ1MewFRFtXWWlSlp
	yDGd/dE9QFrahkMYqXOX4nw3v8CZZzgZROrlwUJup8PB7xIGyu2HL6NxnGs+ClMJd03NiirefZM
	sSuXESL0TNjGzAsCTdH1cjmu2n7/jQ1+1VPLhbDbiuE7q70dfsUurunIL+LCFonY=
X-Received: by 2002:a05:622a:1b9e:b0:44e:d016:ef9 with SMTP id d75a77b69052e-44fa5387fb4mr104228251cf.9.1721834133797;
        Wed, 24 Jul 2024 08:15:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg7QRjC9p2RRivLgKhyMUlPKC9on06KG9o9HrmhOfrljMwx/vxFCI8Gd5BGr39JQzDkkckHQ==
X-Received: by 2002:a05:622a:1b9e:b0:44e:d016:ef9 with SMTP id d75a77b69052e-44fa5387fb4mr104227901cf.9.1721834133260;
        Wed, 24 Jul 2024 08:15:33 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f9cdbe223sm54733741cf.83.2024.07.24.08.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 08:15:32 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:15:29 -0400
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] mm/mprotect: Fix dax puds
Message-ID: <ZqEakeCfr3rVrUz6@x1n>
References: <20240715192142.3241557-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240715192142.3241557-1-peterx@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2024 at 03:21:34PM -0400, Peter Xu wrote:
> [Based on mm-unstable, commit 31334cf98dbd, July 2nd]
> 
> v3:
> - Fix a build issue on i386 PAE config
> - Moved one line from patch 8 to patch 3
> 
> v1: https://lore.kernel.org/r/20240621142504.1940209-1-peterx@redhat.com
> v2: https://lore.kernel.org/r/20240703212918.2417843-1-peterx@redhat.com
> 
> Dax supports pud pages for a while, but mprotect on puds was missing since
> the start.  This series tries to fix that by providing pud handling in
> mprotect().  The goal is to add more types of pud mappings like hugetlb or
> pfnmaps.  This series paves way for it by fixing known pud entries.
> 
> Considering nobody reported this until when I looked at those other types
> of pud mappings, I am thinking maybe it doesn't need to be a fix for stable
> and this may not need to be backported.  I would guess whoever cares about
> mprotect() won't care 1G dax puds yet, vice versa.  I hope fixing that in
> new kernels would be fine, but I'm open to suggestions.
> 
> There're a few small things changed to teach mprotect work on PUDs. E.g. it
> will need to start with dropping NUMA_HUGE_PTE_UPDATES which may stop
> making sense when there can be more than one type of huge pte.  OTOH, we'll
> also need to push the mmu notifiers from pmd to pud layers, which might
> need some attention but so far I think it's safe.  For such details, please
> refer to each patch's commit message.
> 
> The mprotect() pud process should be straightforward, as I kept it as
> simple as possible.  There's no NUMA handled as dax simply doesn't support
> that.  There's also no userfault involvements as file memory (even if work
> with userfault-wp async mode) will need to split a pud, so pud entry
> doesn't need to yet know userfault's existance (but hugetlb entries will;
> that's also for later).
> 
> Tests
> =====
> 
> What I did test:
> 
> - cross-build tests that I normally cover [1]
> 
> - smoke tested on x86_64 the simplest program [2] on dev_dax 1G PUD
>   mprotect() using QEMU's nvdimm emulations [3] and ndctl to create
>   namespaces with proper alignments, which used to throw "bad pud" but now
>   it'll run through all fine.  I checked sigbus happens if with illegal
>   access on protected puds.
> 
> - vmtests.
> 
> What I didn't test:
> 
> - fsdax: I wanted to also give it a shot, but only until then I noticed it
>   doesn't seem to be supported (according to dax_iomap_fault(), which will
>   always fallback on PUD_ORDER).  I did remember it was supported before, I
>   could miss something important there.. please shoot if so.
> 
> - userfault wp-async: I also wanted to test userfault-wp async be able to
>   split huge puds (here it's simply a clear_pud.. though), but it won't
>   work for devdax anyway due to not allowed to do smaller than 1G faults in
>   this case. So skip too.
> 
> - Power, as no hardware on hand.

Ping - any review comments or even tests would be greatly welcomed.

I'm not sure whether this matters for anyone yet so far.  I hope this still
makes sense for DAX even if this is an extremely corner case...

Just to mention the follow up users of this path:

  - huge pfnmap 1G may use this, when VM_PFNMAP can be mapped with 1G too,
    then we should hit similar "bad pud" here.

  - hugetlb rework will use this, when we want this path to process 1G
    hugetlb pages too.

The 1st user is not a must in my initial plan, as VFIO + VM use case
doesn't use mprotect(), so we can keep (1) broken together with DAX 1G
here.  But for the long term we should still fix this, IMHO.

Thanks,

-- 
Peter Xu

