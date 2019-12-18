Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E903124C46
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 16:54:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dKLq60r2zDqjx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 02:54:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="KDdHHJJR"; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dKJj0lNYzDqgb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 02:52:15 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id a13so2682166ljm.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 07:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9SaCbmKz1ngtAKjewhoah2l6ODU7+VciCnZ7nlhe26A=;
 b=KDdHHJJR0qVpHZqAH81m6HqiNucHS6+DyOVljs3zJhGM2FtVdbdAm0v2Xxx2kkMzcc
 COndoaW+YFAjiesHFNY+QGvBhkVduyh7QLCQeLwcNzFcgoRSyGgSLcKxln6/f1EUD6yP
 0y/6+ZumAIbzC9iZaVPFSydS1BkjYoeUFSafS/fB2OWFlpyQaG5ZPEXYvAMbIqCKuFSL
 vWtk3rEHKc5uyahuOPC2nUQfw14PqKcbFsQXhuikgf46s/H3eDyiCMpavZwnwbAsy3mj
 YXZ/SZZpNe1V4549MQIslp0gnIgv8CLO8jjGejFKXWpzPMIfXWxDiYo5N9hhWPoVV8yK
 Z+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9SaCbmKz1ngtAKjewhoah2l6ODU7+VciCnZ7nlhe26A=;
 b=eygEsmge+SjAIxQbkstVDv6l1NZkIAZz/vMoOpu4BccG3mg2mDGqbxuSILTep+oLrF
 YHqaUWQ1BDD2cLr7bRq+LP5rv/TceNCqoQiweX9XFGwJi4ZvViIGlL/PjnKhvmvtItFu
 LRxQ3+DQTtpc7xQlZrDozCG+g+uKPCT+iQ9X5G+pkm7iDJlgKY82wEN0JN3WH+T3Z6P4
 +T//885lH+Srumfa+ysyWMlXLwo7C8voDcSnFfmSU1IaOagOc/Ls1HBJ1HVWunUFn8X8
 N86kQPiWBA0BO8zpK7XGxKthISK9JrWM1fzose2nhMvCVYYjCkv4g9hCXU52JvalatFx
 KW6Q==
X-Gm-Message-State: APjAAAU7xgDzDty93ZYig/xplK68GN67OOk5B/i6aD9y1Gt1kaPBeFDp
 bO+ntBbDUHLK7OE/BZRkjiTmyA==
X-Google-Smtp-Source: APXvYqwSmzkDxFfUqfRx+ol+ctreHSER3AZEkxHGbqQ5sNtLr5I/0+mwtD90Owb4uveY0c44Ujy5Kw==
X-Received: by 2002:a2e:3312:: with SMTP id d18mr2333248ljc.222.1576684332255; 
 Wed, 18 Dec 2019 07:52:12 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id s16sm1351312lfc.35.2019.12.18.07.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:52:11 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
 id 66C2E1012CF; Wed, 18 Dec 2019 18:52:11 +0300 (+03)
Date: Wed, 18 Dec 2019 18:52:11 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v11 01/25] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191218155211.emcegdp5uqgorfwe@box>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-2-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216222537.491123-2-jhubbard@nvidia.com>
User-Agent: NeoMutt/20180716
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 16, 2019 at 02:25:13PM -0800, John Hubbard wrote:
> +static void put_compound_head(struct page *page, int refs)
> +{
> +	/* Do a get_page() first, in case refs == page->_refcount */
> +	get_page(page);
> +	page_ref_sub(page, refs);
> +	put_page(page);
> +}

It's not terribly efficient. Maybe something like:

	VM_BUG_ON_PAGE(page_ref_count(page) < ref, page);
	if (refs > 2)
		page_ref_sub(page, refs - 1);
	put_page(page);

?

-- 
 Kirill A. Shutemov
