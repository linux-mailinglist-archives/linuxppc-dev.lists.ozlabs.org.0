Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD11376D59C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 19:38:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FdGjw6HX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGK355D68z3cMZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 03:38:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FdGjw6HX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGK296btkz2yh3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 03:38:08 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99bcd6c0282so13205566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Aug 2023 10:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690997882; x=1691602682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WyQdxgtNMG4RTFo6glKNGilpjeAOgHu/v44MBJ5lr6g=;
        b=FdGjw6HXHhZ6+Vw2hxfQAMrStQiiadvB/SsztWB+Hfj84Tz9a8e6TDptPNV8ihiSnl
         yZIQWFAs0/daQGqP59TJy+VoE7dMwfj3h/DxzVCR8pbqJY9pllhuUbq/kjebn38H5GAv
         zuFWmAEuAcogVpDQ4n1F3tMwwoQYRfOQzigX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690997882; x=1691602682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyQdxgtNMG4RTFo6glKNGilpjeAOgHu/v44MBJ5lr6g=;
        b=HEwpHEYmtriFw8wPNoTpNZkEvC8cRMJB7WBPdkSlj3qZrSVLeXidEw7LiwAKC2oN1R
         iMZCSU8zvLolKsYzLKsAZm9d00BZMNrSK6MOfd8rZbWzQoiZsXL7lo8a7wCcMtnpC2gv
         WkUcr4cMUKjsVGSdBvsqDCeg2zjRYObMJ10tMQtHS/MujiFxtQRCMfQDEzrMDXp3isU+
         FvdkzhyxutMKu/kBIiRd9qyLldDGZ6HLwJD1aiV1t3eziJKTn8o8gUnzFC9DOM/wiz/R
         zk3PK1odsl5A+vAWJFFdL/Osw54TLYv3+qJ3TJdJFCHElezjHCK23OdPw0iO0VkMmj74
         Haog==
X-Gm-Message-State: ABy/qLZiIw/KzOkZUoXOS66uOhCrlJ7ecW2B1CsNtHOFnbHTTrIuBHYK
	zTrZLyNIE9qCbINF/RxG2mFukUsnRsobNg9qBhF3/djE
X-Google-Smtp-Source: APBJJlEbJfX48jBvstVzCHZMGbBBZfqtdiYoeKp5JMgHLN57w55oIFOw2qhUB2pVasGaqTJfmkK6Lw==
X-Received: by 2002:a17:907:2cd4:b0:994:54ff:10f6 with SMTP id hg20-20020a1709072cd400b0099454ff10f6mr5369037ejc.30.1690997882177;
        Wed, 02 Aug 2023 10:38:02 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id q24-20020a17090622d800b0098d2f703408sm9318931eja.118.2023.08.02.10.38.01
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 10:38:01 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-317744867a6so57928f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Aug 2023 10:38:01 -0700 (PDT)
X-Received: by 2002:a5d:608c:0:b0:315:9021:6dc3 with SMTP id
 w12-20020a5d608c000000b0031590216dc3mr4961506wrt.27.1690997880674; Wed, 02
 Aug 2023 10:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230801-bitwise-v1-1-799bec468dc4@google.com>
 <CAHk-=wgkC80Ey0Wyi3zHYexUmteeDL3hvZrp=EpMrDccRGmMwA@mail.gmail.com> <20230802161553.GA2108867@dev-arch.thelio-3990X>
In-Reply-To: <20230802161553.GA2108867@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Aug 2023 10:37:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjmWjd+xe88cf14hFGkSK7fYJBSixK8Ym0DLYCa+dTxtg@mail.gmail.com>
Message-ID: <CAHk-=wjmWjd+xe88cf14hFGkSK7fYJBSixK8Ym0DLYCa+dTxtg@mail.gmail.com>
Subject: Re: [PATCH] word-at-a-time: use the same return type for has_zero
 regardless of endianness
To: Nathan Chancellor <nathan@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Aug 2023 at 09:16, Nathan Chancellor <nathan@kernel.org> wrote:
>
> We see this warning with ARCH=arm64 defconfig + CONFIG_CPU_BIG_ENDIAN=y.

Oh Christ. I didn't even realize that arm64 allowed a BE config.

The config option goes back to 2013 - are there actually BE user space
implementations around?

People, why do we do that? That's positively crazy. BE is dead and
should be relegated to legacy platforms. There are no advantages to
being different just for the sake of being different - any "security
by obscurity" argument would be far outweighed by the inconvenience to
actual users.

Yes, yes, I know the aarch64 architecture technically allows BE
implementations - and apparently you can even do it by exception
level, which I had to look up. But do any actually exist?

Does the kernel even work right in BE mode? It's really easy to miss
some endianness check when all the actual hardware and use is LE, and
when (for example) instruction encoding and IO is then always LE
anyway.

> With both clang 18.0.0 (tip of tree) and GCC 13.1.0, I don't see any
> actual code generation changes in fs/namei.o with this configuration.

Ok, since the main legacy platform confirmed that, I'll just apply
that patch directly.

I'll also do the powerpc version that Arnd pointed to at the same
time, since it seems silly to pick these off one at a time. It too
should just be 'unsigned long', so that the two values can be bitwise
or'ed together without any questions.

              Linus
