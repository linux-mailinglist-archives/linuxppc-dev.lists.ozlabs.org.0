Return-Path: <linuxppc-dev+bounces-5697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 552C1A22656
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 23:45:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjy0s0N48z30Sv;
	Thu, 30 Jan 2025 09:45:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::234"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738190030;
	cv=none; b=Mm8M8MsUG+yn+ZHiBdTrm1e51IUS7qQBGOhzNy2M1gkB9BKHARqgnDfs+mrgX4h4Iv3qaA43dT/MjfTAB1R6gsbeAHb70p7Ow6iM1ziMyvfRa5RJcd2LFdbQjfmOr8/Chy+DDAHvgRc/reNQGW/+IcfjbecbS1lL2XSouxaI+rbVujwj5kKXUpfpCFyct5vHi9CWSXhaFeDTWM8gL82C9ta4anuJjlhCH3nAL1msb0Nqt/h3zUk+e9ZRpFkEkCiSuQuen5gAwcOjwTa4KTAgW5dLx0VMAffZ1PwqZ0jEMRZpewY8qhE2jcPAYu1GQsHBLSGUn6FR+8DseR2xVF7D7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738190030; c=relaxed/relaxed;
	bh=TwtTqChbi4zZdf/ZVEHKDcud1fzrA6/ZFVeSu32TP20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=bCZ2Ej+4G5q/6XOMMzfeHdx3Lu7t5XRBCKBHWPQhrqiXEZmXqiOJp3HQZ+kJjMVmYUn8kFGvc7Tfghcvjpj5HLsah124cZO5BgQ2ETlA6F1RtSdXYN2IDuEuGsgCI52IzBTQAFUXy+G9gL1pqicS03B1Se4kuPTKeOfJyn7LfgegUWE74BOTz+erwi16Xbd4KlYNIJWfh0QBXdSvVksJW3jNpDXdb5v9N+/GdQnroxcuPZ2nUHhjVkwxeRblBjnNqhvQxD/mBkhZKx9uV+TMabvlHq2W+EGpQrUnpPFbUfmUZN7VXg/JoPH2avhHrr5pqW8MN41Z2Nq1/xyhi5ILGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mhthx8MM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mhthx8MM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjxlK1JgLz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 09:33:48 +1100 (AEDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-30615661f98so1296291fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 14:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738190022; x=1738794822; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TwtTqChbi4zZdf/ZVEHKDcud1fzrA6/ZFVeSu32TP20=;
        b=mhthx8MM4s1Ojk47kNMkBrBKUvAv5fA3vCVgByty+c55tqGDq6h0YB8OYJFZpT+y+U
         KxpmzL7Uox2u1jZocH53xm4cjs2PXs+W+p9IHqx9gDnvth5gtLwS2efcWYay8DUGbtiQ
         Iah0/5Qdo0GcDn0IvgKXEdJ0aNgXEVL8zqHrXQVjRc2xXm+7yExZ9CwAtozM1eGNuBbn
         MrFEGlXZa6gMiMrZW8Cu+8d5tFwUNlj2p67naHT0jh+sd83NYHbA0GDi9EXPgtapZYZr
         7grbGRURlnqN22grwklXc4m9eUzHWZkrMliz44RYpGP02lCTPkYwcA7L84szQmJw4hHJ
         z5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190022; x=1738794822;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwtTqChbi4zZdf/ZVEHKDcud1fzrA6/ZFVeSu32TP20=;
        b=EZVnasb+rctL/Zp0RB8fURuQHU++LhJfmZsRFjnjSlCvomhKKjsHESWCmsLH+0Helf
         aakDPL3sztoPT6CVVuJeGeezg3Wl9MDz9NsBFG/wgKwdS30uSg03gmbI0tUwEiAb5w/i
         ZoL5zmKYClgh61LRIKNxivDflg5gOZMQr9bbkGsQUyv/w4t+CL7BxXGac9vZnXIz2LBc
         AWN/BWQ05UIygYrFiuWegwYO6kF2nC4BwtMhN5AJf9q92pUpfZaS+3z6yeozD4ZoI12E
         Fze/0w0PfVyZ2WdOkzKsi1OOoGH8IWKjGylkkA/N7pJPx88VssgpD84/9OhvUw3IadLe
         pNTw==
X-Forwarded-Encrypted: i=1; AJvYcCXc/UtknYb0gGyZl8XB+GwNyKsfuocYlbh/enNwvFVUkjQ7wQ6icfgNEII58RE8ICYvqD7LyRLtfMsF0Hs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxLqv7wkzdlc7tjhqxfB1nOB6tth8TP7mHXT1EnL1hYsbVbK0Xx
	MJePEjPLFY/632Pc9lggTIiY/z1zMaacD4Cjuu/6uLDTdkvztBaHCxZvtwhL0UaT021pggkqwCi
	wEeagmlzNVKNd3YRh2B4QIdFiW1U=
X-Gm-Gg: ASbGncuo4QfM7D7Q98YzTP0T+O9jL3yMHe0w/ad06sewYTp4ZiQLrS1naCM1Jcgs44d
	BUL6uYbMW2eTwAe0O1NsssiPEPpQe02xk2Pbg2FRiqxdhwtZrAXrC49IaO0HOuRH7OlqMfhGIFc
	TYiB2ewxDR0xdwEJpyiSBfTi/WKr8iEg==
X-Google-Smtp-Source: AGHT+IF2MeaNjouO8R0JM1et8QEoQLnG0VNYPnffzuMibc14Fpm6x8jD+8I3kdg8KrIHS3kDt2XsyPg6S66iF7JWajU=
X-Received: by 2002:a2e:bd02:0:b0:307:2b7e:6ba0 with SMTP id
 38308e7fff4ca-307968b8eb2mr17871601fa.6.1738190022267; Wed, 29 Jan 2025
 14:33:42 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com> <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
In-Reply-To: <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 17:33:06 -0500
X-Gm-Features: AWEUYZmqB9KaPVADJVSl0RJAzYftKo4819o4ffb3JmJnxzxyng6OqI0KWIIVhig
Message-ID: <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@gmail.com>, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, geert@linux-m68k.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 5:26=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Tamir Duberstein <tamird@gmail.com> [250129 16:29]:
> > On Wed, Jan 29, 2025 at 4:26=E2=80=AFPM Liam R. Howlett <Liam.Howlett@o=
racle.com> wrote:
> > >
> > > * Sidhartha Kumar <sidhartha.kumar@oracle.com> [250129 16:02]:
> > > > + Liam, Matthew
> > >
> > > + linux-mm
> > >
> > > Thank you Sid.
> > >
> > > >
> > > > Hello,
> > > >
> > > > I believe this patch needs to be reverted for now as it breaks the
> > > > user-space build of /tools/testing/radix-tree with:
> > > >
> > > > In file included from xarray.c:11:
> > > > ../../../lib/test_xarray.c:9:10: fatal error: kunit/test.h: No such=
 file
> > > > or directory
> > > >      9 | #include <kunit/test.h>
> > > >        |          ^~~~~~~~~~~~~~
> > > > compilation terminated.
> > > > make: *** [<builtin>: xarray.o] Error 1
> > > > make: *** Waiting for unfinished jobs....
> > > >
> > > > this then prevents the maple tree test suite from building.
> > >
> > > How are grammar corrections going to the right person (but not the
> > > mailing list) while an entire conversion to kunit is not [1]?
> >
> > Very simple: the tests are not properly included in MAINTAINERS. I
> > sent https://lore.kernel.org/all/20250129-xarray-test-maintainer-v1-1-4=
82e31f30f47@gmail.com/
> > a few minutes ago for this reason.
>
> Fair enough, but from the patch:
>
> @@ -6,11 +6,10 @@
>   * Author: Matthew Wilcox <willy@infradead.org>
>   */
>
> -#include <linux/xarray.h>
> -#include <linux/module.h>
> +#include <kunit/test.h>
>
> ...
>
>
> -module_init(xarray_checks);
> -module_exit(xarray_exit);
>  MODULE_AUTHOR("Matthew Wilcox <willy@infradead.org>");
>  MODULE_DESCRIPTION("XArray API test module");
>  MODULE_LICENSE("GPL");
>
> I don't get why the huge list of Cc's didn't include the author who is
> in the git commit signers:
>  $ ./scripts/get_maintainer.pl --git lib/xarray.c
> Matthew Wilcox <willy@infradead.org> (supporter:XARRAY,commit_signer:1/3=
=3D33%,authored:1/3=3D33%,added_lines:19/52=3D37%,removed_lines:4/23=3D17%)
> Andrew Morton <akpm@linux-foundation.org> (supporter:LIBRARY CODE,commit_=
signer:3/3=3D100%)

I'm not sure what you're asking. I used `b4 prep --auto-to-cc`. It
doesn't know that test_xarray.c and xarray.c have the same maintainer.

> ...
>
> >
> > > Does the patch really need to drop the module testing too?
> > >
> > > What exactly is the point of converting one testing system to another
> > > besides disruption of actual work?  Who asked for this?  What is the
> > > point?
> >
> > All this is described in the commit message.
>
> The commit message says you like the output more and implies you like
> the command better.
>
> I've never used the kunit testing of xarray and have used the userspace
> testing instead, so I can't speak to the obscure invocation as both
> commands seem insanely long and obscure to me.
>
> >
> > > Is anyone doing work on the xarray running the kunit tests?
> >
> > I was doing work on xarray and I was running the kunit tests.
>
> ...
>
> You should look at the userspace testing (that this broke) as it has
> been really useful in certain scenarios.
>
> Thanks,
> Liam

For what it's worth the kunit invocation, while obscure, is
self-documenting. There's usage information that's reasonably
understandable embedded in the tool itself. I looked for the userspace
testing initially but failed to find
tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
meant to compile this.

Tamir

