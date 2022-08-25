Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E81E5A1D3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 01:37:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDKBD4GrCz3bly
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 09:37:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VEDmfEG9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F0XcLOIz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VEDmfEG9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F0XcLOIz;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDK9V4Pk7z2y8F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 09:36:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661470585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fZkbW2nKw9OcNR++w2Lt3hNVn3FfxAMwHGTXAs+/ztQ=;
	b=VEDmfEG9MUWM9r3KysdWru4aILYPypXD/vLhGH5sUKBsqx48ZkXux9/QlhpHt9qUMRLm0e
	gClOSDKYhimdLJsGQs57GhIvZUwufxBj2gKTIbkWA6acCewbJxXnG5xyuDl3OIgEv20hPN
	neX9lbP1dZWaWrPt8YN0DzTdGZbP9jc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661470586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fZkbW2nKw9OcNR++w2Lt3hNVn3FfxAMwHGTXAs+/ztQ=;
	b=F0XcLOIzLNglp5hx92lpgXxvXF7jWO92HyVdLMnehUfu5/xOmsZ2kA1XfOfC+1lygG/pCH
	H6AuV4SgBy2LHQVFsNbp9sX2siLqzPwHpyXSOKyCycGPpyaUI8SsvrAt/Xd6c23lNKvqbk
	TYLq5xRtrHJUPWV7e7vxRYJkVwSvdWg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-JLhsMKsuMOK7vL0sGZRk_Q-1; Thu, 25 Aug 2022 19:36:22 -0400
X-MC-Unique: JLhsMKsuMOK7vL0sGZRk_Q-1
Received: by mail-qv1-f70.google.com with SMTP id dc16-20020a056214175000b0049717d038b5so3641393qvb.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 16:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=fZkbW2nKw9OcNR++w2Lt3hNVn3FfxAMwHGTXAs+/ztQ=;
        b=ViPKwKtRsJ2EsWRufq9XjqLJX+wvDnfQcOHS2Mn2RO2urooIVX4aVkEL6k8QMejjOh
         No6Y0MMaKL+teaQ9zmCs7JOzJpurqJQuztHkib9troYM0fhmBZ+S9TPkdR80h8GLlXjV
         uJ7yOzXpLah9H0eURI3Nj9s3ngD1canIKh1/LA8ofgYNSRh+8e13oCbGxGH6dFiF30At
         EUtobgT2NvbW0+LDPJoyoe3CbbGtzPEM6Xlb7gKB4+t1oW9G7IqtaYxzsYKAiTf9e687
         ymeNC2yoFohqICpYpplXjB69LSYbiDZ6/lJwXbLJoQU/vE7RxQJi6Fj2Z2XDF3+jcOtk
         07GA==
X-Gm-Message-State: ACgBeo0nJpJAA35rZkM9PK71r7FSFkwApOPbRww2mb/AILomDiack7Gs
	tcEcgB8n635ScZZMF2rqPfpsyMd2H7u1TwR2RUUGIhgUz/ZkXv7ZPNCU3LHI7sDM96+eI47ndIV
	7GSH/0Sv99JeAdPJfuaATC310lQ==
X-Received: by 2002:ac8:5948:0:b0:342:f500:2eb7 with SMTP id 8-20020ac85948000000b00342f5002eb7mr5760967qtz.483.1661470581833;
        Thu, 25 Aug 2022 16:36:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7TBH9R3amncjXP/5aFj5LeS8C1KlxU0maHmlQmU9GZdotjAyQBWdSKlYFKnk+U7FuoDJCUoA==
X-Received: by 2002:ac8:5948:0:b0:342:f500:2eb7 with SMTP id 8-20020ac85948000000b00342f5002eb7mr5760938qtz.483.1661470581599;
        Thu, 25 Aug 2022 16:36:21 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id w16-20020a05620a425000b006bba46e5eeasm663162qko.37.2022.08.25.16.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 16:36:21 -0700 (PDT)
Date: Thu, 25 Aug 2022 19:36:18 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <YwgHcjBmldFiI71O@xz-m1.local>
References: <87czcyawl6.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <Yv5QXkS4Bm9pTBeG@xz-m1.local>
 <874jy9aqts.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <87czcqiecd.fsf@nvdebian.thelocal>
 <YwaJSBnp2eyMlkjw@xz-m1.local>
 <YwaOpj54/qUb5fXa@xz-m1.local>
 <87o7w9f7dp.fsf@nvdebian.thelocal>
 <87k06xf70l.fsf@nvdebian.thelocal>
 <YwePm5lMSU2tsW6f@xz-m1.local>
 <877d2wezll.fsf@nvdebian.thelocal>
MIME-Version: 1.0
In-Reply-To: <877d2wezll.fsf@nvdebian.thelocal>
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, John Hubbard <jhubbard@nvidia.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Linux MM <linux-mm@kvack.org>, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>, stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 26, 2022 at 08:09:28AM +1000, Alistair Popple wrote:
> > I looked at some of the callers, it seems not all of them are ready to
> > handle that (__kvmppc_svm_page_out() or svm_migrate_vma_to_vram()).  Is it
> > safe?  Do the callers need to always properly handle that (unless the
> > migration is only a best-effort, but it seems not always the case).
> 
> Migration is always best effort. Callers need to be prepared to handle
> failure of a particular page to migrate, but I could believe not all of
> them are.

Ok, I see that ppc list is in the loop, hopefully this issue is aware since
afaict ppc will sigbus when migrate_vma_setup() fails, otoh the svm code
just dumps some device error (and I didn't check upper the stack from there).

> 
> > Besides, since I read the old code of prepare(), I saw this comment:
> >
> > -		if (!(migrate->src[i] & MIGRATE_PFN_LOCKED)) {
> > -			/*
> > -			 * Because we are migrating several pages there can be
> > -			 * a deadlock between 2 concurrent migration where each
> > -			 * are waiting on each other page lock.
> > -			 *
> > -			 * Make migrate_vma() a best effort thing and backoff
> > -			 * for any page we can not lock right away.
> > -			 */
> > -			if (!trylock_page(page)) {
> > -				migrate->src[i] = 0;
> > -				migrate->cpages--;
> > -				put_page(page);
> > -				continue;
> > -			}
> > -			remap = false;
> > -			migrate->src[i] |= MIGRATE_PFN_LOCKED;
> > -		}
> >
> > I'm a bit curious whether that deadlock mentioned in the comment is
> > observed in reality?
> >
> > If the page was scanned in the same address space, logically the lock order
> > should be guaranteed (if both page A&B, both threads should lock in order).
> > I think the order can be changed if explicitly did so (e.g. fork() plus
> > mremap() for anonymous here) but I just want to make sure I get the whole
> > point of it.
> 
> You seem to have the point of it. The trylock_page() is to avoid
> deadlock, and failure is always an option for migration. Drivers can
> always retry if they really need the page to migrate, although success
> is never guaranteed. For example the page might be pinned (or have
> swap-cache allocated to it, but I'm hoping to at least get that fixed).

If so I'd suggest even more straightforward document for either this
trylock() or on the APIs (e.g. for migrate_vma_setup()).  This behavior is
IMHO hiding deep and many people may not realize.  I'll comment in the
comment update patch.

Thanks.

-- 
Peter Xu

