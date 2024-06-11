Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F02290492F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 04:51:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=11PpLpB6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzVRT0h73z3fmr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 12:51:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=11PpLpB6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=toxicpanda.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=josef@toxicpanda.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzF6x3sZfz30Sq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 02:51:03 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-62a2424ed00so56078437b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 09:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1718124657; x=1718729457; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7qH/Egkqtc5OmSCKcG8suDn1pwScsKWRQ+gioBgKgY=;
        b=11PpLpB6ZiZYL6c2khbnobiZV7Db1wbukBmslpQZz1OesfANnM7/gMcpz+icRX6L6T
         xQDaw0Z6NQlS6Mfmp3D1AkevV7R3mahn4tJ7JiOg92Dg1aELDHNUK4eEaSu08Cw66jnj
         Ddi+zxTvoV7Dl7zLp3JjDKxqq9+YRNOJYERySy301gdh/LiKXyp7Tb8OK5GfXov4Siv9
         ynMIsBnDw/anIpoYZnde5J1ri3ht6p9VaMxxoaXjdh1BTCTTXb2n3F5D5DYcQBKzSyWt
         mGQ2EyKmlr6uiqgr3VfAyeMwGJoC9CHJK+EwtJmffa/UqOrGNlZYorw0JD3zQqBeEiiv
         C9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718124657; x=1718729457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7qH/Egkqtc5OmSCKcG8suDn1pwScsKWRQ+gioBgKgY=;
        b=EvBJKxg0fJ/1664fZsJh4vmZyYl366BCxzGKFdIgJ3LCgs9jZOKwwRa/q3WfpES+8J
         naIM9GzSbUFHcI21z007X66bNSb6PbUC2pPYhqLyJYHgze5cXtJvzsc/TcCzkiF7TOFL
         ZTLwbdDcgeZy/O0DauNHb1k3RdreuxT1w1snEL0rtE8NcDahVOBVFsTNsifAlYBXnESc
         Mqv3Lo+40NVqC7nloezc5IVrz090Az4HdLfRJ3i1f4yybqCQBfIDbH65lQOASKDDTlyf
         0gyzYMczoH6i96tgeDhe/b31W1TBhDeQS9bEGuDjSaEx1JmLlrBML6E/mjpGAAiVfXE3
         +/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVYCr2zWe2NFXuA0py8OZGMpqkMrs8e1JNwGlHi+Z2mUqHZeaHVr6L6Zx1LYvtvpsNls8vtuV7aNfj/9vpXLxNJKebXuPmCoDB7f6fkMA==
X-Gm-Message-State: AOJu0YxCqA6CNkX8FC56/bzQl6+S/xavQgZKnxCkEoUxasHjpJ2bbS3C
	rwteMNTgweLz1KHQc361sWgBW+9wkXn0RQ1QUNDxAy2AU0X+mHkwo+TlFnAUdVs=
X-Google-Smtp-Source: AGHT+IFLbNcRGoXteJvsvQz9ePKtTqtffGprFSIVvQoC+S7q0aJ0DFFhhqHjAFy+KyUVXYjD8ktBew==
X-Received: by 2002:a0d:d851:0:b0:618:95a3:70b9 with SMTP id 00721157ae682-62cd565129cmr130634777b3.36.1718124656832;
        Tue, 11 Jun 2024 09:50:56 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62ccaef2825sm20935207b3.139.2024.06.11.09.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 09:50:56 -0700 (PDT)
Date: Tue, 11 Jun 2024 12:50:55 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/26] nbd: move setting the cache control flags to
 __nbd_set_size
Message-ID: <20240611165055.GD247672@perftesting>
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-10-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611051929.513387-10-hch@lst.de>
X-Mailman-Approved-At: Wed, 12 Jun 2024 12:50:01 +1000
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
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org, Vineeth Vijayan <vneethv@linux.ibm.com>, linux-bcache@vger.kernel.org, Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev, linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>, virtualization@lists.linux.dev, Ming Lei <ming.lei@redhat.com>, linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Mikulas Patocka <mpatocka@redhat.com>, xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org, nbd@other.debian.org, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>, Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 07:19:09AM +0200, Christoph Hellwig wrote:
> Move setting the cache control flags in nbd in preparation for moving
> these flags into the queue_limits structure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef
