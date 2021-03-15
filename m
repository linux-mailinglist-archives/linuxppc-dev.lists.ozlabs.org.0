Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE2833B05B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 11:50:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzY9D4lfNz304N
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 21:50:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.170;
 helo=mail-vk1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzY8w1qz3z2yYm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 21:50:05 +1100 (AEDT)
Received: by mail-vk1-f170.google.com with SMTP id d2so485774vke.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 03:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cn0hjLBIKyevwPH7uud+eEnfZFG55NE7s3jjb3XGsvA=;
 b=YlxI9QQHgJ2Nv36BG9kEKBHV/LrKaqQeNZmTOI5uzlCkvnC+dVMud1dJ1HStYexjCm
 57MMoLJPlr1fA1ACDgGEpPXGifjD6Ia/gVxzOX2SbaJeKsj3Bj4KgoxQwTqWnBgfNg4W
 EQpU/MoExNID2U2yU8oJsSShVePm4nDTAnIRitmMyuGwInyKSI95tZOCRhVIIbWP0va1
 oUne+jdJh0N8BYlgoeqPpkI0IcQXG53CTOAy1SpvsD+VLweYBOBPnEbn6jvyzUno98io
 xIuAEBgMogs1rz8TDuyl1CF7DCo7lL0eCKpcRGzA5LIIkXwheuK1Y24kR7mA2PVFdMkd
 W5rA==
X-Gm-Message-State: AOAM533sEfJHjHj4b3je3a2u+k6a/i1xqFP2n/k2YGFocQLLaGbQbJEc
 YA5DTtrljDzg6ZX4OhHkgCuQ6HyObQltvZUM3RQ=
X-Google-Smtp-Source: ABdhPJz/2sDUrzcpIsQ6biizvJmEwGiuZAGWwvTIIvT7E2fQOhXFFkNTN7gCCw4ooKjDvbhBVrDcJvhyw+mnpboooBw=
X-Received: by 2002:a1f:e543:: with SMTP id c64mr3902353vkh.2.1615805397738;
 Mon, 15 Mar 2021 03:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210315104409.1598822-1-geert@linux-m68k.org>
In-Reply-To: <20210315104409.1598822-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Mar 2021 11:49:46 +0100
Message-ID: <CAMuHMdVJFprsj9njwv13jWTBELuq8RcXOmR7AoR9dqDdydLcNQ@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.12-rc3
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 15, 2021 at 11:46 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> JFYI, when comparing v5.12-rc3[1] to v5.12-rc2[3], the summaries are:
>   - build errors: +2/-2

> 2 error regressions:
>   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_248' declared with attribute error: BUILD_BUG failed:  => 320:38
>   + /kisskb/src/include/linux/compiler_types.h: error: call to '__compiletime_assert_249' declared with attribute error: BUILD_BUG failed:  => 320:38

powerpc-gcc4.9/ppc64_book3e_allmodconfig

So we traded implicit declaration errors:

  - /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:
error: implicit declaration of function 'disable_kernel_vsx'
[-Werror=implicit-function-declaration]: 674:2 =>
  - /kisskb/src/drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:
error: implicit declaration of function 'enable_kernel_vsx'
[-Werror=implicit-function-declaration]: 638:2 =>

for compile-time assertions.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
