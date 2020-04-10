Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D66661A4C7D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 01:13:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zYhp6W1QzDrF2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 09:13:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=minchan.kim@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q7YTOEbn; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zYg60BYGzDrCJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 09:11:43 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id e16so1001648pjp.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 16:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bQcdpto7s/yGk2w0OzvQ6UptVyKViN3oMFbbBVW84wQ=;
 b=q7YTOEbnyV60h/2JZUSD3yvsv3FfYyTmAHedS5dXvC6eEJqoWdAqQM8fRMbYNEb/DL
 TWa8f1bEPIXO2DpHtzWmZ1hQdADUheduicV44X6NhmrZnsTNDIZa9VTHkg2rqK9WXs9O
 CtfQg7RxKV1aU+9PajTKBmDFHloR88hUsjTCxairuAofrjSvkiIjlmrksHhAsr4eSull
 P/eN5aSURPoT5uOWbLvn9TO2HAsL3MlV2FT0WDF8H+ov5BHzMNCa3A04caDPl50c1Iqw
 Q60AlHo9v7XVZ5xht9Dtvdi6fj0cEQuu9XG4/VxucECmylB5pc3N/jO1PdzV7ryJfNk2
 odzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=bQcdpto7s/yGk2w0OzvQ6UptVyKViN3oMFbbBVW84wQ=;
 b=WnLu3h0YOI09ujBfbctSz1xBOy05eXUo1Nvrmrmkn0qQ3Jbr5q5g4hDjLTg1ND9lMu
 h8fY0QAWTMt4kufkdIUR0xzA9HAMb9jiUCBdPnq2XitXUWvCxQ2f2hmcD1FBDRd11i8l
 z9PT1d4vzJ/bTvw7/PMaxTxu+zd8XKN5vjeH+TJoYrQOumIeMFTTdzNvOHTIMbwWsO9a
 zXeOt876Au2YKG2AXy9cAKWGXWqKkqypMOBl4uts0faq8ojKKHh35mQ4fUZe30vaysDN
 Idre1WsGGZ3ofIGQpRj73ufJeuEzYyMMuzwwpZAy2gwoVEx5bL889Y+4CQurWLcKdRA2
 HOWg==
X-Gm-Message-State: AGi0PuYdYGL5LZliV12ATaGq3ZrhFlTKzxy1s8P5req5bUoPAbFS0wfz
 +/uyY5gvfNtqk7rRVngA/lc=
X-Google-Smtp-Source: APiQypIEPforRWpT0WXypxL4A3ey15BGc+kDge0iIn1cftbyny3ESjfu/Br0BZMCFGD2PtWlRrOKew==
X-Received: by 2002:a17:902:b409:: with SMTP id
 x9mr6968379plr.125.1586560301031; 
 Fri, 10 Apr 2020 16:11:41 -0700 (PDT)
Received: from google.com ([2601:647:4001:3000::50e3])
 by smtp.gmail.com with ESMTPSA id 15sm2629073pfu.186.2020.04.10.16.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 16:11:39 -0700 (PDT)
Date: Fri, 10 Apr 2020 16:11:36 -0700
From: Minchan Kim <minchan@kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCH 10/28] mm: only allow page table mappings for built-in
 zsmalloc
Message-ID: <20200410231136.GA101325@google.com>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-11-hch@lst.de>
 <20200409160826.GC247701@google.com>
 <20200409165030.GG20713@hirez.programming.kicks-ass.net>
 <20200409170813.GD247701@google.com>
 <20200410023845.GA2354@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410023845.GA2354@jagdpanzerIV.localdomain>
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
Cc: linux-hyperv@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Christoph Hellwig <hch@lst.de>,
 David Airlie <airlied@linux.ie>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Daniel Vetter <daniel@ffwll.ch>,
 Haiyang Zhang <haiyangz@microsoft.com>, linaro-mm-sig@lists.linaro.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sergey,

On Fri, Apr 10, 2020 at 11:38:45AM +0900, Sergey Senozhatsky wrote:
> On (20/04/09 10:08), Minchan Kim wrote:
> > > > Even though I don't know how many usecase we have using zsmalloc as
> > > > module(I heard only once by dumb reason), it could affect existing
> > > > users. Thus, please include concrete explanation in the patch to
> > > > justify when the complain occurs.
> > > 
> > > The justification is 'we can unexport functions that have no sane reason
> > > of being exported in the first place'.
> > > 
> > > The Changelog pretty much says that.
> > 
> > Okay, I hope there is no affected user since this patch.
> > If there are someone, they need to provide sane reason why they want
> > to have zsmalloc as module.
> 
> I'm one of those who use zsmalloc as a module - mainly because I use zram
> as a compressing general purpose block device, not as a swap device.
> I create zram0, mkfs, mount, checkout and compile code, once done -
> umount, rmmod. This reduces the number of writes to SSD. Some people use
> tmpfs, but zram device(-s) can be much larger in size. That's a niche use
> case and I'm not against the patch.

It doesn't mean we couldn't use zsmalloc as module any longer. It means
we couldn't use zsmalloc as module with pgtable mapping whcih was little
bit faster on microbenchmark in some architecutre(However, I usually temped
to remove it since it had several problems). However, we could still use
zsmalloc as module as copy way instead of pgtable mapping. Thus, if someone
really want to rollback the feature, they should provide reasonable reason
why it doesn't work for them. "A little fast" wouldn't be enough to exports
deep internal to the module.

Thanks.
