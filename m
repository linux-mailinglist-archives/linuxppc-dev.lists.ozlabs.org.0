Return-Path: <linuxppc-dev+bounces-5703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4815A226C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 00:13:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjycj4L2Zz30TK;
	Thu, 30 Jan 2025 10:13:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::229"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738192144;
	cv=none; b=Ss2FPbph3vpokeLs+DEPKx9j/YeuPP4/Xh55wglA29OSVCwuZDYdY9RPzkUdYWc6gyydyvHA+6Q9JEDD1ILyH54QejlNgvwSEEB9ItvxjBAL/Nz4rka9ZnUi6e4yUJUvDo0MwqBMEwZ5atk4+azy6ZPIpwk0HjL5bM8izaGV2O8wo6R84aCoictsXG1veRam6i4Z8of1lOYipDHJ8P0BuS86pXT/6M0wP/uEIXxkCIOXM9u27RDVOo8DPxizTdPnVTeR+SGiebR6SPzotgSAqv99OsvPt5RzOLAmvtuVYD+4+sKx/4cd+xf8n4kD4ytwk8nXML7cRGlAm4FYg2jlvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738192144; c=relaxed/relaxed;
	bh=905aLOBpG5OnSnGM7H0fP4dZu8i9mQsgLm9R4DDucaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Molx0VEDbXo5NwxEoXtPRam2h2SPZ8TAO2NGKbnYUsVAXxhXrHlbaUdIE9+OBMcPYrBskZecg31G4vE1QJPI/G5uAoe+LIrbNHqaAuhZ7K5CXcRNYCy614HdqUTHc46mhRjQDuCS/+nAiypWRdea7gjREYjIyG7IH41qGczLoHvbsd/W2DN9VYO/S4MroRo7BesaIdqB/6HiRuN2l2Cw42YlndAc55CdtHKCEoemf1CbZQxGffb3JNngZhN1oyTQOwQxcx/J6uWvxzvUIb8yhPXCTH9+VGElVWrkOUml6DJK6ZDvV/T8Wnrgy0WDittf9pOWWS3p+yfg6thREIoy9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Uu7wguq/; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Uu7wguq/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjyWz3bqzz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 10:09:02 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3043e84c687so1160461fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 15:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738192139; x=1738796939; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=905aLOBpG5OnSnGM7H0fP4dZu8i9mQsgLm9R4DDucaw=;
        b=Uu7wguq/fZAziKYJbNn9vFV9kszzyLYTIMhp06J2p6y3IFuUk/MESsrQ/ZkNyDuvs8
         hxr39lppzqgClxPomKkmo0FDbs96ty0nI2ae+vca6iukmC3p8rIrvur1AnvxsXFCoRvt
         HsbzUku1g6ejiHCWrXsvu8LcSPUGchAIlrGdXy5hZLUByUWUBENYbH6sktGS/URIczOK
         Iz8UGzavCljitOE2M4Oz7cUZsY71h5GyISn71uyVzfOGPPlMwUDtQL1G0BpaTEyAOCs6
         o3RK6TaG5RZzoaesJA/M5Khj+NV1bp+OJ+2UiCxsglAZD9BuHuSAK+4a8kjrZHUwj7V9
         l5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738192139; x=1738796939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=905aLOBpG5OnSnGM7H0fP4dZu8i9mQsgLm9R4DDucaw=;
        b=utMAOeFnJioBazTi2mlhnCqweHBJNuOQpt2C02QNdTYKc8XEuY0C/gLzZDwOXkYtym
         HaaJkWC1AvQbF5LEAvvXW8UgWKojBznX52jBdQ6zvwlVCTfbsphUCDHNFGUwCz6MQIko
         6ITgG3TlZfCZlf7pLBLYffO6YbfAXZTjiLYtRoJKBZylX7ioF0WM4xNBwuXvRHeA2y4P
         ChbchrDalzijw7VNUvuPMdDkcmvxp+8EyYa55PoVhbcJOGykl3La5mSKclcPMR4qW+fy
         JnBjdbSHiKX/s5OB+tul2CuwtZTVtLefs2q03JHrcr1N3OESH/0PFbUbNQL0KUC7qqJp
         hD7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFZCa8OCjejglxJjvsHZS5SZBlfBVlMYdCEIjfU+SEjK2L60fhPMCOmwh5Vy7nejr/cL7ZU7xJ9kIr9vU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwVBY8/r1o9AnQtHTTt2XZCMOgb5FgkFJtmV5oP1vyHQ5Dx2Wxk
	Y69Tri3IXZWm38rjVXGAsfq/vdnezKRck+BGN1TW547jUXtHFL2GblCiEDDk6DYCLACeTbrqsqn
	HII82BzHV1uAQdKw4O0IBC9+wSv4=
X-Gm-Gg: ASbGnctnRd503MG6Vm8Exi+Hx176gbRr6X8RydTJLtrZnn3Tpv4Hv+nW7X83mpYNfWK
	v9bDdH4aVePZbzrMmwngUTTccy8qHbs5egqKcYtKuKzbH74LoJDuksjYmMMG8N00vsUTjE9Vq47
	U5+/hTGL4ty/VKaA6F6oPJDRwjv9dI7w==
X-Google-Smtp-Source: AGHT+IGw4hDomqOPsGmP6ryOmQMcXXWdZqLA8giCzG80P3G1E1mNKcM08esBXc35n67oCdPU79/hBsdXpNJs+7goWuY=
X-Received: by 2002:a05:651c:220e:b0:300:3a15:8f23 with SMTP id
 38308e7fff4ca-3079680c757mr22614121fa.7.1738192138842; Wed, 29 Jan 2025
 15:08:58 -0800 (PST)
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
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com> <Z5qzk_92KU0xoLcP@casper.infradead.org>
In-Reply-To: <Z5qzk_92KU0xoLcP@casper.infradead.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 18:08:22 -0500
X-Gm-Features: AWEUYZnWxaXWv5__MIDVh4wuy5lxhHQnPr0jMuSdSi61tZVSWMfJQozfaebSPPI
Message-ID: <CAJ-ks9ksSh-r6SmKsm7iJA6nCqvrhXZ8jtjP-YoeMNB6tF5a=g@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: Matthew Wilcox <willy@infradead.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, geert@linux-m68k.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 6:02=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Jan 29, 2025 at 05:33:06PM -0500, Tamir Duberstein wrote:
> > >  $ ./scripts/get_maintainer.pl --git lib/xarray.c
> > > Matthew Wilcox <willy@infradead.org> (supporter:XARRAY,commit_signer:=
1/3=3D33%,authored:1/3=3D33%,added_lines:19/52=3D37%,removed_lines:4/23=3D1=
7%)
> > > Andrew Morton <akpm@linux-foundation.org> (supporter:LIBRARY CODE,com=
mit_signer:3/3=3D100%)
> >
> > I'm not sure what you're asking. I used `b4 prep --auto-to-cc`. It
> > doesn't know that test_xarray.c and xarray.c have the same maintainer.
>
> You need to use your brain.  You can't just say "I used the tool".
> Tools are just tools.  Sometimes they're wrong.  My email address is
> listed as the Author: of test_xarray.c.  You should have noticed that.

The whole point of tools is to liberate stupid humans' brains like
mine from mundane tasks like working out who to email. The tool wasn't
wrong; it did exactly what you told it to do in your MAINTAINERS
entry.

> > For what it's worth the kunit invocation, while obscure, is
> > self-documenting. There's usage information that's reasonably
> > understandable embedded in the tool itself. I looked for the userspace
> > testing initially but failed to find
> > tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
> > meant to compile this.
>
> kunit is useless.  The test_xarray.c module is useless.  If you break
> xarray, the kernel won't boot far enough to load any modules.  You
> haven't thought about this AT ALL.

I don't understand what you're saying here.

> cd tools/testing/radix-tree
> make
>
> Then you can run the tests, whichever ones make sense for you to run.

Thanks.

