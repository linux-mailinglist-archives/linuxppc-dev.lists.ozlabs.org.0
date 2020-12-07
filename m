Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D2A2D17FC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 18:59:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqWJy4FkVzDqV9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 04:58:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=PEi9J2G8; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqWGx5DXxzDqSv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 04:57:10 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id b26so10798734pfi.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 09:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6WCQ7BCapmnoxG4CL9KlsKYtd+1t9zJO5a9BfDU6+LI=;
 b=PEi9J2G8bLS68SSeuyxqgztnAe6n1LPUcOYZX9CPCstKQqJrOUJ+w915mw9v9JgDOB
 L1yxZSSyCUswAAIBXhDy/uxNiuEJN012DQmaXdi0CwfCSMFF72ba/aIj2SCDanIeamQg
 IonGJYo87Qyfq+qq4jnJal/CGPaXQpbUpZthgp1IwT8gNumZoc85Oe08Vxi5DP9rr57I
 x+IoQwl/n5FW3MJNfgeQ6du98w5zHbGs4cDrhtwIHEenfDQ135SnqufXjzxexpH/y1SN
 huRh0HJpI0FqXH+7vZPCvI1tx7DFgKPTRoAtnOKksO/jYFhjvsjqO7M/n9U/MMS1tk8m
 goDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6WCQ7BCapmnoxG4CL9KlsKYtd+1t9zJO5a9BfDU6+LI=;
 b=XOWu1wuqtDwyEG8WEJkylwh7V4LxMjKB8aj8JDoGMFrugz/kqFy97Jb/q/vFuKytV8
 IOvktA/2WRGlo3lAYMPvypWRTP3LyuGTIFyEnwcObShjH5cBxwmshfzUep0CtYQTGTnC
 bS9AdoYj8ziq2UvaizbF+8e+kJiTk3ypxDxM+iycg890Q5xcXACrqQnetKbh27VOB3WK
 8ThWuxFPwhTAV1qtvDENNcJkSvwuOm1R90fUMzmGuCoQzLe/U0kt9jNMusKwqPuL9Mjm
 3FssbyVrx6zqx4aO4726qhb7gG9Axlu5X4plQXy/kkfoMw8DQEXAMwlqy6EVf+9E5sPM
 gW9w==
X-Gm-Message-State: AOAM53064QEmggu9eNAmqQsU0cLsGIhRaFs8Jhd6VPbBmbV8zXQ+tIIj
 79xL5BjBjOQffMJbZ0Ve2H9J+VwA0uSd5ysnG7dwvQ==
X-Google-Smtp-Source: ABdhPJzyk9Y0TZE129ffna2PVQIS5mJNJVfpwsygUnc0YzkSx9+NOuXLliVfZpM8WlHY/CO19/SxvabhEnixXqdPt7c=
X-Received: by 2002:a63:3247:: with SMTP id y68mr19460484pgy.10.1607363827065; 
 Mon, 07 Dec 2020 09:57:07 -0800 (PST)
MIME-Version: 1.0
References: <202012042220.zO7hSFT2-lkp@intel.com>
 <87czzlu7n4.fsf@mpe.ellerman.id.au>
In-Reply-To: <87czzlu7n4.fsf@mpe.ellerman.id.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Dec 2020 09:56:56 -0800
Message-ID: <CAKwvOd=4vu_o3Sr14JwDO6s+tqZWp-DQKWs9So8g2_-zTt+8KA@mail.gmail.com>
Subject: Re: [powerpc:next-test 54/220]
 arch/powerpc/kernel/vdso32/vgettimeofday.c:13:5:
 warning: no previous prototype for function '__c_kernel_clock_gettime64'
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 7, 2020 at 4:23 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> So is clang defining __powerpc64__ even for 32-bit code?
>
> And the answer appears to be yes:
>
>   $ clang --version
>   Ubuntu clang version 11.0.0-2
>   Target: powerpc64le-unknown-linux-gnu
>
>   $ clang -m32 -dM -E - < /dev/null | grep powerpc
>   #define __powerpc64__ 1
>   #define __powerpc__ 1
>
> Compare to gcc:
>
>   $ gcc --version
>   gcc (Ubuntu 10.2.0-13ubuntu1) 10.2.0
>
>   $ gcc -m32 -dM -E - < /dev/null | grep powerpc
>   #define __powerpc__ 1
>   #define powerpc 1
>   #define __powerpc 1
>
>
> Which is fairly problematic, because we use the presence/absence of
> __powerpc64__ to determine if we're building 64-bit/32-bit code in
> several places.
>
> Not sure what the best approach for fixing that is.

Thanks for the triage; we should fix our preprocessor:
https://bugs.llvm.org/show_bug.cgi?id=48427
-- 
Thanks,
~Nick Desaulniers
