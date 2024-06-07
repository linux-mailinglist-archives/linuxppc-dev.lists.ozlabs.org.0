Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFF29001F7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 13:21:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lcMEDcYJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vwf0l0W9pz3cGc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 21:21:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lcMEDcYJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vwdzz2vq7z30WP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 21:21:01 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7041b6b7be0so88928b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2024 04:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717759258; x=1718364058; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E2l49zcksVFHxJOzvcguhpGhpvEDYlJVx4kXyjc2FXw=;
        b=lcMEDcYJE8rfMNv1NW6Y/q3td30M4FnriAesBKvySyosOfxF6Hmas8DujCsHke/ANB
         dULX+H0rl/lq98dIFqkRCTibgOREgEYauJE3pguP0nFw1208zMi6Vs49y//QOnlJTt8i
         zelm3hzumfJJZIY9fUZlUvdq2LYt8xjJd3Fb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717759258; x=1718364058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2l49zcksVFHxJOzvcguhpGhpvEDYlJVx4kXyjc2FXw=;
        b=MCtq3Tju6ZNbHD/fOdZ1jaDhqus5cBmrVmPrH28EYEFjuppJMTtEl0SQ6YI9urxymV
         g0KrvpZv/PKZMsBa1FJh43rbcAiZSgKMTYOa1yZZvVLjQCcPIQMop2ffaDVcL7R7xyP4
         a9DPYuwC9oI2Qr2JDyplSJdlnwueyBZ5FczGPiCbCKk0z2cayMaG9Hmgu78svO4okxr0
         NdsAZPUk5tzsQDJxLEHvWhL/xD7yggdC5HvulERtEPb4E5jFKw5hRapcUYLvrHTTdXKu
         4YJL9zeK9TwA8oOTT137AWv7FuPny+auRXthsiCt/S38cUpFod+Uw8pNJ8FtUpM8L0qD
         2QGA==
X-Forwarded-Encrypted: i=1; AJvYcCXhd+iyui9Boz9NbxDUzuc6x1MN5+ErcEbXtxBoDYImeDQk2lNafIy47+4mfGhrzseZ679NIVtfvyImSTO75XhNydwZa9FU5MIfwdLpeQ==
X-Gm-Message-State: AOJu0Yxaa/jPkJBW2HlLZt+ZYgWLSfgKQbm6vtfrv2ln1mHfp4N5QgH1
	I1WPFJUTyJXydDBcaBcifyOU2CjWL/bWcBbkLN0jmngASexXcBnqeo0grpQylw==
X-Google-Smtp-Source: AGHT+IFZnai7nKK+47+INXizzgR1Xx/LFDvPDJsaelMa42GjTo09b1xp3Xvko+TvKEPwpjRbZYeKxA==
X-Received: by 2002:a05:6a00:308d:b0:702:5514:4cb8 with SMTP id d2e1a72fcca58-703f85f2828mr5811403b3a.4.1717759258453;
        Fri, 07 Jun 2024 04:20:58 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:bd91:9a1b:54a5:7a73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd3b187fsm2392521b3a.85.2024.06.07.04.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:20:57 -0700 (PDT)
Date: Fri, 7 Jun 2024 20:20:52 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0,
 mode:0x820(GFP_ATOMIC), nodemask=(null),cpuset=/,mems_allowed=0 (Kernel
 v6.5.9, 32bit ppc)
Message-ID: <20240607112052.GA479513@google.com>
References: <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
 <20240604231019.18e2f373@yea>
 <CAJD7tkYq5u7B+0UH2XKpeWJnUxoO2kJ1_XZ2JOgYpyNEVR7u0g@mail.gmail.com>
 <20240606010431.2b33318c@yea>
 <CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
 <e68bcc6a-25b1-42aa-83b3-5d457b254cbe@linux.dev>
 <20240606043156.GC11718@google.com>
 <6335c05d-9493-4b03-85a7-f2dd91db9451@linux.dev>
 <20240606054334.GD11718@google.com>
 <CAKEwX=OAEzKW9zO9pn41V71A8Ua2dJjD3DY6RsDMNdSd-4ts5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKEwX=OAEzKW9zO9pn41V71A8Ua2dJjD3DY6RsDMNdSd-4ts5w@mail.gmail.com>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Yu Zhao <yuzhao@google.com>, linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org, "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (24/06/07 10:40), Nhat Pham wrote:
> Personally, I'm not super convinced about class locks. We're
> essentially relying on the post-compression size of the data to
> load-balance the queries - I can imagine a scenario where a workload
> has a concentrated distribution of post-compression data (i.e its
> pages are compressed to similar-ish sizes), and we're once again
> contending for a (few) lock(s) again.
> 
> That said, I'll let the data tell the story :) We don't need a perfect
> solution, just a good enough solution for now.

Speaking of size class locks:

One thing to mention is that zsmalloc merges size classes, we never have
documented/claimed 256 size classe, the actual number is always much
much lower.  Each such "cluster" (merged size classes) holds a range of
objects' sizes (e.g. 3504-3584 bytes).  The wider the cluster's size range
the more likely the (size class) lock contention is.

Setting CONFIG_ZSMALLOC_CHAIN_SIZE to 10 or higher makes zsmalloc pool
to be configured with more size class clusters (which means that clusters
hold narrower size intervals).
