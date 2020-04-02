Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5E719CB38
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 22:29:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tZRJ6hR1zDrPv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 07:29:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Smm1q5CY; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tZPh6c0PzDq7d
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 07:27:51 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id b1so2366828pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 13:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Tm9Yr3bqmuNGExiY7vVKsPwnaHo60Po4ISz6K0cbNJM=;
 b=Smm1q5CY/oX1a5RB+6/rg0OMMpkQQEyasTzFJrBTMrH/9ggcr/BfvbpYsLykFyjKyj
 2PwhzKCTjNwbauICju6+DoHPLTmOfE26sbu8gKPAF0JNysrFbBXJP1k99H1Y81ZGotjF
 HBEOphcciEgjXYH2LvUC0i9QCTEJqTA6uBORk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tm9Yr3bqmuNGExiY7vVKsPwnaHo60Po4ISz6K0cbNJM=;
 b=h0tU1t3mpoFnEaSCOmOw7LssEj2/S2jjIpB5RarX5uwTIRrsl+CjIObyHZcllgf63m
 HzRS/oqXgaNp7f0WtZ8321BwpZqWPfiZ6eYeR0qf4Di7edriTRghkSF8U2494mKc6Gim
 DsbSrvNhXb0BqPWzhRmM2RhFHGQZtfBQz7GvbXHuDmtFaAx+L3u7+N4L+d7zhOWYNqNQ
 JBPmQoltTleFiS6gvei0yoy93PEYkIJaS4631duh1/Ww9EcDS5mhYQ4KjMH8phNatwG2
 7WBGUkhbXygEeOeVdV4Wh6NeeRkKawDehT3ix8Bcl9z9S6sxSpGET20ebUwKpW+uyI8d
 WFcQ==
X-Gm-Message-State: AGi0PuaiVConMIqRMM9Uy6fq+ZbFf3wQ7eV+uJ2kL0f8Bdoz3kz0asrs
 s6S4umXxY5RMA8GQjbrsXzJ7pQ==
X-Google-Smtp-Source: APiQypJru05phqDJ49g1EwlFJFXm3/ghT/fLOJrssR3ZOL3AQdXi15r8fpVrMULS6+mqXqrkrXK0nA==
X-Received: by 2002:a63:b80a:: with SMTP id p10mr4870517pge.306.1585859268304; 
 Thu, 02 Apr 2020 13:27:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i187sm4325945pfg.33.2020.04.02.13.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 13:27:47 -0700 (PDT)
Date: Thu, 2 Apr 2020 13:27:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH RESEND 1/4] uaccess: Add user_read_access_begin/end and
 user_write_access_begin/end
Message-ID: <202004021322.5F80467@keescook>
References: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
 <20200402162942.GG23230@ZenIV.linux.org.uk>
 <67e21b65-0e2d-7ca5-7518-cec1b7abc46c@c-s.fr>
 <20200402175032.GH23230@ZenIV.linux.org.uk>
 <202004021132.813F8E88@keescook>
 <CAHk-=wg9cSm=AjPmkasNHBDwuW4D10jszjv6EeCKp8V9Qbx2hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg9cSm=AjPmkasNHBDwuW4D10jszjv6EeCKp8V9Qbx2hg@mail.gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Dave Airlie <airlied@linux.ie>,
 Peter Anvin <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 02, 2020 at 12:26:52PM -0700, Linus Torvalds wrote:
> On Thu, Apr 2, 2020 at 11:36 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > Yup, I think it's a weakness of the ARM implementation and I'd like to
> > not extend it further. AFAIK we should never nest, but I would not be
> > surprised at all if we did.
> 
> Wel, at least the user_access_begin/end() sections can't nest. objtool
> verifies and warns about that on x86.

Right, yes, I mentioned that earlier in the thread. I meant I wasn't
100% sure about ARM's corner cases. I would _hope_ it doesn't.

> > If we were looking at a design goal for all architectures, I'd like
> > to be doing what the public PaX patchset
> 
> We already do better than PaX ever did. Seriously. Mainline has long
> since passed their hacky garbage.

I was just speaking to design principles in this area: if the "enable"
is called when already enabled, Something Is Wrong. :) (And one thing
still missing in this general subject is that x86 still lacks SMAP
emulation. And yes, I understand it's just not been a priority for anyone
that can work on it, but it is still a gap.)

-- 
Kees Cook
