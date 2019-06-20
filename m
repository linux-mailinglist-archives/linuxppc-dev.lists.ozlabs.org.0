Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5F34D524
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 19:26:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45V7yf70x3zDq9J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 03:26:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="g1mjJHSB"; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45V7sz47sfzDrGC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 03:22:14 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id 16so3424709ljv.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 10:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8s7nWa83ZrllVywYBO3+qENQEvSqioKh5iSEDp3yvQc=;
 b=g1mjJHSB+/44ZB7V3d991RQ8lmWdxyz7cRKmwtk9byrjcNUD9YP2uS+RZIIrKE7lKn
 tVpZNvyJkolb6AtIXbb56yLA6c56wf2OFIIZEIPMa1TRDMJb6FE75meYgwCBSBqSYdRC
 O8jEDgU+LfyGIAqseIIvIOnHddyiMVgjB9lIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8s7nWa83ZrllVywYBO3+qENQEvSqioKh5iSEDp3yvQc=;
 b=jgQtghpBjVJkljHux7wSmcGqi+I0VQqBiiQDdrq6MtzETXCcPVLpsu8yAwtbplzJFT
 r6nvssu8rCv9cV4P+d+O9ul64ArXBmi4rGd33KVfxQWcRo2Ajj+oU7nCht1N1E5we9U9
 yE3xsGbxvMTQV/5UC5jvSdiz/2rkP0/K6qR4jqkt3phoRb/4gr7Ujb2DqrzjFW+qM2Xw
 OGU5CE5/Lt7NSaFt5flD7elkBfMFVaJgIYNyQetRahMy3YHs9C6okVkay7X0cKpeLJJX
 HoNJ5fXKLAdbXGPgqeBSVAjYsEw6fbfCHvOUaOxSwUGAnfcdw2K7Oe35BWsi7m28A5ph
 KnCw==
X-Gm-Message-State: APjAAAUkewRpeJzfuvpd9X5RwdZ48uMwV2YtybRXdhYzNJ6j3H/9M448
 Do+EVR0QX5pLRuEWY3w68luLhw4Fdaw=
X-Google-Smtp-Source: APXvYqxdPaj7qAQsn4WCaHJCrYUC9Ao+nNKOSNZfpnoJ6hewdc5vxtZWR1P2mu2xduE8/+u0daVXmQ==
X-Received: by 2002:a2e:9b81:: with SMTP id z1mr7075221lji.101.1561051326112; 
 Thu, 20 Jun 2019 10:22:06 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id j11sm42339lfm.29.2019.06.20.10.22.02
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 10:22:02 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id p24so3005806lfo.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 10:22:02 -0700 (PDT)
X-Received: by 2002:ac2:5601:: with SMTP id v1mr51955604lfd.106.1561051322002; 
 Thu, 20 Jun 2019 10:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-17-hch@lst.de>
 <1560300464.nijubslu3h.astroid@bobo.none>
 <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
 <1561032202.0qfct43s2c.astroid@bobo.none>
In-Reply-To: <1561032202.0qfct43s2c.astroid@bobo.none>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Jun 2019 10:21:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
Message-ID: <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>, James Hogan <jhogan@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Linux-MM <linux-mm@kvack.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Paul Burton <paul.burton@mips.com>,
 Andrey Konovalov <andreyknvl@google.com>, sparclinux@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2019 at 5:19 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> The processor aliasing problem happens because the struct will
> be initialised with stores using one base register (e.g., stack
> register), and then same memory is loaded using a different
> register (e.g., parameter register).

Hmm. Honestly, I've never seen anything like that in any kernel profiles.

Compared to the problems I _do_ see (which is usually the obvious
cache misses, and locking), it must either be in the noise or it's
some problem specific to whatever CPU you are doing performance work
on?

I've occasionally seen pipeline hiccups in profiles, but it's usually
been either some serious glass jaw of the core, or it's been something
really stupid we did (or occasionally that the compiler did: one in
particular I remember was how there was a time when gcc would narrow
stores when it could, so if you set a bit in a word, it would do it
with a byte store, and then when you read the whole word afterwards
you'd get a major pipeline stall and it happened to show up in some
really hot paths).

            Linus
