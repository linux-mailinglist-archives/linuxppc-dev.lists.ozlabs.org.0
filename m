Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E86520420
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 20:06:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxpyW08SKz3c7R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 04:06:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cdkkVkNw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=cdkkVkNw; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxpxw3VsPz3bYh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 04:05:55 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id b32so9778617ljf.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 11:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AN921NaxNkeCgd+/kg15uAVOqAqbEenfNO325PUsS6k=;
 b=cdkkVkNwsvU59Cj0woYu6dSdwau5E9ePg+8kIJ1M1Frwv+LedGaW6DLtMwkXpMZL2B
 r7hFwQ3ahDz+IJdG4IjbhLPOcTwEoyXCnRmAW2WdhUgxhcdRUNGXAuadJ4tWcsACiMSL
 D+ZDP9Q++d5BAfIHETxhJRtnfnDfJwFx7k8npnx59zIQ50VN28X5Urs8CGSBmjf10Azm
 KbxvSubWCFWIqArNH+Eap4Ab+N6ITHlwC+yZnZQK/CX+oo0khGclKQwTivaiOeVCWJ1F
 QPgepFDot07kcqaOrupthXZjZwE3bspAHq+AIGDvC0XPGQqrRHf5JYMmMeJ86QLYBcxh
 6SFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AN921NaxNkeCgd+/kg15uAVOqAqbEenfNO325PUsS6k=;
 b=rJVLNgdI6/Z5q7dhqUyH/rtgqujqlTGfEoTqH/m0fcgbC4G8pLWXl1UxFLUnsTTfHW
 Sf6TRf8I8+v4l7KpN2imIojBFIlDQQXrYcEEQVFIVBsDWX2mOw+PkTekLgns0X87y1/o
 BBz6GfxY2b6RT+14O6hU3RNelb2CI9JoJv0KbEImWScS40d0PJDOper0Fv+VoYQGRux8
 YQ/N+QkL9H2pz/oLb7ef9zRmlj+ckOLpJSG9vu6/4HE7QEnnur5CfT+qBEVaWidpzJgr
 7kRBSw9XwfxcUyq0gsnIqTmVy0OoDfVt6evR5vNbgMhXZfPD1Y0RkmBPX666L6w9zEHM
 NMig==
X-Gm-Message-State: AOAM5312DIw7o4+pM+zt7GO2wOuB/FGD/vb3kEclSBm5wALGA7hGmJb3
 pCKqVQTekCq0CtauJtwzAypzudlOkEpVfI18T7tjpQ==
X-Google-Smtp-Source: ABdhPJwPwqycR8l/3eeVmCel1hLEu82x6SiaXLmDlHX2zoI+YX9jdJy+XCg/b2Ed5906efBN4BZfCg1kx4JD8JBVFLI=
X-Received: by 2002:a05:651c:552:b0:250:5c23:d0f2 with SMTP id
 q18-20020a05651c055200b002505c23d0f2mr11376317ljp.239.1652119550281; Mon, 09
 May 2022 11:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-11-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-11-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 May 2022 11:05:38 -0700
Message-ID: <CAKwvOdkhcJB8Bnrt51siRefWe+ZSvHagCs2G011PzkkrD3cxQw@mail.gmail.com>
Subject: Re: [PATCH v4 10/14] kbuild: check static EXPORT_SYMBOL* by script
 instead of modpost
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> diff --git a/scripts/check-local-export b/scripts/check-local-export
> new file mode 100755
> index 000000000000..d1721fa63057
> --- /dev/null
> +++ b/scripts/check-local-export
> @@ -0,0 +1,48 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Copyright (C) 2022 Masahiro Yamada
> +
> +set -e
> +set -o pipefail
> +
> +declare -A symbol_types
> +declare -a export_symbols
> +
> +exit_code=0
> +
> +while read value type name
> +do
> +       # to avoid error for clang LTO; $name may be empty
> +       if [[ $value = -* && -z $name ]]; then
> +               continue
> +       fi
> +
> +       # The first field (value) may be empty. If so, fix it up.
> +       if [[ -z $name ]]; then
> +          name=${type}
> +          type=${value}
> +       fi

Consider adding examples of output from NM as comments where you're
handling special cases.

Aren't BOTH from LTO?  The first case is:

---------------- T strncpy

while the second is

                 U strncpy

IIUC?

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers
