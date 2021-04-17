Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C71CE36317F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 19:31:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FN0VF5R83z30BP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 03:31:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pokeBsO6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pokeBsO6; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FN0Tp6jNGz301F
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 03:30:38 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D56226128B
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618680635;
 bh=ugaFr7ubcYoZlftrOW8+is8PkeVPg/pgdCmBuE+ol64=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pokeBsO6dVRMBkqi8/yu+5t2S6RsKZsuEFRWuOmUllxciYCV/hKsZJPlPIFAn+dFS
 Lhbp0UYxa+8GNR0jx5rxoIRI19RblhevJhFutJTxtVnnBXTDHcOBAJ9YrYRvhz/ZIQ
 L0jcpMc04X7RUawJc+GPJ09O1vUXNSxv8aJIKKiK0DnoePGq/How3WpglmniU4DxaZ
 aM3UgZ/ri2h3v7xS4jm9thXDeLzXtS9YuOOLqr9ghK8DfiZ0bXj/XZNQjjHq4NjZNU
 iM2DFOrqUDZJrOTKy/CU0rm/zjTn1+nt9fX5AHG1CX2cZw6XqnfgnhxJ9sHCr3nBMG
 5Yn65E7dZ6PvA==
Received: by mail-wm1-f46.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so18173918wma.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 10:30:35 -0700 (PDT)
X-Gm-Message-State: AOAM532aHYxukQ/iAzHZl6ac1bIsc708qW2vrXAOTC50uDhRVRJ12L3V
 Zmia/M8/KEgz3jKIukNpy27pxvIRkkKQNIvObMM=
X-Google-Smtp-Source: ABdhPJx5c7/qiwMYT0ir136uPjUzW1fYOXrUhmuWfobdjxZ7ZRW1mvPQs0zb5XctbTVKp2LKwzYcR2xXWnxiB9rv6sM=
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr13072983wmi.75.1618680634529; 
 Sat, 17 Apr 2021 10:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210411103318.GC2531743@casper.infradead.org>
 <20210412011532.GG2531743@casper.infradead.org>
 <20210414101044.19da09df@carbon>
 <20210414115052.GS2531743@casper.infradead.org>
 <20210414211322.3799afd4@carbon>
 <20210414213556.GY2531743@casper.infradead.org>
 <a50c3156fe8943ef964db4345344862f@AcuMS.aculab.com>
 <20210415200832.32796445@carbon>
 <20210416152755.GL2531743@casper.infradead.org>
 <CAK8P3a2dekzohOrHpLq6yyuaoyC4UOxxucu6kX2oddeq5Jdqfg@mail.gmail.com>
 <20210417135642.GR2531743@casper.infradead.org>
In-Reply-To: <20210417135642.GR2531743@casper.infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 17 Apr 2021 19:30:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2M1fk-CAAjpLSNsobpOKKiHt_ffoKUNv3aqfie09d_PQ@mail.gmail.com>
Message-ID: <CAK8P3a2M1fk-CAAjpLSNsobpOKKiHt_ffoKUNv3aqfie09d_PQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm: Fix struct page layout on 32-bit systems
To: Matthew Wilcox <willy@infradead.org>
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
Cc: Grygorii Strashko <grygorii.strashko@ti.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 David Laight <David.Laight@aculab.com>,
 Jesper Dangaard Brouer <brouer@redhat.com>,
 Matteo Croce <mcroce@linux.microsoft.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 17, 2021 at 3:58 PM Matthew Wilcox <willy@infradead.org> wrote:
> I wouldn't like to make that assumption.  I've come across IOMMUs (maybe
> on parisc?  powerpc?) that like to encode fun information in the top
> few bits.  So we could get it down to 52 bits, but I don't think we can
> get all the way down to 32 bits.  Also, we need to keep the bottom bit
> clear for PageTail, so that further constrains us.

I'd be surprised to find such an IOMMU on a 32-bit machine, given that
the main reason for using an IOMMU on these is to avoid the 32-bit
address limit in DMA masters.

I see that parisc32 does not enable 64-bit dma_addr_t, while powerpc32
does not support any IOMMU, so it wouldn't be either of those two.

I do remember some powerpc systems that encode additional flags
(transaction ordering, caching, ...) into the high bits of the physical
address in the IOTLB, but not the virtual address used for looking
them up.

> Anyway, I like the "two unsigned longs" approach I posted yesterday,
> but thanks for the suggestion.

Ok, fair enough. As long as there are enough bits in this branch of
'struct page', I suppose it is the safe choice.

        Arnd
