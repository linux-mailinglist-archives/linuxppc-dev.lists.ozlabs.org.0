Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A473B13C80A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 16:39:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yWhn4tqrzDqNv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 02:39:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+a740523ab06c27116664+5988+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=KTafuKCn; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yWVq50g2zDqDL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 02:30:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hlxbWHBq8lfTBkbbWblALE5WfMIrcmCMtir+afT5h7g=; b=KTafuKCnLEQxrDndx0KF1DZxC
 rnKdoLI6sypMh61W+oBSzZckG9nErVqXpqRux90/jnJHBoNxCmDRhLN16rsx5kcLMMQTzpNlRHW3V
 Kn+EfBOj9xXDn+MMy1P1Ce1dDs4zbgiDeuR8jQgZiUt61hA4+gx5SghScUnsRQG1ziTZYHV9R9Zgf
 pJxhgaR5AeWS3+N32IQliDA3Jqotb5XQKegSIoZaLpNN+GhynXNs1L5cGpIhmQbJynCGULBXCRnjC
 vAgzg7hshbf2g9UxNsiPKchC1nKbZKVYFzdAbYAS/fNwV5Y2i+QhIqJe1mPDizEBhtnZaTAQECgQV
 KQqONFysg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1irkce-0002dy-Qu; Wed, 15 Jan 2020 15:30:20 +0000
Date: Wed, 15 Jan 2020 07:30:20 -0800
From: Christoph Hellwig <hch@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v12 11/22] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20200115153020.GF19546@infradead.org>
References: <20200107224558.2362728-1-jhubbard@nvidia.com>
 <20200107224558.2362728-12-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107224558.2362728-12-jhubbard@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>,
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

On Tue, Jan 07, 2020 at 02:45:47PM -0800, John Hubbard wrote:
> Introduce pin_user_pages*() variations of get_user_pages*() calls,
> and also pin_longterm_pages*() variations.
> 
> For now, these are placeholder calls, until the various call sites
> are converted to use the correct get_user_pages*() or
> pin_user_pages*() API.

What do the pure placeholders buy us?  The API itself looks ok,
but until it actually is properly implemented it doesn't help at
all, and we've had all kinds of bad experiences with these sorts
of stub APIs.
