Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6351104E4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 09:48:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JY9n2R05zDr44
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 19:48:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+b88e8c106c1fb0af7a00+5933+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="fWeW5VfF"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JXLk3p4bzDqrX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 19:10:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VjO9eYbS8IFyLCNQdhIWL3IwgO2zhTRITxFTV7Q4ke0=; b=fWeW5VfFSpSocy6gUTyTq7ohZ
 duWI/ht/WJEZCytte4q/OoCO3XHZsxub0zfdWXgJMwm0kxZ4Evu+pSu8vDqAde8NJcekP1KvZWTtD
 xHQFS3QQWbDzJp6QKE6jzpGTkVBlvWLzk+RBcL8X5N1TsvDfMwPHaaBCvtN9JjwQ1rQi+7po+k2A4
 Z39WgOu5ergP2HMb8sGCzyRKDSO/I+mbgAEZqSFGA0pwIVj1Qkrec7CtCQPnXQeGS/IaPqmpnFKNf
 aZrMXAwd8HXogYEVWB+AdeEhKcdzRbKuMoG04Ftic11jIRTcwm+pNK8JK68LoASBzHMxqDwKIt+f7
 gT4vwZRAg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iXhWR-0000HT-5s; Thu, 21 Nov 2019 08:09:03 +0000
Date: Thu, 21 Nov 2019 00:09:03 -0800
From: Christoph Hellwig <hch@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v7 08/24] media/v4l2-core: set pages dirty upon releasing
 DMA buffers
Message-ID: <20191121080903.GE30991@infradead.org>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-9-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121071354.456618-9-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
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

On Wed, Nov 20, 2019 at 11:13:38PM -0800, John Hubbard wrote:
> After DMA is complete, and the device and CPU caches are synchronized,
> it's still required to mark the CPU pages as dirty, if the data was
> coming from the device. However, this driver was just issuing a
> bare put_page() call, without any set_page_dirty*() call.
> 
> Fix the problem, by calling set_page_dirty_lock() if the CPU pages
> were potentially receiving data from the device.

Looks good, and like a fix that should be queued up through the media
tree for 5.5 and maybe even added to -stable.

Reviewed-by: Christoph Hellwig <hch@lst.de>
