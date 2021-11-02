Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DBA443447
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 18:05:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkGVR1XQwz2yg3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 04:05:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cU09DI26;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=mcgrof@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=cU09DI26; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkGTh51lHz2xF4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Nov 2021 04:04:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3bBcvFcyfbMgkxTabHoDugt0QDDF2AsVik61xYhcvY8=; b=cU09DI26n/HuOfXSGqvnoYXccm
 btgFjQftFTj8uFw/bdPpySJs8e+7RKCufouvPj8a9PRomwNJZ3mL7eaNJtneuS1VWToYH1yLqjBv3
 m89b5NUiMX3cVF/rKxoTsV8LwGO8QEm/5XlTbBHx1DxbIwX0xAm8IdwOBHVoMxAqZi3cy2/MNriKS
 iDCYoYwhK8cO4awe/SWrQE/T8ddEIozAommDi/x5RAG4+JdgOojsx3aHaZEyweML/LrElyOIzTu2F
 95JZDncYEgYlEMqo7AMW2+I/jpyu82tBawT5t7eMueYiE+khoi9NEjHbk0Y0jwGwUSoFnlgMokg/R
 ig+ZPcrg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mhxCQ-002RP3-6N; Tue, 02 Nov 2021 17:03:50 +0000
Date: Tue, 2 Nov 2021 10:03:50 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 03/13] nvdimm/btt: do not call del_gendisk() if not needed
Message-ID: <YYFvdiOYoqRPx8JE@bombadil.infradead.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-4-mcgrof@kernel.org>
 <CAPcyv4gU0q=UhDhGoDjK1mwS8WNcWYUXgEb7Rd8Amqr1XFs6ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4gU0q=UhDhGoDjK1mwS8WNcWYUXgEb7Rd8Amqr1XFs6ow@mail.gmail.com>
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
 Jens Axboe <axboe@kernel.dk>, Geoff Levand <geoff@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jim Paris <jim@jtan.com>, senozhatsky@chromium.org,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 31, 2021 at 10:47:22AM -0700, Dan Williams wrote:
> On Fri, Oct 15, 2021 at 4:53 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > We know we don't need del_gendisk() if we haven't added
> > the disk, so just skip it. This should fix a bug on older
> > kernels, as del_gendisk() became able to deal with
> > disks not added only recently, after the patch titled
> > "block: add flag for add_disk() completion notation".
> 
> Perhaps put this in:
> 
>     commit $abbrev_commit ("block: add flag for add_disk() completion notation")
> 
> ...format, but I can't seem to find that commit?

Indeed, that patch got dropped and it would seem Christoph preferred
a simpler approach with the new disk_live()

commit 40b3a52ffc5bc3b5427d5d35b035cfb19d03fdd6
Author: Christoph Hellwig <hch@lst.de>
Date:   Wed Aug 18 16:45:32 2021 +0200

    block: add a sanity check for a live disk in del_gendisk

> If you're touching the changelog how about one that clarifies the
> impact and drops "we"?
> "del_gendisk() is not required if the disk has not been added. On
> kernels prior to commit $abbrev_commit ("block: add flag for
> add_disk() completion notation")
> it is mandatory to not call del_gendisk() if the underlying device has
> not been through device_add()."
> 
> Fixes: 41cd8b70c37a ("libnvdimm, btt: add support for blk integrity")
> 
> With that you can add:
> 
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>

You got it.

  Luis
