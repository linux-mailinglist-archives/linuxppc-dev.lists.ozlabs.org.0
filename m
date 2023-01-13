Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A411766A46D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 21:50:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nttpj442wz3fDr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jan 2023 07:50:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=jrtc27.com header.i=@jrtc27.com header.a=rsa-sha256 header.s=gmail.jrtc27.user header.b=FgOZvqmO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=jrtc27.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=jrtc27@jrtc27.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=jrtc27.com header.i=@jrtc27.com header.a=rsa-sha256 header.s=gmail.jrtc27.user header.b=FgOZvqmO;
	dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nttnk65c0z3ch7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jan 2023 07:49:28 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id ay12-20020a05600c1e0c00b003d9ea12bafcso14165778wmb.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 12:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B0IXTHEul8oECO64H+NEFJZ1qZc9qTDXKUg0Yyv928s=;
        b=FgOZvqmOpohh4tjpZEZ9CiXUhhr3LLBo4dA48IAxIhLjKRNzLWoSQGdQupZwZx2+a1
         krXP+VtZRNcB7GdHtr2PG0P3jgzQePGUseTXsfRp63ZbvZrp3Uc4XpYCnS+LP25dkZ95
         p23CNG08OAxRnyAA4EJAYVI7OunGePsBP7doUFtPkM/gwzG1jmPaXc5ciDagQnOdy4wy
         s9Sa1gFTXJPk0ZL7UYSYgCifwD6RXePFjLOyq/KA+KXtX3WgO+LtEXPNys/DXTZsRmtj
         U9g4CIIQ3CHJVwjfO9xX40BkGLMqo04IhX8m8rqajPn9yoEJ/r4y4Z3HBd5RZ3P5EAz/
         yWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0IXTHEul8oECO64H+NEFJZ1qZc9qTDXKUg0Yyv928s=;
        b=It7sMS6qJQBK9lcyJiCmI40fALg1xo0fFZUY77lnYV8Jd9Dt5R7Yoa0o6PNQR7ExN2
         l9vGUJfAYYdKFaV5LCqusZgf5JQXN9oyn/EGo2n/HfzDDievXrpEyGD0eC9XsZl3n4Cp
         u0mf1OhxDs5RD/5gQEqj7phAPpJN6Hu2vL0bBGsxMtedTwfPq/D0Oe6eKCAkn8sHoML2
         BCXWDP1BnlUBC+1ByloRw3Xve4jGg/VvJFLknKZ061XgwaEUPK1aPKYv+7haxSkGw3x2
         bxE+mYJ/iX6eA1hu7WJIQn2vmt5xJzU6MdZcBkUpza+rnTJFuaUVoGogodnlVeVbPdN8
         UK7w==
X-Gm-Message-State: AFqh2kp5OTeoD6/sR5RKY+ouOC+tswD+TO1mxwmWpYl3Wgb3FcuA+sqh
	y5JNDtvwlSsCT6BrBCYTy6X/zQ==
X-Google-Smtp-Source: AMrXdXt9VkcefpvBZsD3+f4QlFMXVMwT0tj/VKStUIzMmlGFyYGBNJWbiXy0v10sDYiPsjjqoZs3lw==
X-Received: by 2002:a05:600c:2318:b0:3c6:e63e:23e9 with SMTP id 24-20020a05600c231800b003c6e63e23e9mr62275003wmo.24.1673642961366;
        Fri, 13 Jan 2023 12:49:21 -0800 (PST)
Received: from Jessicas-MacBook-Pro.localdomain (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id e18-20020a05600c4e5200b003d9876aa04asm30903605wmq.41.2023.01.13.12.49.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Jan 2023 12:49:20 -0800 (PST)
Received: by Jessicas-MacBook-Pro.localdomain (Postfix, from userid 501)
	id 2689A4823B3E; Fri, 13 Jan 2023 20:49:19 +0000 (GMT)
Date: Fri, 13 Jan 2023 20:49:19 +0000
From: Jessica Clarke <jrtc27@jrtc27.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: ia64 removal (was: Re: lockref scalability on x86-64 vs
 cpu_relax)
Message-ID: <Y8HDzzDaP5uY0v8K@Jessicas-MacBook-Pro>
References: <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com>
 <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com>
 <SJ1PR11MB6083368BCA43E5B0D2822FD3FCC29@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CAMj1kXEqbMEcrKYzz2-huLPMnotPoxFY8adyH=Xb4Ex8o98x-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEqbMEcrKYzz2-huLPMnotPoxFY8adyH=Xb4Ex8o98x-w@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Will Deacon <will@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Luck, Tony" <tony.luck@intel.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Jan Glauber <jan.glauber@gmail.com>, "Torvalds, Linus" <torvalds@linux-foundation.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 13, 2023 at 08:55:41AM +0100, Ard Biesheuvel wrote:
> On Fri, 13 Jan 2023 at 01:31, Luck, Tony <tony.luck@intel.com> wrote:
> >
> > > Yeah, if it was ia64-only, it's a non-issue these days. It's dead and
> > > in pure maintenance mode from a kernel perspective (if even that).
> >
> > There's not much "simultaneous" in the SMT on ia64. One thread in a
> > spin loop will hog the core until the h/w switches to the other thread some
> > number of cycles (hundreds, thousands? I really can remember). So I
> > was pretty generous with dropping cpu_relax() into any kind of spin loop.
> >
> > Is it time yet for:
> >
> > $ git rm -r arch/ia64
> >
> 
> Hi Tony,
> 
> Can I take that as an ack on [0]? The EFI subsystem has evolved
> substantially over the years, and there is really no way to do any
> IA64 testing beyond build testing, so from that perspective, dropping
> it entirely would be welcomed.

For what it's worth, Debian and Gentoo both have ia64 ports with active
users (6.1 looks like it currently fails to build in Debian due to a
minor packaging issue, but various versions of 6.0 were built and
published, and one of those is running on the one ia64 Debian builder I
personally have access to).

Jess
