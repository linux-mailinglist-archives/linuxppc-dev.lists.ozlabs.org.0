Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F638F89D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 05:15:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpzjx0mzXz3bnb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 13:15:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Uieisilk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Uieisilk; dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpzjR4DXgz2xv5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 13:15:22 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id z24so30026104ioi.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 20:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ibLnJElvlxlVpclpJPUNJ2cC/oiUOQSOujwiFR/Tp+s=;
 b=UieisilkjhqvCv5TM4Uhta7TWRN2Fo+qizEnyHuJxA4va8bXfSD+rLVykfuHhWprMs
 LshPVy4dFsoXIkmd56qov4ggYtlL759ArIJ4nJdiIlOu+d8oU3Tdh/1w/BJ1fDxfpbcA
 V3s9TTUmNV6cOGqUjcXpB0nmY9PGjsUH8vbqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ibLnJElvlxlVpclpJPUNJ2cC/oiUOQSOujwiFR/Tp+s=;
 b=kfJWaMmCnhGkhVHLidD1b7gOkPTaZJ8k0qzDfgZuO05cFWc1nhjpAzZWo7/SLe5sd+
 P3xR49yFgui4qQoLAnU+TDxYilq2Vw+FCwOH8gMrCRS+51STF3DoyvwDa5JLvGUdkgQk
 zCOzJPedinu/Vi0HWH6mKwM918Zhi7f5xIOW+9x04QG4FxNXJyuwPyzxPt0rV6t3fd1t
 oJQEm1DvWwascuRjiJXF57dCnxemUhRClsKjqB+GnKmy2pUmRpfJWo8G/82xGNXrBipw
 o36sqKpYjB8GB5MHBMidPkTzZfFwun3WV4fdnkU65ufjOH2t6aQSt2zcgyp00f9B5hlj
 PYyw==
X-Gm-Message-State: AOAM532XKtddAtB8MXQKy7UbK39M/V5vGHp/nTb5hD8+VBtXqa9zp+Vk
 YMQlWC3uc5/yR/UTEvQivVnGkn7cnwjj7w==
X-Google-Smtp-Source: ABdhPJxt85ySRCQi6Oz8UMvRRGk9AKENr3HjRObLSCZtGhsr4ORIDYwxUzxFUZhOrRhPxDJmtGQN8A==
X-Received: by 2002:a02:866a:: with SMTP id e97mr28822229jai.136.1621912518624; 
 Mon, 24 May 2021 20:15:18 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54])
 by smtp.gmail.com with ESMTPSA id g12sm12036989ile.23.2021.05.24.20.15.18
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 20:15:18 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id v9so3552678ion.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 20:15:18 -0700 (PDT)
X-Received: by 2002:a05:6e02:b:: with SMTP id
 h11mr18955732ilr.18.1621912124990; 
 Mon, 24 May 2021 20:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-6-tientzu@chromium.org>
 <CALiNf28ke3c91Y7xaHUgvJePKXqYA7UmsYJV9yaeZc3-4Lzs8Q@mail.gmail.com>
 <YKvLc9onyqdsINP7@0xbeefdead.lan>
In-Reply-To: <YKvLc9onyqdsINP7@0xbeefdead.lan>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 25 May 2021 11:08:34 +0800
X-Gmail-Original-Message-ID: <CALiNf28=fn5r_O8ET0TNM6cS7WO0mwXiMzR5z=eJXmNKFWKdzA@mail.gmail.com>
Message-ID: <CALiNf28=fn5r_O8ET0TNM6cS7WO0mwXiMzR5z=eJXmNKFWKdzA@mail.gmail.com>
Subject: Re: [PATCH v7 05/15] swiotlb: Add a new get_io_tlb_mem getter
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, maarten.lankhorst@linux.intel.com,
 airlied@linux.ie, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 24, 2021 at 11:51 PM Konrad Rzeszutek Wilk
<konrad.wilk@oracle.com> wrote:
>
> On Tue, May 18, 2021 at 02:51:52PM +0800, Claire Chang wrote:
> > Still keep this function because directly using dev->dma_io_tlb_mem
> > will cause issues for memory allocation for existing devices. The pool
> > can't support atomic coherent allocation so we need to distinguish the
> > per device pool and the default pool in swiotlb_alloc.
>
> This above should really be rolled in the commit. You can prefix it by
> "The reason it was done this way was because directly using .."
>

Will add it.
