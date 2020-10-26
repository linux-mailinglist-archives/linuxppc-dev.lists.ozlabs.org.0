Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1709A2998BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 22:29:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKnz04Mr6zDqPb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 08:29:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Pqd4GnvU; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKnxC1ssJzDqNs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 08:27:42 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id e20so9315347otj.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 14:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=C7iBjVOiLEiQoedNWLzG0TU122Ys5J9UkVQlTCn6OG0=;
 b=Pqd4GnvUr+B2JvTVqwqbFlWxMLV2LObPZ4c+MTIC+SwRJ/9jzzMrC6VJQ/bDupFQQ6
 r9dygtM+n/axiWu3QjlRPIovSioa/dAxTF6owNTM5H8/hgaHUj+Jc7rVZCaG2LyrJr85
 3WHM6VKZNrIEXAfAkDFutw4STcy+HGSIWr5DtX+B5c14HjHtQMsmJYBZOsMDp6mgZnNx
 sci8SyUdyJVP9gw7jp8JBhqFa0v7YMtxMqX8GoQ7rvfyDuo5FmF3UBJTH40xYCLNgR9+
 7X05mSDI7LPiMMdhftnK42AARU4EpUqHN1xA52KS9Wv0LZESebQAZco1QJbmjhq6w1zn
 9rtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=C7iBjVOiLEiQoedNWLzG0TU122Ys5J9UkVQlTCn6OG0=;
 b=FPvXqf2gFvBMO4ucSbv16SGAewMkl+Macj4Ll8NBo08sIJsAFoAfbfi9vFEJRrXPZg
 yC5HeyZaOOr/xVZq25xsD69BLEqLv03ffznoMHA+5+jGrfDn6/HtIT9QAsGmaGAh0dG3
 4zolBLygxa9t+DSM1jw/GB2dtcxcEyquTnmvQ6RM39nM7bGq+i2psBB9FW6Ssd99jpUA
 OFeaNvhpTvPJojGkWkrYCpYGXR1QR4wRgYCEkxCavmGIlpyuY+H1cs0zL/IFiKkV+B0P
 3yeZk1f6vkvd9LF/xk4eAuRRcQNlg+6/xIOarWW9RSkZhIniAJ8jYMnQKmHsx5Qzbn8j
 p5jg==
X-Gm-Message-State: AOAM532hF/uJ/R4TN41zENf1IvEDSNQwwiOp5vFso7SFCz1RAVNOXrn3
 lnsJVvygKFaJB7mDtivZ1N8=
X-Google-Smtp-Source: ABdhPJz1vN6K9yTkkjKQPr0ZAPtg/mJJjnFmssNQCA+3zVoPVwLMAmGnsLsqjBFQWgQ6U3A3+AULrg==
X-Received: by 2002:a9d:71dc:: with SMTP id z28mr12227830otj.249.1603747659773; 
 Mon, 26 Oct 2020 14:27:39 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r8sm4298695otq.43.2020.10.26.14.27.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 26 Oct 2020 14:27:39 -0700 (PDT)
Date: Mon, 26 Oct 2020 14:27:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] treewide: Convert macro and uses of __section(foo) to
 __section("foo")
Message-ID: <20201026212737.GA113829@roeck-us.net>
References: <fe8abcc88cff676ead8ee48db1e993e63b0611c7.1603327264.git.joe@perches.com>
 <20201026194127.GA106214@roeck-us.net>
 <CAHk-=whjhHuwANGerJLJyn7jXCfMQMiaBAW+o2r_T+n=Ki+New@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whjhHuwANGerJLJyn7jXCfMQMiaBAW+o2r_T+n=Ki+New@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Joe Perches <joe@perches.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 26, 2020 at 01:33:48PM -0700, Linus Torvalds wrote:
> On Mon, Oct 26, 2020 at 12:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > make ARCH=um SUBARCH=x86_64 defconfig:
> >
> > Building um:defconfig ... failed
> > --------------
> > Error log:
> > arch/um/kernel/skas/clone.c:24:16: error: expected declaration specifiers or '...' before string constant
> > arch/x86/um/stub_segv.c:11:16: error: expected declaration specifiers or '...' before string constant
> 
> Weird. Is __section() not defined somehow for those files?
> 
> It does look like they have very minimal headers, so undoing that
> patch just for those two files is likely the right thing to do.
> 
> > As with s390, reverting this patch fixes the problem.
> 
> s390 should be fixed already.
> 
> Is the attached minimal patch sufficient for um to get back to working
> order, or is there something else hiding there too?
> 
That works for me.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter
