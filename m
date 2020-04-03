Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1223319DD6B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 20:03:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v78S2xkbzDrPP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 05:03:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=Ys0nLdOP; 
 dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v76Q62p3zDqg1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 05:01:34 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id j17so6535677lfe.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 11:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GJVFgRSGYKBnNbBPTVD/IukQXQa7rwPwND5Kh+NTBuo=;
 b=Ys0nLdOPaMPZHWrNpQG57PugKN6mkPGdJSUx/TQDpwY2GQmZdYkhxJaiTGDykgi3DV
 b9peyP0pK7wyoIA4rX92GpUwZxOJ1gL4WdkK8qsym8w0OHPBQz5LC8Pgsely+7R6EED/
 Y1qrLKu/XLubSi3S/jM7cWoFX4dK0Vuw/7IEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GJVFgRSGYKBnNbBPTVD/IukQXQa7rwPwND5Kh+NTBuo=;
 b=S8g1Bw93+XcusWIiVHSn486IBDcLrp2XwffcpDzcHKazUupm7fAucuXws6JpgwhkU9
 gBzXNtAc62zGmg/IDSp8LyPySPFXqFBDMc+qr4Mzy9Uad1aA9v93j+7M2DeRhGDJHcQH
 8KX46rZorA+U3JGGELh/qH7HYQi6cb+gREJK7gMwClUfgnh89GYLrAWudYnE7SbJ2IVQ
 ZhFEAUF1HvM8qevAcpgW3hAZTRHgPjS0qXm118Zpv77ycC1dt1tVKK/+CIBiS3pcTSTj
 wzv3t5sQ0qFmQszJxYqmX1670bZypiJJvO/HdPStMn7dbIZ91hsYI+wBeoF3FGS9sYrz
 jQ6A==
X-Gm-Message-State: AGi0PuaWqcu0TmDCtPMMPf+PF+VyV99Lys7JbNc2QvOaaa430W4Oz/bu
 XRoAPioJHpxPBTzIGpG1JEw61UedKo0=
X-Google-Smtp-Source: APiQypJ1pv1wW2lELWcesXxNTzTb2B8AyVfwegM5zIVpq01vncaKdCi5ZeoQIfetteymhIb4fjdB/Q==
X-Received: by 2002:a05:6512:3042:: with SMTP id
 b2mr6367901lfb.92.1585936888582; 
 Fri, 03 Apr 2020 11:01:28 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id e2sm5301437ljl.83.2020.04.03.11.01.27
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2020 11:01:27 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id p14so7851353lji.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 11:01:27 -0700 (PDT)
X-Received: by 2002:a2e:8652:: with SMTP id i18mr5777613ljj.265.1585936886747; 
 Fri, 03 Apr 2020 11:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <36e43241c7f043a24b5069e78c6a7edd11043be5.1585898438.git.christophe.leroy@c-s.fr>
 <42da416106d5c1cf92bda1e058434fe240b35f44.1585898438.git.christophe.leroy@c-s.fr>
In-Reply-To: <42da416106d5c1cf92bda1e058434fe240b35f44.1585898438.git.christophe.leroy@c-s.fr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 3 Apr 2020 11:01:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_DY_dysMX0NuvJmMFr3+QDKOZPZqWKwLkkjgZTuyQ+A@mail.gmail.com>
Message-ID: <CAHk-=wh_DY_dysMX0NuvJmMFr3+QDKOZPZqWKwLkkjgZTuyQ+A@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] uaccess: Rename user_access_begin/end() to
 user_full_access_begin/end()
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
 Dave Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Peter Anvin <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 3, 2020 at 12:21 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> Now we have user_read_access_begin() and user_write_access_begin()
> in addition to user_access_begin().

I realize Al asked for this, but I don't think it really adds anything
to the series.

The "full" makes the names longer, but not really any more legible.

So I like 1-4, but am unconvinced about 5 and would prefer that to be
dropped. Sorry for the bikeshedding.

And I like this series much better without the cookie that was
discussed, and just making the hard rule be that they can't nest.

Some architecture may obviously use a cookie internally if they have
some nesting behavior of their own, but it doesn't look like we have
any major reason to expose that as the actual interface.

The only other question is how to synchronize this? I'm ok with it
going through the ppc tree, for example, and just let others build on
that.  Maybe using a shared immutable branch with 5.6 as a base?

                   Linus
