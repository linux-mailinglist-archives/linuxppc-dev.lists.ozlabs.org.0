Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id AC8288C9FB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2024 17:31:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjhHB0XwJz3fvp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 01:26:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 605 seconds by postgrey-1.37 at boromir; Tue, 21 May 2024 01:25:50 AEST
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VjhGk5PgXz3cjr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 01:25:50 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1542168AFE; Mon, 20 May 2024 17:15:37 +0200 (CEST)
Date: Mon, 20 May 2024 17:15:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 04/23] scsi: initialize scsi midlayer limits before
 allocating the queue
Message-ID: <20240520151536.GA32532@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08beb913-f525-49e2-8ef2-f62e9d466e53@roeck-us.net>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, John Garry <john.g.garry@oracle.com>, linux-block@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adding ben and the linuxppc list.

Context: pata_macio initialization now fails as we enforce that the
segment size is set properly.

On Wed, May 15, 2024 at 04:52:29PM -0700, Guenter Roeck wrote:
> pata_macio_common_init() Calling ata_host_activate() with limit 65280
> ...
> max_segment_size is 65280; PAGE_SIZE is 65536; BLK_MAX_SEGMENT_SIZE is 65536
> WARNING: CPU: 0 PID: 12 at block/blk-settings.c:202 blk_validate_limits+0x2d4/0x364
> ...
>
> This is with PPC_BOOK3S_64 which selects a default page size of 64k.

Yeah.  Did you actually manage to use pata macio previously?  Or is
it just used because it's part of the pmac default config?

> Looking at the old code, I think it did what you suggested above,

> but assuming that the driver requested a lower limit on purpose that
> may not be the best solution.

> Never mind, though - I updated my test configuration to explicitly
> configure the page size to 4k to work around the problem. With that,
> please consider this report a note in case someone hits the problem
> on a real system (and sorry for the noise).

Yes, the idea behind this change was to catch such errors.  So far
most errors have been drivers setting lower limits than what the
hardware can actually handle, but I'd love to track this down.

If the hardware can't actually handle the lower limit we should
probably just fail the probe gracefully with a well comment if
statement instead.
