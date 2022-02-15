Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B028D4B74DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 20:54:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JysHh1vYPz3cWf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 06:54:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XiVUyL4a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XiVUyL4a; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JysGz33NZz3c5j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 06:54:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1DDCB81C83
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 19:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25CAC36AE3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 19:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644954837;
 bh=ybVzBbvmSOoVbs8OTAqgC9k7dcWxXzPNvdGTlxM4esw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XiVUyL4al8GHXE+UgzwigR7X6pH993Bu63Z0W1Z517LncckN+4p91ba/TO5NWXQpp
 U1vWjpJONv3koPrD/mTCQn2wG59ZnyoYcqC24otLIxisbduauF07K6jsfuKF7k5IPi
 +Hw1LyLfz4KFU1iFNEABzel5jNUlcgSKiLZTXhgdUbVpBQhvQZook17Z26oC8x+I92
 Kqw26/a9rxOHNFUPyA1v8xkCofJMAgh45s4p7T9SEsz5KknpGQn+JSam3udRoSF79D
 JcwPKgnF+Gb7n0xG2o5q3ZdCK1XwGP234FVVLgPnpE7Dny5AEZWXqxbge/dQJ7fmyT
 BLnrlNNGDqbSg==
Received: by mail-ej1-f54.google.com with SMTP id jg20so21663955ejc.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 11:53:57 -0800 (PST)
X-Gm-Message-State: AOAM533wQzIb4aCaXkXRPwL53UFZWGjXHYSLh33yXjelMsI2GcZWZeNy
 iwsOdV7PXtLPvyIO6Zb4ZSO+N/c5tDU/sCFOAw==
X-Google-Smtp-Source: ABdhPJzC9sVdAIFHy7S1BKRXKLnYS/B1vXl5yMVBOJv/Qip68D1M6dRfb08LeY0VUnzZG5cmUksF3YA2hW+Y4jYVYLc=
X-Received: by 2002:a17:907:628c:: with SMTP id
 nd12mr586045ejc.82.1644954836019; 
 Tue, 15 Feb 2022 11:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20220214174132.219303-1-david@redhat.com>
 <20220214174132.219303-2-david@redhat.com>
In-Reply-To: <20220214174132.219303-2-david@redhat.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 15 Feb 2022 13:53:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKzL6xBXfuTv423EoWw=fYPnK_q5paqUSDWyyoNx1thRA@mail.gmail.com>
Message-ID: <CAL_JsqKzL6xBXfuTv423EoWw=fYPnK_q5paqUSDWyyoNx1thRA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] cma: factor out minimum alignment requirement
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, linux-mm <linux-mm@kvack.org>,
 Minchan Kim <minchan@kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Paul Mackerras <paulus@samba.org>, Zi Yan <ziy@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 14, 2022 at 11:42 AM David Hildenbrand <david@redhat.com> wrote:
>
> Let's factor out determining the minimum alignment requirement for CMA
> and add a helpful comment.
>
> No functional change intended.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/powerpc/include/asm/fadump-internal.h |  5 -----
>  arch/powerpc/kernel/fadump.c               |  2 +-
>  drivers/of/of_reserved_mem.c               |  9 +++------

Acked-by: Rob Herring <robh@kernel.org>

>  include/linux/cma.h                        |  9 +++++++++
>  kernel/dma/contiguous.c                    |  4 +---
>  mm/cma.c                                   | 20 +++++---------------
>  6 files changed, 19 insertions(+), 30 deletions(-)
