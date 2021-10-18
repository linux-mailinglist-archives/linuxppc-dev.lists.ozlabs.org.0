Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 643C54323A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 18:17:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HY28F69M8z306n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 03:17:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EdB/cP4e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=198.137.202.133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HY27V4Hb5z2yYl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 03:16:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=d+JJm4oOxq5DwxbgVcq/OaoV+BL6oX8jKgPcci4Cxx8=; b=EdB/cP4eAG6COf0OroQ/fEGY/b
 J9xBV+A2WVoXv/JiuFNH4oPk/p7/O8vaIpon9fnvstGLsrkMowQAYbrtLX2BYuqhMfZpBc/dqtWsR
 E6yrsqwN6KEmhcgdvOViHTkp99X1oIkJtVcBjt7MS/zXUEGYPsFeCtG+10DMYjeSUW3Du7yZU2owG
 /P1GwmyKmfSMHBffRrHs2U2bGy9RnwW8IaJycSpOHQt8YLJZhr3K1vrizKHkgVVXxEXEOFkje+enA
 4vDkbaraarOFgcmqFe/0gV//vX9rYdz/YDc2fz7HIdQhMgXfzgOR/Mp//MJMYJ8GSqCiC8dRO+FyY
 xzlpOZNQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mcVIn-00GToq-Uz; Mon, 18 Oct 2021 16:15:53 +0000
Date: Mon, 18 Oct 2021 09:15:53 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH 00/13] block: add_disk() error handling stragglers
Message-ID: <YW2duaTqf3qUbTIm@bombadil.infradead.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <a31970d6-8631-9d9d-a36f-8f4fcebfb1e6@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a31970d6-8631-9d9d-a36f-8f4fcebfb1e6@infradead.org>
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
Cc: nvdimm@lists.linux.dev, vigneshr@ti.com, linux-nvme@lists.infradead.org,
 paulus@samba.org, miquel.raynal@bootlin.com, ira.weiny@intel.com, hch@lst.de,
 dave.jiang@intel.com, sagi@grimberg.me, minchan@kernel.org,
 vishal.l.verma@intel.com, ngupta@vflare.org, linux-block@vger.kernel.org,
 kbusch@kernel.org, dan.j.williams@intel.com, axboe@kernel.dk,
 linux-kernel@vger.kernel.org, jim@jtan.com, senozhatsky@chromium.org,
 richard@nod.at, linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 17, 2021 at 08:26:33AM -0700, Geoff Levand wrote:
> Hi Luis,
> 
> On 10/15/21 4:52 PM, Luis Chamberlain wrote:
> > This patch set consists of al the straggler drivers for which we have
> > have no patch reviews done for yet. I'd like to ask for folks to please
> > consider chiming in, specially if you're the maintainer for the driver.
> > Additionally if you can specify if you'll take the patch in yourself or
> > if you want Jens to take it, that'd be great too.
> 
> Do you have a git repo with the patch set applied that I can use to test with?

Sure, although the second to last patch is in a state of flux given
the ataflop driver currently is broken and so we're seeing how to fix
that first:

https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20211011-for-axboe-add-disk-error-handling

  Luis
