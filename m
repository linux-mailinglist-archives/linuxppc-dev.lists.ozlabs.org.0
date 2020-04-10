Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1926E1A4362
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 10:12:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z9jt2MZyzDr1F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 18:12:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2607:f8b0:4864:20::341; helo=mail-ot1-x341.google.com;
 envelope-from=daniel.vetter@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=ffwll.ch header.i=@ffwll.ch header.a=rsa-sha256
 header.s=google header.b=dFrk5z2B; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48z9h763NtzDqyf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 18:11:16 +1000 (AEST)
Received: by mail-ot1-x341.google.com with SMTP id d18so1192712otc.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 01:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hgf3DAUC4/KD19F9Gq5AGfjZOzS9LXWN/bbu/vFg+qA=;
 b=dFrk5z2BtMEmisYXExkZBismSlsWb5Q4k/3n94YDOvTZuh2CzIpH/i8KoNWzlv4bXk
 /+Bzn+RqlG2O4N1iciPqbf359lmAxRrY7woQmtsWzKRq9DFPU3AhxhJ6V+T7GDyl1tRC
 5xNRsfm5urzQ2GX3QtuJdU9JR4uI52qA4fFG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hgf3DAUC4/KD19F9Gq5AGfjZOzS9LXWN/bbu/vFg+qA=;
 b=dvnc/GDa9eaqXK5asjHx+cTCVN0Pb+NKXNkxJC3OxveCa0dcqejgEZ2TrsdHTYufnG
 GhaxNpK85SQ8jauEIldktppA9Uj9jCAoC2Bx9gktfSLTIVGi1eR2xRTyTpOt5Lgh29rD
 BbYs3FJ8uFw1mbxQ3tJzqr0luo2+sg2wTpN2G/toopOC63tR2dKrLuLFBLV7yij8iDTg
 MRGjr41QwyH2Ab4vYxSdMPlXDMw1LpoVW6BBox5ZBVLOkJdrgO5uK0XQEJ+zyyNb2M3q
 HNveC0bd6XzNa08orFBzVJLr7603uy3HrXpxIhqI0XRmyCbSAOOD9vv8nPy8yaCUt6Db
 pMeg==
X-Gm-Message-State: AGi0PuZF9T9UVWAX1W5Ji33uU+WF2n2lhize0lAW9dod1VwpHTNcQ+zW
 koLyAMuJJApEqe+ifZi70gYTNzRNeebNibMUQH6p6Q==
X-Google-Smtp-Source: APiQypJumpZ6N8vscDAXJtrZPRakBWDA3qYtIErOA5tqj0XblmFZSMuMiwpkQHsTVZs7vae7PdjUGGhKyrX4Ng8eQNQ=
X-Received: by 2002:a9d:6e8f:: with SMTP id a15mr3449972otr.188.1586506273249; 
 Fri, 10 Apr 2020 01:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-20-hch@lst.de>
 <20200408122504.GO3456981@phenom.ffwll.local>
 <eb48f7b6327e482ea9911b129210c0417ab48345.camel@kernel.crashing.org>
 <CAKMK7uHtkLvdsWFGiAtkzVa5mpnDvXkn3CHZQ6bgJ_enbyAc8A@mail.gmail.com>
 <0f360b9cb72b80bae0d0db8150f65598c2776268.camel@kernel.crashing.org>
In-Reply-To: <0f360b9cb72b80bae0d0db8150f65598c2776268.camel@kernel.crashing.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 10 Apr 2020 10:11:02 +0200
Message-ID: <CAKMK7uHKyN+c5oTEYVursx4at9br7LSXRb8PMoNEAEBh0hfBLQ@mail.gmail.com>
Subject: Re: [PATCH 19/28] gpu/drm: remove the powerpc hack in
 drm_legacy_sg_alloc
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, X86 ML <x86@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 bpf <bpf@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 10, 2020 at 12:57 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
>
> On Thu, 2020-04-09 at 11:41 +0200, Daniel Vetter wrote:
> > Now if these boxes didn't ever have agp then I think we can get away
> > with deleting this, since we've already deleted the legacy radeon
> > driver. And that one used vmalloc for everything. The new kms one does
> > use the dma-api if the gpu isn't connected through agp
>
> Definitely no AGP there.

Ah in that case I think we can be sure that this code is dead.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
