Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 454A426A3F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 13:14:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrLGf3pw6zDqPn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 21:14:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=jcmvbkbc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Z/MAEsVT; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrLDV6KFRzDqHb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 21:12:41 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id i22so4460264eja.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 04:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B4bOYSHsWHocnYArElpYthybN5SxC006LAFmz/36FHU=;
 b=Z/MAEsVTEnQKv9yb0HSOEZbJscLkrEI2KA6jePSwMg1TwHWUG2zmL/K+AbtjHO6/2o
 aIcnbhckWr6rgCmNGSrXn/T9XMsHZZKm/PsdMekg45hebYJEoEh6DtSQc6AwPL0FexMQ
 QEcy40U+GKpucQlCREx876BJYFzTaICPrYW4syFH6C95NZecWVgDFi7ziO/VvX17lotJ
 DDZY+9PHfKcooxB486MYcbnHky26yYukszeQjs76Kwm/6X3Co9rV5HLW0BzJkHQ4SNlQ
 948TjdNG8+d8rKLvuzJokO+1T8T3AZzYmxIxeK7CMSgHmOVQw0cHLexkCCkg+JNIGJLn
 Ny/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B4bOYSHsWHocnYArElpYthybN5SxC006LAFmz/36FHU=;
 b=uNjkELOhNeZ+3luWXos6+CPvb2/X97qqU5ReMNMUh7qQNUX3k0JmxN3VchEsbBlpme
 qSoorj+MMduF4BN/DHDuYhbUPJNnLESDI5rPBv4M/GeIosvcKH3Zjw0ftiuvWH/zUMin
 yfijyY1iK6mKXsg2o59JV9Qhj2yD7BrrSEeXjoobs9Y8z3ftWdsKlnxWI+Xq9l5SqVXW
 dorURL0TGJ9ZdRzX1mT+pkjx4yCcQDIO5Bj9Sb0BHTXiFq79+rXH3mTOJD7XCeetu1qn
 mfVqM2DsbiXyFljQYuwll/g7VOWebLLgVyneERExmS6aMXrle5fAicBUgUnURXmDZbKg
 lYpw==
X-Gm-Message-State: AOAM531y4btNkF9SoARhDu/aurseGfFFbfPwxdCDvVtiSSA++kAsz0oL
 a0Hzghsem7XavfFSLSbSPgsOyPW1TYV06qtvJlc=
X-Google-Smtp-Source: ABdhPJwPU+9ZWIwNO56zgtgygOIdmPreND4z7Ge5DlUnTt0Tfg9IxfvCSMJOXmsXBV/ZabpWxbhtETys6v+wayV6BRQ=
X-Received: by 2002:a17:906:30c5:: with SMTP id
 b5mr19838526ejb.98.1600168356388; 
 Tue, 15 Sep 2020 04:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200912110820.597135-1-keescook@chromium.org>
 <87wo0wpnah.fsf@mpe.ellerman.id.au> <202009141321.366935EF52@keescook>
In-Reply-To: <202009141321.366935EF52@keescook>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 15 Sep 2020 04:12:24 -0700
Message-ID: <CAMo8BfK0Jcmt4EJ1R2d_4Hp9siSRrBsgaNDqCVjcQ0GK8XBGZA@mail.gmail.com>
Subject: Re: [PATCH 00/15] selftests/seccomp: Refactor change_syscall()
To: Kees Cook <keescook@chromium.org>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@amacapital.net>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 14, 2020 at 1:32 PM Kees Cook <keescook@chromium.org> wrote:
> On Mon, Sep 14, 2020 at 10:15:18PM +1000, Michael Ellerman wrote:
> > Kees Cook <keescook@chromium.org> writes:
> However...
>
> >
> > cheers
> >
> >
> > ./seccomp_bpf
> > TAP version 13
> > 1..86
> > # Starting 86 tests from 7 test cases.
> > #  RUN           global.kcmp ...
> > #            OK  global.kcmp
> > ok 1 global.kcmp
> > [...]
> > #  RUN           global.KILL_thread ...
> > TAP version 13
> > 1..86
> > # Starting 86 tests from 7 test cases.
>
> Was this a mis-paste, or has something very very bad happened here in
> global.KILL_one_arg_six finishes?

I observe similar output corruption on xtensa when I redirect test output
into a file or pipe it to 'cat'. When it goes to the terminal it looks normal.

-- 
Thanks.
-- Max
