Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EBB289D12
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 03:31:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7S7w4mTqzDqsj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Oct 2020 12:31:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=QUiZW7sc; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7S685MtTzDqgB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Oct 2020 12:29:33 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id d24so12553569lfa.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Oct 2020 18:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TL4cwcC3oy9yGXrCPN5M4+HoSQktOSj4hTD8XUaFtsk=;
 b=QUiZW7sc85a+dF87QrbXxq2KTodKggKcduyYT3bL6iRpsp3sgK+dJqXe00Rkr1oRmE
 0Q8iGj6Eoh8nHgmhwmUz1o2eQQJjkWTB80i7gsGyB9/jzaKGM86w97n/T1/Qg4RgrKKx
 Q30PjASdGXDKOZ6VrsgGinXqAdW3g6MlMxMzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TL4cwcC3oy9yGXrCPN5M4+HoSQktOSj4hTD8XUaFtsk=;
 b=TkglLJK1c7x6+X/9RwRlPu7ZgryC/fSeDvDfPYrvOMzCWmBJtRhK1KnuhxiUXtC3ez
 X8y9N6BvRtdlr95Uogrjr6E9QIsIcSMq7pxYYGcMpWeXwRjS11Eynby+9ShM/AUOIrkP
 NAIbgeOR1or6YF4HbmBzFJTNkpL8aVnkR7e7dU8Z9MbsXRXIV3ZgetkbYuQh/1PiwpT4
 FJV3C9w7ke3nTZRRs1fX1yv//Vn6xCt9aAgeU8WyERsihSzXBoLIdwxy+HLSp1UXxfEj
 4Qe8wOvAj4gRWmey+g29wKM7Cyua/n+vi7HG6LOMMNZUHwAf7GMMcldNwE61z9e4HtxM
 k1Ng==
X-Gm-Message-State: AOAM530MAGmwEY76isNlTIevqtjNzqP1Hhx+uJUSQM0iLW38cH8dV8EZ
 H9sFalYSsbhVdSBJ0DM1xUho0UgWv7nE+w==
X-Google-Smtp-Source: ABdhPJxIBX2HsXCvDMY9dtUk2CAcDW6DImN5/JmtwzDf2n4bS2MTGjKs934NXQRSxOHKsKAzFoI6Yw==
X-Received: by 2002:a05:6512:1093:: with SMTP id
 j19mr5285775lfg.503.1602293370544; 
 Fri, 09 Oct 2020 18:29:30 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id n2sm2032424lji.97.2020.10.09.18.29.29
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 18:29:29 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id a23so10497191ljp.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Oct 2020 18:29:29 -0700 (PDT)
X-Received: by 2002:a2e:9152:: with SMTP id q18mr5731594ljg.421.1602293368914; 
 Fri, 09 Oct 2020 18:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142242.925828-6-hch@lst.de>
 <20201001223852.GA855@sol.localdomain>
 <20201001224051.GI3421308@ZenIV.linux.org.uk>
 <CAHk-=wgj=mKeN-EfV5tKwJNeHPLG0dybq+R5ZyGuc4WeUnqcmA@mail.gmail.com>
 <20201009220633.GA1122@sol.localdomain>
 <CAHk-=whcEzYjkqdpZciHh+iAdUttvfWZYoiHiF67XuTXB1YJLw@mail.gmail.com>
 <20201010011919.GC1122@sol.localdomain>
In-Reply-To: <20201010011919.GC1122@sol.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 9 Oct 2020 18:29:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wigvcmp-jcgoNCbx45W7j3=0jA320CfpskwuoEjefM7nQ@mail.gmail.com>
Message-ID: <CAHk-=wigvcmp-jcgoNCbx45W7j3=0jA320CfpskwuoEjefM7nQ@mail.gmail.com>
Subject: Re: [PATCH 05/14] fs: don't allow kernel reads and writes without
 iter ops
To: Eric Biggers <ebiggers@kernel.org>, Alexander Viro <aviro@redhat.com>
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 9, 2020 at 6:19 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> Okay, that makes more sense.  So the patchset from Matthew
> https://lkml.kernel.org/linux-fsdevel/20201003025534.21045-1-willy@infradead.org/T/#u
> isn't what you had in mind.

No.

That first patch makes sense - it's just the "ppos can be NULL" patch.

But as mentioned, NULL isn't "shorthand for zero". It's just "pipes
don't _have_ a pos, trying to pass in some explicit position is
crazy".

So no, the other patches in that set are a bit odd, I think.

SOME of them look potentially fine - the bpfilter one seems to be
valid, for example, because it's literally about reading/writing a
pipe. And maybe the sysctl one is similarly sensible - I didn't check
the context of that one.

But no, NULL shouldn't mean "start at position zero, and we don't care
about the result".

              Linus
