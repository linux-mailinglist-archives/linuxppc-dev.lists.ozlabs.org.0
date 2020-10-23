Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66615296987
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 08:10:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHYk52dtBzDr0w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 17:10:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b43;
 helo=mail-yb1-xb43.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WB6pavCA; dkim-atps=neutral
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHYhV3ZBbzDqxF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 17:08:55 +1100 (AEDT)
Received: by mail-yb1-xb43.google.com with SMTP id l15so276366ybp.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 23:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XNjwNm9fr6MOiHhV0c7B5b4MJGULWGcLuUm+GanGsBU=;
 b=WB6pavCAYf594uliGhghOjMsImH7+PHOiF4EDnUqBF3cphrd0ogiBpHJA0MvxDEuOV
 5hIT3vxfJjHJ3/HG0/VprgOT4tWaBuczd3BYiMdLKjD0hnodoQQWLx0tYK+XId22U4t3
 08jfxtgX338IbUxZcR84Qttd6DQZ/3mgnYaSaOO8yawbpyMm+xS1RlJxbty+YICMk62g
 VNSYBDgK2KBkP59oFLxJOS3iHLB3VYycJezY5TWFIDFi57giyRunhJ9wAlrd/kC6r9NW
 Nun2D5o3KJH7cP8cRJ7q1kpvybWAv96qDLieU+aVZq//mvpZ71kk4EyaNAoC0aoaZcXk
 /X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XNjwNm9fr6MOiHhV0c7B5b4MJGULWGcLuUm+GanGsBU=;
 b=uROCwjtKK/kRzzcDQQcxP1LtudWVNYpImq6SGqVu4l/35KU2T/ewEjEjHUxj7oTcZG
 FbOBK4YatgDPm+7PLXIH1xHWflfVvHulFHytXxU8jsvpIqRfE/lHg6qDomCmH85NXykf
 GAdXNNW682BKYkAYHPQD7UW+tjguTucipDgY6JyY3end3o4YjLuGG+g8xiir3FkHvjNO
 oA9v7ImLdWZPAFG3Pz2YPCLsLFpgvTqU2GlEHr8ybHi/RttDZYm6rSQEBVfihYPfF/XJ
 pFHxqOlCVumB/SsJA2uZKSkn7iJ2WvQaVxeSukNiZpFA1DAQs35T0iQqwjpYSpkcKTUN
 Vz+Q==
X-Gm-Message-State: AOAM531RTu3C1TcsgRQohHWMYkgL8HLZGOdtEVSPcXqXooIPYdWX2W3U
 xpqucKWy9ZdJSWohWXZNyYV/+kXVvdAA4WlbyQs=
X-Google-Smtp-Source: ABdhPJyteJdZySQkBUEdPJpikZOXrl9LNaw91BcX33OCHSsqxf7Q0oYYhHHdeAdTBBDZ3YWawx69oa7YI1V3OR38nYU=
X-Received: by 2002:a25:d441:: with SMTP id m62mr1263586ybf.422.1603433333137; 
 Thu, 22 Oct 2020 23:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <fe8abcc88cff676ead8ee48db1e993e63b0611c7.1603327264.git.joe@perches.com>
In-Reply-To: <fe8abcc88cff676ead8ee48db1e993e63b0611c7.1603327264.git.joe@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Oct 2020 08:08:42 +0200
Message-ID: <CANiq72nfHjXkN65jy+unz0k66qvAALNhhhDZsxqPRLdtLKOW_Q@mail.gmail.com>
Subject: Re: [PATCH] treewide: Convert macro and uses of __section(foo) to
 __section("foo")
To: Joe Perches <joe@perches.com>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 22, 2020 at 4:36 AM Joe Perches <joe@perches.com> wrote:
>
> Use a more generic form for __section that requires quotes to avoid
> complications with clang and gcc differences.

I performed visual inspection (one by one...) and the only thing I saw
is that sometimes the `__attribute__` has a whitespace afterwards and
sometimes it doesn't, same for the commas inside, e.g.:

-  __used __attribute__((section(".modinfo"), unused, aligned(1)))  \
+  __used __section(".modinfo") __attribute__((unused, aligned(1)))  \

and:

-    __attribute__ ((unused,__section__ ("__param"),aligned(sizeof(void *)))) \
+    __section("__param") __attribute__ ((unused, aligned(sizeof(void *)))) \

I think the patch tries to follow the style of the replaced line, but
for the commas in this last case it didn't. Anyway, it is not
important.

I can pick it up in my queue along with the __alias one and keep it
for a few weeks in -next.

Cheers,
Miguel
