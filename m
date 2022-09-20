Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3FC5BD953
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 03:24:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWkP51ptvz30Bp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 11:24:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qGMI9X7g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qGMI9X7g;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWkNT5bbsz2yQK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 11:24:23 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id a80so1305360pfa.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 18:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=RGkng8VK3+bE3PT+qMwPQlttI9OS/I4c3ZpsE6lKsRc=;
        b=qGMI9X7gD2tp/BlJQ2xgEl50kpo+Ekqb9jU0nUnZzi2v3qAeKSKaNufwyo4YeWwk60
         FSbOkqdqfiJfe5F2y1H4pNQ0Bh07mT0E/LuhOThzmfAJRHdG810qazM37mZ5qf/1kB+L
         b4D+AN4FLYZMOUiB0C73QBDTMzHk5rfSwK0nNFaZEL6qR5QA8Obr5awqQDnYDrS8kCDk
         qZ5iRWgiob75GxApm03vJcj7vmW2jty4XM7sEON67z5aEusIHWAvtpjhjdFREVPzGx29
         9OUdlHaj2WXLelWuZrUQZk2SEd7tJ8j1USLLp/GgeksS5w4LEgwX0sBeZ+JPg+0m93Do
         N4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=RGkng8VK3+bE3PT+qMwPQlttI9OS/I4c3ZpsE6lKsRc=;
        b=SW38HIn6ecgPImk8RZWFYxe8/J4AaBgyXgpIYEL4++ND+ddahxKqTUTWBtSpBKqAsr
         WD5175D/sX4VLqSVoFFwI8R8p+KhFc1zV8nXxjzlNFf5TTLt9Rn74qxXnpOQPhBkLp5O
         vPX+cMsvO99qPI/AXQXQ7wg3lL3nJ+BtHEFELDiSKlEDkWdOdTSzzBhKmnZW18mWA/Lu
         Kd3lrtRukAM1tgZXteLe5eRLpAIziR7wW0SYQmktfhyZj0RhYjgamO2vgjEaio/OEKuc
         +7/tg4pslpsrMkR+3ojk8lazZETPyN3zddY44cTIsTEvTkmcPYaJwAGZ6zgHIAcX1ut8
         dN2A==
X-Gm-Message-State: ACrzQf3rM9LFD71+CsbpRD7R3QVPJhRv9gHGmlX3fzR0aykP7xyuPOXK
	2AIweflbd7chRkze/do+48hadDmU5Sk=
X-Google-Smtp-Source: AMsMyM5jeukMh/qusJx667VgsrpX8cTG2huzazZ02109LvIdE6Mki/Jwoi7Bv3UJnEOwHsm4x0uwUQ==
X-Received: by 2002:a65:6a05:0:b0:42c:87a0:ea77 with SMTP id m5-20020a656a05000000b0042c87a0ea77mr17954344pgu.75.1663637060741;
        Mon, 19 Sep 2022 18:24:20 -0700 (PDT)
Received: from localhost (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902d50b00b00177f82f0789sm26954plg.198.2022.09.19.18.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 18:24:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Sep 2022 11:24:16 +1000
Message-Id: <CN0U48R2941A.35BVLALLFNHID@bobo>
Subject: Re: [PATCH 15/23] powerpc: Adopt SYSCALL_DEFINE for arch-specific
 syscall handlers
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-16-rmclure@linux.ibm.com>
In-Reply-To: <20220916053300.786330-16-rmclure@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Sep 16, 2022 at 3:32 PM AEST, Rohan McLure wrote:
> Arch-specific implementations of syscall handlers are currently used
> over generic implementations for the following reasons:
>
> 1. Semantics unique to powerpc
> 2. Compatibility syscalls require 'argument padding' to comply with
>    64-bit argument convention in ELF32 abi.
> 3. Parameter types or order is different in other architectures.
>
> These syscall handlers have been defined prior to this patch series
> without invoking the SYSCALL_DEFINE or COMPAT_SYSCALL_DEFINE macros with
> custom input and output types. We remove every such direct definition in
> favour of the aforementioned macros.
>
> Also update syscalls.tbl in order to refer to the symbol names generated
> by each of these macros. Since ppc64_personality can be called by both
> 64 bit and 32 bit binaries through compatibility, we must generate both
> both compat_sys_ and sys_ symbols for this handler.
>
> As an aside:
> A number of architectures including arm and powerpc agree on an
> alternative argument order and numbering for most of these arch-specific
> handlers. A future patch series may allow for asm/unistd.h to signal
> through its defines that a generic implementation of these syscall
> handlers with the correct calling convention be emitted, through the
> __ARCH_WANT_COMPAT_SYS_... convention.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Looks good

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> V1 -> V2: All syscall handlers wrapped by this macro.
> V2 -> V3: Move creation of do_ppc64_personality helper to prior patch.
> V3 -> V4: Fix parenthesis alignment. Don't emit sys_*** symbols.
> V4 -> V5: Use 'aside' in the asm-generic rant in commit message.
> ---
>  arch/powerpc/include/asm/syscalls.h          | 10 ++---
>  arch/powerpc/kernel/sys_ppc32.c              | 38 +++++++++++-------
>  arch/powerpc/kernel/syscalls.c               | 17 ++++++--
>  arch/powerpc/kernel/syscalls/syscall.tbl     | 22 +++++-----
>  .../arch/powerpc/entry/syscalls/syscall.tbl  | 22 +++++-----
>  5 files changed, 64 insertions(+), 45 deletions(-)
>
