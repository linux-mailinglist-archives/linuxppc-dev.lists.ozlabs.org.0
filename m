Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3EA9151F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 17:21:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7BVw4sC7z3gBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 01:20:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7BVV67Vwz3dKH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 01:20:34 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id AAC0B68D05; Mon, 24 Jun 2024 17:20:28 +0200 (CEST)
Date: Mon, 24 Jun 2024 17:20:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Niklas Cassel <cassel@kernel.org>
Subject: Re: [axboe-block:for-next] [block]  bd4a633b6f:
 fsmark.files_per_sec -64.5% regression
Message-ID: <20240624152028.GA11961@lst.de>
References: <202406241546.6bbd44a7-oliver.sang@intel.com> <20240624083537.GA19941@lst.de> <Znl4lXRmK2ukDB7r@ryzen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znl4lXRmK2ukDB7r@ryzen.lan>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: nvdimm@lists.linux.dev, feng.tang@intel.com, linux-nvme@lists.infradead.org, fengwei.yin@intel.com, linux-mtd@lists.infradead.org, linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, lkp@intel.com, linux-scsi@vger.kernel.org, ying.huang@intel.com, xen-devel@lists.xenproject.org, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, virtualization@lists.linux.dev, nbd@other.debian.org, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>, ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 24, 2024 at 03:45:57PM +0200, Niklas Cassel wrote:
> Seems to be ATA SSD:
> https://download.01.org/0day-ci/archive/20240624/202406241546.6bbd44a7-oliver.sang@intel.com/job.yaml
> 
> ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BG012T4_BTHC428201ZX1P2OGN-part1"
> 
> Most likely btrfs does something different depending on the nonrot flag
> being set or not. (And like you are suggesting, most likely the value of
> the nonrot flag is somehow different after commit bd4a633b6f)

Yes, btrfs does.  That's why I'm curious about the before and after,
as I can't see any way how they would be set differently.  Right now
I can only claim with vitual AHCI devices, which claim to be rotational,
though.

