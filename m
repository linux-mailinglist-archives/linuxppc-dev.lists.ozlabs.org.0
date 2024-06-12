Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B089057B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 17:57:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=nPhZW0yY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vzqtg0bbYz3fmp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 01:57:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=nPhZW0yY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cloud.com (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=roger.pau@cloud.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzqsK4QPwz3dK1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 01:56:20 +1000 (AEST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6afc61f9a2eso170296d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 08:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718207778; x=1718812578; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0JAgWI6yypeQvJHtBsLjxy9EsiTAtsBZFfQkPH4VMNc=;
        b=nPhZW0yYcuhRDnWjgbW1u+I5jzHHf75II+s0ySUFP6xHtxNUhY4dksercbUYpPraTk
         trN6OCKoZUhI0ZI9/CqLPiWcgdw2G1U+stktoAQCOhMoOLRopc8PEWPNeI6H4JBykdGt
         UT4Vs84UZF80Q9DxTAL+eFibU/uw/sgCkitHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718207778; x=1718812578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JAgWI6yypeQvJHtBsLjxy9EsiTAtsBZFfQkPH4VMNc=;
        b=rP0m5qqcKe3o8A5rC9hmcUdCyfjChAMrLduSrdUoNhKhGTa5WTXs0WSOiPlCF6taic
         WC0o5qiTVWxoC2KvnncX5J3yggnofi62dsZAjTX9N0OPn96Z43kzV7j/30Oc+Oq8Pazl
         dIwnntBw+NELUrqtOUG+Gp7fQzhj0E2aD1Ba0Fd66/nZRfcizsZSKewCAqungI+rXROP
         nwVi7lyOWGbZ7UdiMtZ1SIEq2KulxIGkwUM6Gd32LeMibGipBvxxHx/R750Q69cRQrbP
         CB7ZtNS7gGVJKMwWLxOsG1Xs9Z6gZLwM+jGd1/+RM33DLhPelfn51ngtkpwglPJe1Eu/
         CZSw==
X-Forwarded-Encrypted: i=1; AJvYcCXgsk3DpbGp146X6n7Z1bqkkAhqCK2iyNq8H81BEY6tzV/o2d7Ga853c9MsGv4oPfPDje9dvdOsdA4w4nmNv1SpMRvOkRlQ1+lUQiYE0w==
X-Gm-Message-State: AOJu0YxjENXa5dqAYkgkXdnuvsDl/LgZggWKV7Z/UF+NqkspKO/HrNBp
	AkCbeedY2TMPyN6sNcHGAzmuaZF2+vuoLXumvqf1kVeLG+jqpYvYpgg+qaOgQQs=
X-Google-Smtp-Source: AGHT+IH3vJ/Cfk8LzYoeLv9cXT/SgN6Pt3X56xC7VVYFazmjn8i4deMSmAqg4iM25NKqjeo5TBvU1g==
X-Received: by 2002:a05:6214:2a47:b0:6b0:7365:dde0 with SMTP id 6a1803df08f44-6b2a33de160mr1306776d6.18.1718207777691;
        Wed, 12 Jun 2024 08:56:17 -0700 (PDT)
Received: from localhost ([213.195.124.163])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b0884337e9sm22877866d6.16.2024.06.12.08.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 08:56:17 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:56:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/26] xen-blkfront: don't disable cache flushes when
 they fail
Message-ID: <ZmnFH17bTV2Ot_iR@macbook>
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-11-hch@lst.de>
 <ZmlVziizbaboaBSn@macbook>
 <20240612150030.GA29188@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240612150030.GA29188@lst.de>
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, linux-bcache@vger.kernel.org, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Mikulas Patocka <mpatocka@redhat.com>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, nbd@other.debian.org, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2024 at 05:00:30PM +0200, Christoph Hellwig wrote:
> On Wed, Jun 12, 2024 at 10:01:18AM +0200, Roger Pau Monné wrote:
> > On Tue, Jun 11, 2024 at 07:19:10AM +0200, Christoph Hellwig wrote:
> > > blkfront always had a robust negotiation protocol for detecting a write
> > > cache.  Stop simply disabling cache flushes when they fail as that is
> > > a grave error.
> > 
> > It's my understanding the current code attempts to cover up for the
> > lack of guarantees the feature itself provides:
> 
> > So even when the feature is exposed, the backend might return
> > EOPNOTSUPP for the flush/barrier operations.
> 
> How is this supposed to work?  I mean in the worst case we could
> just immediately complete the flush requests in the driver, but
> we're really lying to any upper layer.

Right.  AFAICT advertising "feature-barrier" and/or
"feature-flush-cache" could be done based on whether blkback
understand those commands, not on whether the underlying storage
supports the equivalent of them.

Worst case we can print a warning message once about the underlying
storage failing to complete flush/barrier requests, and that data
integrity might not be guaranteed going forward, and not propagate the
error to the upper layer?

What would be the consequence of propagating a flush error to the
upper layers?

> > Such failure is tied on whether the underlying blkback storage
> > supports REQ_OP_WRITE with REQ_PREFLUSH operation.  blkback will
> > expose "feature-barrier" and/or "feature-flush-cache" without knowing
> > whether the underlying backend supports those operations, hence the
> > weird fallback in blkfront.
> 
> If we are just talking about the Linux blkback driver (I know there
> probably are a few other implementations) it won't every do that.
> I see it has code to do so, but the Linux block layer doesn't
> allow the flush operation to randomly fail if it was previously
> advertised.  Note that even blkfront conforms to this as it fixes
> up the return value when it gets this notsupp error to ok.

Yes, I'm afraid it's impossible to know what the multiple incarnations
of all the scattered blkback implementations possibly do (FreeBSD,
NetBSD, QEMU and blktap at least I know of).

> > Overall blkback should ensure that REQ_PREFLUSH is supported before
> > exposing "feature-barrier" or "feature-flush-cache", as then the
> > exposed features would really match what the underlying backend
> > supports (rather than the commands blkback knows about).
> 
> Yes.  The in-tree xen-blkback does that, but even without that the
> Linux block layer actually makes sure flushes sent by upper layers
> always succeed even when not supported.

Given the description of the feature in the blkif header, I'm afraid
we cannot guarantee that seeing the feature exposed implies barrier or
flush support, since the request could fail at any time (or even from
the start of the disk attachment) and it would still sadly be a correct
implementation given the description of the options.

Thanks, Roger.
