Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F3720A30E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 18:35:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49t5Gw1wWgzDqxG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 02:35:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=e9HsILcR; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49t5CD4Rz3zDqwN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 02:32:23 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id h22so3479363pjf.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 09:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d+K5u9P3ZstJbh0afCn3t6yP6SQdou+jClfehHgXvl0=;
 b=e9HsILcRH/pogv3ijUVs+4/J/zhRS+a9VPMnmgkqWLI/Wu+FCS7PTwh5XhntUipUaZ
 muZUSvBlz8dSrHWLaOfujK6bPtWafyVrJrYxCM+8aIqsvZMDHI4diUYrrDb5i8alZCZv
 FGSLp58yBCU8OXO+v0yG+cNH7ms+B6+uw/PkylgoreBkytLJlPBRhTMD2hPnOaaT3ysC
 RTHlZYauCqEXG4Xu1y7CSuugLAx/j0aOeMMyiFhjvtB1xaC7BmjmSMEDEfp63D5/gfyP
 idDddczzLeppEbtrkDgp3NRlTH+ZJFsMhpHwzwzlM2Mlvye8SnIf9DDcPZHa0GrBXwhV
 fcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d+K5u9P3ZstJbh0afCn3t6yP6SQdou+jClfehHgXvl0=;
 b=OhtiNbdikoAlGmqdq/tJ1rB7VkOU7XQkFiQ1EelSxZqqWDdRYMSm+JaxnsTEPKRIGZ
 nuc0kcQrzi4uUV7gceT9FwlSN5WSWhbis/Kwhmy62DdyJa1mbDijaZESX6na1j7vhD1F
 C3b4QKL6KIfhYsB22yaSjE6kqvdgNbelkEKWFg3YEkbNOd1wgYXruAzja3C9lCYnC80v
 1lEms9aY0pu3+r7KFcxUjkFlIFdwTlv34mAcWQNOK7BrnqNYQ2WHAFi9G1herrvbYklV
 qsivcuLdXRAV7ZDExCQXIcwLXQhqG+9zgtLgzPJNx259jhdzYURu468iOkfEDzGFSlFt
 uPEA==
X-Gm-Message-State: AOAM531Uv0331LEGGqiV8pas8fyiWs3kmGS1HjP2ox10pzYLe/YzZbai
 kFPWiilAQsnAYto0xs/frS7Ca6+d2/Ho5fyadJJtWw==
X-Google-Smtp-Source: ABdhPJytwmdVQWB9BByogkA6BvCJzw6QJUuG4tFembUiKOQGqpiuUYMBGeeEJXdh18HpVLsrJpSQy4yk5BXZNon+nw0=
X-Received: by 2002:a17:902:b698:: with SMTP id
 c24mr32946349pls.223.1593102739486; 
 Thu, 25 Jun 2020 09:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200624035920.835571-1-natechancellor@gmail.com>
 <1bbb6956-d9de-e0c8-5b45-20b6fecc2189@infradead.org>
In-Reply-To: <1bbb6956-d9de-e0c8-5b45-20b6fecc2189@infradead.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 25 Jun 2020 09:32:07 -0700
Message-ID: <CAKwvOd=5nE6fkwp8iw0JqwQFp5KcUaC7RyEf2L6+tkbp9smsvg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: Use address-of operator on section symbols
To: Geoff Levand <geoff@infradead.org>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 24, 2020 at 6:19 PM Geoff Levand <geoff@infradead.org> wrote:
>
> Hi Nathan,
>
> On 6/23/20 8:59 PM, Nathan Chancellor wrote:
> > These are not true arrays, they are linker defined symbols, which are
> > just addresses.  Using the address of operator silences the warning
> > and does not change the resulting assembly with either clang/ld.lld
> > or gcc/ld (tested with diff + objdump -Dr).
>
> Thanks for your patch.  I tested this patch applied to v5.8-rc2 on a
> PS3 and it seems OK.

PS3?  Folks still have ones that can boot Linux?  Those ****ers took
my Yellow Dog Linux away from me; I enjoyed depositing that settlement
check!  Hopefully by now, folks have figured out how to roll back the
system firmware?

>
> Tested-by: Geoff Levand <geoff@infradead.org>
>
>
> --

-- 
Thanks,
~Nick Desaulniers
