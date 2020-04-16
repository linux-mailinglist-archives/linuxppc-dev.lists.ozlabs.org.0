Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BD01AD14E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 22:40:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493B1K2XVqzDrq9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 06:40:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=minchan.kim@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gnCYkWmG; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4939yd0lKBzDrN8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 06:37:44 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id i3so2213506pgk.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 13:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XptGLsb8LK835cBV0jSCf0HRG/zsBSED6dv7tPgulp4=;
 b=gnCYkWmGETLB8PFSLV04Wdrz2FK+gEIIVYi1koqv0Kj68T1sE9a0zKATXAPY7gyzfJ
 suAROh/dNMoI6pHy/mCCmAEukmmvuLcuT+oRiOR7pSsJ7zs8in52Gebp1M1SYorAU4tK
 gOw3D6aDwjxZUg6c2JW6Y26Oj3CTSIyaIex5HlRUwrN0Akr9mc2rJN/ETJ63AkMWNaPZ
 lBqmfTlQr2tQLv3hxk3korpwrPMIzUOkCHKM9MiAc5EcYNrnyoXofMkm1N6eYHhs/DeF
 913mMDnNGshbbDlgR/ygTf2Uto9ROB2t1oEKoFobtuWYnROIBcT0nnQEOaLeZGRWafc8
 pefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=XptGLsb8LK835cBV0jSCf0HRG/zsBSED6dv7tPgulp4=;
 b=s3lZufXlCc4US/k273G4fovTcVsE67AftDkW2JQ+myES9FL96AJBvH8X2ZpqBsFz2T
 jUoFRKHsh7JE5AVaQ4phxcqhV6j2Aw6rsUjcBT5V+3EnQzTkrTXd3cCORwcZz517/pCp
 B1laN2Sy14Veha3ZW6ekZax1enWXVLUvPPXWrJdgARAtCqlFlZNXLhrJUzHXtFybMAwt
 OeR0r301sCiTnfz6/yKxwfqpgD4ZVrnbF7iLArHwG34dj1JQEELHqoZ+LLDMfIwB8nPS
 ZR0nCvf6H5AAXL/NAcAn9jDWemC4yFKt+LVno3Wk6zFY+XZVVbvEATeM9m2Zrn2mQIiM
 Q37g==
X-Gm-Message-State: AGi0PuZWRRcBfw1gd6fOSWh7czuQbRj1KmexHFTHwf++9rw6pnDl5P7x
 T1/VhrnvSL4agx5Jxwg09ss=
X-Google-Smtp-Source: APiQypLz/G622vMAZI/1t7tx6iXdrAiprqdhsptFvPk2bcCnaQJR//IYq0Xxli2CBTatOLYd6eCB1g==
X-Received: by 2002:a63:2e03:: with SMTP id u3mr15186804pgu.121.1587069460712; 
 Thu, 16 Apr 2020 13:37:40 -0700 (PDT)
Received: from google.com ([2601:647:4001:3000::50e3])
 by smtp.gmail.com with ESMTPSA id u13sm3654978pjb.45.2020.04.16.13.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 13:37:38 -0700 (PDT)
Date: Thu, 16 Apr 2020 13:37:36 -0700
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/28] mm: only allow page table mappings for built-in
 zsmalloc
Message-ID: <20200416203736.GB50092@google.com>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-11-hch@lst.de>
 <20200409160826.GC247701@google.com>
 <20200409165030.GG20713@hirez.programming.kicks-ass.net>
 <20200409170813.GD247701@google.com>
 <20200410023845.GA2354@jagdpanzerIV.localdomain>
 <20200410231136.GA101325@google.com>
 <20200411072052.GA31242@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200411072052.GA31242@lst.de>
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Daniel Vetter <daniel@ffwll.ch>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 iommu@lists.linux-foundation.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,


Sorry for the late.

On Sat, Apr 11, 2020 at 09:20:52AM +0200, Christoph Hellwig wrote:
> Hi Minchan,
> 
> On Fri, Apr 10, 2020 at 04:11:36PM -0700, Minchan Kim wrote:
> > It doesn't mean we couldn't use zsmalloc as module any longer. It means
> > we couldn't use zsmalloc as module with pgtable mapping whcih was little
> > bit faster on microbenchmark in some architecutre(However, I usually temped
> > to remove it since it had several problems). However, we could still use
> > zsmalloc as module as copy way instead of pgtable mapping. Thus, if someone
> > really want to rollback the feature, they should provide reasonable reason
> > why it doesn't work for them. "A little fast" wouldn't be enough to exports
> > deep internal to the module.
> 
> do you have any data how much faster it is on arm (and does that include
> arm64 as well)?  Besides the exports which were my prime concern,

https://github.com/sjenning/zsmapbench

I need to recall the memory. IIRC, it was almost 30% faster at that time
in ARM so was not trivial at that time. However, it was story from
several years ago.

> zsmalloc with pgtable mappings also is the only user of map_kernel_range
> outside of vmalloc.c, if it really is another code base for tiny
> improvements we could mark map_kernel_range or in fact remove it entirely
> and open code it in the remaining callers.

I alsh have temped to remove it. Let me have time to revist it in this
chance.

Thanks.
