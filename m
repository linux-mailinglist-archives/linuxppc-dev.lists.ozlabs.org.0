Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 310E291F042
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 09:33:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nxBkkv55;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCvlM4kftz3cl9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 17:33:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+a6dac4ac77a4219ad85f+7618+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCvkX5pSNz30VP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 17:32:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yRJduJ4b13YGEVnBaImf8MBMoj+rPcyZfPfJ5uybrn0=; b=nxBkkv5533e0ibSUtWu/FWqca9
	T02UNeMXerA742jTnmxcJDpprQYJhN+AB5mjSyF1tkFtaC9NWv/DI0JPbLwQgi37wPeed5cA37c0e
	+2f4q+qCCkqKwjebfWNgYqdh3KcmHS4SeimB2eXIojre3wqBiKfJ74iCTIY0nzAi/62xdvvQQ9QVV
	ggumCBVJg78P9RdScYdX17RSGD42SxwMGXnk/F0Te2sI20BEGRBsqQOtoGA/KEqDDyMxAk9wtOs1O
	z/1WMLlWsZ6latPxKW85ISPYOrT1dPDdYNH/mzAspCJntQyhFPayqTd56frrg1OjYGXYjfO03yN/a
	E+Zh4hIw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOXzk-00000005s56-0D5a;
	Tue, 02 Jul 2024 07:32:08 +0000
Date: Tue, 2 Jul 2024 00:32:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Subject: Re: [axboe-block:for-next] [block]  1122c0c1cc:  aim7.jobs-per-min
 22.6% improvement
Message-ID: <ZoOs9wdR1yBPB-7J@infradead.org>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
 <ZnqGf49cvy6W-xWf@infradead.org>
 <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
 <ZnuNhkH26nZi8fz6@infradead.org>
 <ZnzP+nUrk8+9bANK@xsang-OptiPlex-9020>
 <ZnzwbYSaIlT0SIEy@infradead.org>
 <ZoJnO09LBj6kApY7@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoJnO09LBj6kApY7@xsang-OptiPlex-9020>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>, feng.tang@intel.com, linux-nvme@lists.infradead.org, linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com, lkp@intel.com, linux-scsi@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, ying.huang@intel.com, xen-devel@lists.xenproject.org, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, virtualization@lists.linux.dev, nbd@other.debian.org, linux-block@vger.kernel.org, linux-bcache@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org, fengwei.yin@intel.com, oe-lkp@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 01, 2024 at 04:22:19PM +0800, Oliver Sang wrote:
> from below, it seems the patchset doesn't introduce any performance improvement
> but a regression now. is this expected?

Not having the improvement at least alleviate my concerns about data
integrity.  I'm still curious where it comes from as it isn't exactly
expected.

