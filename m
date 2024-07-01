Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190EF91D6FB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 06:25:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=xlL4FoOK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCCdJ6V33z3cXQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 14:25:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=xlL4FoOK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fromorbit.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=david@fromorbit.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCCcZ1X4lz2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 14:24:44 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1fa244db0b2so16471515ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2024 21:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1719807880; x=1720412680; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q8FaXxeW49XxQjIVoOOnJuKPW6Isofg2ljkc7tdAOtU=;
        b=xlL4FoOKzqObqg15S4jMOU4JuO6fUhtoELYUGiJHkzUcknykRvlOqs9KrtitdfBl/P
         shE9DhVhmocfztDI4T3R+T4Gz4+b4XAZ+KahHV/ne26RW9rWqAsuWK56XEDSa5XfKE6Z
         gUVCa4CjK1/OhLpMJR9iuxsYxeGAulLPF7TAO0wyUDLXVdRaXlMK0YmBGvoMN7+44aiG
         qnBBzMjgOfwkff1e2XPkXJfDPvCp29DCpuneR6owkYHrsEqsmR0Ik2Mg029DBSGhpDYu
         SkbdpQ5JE9UDEoaBCNm3NMi1Fc3Xcuo4Lb4vrbwjrPVpZ7JZgojEsPD6CizP0Dno6nR7
         3mfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719807880; x=1720412680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8FaXxeW49XxQjIVoOOnJuKPW6Isofg2ljkc7tdAOtU=;
        b=n3fknLcVTz1meVBH/vsz8oyg0INmMShpnreqiKpYqApcmkeO7wJyzI/Tr533bbvldG
         gHJBT4Al2T3R1V4Ge7cYQsUI8RcPKfcv3NtU8BDDi93PVimZnZQPT/Oo96oVv5OMXGMV
         P6odpnjH10GTLxR/Lpct8GUS50u6kkhmH/wug67bbLEwLTIQQ4En0qKo+SkUNOQ9EAx2
         TeNOoYwu7TQVQxq4FffXaTLrQRDOxxyAtJStKqVGWeLLg1t/XHnMxeqYIZCI94MGgnv6
         aly8ODXSmrE7m86T/PMZEdD+54zOTCv3XDSKw5nkXeuk2f9MAG7/IsO2KMwYYTi0fY8A
         wyFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV66z5ybPXBFtI+seGuFAFOj6oIHkjjUT5gVz4Y9CEe+BOQLN32fcHg+IBcm/zGb7BdeNLe8xidyVN8KpPOTBQp4OLnb0ucWO6GoW093w==
X-Gm-Message-State: AOJu0YzCNMiSrt2OdI47hI9a3mCxaVbMLd6NFxNUOTj2+cDnN+mU+2na
	HUTFXfEcolhocg496uTVSv0NUsfhKTkdQn1R50Jtt7RC9CejJ24QN8viOSI1KEs=
X-Google-Smtp-Source: AGHT+IFKQ7mlIRHK3qLypxLI+wB6C/xuRboouR5zOv5/KrFwuLBxwDWk/1+R28Hzvt5tq0xC0UW+Zw==
X-Received: by 2002:a17:902:d2cc:b0:1fa:2d0:f85b with SMTP id d9443c01a7336-1fadbce9d59mr26040185ad.49.1719807879574;
        Sun, 30 Jun 2024 21:24:39 -0700 (PDT)
Received: from dread.disaster.area (pa49-179-32-121.pa.nsw.optusnet.com.au. [49.179.32.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1569051sm53926215ad.215.2024.06.30.21.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 21:24:39 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1sO8ai-00HWNB-2Q;
	Mon, 01 Jul 2024 14:24:36 +1000
Date: Mon, 1 Jul 2024 14:24:36 +1000
From: Dave Chinner <david@fromorbit.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 00/13] fs/dax: Fix FS DAX page reference counts
Message-ID: <ZoIvhDvzMCw28VBI@dread.disaster.area>
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com>
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
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, jack@suse.cz, david@redhat.com, djwong@kernel.org, dave.hansen@linux.intel.com, peterx@redhat.com, linux-mm@kvack.org, will@kernel.org, hch@lst.de, dave.jiang@intel.com, vishal.l.verma@intel.com, linux-doc@vger.kernel.org, willy@infradead.org, jgg@ziepe.ca, catalin.marinas@arm.com, linux-ext4@vger.kernel.org, ira.weiny@intel.com, jhubbard@nvidia.com, npiggin@gmail.com, linux-cxl@vger.kernel.org, bhelgaas@google.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2024 at 10:54:15AM +1000, Alistair Popple wrote:
> FS DAX pages have always maintained their own page reference counts
> without following the normal rules for page reference counting. In
> particular pages are considered free when the refcount hits one rather
> than zero and refcounts are not added when mapping the page.
> 
> Tracking this requires special PTE bits (PTE_DEVMAP) and a secondary
> mechanism for allowing GUP to hold references on the page (see
> get_dev_pagemap). However there doesn't seem to be any reason why FS
> DAX pages need their own reference counting scheme.
> 
> By treating the refcounts on these pages the same way as normal pages
> we can remove a lot of special checks. In particular pXd_trans_huge()
> becomes the same as pXd_leaf(), although I haven't made that change
> here. It also frees up a valuable SW define PTE bit on architectures
> that have devmap PTE bits defined.
> 
> It also almost certainly allows further clean-up of the devmap managed
> functions, but I have left that as a future improvment.
> 
> This is an update to the original RFC rebased onto v6.10-rc5. Unlike
> the original RFC it passes the same number of ndctl test suite
> (https://github.com/pmem/ndctl) tests as my current development
> environment does without these patches.

I strongly suggest running fstests on pmem devices with '-o
dax=always' mount options to get much more comprehensive fsdax test
coverage. That exercises a lot of the weird mmap corner cases that
cause problems so it would be good to actually test that nothing new
got broken in FSDAX by this patchset.

-Dave.
-- 
Dave Chinner
david@fromorbit.com
