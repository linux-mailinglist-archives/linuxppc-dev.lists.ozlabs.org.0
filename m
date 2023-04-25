Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A916EE553
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 18:11:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5Rnr4YhZz3fBH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 02:11:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=linuxtx.org header.i=@linuxtx.org header.a=rsa-sha256 header.s=google header.b=BTMOhNKn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxtx.org (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=jmforbes@linuxtx.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=linuxtx.org header.i=@linuxtx.org header.a=rsa-sha256 header.s=google header.b=BTMOhNKn;
	dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5Rmz0bW1z3cLT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 02:10:40 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4efefbd2c5eso3191222e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 09:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1682439032; x=1685031032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzBCWhkUry18zVOWXW5QyNYiFJMq+EJv8KjCsvLzxVI=;
        b=BTMOhNKncKkgEuXrkg4iVOUvlKOamBULDwD87gwAUY4uTD9Uj8fOtJ8gnRCGGD3Y1Y
         EtcCG/CbuQPtv6M80WfxId3IXWcwWs9h5Lw0T8BF7gXn5EhdGbVOPoy+A21e0y6npPOT
         fckBUd7/6mSyrUkCfa67U2Xyq6C+WOQMzpITU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682439032; x=1685031032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzBCWhkUry18zVOWXW5QyNYiFJMq+EJv8KjCsvLzxVI=;
        b=D4VVVJhZmfhbHhkylC2PsbMhP6kh9sQzhIDthKnY9QDLTmC7e9W++wTQ8IQs8IovtP
         D6GBsx0F/aOiufvxnsd2Zj9fs7MP/xMlN2qYLF4VJH0ytViqdAsb2UwJyxC1NyEEr+zo
         72wFWvUOm4hBfGUdWc8dJCM5I10hkmuawoukI/HGrOipOI68RfZUV/IwN3ZXjsjOh/9Y
         FERZVYSvNOqd6ktpNHPiE733e3UJoITP3t9G0U0K8kRqQpCltMAXzsGn2rgelNQpJMF8
         ITSrG/J9i7PLH44ic1GmzWHO3VmYqU0KK/B8ZZhg2L4GfEq1HrDqbOrYdgHjGE7n9Z0j
         0v3Q==
X-Gm-Message-State: AAQBX9dsLv80hDt9CZO9tqhwvDzdy4HI4RVnG/IpABxb4yojOM0TWGxX
	twSo24g3JKwwNigHs8dSdtKRJVcVkfb7W5R5qaGTJbDp
X-Google-Smtp-Source: AKy350Yu2bRANlkKpWcXG4YfVSwdV3xdWx+joDk3cEjBD6XxuBH56HrU7DgUK8DELJfAdYxwq/Ypug==
X-Received: by 2002:ac2:44d4:0:b0:4e1:8309:1db5 with SMTP id d20-20020ac244d4000000b004e183091db5mr4160057lfm.2.1682439031678;
        Tue, 25 Apr 2023 09:10:31 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id c2-20020ac25302000000b004e8508899basm2133650lfh.86.2023.04.25.09.10.31
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 09:10:31 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2a8bca69e8bso56870501fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 09:10:31 -0700 (PDT)
X-Received: by 2002:a05:6512:145:b0:4d7:44c9:9f4c with SMTP id
 m5-20020a056512014500b004d744c99f4cmr4233943lfo.4.1682439010843; Tue, 25 Apr
 2023 09:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230325060828.2662773-1-rppt@kernel.org> <20230325060828.2662773-3-rppt@kernel.org>
 <CAFxkdAr5C7ggZ+WdvDbsfmwuXujT_z_x3qcUnhnCn-WrAurvgA@mail.gmail.com>
 <ZCvQGJzdED+An8an@kernel.org> <CAFbkSA38eTA_iJ3ttBvQ8G4Rjj8qB12GxY7Z=qmZ8wm+0tZieA@mail.gmail.com>
 <ZDbp7LAHES3YFo30@arm.com> <20230418150557.ea8c87c96ec64c899c88ab08@linux-foundation.org>
In-Reply-To: <20230418150557.ea8c87c96ec64c899c88ab08@linux-foundation.org>
From: Justin Forbes <jforbes@fedoraproject.org>
Date: Tue, 25 Apr 2023 11:09:58 -0500
X-Gmail-Original-Message-ID: <CAFbkSA2hU+2V0i5OG0BBD-s3yNOAZwBmyGmxMLkbzoWZK6cxOQ@mail.gmail.com>
Message-ID: <CAFbkSA2hU+2V0i5OG0BBD-s3yNOAZwBmyGmxMLkbzoWZK6cxOQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] arm64: drop ranges in definition of ARCH_FORCE_MAX_ORDER
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Mike Rapoport <rppt@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 18, 2023 at 5:22=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 12 Apr 2023 18:27:08 +0100 Catalin Marinas <catalin.marinas@arm.c=
om> wrote:
>
> > > It sounds nice in theory. In practice. EXPERT hides too much. When yo=
u
> > > flip expert, you expose over a 175ish new config options which are
> > > hidden behind EXPERT.  You don't have to know what you are doing just
> > > with the MAX_ORDER, but a whole bunch more as well.  If everyone were
> > > already running 10, this might be less of a problem. At least Fedora
> > > and RHEL are running 13 for 4K pages on aarch64. This was not some
> > > accidental choice, we had to carry a patch to even allow it for a
> > > while.  If this does go in as is, we will likely just carry a patch t=
o
> > > remove the "if EXPERT", but that is a bit of a disservice to users wh=
o
> > > might be trying to debug something else upstream, bisecting upstream
> > > kernels or testing a patch.  In those cases, people tend to use
> > > pristine upstream sources without distro patches to verify, and they
> > > tend to use their existing configs. With this change, their MAX_ORDER
> > > will drop to 10 from 13 silently.   That can look like a different
> > > issue enough to ruin a bisect or have them give bad feedback on a
> > > patch because it introduces a "regression" which is not a regression
> > > at all, but a config change they couldn't see.
> >
> > If we remove EXPERT (as prior to this patch), I'd rather keep the range=
s
> > and avoid having to explain to people why some random MAX_ORDER doesn't
> > build (keeping the range would also make sense for randconfig, not sure
> > we got to any conclusion there).
>
> Well this doesn't seem to have got anywhere.  I think I'll send the
> patchset into Linus for the next merge window as-is.  Please let's take
> a look at this Kconfig presentation issue during the following -rc
> cycle.

Well, I am very sorry to see this going in as is.  It will silently
change people building with oldconfig, and anyone not paying attention
will not notice until an issue is hit where "it worked before, and my
config hasn't changed".  If EXPERT is unset, there is no notification,
just a changed behavior.  While it would be easy for me to carry a
patch dropping the if EXPERT, it will not help any users building on
upstream with our configs, whether for their own regular use, or while
trying to debug other issues,  I expect it will result in a reasonable
amount of frustration from users trying to do the right thing and
bisect or test patches upstream.

Justin
