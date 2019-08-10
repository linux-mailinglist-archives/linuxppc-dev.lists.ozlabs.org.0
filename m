Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9390788C71
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 19:22:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465TTB6wwhzDqvl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Aug 2019 03:22:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="HDMdkQiK"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465TRR60RVzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Aug 2019 03:21:23 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id z17so6438146ljz.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 10:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VW8idH99KA3pRF/4NW+1lhavjZazU3KwsFXq96WTi+4=;
 b=HDMdkQiKKd2sdXTYF0z3XbUmQCw+4+wsjbbal6Z9A6xiGaDfIQd3bDBhzoPUeJV6h2
 mB7DjLWktp8oNjn4jgp661sDPED3TTL+L4fDrqK+wA9scti8LJhXTmAHVEKLW5ArbTzV
 z4NHzTn525eeLifuS3lDIysMSxLCOvitxRtuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VW8idH99KA3pRF/4NW+1lhavjZazU3KwsFXq96WTi+4=;
 b=cw3PETrQjNwVrMlONtM5ZPEiRiRQ4UP1mRhOE/1rRSbo5vz0tnCw3p2Z5+hPZ1PG/F
 wZO2eAXjcXZ6MaI9Gdo/mg+/Uk4SzeP3/HHVFLM7xutKJ8HtS9Vgzz1P5BLj5YiEGutR
 UJq/VcZJp06dnuEjdbA/WpG/Tv72qpITMu59YmSSl0xJ1paYvQ/d6nxJJpP9hqeQDr5q
 Byu/Vy2xXaUihpsmIOdKCjMRpyLXAFxgI4GYFtlWgvLwxBcbK/mfTCGPDewZU2ghR7Cq
 08MUs4AtoKj+Bud96REU8FNRV3Pk/ymB4JN9PpwSqIG2asZsJvuZ/YlTelQ9xnCtwZht
 An8w==
X-Gm-Message-State: APjAAAXp0hzIe1Q3n8jP8MOpzhEwP91hqNy7iTOXfKXBK9YIIoYqCC3o
 V1BYAg3+0CDDtc2ZIUnv6+eNnQWxHgI=
X-Google-Smtp-Source: APXvYqz3F6OHcKA8z/2r7ZhulX+eN5YF6ybxCOy9jVHb5CI+bxHvAAR/K/26KU6ryyy8Ry8IlQm3Ow==
X-Received: by 2002:a2e:4794:: with SMTP id
 u142mr14967415lja.222.1565457678525; 
 Sat, 10 Aug 2019 10:21:18 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id n124sm18145668lfd.46.2019.08.10.10.21.17
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Sat, 10 Aug 2019 10:21:17 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id z28so40662023ljn.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 10:21:17 -0700 (PDT)
X-Received: by 2002:a2e:9ec9:: with SMTP id h9mr14032162ljk.90.1565457677266; 
 Sat, 10 Aug 2019 10:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <87imr5s522.fsf@concordia.ellerman.id.au>
In-Reply-To: <87imr5s522.fsf@concordia.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 10 Aug 2019 10:21:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=whnEp5+EM53MaT-3ep1xjhrUqCdcfBfTF9YxByGsmDMRw@mail.gmail.com>
Message-ID: <CAHk-=whnEp5+EM53MaT-3ep1xjhrUqCdcfBfTF9YxByGsmDMRw@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.3-4 tag
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 10, 2019 at 3:11 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Just one fix, a revert of a commit that was meant to be a minor improvement to
> some inline asm, but ended up having no real benefit with GCC and broke booting
> 32-bit machines when using Clang.

Pulled, but whenever there are possible subtle compiler issues I get
nervous, and wonder if the problem was reported to the clang guys?

In particular, if the kernel change was technically correct, maybe
somebody else comes along in a few years and tries the same, and then
it's another odd "why doesn't this work for person X when it works
just fine for me"..

                 Linus
