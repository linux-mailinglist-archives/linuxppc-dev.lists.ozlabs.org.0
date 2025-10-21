Return-Path: <linuxppc-dev+bounces-13129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EA9BF8C1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 22:43:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crklv2W7Cz306d;
	Wed, 22 Oct 2025 07:43:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761079419;
	cv=none; b=achejGD68jb7FTGHt8Cz23tLa39wT9pMM5Bv4Vh0jbPVFgqELSu1WfF/3ucN5vyDS2WgA+quQDvdCjStsCokX1BRW1bxPh08qJb2qvUAxv7l2nOqTZzhhgHgCFixmWm5f8pXr3R1G/LdsQRLKTEbh9+4nKKrcXvBCTA5T768Z6gvPnmhVVhG3ZjD0F0qwJ0C6Civql6ijGnyoLp9tyC2T0saJykUUb3yXJe8mQowrm1HpQPWxv/mSlygh+iiv2yaq1Kk3iZgX+m1eg+bI0E7CKxTiwdWkoHrAKEit2obgD4bvMkzinzaRcLwsqnlv6TUrTNmD1/IiQD+UlTAy4BVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761079419; c=relaxed/relaxed;
	bh=Jca+iAluyvXYfcIcNG0HUymCKJQKka+3ZoKebkZZYlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IoEgr8jRzv/nzumyT0CUs9s3l0aRpqJOEC9ot2DzJZdRsKeNt4b2gW//ZndSdvKUyiYAP/oZfOxFpucmGuBL/vn7wRmlgZaNsdl3fdSiehbHY3+FGgQ1R6k7AHURnItYR4gIwoGPjZU0w49VJ4uhCjh09HSGxTM7Oe18XjQ4ukibxkr9pwGUpDBZUhG7jDpaYI05LEBR4qbJY7wqgB+UsQ6PbgGuAYCRwlclLFWqQ0FAZgZq7SBRZvXQrI9GUcXNpfU8NHHxhCQu5EnqTsXcTltjtWUpF+Y+DYnYuj5tCtg6ueGbPzBKY7yLvXA1Afg11pVrHjtrLXHNCi23rcX2ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XtMJuDZu; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XtMJuDZu; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XtMJuDZu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XtMJuDZu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crklt0Rj4z304H
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 07:43:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761079412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jca+iAluyvXYfcIcNG0HUymCKJQKka+3ZoKebkZZYlk=;
	b=XtMJuDZuu5oFP+YUHdoaRFlDVxXFNP4hJjhnZYyju9/872MpBrFJEqxGHbx9hz0PDJyVxG
	mQTicakszrbvhRecOcf9PHAWOBuBxj/6fH3j8eRD2L4Z69qAmx0k0R86kMzLT2o64zAipp
	f3CQIlKcNttmWVn5lrXBB/h5jV3SC8I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761079412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jca+iAluyvXYfcIcNG0HUymCKJQKka+3ZoKebkZZYlk=;
	b=XtMJuDZuu5oFP+YUHdoaRFlDVxXFNP4hJjhnZYyju9/872MpBrFJEqxGHbx9hz0PDJyVxG
	mQTicakszrbvhRecOcf9PHAWOBuBxj/6fH3j8eRD2L4Z69qAmx0k0R86kMzLT2o64zAipp
	f3CQIlKcNttmWVn5lrXBB/h5jV3SC8I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-IYF5cO7rO_GN-bhRFjj72g-1; Tue, 21 Oct 2025 16:43:28 -0400
X-MC-Unique: IYF5cO7rO_GN-bhRFjj72g-1
X-Mimecast-MFC-AGG-ID: IYF5cO7rO_GN-bhRFjj72g_1761079407
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-470fd59d325so30737965e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 13:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761079407; x=1761684207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jca+iAluyvXYfcIcNG0HUymCKJQKka+3ZoKebkZZYlk=;
        b=i58IQwPeVX5FlWjT534YppNW4fuKqxcNToXewFf3mxPnbQZrbXSS0O3tXa0gE2aYok
         6mZ0WCgBTPo7wIWEy6AlttL+4Mqp9IEzqroserNrJGTPx4rnc004N6GQ4igp4yvMwn3E
         Vgpvff4MADZv9G3e7TD9L83iOC7TeKnlB01dmqKhO7P35UqzUpx8H5xIDMSr+2ZpfL6+
         LSJYOScxEP5ny4NflC2Fscvf/UWd5a+Y+8fDZUNmmVxa+DkHFB6i8wEgbIPeDbPyuPiR
         uaTjMMfuMwsn11AjFROMfxFn/eEemaoEb+S8rR4jLxjz8SU1W0z67DwLH43WaJEGPc3W
         wd7w==
X-Forwarded-Encrypted: i=1; AJvYcCXLMhR5QFO+j+sfT6UjkKRYc0Pag2auk/lQTKgKruCO5zDFXkyOk9WEsXfGrKbhok2/lrAfSg6Gn0k2GTY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMj8JxTvtZY8lVtUeFgK5XufenV66axO1aVqNjitOq53TQhIoC
	fI9olvGB+Ms76INGARceI8QXg0HhjI/mUyz3a90H3D9PZQi6AZjIZGFgfLbzVW+Nx4NHkgNG/MF
	h++oDRCJzFDdj+9frh+5ZBK/el860WVWJFtchzi0pR/zGXZi/WLAJ1Lf6fZJsm+sZS2I=
X-Gm-Gg: ASbGncvRvtre/hhp9LqS9lqCigG1NzFaSJa5pRSy344LgVLJ/9JtimSOrYyzJ1ntHE2
	zJNIFkFF9G8gkltcWJiAq0O4+jT0uaAHa7QqPlGoZIbLflBw3eHSRuwO+jpPMS8evAo8cD+WeD2
	cv8YaX86ypdM3kDvYQgGZqDUUFx3iiXZbLkl7hec3J3VE+tzk35M9ixZIDdR1rSW/1O/2jViMyq
	f1sMqm97WkNv1QIr/gV1or/FoZ+LIPHwYn180vZ611uRxEdZ7Nx2+cigxcJmIy5/pOCpRZJYAwU
	2I1vjpAp8EjzmA8W2FoTs8sk3OiYbAQRkrsJKz/d7Q4dejwsAcrv9gRLWkYZiPe5Mmpu
X-Received: by 2002:a05:600c:4fd4:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4711791c5dfmr155489215e9.30.1761079407242;
        Tue, 21 Oct 2025 13:43:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3tqHiyIT27d9/w9pV3Cihx1kc1ZDJQnIJKiIuWuTpURVwED00bfMi5FBVB40yx0uQLffj0A==
X-Received: by 2002:a05:600c:4fd4:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4711791c5dfmr155488865e9.30.1761079406669;
        Tue, 21 Oct 2025 13:43:26 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c429e82dsm9612815e9.11.2025.10.21.13.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 13:43:26 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:43:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v1 03/23] powerpc/pseries/cmm: remove
 cmm_balloon_compaction_init()
Message-ID: <20251021164220-mutt-send-email-mst@kernel.org>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021125929.377194-4-david@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20251021125929.377194-4-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C33MH6T71w5T8z5isTP1pg3VZksW12pKmjRuiU090H4_1761079407
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 21, 2025 at 02:59:08PM +0200, David Hildenbrand wrote:
> Now that there is not a lot of logic left, let's just inline setting up
> the migration function.
> 
> To avoid #ifdef in the caller we can instead use IS_ENABLED() and make
> the compiler happy by only providing the function declaration.
> 
> Now that the function is gone, drop the "out_balloon_compaction" label.
> Note that before commit 68f2736a8583 ("mm: Convert all PageMovable users
> to movable_operations"), now not anymore.

What does this sentence mean?

> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/powerpc/platforms/pseries/cmm.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
> index 310dab4bc8679..67c7309c36147 100644
> --- a/arch/powerpc/platforms/pseries/cmm.c
> +++ b/arch/powerpc/platforms/pseries/cmm.c
> @@ -548,15 +548,9 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
>  
>  	return 0;
>  }
> -
> -static void cmm_balloon_compaction_init(void)
> -{
> -	b_dev_info.migratepage = cmm_migratepage;
> -}
>  #else /* CONFIG_BALLOON_COMPACTION */
> -static void cmm_balloon_compaction_init(void)
> -{
> -}
> +int cmm_migratepage(struct balloon_dev_info *b_dev_info, struct page *newpage,
> +		    struct page *page, enum migrate_mode mode);
>  #endif /* CONFIG_BALLOON_COMPACTION */
>  
>  /**
> @@ -573,11 +567,12 @@ static int cmm_init(void)
>  		return -EOPNOTSUPP;
>  
>  	balloon_devinfo_init(&b_dev_info);
> -	cmm_balloon_compaction_init();
> +	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
> +		b_dev_info.migratepage = cmm_migratepage;
>  
>  	rc = register_oom_notifier(&cmm_oom_nb);
>  	if (rc < 0)
> -		goto out_balloon_compaction;
> +		return rc;
>  
>  	if ((rc = register_reboot_notifier(&cmm_reboot_nb)))
>  		goto out_oom_notifier;
> @@ -606,7 +601,6 @@ static int cmm_init(void)
>  	unregister_reboot_notifier(&cmm_reboot_nb);
>  out_oom_notifier:
>  	unregister_oom_notifier(&cmm_oom_nb);
> -out_balloon_compaction:
>  	return rc;
>  }
>  
> -- 
> 2.51.0


