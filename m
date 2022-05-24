Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF652533340
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 00:07:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L77bn32Hmz3c7w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 08:07:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pcnkDXAe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pcnkDXAe; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L77b405Dyz2yV6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 08:06:54 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id q8so22999523oif.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 15:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nazAJnmKC29W9OE3p4jtrAjcYB6KyAUjKMWBeLzTPEM=;
 b=pcnkDXAe5YvTRgJxeRg3matW3Bv2wtdSXK2Y9Hhj3sk6qgF61Ruuf0leQFCEirgQ7C
 TtUxSytvQlTV0hrf7SgFsfLm4pPUSiAEwfEAiDfG+gThPQcLXdGJSK6JHNeep3tRNJ7+
 YDxIKarQEOKdoCzcTVFB7JZVwvNYK5/lER5aExjEL2QXKzNws3LspaPVFgYSsz+Df5OO
 AwYS+zoL7QF5PiLOdJpQg4nnSt/V9RUgdEJ5wZMHdPTNEuVr8PebFOltKY2dkCe/XFbt
 Uhc/lImMGV4sNqpIxtqzD3SJUdxInK/NOcl8uFrZ2Zr5Q6VjdDZrqJ6pPfQznwY5JKmN
 CRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=nazAJnmKC29W9OE3p4jtrAjcYB6KyAUjKMWBeLzTPEM=;
 b=Sk+Oc+y/5ixthOJRDVnRLLz+ODUrSd/tJw6YWSF4vnKPA9ZgIzgQ1zQ8lPQow8bkoN
 OALKEKlqIq93fWH2ndvZhCkKK3wU6z7cBm2Cq1IsDCd1ljor2rrWiq89BLSLUXzsr2Ki
 A+67nsrqEfh/NeNcUZ5smoTTAkYpoEwtd64nuNb2aYIM/xCHB1qWgmJnIdiDoS86PIJ3
 nQ+2N17eCivJLdUJAUT6ffqRZqYGKsMyEoVXC7TCOWKJv1LlGFGOem/vA3lGO1/SPrdP
 CMNKm7fkFEAXOnTAreWC/ayBotNzxbJj9iy7YNo4GGZ3bqHbuZH4ETB+upN/G9zrjuNY
 9cDw==
X-Gm-Message-State: AOAM532dRg2RCpyqO1ywrr0+djFjcooVyAG0v4CYcltl+8PuStQAr7VN
 M9VRC/g7OInDwV1Sn2Mliq0=
X-Google-Smtp-Source: ABdhPJylOJvDhga94lACYzo4DYHszPBVfc6hKDFXDCn+ItVVcIHVwPQKrHsoO+UpMTYhmFLK0bMmjw==
X-Received: by 2002:aca:5a0a:0:b0:32b:a51:6cd8 with SMTP id
 o10-20020aca5a0a000000b0032b0a516cd8mr3580050oib.112.1653430008860; 
 Tue, 24 May 2022 15:06:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q7-20020aca4307000000b00325cda1ffa2sm5734695oia.33.2022.05.24.15.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 15:06:48 -0700 (PDT)
Date: Tue, 24 May 2022 15:06:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH V9 20/20] riscv: compat: Add COMPAT Kbuild skeletal support
Message-ID: <20220524220646.GA3990738@roeck-us.net>
References: <20220322144003.2357128-1-guoren@kernel.org>
 <20220322144003.2357128-21-guoren@kernel.org>
 <20220523054550.GA1511899@roeck-us.net>
 <CAJF2gTQ5RS8wGfSDPoB4JLtPBoM=ainuz_EJ9Tweq0mqPM=ALA@mail.gmail.com>
 <CAJF2gTSa=roJOiKFiL8nSQ12E-emz-xrXs=RNAc4zSFaPuRAzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJF2gTSa=roJOiKFiL8nSQ12E-emz-xrXs=RNAc4zSFaPuRAzw@mail.gmail.com>
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
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 25, 2022 at 01:46:38AM +0800, Guo Ren wrote:
[ ... ]

> > The problem is come from "__dls3's vdso decode part in musl's
> > ldso/dynlink.c". The ehdr->e_phnum & ehdr->e_phentsize are wrong.
> >
> > I think the root cause is from musl's implementation with the wrong
> > elf parser. I would fix that soon.
> Not elf parser, it's "aux vector just past environ[]". I think I could
> solve this, but anyone who could help dig in is welcome.
> 

I am not sure I understand what you are saying here. Point is that my
root file system, generated with musl a year or so ago, crashes with
your patch set applied. That is a regression, even if there is a bug
in musl.

Guenter
