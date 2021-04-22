Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A58F367C73
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 10:23:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQr6L0h1wz3f0t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 18:23:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BC2Z7dWm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=BC2Z7dWm; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQr390wk0z3dQV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 18:20:52 +1000 (AEST)
Received: by mail-qv1-xf31.google.com with SMTP id i11so16080663qvu.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BktECYBH/xHVGxDXNo4Rc6r/8IEdgyWc2mDrQ18gIJM=;
 b=BC2Z7dWmz0+RdT/XQKgh1K4ZkXJWhtVP5f0aeqau16cKa9TxEulrDttNm/OJj6Mh7t
 UyOvttg8zei2cv/nltxGkE0p3bcuSz0WfMCJrDJbCm50bzbAxl15NHtEWBdONDfWW0Bm
 8ytbqnnr0G3b0l9nz1ILNC8uPEz+czqvEKbV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BktECYBH/xHVGxDXNo4Rc6r/8IEdgyWc2mDrQ18gIJM=;
 b=jAAttTe83iJQFi6vpWQdJI8FMg4FpcDXifhrKZ87ktVozphq233An5psWu7EB55O/F
 /LiT6GHtpGug5DUgRAnAhb7wZ62BzwSJLfWKVXCOUpNiNhOAXY1jD5wwlQpuHtnIrJtK
 y6x5e2TV3EQO5MyQ4Mrx9X1MNx61rol4wMmNvG+bwp8Ofx82IpyA8s5uGVi8ojZYOXF8
 sHH7ZWiWsKSzYFP6YsiTXp4hU2DmLr95SXbO+Tco45863coRvfzpNSkUwLd6ip3IwDx0
 HKf1E+3nzimWTpgjlFKznB0qF+e+u7Nx0U3XfUbxvOraV/Tqyv1T6szYiucYlOiw+owp
 uSQw==
X-Gm-Message-State: AOAM533lRqrDnKv2TLj9EcP3FGcvvtOH0B8ri+Ubh1PCSA1exYCP3S3c
 lAMoo31Vif4UyU+Ne9jO7m6stE9/FSmPeA==
X-Google-Smtp-Source: ABdhPJz+flCova+kQ1TEiuDvFNrSp8QHta2Llyx6gB69b4GpkKpQJareLOOsefbObf/qkDSeqpWLOA==
X-Received: by 2002:a0c:fc46:: with SMTP id w6mr2415753qvp.0.1619079647480;
 Thu, 22 Apr 2021 01:20:47 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182])
 by smtp.gmail.com with ESMTPSA id o12sm1742640qtg.14.2021.04.22.01.20.46
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 01:20:47 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id q4so4838500qtn.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 01:20:46 -0700 (PDT)
X-Received: by 2002:a05:6638:34a0:: with SMTP id
 t32mr2134909jal.10.1619079635295; 
 Thu, 22 Apr 2021 01:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210209062131.2300005-1-tientzu@chromium.org>
In-Reply-To: <20210209062131.2300005-1-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Thu, 22 Apr 2021 16:20:24 +0800
X-Gmail-Original-Message-ID: <CALiNf29cMK_j2NF3sbzMJLsss0v8fcvWMkQULHViQVebmdmTsQ@mail.gmail.com>
Message-ID: <CALiNf29cMK_j2NF3sbzMJLsss0v8fcvWMkQULHViQVebmdmTsQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] Restricted DMA
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, 
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
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
 paulus@samba.org, mingo@kernel.org, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v5 here: https://lore.kernel.org/patchwork/cover/1416899/ to rebase
onto Christoph's swiotlb cleanups.
