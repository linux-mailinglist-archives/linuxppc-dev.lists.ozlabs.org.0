Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5048A2379
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 03:55:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BccNoe/o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG0554N4Rz3dTL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 11:55:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BccNoe/o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=airlied@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG04M3WV3z3dDn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 11:54:42 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-343cfa6faf0so319959f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712886876; x=1713491676; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y4vlt8TB9yDjErxa7aoPppj34TQs7XIg9OjF7nGdMbk=;
        b=BccNoe/oZFmzzaoFOFy7MfI1MjbWirpcVi+a7cSlm7+QAjkmvCZSJuRGR+N5MstXq3
         zyJLlTEr5gjmRfPI+nMgzfH7/Ucwutx+efRPC+Fu3GG5jnFet7SudIVE+Mu7yjLwdeL/
         v4Z3Q6Q43ANtc3uCzMaDwGhwb4+cG8BB5BSIMsHxcdwFNP8127TpOXJCB8o/6C4sxX+B
         YXcCTmnC0KKKz3SkneXyPbwZU1rUUkNeMOxtEyo8aEQXxivUtt0YDq7ZIS5yWp2S+0mg
         Hw0QlmlW7nJrB6/z79mvHS0CWiOmPLUit5TRYJQoEKZeFJ2NSox7174k2NvlKa3rTjOe
         vDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712886876; x=1713491676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4vlt8TB9yDjErxa7aoPppj34TQs7XIg9OjF7nGdMbk=;
        b=RhWpg7+IqzVKrAMqjkC000BmXnKoYawFFv4BaWijNpZWQLhV3Ps3O99D+6/zk60vA1
         v4uGjdzWK5Xn7aeSt9M9HOvkINmH1QZFvbZsE7gEp+wnwFXgUXr6meCkd+rURm1zvMC4
         GOVVw1eNf60ZWk4sLf7BD2rGsh/jW1+nV6HmMQq+WgoNhOZqlj2Kfz3qbByAR4kYV+JT
         /eB07+gnW7zMexKfG6S72gnDfQt/bHkmBJaEEekaUFL2MxV33DsVXlb3wjBxLBdfrrxU
         FEKlDZvfYkOySw9wvhKXsUP1VWD+syW2caA3FFw9i7/cODXru32Q7LdXj75ktJsru0Cr
         zBHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpeq2pAi5W7SclAS40xv4J8IY0kDsRMYmqp3azumOi1pEwDG5VkyDLe4mobTddRskVS3QlR9S/GrAaF3KVr2ieLBOT7Csnp7VbiIahVQ==
X-Gm-Message-State: AOJu0YwGQ+aCt5Dps6Ghk5yk50iMDstYmAn17oA42ro/fKZNFhaIyCRc
	yp3AA7Gz4mqmoEU9nGxEKRGs01sNyHmKpQ1EueflRcyFKIu9HKLGaGhzMlQcXd1Ni0ql58IUwN2
	4jR/Z36NG3g4mBvXr6bl9iKb2qjI=
X-Google-Smtp-Source: AGHT+IH+PR4h3oVtQ8Ez0cRs6zyDvlUxECTYXxWqfVRSac34W79R5yeA3Zq4bIaDyQbovOeeCgfyqRUJHwPOnRqGQX0=
X-Received: by 2002:a5d:474f:0:b0:33e:ca28:bb59 with SMTP id
 o15-20020a5d474f000000b0033eca28bb59mr856430wrs.57.1712886876424; Thu, 11 Apr
 2024 18:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com> <87wmp4oo3y.fsf@linaro.org>
 <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com> <87wmp4ogoe.fsf@linaro.org>
 <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com> <CAMj1kXGW5XQxXrYaPhT6sCjH7s0EwqzNjWies3b8UWnUBW5Ngw@mail.gmail.com>
 <c0e170f7-5498-40ed-ba35-2ac392c2dd2a@app.fastmail.com>
In-Reply-To: <c0e170f7-5498-40ed-ba35-2ac392c2dd2a@app.fastmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 12 Apr 2024 11:54:25 +1000
Message-ID: <CAPM=9ty_9yKEk+cS6oJ8gD_UiB_K4X3P4mLv2RmKixLaq-1RfQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>, Christoph Hellwig <hch@lst.de>, amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Apr 2024 at 17:32, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Apr 11, 2024, at 09:15, Ard Biesheuvel wrote:
> > On Thu, 11 Apr 2024 at 03:11, Samuel Holland <samuel.holland@sifive.com> wrote:
> >> On 2024-04-10 8:02 PM, Thiago Jung Bauermann wrote:
> >> > Samuel Holland <samuel.holland@sifive.com> writes:
> >>
> >> >> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
> >> >> 32-bit arm until we can provide these runtime library functions.
> >> >
> >> > Does this mean that patch 2 in this series:
> >> >
> >> > [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
> >> >
> >> > will be dropped?
> >>
> >> No, because later patches in the series (3, 6) depend on the definition of
> >> CC_FLAGS_FPU from that patch. I will need to send a fixup patch unless I can
> >> find a GPL-2 compatible implementation of the runtime library functions.
> >>
> >
> > Is there really a point to doing that? Do 32-bit ARM systems even have
> > enough address space to the map the BARs of the AMD GPUs that need
> > this support?
> >
> > Given that this was not enabled before, I don't think the upshot of
> > this series should be that we enable support for something on 32-bit
> > ARM that may cause headaches down the road without any benefit.
> >
> > So I'd prefer a fixup patch that opts ARM out of this over adding
> > support code for 64-bit conversions.
>
> I have not found any dts file for a 32-bit platform with support
> for a 64-bit prefetchable BAR, and there are very few that even
> have a pcie slot (as opposed on on-board devices) you could
> plug a card into.
>
> That said, I also don't think we should encourage the use of
> floating-point code in random device drivers. There is really
> no excuse for the amdgpu driver to use floating point math
> here, and we should get AMD to fix their driver instead.

That would be nice, but it won't happen, there are many reasons for
that code to exist like it does, unless someone can write an automated
converter to fixed point and validate it produces the same results for
a long series of input values, it isn't really something that will get
"fixed".

AMD's hardware team produces the calculations, and will only look into
hardware problems in that area if the driver is using the calculations
they produce and validate.

If you've looked at the calculation complexity you'd understand this
isn't a trivial use of float-point for no reason.

Dave.
