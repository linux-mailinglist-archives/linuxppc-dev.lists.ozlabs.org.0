Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8A5301CD6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 15:52:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNwvZ4KpSzDr7V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 01:52:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+340bc88fe697da228867+6363+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNwsJ3fzhzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 01:50:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dXXpQWAfsGNBGd1LppB2DZ4PimtbkGmVFd20xAnJkfM=; b=Yr/x4eoIOWAHoHAMhlXY1zbeVO
 yIEVDx6UYjY5tfYgBr1qkKI8trlNUe43FW9APG66C45pQEEhCroA8a5Sp+eodRZtGBhbdRctkZI/0
 wg/4XgRol08LFLYumZiA3brfJ1XXe5WxnVfVZhHLiPzyFet9onzXn5tnV5QxTkQx6ORfFptz0BrRl
 0bfy0xc2pTZ5IoRQA+JH2TRoTMUQY7gjwKBgKUdT+AcVhxubXwI3xcx+Vt1Sg3tnhTGPQedqgX1RM
 YTl/hhl+Xar/Uw4NuIowb36/ie3TkKsfRU6LDYDWhff4W61A+zYlWv4oW7C97qDmfHelivM251XdW
 d5OzOIvg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l3ghs-0034xa-Ec; Sun, 24 Jan 2021 14:49:48 +0000
Date: Sun, 24 Jan 2021 14:49:36 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 09/12] mm: Move vmap_range from mm/ioremap.c to
 mm/vmalloc.c
Message-ID: <20210124144936.GA733865@infradead.org>
References: <20210124082230.2118861-1-npiggin@gmail.com>
 <20210124082230.2118861-10-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210124082230.2118861-10-npiggin@gmail.com>
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

On Sun, Jan 24, 2021 at 06:22:27PM +1000, Nicholas Piggin wrote:
> This is a generic kernel virtual memory mapper, not specific to ioremap.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Although it would be nice if you could fix up the > 80 lines while
you're at it.
