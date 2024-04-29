Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9E8B597E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 15:11:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TvGE4COR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CM8dzzuv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSkGy14jvz3cYN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 23:11:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TvGE4COR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CM8dzzuv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSkG96nWtz3cLL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 23:10:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714396222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkfFCXYv9UcZuwlRLfrkkATbPa3Z5klq1PrYHXMu/1k=;
	b=TvGE4CORp8tFECPgybRImlbpxYB/Gp5C7qwntzxmJt44McLk7Mc8pWZynXmLdIbI2Njpw8
	rFgV2geW8sfnQBwN51U07GXCrOMAtX9tDazaj+jCwUe+kMkVs/PWRQoSFzMx3Q5mGb3dUB
	9T5Ye/kn5SyIYAWU+WzMDoCEfZVmrIo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714396223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FkfFCXYv9UcZuwlRLfrkkATbPa3Z5klq1PrYHXMu/1k=;
	b=CM8dzzuvpzb67/o+vZItmkG7FYbrUf7DD2JqhdpIgtL/V1W6XdGA+SrlMmy1ROKNoAXJxp
	AK9azcmS1PxcX3ssy7SCGfn3aeJHvhdMHD1gyKcKU7GCmas7m5yYFnsjPngvomyAIValJD
	JXQx/KVXSAdfiQDyEWsFIOhTu5eNmBA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-dOiX02CdNsGN8-NdCNE7dA-1; Mon, 29 Apr 2024 09:10:20 -0400
X-MC-Unique: dOiX02CdNsGN8-NdCNE7dA-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-69627b26a51so594706d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 06:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714396220; x=1715001020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkfFCXYv9UcZuwlRLfrkkATbPa3Z5klq1PrYHXMu/1k=;
        b=w8zYYpToCF8SVRDvWIeKCUQ/g6RaVcGbQK++K7pyG5TT1TCPpjYwIuS1HnOUylBSfd
         ME2GZCwutsTQxGCjesw81UEHM+8wKXdEkYqMRoMUWNekCEvZ8iRqbnL/OAMT3a0Xpbpw
         AJeoxoOlFE6ZIvzE8TKNYvXXD6+BQxBYWdX4YAcutNPdkb+8DpbA95K5lDu7oz8/bdX8
         1I3vsKbqUg/jPJhtBBotGNKaXe0n+KC2n6MoLiz9lfzlEot7hrx2drvEQ9Jp4owJ0geo
         yipEVfV1EhHg0uZ9eBOllpEBw/63sVrv+S6Px0bf20rFI6n7SdQSHOVdBWGNOuJe83/2
         H4vA==
X-Forwarded-Encrypted: i=1; AJvYcCV703V244Mmg7cbcUffkBSq62xrlsIxg5Ug3RYZRZso6Sbhy14T07GizcuBUdQ5It1asCf3YnFLZlBMmA4slmZfBYs6wlxdRkG7F8Scng==
X-Gm-Message-State: AOJu0Yzelbph/8B/l1QIt4X+zpZBWyF3cO/s/bkEmPoOh1f394BbnORs
	T1gTtAKvGUBqglZugr0LK6brPCKsg+R63Dq5Hk9OsleL/Uaolo4CLh+4vVwOkyecgASX81STxP9
	Ia9w15bZFVQBxqF03tFeUiN3loIZDerNRtyipXkva+dfOjczS9qJH/Kuw6MsxvrE=
X-Received: by 2002:a05:6214:d08:b0:69b:7d34:9f6 with SMTP id 8-20020a0562140d0800b0069b7d3409f6mr11995223qvh.5.1714396219875;
        Mon, 29 Apr 2024 06:10:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3QEggTWhye5fJGV3QCGhFkQqVWr8moqX+4hjr2aO72fCK+ZED3EYpcL7QxN7jCYiTunNTIg==
X-Received: by 2002:a05:6214:d08:b0:69b:7d34:9f6 with SMTP id 8-20020a0562140d0800b0069b7d3409f6mr11995189qvh.5.1714396219169;
        Mon, 29 Apr 2024 06:10:19 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id g6-20020a0cf846000000b0069b7edb9665sm1896238qvo.19.2024.04.29.06.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 06:10:18 -0700 (PDT)
Date: Mon, 29 Apr 2024 09:10:16 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 2/2] mm/selftests: Don't prefault in gup_longterm tests
Message-ID: <Zi-cONgqV4_kUIE4@x1n>
References: <20240428190151.201002-1-peterx@redhat.com>
 <20240428190151.201002-3-peterx@redhat.com>
 <4171dbb6-81c0-4553-a405-a55f75be4cb7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4171dbb6-81c0-4553-a405-a55f75be4cb7@redhat.com>
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, John Hubbard <jhubbard@nvidia.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2024 at 09:28:15AM +0200, David Hildenbrand wrote:
> On 28.04.24 21:01, Peter Xu wrote:
> > Prefault, especially with RW, makes the GUP test too easy, and may not yet
> > reach the core of the test.
> > 
> > For example, R/O longterm pins will just hit, pte_write()==true for
> > whatever cases, the unsharing logic won't be ever tested.
> > 
> > This patch remove the prefault.  This tortures more code paths at least to
> > cover the unshare care for R/O longterm pins, in which case the first R/O
> > GUP attempt will fault in the page R/O first, then the 2nd will go through
> > the unshare path, checking whether an unshare is needed.
> > 
> > Cc: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   tools/testing/selftests/mm/gup_longterm.c | 12 +++++++++---
> >   1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
> > index ad168d35b23b..488e32186246 100644
> > --- a/tools/testing/selftests/mm/gup_longterm.c
> > +++ b/tools/testing/selftests/mm/gup_longterm.c
> > @@ -119,10 +119,16 @@ static void do_test(int fd, size_t size, enum test_type type, bool shared)
> >   	}
> >   	/*
> > -	 * Fault in the page writable such that GUP-fast can eventually pin
> > -	 * it immediately.
> > +	 * Explicitly avoid pre-faulting in the page, this can help testing
> > +	 * more code paths.
> > +	 *
> > +	 * Take example of an upcoming R/O pin test, if we RW prefault the
> > +	 * page, such pin will directly skip R/O unsharing and the longterm
> > +	 * pin will success mostly always.  When not prefaulted, R/O
> > +	 * longterm pin will first fault in a RO page, then the 2nd round
> > +	 * it'll go via the unshare check.  Otherwise those paths aren't
> > +	 * covered.
> >   	 */
> This will mean that GUP-fast never succeeds, which removes quite some testing
> coverage for most other tests here.
> 
> Note that the main motivation of this test was to test gup_fast_folio_allowed(),
> where we had issues with GUP-fast during development.

Ah I didn't notice that, as I thought that whitelists memfd ones.

> 
> Would the following also get the job done?
> 
> diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
> index ad168d35b23b7..e917a7c58d571 100644
> --- a/tools/testing/selftests/mm/gup_longterm.c
> +++ b/tools/testing/selftests/mm/gup_longterm.c
> @@ -92,7 +92,7 @@ static void do_test(int fd, size_t size, enum test_type type, bool shared)
>  {
>  	__fsword_t fs_type = get_fs_type(fd);
>  	bool should_work;
> -	char *mem;
> +	char tmp, *mem;
>  	int ret;
>  	if (ftruncate(fd, size)) {
> @@ -119,10 +119,19 @@ static void do_test(int fd, size_t size, enum test_type type, bool shared)
>  	}
>  	/*
> -	 * Fault in the page writable such that GUP-fast can eventually pin
> -	 * it immediately.
> +	 * Fault in the page such that GUP-fast might be able to pin it
> +	 * immediately. To cover more cases, don't fault in pages writable when
> +	 * R/O pinning.
>  	 */
> -	memset(mem, 0, size);
> +	switch (type) {
> +	case TEST_TYPE_RO:
> +	case TEST_TYPE_RO_FAST:
> +		tmp = *mem;
> +		asm volatile("" : "+r" (tmp));
> +		break;
> +	default:
> +		memset(mem, 0, size);
> +	};
>  	switch (type) {
>  	case TEST_TYPE_RO:

Yes this could work too.

The test patch here doesn't need to rush. David, how about you prepare a
better and verified patch and post it separately, making sure to cover all
the things we used to cover plus the unshare?  IIUC it used to be not
touched because of pte_write() always returns true with a write prefault.

Then we let patch 1 go through first, and drop this one?

Thanks,

-- 
Peter Xu

