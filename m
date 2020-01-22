Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C2145996
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 17:15:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482r963vVfzDqP3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 03:15:22 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=google header.b=WVzg/4mZ; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482r784fLmzDqDF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 03:13:36 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id y1so41139lfb.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 08:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PxCSo2JcEGlTJhdmVOOHLpuyjFAWieC3FhzbX6ms3Bk=;
 b=WVzg/4mZaQ3ubctvikpmoB2+8YZnmRK2+VSYiWGQ33nJZL1OeIGMyFE3sBcuqoQVbi
 rwpNneTfpLB3RAwTWttAZsxz4mdwPNf2Y8+kgY4tYIeLbjPU7jrBtLrLWh4mnN0ddI2k
 Y06yr95wD8GFqmmXgcgeinrku41v7nODIWRxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PxCSo2JcEGlTJhdmVOOHLpuyjFAWieC3FhzbX6ms3Bk=;
 b=CDRjGnc4TXXaFvBlfhoVrXJgl2YodsLiL+1EkeP5OFZDX0RZTv0jv28cMPYE8HiWdt
 Kbc73t5p4Bp9IsVsF4J7r1r8Tj2tkC8iXjkniaUOP4rEHRgD+WV5Qjs070hNkQoP6ymG
 n/lL0B72t3KHBFlANr6wOM5eCg5SauBUqDemJBYuL2SeSkhej8NbI2XeraRd1X3M/rID
 GMP4oSVK34GutmUeHYK1OmofRC0691JhULmDqG27Jsv0gsonnxuwvP7xQZw7Pk5TXu74
 OO9uGKUykw0wcGubrsX4EtzujdQxjswOoA8WY0rGF4IB6dsk+Zxtw5Wd2zntFA+DBTn0
 cjdg==
X-Gm-Message-State: APjAAAWk1B6fIVjp1aFdfMIEDyRT/GLAPQsvNd9AXFVTinpviWWTDSxo
 qtNRaDQGV+yWNu0AFj9U7s1XO2RnAEE=
X-Google-Smtp-Source: APXvYqyKp+UzSGOSc526vyx6aa8hvQQmU03tINJSDUppgGuZYgDKhhCuWOxQZWgV+nxoW+rKGuXOUA==
X-Received: by 2002:ac2:599c:: with SMTP id w28mr2227168lfn.78.1579709610003; 
 Wed, 22 Jan 2020 08:13:30 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id 4sm2885208lfh.73.2020.01.22.08.13.28
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 08:13:29 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id o11so7154371ljc.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 08:13:28 -0800 (PST)
X-Received: by 2002:a2e:9510:: with SMTP id f16mr19943444ljh.249.1579709608444; 
 Wed, 22 Jan 2020 08:13:28 -0800 (PST)
MIME-Version: 1.0
References: <a02d3426f93f7eb04960a4d9140902d278cab0bb.1579697910.git.christophe.leroy@c-s.fr>
In-Reply-To: <a02d3426f93f7eb04960a4d9140902d278cab0bb.1579697910.git.christophe.leroy@c-s.fr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Jan 2020 08:13:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=whTzEu5=sMEVLzuf7uOnoCyUs8wbfw87njes9FyE=mj1w@mail.gmail.com>
Message-ID: <CAHk-=whTzEu5=sMEVLzuf7uOnoCyUs8wbfw87njes9FyE=mj1w@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] fs/readdir: Fix filldir() and filldir64() use of
 user_access_begin()
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 22, 2020 at 5:00 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> Modify filldir() and filldir64() to request the real area they need
> to get access to.

Not like this.

This makes the situation for architectures like x86 much worse, since
you now use "put_user()" for the previous dirent filling. Which does
that expensive user access setup/teardown twice again.

So either you need to cover both the dirent's with one call, or you
just need to cover the whole (original) user buffer passed in. But not
this unholy mixing of both unsafe_put_user() and regular put_user().

              Linus
