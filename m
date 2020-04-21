Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DAE1B2F6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 20:44:38 +0200 (CEST)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496CCl49kSzDqQd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 04:44:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=EN4eMrfR; 
 dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496C8M6GWxzDql6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 04:41:39 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id x1so11784083ejd.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 11:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2Sxsn5oS4nqpkBX5BqB24mfzH+Rga+VCB+qgnhYUWk=;
 b=EN4eMrfRCQ2BTajrHemVrZRGdfNv+VjF0Hxxcl6iPzUIc4bkpVZwbpHp6Y8qjqbOly
 NQiQcxT3IZhkG8k/a9SX63SzMRhr6smIcOvnSUCBWIYLh5jNRcmyHxwhZdGgJqJWyNtZ
 yrajiBGrLqcdHIip5S59MA6DWpMQ2o4gnwtCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2Sxsn5oS4nqpkBX5BqB24mfzH+Rga+VCB+qgnhYUWk=;
 b=ioJ18r3eAd9XJR4eS6e/+5CpNbGJRsA3XoIqJrVZZgsSRAaETMnhhCTUYzVNOkh0mY
 a2zebyqhP+TmHmnhZnmGpMk+xL2uD+I669TZN7mZ5V+30lXP9MYmQBqJZcKhFTD3Rubn
 hh4LP5EEO/ZzUql5+MtzfXHsYTOW/vBwZ7/UURR6K/GrY/8ghRTseivHrQQOyAMKre13
 p5dFygx1CcpUZbgavcW35s8ET20SYkAV9hvth89MBfb/laxOH91SVbrWikUHPzsDsuSj
 k87m7/M3yNTgXqTk+xHPeNC9LKBQFSeljSiHvR9I3t79wwJ2r0X17V2wyJ/tz7EMGoNB
 ErFg==
X-Gm-Message-State: AGi0PubXtqAi3Y/kZN1k6chEgn4AolGDROwu6O82r69bijn7GmQr9LhZ
 7Lr1jk/7kMMstt2wPuzMm0KcB9iApuI=
X-Google-Smtp-Source: APiQypKGi9ceWlZ+060R3v8wbWntZ5zjWtCW2Jo9HP8MmsC+JYsKAPyLNd7CZw+16hWWBmg4h697Ag==
X-Received: by 2002:a17:906:c44b:: with SMTP id
 ck11mr22891953ejb.110.1587494494559; 
 Tue, 21 Apr 2020 11:41:34 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42])
 by smtp.gmail.com with ESMTPSA id s7sm117070edg.73.2020.04.21.11.41.34
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 11:41:34 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id a8so5999731edv.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 11:41:34 -0700 (PDT)
X-Received: by 2002:a2e:8512:: with SMTP id j18mr9624239lji.201.1587494060836; 
 Tue, 21 Apr 2020 11:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <36e43241c7f043a24b5069e78c6a7edd11043be5.1585898438.git.christophe.leroy@c-s.fr>
 <42da416106d5c1cf92bda1e058434fe240b35f44.1585898438.git.christophe.leroy@c-s.fr>
 <CAHk-=wh_DY_dysMX0NuvJmMFr3+QDKOZPZqWKwLkkjgZTuyQ+A@mail.gmail.com>
 <20200403205205.GK23230@ZenIV.linux.org.uk>
 <20200421024919.GA23230@ZenIV.linux.org.uk>
In-Reply-To: <20200421024919.GA23230@ZenIV.linux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 21 Apr 2020 11:34:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiuHxXwuPynLFh-fYjuUE3_HNPh79e_P6MFMbq4Ki+QCw@mail.gmail.com>
Message-ID: <CAHk-=wiuHxXwuPynLFh-fYjuUE3_HNPh79e_P6MFMbq4Ki+QCw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] uaccess: Rename user_access_begin/end() to
 user_full_access_begin/end()
To: Al Viro <viro@zeniv.linux.org.uk>
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
 Russell King <linux@armlinux.org.uk>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 20, 2020 at 7:49 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         The only source I'd been able to find speaks of >= 60 cycles
> (and possibly much more) for non-pipelined coprocessor instructions;
> the list of such does contain loads and stores to a bunch of registers.
> However, the register in question (p15/c3) has only store mentioned there,
> so loads might be cheap; no obvious reasons for those to be slow.
> That's a question to arm folks, I'm afraid...  rmk?

_If_ it turns out to be expensive, is there any reason we couldn't
just cache the value in general?

That's what x86 tends to do with expensive system registers. One
example would be "msr_misc_features_shadow".

But maybe that's something to worry about when/if it turns out to
actually be a problem?

                 Linus
