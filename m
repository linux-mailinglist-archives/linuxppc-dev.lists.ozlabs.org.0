Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBC5301B79
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 12:45:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNrlh3zPvzDqP1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 22:45:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+340bc88fe697da228867+6363+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=oIIPIBqq; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNrXF0PCNzDqyG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 22:35:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DnnUQiY7CbIWzxVOnSBlAAa1Nohpd5vz+34ZKPNnOm0=; b=oIIPIBqqoX5eIWt9hWAMXoyhcq
 ANAWVu4mMPk7+m+pDkC3HoxAPkXTINGv81x358x1LL/QeapPcf1KEGk7/+doRz3HAyg8HNW68JmQ7
 IepN/DG44p3chkwHCUDHKJ8VCFc5YrBhyM1ym/o6Lzkz2LOt6LniYo5pq6ANT+fGhuF18flOc5KY5
 KHRS6QcXPnKHDdQ8thqvzwpS5zh+MOgymna+ajItr3U75KRxyQw0oWBq5ptHcJpTZHnpTLKN+DGtm
 tcNrgS9kBO4nJLnAMQqkPL8e15wReXrnSnn5gxCB1u9jiea0xf9NkPhxSuKdzzieppzkEOYpWy8iA
 1B84sfmg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l3df0-002umc-A4; Sun, 24 Jan 2021 11:34:41 +0000
Date: Sun, 24 Jan 2021 11:34:26 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 03/12] mm/vmalloc: rename vmap_*_range
 vmap_pages_*_range
Message-ID: <20210124113426.GC694255@infradead.org>
References: <20210124082230.2118861-1-npiggin@gmail.com>
 <20210124082230.2118861-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210124082230.2118861-4-npiggin@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Zefan Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 24, 2021 at 06:22:21PM +1000, Nicholas Piggin wrote:
> The vmalloc mapper operates on a struct page * array rather than a
> linear physical address, re-name it to make this distinction clear.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
