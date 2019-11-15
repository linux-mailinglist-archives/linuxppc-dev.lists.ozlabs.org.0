Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47854FDFC8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 15:11:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F0d94wcxzF0TM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 01:11:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="i+UlYqHp"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F0ZR4gVMzF6tK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 01:08:47 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id o3so10911234qtj.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 06:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8ZGdiHZxf3ZHqX3I8ydxFdLkSWkpE5WrCI0dICjPpHU=;
 b=i+UlYqHpSoy9hrCL3gQPMJUhUw3RKIgDls07tcBvdNTrD4jl5OTOMJfNN1MASvpOc/
 n/RUaDL07zMYWDhclWHPDZnaqTZ6YdpZfzuTyA+HrehI2Ydc75hfkUNiRgV5KLUhGbZ5
 hwJR6j62hBrGSzy1DyO8h1zN9TlzptjO0LEx4CpgETqR3CBgJNCsKnZKRcbg5KwHic/q
 pEIdohRRBLTVk18YHW5Vi8NX67r/lGgj0cpRlIJEz6SaDVQBInMFNoQa60kFdiQzPjma
 xgI2yhuOWu+cTXk9NFpI3of3yS1+C6h76JgFDhrvoDw5piCzGcHI/ud3iOPSS57DuCxF
 BfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8ZGdiHZxf3ZHqX3I8ydxFdLkSWkpE5WrCI0dICjPpHU=;
 b=AfmTJrYmAdIqwyX07PNKFA5SXC/rrCSeFwSqsGW7iReriJUXWVi62RcSdfJgCPJXEm
 0G10VuLp2u+GGqlmBH5bdr9bl/1RQ3fSO84/aAG8JwtXj7BDS7u6LYsUpHOgSHx41Qg8
 4OhI6yS0UCI4WW27USLZTeN38adIKbuRduWVrr/wNgal7e+SB/dhoHalx6ul+/j4MXM4
 7fgpD9eqyQMgb8F0brHYnyxv/OMCBCMLb5eYvNe3OmVGg+dSdTS+GnAIwma0XXDHFvI+
 VIMC/MzMnC/Khw8aHmqN55zY/WIopzGN5R51uPnkt+dhllh1xQCJeW8Ggh8v/YUv20ib
 tK+g==
X-Gm-Message-State: APjAAAUM7hYNX6bU2nrQ64oD4Lg1Dp6xJEtbYvA/YXipawYb0dJI7LEw
 LKCYahWG6SUZ7TrbsS84gg0U7A==
X-Google-Smtp-Source: APXvYqyXZJAB3M+2SHRriOZec9Rfd1hMhPGpVi3+hL/5cz80ckTUMXVgMRzWDvTX6XEGdZam3s9/QQ==
X-Received: by 2002:ac8:661a:: with SMTP id c26mr13620771qtp.317.1573826923526; 
 Fri, 15 Nov 2019 06:08:43 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id s21sm5382292qtc.12.2019.11.15.06.08.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Nov 2019 06:08:42 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iVcHC-0002xg-A8; Fri, 15 Nov 2019 10:08:42 -0400
Date: Fri, 15 Nov 2019 10:08:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 09/24] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
Message-ID: <20191115140842.GA4055@ziepe.ca>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-10-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115055340.1825745-10-jhubbard@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 14, 2019 at 09:53:25PM -0800, John Hubbard wrote:
> As it says in the updated comment in gup.c: current FOLL_LONGTERM
> behavior is incompatible with FAULT_FLAG_ALLOW_RETRY because of the
> FS DAX check requirement on vmas.
> 
> However, the corresponding restriction in get_user_pages_remote() was
> slightly stricter than is actually required: it forbade all
> FOLL_LONGTERM callers, but we can actually allow FOLL_LONGTERM callers
> that do not set the "locked" arg.
> 
> Update the code and comments accordingly, and update the VFIO caller
> to take advantage of this, fixing a bug as a result: the VFIO caller
> is logically a FOLL_LONGTERM user.
> 
> Also, remove an unnessary pair of calls that were releasing and
> reacquiring the mmap_sem. There is no need to avoid holding mmap_sem
> just in order to call page_to_pfn().
> 
> Also, move the DAX check ("if a VMA is DAX, don't allow long term
> pinning") from the VFIO call site, all the way into the internals
> of get_user_pages_remote() and __gup_longterm_locked(). That is:
> get_user_pages_remote() calls __gup_longterm_locked(), which in turn
> calls check_dax_vmas(). It's lightly explained in the comments as well.
> 
> Thanks to Jason Gunthorpe for pointing out a clean way to fix this,
> and to Dan Williams for helping clarify the DAX refactoring.
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Jerome Glisse <jglisse@redhat.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 30 +++++-------------------------
>  mm/gup.c                        | 27 ++++++++++++++++++++++-----
>  2 files changed, 27 insertions(+), 30 deletions(-)

Looks OK now  

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
