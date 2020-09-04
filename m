Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA8B25E18D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 20:44:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjmnJ4hq8zDqsK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 04:44:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=OrfWsLi5; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjmlL1sJ8zDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 04:43:08 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id s205so9143135lja.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Sep 2020 11:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zGVkw+VA7Ozv3hFmklGnXOESB94iioBKwZC/vClHWhs=;
 b=OrfWsLi5zsx7qv2p1cK4X32zmscuCKlgmthoMdeY0cg3rmZpFdM3J9SvTCb9h5NnO9
 l0B0liyZtyXuNnV2gWB/4L3fr4ZoZu9bcbKCQOsRIl87cavO0SjGkvX9fTqXGzvbc3Rk
 8ry1Oj9UgjhZbRiLcVNkm18IHcMLIsEb6rQfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zGVkw+VA7Ozv3hFmklGnXOESB94iioBKwZC/vClHWhs=;
 b=rrZMunwuyL4qQQxzSpdmy71hi6rO1sTqCfUc5h4WDouHsIL1FsQDyAH0b54POQamNu
 R/15MUS6Zzb5Z7Obl4Roy5N0HyziTkL5ycHSefv96CxRLbfu/rQH65HijtH/Zk806eRs
 RbNp7OHaXMyT4amaLb7/TFNVy7DGjsv0rO3Yl3NuGZHiR46k1sX7Bg8nHkLmOvmtyLZL
 ogf3DFg081tDoFCMFUzE+1Osgx3mB+cDsSjMCch4844uR4H1sAfZ2mk+yOcx2vGwd5Vj
 91FpkKQmBd3To4jnJ25ktaLhbWWydj0iM42fkCKQvbBgx+8lcBsyDxa/bNdHdEh0alr/
 wTyg==
X-Gm-Message-State: AOAM531LRitiwTbJqKomTFBtmiDPha+T7qg3/W0yaQpQ8lElqLySDDaQ
 Dv+fxz32y+U5b2rcShtKrU5bT/prn2joxA==
X-Google-Smtp-Source: ABdhPJxO4oidIXM0TZ+Gw/JRkrp5So8a3zKjdn0rBDe26AHGKAFEWFbiNWscFxGnhMu+fV+rswjVQg==
X-Received: by 2002:a2e:95d5:: with SMTP id y21mr4745009ljh.20.1599244979995; 
 Fri, 04 Sep 2020 11:42:59 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id y25sm1402655ljd.79.2020.09.04.11.42.58
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2020 11:42:59 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id e11so9155406ljn.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Sep 2020 11:42:58 -0700 (PDT)
X-Received: by 2002:a2e:84d6:: with SMTP id q22mr3675523ljh.70.1599244978377; 
 Fri, 04 Sep 2020 11:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200903142242.925828-1-hch@lst.de>
 <20200904060024.GA2779810@gmail.com>
 <20200904175823.GA500051@localhost.localdomain>
In-Reply-To: <20200904175823.GA500051@localhost.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 4 Sep 2020 11:42:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjUUBnp9JSK+u8gYQ-RpMZxgd3UfvpihCPA_vSN_8G8Mg@mail.gmail.com>
Message-ID: <CAHk-=wjUUBnp9JSK+u8gYQ-RpMZxgd3UfvpihCPA_vSN_8G8Mg@mail.gmail.com>
Subject: Re: remove the last set_fs() in common code, and remove it for x86
 and powerpc v3
To: Alexey Dobriyan <adobriyan@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 4, 2020 at 10:58 AM Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
> set_fs() is older than some kernel hackers!
>
>         $ cd linux-0.11/
>         $ find . -type f -name '*.h' | xargs grep -e set_fs -w -n -A3

Oh, it's older than that. It was there (as set_fs) in 0.10, and may
even predate that. But sadly, I don't have tar-balls for 0.02 and
0.03, so can't check.

The actual use of %fs as the user space segment is already there in
0.01, but there was no 'set_fs()'. That was a simpler and more direct
time, and "get_fs()" looked like this back then:

  #define _fs() ({ \
  register unsigned short __res; \
  __asm__("mov %%fs,%%ax":"=a" (__res):); \
  __res;})

and all the setting was basically part of the kernel entry asm and. Lovely.

                 Linus
