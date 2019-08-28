Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A45ADA0E64
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 01:43:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jj4K4cGxzDrMG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 09:43:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=changbin.du@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kWxS12FO"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jj294BYJzDrGx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 09:41:52 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id y200so774565pfb.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 16:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LEwbl1nqNHBHcJacD9dfeICHgcsBE/f/ceNiyU0uO2c=;
 b=kWxS12FOGo7kRO8bUZisQdbdPaD7m90liBO1DJILGgor5och3M3Y8ixQUrLiOlvUAQ
 KSCAKzPOIhK4qh4mkp723yecDQTzrNvHfSo5O2PLFMUzPr9tFIvttGdACmQk3GcLv9I5
 cjYvi8Gr7ER3JMRMI2IeaYoSEzfDVilJaC9VvUum/aPr5t4C5xA5idz5lFsS5zANKFcg
 337AY91x4TvIwnn1y9efIs3f4w9SNmURv9K2dvAIcHu0ypgbd+SQV2CIW7BfJIlZApXq
 u8dQIG+K1EEA2/INmvvXiOQePA1oy0eoOgbrzRogC4V4vLfCANYJbRnPt4/hj/mnM9HJ
 IDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LEwbl1nqNHBHcJacD9dfeICHgcsBE/f/ceNiyU0uO2c=;
 b=UatMhJqB5/zZ0/hQYuTEWUZAtlkD0PBOIlegIGWSIthSBEOQKs3oVyybYCXfc6aht1
 M9qUJZG1chkroDe6VcokRPZDNEMgSm7RKDhvMtuBVhZ6pU/TQG47cpV7AGXtX72ZtXzS
 Ue3aNbrin/49QFQZw+e5UIslgAuWZmwBkrjXTrLgDpGrkszN8tb1OSM4r1qsGq5zl0mY
 CSRnuesIAmbTrZ4+tJgFv6839Y8rH6Uh2BTpLfGNJXQLcx7STbrWvZMvyDVOgLq6Xr3w
 5BIS6S0AgUYLM9rxRIbsigROOZy6t3l+jzl2VYHQe2F237T+S3ruwu3RzmLx6TwOhvQm
 aywA==
X-Gm-Message-State: APjAAAWnCVnmwaC07wn72KLHa2Tpgz6ha2v2DLiS+ENqfUGjXCfVOy92
 /tSDqBIbkwOPHUXFxFQGrk4=
X-Google-Smtp-Source: APXvYqyltBUmIDPff9MzOKVsnLKdLLLDhQKStB24jbwVvtjezQpxtP9BLXnDENuon3HqazilZSGjqw==
X-Received: by 2002:a17:90a:32a3:: with SMTP id
 l32mr7061863pjb.14.1567035708956; 
 Wed, 28 Aug 2019 16:41:48 -0700 (PDT)
Received: from mail.google.com ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id g1sm270497pgg.27.2019.08.28.16.41.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 28 Aug 2019 16:41:48 -0700 (PDT)
Date: Wed, 28 Aug 2019 23:41:34 +0000
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 01/11] ftrace: move recordmcount tools to scripts/ftrace
Message-ID: <20190828234133.quir3ptl4kidnxud@mail.google.com>
References: <20190825132330.5015-1-changbin.du@gmail.com>
 <20190825132330.5015-2-changbin.du@gmail.com>
 <20190826184444.09334ae9@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826184444.09334ae9@gandalf.local.home>
User-Agent: NeoMutt/20180716-508-7c9a6d
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-parisc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, "John F . Reiser" <jreiser@BitWagon.com>,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Matt Helsley <mhelsley@vmware.com>, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Changbin Du <changbin.du@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 26, 2019 at 06:44:44PM -0400, Steven Rostedt wrote:
> On Sun, 25 Aug 2019 21:23:20 +0800
> Changbin Du <changbin.du@gmail.com> wrote:
> 
> > Move ftrace tools to its own directory. We will add another tool later.
> > 
> > Cc: John F. Reiser <jreiser@BitWagon.com>
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > ---
> >  scripts/.gitignore                   |  1 -
> >  scripts/Makefile                     |  2 +-
> >  scripts/Makefile.build               | 10 +++++-----
> >  scripts/ftrace/.gitignore            |  4 ++++
> >  scripts/ftrace/Makefile              |  4 ++++
> >  scripts/{ => ftrace}/recordmcount.c  |  0
> >  scripts/{ => ftrace}/recordmcount.h  |  0
> >  scripts/{ => ftrace}/recordmcount.pl |  0
> >  8 files changed, 14 insertions(+), 7 deletions(-)
> >  create mode 100644 scripts/ftrace/.gitignore
> >  create mode 100644 scripts/ftrace/Makefile
> >  rename scripts/{ => ftrace}/recordmcount.c (100%)
> >  rename scripts/{ => ftrace}/recordmcount.h (100%)
> >  rename scripts/{ => ftrace}/recordmcount.pl (100%)
> >  mode change 100755 => 100644
> 
> Note, we are in the process of merging recordmcount with objtool. It
> would be better to continue from that work.
> 
>  http://lkml.kernel.org/r/2767f55f4a5fbf30ba0635aed7a9c5ee92ac07dd.1563992889.git.mhelsley@vmware.com
> 
> -- Steve
Thanks for reminding. Let me check if prototype tool can merge into
objtool easily after above work.

-- 
Cheers,
Changbin Du
