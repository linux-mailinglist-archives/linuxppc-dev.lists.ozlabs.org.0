Return-Path: <linuxppc-dev+bounces-9517-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FCDADFB58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 04:45:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bN4jN5frYz2yPS;
	Thu, 19 Jun 2025 12:45:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750301144;
	cv=none; b=BLbJciReCeBqzvVxd3WTQXnXyzntXM6fy4OytondR8BMCLt1L6OqCyoRpoJJV6UmgDl8/sEs/I++kO/l7RSNsEQRup7+MTLVm8cw7jDj2YmJeI3rqt/g0qqt5LCZQMDxjpNaSmIELFK3kdEniN26wNCGMBm/UJ1ykOcUhBt9ISRfnfbjuhXeh7/XODJh+8yeC9Zl/tkx+jEVz7JZ2XAcS4eWkwBvjuMaCuoBcOT9FJeePg/uF3B4pennokNwgq9A/f1uJ0+6TGv0tUy7Q6+EMIrW86Ons1Vned4T5hBFOrkMNDNWUFmHCS4a/XWp1yApxyNnLQMKdeT1V6TuQWuQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750301144; c=relaxed/relaxed;
	bh=qVwsh/DCfF7Xz7iwx0RMWfoA+1QEfSvNmteXgwq8Uto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ji2r/pMsww94Xervkx2fDMjIKuvy6ggSSpMofLYAxEIymGiCLSGocQ6511jMsv5WtKzWd7CIj9mWSWSoL/xkGlupEo9v0UAY/McZ6JjekrxGqhyM6sDAkRBddTW/NzvmrEUCPvmR+MzSOiv/HKZTgd3NqeozAiTcBUtyLMpTTyF+EL+mo8qZ6XibwCT+uIUoczS8Kp9gAUAaShZpd2lc28eGn7u6WVksf/WQ8EMkKzGdRKvHQf16p8Re7BeBw6aUW4BE7RqMdalkGdHVx6R/nZ1fzI0gB0dhaGsfoV3gJQmVTsSR0ayFaSjDUQaPVMkJJx4BJUQX/R5oj8X0jskiDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G9RC2v+z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G9RC2v+z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bN4jN0pttz2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 12:45:43 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso273760a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 19:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750301141; x=1750905941; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qVwsh/DCfF7Xz7iwx0RMWfoA+1QEfSvNmteXgwq8Uto=;
        b=G9RC2v+zHp2nGbVqB33dBoOP4AvVw21k+pPHFGEmnMcB1CFvgsSYELYOP146EWFifH
         b/MBZVl2fOux/Y2YoIa5dg75msraq1VxyGlNeY/wT6WqZZScu20gEVAHhImBUMtLr14F
         eie2d0CJqtyL5brQ1I8/QrKUr/rk3oY8OM7ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750301141; x=1750905941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVwsh/DCfF7Xz7iwx0RMWfoA+1QEfSvNmteXgwq8Uto=;
        b=YgFKtZFkG3cTLTJCzJkJUYuD13KB6FEIfedRE67cIdwdHtQXjhM8InqXkzkIlurpu7
         06OzmWvAElAHUw2HSKDZNnrbUjQYJhfmRFqkbu7qlnQwPtGrtYYzVjtjEltnsTlmMqbO
         3KvGDmAyQxoMSmEeRiuaeYlfP9t+cfNbcfhFPtrXBm09x0AqaUfpWanZff78We6Pqpwt
         OPUyGAZc9B08A7FNK4C9sx8DSpLBxUCn2m/UyXUAMrBJWI/lwE+xso0c83uv26iEJ6fO
         B8Pq283wUm52XP/DH8hrzvaEnd0AuJGOAAoD5aCQTqnRwTjyM0GmPtl5HMQhzOd0IC43
         eDMg==
X-Forwarded-Encrypted: i=1; AJvYcCX7E9kNsiKSPHfvuuGbLDKYpgunaWnnI5g/gbCfAmxrdqELxMr4mwLftehSEKHY1ZWS9CINa6Qoy2RJKCU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxlCKyECbM0mpln//vW7iUV3svqKWtCa54kOtgHxk8RGqktf6Ux
	OiAg+IW8vUUfKXb5FguglPEYTrzPMcGIQ0L129BV5u9BCZFYURybkjCMlsNLXuNcziRipyAydyv
	IU8g1Fw==
X-Gm-Gg: ASbGncvdqmrA2MYkwctC8tckWggML7PmbfsG5Z6fjFfhDUI4ZCCDtx4K5H0z+aNJ0tP
	gNR/uBiwM1GKw5ji8RHmryzJooQuEu/PgG32GyA2TIKr+uyw1SIfc9vKK09UciK+cznf6G+fMI8
	sn5SKIQlRkCJBMIvSHu1wm5bdIhd4dvRgWEcPj/uhbNs0IezS4bC5BtVejH5s1nxLxTlXyRQMLp
	iJaFIgInuSTUMtPsEKwszb+ScLHVPkWr6CDkssHTWSZ+TYFDL5W4Y32pzcQ7pJHA+6QmG93SC3q
	QdGMoBDhyE5e//D4P5UO8h4GGNLQNRI7zIsMCHmI61U3RqpuPX1T1RBMRBMncybADg==
X-Google-Smtp-Source: AGHT+IEIhSKyAh/a5UXDnIfIZx40q+8DWj3yxUrqA8zj6603W5pJSAuRQjAc6FIffxONFpmzBXMSlQ==
X-Received: by 2002:a17:902:e747:b0:234:d292:be8f with SMTP id d9443c01a7336-2366b32e55bmr310856115ad.1.1750301141373;
        Wed, 18 Jun 2025 19:45:41 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:7cb6:ce70:9b77:ed3b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a226ddcsm876010a91.1.2025.06.18.19.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:45:41 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:45:29 +0900
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
Subject: Re: [PATCH RFC 06/29] mm/zsmalloc: make PageZsmalloc() sticky
Message-ID: <5qkfuuar3csonfv3a6nj5ikl3ghebqassnnfw24xj7rjwx77fg@cglr2plhwvfs>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-7-david@redhat.com>
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
In-Reply-To: <20250618174014.1168640-7-david@redhat.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On (25/06/18 19:39), David Hildenbrand wrote:
> Let the buddy handle clearing the type.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

FWIW,
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

