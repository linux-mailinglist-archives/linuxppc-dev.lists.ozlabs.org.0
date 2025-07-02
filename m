Return-Path: <linuxppc-dev+bounces-10018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FB8AF0D86
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 10:12:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXCKl60CXz30FR;
	Wed,  2 Jul 2025 18:11:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751443915;
	cv=none; b=g9L1Z7lUaxmxLbzEeyTgDlfrqmeZqkrHKeqZdU0+BHh37tAvxKr+ujDF92VOP740ImRlqu+gsYS25cQV5I7y4KZaaiH0eTJnvOO29RMrHK0mkdQDcKTouidAA0KybYirP7AWhzOup5iukPHOWE8jHDF3MtN2EceUgtIf3vYfYIDkDT1zmAlZ1UfD/CGrsIyfyMxZhCT9+HmdLgPM83KtLFA9PfPmTi1AclzteN1gxPv0ODVDGjaeRRkm7r9LzCX9l6CAeTIOnvUX0HdYRxegtrgCPEhoESjhGSbycvvQJ7LDWngP6s3pingKWQ4m/Hxto8P2xYsguj2GU93Au+P9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751443915; c=relaxed/relaxed;
	bh=Ndb+JaIMrjzxA+tCLX6/GeFttkCVzpWqjwe11W0C+PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANJ+fHTFP0eppfU8tOoLsH6tByGUsJD33+DT5EQCvTtU0Ncyo41ybu08IFb2e5EVOyKhVJ22aMPYKSiRsLsdndjCBt9frTxE/uIVxDTVPH58uXw3nhijjdmBg4ucKQIi1fg2MyJqf66DlQf1Kyb+JvomUobpMSBpCFNzwR3nrpdd2YKBA/xmOARM8Uut0toJ0+N2fHvOjc1ZZ/4fWuUH/Uk2AIuGGDAFquTUICo3KVmdGGquUaW9TccNZwp4FdxAXQe11S8nCU/NOWF29r3d0WWus9nO8s5TbMxDlcHX2PpZW3e1eCYFAG90XG8MCtWhwYwgfKIlJ5Vt5BFNClDtfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OGk/iWhT; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OGk/iWhT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXCKk3tpKz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jul 2025 18:11:53 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-234b440afa7so66213955ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jul 2025 01:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751443910; x=1752048710; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndb+JaIMrjzxA+tCLX6/GeFttkCVzpWqjwe11W0C+PU=;
        b=OGk/iWhTQVoBEzLItllTI+UjFCdUGpynvdMxW8XiyFasOaazsn07YwGsV1x/+5I40X
         yQn4WqskkU2qWgAbyqZtgOT3nf1t1czKo/gncPaXDIeqk6VhvY9ldDI0xQxEHznG8M9t
         wQEKpqqJesBjFHh4gzE3YOrZJ5F7LkltwrOFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751443910; x=1752048710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndb+JaIMrjzxA+tCLX6/GeFttkCVzpWqjwe11W0C+PU=;
        b=vIKi1ql/UOdJQ/eayxhgIZ7TJHaEiy9vcSZc5ZeRZVCcMVPaCsvzMjUkue2vNB+VEb
         qcVFGYZZ137TFHewcuHEFkiEOle/vN5ol1OlDiszmCbf9rJefLGof/eCSYa7dJNW48pL
         hs7U1uHAupXVov2sB14ajQLjdukUJkLqK309PNlnzyEMVCKdd+OaxuJZ7JACh9vKKERy
         KPnmP1TlO8upB7mEn69zRWrCo8LUs0oELgKKwiZeH7pkoNmJrMB/b5JVF8Rkxeh8TBX1
         pxJTb28cnRwqsO/1wScb8dDzuC5te3ZuA5Zn9/0D7T/CaaOkx7SXO+sBwGQn2giGU5TW
         dOYA==
X-Forwarded-Encrypted: i=1; AJvYcCWw7ZNfX4yk+EBSKe/MibeADmYOzrFXicj70g4Umv5XfoHevPRUPuUJNiyfH3Qc7CexW6O1dOl7ucV7Ypc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEPoNjJxft74UH9f7w1zy5ZCtrwWuNeWBGWDNOHrFtXBZIJYbm
	YGTjs7Obw6RVkwJ84XzwZ2ARkNxgAEjiYyyCwDBomcofu/XAwe4Nr2GB8lRBkP89dQ==
X-Gm-Gg: ASbGncse8YOAlTd2gF7n8dUisNAcbiQkOVqdXjqC4fyUvvtto4MHuK/yRGqYFK6ZWRF
	db5U3MNM6mQLWPdkhexOeCeDzou7Ox4QGxgpT0FRStGudEKHqlAQXtTKqNGYxtJQPSux5KLXXVQ
	mFdnvK6GhoEuS4bwdoyajBSxSf647ac6jwqSrQtmKJoxKjbZhzRg+uoP1TxFZ76tq3nwHCiadbx
	bV4KzpcmOFmpfmXsOiu8iBgQEiz6skfpA4IYkAbvQxSRYjSaSbnthGv0KwMgQxrC3kecut7VyR9
	lGQ5RVmo/BdKn8C6UZcRf2kmOVljjN4I8BN5H7nVT5NLqlYh1QAQVEQrQVJWnJix6A==
X-Google-Smtp-Source: AGHT+IFyaxLPiNw4RnMZfl9Tf3kKU0bVL2nwN672ya66HP6pYgxM8O8hDYVQs76FVVGhmt0dmGwu+w==
X-Received: by 2002:a17:903:320b:b0:234:f1ac:c036 with SMTP id d9443c01a7336-23c6e5e23d7mr21917615ad.50.1751443910448;
        Wed, 02 Jul 2025 01:11:50 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8825:8cdb:cb6b:8e71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3013d7csm12080632a12.11.2025.07.02.01.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:11:49 -0700 (PDT)
Date: Wed, 2 Jul 2025 17:11:38 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630130011.330477-13-david@redhat.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On (25/06/30 14:59), David Hildenbrand wrote:
[..]
>  static int zs_page_migrate(struct page *newpage, struct page *page,
> @@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>  	unsigned long old_obj, new_obj;
>  	unsigned int obj_idx;
>  
> +	/*
> +	 * TODO: nothing prevents a zspage from getting destroyed while
> +	 * isolated: we should disallow that and defer it.
> +	 */

Can you elaborate?

