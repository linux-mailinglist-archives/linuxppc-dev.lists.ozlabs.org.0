Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFBA1C5E01
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 18:54:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Gm6j0FnMzDqf1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 02:54:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=eb7GI2X/; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Gm3y1nHpzDqcW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 02:52:27 +1000 (AEST)
Received: by mail-lf1-x142.google.com with SMTP id a4so1918534lfh.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 09:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9hFXujfAx2/iHidBrnKhRaNUObDjx6hbclJAooxUbFo=;
 b=eb7GI2X/XrhuAn2Vm+U9831w2ibE6cHnWF7F9S99pPGIKJ581y9sIjG0fOlnKnr8XU
 3l3RpH6pJHtIm3ZTaZWOJ1vg4eqLgQyIQUJKPk6h3hKYNOZAM/NKILDQePeV8IKRtcTz
 txmKNoel5w65lmX1pdFQXgC+9b7bhZqgRSUAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9hFXujfAx2/iHidBrnKhRaNUObDjx6hbclJAooxUbFo=;
 b=qEK5QtR5mCrIHr7tzBezVLMpS3YDbMUxlRfv7h31bxMJ2QYPGl1EFml7P9M2vQUCeN
 wFlezI8oO8YGEYcT3a4ixTFhpXvyUYTUgSiCUTtvZuQP/mYev20tEAJAfCI+O4zyhTgB
 gkzUGiFBRgM/61/mxht9XwngrxymWZGBCTe50Sa8pbYxF4R/VAVA1m+dZAwUPemXRmSv
 sapb6tpZDc6S79cge35pERRZ761diUeuKwOm/DSms2xNaD1kKJZahe2f5PCgbYDJVR4r
 5SxqeNag0rxIXmtzsUhcigwN68hs03o639DyBPgweLI7460qOwFROcUPRVb6UgjECAJj
 HAPQ==
X-Gm-Message-State: AGi0PubJtydw5Vdz+GFKR8BJmd2Z4lBcwKH6oqyOmgsnj2mLn49Fki5B
 Sk0at4MKilHQaGrIY5rZqz5JtWs73MM=
X-Google-Smtp-Source: APiQypLzR7FehoypOj4o6T5H7hOEMBQB9Y1CPtUFmdv1hxpja4SgHLn6axZK/7BhMeDGY/9gXogXQg==
X-Received: by 2002:a19:e04a:: with SMTP id g10mr2234560lfj.164.1588697542436; 
 Tue, 05 May 2020 09:52:22 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id a6sm2171769ljk.22.2020.05.05.09.52.21
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2020 09:52:21 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id f11so2383388ljp.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 09:52:21 -0700 (PDT)
X-Received: by 2002:a2e:87d9:: with SMTP id v25mr2307697ljj.241.1588697540733; 
 Tue, 05 May 2020 09:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200505101256.3121270-1-hch@lst.de>
In-Reply-To: <20200505101256.3121270-1-hch@lst.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 5 May 2020 09:52:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgrHhaM1XCB=E3Zp2Br8E5c_kmVUTd5y06xh5sev5nRMA@mail.gmail.com>
Message-ID: <CAHk-=wgrHhaM1XCB=E3Zp2Br8E5c_kmVUTd5y06xh5sev5nRMA@mail.gmail.com>
Subject: Re: remove set_fs calls from the coredump code v6
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jeremy Kerr <jk@ozlabs.org>,
 the arch/x86 maintainers <x86@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 5, 2020 at 3:13 AM Christoph Hellwig <hch@lst.de> wrote:
>
> this series gets rid of playing with the address limit in the exec and
> coredump code.  Most of this was fairly trivial, the biggest changes are
> those to the spufs coredump code.

Ack, nice, and looks good.

The only part I dislike is how we have that 'struct compat_siginfo' on
the stack, which is a huge waste (most of it is the nasty padding to
128 bytes).

But that's not new, I only reacted to it because the code moved a bit.
We cleaned up the regular siginfo to not have the padding in the
kernel (and by "we" I mean "Eric Biederman did it after some prodding
as part of his siginfo cleanups" - see commit 4ce5f9c9e754 "signal:
Use a smaller struct siginfo in the kernel"),  and I wonder if we
could do something similar with that compat thing.

128 bytes of wasted kernel stack isn't the end of the world, but it's
sad when the *actual* data is only 32 bytes or so.

                Linus
