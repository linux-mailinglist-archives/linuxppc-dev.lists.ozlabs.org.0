Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A232919C9FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 21:28:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tY5Z0c0NzDqXw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 06:28:50 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=google header.b=WFRj2oMO; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tY3p2vy8zDqXw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 06:27:17 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id s13so3720277lfb.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 12:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VNVfYQcU5r7QqnygVgwbeTwWR3NWKnCIk7XJifmEK+g=;
 b=WFRj2oMOOBQ9Ye/JZJICZujrvRy2hkbOR9uXKlMdFDvf9Q5Lq80wgWioeP0e0rs0oj
 n0Wk/vH8ieHoUcWgLtyDYX5P7nJxjuAYNdlNyNknULgO81UVaZJ0LqdKLLefqzuqrqZf
 RMdkwJXPuZPoAbZGgiU6xp+RQahaYFh5oXLKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VNVfYQcU5r7QqnygVgwbeTwWR3NWKnCIk7XJifmEK+g=;
 b=LEl5ciXzjMDIpj161Hl3QaZk/gc2gbexG1odPiI+UsHM6M11R/s7EYte+ErNHdqWgo
 TFi+SACsquxbwcoEGa2PL0nBBEafNjx3d4SCYEXAQoY1o8FX9NKslmZ0PxiHWqnp5JVW
 1HY/SWIzYy+ZFHryoRo/+K/SSQxV5rztNCbgQ+1HMxhziE75yCIM+N/aMCb0HW2jpctI
 M3p5K6JNFqZ254f+fk5SOjBMiJioiqUYmZpbt5q/2Wc4TbKYkDDWfk66YpPR+/MQJcxF
 ubVl/I5XIJDcfRTHUSRzeaAIFAF+uaoMHopq/aYIVCWxeIzMGltIwfGmjj7ei/A0Pax2
 763Q==
X-Gm-Message-State: AGi0PuazFRdmcm6RNXenC+HXVuRq4wrXFYVIbNdegS1ig1nc0YY7puuQ
 hvvMToxv0ul7M+8Pkrz2zjWvVad4nkc=
X-Google-Smtp-Source: APiQypIA6wlE7Tx/dPh1bFY7QdmRuAdJhNr5Gy8yWNbcuQ7ROFcbVOKJ2kFBo0VvsGmrJRm9/Yyemg==
X-Received: by 2002:a19:4cc2:: with SMTP id z185mr3178324lfa.0.1585855630522; 
 Thu, 02 Apr 2020 12:27:10 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id 23sm3745468ljr.32.2020.04.02.12.27.09
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2020 12:27:09 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id n17so4489115lji.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 12:27:09 -0700 (PDT)
X-Received: by 2002:a2e:8911:: with SMTP id d17mr2938169lji.16.1585855628859; 
 Thu, 02 Apr 2020 12:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
 <20200402162942.GG23230@ZenIV.linux.org.uk>
 <67e21b65-0e2d-7ca5-7518-cec1b7abc46c@c-s.fr>
 <20200402175032.GH23230@ZenIV.linux.org.uk> <202004021132.813F8E88@keescook>
In-Reply-To: <202004021132.813F8E88@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 2 Apr 2020 12:26:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg9cSm=AjPmkasNHBDwuW4D10jszjv6EeCKp8V9Qbx2hg@mail.gmail.com>
Message-ID: <CAHk-=wg9cSm=AjPmkasNHBDwuW4D10jszjv6EeCKp8V9Qbx2hg@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/4] uaccess: Add user_read_access_begin/end and
 user_write_access_begin/end
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

On Thu, Apr 2, 2020 at 11:36 AM Kees Cook <keescook@chromium.org> wrote:
>
> Yup, I think it's a weakness of the ARM implementation and I'd like to
> not extend it further. AFAIK we should never nest, but I would not be
> surprised at all if we did.

Wel, at least the user_access_begin/end() sections can't nest. objtool
verifies and warns about that on x86.

> If we were looking at a design goal for all architectures, I'd like
> to be doing what the public PaX patchset

We already do better than PaX ever did. Seriously. Mainline has long
since passed their hacky garbage.

Plus PaX  and grsecurity should be actively shunned. Don't look at it,
don't use it, and tell everybody you know to not use that shit.

                Linus
