Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF755A1531
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 17:05:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD5r82Vcnz3c6M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 01:05:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TDxsbUEO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WbSg80ly;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TDxsbUEO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WbSg80ly;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD5qS4rCtz2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 01:05:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661439904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iygQAkAgz4JDbn3KVJAwromqSNqOkmZrJ35R+TSCGBw=;
	b=TDxsbUEO27YB2MLQPPOf055swNSLtiN6Qa2Gbh8LIXtVDTlDZYul0ceGuwItl4oANdL6ks
	t9gWw5gXTQCyYDF5Xq0rlRJe5H4Za7zQHVyMhZhf7uEKJ7+oxYEvBtqb/oJQzy9lPc12Am
	5dYR3i0inVx0cIcJbSRgL7B18bDpVz4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661439905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iygQAkAgz4JDbn3KVJAwromqSNqOkmZrJ35R+TSCGBw=;
	b=WbSg80lyvUQyENVdiNOFKKUNKeYOjb0cQAJn7tdJYmuQwBr4HYb7HCokp59/SE1IBBP4eH
	8cjpOEWd6amp0/cVC3DySSecEallveOSCz9A9dwz4XGBkui0ufuIKD562xAdywxDuTppQE
	d1EXedFasT5ttOZrLykSAwZ8MhEc2aY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-UI5VrFy-P6q2TJqw6Argkg-1; Thu, 25 Aug 2022 11:05:03 -0400
X-MC-Unique: UI5VrFy-P6q2TJqw6Argkg-1
Received: by mail-qv1-f69.google.com with SMTP id n17-20020ad444b1000000b00496d5b41d37so8204280qvt.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 08:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=iygQAkAgz4JDbn3KVJAwromqSNqOkmZrJ35R+TSCGBw=;
        b=zSFbViiJyN58EOlRoV3kSmx31/YpZ3+lsvuxk27m+TzB4joq+Fpwk1ik9tYa6STuFz
         YwF4k2UJjOMqrWZxTj7mhTzY8q2egBfOS1DlFZt3GstC6oFZ7KgGQrDDPnk/x+hRogi9
         jQPNzAXtm8uCfeQQSHZXEo2bwc4fZfldfB2fAWJNcBjOrhQK91pIAwRnH8U/8w+gESzh
         87lAR5l51ROyesOhpLM3XuCdyUxsK6F3A7gvzGEtSKej4N68g/nwg8UsFO7vyVbfDsTg
         YDRhGt7aJnLpVcDCC1eIQPblFj1rhhVoUFJNY7yltyId9DfCbExw0Js3LLx1B7DuVAG5
         6rFA==
X-Gm-Message-State: ACgBeo1purLCWqoncs5ZIuULSw3R0wUQBrsJEU96YVN7QDCxzc6zmkIL
	xAM6tlbm2gyetLbEo5QMmNnhHEm68aDZJzXwg51eVHAtI1B11mGZm+LroTrk2rcIwxHDnJcx3ZR
	LZQLZFZ/E8e+m1nhXMGYNAbJxIw==
X-Received: by 2002:a05:622a:20e:b0:343:7345:36cc with SMTP id b14-20020a05622a020e00b00343734536ccmr3971332qtx.669.1661439903403;
        Thu, 25 Aug 2022 08:05:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5H6vUeaILfaettSLPx9OGO+p9IBfx7a4trs9PcWFxW10+WU/QvLs3nwiKRw0dOgxGyx6Uy1A==
X-Received: by 2002:a05:622a:20e:b0:343:7345:36cc with SMTP id b14-20020a05622a020e00b00343734536ccmr3971288qtx.669.1661439903064;
        Thu, 25 Aug 2022 08:05:03 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id bm25-20020a05620a199900b006b949afa980sm17692978qkb.56.2022.08.25.08.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 08:05:01 -0700 (PDT)
Date: Thu, 25 Aug 2022 11:04:59 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <YwePm5lMSU2tsW6f@xz-m1.local>
References: <1D2FB37E-831B-445E-ADDC-C1D3FF0425C1@gmail.com>
 <Yv1BJKb5he3dOHdC@xz-m1.local>
 <87czcyawl6.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <Yv5QXkS4Bm9pTBeG@xz-m1.local>
 <874jy9aqts.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <87czcqiecd.fsf@nvdebian.thelocal>
 <YwaJSBnp2eyMlkjw@xz-m1.local>
 <YwaOpj54/qUb5fXa@xz-m1.local>
 <87o7w9f7dp.fsf@nvdebian.thelocal>
 <87k06xf70l.fsf@nvdebian.thelocal>
MIME-Version: 1.0
In-Reply-To: <87k06xf70l.fsf@nvdebian.thelocal>
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

On Thu, Aug 25, 2022 at 11:24:03AM +1000, Alistair Popple wrote:
> By the way it's still an optimisation because in most cases we can avoid
> calling try_to_migrate() and walking the rmap altogether if we install
> the migration entries here. But I agree the comment is misleading.

There's one follow up question I forgot to ask on the trylock thing.  I
figured maybe I should ask out loud since we're at it.

Since migrate_vma_setup() always only use trylock (even if before dropping
the prepare() code), does it mean that it can randomly fail?

I looked at some of the callers, it seems not all of them are ready to
handle that (__kvmppc_svm_page_out() or svm_migrate_vma_to_vram()).  Is it
safe?  Do the callers need to always properly handle that (unless the
migration is only a best-effort, but it seems not always the case).

Besides, since I read the old code of prepare(), I saw this comment:

-		if (!(migrate->src[i] & MIGRATE_PFN_LOCKED)) {
-			/*
-			 * Because we are migrating several pages there can be
-			 * a deadlock between 2 concurrent migration where each
-			 * are waiting on each other page lock.
-			 *
-			 * Make migrate_vma() a best effort thing and backoff
-			 * for any page we can not lock right away.
-			 */
-			if (!trylock_page(page)) {
-				migrate->src[i] = 0;
-				migrate->cpages--;
-				put_page(page);
-				continue;
-			}
-			remap = false;
-			migrate->src[i] |= MIGRATE_PFN_LOCKED;
-		}

I'm a bit curious whether that deadlock mentioned in the comment is
observed in reality?

If the page was scanned in the same address space, logically the lock order
should be guaranteed (if both page A&B, both threads should lock in order).
I think the order can be changed if explicitly did so (e.g. fork() plus
mremap() for anonymous here) but I just want to make sure I get the whole
point of it.

Thanks,

-- 
Peter Xu

