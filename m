Return-Path: <linuxppc-dev+bounces-10825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 150A0B21BE6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 05:58:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1Hmk5JtNz3d97;
	Tue, 12 Aug 2025 13:58:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754971126;
	cv=none; b=OrAoI0BfeDdyifkdDBi1AmE7w2+5oqHO9RO5jEjs4Q49HimArHtediIhWT8T5VZ7/P1+zFWbQHsiEZlQ+CGkszdFHd5dFG16d0JISKDgL+YQ5LnxZ0Y6H0qBhsI/yjGUmZMLdVMbqm3d8bfMk+M00Jy0PHl66wIAvo+OEc6nkTb6Lx6NItZRYx23uog4SiSYzD7l8zkrmBf028T8ZxNcfzggCpvOJwViT+cWingL/hIb15N6ozDtjKAir3JXFYmlePPSM7ygmCasJrYXooxD3BW/ATcggZpFXzQT0z0fLr7Fv7BJ2YYOzlrtqZMOYsblOvVjEcv3XYMpUDO7lxxJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754971126; c=relaxed/relaxed;
	bh=UsF4i7owr2w64jophO+zO+eW0GN81ddWs4iypkKqJ00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaiQU5MoYv1UvJfX5GNDw0b1riiQCFMC6o4I3WtxYJzZL0SXovOzWVqQ/hXP1sQF0c4BEwddONtu2cqqf1V73Xo4X98RKIrLjCYJjShuRlbjqKLuQvZ0g8WsUaG0CM5lCh7/rtuR85t4/sH1Qhdq11vVDaqzRhbYR71e/xdg5iVBguawA52+kM3od+PFfVDAUX15Sk8NcfmF5fDkGYKkEEBfttSVXuBrZUd251hKoFyX0tFMQ4xG6hH13Fpyg38EmBUw9X4ScOKWTRuIiUTk1XzZmgkSjn62gMCdk91i+1OcDw9AlJ3d3UL21jIp+ZilYRHdEwpG6TPrrAdQsqt7EQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZaSgsV3Y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZaSgsV3Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1Hmj3m7cz3d8R
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 13:58:44 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-32106b0930eso5270099a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 20:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754971121; x=1755575921; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UsF4i7owr2w64jophO+zO+eW0GN81ddWs4iypkKqJ00=;
        b=ZaSgsV3Y3FyUbCsTOht3D+EAikh9B+5/AXJPQqmMtAl9sLArlWG91800Bsrrx9Y5sT
         33TvXyNlCnTMSS/F/RORf4wWd+K2GpCLqPlAgQoNe/1NWPZYv+eQ38eLMmhfEG2ipx6c
         srHnev47D6AdwQHBDVHlm/IhPpovGbMHjKZGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754971121; x=1755575921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsF4i7owr2w64jophO+zO+eW0GN81ddWs4iypkKqJ00=;
        b=ASxKPLSQJGcqalWYhL4EebdDsEf+f5pPlXDgEvTY0hK6CmDSOQQaR82QV/KihijLO1
         Rv2yhZCU9Z9cHqGsXGEzqRs8YNcgoSCfnOcudMdk6l1fMNql6wSuLo+NaLMUjmv/E1dS
         z4cXDvaJeCorF2BNArPPqMp71tEyAU37+b4RZPyEOexvIDB9NjQewEaBPrVMSGC35YIH
         MCKxXKVaqoKeRvbGVDI1CWMNdXF2Ax7YYUFdfuHerliBtOXI468CIEC2qBb5CYE5Zhdg
         Drk51JoHL31rs4wiHMN9LuWCyJZXR7oPztPt80A2ko9VXQE6Ec0yw6X9EA/LuR+qIEbz
         AFyw==
X-Forwarded-Encrypted: i=1; AJvYcCVWMF7Ud1vss2TQKD1J3F2mmPvptTLUDAbr3J99aWvB7C89N1V5VNzNDStqsC8rQS+kIiUx9JcSXwakpG0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzHvyWMac4rlkRFs52wqMVZ9W923IJ4wIwYc+YENBs3nikGvqwL
	4IW6EJp0vJQxlhoUbU736LfnZlJK/o/MNKZGxRGueDU43MRZn0u7KCMmpESHAhA0dw==
X-Gm-Gg: ASbGncui0HPw/tPqwI5Q8jAHYEt9i+KkfizNNOkW1Wa2Nu1R+DmuTIOyAC+Ro/5vTsE
	MFkw6As/u7At5kyg1ut27BBvjpbrnox+/2iU1akn0zfd9zlcYAi/TkNIlQqn3oYRkGvoe+9AFIA
	Jh//S+9bZhLWLcPJLh+ryHPOb3Ee9oDiTyMaPQcdCY20qXFf2y46mkXShqUfGuy65wu8ZEKVVoL
	sGwGBVu0ZIpNlr/zTI6WQ/AIcxa3DZklBzxVLxuH6tYiVzPeKNOM+xNSUEVIC2/iTu7T9YbUA/2
	pJ17R0tdkTlA8oktrdwfaWzRbXhMtTlmtsJpUr9PERDGtCNyKZGR22qNilxxDShLCVLGBKqQmT6
	syDL42prAjRkKXPWGdD7wjFo9FLyyiHe+UaTl
X-Google-Smtp-Source: AGHT+IE0YyrVY5Vt8OKrl33IrgQwBQBekiXEdcW95C5mTt17WuM8Sondsrrkn0NdMV5pujBh12Fm4w==
X-Received: by 2002:a17:90b:2251:b0:31f:1a3e:fe31 with SMTP id 98e67ed59e1d1-321c0a11aa9mr3103600a91.11.1754971120678;
        Mon, 11 Aug 2025 20:58:40 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:e529:c59e:30f9:11d3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d846esm16436888a91.8.2025.08.11.20.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 20:58:40 -0700 (PDT)
Date: Tue, 12 Aug 2025 12:58:29 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-aio@kvack.org, linux-btrfs@vger.kernel.org, 
	jfs-discussion@lists.sourceforge.net, Andrew Morton <akpm@linux-foundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Benjamin LaHaise <bcrl@kvack.org>, 
	Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
	David Sterba <dsterba@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Dave Kleikamp <shaggy@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v1 2/2] treewide: remove MIGRATEPAGE_SUCCESS
Message-ID: <lky6lmpq5hsflc4rcs2hev5i3gctvbrppysttnzo22r6oiryw4@edfre7sprwk5>
References: <20250811143949.1117439-1-david@redhat.com>
 <20250811143949.1117439-3-david@redhat.com>
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
In-Reply-To: <20250811143949.1117439-3-david@redhat.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On (25/08/11 16:39), David Hildenbrand wrote:
> At this point MIGRATEPAGE_SUCCESS is misnamed for all folio users,
> and now that we remove MIGRATEPAGE_UNMAP, it's really the only "success"
> return value that the code uses and expects.
> 
> Let's just get rid of MIGRATEPAGE_SUCCESS completely and just use "0"
> for success.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

FWIW,
Acked-by: Sergey Senozhatsky <senozhatsky@chromium.org> [zsmalloc]

