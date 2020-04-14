Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3D11A82B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:28:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491qBh5cqfzDqRW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 01:28:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com;
 envelope-from=wei.liu.linux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491psq6qnHzDqSB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 01:13:51 +1000 (AEST)
Received: by mail-wm1-f68.google.com with SMTP id a81so14361270wmf.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 08:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HmBLSR0xc1v+9c640X8yq/gCGBtmZiJRhg2yrai8Uso=;
 b=sIxSPuQNd7a/awjytU2OeJJqv4i+CRs0B8JhmoA7FUg3oFVqpDElFC692bMXoMKDGS
 33pAIxZKqyxj3ysSpoV5s0p6NkzVukPZ4AnPQH7fDyBiKaGzInuTaue6t3r9fbtDyoP5
 kdp2FwHsA2WXGrF4YEpmVDTI7hAMAZH5mEZTlzEFrKeYKEUbYjsM0EdBxlKt10QHGc0j
 F8J5c1MfPWrsCEJ5l0MtRe1wSPFjNKXK1KDb6Frd3TE3KDndCUq+YSyEhARqVvJbHtVD
 Vz/0ZVZAYSRNJD1Qf1JJ4tkqaFGl6hZoQH0eJpHLjQWFKgRjxOqImenyzK4lkFgi7PZC
 E+BQ==
X-Gm-Message-State: AGi0PubuIEp/za6zF0vjvdAEjeado3Grpwn7aKb9n85gsi9z+lkynCQs
 GfyxXf1r4NlvuxPDPKYL2ME=
X-Google-Smtp-Source: APiQypKJS2zs752mK3EmkKLPxDY+LMikzE4AHuLMlZzMU6rlOFHrjCq5D1gZZCfYEUzJLxq6M+CEVA==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr393464wmi.50.1586877227391;
 Tue, 14 Apr 2020 08:13:47 -0700 (PDT)
Received: from debian (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id t67sm20386094wmg.40.2020.04.14.08.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 08:13:46 -0700 (PDT)
Date: Tue, 14 Apr 2020 16:13:44 +0100
From: Wei Liu <wei.liu@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 21/29] mm: remove the pgprot argument to __vmalloc
Message-ID: <20200414151344.zgt2pnq7cjq2bgv6@debian>
References: <20200414131348.444715-1-hch@lst.de>
 <20200414131348.444715-22-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414131348.444715-22-hch@lst.de>
User-Agent: NeoMutt/20180716
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
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 linux-mm@kvack.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Gao Xiang <xiang@kernel.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Daniel Vetter <daniel@ffwll.ch>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 iommu@lists.linux-foundation.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 03:13:40PM +0200, Christoph Hellwig wrote:
> The pgprot argument to __vmalloc is always PROT_KERNEL now, so remove
> it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Michael Kelley <mikelley@microsoft.com> [hyperv]
> Acked-by: Gao Xiang <xiang@kernel.org> [erofs]
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/x86/hyperv/hv_init.c              |  3 +--
[...]
> 
> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
> index 5a4b363ba67b..a3d689dfc745 100644
> --- a/arch/x86/hyperv/hv_init.c
> +++ b/arch/x86/hyperv/hv_init.c
> @@ -95,8 +95,7 @@ static int hv_cpu_init(unsigned int cpu)
>  	 * not be stopped in the case of CPU offlining and the VM will hang.
>  	 */
>  	if (!*hvp) {
> -		*hvp = __vmalloc(PAGE_SIZE, GFP_KERNEL | __GFP_ZERO,
> -				 PAGE_KERNEL);
> +		*hvp = __vmalloc(PAGE_SIZE, GFP_KERNEL | __GFP_ZERO);
>  	}

Acked-by: Wei Liu <wei.liu@kernel.org>
