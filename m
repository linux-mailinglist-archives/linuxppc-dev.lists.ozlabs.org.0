Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2A9668AB8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 05:16:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtSm50yvSz3fB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 15:16:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QW41cnyn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QW41cnyn;
	dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtSl66FJDz3c6w
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 15:15:45 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id k11so1071827qth.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 20:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wt3jnzhUF3EcxhYr3T4hnm8uRCL7X//ykE1nGacQiX8=;
        b=QW41cnynBWFCcbN2np1bR6tedxbtO3eX5SbrPn1/lU9d4aaXmlahkT2WbS3tM/if0A
         VzpLPqX9WvAnwx7NbuqRmOaO9xqYz/nx1EGX61d8Bj2VG4zI+F4YccXnLtgT3U3a9uMK
         ML5XR8tAKhK45vk0ghApza55rwDgnktIGJWc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wt3jnzhUF3EcxhYr3T4hnm8uRCL7X//ykE1nGacQiX8=;
        b=gobc83SPFo3I96Tf3mPMo4M9KyWoqyUJ+jP4v9/rcJ9HAJjG449/mv2CWZKMo2uC+H
         4ymiUwoxl2A+isipWHZq9NMGlGD+Q8wF9GNiLKEiHGfmIDGsKsmYhsvo1dCoKj5KjL5K
         sBAd/EVP3Dd+59intaL1bqJs7C44yRwXEgDiqYjTwSvVeaheOqBvazoqSg2zYFcIgboQ
         6R8AgzBFrrBQWfWht9doyz5QWXcuKmDSJzKAU1eKdjdzdi/ZeVSRsTJ7Y8hhTHTnr2Gs
         2rawhnFua2b2aGQETmQ39fq6baKr/psgHVS4ozKgc5pwCW1d7BF1RIcyX4AON12OV5P6
         WnQQ==
X-Gm-Message-State: AFqh2kpuJEwzv0/5Z/vHj1S/SW4dCnp3V/OPWMoVi4U3COisKOwHTUS8
	OBM/QwPkf0a0Y+KFdEcuPNViCBPj7d6HK7k1Ex4=
X-Google-Smtp-Source: AMrXdXtfFBxcYXxP/yVbhSLyNXvid7EPIiiFszwgKhMLSS/DcJZDY00VkB/OTuVu/niPpqTNWc/AAA==
X-Received: by 2002:a05:622a:2592:b0:3a5:ff6e:d425 with SMTP id cj18-20020a05622a259200b003a5ff6ed425mr117752610qtb.4.1673583340046;
        Thu, 12 Jan 2023 20:15:40 -0800 (PST)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id bk14-20020a05620a1a0e00b006ce580c2663sm12022327qkb.35.2023.01.12.20.15.38
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 20:15:38 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id pe2so10305896qkn.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 20:15:38 -0800 (PST)
X-Received: by 2002:a05:620a:674:b0:6ff:a7de:ce22 with SMTP id
 a20-20020a05620a067400b006ffa7dece22mr4281758qkh.72.1673583338361; Thu, 12
 Jan 2023 20:15:38 -0800 (PST)
MIME-Version: 1.0
References: <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com>
 <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com> <CPQQLU1ISBIJ.2SHU1BOMNO7TY@bobo>
In-Reply-To: <CPQQLU1ISBIJ.2SHU1BOMNO7TY@bobo>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Jan 2023 22:15:22 -0600
X-Gmail-Original-Message-ID: <CAHk-=wiRm+Z613bHt2d=N1yWJAiDiQVXkh0dN8z02yA_JS-rew@mail.gmail.com>
Message-ID: <CAHk-=wiRm+Z613bHt2d=N1yWJAiDiQVXkh0dN8z02yA_JS-rew@mail.gmail.com>
Subject: Re: lockref scalability on x86-64 vs cpu_relax
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, tony.luck@intel.com, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Jan Glauber <jan.glauber@gmail.com>, Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 12, 2023 at 9:20 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Actually what we'd really want is an arch specific implementation of
> lockref.

The problem is mainly that then you need to generate the asm versions
of all those different CMPXCHG_LOOP()  variants.

They are all fairly simple, though, and it woudln't be hard to make
the current lib/lockref.c just be the generic fallback if you don't
have an arch-specific one.

And even if you do have the arch-specific LL/SC version, you'd still
want the generic fallback for the case where a spinlock isn't a single
word any more (which happens when the spinlock debugging options are
on).

            Linus
