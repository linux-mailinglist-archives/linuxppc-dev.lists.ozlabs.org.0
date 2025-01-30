Return-Path: <linuxppc-dev+bounces-5706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28012A2297D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 09:21:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkBnS5C4Dz2ynf;
	Thu, 30 Jan 2025 19:21:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738225292;
	cv=none; b=P/P6QOQhlOFe7fOI94K4zIfbeaSU3lJ0FMNslUwKFq/1zmXvWdAMYQtVP1+2WM0MvSPcZ014xTz/moFTrlgYetdPMzThFDmfFiZzt7YQ3pbVjo0uNPIqCajXP/pf6GosilW9jBi2JFiUDdSsBxp7WwA6T8M4Cj7rB8kkpkMrqZ5bHocF8vogmAYUPH/BvaI4pzw+r8hQ055MFJcyf6eBtbIYpBTdYBwpfW5yNTJ7Hi15mPfTHmlCxojCciEUzmjZXVnM8TZRDCTYnto91iroH4k680pyjom+hdG3a3J73nQQDc2BB5glNx2V8F3HAuiMNBWDYV8zIfvlAqGk78OfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738225292; c=relaxed/relaxed;
	bh=GaD/E6PXTaDQ2QuYo/3qqTDpp2nzD7hhPFRo29uLk0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKoIsJpgb8GvVLDShUjuWrI7MSB2HcsWmLHY85ls5FRWWH5euS8O8R8yXHMZZGV2jest/dQN1lye2YSRTstx1Fw7NX0nKtul0hcpB+v4ZGBxMbl1ZtJAPnN/iiMVlbfIBWDVRs8CGLQIQWnDBZo+z/2DGCiY7puWQODHbW/SolSPLE3KuGVvEpnp2o3R+kPGcX+xbg+jT1iNb80ARzRNHLe/LUB7IUuDzr3dTA8XjyhIvAqCOW8ZcQAqVOB8REjLfJfbOOOzFpuaub8R2wzIjCPBH2PNoYTYpIfgT7VF+irnqRcQJB4t8YW55YVbWKTttMHJseJSb2xCn8phkxLPUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.182; helo=mail-vk1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.182; helo=mail-vk1-f182.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkBnR1kqxz2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 19:21:30 +1100 (AEDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-518ae5060d4so168249e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 00:21:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738225285; x=1738830085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaD/E6PXTaDQ2QuYo/3qqTDpp2nzD7hhPFRo29uLk0A=;
        b=xLSMFxaC7Ps7zANlniEv728BBkfFIy53OqkE/vA1N26Ax2NLKsw/hqvSSOLuYOKgbD
         alKXTNTEBzoFQl6BzlVp4SenHwY7wr+WJ5QnRU5/pKlq9wKb/3TBRWte8WATZw3uzRbu
         2vkkSs0IbVRnxntn9cBEcU/nPcNAkeGb3LXnnJ7+StHu/JRMFoBs3fuz2CFrTA+MG0BI
         eubHU7LWA7z2Tl57V/z8ardsX8gMiX3mQQUHm3a9MJyys24F6WMk5muNL6WAagkJj1qW
         Q9H46Dv0S77O3PZVReRJUTqLCioOteqy64GOTUxnwtWYHSAq10rtqqax5Yz5g2DqgLD0
         YThg==
X-Forwarded-Encrypted: i=1; AJvYcCVs88N6Qx14kcGreUEzzi46gITQ4sO8nS5PAvuz7X/L92Pd11J/MrVHhpotrj+jymrhVAmfFrr9Kqewffg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwWHknUwflL8NMm2YMgFWqgf5lRLSdlH2tx4Nwb+/CWN3na6p5o
	IIHTMzZBGyIqEwQZL5fV97fIcE34LCQ09+t5ZCDZyVo5m3wZ3nYtzcO9HtO7
X-Gm-Gg: ASbGnct2HygqfrkN6uplRo/A9ljaCk6ytuNEmCtVpgi44dPP8mdwBXnn5ICUY65sh1h
	TB+tzjDlpYb5ZdIz4bah2b4vLZDwD14WXkgc0vRRzEmORXtUAfajuUOy5SkafNzkFoFS/Sizi6t
	L1luvhbPJVHNyNynkNMcOii5z/NeLIwljjSqi9IXTwdQuQNEIA6TZSA9ew667gdrbjdv4m9jDPZ
	l5iLvtfZiI64uycdqSOUTmd1RRSE1s8tVP5Qv5hReGsKucEpd7U9i7+mXfsXGp+62CX71qGY+bZ
	co9vEyVRLaROrvIO+eClUF6cTqoYNqc2ls7lxFv0LbRxtwS6nz2GEw==
X-Google-Smtp-Source: AGHT+IGWseB5oFGlQ7uqPfwUixIlM4uPYaBfkhFU/a31exqPoPFngmLBiOIKtHR0oPL5W4TW/KwwZg==
X-Received: by 2002:a05:6102:2c0f:b0:4b9:c326:f998 with SMTP id ada2fe7eead31-4b9c327004fmr2054137.24.1738225285146;
        Thu, 30 Jan 2025 00:21:25 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baadd192sm156719137.16.2025.01.30.00.21.24
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 00:21:24 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85b92397fe2so126524241.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 00:21:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUwzWcKnnYEnm/mKA6OT0eTbEAz1y7u5PXWjWsBRmOMT/r82OOx0QIJMYghMNF/fhSJEJQ1F9RqpoIyrZo=@lists.ozlabs.org
X-Received: by 2002:a05:6102:a52:b0:4b2:7996:6ba4 with SMTP id
 ada2fe7eead31-4b9a5266e7amr5391829137.25.1738225284361; Thu, 30 Jan 2025
 00:21:24 -0800 (PST)
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
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 09:21:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
X-Gm-Features: AWEUYZniYx50uUBB4BKLzCpQ-mS0oONl2y__yoxAs6c6zYEzharbM-CAzfEZmbQ
Message-ID: <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Liam,

On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> I've never used the kunit testing of xarray and have used the userspace
> testing instead, so I can't speak to the obscure invocation as both
> commands seem insanely long and obscure to me.

The long and obscure command line is a red herring: a simple
"modprobe test_xarray" is all it takes...

> You should look at the userspace testing (that this broke) as it has
> been really useful in certain scenarios.

BTW, how do I even build tools/testing/radix-tree?
"make tools/help" doesn't show the radix-tree test.
"make tools/all" doesn't seem to try to build it.
Same for "make kselftest-all".
When trying the above, and ignoring failures due to missing packages
on my host:
  - there are several weird build errors,
  - this doesn't play well with O=,
  - lots of scary warnings when building for 32-bit,
  - ...

At least the kunit tests build (and run[1] ;-) most of the time...

[1] test_xarray started failing on m68k recently
    https://lore.kernel.org/all/CAMuHMdU_bfadUO=0OZ=AoQ9EAmQPA4wsLCBqohXR+QCeCKRn4A@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

