Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3617254CC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 20:17:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcrYM39j4zDq6k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 04:17:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=GjsK/u6i; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcrWD17SNzDqBH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 04:15:34 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id v9so7497189ljk.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 11:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Ln4YDv+McQTrVSBLkYMyzgo5ffLr7W4nh7mUMFYOZo=;
 b=GjsK/u6ib7N+ctD2EUfS3Yg2gOjkfLasSaGCU/YbFFT4pm7wC/mAUjkvSP+UBZidUg
 P75Y7Q+9vqNQMjHTBy6Jwr30jghzFLvVdhlC7Nn9Ui5WCs2KOmFbugeMsgtI/Xw61N8K
 QeupHGovYgcCrHWAn29zkzD17dqNMKZTBIjAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Ln4YDv+McQTrVSBLkYMyzgo5ffLr7W4nh7mUMFYOZo=;
 b=sthG554tBrOypHERy8LLCkbc2vcMDy2FAeLjSv9W7Zj+hniBjiIt9mWEKP0T0Ho0RX
 idMIMJHis0BPmBzZFyDA8YLNh/SB4lil3NrC8/hp2zpjwvZ6mytJhqSJViM98XiiC2Qa
 wxMGxhbFUIh7XiPqEEu8NwnKAoTc5abJHkEhjxEC3s9p2gydnJ55/3ypXmO/jDfB1Vcd
 Bui6lYeLbKOgRCchzUTIfwBfZLQk8ct6+5eTs5d0mEa2rYVTthtTYHmvCr2DRVXeLpe/
 nyk0luDEC8bgeh/IfmZSh0oRObWedS5VQ/Anv+bb/g3iR4HokzULr0k0B3l/4OWAwI8e
 9L8w==
X-Gm-Message-State: AOAM533FdU8TjrBCXHQOHfrVTOUcmYeLOd3hi0o5Et3aYEO/jCkR3JR2
 stlOTAhsIcsqoCaQzC4QGGw/EQcTV1/0dg==
X-Google-Smtp-Source: ABdhPJw6pg0owhaf00y3u5sYpiKqE5jqFDgCigKnCmboKUAosOkTbAqev1WwYF0ga7voOSdShkJK5A==
X-Received: by 2002:a05:651c:1182:: with SMTP id
 w2mr9458550ljo.197.1598552130723; 
 Thu, 27 Aug 2020 11:15:30 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id l13sm699064lfk.18.2020.08.27.11.15.28
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 11:15:28 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id y2so7510987ljc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 11:15:28 -0700 (PDT)
X-Received: by 2002:a2e:92d0:: with SMTP id k16mr9604351ljh.70.1598552128279; 
 Thu, 27 Aug 2020 11:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200827150030.282762-1-hch@lst.de>
 <20200827150030.282762-9-hch@lst.de>
In-Reply-To: <20200827150030.282762-9-hch@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Aug 2020 11:15:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjxeN+KrCB2TyC5s2RWhz-dWWO8vbBwWcCiKb0+8ipayw@mail.gmail.com>
Message-ID: <CAHk-=wjxeN+KrCB2TyC5s2RWhz-dWWO8vbBwWcCiKb0+8ipayw@mail.gmail.com>
Subject: Re: [PATCH 08/10] x86: remove address space overrides using set_fs()
To: Christoph Hellwig <hch@lst.de>
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
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 27, 2020 at 8:00 AM Christoph Hellwig <hch@lst.de> wrote:
>
>  SYM_FUNC_START(__get_user_2)
>         add $1,%_ASM_AX
>         jc bad_get_user

This no longer makes sense, and

> -       mov PER_CPU_VAR(current_task), %_ASM_DX
> -       cmp TASK_addr_limit(%_ASM_DX),%_ASM_AX
> +       LOAD_TASK_SIZE_MAX
> +       cmp %_ASM_DX,%_ASM_AX

This should be

        LOAD_TASK_SIZE_MAX_MINUS_N(1)
        cmp %_ASM_DX,%_ASM_AX

instead (and then because we no longer modify _ASM_AX, we'd also
remove the offset on the access).

>  SYM_FUNC_START(__put_user_2)
> -       ENTER
> -       mov TASK_addr_limit(%_ASM_BX),%_ASM_BX
> +       LOAD_TASK_SIZE_MAX
>         sub $1,%_ASM_BX

It's even more obvious here. We load a constant and then immediately
do a "sub $1" on that value.

It's not a huge deal, you don't have to respin the series for this, I
just wanted to point it out so that people are aware of it and if I
forget somebody else will hopefully remember that "we should fix that
too".

                   Linus
