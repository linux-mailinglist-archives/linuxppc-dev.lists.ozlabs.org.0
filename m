Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DD625E143
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 20:00:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bjlnw6nh9zDqq5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 04:00:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=adobriyan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fgQCIgRW; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bjlls6nmGzDqNk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 03:58:29 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id c10so6956796edk.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Sep 2020 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xWrD3MuyolikZBdkT5ghr88RwiH+oj1SGO1EEE8/fK8=;
 b=fgQCIgRWO9koqQpJSZq0UUVMNjWdYYuTIm3HfndnOr8ei7WofSr0zy+yG8x0XPPYry
 syRVhzehT0ZIjLtJNng03oQjHxaMO3BEcdNUzsIkeTxfqetWTO2vTELR3ZpcuRrRZ5/L
 N1ZVac6a1zcGtBy3wgfNZYi9YASM4WHZtCE19VizJ1ypdJt7bMP1VGdbHtj/8jZHkrE/
 aMvFV3CsEjbwtu9wLUvO6dR+NlU9QQRfxsV5TjzRLcrBr4zIp6ijB35Q9TVuFQsjDP9E
 C9RKR7D19nIk6CCoFvQeImizIc1LJbdyP/98edlFpfyTem8uTC/SzpqJKf/5pt2FEhOI
 qBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xWrD3MuyolikZBdkT5ghr88RwiH+oj1SGO1EEE8/fK8=;
 b=Z4Hz6SCpuHfii3LgKfvZE+oE3JT19ODZ6HN5a8DQgZRctKo4DuEnIwJweWTcSwtYYG
 arwU/fzW1klUGaDDkcreKw0vJ8hai1P3+dSZyvH241Rg6iEzBhRPVBqZDveHJ8aVKrpt
 +44Y83U04ANyE/nPrAFL2cfl4Pxi7B7NSZ0Iuc3tJspPjuqEYg/lArkpcuaw1Gtcie6v
 bEvl4gX6sRzN7iGLLJNmK9RirR9ahk/Ub6jbR6B/b0oIiSMh6BY0d8YHxOTQIBBPN9iM
 pQTUn3ck/QfJWUX35miTEgW2MMBMTHuhPfKI6eBmcbjGkwdDVF2RuR0vwBTRZDdd7dnK
 ANGA==
X-Gm-Message-State: AOAM53292fSFoFqdq8zIh3wE5J1GraHzjVTAlzm/ySFdG8JRLyFJFMUV
 AhFAFYbjMlLBoItJLaw65A==
X-Google-Smtp-Source: ABdhPJwmF6eKN6yrdWqMeDA6ZaWPrS1RLQwm+PEUIDVhPMvcR0xkr1YXtb5BAvLBd7cgo66vO8NUpA==
X-Received: by 2002:aa7:d043:: with SMTP id n3mr9504016edo.243.1599242306081; 
 Fri, 04 Sep 2020 10:58:26 -0700 (PDT)
Received: from localhost.localdomain ([46.53.251.136])
 by smtp.gmail.com with ESMTPSA id lo25sm6546522ejb.53.2020.09.04.10.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 10:58:25 -0700 (PDT)
Date: Fri, 4 Sep 2020 20:58:23 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Ingo Molnar <mingo@kernel.org>
Subject: Re: remove the last set_fs() in common code, and remove it for x86
 and powerpc v3
Message-ID: <20200904175823.GA500051@localhost.localdomain>
References: <20200903142242.925828-1-hch@lst.de>
 <20200904060024.GA2779810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200904060024.GA2779810@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 04, 2020 at 08:00:24AM +0200, Ingo Molnar wrote:
> * Christoph Hellwig <hch@lst.de> wrote:
> > this series removes the last set_fs() used to force a kernel address
> > space for the uaccess code in the kernel read/write/splice code, and then
> > stops implementing the address space overrides entirely for x86 and
> > powerpc.
> 
> Cool! For the x86 bits:
> 
>   Acked-by: Ingo Molnar <mingo@kernel.org>

set_fs() is older than some kernel hackers!

	$ cd linux-0.11/
	$ find . -type f -name '*.h' | xargs grep -e set_fs -w -n -A3
	./include/asm/segment.h:61:extern inline void set_fs(unsigned long val)
	./include/asm/segment.h-62-{
	./include/asm/segment.h-63-     __asm__("mov %0,%%fs"::"a" ((unsigned short) val));
	./include/asm/segment.h-64-}
