Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CA025F2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 10:13:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45854N3jXczDqNx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2019 18:13:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::142; helo=mail-lf1-x142.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="FQpPrYca"; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4585306Dp2zDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 18:12:26 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id y10so979233lfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 01:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NinRxNHyDYbCj8IbjH00ChDPuWJUmzxEB5UBBCZfvuk=;
 b=FQpPrYcaQxCAFGTYiUsPu0qLO+TyOcW7gshxdKkzEdBEoeF7zfGLnQVrcgcr4gKCeX
 LJ4YXrL36Z8UOIkkUcBOLv8jo3+1wy2Zrr1Gv+mEl7u90rBwnDVcVlXzHgwabis+F7I/
 dlJlteIhWCGDFh11b+aiyTTGML6DsZQmYr7FjOpjo+237NiSY/93FSEYu5SmcuC+kMHi
 w+QbDlfq/QnsLdgPfA6Jf+xdMdism6B4eELfwRuNPZvO4gmtKOqxk/k31Xt7g6ek0i6A
 6O4E/le0sudnktBxl+9AFEIeQt8N5n9ZAVs90K2h9eXQLV3Rz/8qfSLtahw9cvbBcJ3h
 1JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NinRxNHyDYbCj8IbjH00ChDPuWJUmzxEB5UBBCZfvuk=;
 b=PDDLtm4FMtzy3IpykMG2uM+R7mOVAyYPkIbsQu6KIKUC5v1/BHEcVJPOkbFkebZA7p
 KI24EuNk6FhCPwVwr5yLykGPtt2RD8gNhImobjyViUAc9S1eRxY8tzMBeT7+b+wNKo0+
 pNDhDIJWtSn2qWzV34l1BWQpSUNr1KCf+n+fX0r/0HcOBLP/r2pG1hVoq1SfK4glDQKE
 YVsIp8KEQEnJR4jdhlxlGdEtRCT49WnxHzlz9B0On48T4+lpRbwNXxgHSCN3EExV93il
 jeoF20t4ujAWgHlYAchvUM8zh9QDhDXzj34YN3ZBkrtVMVRswtNVOC0k9NrraGdB0Ga3
 2xrw==
X-Gm-Message-State: APjAAAUSXz+4qrChY+H6hiRQjBYPBClQCTU9i1jJxZo+VbLDoSL7krpR
 m9Pkkye/7rcVTcXBFqnxsEpFdr5b4MD0um08t999yA==
X-Google-Smtp-Source: APXvYqx7pLLI28SrC6KCXMaRxdNQfwff8OtpKLPW6FHDJY0UodmrushWU4y7kAd+10dOgbbxHnK3LHfXY1UCm8GAhHE=
X-Received: by 2002:a05:6512:1c1:: with SMTP id
 f1mr4469627lfp.125.1558512742198; 
 Wed, 22 May 2019 01:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190521150006.GJ17978@ZenIV.linux.org.uk>
 <20190521113448.20654-1-christian@brauner.io>
 <28114.1558456227@warthog.procyon.org.uk>
 <20190521164141.rbehqnghiej3gfua@brauner.io>
 <CAHk-=wgtHm4t71oKbykE=awiVv2H2wCy8yH0L_FsyhHQ5OSO+Q@mail.gmail.com>
In-Reply-To: <CAHk-=wgtHm4t71oKbykE=awiVv2H2wCy8yH0L_FsyhHQ5OSO+Q@mail.gmail.com>
From: Christian Brauner <christian@brauner.io>
Date: Wed, 22 May 2019 10:12:11 +0200
Message-ID: <CAHrFyr4NV_5Z7TRSXTaurd4KCTLiHqKb47dN=bdY46HiL9ZY3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] open: add close_range()
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, David Howells <dhowells@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 the arch/x86 maintainers <x86@kernel.org>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Todd Kjos <tkjos@android.com>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 "Dmitry V. Levin" <ldv@altlinux.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Florian Weimer <fweimer@redhat.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux API <linux-api@vger.kernel.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2019 at 10:23 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, May 21, 2019 at 9:41 AM Christian Brauner <christian@brauner.io> wrote:
> >
> > Yeah, you mentioned this before. I do like being able to specify an
> > upper bound to have the ability to place fds strategically after said
> > upper bound.
>
> I suspect that's the case.
>
> And if somebody really wants to just close everything and uses a large
> upper bound, we can - if we really want to - just compare the upper
> bound to the file table size, and do an optimized case for that. We do
> that upper bound comparison anyway to limit the size of the walk, so
> *if* it's a big deal, that case could then do the whole "shrink
> fdtable" case too.

Makes sense.

>
> But I don't believe it's worth optimizing for unless somebody really
> has a load where that is shown to be a big deal.   Just do the silly
> and simple loop, and add a cond_resched() in the loop, like
> close_files() does for the "we have a _lot_ of files open" case.

Ok. I will resend a v1 later with the cond_resched() logic you and Al
suggested added.

Thanks!
Christian
