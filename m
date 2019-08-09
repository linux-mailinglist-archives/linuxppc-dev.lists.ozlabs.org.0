Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E412088273
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 20:30:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464v1K0b2bzDr7G
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Aug 2019 04:30:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.194; helo=mail-qk1-f194.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464tzV0zzKzDr7C
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 04:28:37 +1000 (AEST)
Received: by mail-qk1-f194.google.com with SMTP id s145so72396877qke.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Aug 2019 11:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=meYZAOaqZ5KaoPmXpKdQX8BQbEOPXVSFqQOk/Zs8rsA=;
 b=lq0BRhHrq2sq/C6h8qg4/SUURmv0rWHydx6v/8Pb40KMokLJXsYtot2gYqhTN0y+rr
 kOCM1x7CabTKgNQ3uYKSYkk6YEoqabWYstiWU6coMx/p/5wxRZzG9jAOPEnP64aQ8wM+
 E4OGOdmxoR1Dc66to5m/qvzWzc3S+tLIXv0kmrYGX+tBeVWI8UZXgLpDUFwq+sm0sTza
 2yA/sfPbT4mzbGKImmzD9aRQp8VFy7xHp9VOhSn7ZI8y1bktlBxyLX1lIpurnbc3TCUj
 ZnbwQk4CvFaw/d6dcQKnqRzVuFPXPdXVrMcfh9NJeTxArmPvQVpNk/eyBT1q1pXl82kU
 F8yg==
X-Gm-Message-State: APjAAAX9pKOMFC/ahbP413LcEPYXjBLI2vLsMNFFbniyWprZaR0GgL0X
 ZIgyU3d6gPBIgD4NDbU0Annv9PpUn7jZvBnx8ns=
X-Google-Smtp-Source: APXvYqzLxdQHC0gUKiwVO2NJAHpHdYXdIWcXVTsS7VCUpP4IfTQCbdx5V1hKHFH1R7BU89gajb/sE4UT39NYqjWxAtw=
X-Received: by 2002:a37:4ac3:: with SMTP id
 x186mr18866428qka.138.1565375314918; 
 Fri, 09 Aug 2019 11:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <87h873zs88.fsf@concordia.ellerman.id.au>
 <20190809182106.62130-1-ndesaulniers@google.com>
In-Reply-To: <20190809182106.62130-1-ndesaulniers@google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 9 Aug 2019 20:28:19 +0200
Message-ID: <CAK8P3a3LynWTbpV8=VPm2TqgNM2MnoEyCPJd0PL2D+tcZqJgHg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: fix inline asm constraints for dcbz
To: Nick Desaulniers <ndesaulniers@google.com>
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
Cc: kbuild test robot <lkp@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 9, 2019 at 8:21 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:

>  static inline void dcbz(void *addr)
>  {
> -       __asm__ __volatile__ ("dcbz %y0" : : "Z"(*(u8 *)addr) : "memory");
> +       __asm__ __volatile__ ("dcbz %y0" : "=Z"(*(u8 *)addr) :: "memory");
>  }
>
>  static inline void dcbi(void *addr)
>  {
> -       __asm__ __volatile__ ("dcbi %y0" : : "Z"(*(u8 *)addr) : "memory");
> +       __asm__ __volatile__ ("dcbi %y0" : "=Z"(*(u8 *)addr) :: "memory");
>  }

I think the result of the discussion was that an output argument only kind-of
makes sense for dcbz, but for the others it's really an input, and clang is
wrong in the way it handles the "Z" constraint by making a copy, which it
doesn't do for "m".

I'm not sure whether it's correct to use "m" instead of "Z" here, which
would be a better workaround if that works. More importantly though,
clang really needs to be fixed to handle "Z" correctly.

        Arnd
