Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D6444411B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 13:10:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hklvm2W80z2yp0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 23:10:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XzurOMdd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=XzurOMdd; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hklv44b94z2y7K
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Nov 2021 23:09:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CjPiVZ6CEwcX8p9oXTmszPrcj/hHgUiyD1EHf7MNfJ0=; b=XzurOMddznm+TyCj4XwsbSfH2s
 1YvfP1uoDLueWcdGH6UKl91Nyt8gDKHB0EJZ9p8GXoSZkeyuoSw8ro4Qpg/tDKhMXt+c9mW+5gvig
 1va8ZDP9Nh1ngmnObtCgD9fU47k2fhRPj3dXSX7Q+lTu01AKUdRC9it3Sa+tHTmhK+XCPW1Cv90gO
 R7V7DN8rv4o6RTbex5YLZcw3/fTiPGmDhJ63Nqpe7IxNAF3+ifnr4KV8D9upZ1LHWc4QF6we1wMvN
 WLVU2pP8uA+m+xTONlFSZ1fqKx40wQtgin3/iIOHuvwTzaVliOxqefui88Q0pUzR6ZvdAPQHMeiq9
 WniQlaUA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miF4r-0053yg-Mm; Wed, 03 Nov 2021 12:09:13 +0000
Date: Wed, 3 Nov 2021 05:09:13 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 06/13] nvdimm/blk: avoid calling del_gendisk() on early
 failures
Message-ID: <YYJ76awe81sC9CHw@bombadil.infradead.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-7-mcgrof@kernel.org>
 <CAPcyv4j+xLT=5RUodHWgnPjNq6t5OcmX1oM2zK2ML0U+OS_16Q@mail.gmail.com>
 <YYHTejXKvsGoDlOa@bombadil.infradead.org>
 <CAPcyv4h1dqBm71OQ_A5Qv4agT3PhV7uoojmSB1pEpS-CXaWb5w@mail.gmail.com>
 <51f86768-04ca-bc7d-c17c-3d0357d84271@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51f86768-04ca-bc7d-c17c-3d0357d84271@kernel.dk>
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, vigneshr@ti.com,
 linux-nvme@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 miquel.raynal@bootlin.com, "Weiny, Ira" <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Dave Jiang <dave.jiang@intel.com>,
 Sagi Grimberg <sagi@grimberg.me>, Minchan Kim <minchan@kernel.org>,
 Vishal L Verma <vishal.l.verma@intel.com>, Nitin Gupta <ngupta@vflare.org>,
 linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Geoff Levand <geoff@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jim Paris <jim@jtan.com>, senozhatsky@chromium.org,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 02, 2021 at 07:28:02PM -0600, Jens Axboe wrote:
> On 11/2/21 6:49 PM, Dan Williams wrote:
> > On Tue, Nov 2, 2021 at 5:10 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >>
> >> On Fri, Oct 15, 2021 at 05:13:48PM -0700, Dan Williams wrote:
> >>> On Fri, Oct 15, 2021 at 4:53 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >>>>
> >>>> If nd_integrity_init() fails we'd get del_gendisk() called,
> >>>> but that's not correct as we should only call that if we're
> >>>> done with device_add_disk(). Fix this by providing unwinding
> >>>> prior to the devm call being registered and moving the devm
> >>>> registration to the very end.
> >>>>
> >>>> This should fix calling del_gendisk() if nd_integrity_init()
> >>>> fails. I only spotted this issue through code inspection. It
> >>>> does not fix any real world bug.
> >>>>
> >>>
> >>> Just fyi, I'm preparing patches to delete this driver completely as it
> >>> is unused by any shipping platform. I hope to get that removal into
> >>> v5.16.
> >>
> >> Curious if are you going to nuking it on v5.16? Otherwise it would stand
> >> in the way of the last few patches to add __must_check for the final
> >> add_disk() error handling changes.
> > 
> > True, I don't think I can get it nuked in time, so you can add my
> > Reviewed-by for this one.
> 
> Luis, I lost track of the nv* patches from this discussion. If you want
> them in 5.16 and they are reviewed, please do resend and I'll pick them
> up for the middle-of-merge-window push.

Sure thing, I'll resend whatever is left. I also noticed for some reason
I forgot to convert nvdimm/pmem and so I'll roll those new patches in,
but I suspect that those might be too late unless we get them reviewed
in time.

  Luis
