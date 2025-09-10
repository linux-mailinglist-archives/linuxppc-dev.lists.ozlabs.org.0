Return-Path: <linuxppc-dev+bounces-11989-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168C3B517A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 15:10:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMLds57V2z3d26;
	Wed, 10 Sep 2025 23:10:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757509825;
	cv=none; b=bwxITHSvRabBRoM6bLMbZe3unBiDS8iXpaUB2RaLM6uh9venwp2QUfNModIcR7dCJu4tVvf28AyRTyiuaz8jdw9sAG1iB9jOaX8Ww5V974GcOaZvYH1NRh1gr5HuqetDbje6UBSAY9PoZvKulTklNJjb+mDQKdlITh0OEdWdNxabvU2Tn0QNlvrtVlH2vTpRYdpAaSOkz7s55AQGs/R/2pEcW/92oV0tn2b6OdztuJNtdVS7M9yAeTvC69VGjpWvvZEfV1sPaxLk50Xcil7oylwWXM8WdwGs3YCFS2NJ2kIE8oZsaTXFPdrnOGNaPHhhc1G6/2wp5r0P6oJc7n1fnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757509825; c=relaxed/relaxed;
	bh=1LsnFE1xI0qQhVi+l6O9JAbITiONruUrWb3tpAPA1P4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JU3Nf6ilyFjPqJXpUp+1WCZ83LHpRwR3cOMN7mcxPt+6LeE9a+xsjdHACQsBBS8WTtyQbb7Chq53UW921K0/VpPUpq1Xp3ZLpbGcip6C81wpu8S6Nkwc8WW+4Tgz1SeEe+mrESRYvqr4mbAMQNZE8DHHL2TqfhUQS1tVzWiSRXioZip/kHUBsO1wCXCcvtKZfY7QfH91pd7ClLCBLPWWMdltYnXW7GZmLCAsXn/GKK/s9CkhRKVw55lKakxluSQgIje7B//5RsURAirftUxkPdRi3o7Cxn3RMTK+HoRo0QVQANWBgARXyVqadffEhiep5mJr1JbPkK6w4Yx/wiZZFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KJsWKbdO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KJsWKbdO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMLdr2GnXz2yx8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 23:10:23 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-55f7c0fb972so7434825e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 06:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757509819; x=1758114619; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LsnFE1xI0qQhVi+l6O9JAbITiONruUrWb3tpAPA1P4=;
        b=KJsWKbdOj5h+vqM8pZIEaTQHtPbQ2913DN1zwuEVfhtZ0Km4tk5n7DOX7mvt6qNfNd
         D5FEdqm17vm1A3TWXar8IvmqDGLLv1x8dgR2oNGRzkiN7x3WynYhIqU+T09pVo57C9Z6
         6ho9KQfW9ohsYqH8ka42O1/b7Vj4Tjqu8C4ul3qXvMkcgsdV0NEefzhGCYvQUBLZTlX5
         TRjTG910g5qA3kqZ2A7s95KqwKdPC9zmRUTDTTX4AImbuciKa3iIE/7JOhBTYKg/3Wmj
         87AWGIseQFuF6hLU3f8c3RtZQAV5Z5X1tXOOdxMDXuO+ETM3ce54RvIPckXhPC11+laD
         BjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509819; x=1758114619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LsnFE1xI0qQhVi+l6O9JAbITiONruUrWb3tpAPA1P4=;
        b=dlaQsFKFHBB8RsoDgkfJztCHULZ0ww0f021vNmUgTpqT2nQhP6jAJs0ME0HbpRHiFu
         08HXdyQvM71r9bYk4Nk+4orTT4GHvISoV3/FgBK5w0rswE+yCcRUmcCOXUAMVF/G4Fsp
         a4yGTWRqQ+vOuTWNKw4nnIkTAmC4FuNsE/2YoPriXh8lH4XK+lDpGMnJRrRhzjFs5sEs
         fc5x01DU0Ygc94bbyKcT4pOqd2GCCfL7umr/oBbF9f3W6U4IBUhqSb8LuDe/7wC0A7Yi
         E7387bSoR/kCtDahG6Jelk13A17ZVE7+Wdbn6h4CaM3Y8sYJB/3cASOwdkRdor5Nz7yF
         ldew==
X-Forwarded-Encrypted: i=1; AJvYcCUGxjUdLAfbzQmu/0CWrlrNPj+wCgFZmL//yGULUasqc8rNO00yGJr7CxFbv1YTc83nuV34uaNkBYZ/UAg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyCEI1RbNmqbtjn0dLipsfjLNNH+Uz73dGe4EtG1xc1hy/CPC0q
	YgmusOx2niFrMstWExl3/j854Qk6Lrk89TKBJLAuzonmvob0uFQZxA/j4/OIDA6w5QkyrOMmne6
	/2lNqx1/Zyxa4OMRvuUSB/XP/TwhhIu4f/WTnXt40GQ==
X-Gm-Gg: ASbGncvuQiOBbU0zo+3ighTF3EGQH7oQTRPgtShLtXTfh7T0r9O5ljXLhCQy5q82M+7
	BPXCWh7meFrRw2zBCxwTX9GWyXz512kGTUI5027nyUnzjOQv93aONStuywKVKxCi3YuM8AOUtx/
	Ip4P6SEUvBvVpSzw0b6oZ0Dc/OkKIUBNQt6kVmbg0vaPJeAN0B6IvakW+02iKULCjm6unVLK/tT
	nJYPSk=
X-Google-Smtp-Source: AGHT+IGgInBj1Ic/f5mZf9DHaSimxT6oABg1gWpLpcYCM/ousRHHwwGjp7S7ZCbmXiMiFXeqAGANnBbsml0uYfwnmj8=
X-Received: by 2002:a05:6512:39cc:b0:55f:47a9:7d33 with SMTP id
 2adb3069b0e04-5626425ccd6mr5952206e87.44.1757509818943; Wed, 10 Sep 2025
 06:10:18 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 15:10:05 +0200
X-Gm-Features: Ac12FXx4fqtngzlb3aPI-q1c6xVbomqK3jaNECwBf_yyF7AQZ2ofNJeHmlxFUVw
Message-ID: <CACRpkdb=E-_6fZ+4mX5FJas9C5Njp3Gwrygs-cAfWNdbP594cw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 9, 2025 at 11:24=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:

> - ARMv7 machines with 4GB and more exist and keep getting
>   kernel upgrades, but to my knowledge are not in production any
>   more. These are mainly 2010-2015 era chips based on rare
>   out-of-order cores like A15, A17 or PJ4 that were designed for
>   low-end servers, chromebooks and network equipment but replaced
>   with 64-bit chips shortly after. We had planned to bring a
>   CONFIG_VMSPLIT_4G_4G option to ARMv7VE to keep supporting the full
>   memory at a performance penalty, but currently have no plan to
>   finish this (volunteers welcome).

I'll fill in on the details on that, because I tried, to the best of my
ability to prototype this but I failed, so far.

Here is what I managed to do:

1. Building on another rough prototype by Afzal Mohammed, I managed
to compile the ARM32 kernel into the VMALLOC area, this works
fine and here are the patches:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git=
/log/?h=3Dkernel-in-vmalloc-v6.10-rc1

This is is done so that we can unmap *most* of the kernel
memory but *keep* the VMALLOC area, so that e.g. exceptions
can still execute and save to stack when they occur, and we can
call into the kernel to execute said exceptions.

This in practice means the area 0xf1000000-0xffffffff
which also includes the high exception vectors that must for
natural reasons also be kept in the mapping.
What we have mapped today (all of the time) is
0xc0000000-0xffffffff.

A minimal 256 MB mapping from 0xf0000000-0xffffffff
should be able to cover this.

So when we are talking about a 4G/4G split we are talking
about (4G-256MB)/(4GB-256MB) split to be exact,
we would keep the bottom 256 MB.

2. On top of this I tried to decouple kernelspace and userspace
allocations, in essence making anything outside vmalloc invisible to
userspace by unmapping it using the fact that ARM32 (LPAE) has
two separate translation table base registers: one for kernelspace
and one for userspace.

Step 2 makes sense because we know the reverse can work:
PAN (privileged access never) makes userspace memory
inaccessible from kernelspace unless explicitly requested and
that works fine already, and we implemented it for LPAE
with similar trickery, see commit 7af5b901e847.

It's harder than it looks though and I never got it to fly, but
maybe I will try again. My patches is a mess but I am a bit
smarter now due to reoccurring MM-related work.

Yours,
Linus Walleij

