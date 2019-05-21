Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ECB25003
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 15:21:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457bxn17r4zDqLc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 23:21:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="Qzja+tqW"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457bv74xRHzDqB4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 23:18:59 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id 198so2968039wme.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 06:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=m/t4nh9Qn5eHvWriEo2lAzUTm+cejgZEB4hMcOrCq4Y=;
 b=Qzja+tqWdJKwhlDJv7ZeHS1krNqDAM++eYcwAp+RKkbv8p1KDPWxxZhzOpavU0EOHV
 kYWbjNPEjkxc3aEKZdrk9785qJNa6FxJtfkDGm1FLt3j0bk9/8YvawePnukWGCyjpFii
 0DMW2p0x+5xPdVsJRuiSOe+/dtlaOGa52u2fWdq9QaNK4Tve8leR5ZqhEKAiqjWW0X06
 oTZk1e1uxbJPDBZIKsNtQKeWDeRpwtxnoV5XKv/I6zW+K9rGYAZZ7B8YjZBRwD4kYhWa
 WgDiIxwS5iY9PCvzQxN+w34XvRhk0st2I0ChEGvAZh7Cr4yOtxIXjdk5keUvD29dcq/r
 WLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=m/t4nh9Qn5eHvWriEo2lAzUTm+cejgZEB4hMcOrCq4Y=;
 b=iyAnk9Kyt6nytqPJEXI9IFd4jmoT3Bjfr61qhbl6bQpPS6nXYjvPRZvW5pZ4p3H2Rs
 m5jDEtu/WMYRJM/LyEKH9A1hG3bH9XG6cKyN3RtBhF1/Uu4Ov/Gt1Cd+1uCtsPKTC5+6
 1PYjnZMBE/xbGgr6P5q1RsvKudF697vzzqhXPCKAEnye1Okb+MgRYwQhNn4amlKRWtqj
 XPU+JdzWQk+Yaq+nKaX0hRBwhjN/0eBRfDqikiNWSzZGlN6Q5s3KWznN5VRmIekEcRmd
 OPvxqVfSn/W+7qv7sOwMTQIAe2LJpQpjh7+aJvNu16yLyXqmVVMb81Jp4oPsy+etBHYH
 Xl+w==
X-Gm-Message-State: APjAAAUMXNAHZVHLIFUkeNHxbsiNQ/d1ZAAS0hRsXKnvDuT+X6q10yv3
 pJHPjyKNzaN3Lvdi4CiHYRj2qQ==
X-Google-Smtp-Source: APXvYqyfKPZSJeUKKvR/WsITTIjBfoMQuzQ5Xtre6YfbYN0C4pHfHkECFwZ8Y50hJAsIDs/Jg3fbyg==
X-Received: by 2002:a1c:9c8c:: with SMTP id f134mr3258598wme.95.1558444734225; 
 Tue, 21 May 2019 06:18:54 -0700 (PDT)
Received: from brauner.io (p548C9938.dip0.t-ipconnect.de. [84.140.153.56])
 by smtp.gmail.com with ESMTPSA id n4sm2071899wmk.24.2019.05.21.06.18.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 21 May 2019 06:18:53 -0700 (PDT)
Date: Tue, 21 May 2019 15:18:50 +0200
From: Christian Brauner <christian@brauner.io>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH 1/2] open: add close_range()
Message-ID: <20190521131849.2mguu5sszhbxhvgu@brauner.io>
References: <20190521113448.20654-1-christian@brauner.io>
 <87tvdoau12.fsf@oldenburg2.str.redhat.com>
 <20190521130438.q3u4wvve7p6md6cm@brauner.io>
 <87h89o9cng.fsf@oldenburg2.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87h89o9cng.fsf@oldenburg2.str.redhat.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, shuah@kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, miklos@szeredi.hu,
 x86@kernel.org, torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, tkjos@android.com, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, ldv@altlinux.org, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, oleg@redhat.com,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 03:10:11PM +0200, Florian Weimer wrote:
> * Christian Brauner:
> 
> >> Solaris has an fdwalk function:
> >> 
> >>   <https://docs.oracle.com/cd/E88353_01/html/E37843/closefrom-3c.html>
> >> 
> >> So a different way to implement this would expose a nextfd system call
> >
> > Meh. If nextfd() then I would like it to be able to:
> > - get the nextfd(fd) >= fd
> > - get highest open fd e.g. nextfd(-1)
> 
> The highest open descriptor isn't istering for fdwalk because nextfd
> would just fail.
> 
> > But then I wonder if nextfd() needs to be a syscall and isn't just
> > either:
> > fcntl(fd, F_GET_NEXT)?
> > or
> > prctl(PR_GET_NEXT)?
> 
> I think the fcntl route is a bit iffy because you might need it to get
> the *first* valid descriptor.

Oh, how would that be difficult? Maybe I'm missing context.
Couldn't you just do

fcntl(0, F_GET_NEXT)

> 
> >> to userspace, so that we can use that to implement both fdwalk and
> >> closefrom.  But maybe fdwalk is just too obscure, given the existence of
> >> /proc.
> >
> > Yeah we probably don't need fdwalk.
> 
> Agreed.  Just wanted to bring it up for completeness.  I certainly don't
> want to derail the implementation of close_range.

No, that's perfectly fine. I mean, you clearly need this and are one of
the major stakeholders. For example, Rust (probably also Python) will
call down into libc and not use the syscall directly. They kinda do this
with getfdtable<sm> rn already.
So what you say makes sense for libc has some relevance for the other
tools as well.

Christian
