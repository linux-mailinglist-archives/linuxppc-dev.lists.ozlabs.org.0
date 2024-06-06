Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CE28FDE5E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 07:54:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvtnn0nGlz3d9L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 15:54:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvtnN0B72z2xPZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 15:54:15 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 513FC68CFE; Thu,  6 Jun 2024 07:54:08 +0200 (CEST)
Date: Thu, 6 Jun 2024 07:54:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 04/23] scsi: initialize scsi midlayer limits before
 allocating the queue
Message-ID: <20240606055408.GA9379@lst.de>
References: <20240520151536.GA32532@lst.de> <fc6a2243-6982-45e9-a640-9d98c29a8f53@leemhuis.info> <8734pz4gdh.fsf@mail.lhotse> <87wmnb2x2y.fsf@mail.lhotse> <20240531060827.GA17723@lst.de> <87sexy2yny.fsf@mail.lhotse> <87wmn3pntq.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmn3pntq.fsf@mail.lhotse>
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
Cc: Jens Axboe <axboe@kernel.dk>, doru.iorgulescu1@gmail.com, "Martin K. Petersen" <martin.petersen@oracle.com>, "Linux regression tracking \(Thorsten Leemhuis\)" <regressions@leemhuis.info>, John Garry <john.g.garry@oracle.com>, linux-block@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>, Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 05, 2024 at 10:37:53PM +1000, Michael Ellerman wrote:
> On the other hand increasing max_segment_size to 64K while leaving MAX_DBDMA_SEG
> at 0xff00 seems to work fine. And that's effectively what's been happening on
> existing kernels until now.

Exactly.

> 
> The only question is whether that violates some assumption elsewhere in the
> SCSI layer?

It shouldn't.

> Anyway patch below that works for me on v6.10-rc2.

This looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>

