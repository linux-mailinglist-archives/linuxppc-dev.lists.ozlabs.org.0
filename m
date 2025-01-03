Return-Path: <linuxppc-dev+bounces-4620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03848A00651
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 09:57:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPcrs0Lnnz30Qy;
	Fri,  3 Jan 2025 19:57:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735894621;
	cv=none; b=VPo/bNp93brN5/lEQsAySjuCPEZlVsL95OVvJbGHwEfPeZ6iPECrhp/BaT4hcFiLKITT32NSittCjIwEJtLit5XlGOZIf9lD2PxEZohZo+oy0c5yfiVs0iF+oYyecCSZqTtuC4uj5xtOzNLf245amAmnhO4dpipXyS+d4ebvtagpi1Mv34Sr+e2IQ7t8bw/Rae3b096WcteIow00vEWo/XowILOsMERtjV6GAYh1KBVupES+rzAonZYX+zUoEX+Sgq/lXeDZMoapVoF1IePnLipPEWOZq0UmYUI+uPFSVoPZiAaBuocNUZmeXPyBVBRGRjEk4fkqIqwYB+W0I9CcNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735894621; c=relaxed/relaxed;
	bh=8TAScTiuUXWvBMQ+C76tYC7Y8gIBTDJrVg36jE7BeyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpJ9a06bl9YZ0pnIdnAKZYaOfzKiCnJOtUkmrBN/ASXLp3gauRa1Rx8x9JSk3dMrJaiDXwDtQRbaVXrvxWRPu1/noecSoCH4eZt66zbEutZADl1aSBJCeX1covoOm8nBNdKjQiIpsDCimshn/4vK/bRw5zIxnMyKiMzZxG/nxqQKzd4PRSxK6Lk3fKYIjEKKwgKmqZHcFylJBY7z4adMELRmB+tHU7WxnMVumaOGjX3688gw/bMmxN1W1Y9ukFdr2zIpzXTnauHVDP3BK0dVGhKGtpvYB1IQgG+mFn54+bQqCMRMPoFWLv03MkkekbSt6rIWfwwtGEg2KqQI/mViCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPcrq2fqjz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 19:56:59 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
	id BEB7668BFE; Fri,  3 Jan 2025 09:56:52 +0100 (CET)
Date: Fri, 3 Jan 2025 09:56:52 +0100
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Christoph Hellwig <hch@lst.de>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Geoff Levand <geoff@infradead.org>, Jens Axboe <axboe@kernel.dk>,
	linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ps3disk: Do not use dev->bounce_size before it is set
Message-ID: <20250103085652.GA31691@lst.de>
References: <06988f959ea6885b8bd7fb3b9059dd54bc6bbad7.1735894216.git.geert+renesas@glider.be>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06988f959ea6885b8bd7fb3b9059dd54bc6bbad7.1735894216.git.geert+renesas@glider.be>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 03, 2025 at 09:51:25AM +0100, Geert Uytterhoeven wrote:
> dev->bounce_size is only initialized after it is used to set the queue
> limits.  Fix this by using BOUNCE_SIZE instead.
> 
> Fixes: a7f18b74dbe17162 ("ps3disk: pass queue_limits to blk_mq_alloc_disk")
> Reported-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> Closes: https://lore.kernel.org/39256db9-3d73-4e86-a49b-300dfd670212@gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>

But looking at the report it seems like no one cares about ps3 upstream,
and in fact the only person caring at all rather rants on youtube than
helping upstream, so maybe we should just remove the ps3 support entirely?

