Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204C29973F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 20:43:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKlcj398dzDqMk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 06:43:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g6RS9T7l; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKlZk3xQqzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 06:41:33 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id j21so3987640ota.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 12:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5UMWGuOLcjC1cO+fKd8FsBCsk5aBoRgWF22+6G/UdwY=;
 b=g6RS9T7l8auC4GFcmim2BCZTWwq9F1LIqnl14iDbBdZwkoj/h5gzNZXmVgf0FoLqEd
 FwrZnEGkTtCTcmKZ90sAuaIiafOx63Vee2FqZitIQ78vjFc3fclWAJTzMcaayjMZwc8V
 /1SAKk8o3mMqBV/XzAgC16BjRscO0uq8NGH04ACOh/lU+rR2XNBQ46HNr0E1sniN6Von
 7LYyUFnGSs5wsFNyotHzIiePtJQxrsuc0Pv3NTpoZSmzSaZKyeJk6qQ61Mqu1ddgKiGy
 n/N8e+SqOc413tsbPQGV18m6kpipCYpIVuRlSMDbmC8Z9btmQDYSImF/PGqRlhD5NdC0
 0NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=5UMWGuOLcjC1cO+fKd8FsBCsk5aBoRgWF22+6G/UdwY=;
 b=dHeofgYnS9ILN4hF8ZniDa1nBL2bu9LVzMX3cP8UylAEwZKqWG3YziFDRtvMBfbKXZ
 HpxQ+PUKb0FjVd+enCVycM+vIr7B1nMhM8AhaqRJ0MRygMO8QvjPMMzquOnhdhSC+H/a
 jQA/9ELU+mLdNOzfQR/cRYdpmMtxsXkT+YIcf2fiGPT/2L1mTKEut9r4Vfgr0bzcFGVu
 9syUx8UZoUPAbYrLAeF3Ys0E+yT0u5RQg/8rXrBADTsq9KT7lCwmU3ivZdoRd1liH4NP
 TKy9MsJco1i3mSzG7ScNkNUwMJsKYzwvjRLFX7adWoJ6JkbhlbTga+2O02XuGqjUVyD+
 Pkkw==
X-Gm-Message-State: AOAM531/aDRjLDc4wy5qB0YoNB3ZOO4kv9R4R0+XJI160ZmjRdGOfqLD
 5RY6OcZ4qXB/Igp0IHddI/w=
X-Google-Smtp-Source: ABdhPJz/D7hWcfTIhSRMpGb6Pw553ZqCSWa2i8mdG5VESpK2OySkc+7wZ92Sz2i6nGBTuJ3wWTL+6A==
X-Received: by 2002:a9d:61:: with SMTP id 88mr12036238ota.109.1603741289548;
 Mon, 26 Oct 2020 12:41:29 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id t5sm4032472otl.22.2020.10.26.12.41.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 26 Oct 2020 12:41:28 -0700 (PDT)
Date: Mon, 26 Oct 2020 12:41:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] treewide: Convert macro and uses of __section(foo) to
 __section("foo")
Message-ID: <20201026194127.GA106214@roeck-us.net>
References: <fe8abcc88cff676ead8ee48db1e993e63b0611c7.1603327264.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe8abcc88cff676ead8ee48db1e993e63b0611c7.1603327264.git.joe@perches.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 21, 2020 at 07:36:07PM -0700, Joe Perches wrote:
> Use a more generic form for __section that requires quotes to avoid
> complications with clang and gcc differences.
> 
> Remove the quote operator # from compiler_attributes.h __section macro.
> 
> Convert all unquoted __section(foo) uses to quoted __section("foo").
> Also convert __attribute__((section("foo"))) uses to __section("foo")
> even if the __attribute__ has multiple list entry forms.
> 
> Conversion done using a script:
> 
> Link: https://lore.kernel.org/lkml/75393e5ddc272dc7403de74d645e6c6e0f4e70eb.camel@perches.com/2-convert_section.pl
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@gooogle.com>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> 
make ARCH=um SUBARCH=x86_64 defconfig:

Building um:defconfig ... failed
--------------
Error log:
arch/um/kernel/skas/clone.c:24:16: error: expected declaration specifiers or '...' before string constant
   24 | void __section(".__syscall_stub")
      |                ^~~~~~~~~~~~~~~~~
make[3]: *** [arch/um/kernel/skas/clone.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [arch/um/kernel/skas] Error 2
make[2]: *** Waiting for unfinished jobs....
arch/um/os-Linux/signal.c: In function 'sig_handler_common':
arch/um/os-Linux/signal.c:51:1: warning: the frame size of 2960 bytes is larger than 1024 bytes [-Wframe-larger-than=]
   51 | }
      | ^
arch/um/os-Linux/signal.c: In function 'timer_real_alarm_handler':
arch/um/os-Linux/signal.c:95:1: warning: the frame size of 2960 bytes is larger than 1024 bytes [-Wframe-larger-than=]
   95 | }
      | ^
make[1]: *** [arch/um/kernel] Error 2
make[1]: *** Waiting for unfinished jobs....
arch/x86/um/stub_segv.c:11:16: error: expected declaration specifiers or '...' before string constant
   11 | void __section(".__syscall_stub")
      |                ^~~~~~~~~~~~~~~~~
make[2]: *** [arch/x86/um/stub_segv.o] Error 1
make[1]: *** [arch/x86/um] Error 2
make: *** [__sub-make] Error 2

As with s390, reverting this patch fixes the problem.

Guenter
