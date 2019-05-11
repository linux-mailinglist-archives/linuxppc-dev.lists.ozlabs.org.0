Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D07BB1A5F0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2019 02:52:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4517pl5Bh1zDqVD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2019 10:52:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.194; helo=mail-qt1-f194.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4517nN0Kx7zDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2019 10:51:33 +1000 (AEST)
Received: by mail-qt1-f194.google.com with SMTP id k24so3762232qtq.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 17:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2yJyMuj40ehLn1VJjGCyDbn5ZrzNMv6yLbIutJnLbw0=;
 b=g922VQFKoSYFUJs1f1oanj6DH5OflKckAli9TDaW6JgzMhir5i8ffQBPfIHWxiTGf3
 6sntvW1z7blYX11Znzyf3yYfwlKHN+OuTL23NjUBFWeePbpe0yBqQVgw3l01Wv45DHGR
 fhZy+hyXo4j56Xb5bHzI7V3a2ZDgROKrU2I75Unsasec4QumP3RIO53s1UWHgdhmLRcH
 0DfIT33c5PyTLu+sjfAUl3JWhqfpBFxKZv158/wjMs3xfhWpEkZlx1VQqE3RadHNWnfz
 v4PRqKQECmCWvlGSDaSmKSeYmPVjWqnW1PQSmUI1L+9IRuuQA248l1YKHWm/yZ7vzvVv
 mkhQ==
X-Gm-Message-State: APjAAAXdohUy123Wwiv3YG69CbX8/4Im3WS0Ri7BwkqMc5cXK8nUc2x0
 wSM+sPjtZy/J1I7zJgXTotQVioWlkweDXnrJtnI=
X-Google-Smtp-Source: APXvYqxFKEloXfs+RHuMKqqDTkbQ2DMYSkXhWhHARTrTqb4xCGfWCNfnszBb+Rc+y0gwljMkH4orfi2JM8qYr2q0Dhk=
X-Received: by 2002:a0c:87f4:: with SMTP id 49mr11681367qvk.149.1557535885304; 
 Fri, 10 May 2019 17:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190412143538.11780-1-hch@lst.de>
 <CAK8P3a2bg9YkbNpAb9uZkXLFZ3juCmmbF7cRw+Dm9ZiLFno2OQ@mail.gmail.com>
 <fd59e6e22594f740eaf86abad76ee04d@mailhost.ics.forth.gr>
 <CACT4Y+aKGKm9Wbc1owBr51adkbesHP_Z81pBAoZ5HmJ+uZdsaw@mail.gmail.com>
In-Reply-To: <CACT4Y+aKGKm9Wbc1owBr51adkbesHP_Z81pBAoZ5HmJ+uZdsaw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 10 May 2019 20:51:12 -0400
Message-ID: <CAK8P3a3xRBZrgv16sSigJhY0vGmb=qF9o=6dC_5DqAJtW3qPGQ@mail.gmail.com>
Subject: Re: [PATCH, RFC] byteorder: sanity check toolchain vs kernel endianess
To: Dmitry Vyukov <dvyukov@google.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 10, 2019 at 6:53 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > I think it's good to have a sanity check in-place for consistency.
>
>
> Hi,
>
> This broke our cross-builds from x86. I am using:
>
> $ powerpc64le-linux-gnu-gcc --version
> powerpc64le-linux-gnu-gcc (Debian 7.2.0-7) 7.2.0
>
> and it says that it's little-endian somehow:
>
> $ powerpc64le-linux-gnu-gcc -dM -E - < /dev/null | grep BYTE_ORDER
> #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
>
> Is it broke compiler? Or I always hold it wrong? Is there some
> additional flag I need to add?

It looks like a bug in the kernel Makefiles to me. powerpc32 is always
big-endian,
powerpc64 used to be big-endian but is now usually little-endian. There are
often three separate toolchains that default to the respective user
space targets
(ppc32be, ppc64be, ppc64le), but generally you should be able to build
any of the
three kernel configurations with any of those compilers, and have the Makefile
pass the correct -m32/-m64/-mbig-endian/-mlittle-endian command line options
depending on the kernel configuration. It seems that this is not happening
here. I have not checked why, but if this is the problem, it should be
easy enough
to figure out.

       Arnd
