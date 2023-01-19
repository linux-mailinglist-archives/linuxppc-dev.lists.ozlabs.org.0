Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2C0672E5E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 02:43:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny54560jRz3bXQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 12:43:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HhQ0xvQY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HhQ0xvQY;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny5376hBGz3bTk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 12:42:10 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id 20so345406pfu.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 17:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jTlfNksJalEp/A5sUIxTgRksg/f/RnRMjUOcu8kx0c=;
        b=HhQ0xvQYH31klAmXtATKS3umnYmXZLm1jhsZWhY3zxBGOzV5UvC5+HOPQ74rr4IVdi
         viO/Y5h6rjpyVuXjVmkMpid4adWtXK4TcpYhNdh+uqU61rqAA1IX1TTxWrgFsu0nAjYv
         pEHPxHYljLtPQJXN+O6urbgXNUpZIUh/KPHt2pNpVujsQKrpObeQwaVMOXNVtZ2ZTmgG
         mCabkxYu51M5Et0B+06U98ut2+y9rh+wqmiT9RAjZd/7Qpxgy2qIxFHyXRB0ecZzXka8
         35bnEcCT49LzCAgRfD16Hw63IDP1lVjOfzJsgtTU1yLw/mkfQipeMdguETXNW4GFO4kl
         JyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1jTlfNksJalEp/A5sUIxTgRksg/f/RnRMjUOcu8kx0c=;
        b=OjQzKz9nyC1Z5WX+pMwb7UmQ/GfY67fWrJhxtN0DxBxlJpJZTbpPa5cP8iIfzgmAmE
         kbhPoYNZN1mgEyXPatBshUd/orJmhd1z/rBz24Bc2xNziTHjGheAOvNv5qdnDfmyOp0q
         idGGSLNMocy7Mgk8387T7TIXu2u/YthVaz1euir09pthwIVliP0TBvLM1nA6k2fcy8Lw
         yRmqeN4Sdpvvy6RvSuLChEGLPUNr0+Cy0ht9ZpLshrraJWZ8OVVE3suPXT/1ixDyXIuE
         PRDb3p8TxsMTB/SkG97ehXtRroq3hRuZMJX7fKVfvKOxzoThYy625RG7Kiq9v9tbIWw7
         +nuA==
X-Gm-Message-State: AFqh2kozNoc8XK+3gxAlijZ7eVDqqmyv3QA8Hn7HMbZY3Y+5VBcCguwt
	kmcvnR5FQB1Ql1VrYaf3k08=
X-Google-Smtp-Source: AMrXdXvV7ofDOm4aFHya2EIoCDpKJMrm+bHqraoK2hS0COfWYM90GBxg+hCw2OE54Bb8LzJ88DhU0g==
X-Received: by 2002:a62:ab02:0:b0:58d:982a:f1ed with SMTP id p2-20020a62ab02000000b0058d982af1edmr8724476pff.27.1674092528248;
        Wed, 18 Jan 2023 17:42:08 -0800 (PST)
Received: from localhost (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id z13-20020aa79e4d000000b0058bc1a13ffcsm9337947pfq.25.2023.01.18.17.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 17:42:07 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jan 2023 11:41:57 +1000
Message-Id: <CPVS9PAXZRPK.3HFH2LTB662XP@bobo>
Subject: Re: Memory transaction instructions
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "David Howells" <dhowells@redhat.com>, "Linus Torvalds"
 <torvalds@linux-foundation.org>
X-Mailer: aerc 0.13.0
References: <CAHk-=whjFwzEq0u04=n=t7-kNJdX0HkAOjAMjmLXDDycJ+j9yQ@mail.gmail.com> <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com> <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com> <CPQQLU1ISBIJ.2SHU1BOMNO7TY@bobo> <CAHk-=wiRm+Z613bHt2d=N1yWJAiDiQVXkh0dN8z02yA_JS-rew@mail.gmail.com> <1966767.1673878095@warthog.procyon.org.uk> <2496131.1674032743@warthog.procyon.org.uk>
In-Reply-To: <2496131.1674032743@warthog.procyon.org.uk>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, tony.luck@intel.com, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Jan Glauber <jan.glauber@gmail.com>, Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jan 18, 2023 at 7:05 PM AEST, David Howells wrote:
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>
> > And for the kernel, where we don't have bad locking, and where we
> > actually use fine-grained locks that are _near_ the data that we are
> > locking (the lockref of the dcache is obviously one example of that,
> > but the skbuff queue you mention is almost certainly exactly the same
> > situation): the lock is right by the data that the lock protects, and
> > the "shared lock cacheline" model simply does not work. You'll bounce
> > the data, and most likely you'll also touch the same lock cacheline
> > too.
>
> Yeah.  The reason I was actually wondering about them was if it would be
> possible to avoid the requirement to disable interrupts/softirqs to, say,
> modify the skbuff queue.  On some arches actually disabling irqs is quite=
 a
> heavy operation (I think this is/was true on ppc64, for example; it certa=
inly
> was on frv) and it was necessary to "emulate" the disablement.

Not too bad on modern ppc64. Changing MSR in general has to flush the
pipe and even re-fetch, because it can alter memory translation among
other things, so it was heavy. Everything we support has a lightweight
MSR change that just modifies the interrupt enable bit and only needs
minor serialisation (although we still have that software-irq-disable
thing which avoids the heavy MSR problem on old CPUs).

Thanks,
Nick
