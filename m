Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0B988EB2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Aug 2019 00:44:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465cbg5vyxzDrB0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Aug 2019 08:43:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YvWQEndw"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465cYf4MCmzDr6B
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Aug 2019 08:42:13 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id p74so8993236wme.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 15:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cm1cTZewDuKp3Wajgal/0P1FJ6bCpkxWTfUFt1xUXhs=;
 b=YvWQEndwda7eSVIrlsE7vqo9ByIKxm6UYmqRi8I6RnykBCbr3BX/erhjlLVL437ysc
 bZI+xCNBolX0mpmlerAo9hfUJd+CGXWpiQNyotqg+vdtSKEQNw4ZdeO/MQhoSnQu34dX
 Xtqyt5o1Q5oTLzAAWI5dTWtabBnlYzvp9XqIkhM0oFQSxW/ZdHn0JDgV/1gfzHnsIpJk
 x6sUxbseWS8WCy0t3/hSWmo0rNOZ4Dqzi6OcKr18WqAmn6DkoJVFNOoLA3HpofzpsDqM
 I9Ycm9fULS+O47gp4IoaHHb/cNLDEu1axhHss08puN8s+vqEjebs6bN0i/41r+Gc6Ten
 lmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cm1cTZewDuKp3Wajgal/0P1FJ6bCpkxWTfUFt1xUXhs=;
 b=ZCUamVFUVzV9bykRWiVjVyjFsekoT4AgrznO3xDHURvVF6W7mvRbGErs3gbUdkvo2l
 XMpPX51nfrRmVkQ7D4d3bLRb91QzXzpPkLL7uiWs4nRuTJobI8buyCt/DKnTEmls+GLp
 le/4asxXNfli+LNagS9+22PpzGIaA+Dg0L5D7ofVFAEeyMQ7wAVaQR+Tey4NqNtu9JMI
 ZjTu3jNaRw31P6QWkqjdU/+kmaJTTBU3zOE9x4DmyDI3ToD8CE17g1pCcYorjCq7/taM
 wA0p+9CcVmaTwWdgTGg8EBhulPaC5ZMmvuM5OR3taRN8hfjBJXtBwcllymH9wWgEONie
 teNQ==
X-Gm-Message-State: APjAAAXqFQ41knLzKTSj8AmIfLHMzhB/Q1jxqHGH4tq+RYZwfa3dDkRg
 55B2hxqCAEMTZKKnw+H2bF8=
X-Google-Smtp-Source: APXvYqx7voVYy8obPH7IH9gpjf7uSzdRqQGq8zrNbfLP6L4bgveW5KnK1WH7isM1C8v5r5fgx+uBOA==
X-Received: by 2002:a1c:f511:: with SMTP id t17mr18874737wmh.53.1565476928602; 
 Sat, 10 Aug 2019 15:42:08 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id k13sm18578918wro.97.2019.08.10.15.42.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 10 Aug 2019 15:42:07 -0700 (PDT)
Date: Sat, 10 Aug 2019 15:42:06 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.3-4 tag
Message-ID: <20190810224206.GA56490@archlinux-threadripper>
References: <87imr5s522.fsf@concordia.ellerman.id.au>
 <CAHk-=whnEp5+EM53MaT-3ep1xjhrUqCdcfBfTF9YxByGsmDMRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whnEp5+EM53MaT-3ep1xjhrUqCdcfBfTF9YxByGsmDMRw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 clang-built-linux@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 10, 2019 at 10:21:01AM -0700, Linus Torvalds wrote:
> On Sat, Aug 10, 2019 at 3:11 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Just one fix, a revert of a commit that was meant to be a minor improvement to
> > some inline asm, but ended up having no real benefit with GCC and broke booting
> > 32-bit machines when using Clang.
> 
> Pulled, but whenever there are possible subtle compiler issues I get
> nervous, and wonder if the problem was reported to the clang guys?
> 
> In particular, if the kernel change was technically correct, maybe
> somebody else comes along in a few years and tries the same, and then
> it's another odd "why doesn't this work for person X when it works
> just fine for me"..
> 
>                  Linus

It was.

https://github.com/ClangBuiltLinux/linux/issues/593

https://bugs.llvm.org/show_bug.cgi?id=42762

We're still waiting for input from the PowerPC backend maintainers as
that is most likely where this issue originates from.

Cheers,
Nathan
