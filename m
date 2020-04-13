Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 633BE1A6CF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 22:04:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491KN31gP9zDqMT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 06:04:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cmpxchg.org (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=hannes@cmpxchg.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cmpxchg-org.20150623.gappssmtp.com
 header.i=@cmpxchg-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=juG10l2Q; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491KLD4Wb8zDqMT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 06:03:12 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id b62so10836245qkf.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 13:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OEtNtfUfCfknsSkfuodbs8GxJYII1GNua8MgFwL7K04=;
 b=juG10l2QIUDc0d5n1SeOUdB0siwuJQOGCU6pnQRUaf/usairEJnMWI4NCHxVUL2frR
 HT8Dj0G2KFCEAuDZkPEiGVv3NLV5ooo7kJcA7V4T4xV81925vc++8cQ5KHVSBI1+By+5
 +/+66XSDZZW/XkKLCzanTlv78m+KRuVYwmVlKC0N09gqxCMtKrGm1srU2i7+Kw1dkX5x
 DPoyq7kDqoEsqgMu8qGEr3vtIBlmiQWaBKBOz/tbp3ah+kvBa7aU6x3A1gaLlMlwJUeg
 hUM97swfra3YIkYNCDFX0ZcS8Au+7KacD3c88l4X9gBMGqiNfPjeT92Va5NYJ5lvz0rD
 aygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OEtNtfUfCfknsSkfuodbs8GxJYII1GNua8MgFwL7K04=;
 b=HFUFi0tpbg54h3xo44PLJUaKh6CA3gHmrP1xxpFHOV7CvAWsyQz/SRKIWkPj37LRZy
 aFIEC9g0gaax+7YbyrIIwJv7+TG2B2tfmoaSUBI5M9SJaeazKMS6QpAo/JbQKNBqZ9lx
 AGDP/hLu2rwHk7ZybBD+xri8bYsme/2chpy3WoWw26LmhpMFR+5YRPu8rsnDthc1qifK
 LtphvvhICAlpmaHhauk7/5BA4RfpKlxmmBWkm3n2659tZlbUWJo3c7VMouDc3YILUzyY
 zq0qnE65JKowe38KYegxnjxNFTJ7Lrs3VIcUJiCxCqGr6qLxPtPCtKW/vQVbsq7N07OQ
 3UVg==
X-Gm-Message-State: AGi0Pua7Zb1iPcSz31p6RTZGOcECsMoJTvZT5B6odGx1prflFVZXGJjA
 J6e9kP1geUEjYcWyvBIdH24G+A==
X-Google-Smtp-Source: APiQypJVwvSR1oEkK4bhCoeIIw8batoCJN92/jh4PNjnx+deBvO5XKiPj+RRAmN7IK2twvZnNWUNMA==
X-Received: by 2002:a37:d93:: with SMTP id 141mr7293908qkn.32.1586808188246;
 Mon, 13 Apr 2020 13:03:08 -0700 (PDT)
Received: from localhost (70.44.39.90.res-cmts.bus.ptd.net. [70.44.39.90])
 by smtp.gmail.com with ESMTPSA id x66sm9119423qka.121.2020.04.13.13.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 13:03:07 -0700 (PDT)
Date: Mon, 13 Apr 2020 16:03:06 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Subject: Re: [PATCH 25/28] mm: remove vmalloc_user_node_flags
Message-ID: <20200413200306.GC99267@cmpxchg.org>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-26-hch@lst.de>
 <CAEf4BzZOC2tLrqt_Km=WQb=9xiya2e31i6K3oJuzgYQt6wp1LQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4BzZOC2tLrqt_Km=WQb=9xiya2e31i6K3oJuzgYQt6wp1LQ@mail.gmail.com>
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
 x86@kernel.org, Christoph Hellwig <hch@lst.de>,
 Peter Zijlstra <peterz@infradead.org>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Daniel Vetter <daniel@ffwll.ch>,
 Haiyang Zhang <haiyangz@microsoft.com>, linaro-mm-sig@lists.linaro.org,
 bpf <bpf@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 09, 2020 at 03:25:03PM -0700, Andrii Nakryiko wrote:
> cc Johannes who suggested this API call originally

I forgot why we did it this way - probably just cruft begetting more
cruft. Either way, Christoph's cleanup makes this look a lot better.

> On Wed, Apr 8, 2020 at 5:03 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Open code it in __bpf_map_area_alloc, which is the only caller.  Also
> > clean up __bpf_map_area_alloc to have a single vmalloc call with
> > slightly different flags instead of the current two different calls.
> >
> > For this to compile for the nommu case add a __vmalloc_node_range stub
> > to nommu.c.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
