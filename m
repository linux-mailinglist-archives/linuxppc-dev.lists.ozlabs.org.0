Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96609326049
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 10:41:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dn4S24NZnz3clw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 20:41:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YlJGaB2H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=YlJGaB2H; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dn4Rb2nJ6z30Jb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 20:41:28 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id q85so8461571qke.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 01:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E8MT/YBSt9+GOAVKSt/z+/x/oAmJs4mba4MVCW+FEPI=;
 b=YlJGaB2HjeORjhsgYOy8pctb9+8JkGl/ZdIRVJcfQxCMoR62lL7XtrY95NgsqhINjE
 lSgvnnp9tfO6u1oKErjW0g+HTDOG3GFiOyn5d4dJiyFIJKbzFBupmPEB/V7jXmUb4d2q
 N9u5qLxflCWFXhFfzUGrtIkZV0aKvT2pOtERk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E8MT/YBSt9+GOAVKSt/z+/x/oAmJs4mba4MVCW+FEPI=;
 b=EE4Bes7D3L9U2fIV5Q8wOQNKlRlsqSYQMe9/qZNhu4HsL0ZGFoHbNtvvlyF060FCK9
 yzSKs/Dw7KqvgSNcSAwZEseOcn2dxXQLRwoTFEU1XetRf7XIW2julSoP5yCcNzOuKGC0
 KhnPqGAgng8lrReYq5ALWx/3VLddNMR1LYKQPsG9UviRacbhEx++4biPxVfoHIbF+8Fa
 XDYx2cQp7JWZs+qZNQHJy67x000dFdgb08G0zNM/FSYfgfHBhG+l2oburSiWUMotsO+o
 8IB+IkJTif8Ui81NRIzho7VURZleFvl3TyAGML26fGzdguhiCd/Bi8vMqZY7c1htzJpb
 +FKQ==
X-Gm-Message-State: AOAM531h9410z6MsSKfpv330n/ndwA/r90iyDLBsN+79T23KOn6NJB7h
 /BwHjEi5OE+QKALHGJ6MGGEFXFSm9kluXA==
X-Google-Smtp-Source: ABdhPJxpMrFt/P1VQSCGPDfa8V2ZQxD2WgzsB3R4MYAd0GrZgM4uNlh3v/ZXeS0eYejK3jY9yPo49g==
X-Received: by 2002:a05:620a:1251:: with SMTP id
 a17mr1749548qkl.431.1614332481640; 
 Fri, 26 Feb 2021 01:41:21 -0800 (PST)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com.
 [209.85.222.178])
 by smtp.gmail.com with ESMTPSA id g7sm5569745qtc.39.2021.02.26.01.41.21
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 01:41:21 -0800 (PST)
Received: by mail-qk1-f178.google.com with SMTP id n28so6968638qkk.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 01:41:21 -0800 (PST)
X-Received: by 2002:a02:b61a:: with SMTP id h26mr2057255jam.90.1614332168202; 
 Fri, 26 Feb 2021 01:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <20210209062131.2300005-13-tientzu@chromium.org>
 <CALiNf298+DLjTK6ALe0mYrRuCP_LtztMGuQQCS90ubDctbS0kw@mail.gmail.com>
 <20210226051740.GB2072@lst.de>
In-Reply-To: <20210226051740.GB2072@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 26 Feb 2021 17:35:57 +0800
X-Gmail-Original-Message-ID: <CALiNf29tSQ1R8zh35neQWuWqDPek+Jr8QzyPQQvTsW2cZBMEUw@mail.gmail.com>
Message-ID: <CALiNf29tSQ1R8zh35neQWuWqDPek+Jr8QzyPQQvTsW2cZBMEUw@mail.gmail.com>
Subject: Re: [PATCH v4 12/14] swiotlb: Add restricted DMA alloc/free support.
To: Christoph Hellwig <hch@lst.de>
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 26, 2021 at 1:17 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Feb 26, 2021 at 12:17:50PM +0800, Claire Chang wrote:
> > Do you think I should fix this and rebase on the latest linux-next
> > now? I wonder if there are more factor and clean up coming and I
> > should wait after that.
>
> Here is my preferred plan:
>
>  1) wait for my series to support the min alignment in swiotlb to
>     land in Linus tree
>  2) I'll resend my series with the further swiotlb cleanup and
>     refactoring, which includes a slightly rebased version of your
>     patch to add the io_tlb_mem structure
>  3) resend your series on top of that as a baseline
>
> This is my current WIP tree for 2:
>
>   http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/swiotlb-struct

Sounds good to me. Thanks!
